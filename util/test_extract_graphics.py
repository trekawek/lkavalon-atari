#!/usr/bin/env python3
"""Validate authored graphic content independently of old disk placement."""

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
import gam_assets
import gam_content


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


class LaterAuthoredGraphicsChecks(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.references = {}
        for game in ("klatwa", "wladcy-ciemnosci"):
            name = extraction.REFERENCES[game][0][0]
            disk = read_reference(extraction.ROOT / game / "reference" / name)
            files, _ = extraction.extract_game(game, [disk])
            cls.references[game] = disk, files

    def copy_sources(self, game, directory):
        source = extraction.ROOT / game
        root = Path(directory) / game
        for path in gam_content.dependencies(source):
            target = root / path.relative_to(source)
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(path, target)
        return root

    def check(self, root):
        disk, files = self.references[root.name]
        return extraction.check_gam_authored_graphics(root, files, disk)

    def test_current_sources_match_without_catalogs_or_packed_copies(self):
        for game, count in (("klatwa", 407), ("wladcy-ciemnosci", 542)):
            with self.subTest(game=game), tempfile.TemporaryDirectory() as tmp:
                root = self.copy_sources(game, tmp)
                self.assertFalse((root / "assets").exists())
                self.assertFalse((root / "graphics").exists())
                self.assertEqual(self.check(root), count)
                self.assertFalse((root / "build").exists())

    def test_changed_picture_sprite_font_cursor_or_hitmap_is_detected(self):
        for game in self.references:
            for filename in ("stages/1/art/003-0.png", "player/0/0.png",
                             "interface/game.fnt", "interface/cursor.pmg", "stages/1/art/003-1.hit.txt"):
                with self.subTest(game=game, file=filename), tempfile.TemporaryDirectory() as tmp:
                    root = self.copy_sources(game, tmp)
                    path = root / filename
                    if filename.endswith(".hit.txt"):
                        document = gam_assets.parse_hitmap(path.read_text())
                        document["rows"][0][0] ^= 1
                        path.write_text(gam_assets.export_hitmap(document))
                    elif path.suffix == ".png":
                        width, height, pixels, palette = gam_assets.png.decode_png(path.read_bytes())
                        changed = bytearray(pixels)
                        changed[0] ^= 1
                        path.write_bytes(gam_assets.png.encode_png(width, height, changed, palette))
                    else:
                        changed = bytearray(path.read_bytes())
                        changed[0] ^= 1
                        path.write_bytes(changed)
                    with self.assertRaisesRegex(ValueError, "graphic differs"):
                        self.check(root)

    def test_added_picture_is_detected_even_when_its_pixels_match_an_existing_one(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self.copy_sources("klatwa", tmp)
            path = root / "interface/art.txt"
            path.write_text(path.read_text() + "picture 99 - art/002-0.png 0 0\n")
            with self.assertRaisesRegex(ValueError, "resource IDs differ"):
                self.check(root)


if __name__ == '__main__':
    unittest.main()
