#!/usr/bin/env python3
"""Keep executable checks separate from editable resources and retired disk bytes."""

import hashlib
import struct
import unittest
from unittest.mock import patch

import gam_program as program


class ProgramTests(unittest.TestCase):
    def fixture(self, game):
        image = bytearray(program.ATR_SIZE)
        struct.pack_into("<HHH", image, 0, 0x296, 1040 * 8, 128)
        end = 16 + program.boot_bytes(game)
        image[16:end] = bytes(range(256)) * (program.boot_bytes(game) // 256)
        return image, end, hashlib.sha256(image[16:end]).hexdigest()

    def test_each_loader_maps_only_its_loaded_sectors(self):
        for game, (count, _) in program.PROGRAMS.items():
            with self.subTest(game=game):
                image, end, digest = self.fixture(game)
                # Retired definitions and graphics are not executable memory.
                image[end:16 + 250 * 128] = b"\xA5" * (16 + 250 * 128 - end)
                with patch.dict(program.PROGRAMS, {game: (count, digest)}):
                    memory = program.program_memory(image, game)
                self.assertEqual(memory[program.ORIGIN:program.ORIGIN + count * 128],
                                 image[16:end])
                self.assertFalse(any(memory[program.ORIGIN + count * 128:]))

    def test_resource_edits_are_allowed_but_loaded_byte_edits_are_rejected(self):
        for game, (count, _) in program.PROGRAMS.items():
            with self.subTest(game=game):
                image, end, digest = self.fixture(game)
                with patch.dict(program.PROGRAMS, {game: (count, digest)}):
                    image[-1] = 19
                    image[end] = 73
                    self.assertEqual(program.verify_program(image, game), digest)
                    image[end - 1] ^= 1
                    with self.assertRaisesRegex(ValueError, "executable changed"):
                        program.verify_program(image, game)

    def test_atr_geometry_and_length_are_validated(self):
        image, _, _ = self.fixture("klatwa")
        for bad in (image[:-1], image + b"\0", bytearray(image)):
            if len(bad) == len(image):
                bad[4] = 0
            with self.subTest(size=len(bad)):
                with self.assertRaisesRegex(ValueError, "1040-sector"):
                    program.validate_atr(bad)

    def test_authored_world_edits_are_allowed_only_when_the_compiled_data_matches(self):
        for game in program.PROGRAMS:
            with self.subTest(game=game):
                image, end, _ = self.fixture(game)
                address, size, _ = program.WORLDS[game]
                start = 16 + address - program.ORIGIN
                outside = image[16:start] + image[start + size:end]
                digest = hashlib.sha256(outside).hexdigest()
                original_world = bytes(image[start:start + size])
                image[start] ^= 1
                edited_world = bytes(image[start:start + size])
                with patch.dict(program.WORLDS, {game: (address, size, digest)}):
                    program.verify_program(image, game, edited_world)
                    with self.assertRaisesRegex(ValueError, "initial world differs"):
                        program.verify_program(image, game, original_world)
                    with self.assertRaisesRegex(ValueError, "initial world differs"):
                        program.verify_program(image, game, edited_world[:-1])
                    image[start - 1] ^= 1
                    with self.assertRaisesRegex(ValueError, "code outside"):
                        program.verify_program(image, game, edited_world)


if __name__ == "__main__":
    unittest.main()
