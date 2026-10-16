#!/usr/bin/env python3
"""Exercise authored edits through resource framing and disk allocation."""

from pathlib import Path
import shutil
import tempfile
import unittest

import content
import disk
import pictures
import room_text

ROOT = Path(__file__).resolve().parents[1]


def records(data):
    result = []
    offset = 0
    while offset + 2 <= len(data):
        size = int.from_bytes(data[offset:offset + 2], "little")
        offset += 2
        if size == 0:
            return result
        if offset + size > len(data):
            raise ValueError("Record crosses its containing group")
        result.append(data[offset:offset + size])
        offset += size
    raise ValueError("Missing record terminator")


def read_group(image, number):
    directory = image[16 + 499 * 128:16 + 500 * 128]
    start = 1 + sum(directory[1:number])
    result = bytearray()
    for logical in range(start, start + directory[number]):
        physical = logical + (logical >= 500)
        offset = 16 + (physical - 1) * 128
        result.extend(image[offset:offset + 128])
    return bytes(result)


class ContentTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="ad2044-content-")
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        for name in content.SOURCE_DIRS:
            shutil.copytree(ROOT / name, self.root / name)

    def test_all_room_records_and_fresh_save_are_well_formed(self):
        groups = content.build_groups(self.root)
        for room in list(range(35)) + [36]:
            key = (1, room + 5) if room < 14 else (2, room - 13)
            resources = records(groups[key])
            self.assertGreaterEqual(len(resources), 4)
            self.assertEqual(resources[0], b"\0\0")
            self.assertTrue(resources[2])
        self.assertEqual(len(groups[1, 19]), 896)
        self.assertEqual(groups[1, 19], groups[1, 20])
        self.assertEqual(len(groups[1, 21]), 9 * 512)
        self.assertEqual(groups[1, 21], groups[1, 23])
        for bank in range(6):
            data = groups[1, 21][bank * 512:(bank + 1) * 512]
            self.assertEqual(data[:9], bytes.fromhex("070005000100010000"))
            self.assertGreaterEqual(len(records(data)), 4)
        self.assertEqual(groups[1, 21][6 * 512:], bytes(3 * 512))

    def test_action_and_longer_message_edit_reach_disk(self):
        path = self.root / "rooms/01/actions.txt"
        original = content.build_groups(self.root)
        path.write_text(path.read_text().replace("relative_direction=1", "relative_direction=3")
                        .replace('"KORYTARZ."', '"NOWY KORYTARZ."', 1), encoding="utf-8")
        changed = content.build_groups(self.root)
        self.assertGreater(len(changed[1, 6]), len(original[1, 6]))
        image = content.build_disks(self.root)["build/assets-side1.atr"]
        actions = records(read_group(image, 6))[1]
        self.assertIn(b"NOWY=KORYTARZ.", actions)
        self.assertEqual(actions, room_text.encode_actions(path))
        self.assertEqual({key for key in changed if changed[key] != original[key]}, {(1, 6)})

    def test_hitmap_and_picture_edits_reach_native_resources(self):
        directory = self.root / "rooms/01"
        grid = directory / "base.hit.txt"
        grid.write_text(grid.read_text().replace("............222......", "............322......", 1))
        png = directory / "base.png"
        width, height, pixels, palette = pictures.decode_png(png.read_bytes())
        pixels = bytearray(pixels)
        pixels[0] = (pixels[0] + 1) % 4
        png.write_bytes(pictures.encode_png(width, height, pixels, palette))
        resource = records(content.build_groups(self.root)[1, 6])
        self.assertEqual(resource[3], room_text.encode_hitmap(grid))
        decoded = pictures.decompress(resource[2])
        self.assertEqual(decoded[:4], bytes([10, 8, width // 4, height]))
        self.assertEqual(decoded[4] >> 6, pixels[0])

    def test_text_pages_keep_their_runtime_nesting(self):
        groups = content.build_groups(self.root)
        intro = records(groups[1, 25])
        self.assertEqual(len(intro), 1)
        # Page lists end at their enclosing length; each page has a terminator.
        pages = records(intro[0] + b"\0\0")
        self.assertEqual(len(pages), 16)
        self.assertEqual(records(pages[0])[0], content.message(self.root / "text/intro/00.txt"))
        title = records(groups[1, 3])
        credits = records(title[2] + b"\0\0")
        self.assertEqual(len(credits), 4)
        self.assertEqual(len(records(credits[0])), 8)
        self.assertEqual(credits[1:], [b"\0\0"] * 3)
        ending = records(groups[2, 22])
        pages = records(ending[1] + b"\0\0")
        self.assertEqual(records(pages[0])[0], content.message(self.root / "ending/message.txt"))

    def test_title_spaces_and_explicit_glyphs_remain_distinct(self):
        path = self.root / "text/example.txt"
        path.write_text('"A B\\\\x3D"\n')
        self.assertEqual(content.message(path, title_font=True), b"\1\4A B=")
        self.assertEqual(content.message(path), b"\1\4A=B=")

    def test_missing_assets_and_duplicate_resources_fail(self):
        directory = self.root / "rooms/01"
        png = directory / "base.png"
        png.unlink()
        with self.assertRaisesRegex(ValueError, "base.png"):
            content.dependencies(self.root)
        shutil.copyfile(ROOT / "rooms/01/base.png", png)
        path = directory / "scene.txt"
        path.write_text(path.read_text() + "hitmap 3 base.hit.txt\n")
        with self.assertRaisesRegex(ValueError, "unique"):
            content.build_groups(self.root)

    def test_resource_gaps_and_paths_outside_room_fail(self):
        with self.assertRaisesRegex(ValueError, "contiguous"):
            content.collection({0: b"x", 2: b"y"})
        with self.assertRaisesRegex(ValueError, "escapes"):
            content.source_file(self.root / "rooms/01", "../00/base.png")

    def test_runtime_base_hitmap_and_initial_inventory_limits(self):
        grid = self.root / "rooms/01/base.hit.txt"
        grid.write_text("size 22 1\ngrid\n" + "." * 22 + "\n")
        with self.assertRaisesRegex(ValueError, "21-column"):
            content.build_groups(self.root)
        shutil.copyfile(ROOT / "rooms/01/base.hit.txt", grid)
        state = self.root / "world/initial.txt"
        state.write_text(state.read_text().replace("inventory: 0 0 0 0", "inventory: 126 0 0 0"))
        with self.assertRaisesRegex(ValueError, "without pictures/actions"):
            content.build_groups(self.root)

    def test_link_uses_compiled_program_only_and_current_assets(self):
        content.prepare(self.root)
        code = bytearray(disk.build_disks({})["build/assets-side1.atr"])
        end = 16 + disk.COMPILED_PREFIX_BYTES
        code[16:end] = bytes([0xA5]) * disk.COMPILED_PREFIX_BYTES
        code[end:] = bytes([0xFF]) * (len(code) - end)
        path = self.root / "compiled.atr"
        path.write_bytes(code)
        content.link_program(path, self.root)
        output = (self.root / "build/ad2044-side1.atr").read_bytes()
        template = (self.root / "build/assets-side1.atr").read_bytes()
        self.assertEqual(output[16:end], code[16:end])
        self.assertEqual(output[end:], template[end:])
        self.assertEqual(output[:16], template[:16])


if __name__ == "__main__":
    unittest.main()
