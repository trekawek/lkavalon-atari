#!/usr/bin/env python3
"""State-layout and edit-propagation tests without original disk inputs."""

import copy
from pathlib import Path
import shutil
import tempfile
import unittest

import world

ROOT = Path(__file__).resolve().parents[1]


class WorldTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory(prefix="ad2044-world-")
        self.addCleanup(self.directory.cleanup)
        self.root = Path(self.directory.name)
        shutil.copytree(ROOT / "world", self.root / "world")
        self.rooms = [{"id": i, "views": {0: [0]}} for i in range(37)]
        self.rooms[0]["views"] = {0: [0, 0, 0], 1: [0, 5, 6, 102, 103, 0]}
        for room in self.rooms:
            path = self.root / f"rooms/{room['id']:02d}/room.txt"
            path.parent.mkdir(parents=True)
            path.write_text(world.render_room(room), "ascii")

    def test_live_headers_and_sector_rounded_code(self):
        state = world.build_state(self.root)
        self.assertEqual(len(state), 896)
        def at(address, length):
            return state[address - world.BASE:address - world.BASE + length]
        # DOVAR's ENERGY code field and the ARRAY DOES> thread must survive a load.
        self.assertEqual(at(0x4377, 4), bytes.fromhex("99141E00"))
        self.assertEqual(at(0x4584, 4), bytes.fromhex("D8184441"))
        self.assertEqual(at(0x46DE, 13), bytes.fromhex("4114A512A512A513B712B71270"))
        self.assertEqual(at(0x4565, 2), b"\x5a\x00")
        self.assertEqual(at(0x467C + 37, 90 - 37), bytes(90 - 37))

    def test_room_round_trip_and_zero_slots(self):
        parsed = world.read_world(self.root)
        self.assertEqual(parsed[0]["views"], self.rooms[0]["views"])
        self.assertEqual(parsed[0]["map"]["facing"], "east")
        state = world.build_state(self.root)
        start = world.OBJECT_LIST_START - world.BASE
        # First room contains two u16-length lists, including all empty slots.
        self.assertEqual(state[start:start+15], bytes.fromhex("0D0003000000000600000506666700"))

    def test_energy_edit_changes_only_its_cell(self):
        before = world.build_state(self.root)
        path = self.root / "world/initial.txt"
        path.write_text(path.read_text("ascii").replace("energy 30", "energy 300"), "ascii")
        after = world.build_state(self.root)
        self.assertEqual([i + world.BASE for i, (a, b) in enumerate(zip(before, after)) if a != b],
                         [0x4379, 0x437A])
        self.assertEqual(after[0x4379-world.BASE:0x437B-world.BASE], b"\x2c\x01")

    def test_authored_starting_room_changes_only_its_state_cell(self):
        for source in world.dependencies(ROOT):
            destination = self.root / source.relative_to(ROOT)
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(source, destination)
        before = world.build_state(self.root)
        path = self.root / "world/initial.txt"
        text = path.read_text()
        self.assertIn("current-room 0", text)
        path.write_text(text.replace("current-room 0", "current-room 1"))
        after = world.build_state(self.root)
        self.assertEqual(before[0], 0)
        self.assertEqual(after[0], 1)
        self.assertEqual(before[1:], after[1:])

    def test_coordinate_and_exit_edit_change_separate_fields(self):
        before = world.build_state(self.root)
        path = self.root / "world/map.txt"
        content = path.read_text("ascii").splitlines()
        for n, line in enumerate(content):
            if line.startswith("00 "):
                values = line.split()
                values[2] = "1"
                values[-1] = "right,left"
                content[n] = " ".join(values)
        path.write_text("\n".join(content) + "\n", "ascii")
        after = world.build_state(self.root)
        self.assertEqual([i + world.BASE for i, (a, b) in enumerate(zip(before, after)) if a != b],
                         [0x4588, 0x467C])
        self.assertEqual(after[0x4588-world.BASE], 0x12)
        self.assertEqual(after[0x467C-world.BASE], 0x0A)

    def test_drawable_growth_does_not_relocate_live_headers(self):
        before = world.build_state(self.root, self.rooms)
        grown = copy.deepcopy(self.rooms)
        grown[0]["views"][1].append(0)
        after = world.build_state(self.root, grown)
        self.assertEqual(before[0x455B-world.BASE:], after[0x455B-world.BASE:])
        grown[0]["views"][1] = [0] * 500
        with self.assertRaisesRegex(ValueError, "allocation permits"):
            world.build_state(self.root, grown)

    def test_invalid_room_contracts_are_rejected(self):
        bad = copy.deepcopy(self.rooms)
        bad[1]["id"] = 0
        with self.assertRaisesRegex(ValueError, "Duplicate room"):
            world.build_state(self.root, bad)
        bad = copy.deepcopy(self.rooms)
        bad[0]["views"] = {1: [0]}
        with self.assertRaisesRegex(ValueError, "consecutive"):
            world.build_state(self.root, bad)
        for invalid in (101, 138, -1):
            bad = copy.deepcopy(self.rooms)
            bad[0]["views"] = {0: [invalid]}
            with self.assertRaises(ValueError):
                world.build_state(self.root, bad)

    def test_fixed_floor_and_duplicate_direction_are_rejected(self):
        path = self.root / "world/map.txt"
        original = path.read_text("ascii")
        for replacement in ("00 4 0 2 east 2 no -", "00 3 0 2 east 2 no right,right"):
            content = [replacement if line.startswith("00 ") else line
                       for line in original.splitlines()]
            path.write_text("\n".join(content) + "\n", "ascii")
            with self.assertRaises(ValueError):
                world.read_map(self.root)

    def test_initial_floor_and_room_must_have_gameplay_resources(self):
        path = self.root / "world/initial.txt"
        original = path.read_text("ascii")
        path.write_text(original.replace("map-floor 2", "map-floor 5"), "ascii")
        self.assertEqual(world.read_initial(self.root)["map-floor"], [5])
        for invalid in (6, 7, 8, 9, 10, 65535):
            with self.subTest(floor=invalid):
                path.write_text(original.replace("map-floor 2", f"map-floor {invalid}"), "ascii")
                with self.assertRaisesRegex(ValueError, "0..5"):
                    world.build_state(self.root)
        path.write_text(original.replace("current-room 0", "current-room 35"), "ascii")
        with self.assertRaisesRegex(ValueError, "ending collection"):
            world.build_state(self.root)

    def test_map_coordinates_fit_the_native_packed_fields(self):
        path = self.root / "world/map.txt"
        original = path.read_text("ascii")
        for x, y in ((7, 7), (8, 0), (0, 8)):
            replacement = f"00 3 {x} {y} east 2 no -"
            text = [replacement if line.startswith("00 ") else line
                    for line in original.splitlines()]
            path.write_text("\n".join(text) + "\n", "ascii")
            if max(x, y) > 7:
                with self.assertRaisesRegex(ValueError, "0..7"):
                    world.build_state(self.root)
            else:
                state = world.build_state(self.root)
                self.assertEqual(state[0x4588 - world.BASE], 0x77)


if __name__ == "__main__":
    unittest.main()
