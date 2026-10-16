#!/usr/bin/env python3
"""Indexed PNG editing and native picture encoding regression tests."""

import importlib.util
from pathlib import Path
import struct
import unittest
import zlib

SPEC = importlib.util.spec_from_file_location("ad2044_pictures", Path(__file__).with_name("pictures.py"))
pictures = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(pictures)
ROOT = Path(__file__).resolve().parents[1]


def chunk(kind, data):
    return struct.pack(">I", len(data)) + kind + data + struct.pack(">I", zlib.crc32(kind + data) & 0xFFFFFFFF)


def png_fixture(width, height, depth, pixels, filters=None, palette=None, **overrides):
    """Independent packed-depth/filter fixture writer, including malformed PNGs."""
    palette = palette or pictures.GRAYSCALE[:min(4, 1 << depth)]
    filters = filters or [0] * height
    stride = (width * depth + 7) // 8
    raw, previous = bytearray(), bytes(stride)
    for y in range(height):
        row = bytearray(stride)
        for x in range(width):
            row[x * depth // 8] |= pixels[y * width + x] << (8 - depth - x * depth % 8)
        method = filters[y]
        filtered = bytearray()
        for x, value in enumerate(row):
            a, b, c = row[x - 1] if x else 0, previous[x], previous[x - 1] if x else 0
            estimate = a + b - c
            distance = [abs(estimate - k) for k in (a, b, c)]
            paeth = (a, b, c)[distance.index(min(distance))]
            prediction = (0, a, b, (a + b) // 2, paeth)[method] if method < 5 else 0
            filtered.append((value - prediction) % 256)
        raw.extend(bytes([method]) + filtered)
        previous = row
    header = struct.pack(">IIBBBBB", overrides.get("header_width", width), height, depth,
                         overrides.get("color", 3), 0, 0, overrides.get("interlace", 0))
    compressed = overrides.get("compressed", zlib.compress(raw))
    return (pictures.PNG_SIGNATURE + chunk(b"IHDR", header)
            + chunk(b"PLTE", bytes(c for rgb in palette for c in rgb))
            + overrides.get("before_idat", b"") + chunk(b"IDAT", compressed)
            + chunk(b"IEND", b""))


class PNGTests(unittest.TestCase):
    def test_all_supported_depths_and_filters_preserve_indices(self):
        # Odd width exercises low unused bits in every packed-depth scanline.
        for depth in (1, 2, 4, 8):
            for method in range(5):
                with self.subTest(depth=depth, method=method):
                    width, height = 7, 6
                    values = bytes((x * 3 + y * 2 + (x * y)) % min(4, 1 << depth)
                                   for y in range(height) for x in range(width))
                    encoded = png_fixture(width, height, depth, values, [method] * height)
                    w, h, actual, palette = pictures.decode_png(encoded)
                    self.assertEqual((w, h, actual), (width, height, values))
                    self.assertEqual(palette[0], (0, 0, 0))

    def test_encoder_writes_four_colors_and_logical_dimensions(self):
        raw = pictures.encode_png(8, 2, bytes(range(4)) * 4)
        self.assertEqual(pictures.decode_png(raw), (8, 2, bytes(range(4)) * 4, pictures.GRAYSCALE))
        for pixels, palette in ((b"\4", pictures.GRAYSCALE), (b"\0", pictures.GRAYSCALE[:3])):
            with self.assertRaises(ValueError):
                pictures.encode_png(1, 1, pixels, palette)

    def test_rgb_interlace_transparency_and_invalid_indices_are_rejected(self):
        for kwargs in ({"color": 2}, {"interlace": 1},
                       {"before_idat": chunk(b"tRNS", b"\0")},
                       {"before_idat": chunk(b"BADX", b"")}):
            with self.subTest(kwargs=kwargs), self.assertRaises(ValueError):
                pictures.decode_png(png_fixture(4, 1, 8, b"\0\1\2\3", **kwargs))
        for values, palette in ((b"\4", [(0, 0, 0)] * 5), (b"\3", [(0, 0, 0)] * 3)):
            with self.assertRaisesRegex(ValueError, "indices"):
                pictures.decode_png(png_fixture(1, 1, 8, values, palette=palette))

    def test_malformed_chunks_streams_dimensions_and_size_are_rejected(self):
        good = png_fixture(4, 1, 8, b"\0\1\2\3")
        bad_crc = bytearray(good)
        bad_crc[-1] ^= 1
        for raw in (b"", good[:-1], good + b"trailing", bad_crc,
                    png_fixture(4, 1, 8, b"\0\1\2\3", header_width=0),
                    png_fixture(4, 1, 8, b"\0\1\2\3", header_width=pictures.MAX_PIXELS + 1),
                    png_fixture(4, 1, 8, b"\0\1\2\3", filters=[5]),
                    png_fixture(4, 1, 8, b"\0\1\2\3", compressed=zlib.compress(b"x" * 50000)),
                    png_fixture(4, 1, 8, b"\0\1\2\3", compressed=zlib.compress(b"\0\0\1\2\3") + b"tail"),
                    png_fixture(4, 1, 8, b"\0\1\2\3", compressed=zlib.compress(b"\0\0\1\2\3")[:-1]),
                    b"x" * (pictures.MAX_FILE_SIZE + 1)):
            with self.subTest(size=len(raw)), self.assertRaises(ValueError):
                pictures.decode_png(raw)


class PictureTests(unittest.TestCase):
    def test_overlay_placement_uses_base_bounds_and_rounded_hitmap_rows(self):
        def image(x, y, width, height):
            png = pictures.encode_png(width * 4, height, bytes(width * height * 4))
            return pictures.encode_picture(png, x, y)
        def grid(width, height):
            return pictures.compress(bytes([width, height]) + bytes(width * height))
        base = image(10, 8, 2, 18)
        overlay = image(11, 15, 1, 8)
        # dy=7 rounds upward to row2. A one-row map fits; two rows overflow.
        pictures.validate_overlay(base, overlay, grid(3, 3), grid(2, 1))
        with self.assertRaisesRegex(ValueError, "base grid"):
            pictures.validate_overlay(base, overlay, grid(3, 3), grid(2, 2))
        with self.assertRaisesRegex(ValueError, "base picture"):
            pictures.validate_overlay(base, image(9, 15, 1, 8), grid(3, 3), grid(1, 1))
        with self.assertRaisesRegex(ValueError, "base picture"):
            pictures.validate_overlay(base, image(11, 15, 2, 8), grid(3, 3), grid(1, 1))

    def test_overlay_scratch_limit_is_smaller_than_base_picture_buffer(self):
        def image(width, height):
            return pictures.encode_picture(pictures.encode_png(width, height, bytes(width * height)), 0, 0)
        base = image(80, 100)
        small = image(40, 100)  # 1005 decoded bytes.
        large = image(44, 100)  # 1105: fits FIRST, but not the1044-byte scratch.
        grid = pictures.compress(bytes([21, 15]) + bytes(21 * 15))
        pictures.validate_overlay(base, small, grid, grid)
        with self.assertRaisesRegex(ValueError, "size limit|1044-byte"):
            pictures.validate_overlay(base, large, grid, grid)

    def test_compression_cannot_hide_an_oversized_runtime_picture(self):
        fitting = pictures.encode_png(80, 104, bytes(80 * 104))
        self.assertLess(len(pictures.encode_picture(fitting, 0, 0)), 100)
        oversized = pictures.encode_png(160, 104, bytes(160 * 104))
        with self.assertRaisesRegex(ValueError, "2112-byte runtime buffer"):
            pictures.encode_picture(oversized, 0, 0)

    def test_editing_one_index_changes_only_corresponding_atari_pixel(self):
        pixels = bytearray(b"\0\1\2\3" * 4)
        colors = [0x24, 0xF8, 0xFD, 0xA2, 0]
        before = pictures.encode_picture(pictures.encode_png(8, 2, pixels), 10, 8, colors, 0x13)
        pixels[5] = 3
        after = pictures.encode_picture(pictures.encode_png(8, 2, pixels), 10, 8, colors, 0x13)
        left, right = pictures.decompress(before), pictures.decompress(after)
        self.assertEqual(left[:4], bytes([10, 8, 2, 2]))
        self.assertEqual(left[-6:], bytes(colors + [0x13]))
        self.assertEqual([i for i, (a, b) in enumerate(zip(left, right)) if a != b], [5])
        self.assertEqual(left[5] ^ right[5], 0x20)
        self.assertEqual(pictures.unpack_pixels(right[4:8]), pixels)

    def test_uncompressed_literal_fe_and_flag_rules(self):
        png = pictures.encode_png(4, 1, b"\3\3\3\2")
        self.assertEqual(pictures.encode_picture(png, 0, 0, flag=0), b"\0\0\1\1\xfe\0")
        for fields in ((0, 0, None, 1), (0, 0, [1, 2, 3, 4, 5], 2),
                       (0, 0, [1, 2, 3], 3), (-1, 0, None, 2),
                       (40, 0, None, 2), (0, 104, None, 2)):
            with self.subTest(fields=fields), self.assertRaises(ValueError):
                pictures.encode_picture(png, *fields)
        with self.assertRaises(ValueError):
            pictures.encode_picture(pictures.encode_png(3, 1, b"\0\1\2"), 0, 0)

    def test_fullscreen_retains_extra_row_and_font_is_literal(self):
        pixels = bytearray(160 * 105)
        pixels[-1] = 3
        png = pictures.encode_png(160, 105, pixels)
        raw = pictures.decompress(pictures.encode_fullscreen(png))
        self.assertEqual(len(raw), 4200)
        self.assertEqual(raw[-1], 3)
        self.assertEqual(raw[:-1], bytes(4199))
        with self.assertRaisesRegex(ValueError, "105"):
            pictures.encode_fullscreen(pictures.encode_png(160, 104, bytes(160 * 104)))
        font = bytes(range(256)) * 3 + bytes(range(224))
        self.assertEqual(pictures.encode_font(font), font)
        with self.assertRaises(ValueError):
            pictures.encode_font(font[:-1])

    def test_fe_runs_are_bounded_and_roundtrip_every_byte(self):
        data = bytes(range(256)) + b"\xfe" * 256 + b"x" * 700
        packed = pictures.compress(data)
        self.assertEqual(pictures.decompress(packed), data)
        for invalid in (b"\xfe", b"\xfe\0x", b"\xfe\1"):
            with self.assertRaises(ValueError):
                pictures.decompress(invalid)
        with self.assertRaises(ValueError):
            pictures.decompress(packed, len(data) - 1)


class AuthoredPictureTests(unittest.TestCase):
    def test_all_current_indexed_sources_reencode_without_pixel_changes(self):
        count = 0
        for scene in list((ROOT / "rooms").glob("*/scene.txt")) + list((ROOT / "items").glob("*/scene.txt")) + [ROOT / "ending/scene.txt"]:
            for line in scene.read_text().splitlines():
                fields = line.split("#", 1)[0].split()
                if not fields or fields[0] != "picture":
                    continue
                _, _, filename, x, y, color_text = fields[:6]
                flag_text = fields[6] if len(fields) == 7 else "-"
                colors = None if color_text == "-" else [int(v, 16) for v in color_text.split(",")]
                flag = None if flag_text == "-" else int(flag_text)
                path = scene.parent / filename
                with self.subTest(source=path.relative_to(ROOT)):
                    source = path.read_bytes()
                    width, height, pixels, _ = pictures.decode_png(source)
                    packed = pictures.encode_picture(source, int(x), int(y), colors, flag)
                    raw = pictures.decompress(packed) if packed[-1] > 1 else packed
                    self.assertEqual(raw[:4], bytes([int(x), int(y), width // 4, height]))
                    end = 4 + width * height // 4
                    self.assertEqual(pictures.unpack_pixels(raw[4:end]), pixels)
                    self.assertEqual(raw[end:-1], b"" if colors is None else bytes(colors))
                count += 1
        self.assertGreater(count, 300)
        for name in ("interface/title.png", "interface/frame.png", "ending/background.png"):
            with self.subTest(source=name):
                source = (ROOT / name).read_bytes()
                width, height, pixels, _ = pictures.decode_png(source)
                raw = pictures.decompress(pictures.encode_fullscreen(source))
                self.assertEqual((width, height), (160, 105))
                self.assertEqual(pictures.unpack_pixels(raw), pixels)
        for name in ("interface/title.fnt", "interface/game.fnt"):
            with self.subTest(source=name):
                source = (ROOT / name).read_bytes()
                self.assertEqual(pictures.encode_font(source), source)


if __name__ == "__main__":
    unittest.main()
