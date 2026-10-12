#!/usr/bin/env python3
"""Independent checks for graphics conversion and exported preview pixels."""

from pathlib import Path
import struct
import unittest
import zlib

import graphics_common as graphics


def png_chunks(data):
    if data[:8] != b"\x89PNG\r\n\x1a\n":
        raise AssertionError("PNG signature missing")
    cursor = 8
    result = []
    while cursor < len(data):
        length = struct.unpack_from(">I", data, cursor)[0]
        kind = data[cursor + 4 : cursor + 8]
        payload = data[cursor + 8 : cursor + 8 + length]
        crc = struct.unpack_from(">I", data, cursor + 8 + length)[0]
        if zlib.crc32(kind + payload) & 0xFFFFFFFF != crc:
            raise AssertionError("Incorrect PNG chunk CRC")
        result.append((kind, payload))
        cursor += length + 12
    if result[-1] != (b"IEND", b""):
        raise AssertionError("PNG end missing")
    return dict(result)


class PreviewTests(unittest.TestCase):
    def test_packed_pixels_keep_left_to_right_bit_order_and_stride(self):
        self.assertEqual(
            graphics.unpack_2bpp(bytes.fromhex("1BE4"), 8, 1),
            bytes((0, 1, 2, 3, 3, 2, 1, 0)),
        )
        self.assertEqual(
            graphics.unpack_2bpp(bytes.fromhex("1BFFE4FF"), 4, 2, 2),
            bytes((0, 1, 2, 3, 3, 2, 1, 0)),
        )
        with self.assertRaises(ValueError):
            graphics.unpack_2bpp(b"\0", 5, 1)
        with self.assertRaises(ValueError):
            graphics.unpack_2bpp(b"\0", 4, 2)

    def test_atari_wide_pixels_are_duplicated_horizontally_only(self):
        width, height, pixels = graphics.scale_indexed(bytes((1, 2, 3, 0)), 2, 2)
        self.assertEqual((width, height), (4, 2))
        self.assertEqual(pixels, bytes((1, 1, 2, 2, 3, 3, 0, 0)))

    def test_png_contains_original_indices_palette_and_valid_crcs(self):
        pixels = bytes((0, 1, 2, 3, 3, 2, 1, 0))
        chunks = png_chunks(graphics.encode_png(4, 2, pixels, graphics.GRAYSCALE))
        self.assertEqual(
            struct.unpack(">IIBBBBB", chunks[b"IHDR"]), (4, 2, 8, 3, 0, 0, 0)
        )
        self.assertEqual(
            chunks[b"PLTE"], bytes((0, 0, 0, 85, 85, 85, 170, 170, 170, 255, 255, 255))
        )
        self.assertEqual(
            zlib.decompress(chunks[b"IDAT"]), b"\0" + pixels[:4] + b"\0" + pixels[4:]
        )

    def test_rgb_png_and_contact_sheet_preserve_colors(self):
        red = graphics.encode_png(1, 1, bytes((255, 0, 0)))
        green = graphics.encode_png(1, 1, bytes((0, 255, 0)))
        sheet = graphics.contact_sheet([red, green], 2, 10, 10)
        width, height, pixels = graphics.read_preview(sheet)
        self.assertEqual((width, height), (20, 10))
        self.assertEqual(pixels[(4 * 20 + 4) * 3 : (4 * 20 + 4) * 3 + 3], b"\xff\0\0")
        self.assertEqual(pixels[(4 * 20 + 14) * 3 : (4 * 20 + 14) * 3 + 3], b"\0\xff\0")

    def test_font_sheet_preserves_bit_order_and_partial_last_glyph(self):
        width, height, rgb = graphics.read_preview(graphics.font_sheet(b"\x80", 1))
        self.assertEqual((width, height), (20, 20))
        self.assertEqual(
            rgb[(2 * width + 2) * 3 : (2 * width + 2) * 3 + 3], b"\xff" * 3
        )
        self.assertEqual(rgb[(2 * width + 4) * 3 : (2 * width + 4) * 3 + 3], b"\0" * 3)
        self.assertEqual(rgb[(4 * width + 2) * 3 : (4 * width + 2) * 3 + 3], b"\0" * 3)

    def test_palette_matches_all_existing_atari800_reference_screenshots(self):
        root = Path(__file__).resolve().parents[1]
        palette = (root / "util/atari800-pal.pal").read_bytes()
        for game in ("ad2044", "klatwa", "wladcy-ciemnosci"):
            with self.subTest(game=game):
                self.assertEqual(
                    png_chunks((root / game / "img/first-room.png").read_bytes())[
                        b"PLTE"
                    ],
                    palette,
                )
        self.assertEqual(
            graphics.atari_colors((0, 1, 254, 255)),
            [tuple(palette[:3])] * 2 + [tuple(palette[762:765])] * 2,
        )

    def test_invalid_dimensions_palette_indices_and_corruption_are_rejected(self):
        for width, height, pixels, palette in (
            (0, 1, b"", None),
            (1, 1, b"\0", None),
            (1, 1, b"\4", graphics.GRAYSCALE),
        ):
            with self.subTest(width=width, height=height, pixels=pixels):
                with self.assertRaises(ValueError):
                    graphics.encode_png(width, height, pixels, palette)
        raw = bytearray(graphics.encode_png(1, 1, b"\0\0\0"))
        raw[-1] ^= 1
        with self.assertRaises(ValueError):
            graphics.read_preview(raw)


if __name__ == "__main__":
    unittest.main()
