#!/usr/bin/env python3
"""Check native asset packing, edit propagation and disk-boundary failures."""

import copy
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

import pack_assets as pack
import gam_assets
import gam_content as content

ROOT = Path(__file__).resolve().parents[1]
GAMES = ("klatwa", "wladcy-ciemnosci")


def copy_inputs(game, destination):
    source = ROOT / game
    for path in content.dependencies(source):
        target = destination / path.relative_to(source)
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(path, target)


class CurrentAssetBuilds(unittest.TestCase):
    def test_make_rejects_invalid_content_even_with_existing_targets(self):
        for game in GAMES:
            with self.subTest(game=game), tempfile.TemporaryDirectory() as tmp:
                root = Path(tmp)
                isolated = root / game
                copy_inputs(game, isolated)
                shutil.copyfile(ROOT / game / "Makefile", isolated / "Makefile")
                for name in ("gam_content", "gam_assets", "gam_world", "gam_program"):
                    target = root / f"util/{name}.py"
                    target.parent.mkdir(exist_ok=True)
                    shutil.copyfile(ROOT / f"util/{name}.py", target)
                (root / "ad2044/tools").mkdir(parents=True)
                shutil.copyfile(ROOT / "ad2044/tools/pictures.py", root / "ad2044/tools/pictures.py")
                (isolated / "world/map.txt").write_text("invalid map row\n")
                (isolated / "build").mkdir()
                (isolated / "build/assets.atr").touch()
                result = subprocess.run(["make", "assets"], cwd=isolated,
                                        capture_output=True, text=True)
                self.assertNotEqual(result.returncode, 0)
                self.assertIn("Cannot read authored content dependencies", result.stderr)

    def test_font_music_and_player_edits_reach_the_generated_disk(self):
        for game in GAMES:
            for filename in ("music/title.cmc", "interface/game.fnt", "player/0/0.png"):
                with self.subTest(game=game, file=filename), tempfile.TemporaryDirectory() as tmp:
                    isolated = Path(tmp) / game
                    copy_inputs(game, isolated)
                    before = content.build_disks(isolated)["build/assets.atr"]
                    path = isolated / filename
                    if path.suffix == ".png":
                        width, height, pixels, palette = gam_assets.png.decode_png(path.read_bytes())
                        changed = bytearray(pixels)
                        changed[0] ^= 1
                        path.write_bytes(gam_assets.png.encode_png(width, height, changed, palette))
                    else:
                        changed = bytearray(path.read_bytes())
                        changed[100] ^= 1
                        path.write_bytes(changed)
                    after = content.build_disks(isolated)["build/assets.atr"]
                    self.assertEqual(len(before), len(after))
                    self.assertEqual(sum(a != b for a, b in zip(before, after)), 1)


class PackingFailures(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        (self.root / "image.bin").write_bytes(b"ABCDEF")
        self.manifest = {
            "version": 1,
            "disks": [{
                "output": "build/test.atr", "sector_size": 128,
                "sector_count": 1040, "compiled_prefix_bytes": 128,
                "disk_id": 3, "group_sector_counts": [255, 105, 1],
                "writes": [{
                    "label": "picture", "spans": [{"offset": 144, "length": 6}],
                    "parts": [{"file": "image.bin", "size": 6}],
                }],
            }],
        }
        self.disk = self.manifest["disks"][0]
        self.write = self.disk["writes"][0]

    def build(self):
        return pack.build_disks(self.root, self.manifest)["build/test.atr"]

    def test_record_can_cross_reserved_directory_using_explicit_spans(self):
        directory = 16 + 499 * 128
        self.write["record16"] = True
        self.write["spans"] = [
            {"offset": directory - 3, "length": 3},
            {"offset": directory + 128, "length": 5},
        ]
        result = self.build()
        self.assertEqual(result[directory - 3:directory], b"\x06\x00A")
        self.assertEqual(result[directory + 128:directory + 133], b"BCDEF")
        self.assertEqual(result[directory:directory + 128], bytes([3, 255, 105, 1]) + bytes(124))
        self.assertEqual(result[16:144], bytes(128))

    def test_missing_asset_fails_without_reference_fallback(self):
        (self.root / "image.bin").unlink()
        with self.assertRaisesRegex(pack.AssetError, "image.bin"):
            self.build()

    def test_wrong_size_asset_is_rejected(self):
        (self.root / "image.bin").write_bytes(b"short")
        with self.assertRaisesRegex(pack.AssetError, "expected 6 bytes, found 5"):
            self.build()

    def test_invalid_counted_record_is_rejected(self):
        self.write["parts"][0]["format"] = "counted16"
        with self.assertRaisesRegex(pack.AssetError, "invalid counted16"):
            self.build()

    def test_overlapping_writes_are_rejected_even_when_bytes_match(self):
        self.disk["writes"].append(copy.deepcopy(self.write))
        with self.assertRaisesRegex(pack.AssetError, "span overlaps .*picture"):
            self.build()

    def test_header_prefix_directory_and_disk_bounds_are_protected(self):
        for offset, reason in ((0, "header"), (143, "prefix"),
                               (16 + 499 * 128 - 1, "directory"),
                               (133135, "bounds")):
            with self.subTest(offset=offset):
                self.write["spans"][0]["offset"] = offset
                with self.assertRaisesRegex(pack.AssetError, reason):
                    self.build()

    def test_span_sizes_cannot_drop_or_invent_bytes(self):
        for length in (5, 7):
            with self.subTest(length=length):
                self.write["spans"][0]["length"] = length
                with self.assertRaisesRegex(pack.AssetError, "spans"):
                    self.build()

    def test_truncation_requires_validation_of_omitted_bytes(self):
        self.write["parts"][0]["take"] = 3
        self.write["spans"][0]["length"] = 3
        with self.assertRaisesRegex(pack.AssetError, "require expected_tail_hex"):
            self.build()

    def test_paths_cannot_escape_the_game_directory(self):
        self.write["parts"][0]["file"] = "../image.bin"
        with self.assertRaisesRegex(pack.AssetError, "escapes"):
            self.build()

    def test_unknown_manifest_version_is_rejected(self):
        self.manifest["version"] = 2
        with self.assertRaisesRegex(pack.AssetError, "version 2"):
            self.build()


if __name__ == "__main__":
    unittest.main()
