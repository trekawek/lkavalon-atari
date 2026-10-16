#!/usr/bin/env python3
"""Validate AD's authored graphic content independently of old disk placement."""

from pathlib import Path
import shutil
import sys
import tempfile
import unittest

import extract_graphics as extraction
from reference_media import read_reference

sys.path.insert(0, str(extraction.ROOT / 'ad2044/tools'))
import content
import pictures


class AuthoredGraphicsChecks(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.root = extraction.ROOT / 'ad2044'
        disks = [read_reference(cls.root / 'reference' / name)
                 for name, _ in extraction.REFERENCES['ad2044']]
        cls.files, _ = extraction.extract_game('ad2044', disks)

    def copy_sources(self, destination):
        for path in content.dependencies(self.root):
            target = destination / path.relative_to(self.root)
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(path, target)

    def test_current_sources_match_without_legacy_catalogs_or_packed_files(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self.copy_sources(root)
            self.assertFalse((root / 'graphics').exists())
            self.assertFalse((root / 'assets').exists())
            count = extraction.check_ad_authored_graphics(root, self.files)
            self.assertEqual(count, 331)
            self.assertFalse((root / 'build').exists())

    def test_changed_pixel_font_or_cursor_is_detected(self):
        for filename in ('rooms/01/base.png', 'interface/game.fnt', 'interface/cursor.pmg'):
            with self.subTest(file=filename), tempfile.TemporaryDirectory() as tmp:
                root = Path(tmp)
                self.copy_sources(root)
                path = root / filename
                if path.suffix == '.png':
                    width, height, pixels, palette = pictures.decode_png(path.read_bytes())
                    changed = bytearray(pixels)
                    changed[0] ^= 1
                    data = pictures.encode_png(width, height, changed, palette)
                else:
                    data = bytearray(path.read_bytes())
                    data[0] ^= 1
                path.write_bytes(data)
                with self.assertRaisesRegex(ValueError, 'graphic differs'):
                    extraction.check_ad_authored_graphics(root, self.files)

    def test_preview_palette_does_not_change_atari_pixel_identities(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self.copy_sources(root)
            path = root / 'rooms/01/base.png'
            width, height, pixels, _ = pictures.decode_png(path.read_bytes())
            path.write_bytes(pictures.encode_png(width, height, pixels, pictures.GRAYSCALE))
            self.assertEqual(extraction.check_ad_authored_graphics(root, self.files), 331)

    def test_added_graphic_resource_is_not_silently_outside_the_check(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self.copy_sources(root)
            path = root / 'rooms/01/scene.txt'
            lines = path.read_text()
            lines += 'picture 4 base.png 10 8 24,F8,FD,A2,00 3\nhitmap 5 base.hit.txt\n'
            path.write_text(lines)
            with self.assertRaisesRegex(ValueError, 'resource IDs differ'):
                extraction.check_ad_authored_graphics(root, self.files)


if __name__ == '__main__':
    unittest.main()
