"""Build and editing checks for the two later games' authored content."""

from pathlib import Path
import shutil
import tempfile
import unittest

import gam_assets as assets
import gam_content as content
import gam_program as program

ROOT = Path(__file__).resolve().parents[1]
SOURCE_DIRS = ("world", "rooms", "stages", "items", "interface", "player", "text", "music")


class ContentTests(unittest.TestCase):
    def copy(self, game):
        temp = tempfile.TemporaryDirectory()
        self.addCleanup(temp.cleanup)
        root = Path(temp.name) / game
        for name in SOURCE_DIRS:
            if (ROOT / game / name).exists():
                shutil.copytree(ROOT / game / name, root / name)
        return root

    def test_source_only_disks_have_blank_program_and_generated_directory(self):
        for game in content.GAMES:
            with self.subTest(game=game):
                root = self.copy(game)
                image = content.build_disks(root)["build/assets.atr"]
                self.assertEqual(len(image), 133136)
                self.assertEqual(image[:6], bytes.fromhex("960280208000"))
                self.assertFalse(any(image[16:16 + 32000]))
                directory = image[16 + 499 * 128:16 + 500 * 128]
                self.assertEqual(directory[:3], bytes((3, 255, 105)))
                self.assertEqual(directory[8], 7)
                self.assertFalse(any(directory[9:]))
                self.assertEqual(image[15], 0)
                deps = content.dependencies(root)
                self.assertIn(root / "world/map.txt", deps)
                self.assertNotIn(".atr", {p.suffix for p in deps})

    def test_map_edit_changes_the_room_selector_destination(self):
        for game in content.GAMES:
            with self.subTest(game=game):
                root = self.copy(game)
                links = content.navigation(root)
                key = next(iter(links))
                before = content.room(root, key[0], links)[1]
                path = root / "world/map.txt"
                text = path.read_text()
                old = next(line for line in text.splitlines()
                           if line and not line.startswith("#"))
                fields = old.split()
                target = 1 if int(fields[2]) != 1 else 2
                fields[2] = str(target)
                path.write_text(text.replace(old, " ".join(fields), 1))
                after = content.room(root, key[0], content.navigation(root))[1]
                self.assertEqual(len(before), len(after))
                self.assertEqual(sum(a != b for a, b in zip(before, after)), 1)

    def test_picture_edit_recompresses_without_an_encoding_plan(self):
        root = self.copy("klatwa")
        old = content.art(root, "stages/1")[3]
        path = root / "stages/1/art/003-0.png"
        w, h, pixels, palette = assets.png.decode_png(path.read_bytes())
        edited = bytearray(pixels)
        edited[0] = (edited[0] + 1) % 4
        path.write_bytes(assets.png.encode_png(w, h, edited, palette))
        new = content.art(root, "stages/1")[3]
        self.assertNotEqual(old, new)
        size = int.from_bytes(new[:2], "little")
        png, _, _ = assets.export_picture(new[2:2 + size])
        self.assertEqual(assets.png.decode_png(png)[2], edited)

    def test_map_connections_cannot_be_silently_unused_or_missing(self):
        root = self.copy("klatwa")
        path = root / "world/map.txt"
        original = path.read_text()
        path.write_text(original + "1 55 2 north\n")
        with self.assertRaisesRegex(ValueError, "Unused world/map.txt"):
            content.build_groups(root)
        row = next(line for line in original.splitlines()
                   if line and not line.startswith("#"))
        path.write_text(original.replace(row, "", 1))
        with self.assertRaisesRegex(ValueError, "missing world/map.txt"):
            content.build_groups(root)
        path.write_text("1 1 23 enter\n")
        with self.assertRaisesRegex(ValueError, "cannot switch stages"):
            content.navigation(root)

    def test_text_ids_cannot_shift_when_a_file_is_deleted(self):
        root = self.copy("wladcy-ciemnosci")
        (root / "interface/pages/01.txt").unlink()
        with self.assertRaisesRegex(ValueError, "consecutive numbered"):
            content.title_pages(root)
        (root / "text/stage-1/00/001.txt").unlink()
        with self.assertRaisesRegex(ValueError, "consecutive numbered"):
            content.message_banks(root, 1)
        shutil.rmtree(root / "text/stage-2/01")
        with self.assertRaisesRegex(ValueError, "expected message banks"):
            content.message_banks(root, 2)

    def test_cached_dependency_check_rejects_missing_picture(self):
        root = self.copy("wladcy-ciemnosci")
        (root / "stages/1/art/003-0.png").unlink()
        with self.assertRaises(FileNotFoundError):
            content.dependencies(root)

    def test_shared_picture_outside_default_folders_is_a_build_dependency(self):
        root = self.copy("klatwa")
        shared = root / "shared/wall.png"
        shared.parent.mkdir()
        shutil.copyfile(root / "stages/1/art/003-0.png", shared)
        table = root / "stages/1/art.txt"
        table.write_text(table.read_text().replace("art/003-0.png", "../../shared/wall.png"))
        self.assertIn(shared, content.dependencies(root))
        before = content.build_disks(root)["build/assets.atr"]
        width, height, pixels, palette = assets.png.decode_png(shared.read_bytes())
        changed = bytearray(pixels)
        changed[0] ^= 1
        shared.write_bytes(assets.png.encode_png(width, height, changed, palette))
        self.assertNotEqual(before, content.build_disks(root)["build/assets.atr"])

    def test_room_notice_cannot_escape_the_game_directory(self):
        root = self.copy("klatwa")
        outside = root.parent / "outside.txt"
        outside.write_text('"TEST"\n')
        scene = root / "rooms/01/scene.txt"
        scene.write_text(scene.read_text().replace("notice none", "notice " + str(outside)))
        with self.assertRaisesRegex(ValueError, "escapes game directory"):
            content.dependencies(root)

    def test_shared_notice_and_animation_are_build_dependencies(self):
        root = self.copy("klatwa")
        shared = root / "shared"
        shared.mkdir()
        notice = shared / "notice.txt"
        notice.write_text('"TEST"\n')
        frame = shared / "frame.png"
        shutil.copyfile(root / "player/0/0.png", frame)
        scene = root / "rooms/01/scene.txt"
        scene.write_text(scene.read_text().replace("notice none", "notice ../../shared/notice.txt"))
        table = root / "player/frames.txt"
        table.write_text(table.read_text().replace("0/0.png", "../shared/frame.png"))
        dependencies = content.dependencies(root)
        self.assertIn(notice, dependencies)
        self.assertIn(frame, dependencies)

    def test_bank_expansion_cannot_reach_atari_hardware(self):
        for game in content.GAMES:
            with self.subTest(game=game):
                groups = {3: bytes(14337), 8: bytes(896)}
                with self.assertRaisesRegex(ValueError, "bank workspace"):
                    content.allocate(ROOT / game, groups)

    def test_disk_growth_cannot_reach_sectors_intercepted_by_loader(self):
        # All individual banks fit RAM, but their aggregate reaches the
        # on-disk range intercepted by the original copy-protection patch.
        groups = {3: bytes(14336), 4: bytes(14336), 5: bytes(5000),
                  6: bytes(14336), 7: bytes(5000), 8: bytes(896)}
        with self.assertRaisesRegex(ValueError, "sector 767"):
            content.allocate(ROOT / "wladcy-ciemnosci", groups)

    def test_link_accepts_edited_code_and_keeps_generated_resources(self):
        for game in content.GAMES:
            with self.subTest(game=game):
                image = bytes(content.empty_disk())
                compiled = bytearray(image)
                count = program.boot_bytes(game)
                compiled[16:20] = bytes((0, count // 128, 0x80, 0x0E))
                compiled[100] = 42
                linked = content.link_program(image, bytes(compiled), game)
                self.assertEqual(linked[16:16 + count], compiled[16:16 + count])
                self.assertEqual(linked[16 + count:], image[16 + count:])
                with self.assertRaisesRegex(ValueError, "executable changed"):
                    program.verify_program(linked, game)
                compiled[17] -= 1
                with self.assertRaisesRegex(ValueError, "boot header"):
                    content.link_program(image, bytes(compiled), game)

    def test_wladcy_music_overlap_is_checked_and_only_disk_bytes_are_written(self):
        root = self.copy("wladcy-ciemnosci")
        path = root / "music/gameplay.cmc"
        data = path.read_bytes()
        self.assertEqual(content.cmc(root), data[:-6])
        path.write_bytes(data[:-1] + b"\0")
        with self.assertRaisesRegex(ValueError, "restored overlap"):
            content.cmc(root)

    def test_art_paths_and_duplicate_resources_are_rejected(self):
        root = self.copy("klatwa")
        path = root / "stages/1/art.txt"
        original = path.read_text()
        path.write_text(original + "placeholder 2 - 45\n")
        with self.assertRaisesRegex(ValueError, "Duplicate"):
            content.art(root, "stages/1")
        path.write_text("picture 2 - ../../../outside.png 0 0\n")
        with self.assertRaisesRegex(ValueError, "escapes"):
            content.art(root, "stages/1")


if __name__ == "__main__":
    unittest.main()
