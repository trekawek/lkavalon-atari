#!/usr/bin/env python3
"""Bounded-format and original-6502 oracle tests for AD2044 graphics."""

import importlib.util
from pathlib import Path
import unittest

SPEC = importlib.util.spec_from_file_location(
    "ad2044_graphics", Path(__file__).with_name("graphics.py")
)
graphics = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(graphics)
ROOT = Path(__file__).resolve().parents[1]

try:
    from py65.devices.mpu6502 import MPU
except ModuleNotFoundError:
    MPU = None


class FormatTests(unittest.TestCase):
    def test_literal_fe_and_long_runs(self):
        packed = b"A\xfe\x01\xfeB\xfe\xffC\xfe\x02D"
        self.assertEqual(graphics.unpack(packed), b"A\xfeB" + b"C" * 255 + b"DD")
        self.assertEqual(graphics.unpack(b""), b"")

    def test_truncated_zero_count_and_excessive_runs_are_rejected(self):
        for raw in (b"\xfe", b"A\xfe\x03", b"\xfe\x00A"):
            with self.subTest(raw=raw), self.assertRaises(ValueError):
                graphics.unpack(raw)
        self.assertEqual(graphics.unpack(b"\xfe\xffA", max_output=255), b"A" * 255)
        with self.assertRaises(ValueError):
            graphics.unpack(b"\xfe\xffAA", max_output=255)

    def test_records_preserve_source_offsets_and_stop_at_zero(self):
        raw = b"outside\x03\x00ABC\x01\x00D\x00\x00not another record"
        entries, stop = graphics.records(raw, 7)
        self.assertEqual([record["body"] for record in entries], [b"ABC", b"D"])
        self.assertEqual([record["offset"] for record in entries], [7, 12])
        self.assertEqual(stop, 15)
        self.assertEqual(graphics.records(b"", 0, 0), ([], 0))

    def test_records_cannot_cross_collection_boundary(self):
        for raw, start, end in [
            (b"\x03\x00ABC", 0, 4),
            (b"X", 0, 1),
            (b"\0\0", -1, 2),
            (b"\0\0", 0, 3),
            (b"\0\0", 2, 1),
        ]:
            with self.subTest(raw=raw, start=start, end=end), self.assertRaises(
                ValueError
            ):
                graphics.records(raw, start, end)

    def test_picture_flag_uses_numeric_and_parity_rules(self):
        # Flag $13 is used by one real room. Bits beyond the low pair are
        # not grounds to reject it: the renderer compares >1 and tests mod2.
        raw = bytes([10, 8, 2, 3, 0xFE, 6, 0x55, 0x24, 0xF8, 0xFD, 0xA2, 0, 0x13])
        pic = graphics.picture(raw)
        self.assertEqual((pic["width"], pic["height"]), (8, 3))
        self.assertEqual(pic["bitmap"], b"\x55" * 6)
        self.assertEqual(pic["colors"], [0x24, 0xF8, 0xFD, 0xA2, 0])
        self.assertEqual(pic["flag"], 0x13)

    def test_uncompressed_pixels_keep_literal_fe(self):
        pic = graphics.picture(bytes([0, 0, 1, 2, 0xFE, 0xFF, 0]))
        self.assertEqual(pic["bitmap"], b"\xfe\xff")
        self.assertIsNone(pic["colors"])

    def test_invalid_picture_geometry_and_payload_are_not_guessed(self):
        for raw in (
            b"",
            bytes([0, 0, 0, 1, 2]),
            bytes([40, 0, 1, 1, 0, 2]),
            bytes([0, 104, 1, 1, 0, 2]),
            bytes([0, 0, 1, 2, 0, 2]),
            bytes([0, 0, 1, 1, 0xFE, 2]),
        ):
            with self.subTest(raw=raw):
                self.assertIsNone(graphics.picture(raw))


class OriginalDiskTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.disks = {
            side: (ROOT / f"reference/ad2044-side{side}.atr").read_bytes()
            for side in (1, 2)
        }
        cls.files, cls.metadata = graphics.extract(cls.disks[1], cls.disks[2])

    def test_directory_skip_preserves_crossing_group_bytes(self):
        group = graphics.groups(self.disks[1], 1)[10]
        self.assertEqual(group["group"], 11)
        self.assertEqual(
            group["sectors"], list(range(487, 500)) + list(range(501, 509))
        )
        disk = self.disks[1]
        self.assertEqual(
            group["data"],
            disk[16 + 486 * 128 : 16 + 499 * 128]
            + disk[16 + 500 * 128 : 16 + 508 * 128],
        )

    def test_invalid_disk_geometry_side_and_directory_are_rejected(self):
        invalid = [self.disks[1][:-1], self.disks[1] + b"\0"]
        for offset in (0, 4, 0xF990):
            disk = bytearray(self.disks[1])
            disk[offset] ^= 1
            invalid.append(disk)
        overflow = bytearray(self.disks[1])
        overflow[0xF991:0xF99B] = b"\xff" * 10
        invalid.append(overflow)
        for index, disk in enumerate(invalid):
            with self.subTest(case=index), self.assertRaises(ValueError):
                graphics.groups(disk, 1)

    def test_damaged_or_missing_base_picture_cannot_silently_disappear(self):
        first_room = next(
            a for a in self.metadata["assets"] if a["id"] == "s1-g05-r002"
        )
        offset = first_room["source"]["spans"][0]["offset"]
        damaged = bytearray(self.disks[1])
        damaged[offset + 4] = 0  # Width byte, after length and x/y bytes.
        with self.assertRaisesRegex(ValueError, "base picture"):
            graphics.extract(damaged, self.disks[2])
        missing = bytearray(self.disks[1])
        missing[16 + 346 * 128 : 18 + 346 * 128] = b"\0\0"
        with self.assertRaisesRegex(ValueError, "base picture"):
            graphics.extract(missing, self.disks[2])

    def test_coverage_keeps_animation_frames_and_inventory_instances(self):
        coverage = self.metadata["coverage"]
        self.assertEqual(coverage["positioned_bitmaps"], 345)
        self.assertEqual(coverage["base_room_scenes"], 36)
        self.assertEqual(coverage["fullscreen_bitmaps"], 3)
        self.assertEqual(coverage["fonts"], 2)
        self.assertEqual(coverage["cursor_bitplanes"], 3)
        self.assertEqual(
            sum(a["kind"] == "inventory bitmap" for a in self.metadata["assets"]), 40
        )
        by_room = {scene["room"]: scene for scene in self.metadata["scenes"]}
        self.assertEqual(by_room[36]["scene_kind"], "retail-version purchase notice")
        self.assertEqual(by_room[25]["scene_kind"], "explosion-animation background")
        self.assertNotIn(35, by_room)  # Ending is a separate full-screen bitmap.

    def test_packed_assets_reconstruct_from_reported_disk_spans(self):
        for asset in self.metadata["assets"]:
            with self.subTest(asset=asset["id"]):
                source = asset["source"]
                side = 1 if source["disk"].endswith("side1.atr") else 2
                raw = b"".join(
                    self.disks[side][span["offset"] : span["offset"] + span["length"]]
                    for span in source["spans"]
                )
                packed = self.files[asset["packed_file"]]
                offset = asset.get("packed_offset", 0)
                self.assertEqual(packed[offset : offset + len(raw)], raw)
                if "packed_offset" not in asset:
                    self.assertEqual(len(packed), len(raw))
                    self.assertEqual(
                        int.from_bytes(packed[:2], "little"), len(packed) - 2
                    )

    def test_title_and_game_fonts_remain_raw_992_byte_records(self):
        fonts = [a for a in self.metadata["assets"] if a["kind"] == "font"]
        self.assertEqual(len(fonts), 2)
        for font in fonts:
            with self.subTest(asset=font["id"]):
                raw = self.files[font["packed_file"]][2:]
                self.assertEqual(self.files[font["decoded_file"]], raw)
                self.assertEqual(len(raw), 992)
                self.assertEqual(font["glyph_count"], 124)
        title = next(font for font in fonts if font["source"]["group"] == 3)
        raw = self.files[title["decoded_file"]]
        self.assertIn(b"\xfe", raw)
        self.assertNotEqual(graphics.unpack(raw), raw)

    def test_decoded_picture_extents_and_contextual_palettes_are_explicit(self):
        for asset in self.metadata["assets"]:
            if "bitmap_offset" not in asset:
                continue
            with self.subTest(asset=asset["id"]):
                decoded = self.files[asset["decoded_file"]]
                self.assertEqual(
                    len(decoded),
                    4
                    + asset["row_bytes"] * asset["height"]
                    + 1
                    + (5 if asset["flag"] & 1 else 0),
                )
                if asset["kind"] == "inventory bitmap":
                    self.assertFalse(asset["palette"]["known"])
                elif asset["stored_colors"]:
                    self.assertEqual(
                        asset["palette"]["registers"], [0] + asset["stored_colors"][:3]
                    )

    def test_scene_bins_are_derived_from_original_interface_and_room_pixels(self):
        assets = {asset["id"]: asset for asset in self.metadata["assets"]}
        interface = self.files[assets["s1-g04-r000"]["decoded_file"]][:4160]
        for scene in self.metadata["scenes"]:
            with self.subTest(scene=scene["id"]):
                asset = assets[scene["base_asset"]]
                graphic = self.files[asset["decoded_file"]]
                expected = bytearray(interface)
                for y in range(asset["height"]):
                    start = (asset["y"] + y) * 40 + asset["x_byte"]
                    row = 4 + y * asset["row_bytes"]
                    expected[start : start + asset["row_bytes"]] = graphic[
                        row : row + asset["row_bytes"]
                    ]
                self.assertEqual(self.files[scene["decoded_file"]], expected)
                self.assertEqual(scene["width_bytes"], 40)
                self.assertEqual(len(expected), 4160)

    def test_graphics_credit_is_present_in_original_intro(self):
        credit = self.metadata["graphics_credit"]
        for role in ("role", "name"):
            offset, raw = credit[f"{role}_offset"], credit[f"{role}_ascii"].encode(
                "ascii"
            )
            self.assertEqual(self.disks[1][offset : offset + len(raw)], raw)

    @unittest.skipUnless(
        MPU is not None, "py65 is required for native graphics decoder"
    )
    def test_all_compressed_bitmaps_match_original_native_6502_decoder(self):
        original = bytearray(65536)
        original[0x0E80:0x8D80] = self.disks[1][16:0x7F10]
        tested = 0
        for asset in self.metadata["assets"]:
            if asset.get("compression") != "FE RLE":
                continue
            with self.subTest(asset=asset["id"]):
                packed = self.files[asset["packed_file"]][2:]
                expected = self.files[asset["decoded_file"]]
                memory = bytearray(original)
                memory[0x8000 : 0x8000 + len(packed)] = packed
                memory[0x9FFF:0xC000] = b"\xcd" * 8193
                # WD reads the original Forth data stack at X: input length,
                # destination, source. $3ADA returns directly through RTS.
                memory[0x80:0x86] = len(packed).to_bytes(2, "little") + bytes.fromhex(
                    "00A00080"
                )
                cpu = MPU(memory=memory)
                cpu.x = 0x80
                cpu.stPushWord(0x6FFF)
                cpu.pc = 0x3ADA
                for _ in range(200_000):
                    cpu.step()
                    if cpu.pc == 0x7000:
                        break
                else:
                    self.fail(f"Original decoder failed to return; PC=${cpu.pc:04X}")
                self.assertEqual(memory[0xA000 : 0xA000 + len(expected)], expected)
                self.assertEqual(memory[0x9FFF], 0xCD)
                self.assertEqual(memory[0xA000 + len(expected)], 0xCD)
                tested += 1
        self.assertEqual(tested, 348)


if __name__ == "__main__":
    unittest.main()
