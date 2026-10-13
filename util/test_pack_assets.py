#!/usr/bin/env python3
"""Check native asset packing, edit propagation and disk-boundary failures."""

import copy
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

import pack_assets as pack

ROOT = Path(__file__).resolve().parents[1]
REFERENCES = {
    "ad2044": {
        "build/assets-side1.atr": ("ad2044-side1.atr", 33959),
        "build/ad2044-side2.atr": ("ad2044-side2.atr", 0),
    },
    "klatwa": {"build/assets.atr": ("klatwa-v1.atr", 32000)},
    "wladcy-ciemnosci": {"build/assets.atr": ("wladcy-ciemnosci.atr", 32000)},
}


def copy_inputs(game, destination):
    source = ROOT / game
    for path in pack.dependencies(source):
        target = destination / path.relative_to(source)
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(path, target)


class ReleaseAssets(unittest.TestCase):
    @unittest.skipUnless(shutil.which("make"), "GNU Make is required")
    def test_make_rejects_invalid_manifest_even_with_existing_targets(self):
        for game, outputs in REFERENCES.items():
            with self.subTest(game=game), tempfile.TemporaryDirectory() as tmp:
                root = Path(tmp)
                isolated = root / game
                (isolated / "assets").mkdir(parents=True)
                (root / "util").mkdir()
                shutil.copyfile(ROOT / game / "Makefile", isolated / "Makefile")
                shutil.copyfile(ROOT / "util/pack_assets.py", root / "util/pack_assets.py")
                (isolated / "assets/layout.json").write_text("{broken")
                for output in outputs:
                    path = isolated / output
                    path.parent.mkdir(exist_ok=True)
                    path.touch()
                result = subprocess.run(["make", "assets"], cwd=isolated,
                                        capture_output=True, text=True)
                self.assertNotEqual(result.returncode, 0)
                self.assertIn("Cannot read assets/layout.json dependencies", result.stderr)

    def test_templates_from_only_declared_inputs_match_every_original_sector(self):
        for game, outputs in REFERENCES.items():
            with self.subTest(game=game), tempfile.TemporaryDirectory() as tmp:
                isolated = Path(tmp) / game
                copy_inputs(game, isolated)
                self.assertEqual(list(isolated.rglob("*.atr")), [])
                self.assertFalse((isolated / "reference").exists())
                self.assertFalse((isolated / "build").exists())
                actual = pack.build_disks(isolated)
                self.assertEqual(set(actual), set(outputs))
                for output, (reference, prefix) in outputs.items():
                    expected = bytearray((ROOT / game / "reference" / reference).read_bytes())
                    expected[15] = 0  # writable ATR metadata
                    expected[16:16 + prefix] = bytes(prefix)
                    self.assertEqual(actual[output], expected, (game, output))

    def test_same_size_native_edits_change_only_the_corresponding_disk_byte(self):
        cases = [
            ("ad2044", "graphics/packed/s1-g03-r000.bin", 10,
             "build/assets-side1.atr", 35856 + 10),
            ("klatwa", "music/title.cmc", 100,
             "build/assets.atr", 0xE01C + 100),
            ("klatwa", "graphics/fonts/gameplay.bin", 100,
             "build/assets.atr", 0xC3EE + 100),
            ("klatwa", "graphics/sprites/direction-0-frame-0.bin", 20,
             "build/assets.atr", 0xCED6 + 20),
            ("wladcy-ciemnosci", "music/title.cmc", 100,
             "build/assets.atr", 0xDB70 + 100),
            ("wladcy-ciemnosci", "graphics/fonts/gameplay.fnt", 100,
             "build/assets.atr", 0xBC86 + 100),
            ("wladcy-ciemnosci", "graphics/sprites/direction-0-frame-0.bin", 20,
             "build/assets.atr", 0xC94F + 20),
        ]
        for game, filename, index, output, offset in cases:
            with self.subTest(game=game, file=filename), tempfile.TemporaryDirectory() as tmp:
                isolated = Path(tmp) / game
                copy_inputs(game, isolated)
                before = pack.build_disks(isolated)
                asset = isolated / filename
                data = bytearray(asset.read_bytes())
                data[index] ^= 1
                asset.write_bytes(data)
                after = pack.build_disks(isolated)
                expected = bytearray(before[output])
                expected[offset] ^= 1
                self.assertEqual(after[output], expected)
                for other in before.keys() - {output}:
                    self.assertEqual(after[other], before[other])

    def test_restored_cmc_bytes_and_load_header_cannot_be_silently_discarded(self):
        with tempfile.TemporaryDirectory() as tmp:
            isolated = Path(tmp) / "wladcy-ciemnosci"
            copy_inputs("wladcy-ciemnosci", isolated)
            path = isolated / "music/gameplay.cmc"
            original = path.read_bytes()
            for index, message in ((-1, "discarded tail changed"), (2, "fixed header changed")):
                with self.subTest(index=index):
                    data = bytearray(original)
                    data[index] ^= 1
                    path.write_bytes(data)
                    with self.assertRaisesRegex(pack.AssetError, message):
                        pack.build_disks(isolated)


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
