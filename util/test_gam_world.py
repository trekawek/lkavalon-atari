"""Checks for editable boot state, its fixed headers and fresh save generation."""

import hashlib
from pathlib import Path
import shutil
import tempfile
import unittest

import gam_world


ROOT = Path(__file__).resolve().parents[1]
BOOT_DIGESTS = {
    "klatwa": "ebb33b529c13bbffcd5e5679f1ab71a662db1ee4206cbf702f5f7cec0ef99dd6",
    "wladcy-ciemnosci": "ad99d026f39fca30119d79b936c3581af58fb6effd6bead7787c2d319f8feb67",
}


class WorldTests(unittest.TestCase):
    def copy_world(self, game):
        temp = tempfile.TemporaryDirectory()
        self.addCleanup(temp.cleanup)
        source, target = ROOT / game, Path(temp.name)
        for path in gam_world.dependencies(source):
            dest = target / path.relative_to(source)
            dest.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(path, dest)
        return target

    def test_default_world_matches_released_executable_state(self):
        for game, digest in BOOT_DIGESTS.items():
            with self.subTest(game=game):
                result = gam_world.encode_world(ROOT / game)
                self.assertEqual(hashlib.sha256(result).hexdigest(), digest)

    def test_fresh_save_selects_first_room_and_stage_without_changing_boot(self):
        for game in BOOT_DIGESTS:
            with self.subTest(game=game):
                root = ROOT / game
                original, addresses, profile = gam_world._encode(root)
                saved = gam_world.save_state(root)
                self.assertEqual(len(saved), 896)
                expected = bytearray(original)
                for field, value in (("room", 1), ("part", 2)):
                    offset = addresses[field] - profile["base"]
                    expected[offset:offset + 2] = value.to_bytes(2, "little")
                self.assertEqual(saved, bytes(expected).ljust(896, b"\0"))
                self.assertEqual(gam_world.encode_world(root), original)

    def test_puzzle_edit_only_changes_its_cell(self):
        for game in BOOT_DIGESTS:
            with self.subTest(game=game):
                root = self.copy_world(game)
                original, addresses, profile = gam_world._encode(root)
                path = root / "world/puzzles.txt"
                rows = path.read_text().splitlines()
                for index, row in enumerate(rows):
                    data, separator, comment = row.partition("#")
                    if data.split()[:1] == ["00"]:
                        rows[index] = "00 1234" + (" # " + comment.strip() if separator else "")
                        break
                else:
                    self.fail("Puzzle fixture has no cell 00")
                path.write_text("\n".join(rows) + "\n")
                result = gam_world.encode_world(root)
                offset = addresses["puzzles"] + 2 - profile["base"]
                expected = bytearray(original)
                expected[offset:offset + 2] = (1234).to_bytes(2, "little")
                self.assertEqual(result, expected)

    def test_room_list_edit_cannot_overwrite_following_dictionary(self):
        root = self.copy_world("klatwa")
        path = root / "rooms/01/objects.txt"
        path.write_text(path.read_text() + "view 2 " + "0 " * 10 + "\n")
        with self.assertRaisesRegex(ValueError, "fixed state capacity"):
            gam_world.encode_world(root)

    def test_slot_display_must_fit_engine_columns(self):
        root = self.copy_world("wladcy-ciemnosci")
        path = root / "world/powers.txt"
        path.write_text(path.read_text().replace("0 0 0 0 |", "0 0 0 0 |TOO LONG ", 1))
        with self.assertRaisesRegex(ValueError, "exactly 13 glyphs"):
            gam_world.encode_world(root)

    def test_missing_and_duplicate_objects_fail(self):
        root = self.copy_world("klatwa")
        path = root / "rooms/00/objects.txt"
        path.write_text("view 1 12 0 0 0 0 0\n")
        with self.assertRaisesRegex(ValueError, "start at zero"):
            gam_world.encode_world(root)
        path.write_text("view 0 0\nview 0 0\n")
        with self.assertRaisesRegex(ValueError, "duplicate view"):
            gam_world.encode_world(root)


if __name__ == "__main__":
    unittest.main()
