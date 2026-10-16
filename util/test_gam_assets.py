"""Native decoder and readable authoring regressions, without reference ATRs."""

import itertools
from pathlib import Path
import random
import tempfile
import unittest

import gam_assets as assets


class ColumnPackingTests(unittest.TestCase):
    def test_columns_patterns_and_escape(self):
        # This native stream covers all four pattern sizes and a literal $8D.
        stream = bytes([0x8D, 4, 7, 0x8D, 0x42, 1, 2,
                        0x8D, 0x82, 3, 4, 5, 0x8D, 0xC2, 6, 7, 8, 9,
                        0x8D, 1, 0x8D])
        raw, used = assets.decompress_rle(stream, 1, 23)
        self.assertEqual(raw, bytes([7] * 4 + [1, 2] * 2 + [3, 4, 5] * 2 +
                                    [6, 7, 8, 9] * 2 + [0x8D]))
        self.assertEqual(used, len(stream))

    def test_random_roundtrip(self):
        rng = random.Random(917)
        for width, height in ((1, 1), (3, 19), (40, 112), (2, 255)):
            raw = bytes(rng.randrange(256) for _ in range(width * height))
            encoded = assets.compress_rle(raw, width, height)
            decoded, used = assets.decompress_rle(encoded, width, height)
            self.assertEqual(decoded, raw)
            self.assertEqual(used, len(encoded))

    def test_optimal_for_short_columns(self):
        # Independent exhaustive reference: literal bytes or any repeated
        # 1..4-byte pattern, with escape byte requiring an explicit token.
        def minimum(raw):
            if not raw:
                return 0
            best = (1 + minimum(raw[1:])) if raw[0] != 0x8D else 999
            for length in range(1, min(4, len(raw)) + 1):
                for repeat in range(1, len(raw) // length + 1):
                    extent = length * repeat
                    if raw[:extent] == raw[:length] * repeat:
                        best = min(best, length + 2 + minimum(raw[extent:]))
            return best
        for size in range(1, 7):
            for values in itertools.product((0, 1, 0x8D), repeat=size):
                raw = bytes(values)
                self.assertEqual(len(assets.compress_rle(raw, 1, size)), minimum(raw))

    def test_corrupt_streams(self):
        for stream in (b"", b"\x8d", b"\x8d\xc2\x01", b"\x8d\x02\x01",
                       b"\x8d\x00\x01"):
            with self.assertRaises(ValueError):
                assets.decompress_rle(stream, 1, 1)


class PictureAndGridTests(unittest.TestCase):
    def test_png_keeps_pixel_indices_and_header(self):
        source = assets.png.encode_png(8, 3, bytes(range(4)) * 6)
        encoded = assets.encode_picture(source, 4, 9)
        self.assertEqual(encoded[:4], bytes([4, 9, 2, 3]))
        png, x, y = assets.export_picture(encoded)
        self.assertEqual((x, y), (4, 9))
        self.assertEqual(assets.png.decode_png(png)[:3], assets.png.decode_png(source)[:3])
        raw = assets.encode_picture(source, 1, 2, packed=False)
        self.assertEqual(raw[4:], assets.png.pack_pixels(8, 3, bytes(range(4)) * 6))

    def test_hitmap_legend_and_depth_values(self):
        original = {"width": 4, "height": 2, "rows": [[0, 1, 201, 255], [12, 201, 0, 128]]}
        text = assets.export_hitmap(original)
        self.assertIn("=201", text)
        decoded = assets.parse_hitmap(text)
        self.assertEqual(decoded, original)
        body = assets.hitmap_body(decoded)
        self.assertEqual(assets.decompress_rle(body[2:], 4, 2)[0], bytes([0, 1, 201, 255, 12, 201, 0, 128]))
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "region.hit.txt"
            path.write_text(text)
            self.assertEqual(assets.encode_hitmap(path), body)

    def test_bad_grids(self):
        for text in ("size 2 1\ngrid\n...\n", "size 2 2\ngrid\n..\n",
                     "size 0 1\ngrid\n", "size 2 1\nlegend A=256\ngrid\nAA\n",
                     "size 2 1\nlegend A=4 A=5\ngrid\nAA\n"):
            with self.assertRaises(ValueError):
                assets.parse_hitmap(text)


class TextAndActionTests(unittest.TestCase):
    def test_polish_and_exact_glyphs(self):
        raw = b"ZAzoLc=GesLa=JAzn=\x20\x8d\\"
        text = assets.readable_text(raw)
        self.assertEqual(assets.glyph_bytes(text), raw)
        self.assertEqual(assets.glyph_bytes("ŹRÓDŁO"), b"zRoDlO")
        with self.assertRaises(ValueError):
            assets.glyph_bytes("lowercase")

    def test_paired_title_and_inverse(self):
        raw = b"AaUuTtOoRr \x12" + bytes(v | 128 for v in b"RrOoLlAaNnDd PpAaNnTtOo:;Aa")
        text = assets.title_text(raw)
        self.assertIn("{AUTOR }", text)
        self.assertIn("{~ROLAND PANTOŁA}", text)
        self.assertEqual(assets.title_bytes(text), raw)
        all_bytes = bytes(range(256))
        self.assertEqual(assets.title_bytes(assets.title_text(all_bytes)), all_bytes)
        with self.assertRaises(ValueError):
            assets.title_bytes("{lowercase}")

    def test_actions_generate_nested_lengths(self):
        text = ('[00]\napproach control=1\ndescribe\n  message:\n    "ŻÓŁĆ"\n'
                '[01]\nitem 201\ndrop-item\n')
        body = assets.actions_body(assets.parse_actions(text, "klatwa"), "klatwa")
        expected = (assets.record(assets.record(b"\x01") + assets.record(b"\x06\x01\x04zolc") + b"\0\0") +
                    assets.record(assets.record(bytes([201])) + assets.record(b"\x03") + b"\0\0"))
        self.assertEqual(body, expected)

    def test_optional_parameter_empty_collection_and_counted_text(self):
        text = ('[00]\napproach control=1\n'
                'take-set-state redraw_background=7 removed_object=8 inventory_item=9 state_value=1 state_cell=2 argument_6=0\n'
                'give-inventory revealed_object=120 power_id=5 requirement_1=22 requirement_2=56 text="MĄDROŚCI"\n'
                '[01]\nempty\n')
        body = assets.actions_body(assets.parse_actions(text, "wladcy-ciemnosci"), "wladcy-ciemnosci")
        self.assertIn(bytes([70, 120, 5, 22, 56, 8]) + b"MaDROsCI", body)
        self.assertTrue(body.endswith(b"\x02\0\0\0"))

    def test_unknown_and_invalid_arguments_fail(self):
        for text in ("[01]\nempty\n", "[00]\ndrop-item\n", "[00]\nitem 256\n",
                     "[00]\nitem 201\ndrop-item unknown=1\n", "[00]\nempty\ndrop-item\n",
                     "[00]\napproach control=1\ndescribe\n",
                     "[00]\napproach control=1\ndescribe\n  message:\n    3\n"):
            with self.assertRaises(ValueError):
                assets.parse_actions(text, "klatwa")


if __name__ == "__main__":
    unittest.main()
