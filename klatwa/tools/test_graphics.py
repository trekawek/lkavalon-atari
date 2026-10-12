#!/usr/bin/env python3
"""Verify resource boundaries, original-player decoding and runtime images."""

import hashlib
from pathlib import Path
import unittest

import graphics

try:
    from py65.devices.mpu6502 import MPU
except ImportError:
    MPU = None


class GraphicsTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.atr = (graphics.ROOT / "klatwa/reference/klatwa-v1.atr").read_bytes()
        cls.files, cls.metadata = graphics.extract(cls.atr)

    def test_group_crosses_directory_without_copying_it(self):
        group = graphics.gam_groups(self.atr)[4]
        self.assertEqual(group["sectors"][0], 464)
        self.assertEqual(len(group["sectors"]), 110)
        self.assertNotIn(500, group["sectors"])
        self.assertEqual(len(group["spans"]), 2)
        recovered = b"".join(
            self.atr[span["file_offset"] : span["file_offset"] + span["length"]]
            for span in graphics.record_spans(group, 0, len(group["data"]))
        )
        self.assertEqual(recovered, group["data"])

    def test_counts_and_complete_initial_room_set(self):
        self.assertEqual(
            [room["index"] for room in self.metadata["rooms"]], list(range(1, 31))
        )
        self.assertEqual(len(self.metadata["pictures"]), 203)
        self.assertEqual(len(self.metadata["masks"]), 181)
        self.assertEqual(len(self.metadata["sprites"]), 20)
        self.assertEqual(len(self.metadata["fonts"]), 2)

    def test_title_and_fonts_match_original_runtime_memory(self):
        # Independent Atari800 captures: original game boot and first room.
        # Title bitmap RAM $A830..$B9AF and fonts $BC00..$BFFE.
        expected = {
            "title.bin": "6e57fc020d75757dae9e6ba986194c077bbaa8a5b6a9a31c55ce9a8a63d5418b",
            "fonts/title.bin": "365fd5e3bd10d6ccefde450e3160c0fc82bd092dbb2f4c7fbb9613b5c8b0e6f6",
            "fonts/gameplay.bin": "1792754b8d67ff261ee10086b026a2a7b193334a294e1ad13b9a0a800de2b51e",
        }
        for name, digest in expected.items():
            with self.subTest(file=name):
                self.assertEqual(hashlib.sha256(self.files[name]).hexdigest(), digest)

    def test_first_room_matches_static_runtime_pixels(self):
        # The original first-room capture differs only in the animated player
        # at byte columns 21..23, rows 68..108. Generated side borders are
        # outside the scene's byte columns 4..35 and are excluded as documented.
        room = self.files["rooms/room-01.bin"]
        static = bytes(
            room[y * 40 + x]
            for y in range(112)
            for x in range(4, 36)
            if not (21 <= x <= 23 and 68 <= y <= 108)
        )
        self.assertEqual(len(static), 3461)
        self.assertEqual(
            hashlib.sha256(static).hexdigest(),
            "492b9f09661f60feb553f8df9e6eb1baa4fa07fe83c855b9a270cec8c0cac6a8",
        )

    def test_decoder_rejects_truncated_or_overflowing_runs(self):
        for data, width, height in (
            (b"", 1, 1),
            (b"\x8d", 1, 1),
            (b"\x8d\x82\x11", 1, 6),
            (b"\x8d\x05\x11", 1, 4),
        ):
            with self.subTest(data=data):
                with self.assertRaises(ValueError):
                    graphics.decode_rle(data, width, height)
        with self.assertRaises(ValueError):
            graphics.read_records(bytes.fromhex("1000010203"))

    @unittest.skipIf(
        MPU is None, "Install py65 to run the original 6502 decoder comparison"
    )
    def test_every_rle_image_and_mask_matches_original_6502_decoder(self):
        original = bytearray(65536)
        original[0xE80:0x8B80] = self.atr[16 : 16 + 0x7D00]
        for item in self.metadata["pictures"] + self.metadata["masks"]:
            with self.subTest(file=item["raw"]):
                source = b"".join(
                    self.atr[span["file_offset"] : span["file_offset"] + span["length"]]
                    for span in item["source_spans"]
                )
                if "width_bytes" in item:
                    width, stream = item["width_bytes"], source[4:]
                else:
                    width, stream = item["width"], source[2:]
                height = item["height"]
                expected = self.files[item["raw"]]
                memory = original.copy()
                memory[0x6000 : 0x6000 + len(stream)] = stream
                memory[0x8000 : 0x8000 + len(expected)] = b"\xa5" * len(expected)
                memory[0xF0:0xF4] = bytes.fromhex("00600080")
                memory[0xF6:0xF9] = bytes((width, width, height))
                cpu = MPU(memory=memory)
                cpu.pc = 0x3BC3
                cpu.stPushWord(0x1FFF)
                for _ in range(1000000):
                    if cpu.pc == 0x2000:
                        break
                    cpu.step()
                self.assertEqual(cpu.pc, 0x2000, "Original decoder did not return")
                self.assertEqual(memory[0x8000 : 0x8000 + len(expected)], expected)
                _, consumed = graphics.decode_rle(stream, width, height)
                self.assertEqual(
                    int.from_bytes(memory[0xF0:0xF2], "little") - 0x6000, consumed
                )


if __name__ == "__main__":
    unittest.main()
