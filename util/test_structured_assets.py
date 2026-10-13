#!/usr/bin/env python3
"""Test structural encoding, edit propagation and rejected ambiguous edits."""

import copy
import hashlib
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest

import pack_assets
import structured_assets as assets

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("gam_asset_formats", ROOT / "klatwa/tools/asset_formats.py")
gam = importlib.util.module_from_spec(spec)
spec.loader.exec_module(gam)


def doc(kind, **values):
    return {"version": 1, "format": "gam.record-list", "data": {"kind": kind, **values}}


def encode(document, files=None):
    return gam.encode(document, (files or {}).__getitem__)


class GamStructures(unittest.TestCase):
    def test_message_and_enclosing_lengths_follow_edited_text(self):
        document = doc("records", records=[{"kind": "message", "lines": ["ALA=MA", "KOTA\\x9B"]}], terminated=True)
        result = encode(document)
        self.assertEqual(result, b"\x0e\0\x02\x06ALA=MA\x05KOTA\x9b\0\0")
        document["data"]["records"][0]["lines"].append("!")
        edited = encode(document)
        self.assertEqual(int.from_bytes(edited[:2], "little"), 16)
        self.assertEqual(edited[2], 3)
        self.assertTrue(edited.endswith(b"\x01!\0\0"))

    def test_title_page_derives_line_count_and_lengths(self):
        document = doc("title-page", lines=["AB", "C\\xFF"])
        self.assertEqual(encode(document), b"\x01\0\x02\x02\0AB\x02\0C\xff")
        document["data"]["lines"].append("DEFG")
        self.assertEqual(encode(document)[2], 3)
        self.assertTrue(encode(document).endswith(b"\x04\0DEFG"))

    def test_room_reference_and_object_selector_encode_from_semantic_fields(self):
        document = doc("sequence", parts=[
            {"kind": "room-layers", "layers": [{"resource": 3, "subrecord": 0}, {"resource": 7, "subrecord": 2}, {"resource": 45, "subrecord": 4}]},
            {"kind": "object-selectors", "objects": [{"object_id": 9, "action_collection": 4, "arguments": [{"kind": "byte", "value": 11}]}]},
        ])
        self.assertEqual(encode(document), bytes([3, 107, 245, 209, 4, 11]))
        document["data"]["parts"][1]["objects"][0]["object_id"] = 10
        self.assertEqual(encode(document), bytes([3, 107, 245, 210, 4, 11]))

    def hit_map(self):
        return doc("hit-map", width=2, height=4,
                   rows=[[3, 1], [3, 2], [3, 1], [3, 2]],
                   encoding_columns=[[{"pattern_size": 1, "repeat": 4}], [{"literals": 4}]])

    def test_hit_map_grid_is_the_only_value_source(self):
        document = self.hit_map()
        self.assertEqual(encode(document), b"\x02\x04\x8d\x04\x03\x01\x02\x01\x02")
        for row in document["data"]["rows"]:
            row[0] = 7
        self.assertEqual(encode(document)[4], 7)
        document["data"]["rows"][0][0] = 8
        with self.assertRaisesRegex(ValueError, "no longer matches"):
            encode(document)

    def test_hit_map_refuses_truncation_and_unescaped_marker(self):
        document = self.hit_map()
        document["data"]["encoding_columns"][1] = [{"literals": 3}]
        with self.assertRaisesRegex(ValueError, "exhaust"):
            encode(document)
        document = self.hit_map()
        document["data"]["rows"][0][1] = 0x8D
        with self.assertRaisesRegex(ValueError, "escape"):
            encode(document)
        document = self.hit_map()
        document["data"]["encoding_columns"][0][0]["repeat"] = 5
        with self.assertRaisesRegex(ValueError, "crosses"):
            encode(document)

    def test_sprite_structure_uses_external_pixels_and_checks_dimensions(self):
        document = doc("records", records=[{"kind": "sprite-frame", "x_offset": 1, "y_offset": 2, "width_bytes": 2, "height": 3, "pixels": "graphics/frame.bin"}])
        self.assertEqual(gam.dependencies(document), ["graphics/frame.bin"])
        self.assertEqual(encode(document, {"graphics/frame.bin": b"ABCDEF"}), b"\x0a\0\x01\x02\x02\x03ABCDEF")
        with self.assertRaisesRegex(ValueError, "width times height"):
            encode(document, {"graphics/frame.bin": b"ABCDE"})

    def test_vtoc_ranges_generate_bitmap_without_rewriting_declared_counts(self):
        document = doc("vtoc", dos_code=2, declared_total_sectors=1011,
                       declared_free_sectors=707, reserved_header=[0] * 5,
                       bitmap_bytes=2, free_sector_ranges=[[0, 1], [7, 8]])
        self.assertEqual(encode(document), bytes.fromhex("02F303C3020000000000C180"))
        document["data"]["free_sector_ranges"] = [[0, 2], [2, 3]]
        with self.assertRaisesRegex(ValueError, "disjoint"):
            encode(document)

    def test_invalid_versions_fields_text_and_unbounded_residue_fail(self):
        for version in (True, 2):
            document = doc("byte", value=1)
            document["version"] = version
            with self.assertRaises(ValueError):
                encode(document)
        for document in (doc("byte", value=256), doc("byte", value=True),
                         doc("text", text="\\wrong"),
                         doc("residue", segments=[{"offset": 0, "note": "unknown", "unresolved_bytes": [1] * 17}]),
                         doc("residue", segments=[{"offset": 2, "note": "unknown", "unresolved_bytes": [1]}])):
            with self.subTest(document=document), self.assertRaises(ValueError):
                encode(document)


