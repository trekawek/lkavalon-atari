#!/usr/bin/env python3
"""Check native sound input, edits and original-6502 playback."""

import importlib.util
from pathlib import Path
import unittest
import tempfile

import forth_assets
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
        cls.original = read_reference(GAME / "reference/ad2044-side1.atr")
        cls.bank = forth_assets.read_asset(GAME, "music/ad2044.snd")

    def test_every_byte_matches_the_historical_bank(self):
        self.assertEqual(self.bank, self.original[0x4F90:0x5DBF])
        self.assertEqual(len(self.bank), 3631)

    def test_native_bank_size_cannot_shift_absolute_sound_addresses(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "music").mkdir()
            path = root / "music/ad2044.snd"
            for data in (self.bank[:-1], self.bank + b"\0"):
                with self.subTest(size=len(data)):
                    path.write_bytes(data)
                    with self.assertRaisesRegex(forth_assets.AssetError, "expected 3631"):
                        forth_assets.read_asset(root, "music/ad2044.snd")

    def test_native_byte_edit_reaches_the_sap_player_segment(self):
        changed = bytearray(self.bank)
        changed[0x27] ^= 1
        sap = replay.music._sap(bytes(changed), [0x50], "Native sound edit")
        _, segments = replay.parse_sap(sap)
        # Standalone SAP playback returns instead of chaining the Atari OS VBI.
        changed[replay.music.VBI_TAIL - 0x5E00] = 0x60
        self.assertEqual(segments[0x5E00], changed)

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

                sap = replay.music._sap(self.bank, [command], "Native sound test")
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
