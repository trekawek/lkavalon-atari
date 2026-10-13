#!/usr/bin/env python3
"""Check disk provenance and replay equivalence of AD2044's SAP extraction.

Run directly, or with unittest discovery. Only the original-6502 trace test
needs py65; the extraction and corruption tests run with the standard library.
The tests create no disk images or audio files.
"""

import importlib.util
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "util"))
from reference_media import read_reference
import unittest

SPEC = importlib.util.spec_from_file_location(
    "ad2044_music_sap", Path(__file__).with_name("music_sap.py")
)
music = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(music)
ROOT = Path(__file__).resolve().parents[1]

try:
    from py65.devices.mpu6502 import MPU
except ModuleNotFoundError:
    MPU = None


def parse_sap(raw):
    """Independent minimal reader for the emitted TYPE B/XEX container."""
    boundary = raw.index(b"\xff\xff")
    lines = raw[:boundary].decode("ascii").splitlines()
    if lines[0] != "SAP":
        raise ValueError("Missing SAP signature")
    header = dict(line.split(" ", 1) for line in lines[1:])
    segments = {}
    occupied = set()
    cursor = boundary + 2
    while cursor < len(raw):
        if cursor + 4 > len(raw):
            raise ValueError("Truncated XEX segment header")
        address = int.from_bytes(raw[cursor : cursor + 2], "little")
        end = int.from_bytes(raw[cursor + 2 : cursor + 4], "little") + 1
        cursor += 4
        length = end - address
        if length <= 0 or cursor + length > len(raw):
            raise ValueError("Invalid XEX segment extent")
        if occupied.intersection(range(address, end)):
            raise ValueError("Overlapping XEX segments")
        occupied.update(range(address, end))
        segments[address] = raw[cursor : cursor + length]
        cursor += length
    return header, segments


class PokeyMemory(list):
    """Capture ordered hardware writes, not just register snapshots."""

    def __init__(self, data):
        super().__init__(data)
        self.pokey_writes = []

    def __setitem__(self, address, value):
        if isinstance(address, int) and 0xD200 <= address <= 0xD20F:
            self.pokey_writes.append((address, value))
        return super().__setitem__(address, value)


def call(cpu, address, accumulator=0):
    """Call a 6502 routine with a bounded instruction budget and RTS sentinel."""
    cpu.a = accumulator
    cpu.sp = 0xFF
    cpu.stPushWord(0x3FFF)
    cpu.pc = address
    for _ in range(200_000):
        cpu.step()
        if cpu.pc == 0x4000:
            return
    raise AssertionError(f"6502 routine did not return; PC=${cpu.pc:04X}")


class MusicExtractionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.atr = read_reference(ROOT / "reference/ad2044-side1.atr")
        cls.files, cls.metadata = music.extract(cls.atr)

    def test_raw_bank_is_exact_disk_slice_and_input_is_unchanged(self):
        disk = bytearray(self.atr)
        files, metadata = music.extract(disk)
        self.assertEqual(disk, self.atr)
        self.assertEqual(files["sound-bank.bin"], self.atr[0x4F90:0x5DBF])
        self.assertEqual(len(files["sound-bank.bin"]), 3631)
        self.assertEqual(
            (metadata["file_start"], metadata["file_end_exclusive"]), (0x4F90, 0x5DBF)
        )
        self.assertEqual(
            (metadata["load_address"], metadata["end_address_exclusive"]),
            (0x5E00, 0x6C2F),
        )

    def test_each_sap_changes_only_the_os_vbi_jump_in_original_bank(self):
        bank = self.files["sound-bank.bin"]
        for name in ("title.sap", "game-over.sap", "sound-effects.sap"):
            with self.subTest(file=name):
                header, segments = parse_sap(self.files[name])
                self.assertEqual(header["TYPE"], "B")
                self.assertEqual(int(header["INIT"], 16), 0x5000)
                self.assertEqual(int(header["PLAYER"], 16), 0x5F6F)
                self.assertEqual(set(segments), {0x5000, 0x5E00})
                emitted = segments[0x5E00]
                self.assertEqual(len(emitted), len(bank))
                changed = [
                    0x5E00 + i for i, (a, b) in enumerate(zip(bank, emitted)) if a != b
                ]
                self.assertEqual(changed, [0x62E1])
                self.assertEqual(bank[0x4E1:0x4E4], bytes.fromhex("4C8AC2"))
                self.assertEqual(emitted[0x4E1:0x4E4], bytes.fromhex("608AC2"))

    def test_music_and_effect_selectors_cover_original_command_dispatch(self):
        # Independently read the command bytes following each stream's $21,0
        # comparison opcode, rather than trusting the helper's COMMANDS tuple.
        original_commands = list(self.atr[0x5837:0x58A1:5])
        self.assertEqual(len(original_commands), 22)
        selections = {
            "title.sap": [0x50],
            "game-over.sap": [0x19],
            "sound-effects.sap": [
                c for c in original_commands if c not in (0x50, 0x19)
            ],
        }
        combined = []
        for name, commands in selections.items():
            with self.subTest(file=name):
                header, segments = parse_sap(self.files[name])
                self.assertEqual(int(header.get("SONGS", "1")), len(commands))
                self.assertEqual(segments[0x5000][0x20:], bytes(commands))
                combined.extend(commands)
        self.assertCountEqual(combined, original_commands)
        self.assertEqual(
            self.metadata["sound_effects"]["subsong_commands"],
            selections["sound-effects.sap"],
        )

    def test_credit_metadata_points_to_original_intro_bytes(self):
        for key in ("credit_evidence", "year_evidence"):
            evidence = self.metadata[key]
            raw = evidence["raw_ascii"].encode("ascii")
            start = evidence["atr_offset"]
            self.assertEqual(self.atr[start : start + len(raw)], raw)
        music_label = self.metadata["credit_evidence"]["preceding_music_label_offset"]
        self.assertEqual(self.atr[music_label : music_label + 6], b"MUZYKA")

    def test_invalid_atr_headers_and_lengths_are_rejected(self):
        invalid = [b"", self.atr[:-1], self.atr + b"\x00"]
        for offset in (0, 1, 2, 3, 4, 5):
            disk = bytearray(self.atr)
            disk[offset] ^= 1
            invalid.append(disk)
        for index, disk in enumerate(invalid):
            with self.subTest(case=index), self.assertRaises(ValueError):
                music.extract(disk)

    def test_mutated_entry_points_and_attribution_are_rejected(self):
        offsets = [
            0x5E09 - 0x0E70,
            0x5F6F - 0x0E70,
            0x62E1 - 0x0E70,
            0x6713 - 0x0E70,
            0x9B3C,
            0x9A31,
        ]
        for offset in offsets:
            disk = bytearray(self.atr)
            disk[offset] ^= 1
            with self.subTest(offset=f"${offset:04X}"), self.assertRaises(ValueError):
                music.extract(disk)

    def test_mutated_dispatch_targets_are_rejected(self):
        for index in range(22):
            offset = 0x66A8 - 0x0E70 + index * 5
            disk = bytearray(self.atr)
            disk[offset] ^= 1
            with self.subTest(command_index=index), self.assertRaises(ValueError):
                music.extract(disk)

    def test_uninterpreted_bank_bytes_are_extracted_without_normalization(self):
        # This padding is part of the containing Forth variable, even though
        # it is not interpreted as music. Extraction must preserve its bytes.
        disk = bytearray(self.atr)
        disk[0x5DBE] = 0xA5
        files, _ = music.extract(disk)
        self.assertEqual(files["sound-bank.bin"][-1], 0xA5)
        for name, raw in files.items():
            if name.endswith(".sap"):
                _, segments = parse_sap(raw)
                self.assertEqual(segments[0x5E00][-1], 0xA5)

    @unittest.skipUnless(MPU is not None, "py65 is required for original-6502 replay")
    def test_all_commands_match_original_ordered_pokey_writes(self):
        cases = [("title.sap", 0, 0x50), ("game-over.sap", 0, 0x19)]
        cases += [
            ("sound-effects.sap", i, command)
            for i, command in enumerate(
                self.metadata["sound_effects"]["subsong_commands"]
            )
        ]
        for filename, song, command in cases:
            with self.subTest(file=filename, subsong=song, command=f"${command:02X}"):
                # Baseline runs the genuine initializer, including its delay
                # and OS VBI installation. The only OS dependency is the old
                # deferred VBI target, here a standalone RTS at $4001.
                original = PokeyMemory([0] * 65536)
                original[0x0E80:0x8D80] = self.atr[16:0x7F10]
                original[0x0224:0x0226] = bytes.fromhex("0140")
                original[0x4001] = 0x60
                expected = MPU(memory=original)
                call(expected, 0x5E09)
                installed_vbi = original[0x0224] + 256 * original[0x0225]
                self.assertEqual(installed_vbi, 0x5F6F)
                original[0x5E1E] = 0
                original[0x5E27] = command

                # The extracted player starts with otherwise empty RAM,
                # demonstrating that it does not need the game dictionary.
                header, segments = parse_sap(self.files[filename])
                extracted = PokeyMemory([0] * 65536)
                for address, data in segments.items():
                    extracted[address : address + len(data)] = data
                actual = MPU(memory=extracted)
                call(actual, int(header["INIT"], 16), song)
                self.assertEqual(extracted[0x5E27], command)
                player = int(header["PLAYER"], 16)
                # Forty seconds covers multiple title loops, the complete
                # game-over cue, and the long $23 effect; six seconds covers
                # every other effect plus its transition back to silence.
                frames = 2000 if command in (0x50, 0x19, 0x23) else 300
                heard_audio = False
                for frame in range(frames):
                    original.pokey_writes.clear()
                    extracted.pokey_writes.clear()
                    call(expected, installed_vbi)
                    call(actual, player)
                    self.assertEqual(
                        extracted.pokey_writes,
                        original.pokey_writes,
                        f"POKEY sequence differs at frame {frame}",
                    )
                    heard_audio |= any(
                        extracted[a] & 15 for a in (0xD201, 0xD203, 0xD205, 0xD207)
                    )
                self.assertTrue(heard_audio, "Selection never enabled audible volume")


if __name__ == "__main__":
    unittest.main()