class StructuredDispatcher(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)

    def write(self, path, document):
        target = self.root / path
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(json.dumps(document))

    def test_nested_reference_dependency_and_content_resolution(self):
        (self.root / "pixels.pic").write_bytes(b"ABCD")
        self.write("child.json", doc("file", file="pixels.pic", size=4))
        self.write("parent.json", doc("records", records=[{"kind": "file", "file": "child.json", "size": 4}], terminated=True))
        self.assertEqual(assets.encode_file(self.root, "parent.json"), b"\x04\0ABCD\0\0")
        self.assertEqual({p.name for p in assets.dependencies(self.root, "parent.json")}, {"parent.json", "child.json", "pixels.pic"})

    def test_cycles_escapes_missing_files_and_wrong_size_are_rejected(self):
        self.write("a.json", doc("file", file="b.json", size=1))
        self.write("b.json", doc("file", file="a.json", size=1))
        for operation in (assets.encode_file, assets.dependencies):
            with self.assertRaisesRegex(assets.AssetError, "Cyclic"):
                operation(self.root, "a.json")
        self.write("a.json", doc("file", file="../outside.bin", size=1))
        with self.assertRaisesRegex(assets.AssetError, "escapes"):
            assets.encode_file(self.root, "a.json")
        self.write("a.json", doc("file", file="missing.pic", size=1))
        with self.assertRaisesRegex(assets.AssetError, "missing.pic"):
            assets.encode_file(self.root, "a.json")
        (self.root / "missing.pic").write_bytes(b"AB")
        with self.assertRaisesRegex(assets.AssetError, "expected 1 encoded bytes"):
            assets.encode_file(self.root, "a.json")


class CanonicalGameAssets(unittest.TestCase):
    def test_klatwa_and_wladcy_templates_match_independent_release_baselines(self):
        # Baselines independently compared byte-for-byte against original disks
        # before deleting binary containers; the code prefix is all zeros.
        expected = {
            "klatwa": "bf0f89cbdc2926ac7b839220861035204683ab45c6fd0cfdd6045155baa34915",
            "wladcy-ciemnosci": "86b256ce279c255fefad64482bc65e8357ff9d71f9317ad33efdae5c91ce4153",
        }
        for game, digest in expected.items():
            with self.subTest(game=game):
                disk = pack_assets.build_disks(ROOT / game)["build/assets.atr"]
                self.assertEqual(hashlib.sha256(disk).hexdigest(), digest)
                self.assertFalse(any((ROOT / game / "assets").rglob("*.bin")))
                self.assertFalse(any((ROOT / game / "graphics").rglob("*.gam")))

    def test_ad2044_message_state_and_grid_edits_change_only_their_values(self):
        spec = importlib.util.spec_from_file_location("ad_asset_formats", ROOT / "ad2044/tools/asset_formats.py")
        ad = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(ad)
        root = ROOT / "ad2044"
        cases = [
            ("assets/records/s1-g05-r001.json", "message"),
            ("assets/state/initial-state.json", "state"),
            ("assets/records/s1-g05-r009.json", "grid"),
        ]
        for filename, kind in cases:
            with self.subTest(kind=kind):
                document = json.loads((root / filename).read_text())
                read = lambda name: assets.encode_file(root, name)
                before = ad.encode(document, read)
                if kind == "message":
                    field = document["objects"][2]["actions"][1]["fields"][0]
                    self.assertEqual(field["lines"][0], "KORYTARZ.")
                    field["lines"][0] = "KORYTARZ!"
                elif kind == "state":
                    self.assertEqual(document["fields"][0]["value"], 0)
                    document["fields"][0]["value"] = 1
                else:
                    self.assertEqual(document["object_ids"][0][0], 18)
                    document["object_ids"][0][0] = 19
                after = ad.encode(document, read)
                self.assertEqual(len(after), len(before))
                changed = [i for i, (a, b) in enumerate(zip(before, after)) if a != b]
                self.assertEqual(len(changed), 1)
                if kind == "state":
                    self.assertEqual(changed, [0])
                elif kind == "grid":
                    self.assertEqual(changed, [4])

    def test_saved_room_field_changes_exactly_its_stored_byte(self):
        for game in ("klatwa", "wladcy-ciemnosci"):
            with self.subTest(game=game):
                source = ROOT / game / "assets/state/saved-game.json"
                document = json.loads(source.read_text())
                before = encode(document)
                state = next(part for part in document["data"]["parts"] if part.get("name") == "CURRENT-ROOM")
                state["parts"][0]["values"][0] ^= 1
                after = encode(document)
                self.assertEqual([i for i, (a, b) in enumerate(zip(before, after)) if a != b], [13])
                self.assertEqual(len(after), 896)

    def test_real_inline_message_edit_changes_one_encoded_glyph(self):
        source = ROOT / "klatwa/assets/resources/g04-r000.json"
        document = json.loads(source.read_text())
        record = document["data"]["records"][3]["records"][1]
        self.assertEqual(record["dispatch_id"], 6)
        self.assertEqual(record["arguments"][0]["lines"], ["TEKOWE=DRZWI"])
        before = encode(document)
        record["arguments"][0]["lines"][0] = "TEKOWE=DRZWA"
        after = encode(document)
        changes = [i for i, (a, b) in enumerate(zip(before, after)) if a != b]
        self.assertEqual(len(changes), 1)
        self.assertEqual((before[changes[0]], after[changes[0]]), (ord("I"), ord("A")))


if __name__ == "__main__":
    unittest.main()
