#!/usr/bin/env python3
"""Logical-group placement and writable-disk contract tests."""

import unittest
from unittest.mock import patch

import disk


def sector(image, number):
    return image[16 + (number-1)*128:16 + number*128]


class DiskTests(unittest.TestCase):
    def test_fresh_empty_disks_keep_boot_space_and_indices(self):
        images = disk.build_disks({})
        self.assertEqual(set(images), set(disk.OUTPUTS.values()))
        for side, output in disk.OUTPUTS.items():
            image = images[output]
            self.assertEqual(len(image), 133136)
            self.assertEqual(image[:16], bytes.fromhex("96028020800000000000000000000000"))
            self.assertEqual(sector(image, 500)[0], side)
            self.assertEqual(sector(image, 1024), bytes(128))
        first = images[disk.OUTPUTS[1]]
        self.assertEqual(first[16:16+disk.COMPILED_PREFIX_BYTES], bytes(disk.COMPILED_PREFIX_BYTES))
        self.assertEqual(sector(first, 500)[1:4], bytes([255, 25, 1]))
        self.assertEqual(sector(first, 500)[24:], bytes(104))

    def test_variable_length_resource_and_zero_padding(self):
        group = bytes(range(129))
        image = disk.build_disks({(2, 1): group})[disk.OUTPUTS[2]]
        self.assertEqual(sector(image, 1), group[:128])
        self.assertEqual(sector(image, 2), group[128:] + bytes(127))
        self.assertEqual(sector(image, 500)[1:4], bytes([2, 1, 1]))
        self.assertEqual(sector(image, 3), bytes(128))

    def test_group_crossing_directory_skips_physical_sector500(self):
        # First17 groups use493 logical sectors. Group18 then spans494..505,
        # with the directory inserted between its sixth and seventh sectors.
        groups = {(2, i): bytes(29*128) for i in range(1, 18)}
        groups[2, 18] = b"".join(bytes([n])*128 for n in range(1, 12))
        image = disk.build_disks(groups)[disk.OUTPUTS[2]]
        self.assertEqual(sector(image, 499), bytes([6])*128)
        self.assertEqual(sector(image, 500)[0], 2)
        self.assertEqual(sector(image, 501), bytes([7])*128)
        self.assertEqual(sector(image, 505), bytes([11])*128)
        self.assertIn("494..505 (skip500)", disk.describe(groups))

    def test_ram_capacity_checks_use_sector_rounded_size(self):
        disk.build_disks({(1, 3): bytes(36*128), (2, 1): bytes(39*128)})
        for key, count in (((1, 3), 36), ((2, 1), 39)):
            with self.assertRaisesRegex(ValueError, "RAM workspace"):
                disk.build_disks({key: bytes(count*128 + 1)})

    def test_game_resources_stop_before_live_overlay_scratch(self):
        # The 39th sector ends at $A4D0, leaving 24 bytes before the scratch
        # buffer. Even one byte in a 40th sector would load through $A54F.
        self.assertEqual(disk.GAME_BASE + 39 * disk.SECTOR_SIZE, 0xA4D0)
        self.assertLessEqual(0xA4D0, disk.OVERLAY_BASE)
        self.assertGreater(disk.GAME_BASE + 40 * disk.SECTOR_SIZE, disk.OVERLAY_BASE)
        for key in ((1, 4), (1, 5), (1, 22), (2, 1), (2, 22), (2, 23)):
            with self.subTest(group=key):
                disk.build_disks({key: bytes(39 * 128)})
                with self.assertRaisesRegex(ValueError, "39-sector RAM workspace"):
                    disk.build_disks({key: bytes(39 * 128 + 1)})

    def test_fixed_runtime_save_spans_and_program_ownership(self):
        for key, size in disk.FIXED_DATA_LENGTHS.items():
            disk.build_disks({key: bytes(size)})
            with self.assertRaisesRegex(ValueError, "expected exactly"):
                disk.build_disks({key: bytes(size-1)})
        with self.assertRaisesRegex(ValueError, "compiler owns"):
            disk.build_disks({(1, 1): b""})

    def test_disk_overflow_and_invalid_group_are_rejected(self):
        groups = {(1, n): bytes(39*128) for n in range(4, 24)
                  if (1, n) not in disk.FIXED_DATA_LENGTHS}
        groups.update({(1, 3): bytes(36*128)})
        groups.update({key: bytes(size) for key, size in disk.FIXED_DATA_LENGTHS.items()})
        # The live groups now fit even at their RAM limits on a full-size disk.
        # Exercise the independent disk-capacity guard with reduced media.
        with patch.object(disk, "SECTOR_COUNT", 720):
            with self.assertRaisesRegex(ValueError, "exceed 720"):
                disk.build_disks(groups)
        for invalid in ((3, 1), (1, 24), (2, 0), (True, 3)):
            with self.assertRaises(ValueError):
                disk.build_disks({invalid: b""})


if __name__ == "__main__":
    unittest.main()
