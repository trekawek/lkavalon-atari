#!/usr/bin/env python3
"""Wladcy-specific resource coverage and original-blitter regression checks."""

from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "util"))
from reference_media import read_reference
import unittest

import graphics

try:
    from py65.devices.mpu6502 import MPU
except ImportError:
    MPU = None


ROOT = Path(__file__).resolve().parents[1]


class GraphicsTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.atr = read_reference(ROOT / "reference/wladcy-ciemnosci.atr")
        cls.files, cls.metadata = graphics.extract(cls.atr)

    def test_initial_rooms_and_obsolete_layouts_are_distinct(self):
        rooms = self.metadata["rooms"]
        self.assertEqual(len(rooms), 27)
        self.assertEqual([r["number"] for r in rooms if r["file"]], list(range(1, 25)))
        self.assertEqual([r["duplicate_layout_of"] for r in rooms[24:]], [10, 11, None])
        self.assertTrue(all(r["file"] is None for r in rooms[24:]))
        self.assertTrue(rooms[25]["missing_images"])
        self.assertTrue(rooms[26]["missing_images"])
        self.assertEqual(rooms[0]["default_state_layers"], [8, 108, 0])

    def test_all_profiled_graphics_and_fonts_are_retained(self):
        self.assertEqual(len(self.metadata["pictures"]), 264)
        self.assertEqual(len(self.metadata["masks"]), 255)
        self.assertEqual(len(self.metadata["sprites"]), 20)
        for font in self.metadata["fonts"]:
            source = b"".join(
                self.atr[span["file_offset"] : span["file_offset"] + span["length"]]
                for span in font["source_spans"]
            )
            self.assertEqual(self.files[font["file"]], source)
            self.assertEqual(len(source), 1024)
        for room in self.metadata["rooms"]:
            source = b"".join(
                self.atr[span["file_offset"] : span["file_offset"] + span["length"]]
                for span in room["source_spans"]
            )
            self.assertEqual(self.files[room["layout_file"]], source)

    def test_original_group_and_record_payloads_are_preserved(self):
        self.assertEqual(len(self.metadata["groups"]), 5)
        for group in self.metadata["groups"]:
            original = b"".join(
                self.atr[16 + (sector - 1) * 128 : 16 + sector * 128]
                for sector in group["sectors"]
            )
            self.assertEqual(self.files[group["file"]], original)
            for record in group["records"]:
                source = b"".join(
                    self.atr[span["file_offset"] : span["file_offset"] + span["length"]]
                    for span in record["atr_spans"]
                )
                self.assertEqual(self.files[record["file"]], source)
        for group in (5, 7):
            self.assertGreater(len(self.files[f"records/g{group:02d}-r002.bin"]), 2000)
            self.assertEqual(self.files[f"records/g{group:02d}-r003.bin"], b";")
            self.assertFalse(
                any(
                    p["resource"] < 4
                    for p in self.metadata["pictures"]
                    if p["group"] == group
                )
            )

    def native_composition(self, layers):
        """Execute the disk's real $3BC3 routine on the original packed bytes."""
        ram = bytearray(65536)
        ram[0x0E80:0x8B80] = self.atr[16:0x7D10]
        ram[0xA830 : 0xA830 + 4480] = bytes(4480)
        groups = graphics.gam.gam_groups(self.atr)
        records = {
            number: graphics.gam.read_records(group["data"])[0]
            for number, group in groups.items()
            if number in (3, 4)
        }
        cpu = MPU(memory=ram)
        for group, resource, subrecord in layers:
            children, _ = graphics.gam.read_records(records[group][resource]["data"])
            picture = children[subrecord]["data"]
            x, y, width, height = picture[:4]
            source = 0xC000
            dest = 0xA830 + y * 40 + x
            ram[source : source + len(picture) - 4] = picture[4:]
            ram[0xF0:0xF2] = source.to_bytes(2, "little")
            ram[0xF2:0xF4] = dest.to_bytes(2, "little")
            ram[0xF6:0xF9] = bytes((40, width, height))
            cpu.sp = 0xFF
            cpu.stPushWord(0xEFFF)
            cpu.pc = 0x3BC3
            for _ in range(250000):
                if cpu.pc == 0xF000:
                    break
                cpu.step()
            else:
                self.fail("Original graphics routine did not return")
        return bytes(ram[0xA830 : 0xA830 + 4480])

    @unittest.skipIf(MPU is None, "Native graphics oracle requires optional py65")
    def test_all_compressed_graphics_match_original_6502_decoder(self):
        ram = bytearray(65536)
        ram[0x0E80:0x8B80] = self.atr[16:0x7D10]
        cpu = MPU(memory=ram)
        for category, header_size in (("pictures", 4), ("masks", 2)):
            for item in self.metadata[category]:
                with self.subTest(file=item["raw_file"]):
                    source_bytes = b"".join(
                        self.atr[
                            span["file_offset"] : span["file_offset"] + span["length"]
                        ]
                        for span in item["source_spans"]
                    )
                    width, height = source_bytes[header_size - 2 : header_size]
                    packed = source_bytes[header_size:]
                    source, destination = 0xC000, 0x9000
                    ram[source : source + len(packed)] = packed
                    ram[destination : destination + width * height] = bytes(
                        width * height
                    )
                    ram[0xF0:0xF2] = source.to_bytes(2, "little")
                    ram[0xF2:0xF4] = destination.to_bytes(2, "little")
                    ram[0xF6:0xF9] = bytes((width, width, height))
                    cpu.sp = 0xFF
                    cpu.stPushWord(0xEFFF)
                    cpu.pc = 0x3BC3
                    for _ in range(250000):
                        if cpu.pc == 0xF000:
                            break
                        cpu.step()
                    else:
                        self.fail("Original graphics routine did not return")
                    self.assertEqual(
                        self.files[item["raw_file"]],
                        bytes(ram[destination : destination + width * height]),
                    )

    @unittest.skipIf(MPU is None, "Native graphics oracle requires optional py65")
    def test_first_room_matches_original_6502_blitter(self):
        # These IDs come from the game's room-1 record and initial object state.
        layers = [3, 4, 7, 107, 8, 110, 111, 114, 15, 109, 10, 37, 145, 8, 108]
        expected = self.native_composition(
            [(4, item % 100, item // 100 * 2) for item in layers]
        )
        self.assertEqual(self.files["rooms/room-01.bin"], expected)

    @unittest.skipIf(MPU is None, "Native graphics oracle requires optional py65")
    def test_title_matches_original_6502_blitter(self):
        # Literal calls in LOAD-TITLE-ASSETS, CFA $8460.
        expected = self.native_composition(
            [(3, 2, 1), (3, 4, 1), (3, 3, 0), (3, 4, 0), (3, 5, 0)]
        )
        self.assertEqual(self.files["title.bin"], expected)


if __name__ == "__main__":
    unittest.main()
