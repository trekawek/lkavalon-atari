"""Reject authoring edits that would overwrite the unchanged engine's RAM."""

from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import gam_assets
import gam_content
import gam_limits
import gam_world


ROOT = Path(__file__).resolve().parents[1]


class RuntimeLimitTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.groups = {game: gam_content.build_groups(ROOT / game)
                      for game in gam_content.GAMES}

    def test_both_authored_games_fit_all_runtime_workspaces(self):
        for game, groups in self.groups.items():
            with self.subTest(game=game):
                gam_limits.validate_groups(ROOT / game, groups)

    def test_item_bank_cannot_overlap_live_hit_map(self):
        for game, limit in (("klatwa", 1830), ("wladcy-ciemnosci", 5000)):
            with self.subTest(game=game):
                groups = dict(self.groups[game])
                groups[5] = groups[5].ljust(limit + 1, b"\0")
                with self.assertRaisesRegex(ValueError, "item bank before hit-map RAM"):
                    gam_limits.validate_groups(ROOT / game, groups)

    def test_klatwa_bank_reserves_zoom_backup(self):
        groups = dict(self.groups["klatwa"])
        groups[4] = groups[4].ljust(0x36EB, b"\0")
        with self.assertRaisesRegex(ValueError, "banked RAM"):
            gam_limits.validate_groups(ROOT / "klatwa", groups)

    def test_wladcy_action_collection_cannot_reach_item_bank(self):
        groups = dict(self.groups["wladcy-ciemnosci"])
        scene = gam_limits.records(groups[4], "scene")
        actions = gam_limits.records(scene[0], "actions")
        actions[1] = bytes(46)
        scene[0] = gam_assets.records(actions)
        groups[4] = gam_assets.records(scene)
        with self.assertRaisesRegex(ValueError, "action collection 1"):
            gam_limits.validate_groups(ROOT / "wladcy-ciemnosci", groups)

    def test_picture_cannot_write_beyond_scanline(self):
        groups = dict(self.groups["wladcy-ciemnosci"])
        scene = gam_limits.records(groups[4], "scene")
        art = gam_limits.records(scene[3], "art")
        art[0] = bytes([40]) + art[0][1:]
        scene[3] = gam_assets.records(art)
        groups[4] = gam_assets.records(scene)
        with self.assertRaisesRegex(ValueError, "Atari bitmap"):
            gam_limits.validate_groups(ROOT / "wladcy-ciemnosci", groups)

    def test_decoded_item_cannot_overwrite_resource_cache(self):
        groups = dict(self.groups["wladcy-ciemnosci"])
        items = gam_limits.records(groups[5], "items")
        items[4] = bytes([1, 1, 4, 20]) + gam_assets.compress_rle(bytes(80), 4, 20)
        groups[5] = gam_assets.records(items)
        with self.assertRaisesRegex(ValueError, "decoded picture"):
            gam_limits.validate_groups(ROOT / "wladcy-ciemnosci", groups)

    def test_room_selector_requires_an_existing_action_collection(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "actions.txt"
            # Duplicate zones are intentional in some original descriptors.
            path.write_text("object 3 1 destination\nobject 3 2 9\n")
            gam_limits._scene_collections(path, 3)
            with self.assertRaisesRegex(ValueError, "action collection 2 does not exist"):
                gam_limits._scene_collections(path, 2)

    def test_reserved_item_cannot_be_drawn_in_starting_inventory(self):
        original = gam_world.read_objects

        def initial_objects(path):
            result = original(path)
            if path.parent.name == "00":
                result[1] = bytes((12, 202, 0, 0, 0, 0))
            return result

        # W's slot 202 has coordinates and an empty action record, but resource
        # 2 contains messages. It is not a drawable inventory item.
        with patch.object(gam_world, "read_objects", side_effect=initial_objects):
            with self.assertRaisesRegex(ValueError, "Initial inventory item 202: missing item art"):
                gam_limits.validate_groups(ROOT / "wladcy-ciemnosci", self.groups["wladcy-ciemnosci"])


if __name__ == "__main__":
    unittest.main()
