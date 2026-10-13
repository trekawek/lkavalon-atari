#!/usr/bin/env python3
"""Check structured sound encoding, edits and original-6502 playback."""

import copy
import importlib.util
import json
from pathlib import Path
import unittest

import sound_assets
from reference_media import read_reference

ROOT = Path(__file__).resolve().parents[1]
GAME = ROOT / "ad2044"


def load_module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


replay = load_module("sound_replay_helpers", GAME / "tools/test_music_sap.py")


class SoundAssets(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.document = json.loads((GAME / "music/sound-bank.json").read_text("ascii"))
        cls.original = read_reference(GAME / "reference/ad2044-side1.atr")
        cls.bank = sound_assets.encode(cls.document, cls.no_read)

    @staticmethod
    def no_read(name):
        raise AssertionError(f"Sound source unexpectedly reads {name}")

    def test_every_byte_matches_the_historical_bank(self):
        self.assertEqual(self.bank, self.original[0x4F90:0x5DBF])
        self.assertEqual(len(self.bank), 3631)
        self.assertEqual(sound_assets.dependencies(self.document), [])

    def test_editing_named_command_register_changes_only_its_byte(self):
        doc = copy.deepcopy(self.document)
        section = next(s for s in doc["sections"] if s["name"] == "command registers")
        section["fields"][0]["value"] ^= 1
        expected = bytearray(self.bank)
        expected[0x27] ^= 1
        self.assertEqual(sound_assets.encode(doc, self.no_read), expected)

    def test_note_and_envelope_edits_reach_their_named_locations(self):
        doc = copy.deepcopy(self.document)
        title = next(s for s in doc["sections"] if s["name"] == "title music")
        note = next(i for i in title["instructions"] if i["op"] == "note")
        note["frequency_divider"] ^= 1
        expected = bytearray(self.bank)
        expected[note["at"] + 1 - doc["origin"]] ^= 1
        pitch = next(s for s in doc["sections"] if s["type"] == "pitch-envelope")
        pitch["steps"][0] = -1
        expected[pitch["address"] - doc["origin"]] = 255
        self.assertEqual(sound_assets.encode(doc, self.no_read), expected)

    def test_invalid_duration_and_signed_slide_are_rejected(self):
        for record in (
            {"op": "note", "duration_index": 8, "frequency_divider": 40},
            {"op": "pitch-slide", "step": -129, "end_frequency": 0},
        ):
            with self.subTest(record=record), self.assertRaises(ValueError):
                sound_assets.vm_instruction(record)

    def test_size_changes_cannot_shift_absolute_sound_addresses(self):
        doc = copy.deepcopy(self.document)
        section = next(s for s in doc["sections"] if s["type"] == "assembly")
        section["instructions"].append("NOP")
        with self.assertRaisesRegex(ValueError, "changed size"):
            sound_assets.encode(doc, self.no_read)

    def test_stream_address_annotations_are_validated(self):
        doc = copy.deepcopy(self.document)
        section = next(s for s in doc["sections"] if s["type"] == "stream")
        section["instructions"][0]["at"] += 1
        with self.assertRaisesRegex(ValueError, "instruction address"):
            sound_assets.encode(doc, self.no_read)

    @unittest.skipUnless(replay.MPU is not None, "py65 is required for original replay")
    def test_all_22_commands_match_original_ordered_pokey_writes(self):
        for command, _ in replay.music.COMMANDS:
            with self.subTest(command=command):
                original = replay.PokeyMemory([0] * 65536)
                original[0x0E80:0x8D80] = self.original[16:0x7F10]
                original[0x0224:0x0226] = bytes.fromhex("0140")
                original[0x4001] = 0x60
                expected = replay.MPU(memory=original)
                replay.call(expected, 0x5E09)
                original[0x5E1E] = 0
                original[0x5E27] = command

                sap = replay.music._sap(self.bank, [command], "Structured sound test")
                header, parts = replay.parse_sap(sap)
                memory = replay.PokeyMemory([0] * 65536)
                for address, data in parts.items():
                    memory[address:address + len(data)] = data
                actual = replay.MPU(memory=memory)
                replay.call(actual, int(header["INIT"], 16))
                frames = 2000 if command in (0x50, 0x19, 0x23) else 300
                heard_audio = False
                for frame in range(frames):
                    original.pokey_writes.clear()
                    memory.pokey_writes.clear()
                    replay.call(expected, 0x5F6F)
                    replay.call(actual, int(header["PLAYER"], 16))
                    self.assertEqual(memory.pokey_writes, original.pokey_writes,
                                     f"Command {command}, frame {frame}")
                    heard_audio |= any(memory[a] & 15 for a in (0xD201, 0xD203, 0xD205, 0xD207))
                self.assertTrue(heard_audio)


if __name__ == "__main__":
    unittest.main()
