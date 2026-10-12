#!/usr/bin/env python3
"""Check semantic names against the released game's actual 6502 routines."""

import unittest

import recover
from shared import load

OriginalForth = load("semantic_runtime").OriginalForth


class SemanticTests(unittest.TestCase):
    def setUp(self):
        self.forth = OriginalForth(recover.memory())

    def test_joystick_conversion_accepts_controller_number(self):
        f = self.forth
        movements = {15: (0, 0), 14: (0, -1), 13: (0, 1),
                     11: (-1, 0), 7: (1, 0), 10: (-1, -1),
                     9: (-1, 1), 6: (1, -1), 5: (1, 1)}
        for controller in range(4):
            for stick, delta in movements.items():
                f.memory[0x0278 + controller] = stick
                self.assertEqual(f.call(0x50B2, controller),
                                 [v & 0xFFFF for v in delta])

    def test_trigger_reads_hardware_bit_zero(self):
        f = self.forth
        for controller in range(4):
            for raw in (0, 1, 0xFE, 0xFF):
                f.memory[0xD010 + controller] = raw
                self.assertEqual(f.call(0x504C, controller), [raw & 1])

    def test_cursor_helpers_use_os_column_word_and_row_byte(self):
        f = self.forth
        self.assertEqual(f.call(0x39F0, 0x1234), [])
        self.assertEqual(f.call(0x39FE, 0x56), [])
        self.assertEqual(f.memory[0x54:0x57], bytes((0x56, 0x34, 0x12)))
        self.assertEqual(f.call(0x3A0C), [0x1234])
        self.assertEqual(f.call(0x3A1A), [0x56])
        self.assertEqual(f.call(0x3A29, 17, 9), [])
        self.assertEqual(f.memory[0x54:0x57], bytes((9, 17, 0)))

    def test_tutorial_range_word_uses_strict_signed_bounds(self):
        f = self.forth
        for value in (-6, -5, -4, 0, 4, 5, 6):
            self.assertEqual(f.call(0x38F4, -5, value, 5),
                             [int(-5 < value < 5)])

    def test_byte_search_returns_first_match_unlike_tutorial_reverse_search(self):
        f = self.forth
        f.memory[0xA000:0xA005] = b'ABACA'
        self.assertEqual(f.call(0x3896, ord('A'), 0xA000, 5), [1])
        self.assertEqual(f.call(0x3896, ord('C'), 0xA000, 5), [4])
        self.assertEqual(f.call(0x3896, ord('Z'), 0xA000, 5), [0])
        # The original coerces an empty range to one byte.
        self.assertEqual(f.call(0x3896, ord('A'), 0xA000, 0), [1])
        self.assertEqual(f.call(0x3896, ord('B'), 0xA000, 0), [0])

    def test_action_parameter_offset_skips_two_byte_record_length(self):
        f = self.forth
        f.put(0x66EE, 0xA000)
        f.memory[0xA000:0xA008] = bytes((6, 0, 0xAA, 0xBB, 0xCC, 0xDD, 0, 0))
        for index, value in enumerate((0xAA, 0xBB, 0xCC, 0xDD)):
            self.assertEqual(f.call(0x6777, index), [0xA002 + index])
            self.assertEqual(f.call(0x6789, index), [value])

    def test_puzzle_state_is_an_indexed_cell_array(self):
        f = self.forth
        for index in range(8):
            value = 0x1234 + index * 0x101
            self.assertEqual(f.call(0x6D40, value, index), [])
            self.assertEqual(f.get(0x5806 + 2 * index), value)
        for index in range(8):
            self.assertEqual(f.call(0x6D31, index), [0x1234 + index * 0x101])

    def test_object_frame_number_uses_decimal_hundreds(self):
        f = self.forth
        for number in (0, 1, 99, 100, 101, 199, 200, 255, 399):
            self.assertEqual(f.call(0x6F89, number),
                             [number % 100, 2 * (number // 100)])

    def test_room_object_insertion_search_and_removal(self):
        f = self.forth
        self.assertEqual(f.call(0x611D, 207, 0, 1), [0])
        self.assertEqual(f.call(0x67CE, 207, 0, 1), [1])
        found = f.call(0x611D, 207, 0, 1)
        self.assertEqual(found, [0x5658, 1])
        self.assertEqual(f.memory[found[0]], 207)
        self.assertEqual(f.call(0x67CE, 207, 0, 1), [1])
        self.assertEqual(f.call(0x681C, 207, 0, 1), [])
        self.assertEqual(f.call(0x611D, 207, 0, 1), [0])

    def test_resource_id_splits_collection_before_local_index(self):
        for number in (0, 99, 100, 199, 200, 255, 399):
            self.assertEqual(self.forth.call(0x5943, number),
                             [2 * (number // 100), number % 100])

    def test_banked_span_wraps_from_top_of_ram_to_c000(self):
        self.assertEqual(self.forth.call(0x3D02, 0x27F0, 0x20),
                         [0xFFF0, 0x10, 0xC000, 0x10, 0x10])

    def test_directional_puzzle_tracks_repeats_predecessors_and_invalid_steps(self):
        f = self.forth
        self.assertEqual(f.call(0x7CEA), [])
        self.assertEqual([f.get(0x5867 + 2 * i) for i in range(4)], [5, 2, 0, 3])
        self.assertEqual(f.get(0x5851), 12)
        self.assertEqual(f.get(0x585C), 1)
        for accepted, direction, budget, counts in (
                (4, 1, 11, (4, 2, 0, 3)),
                (1, 2, 10, (4, 1, 0, 3)),
                (5, 3, 9, (4, 1, 100, 3))):
            self.assertEqual(f.call(0x7E2F, accepted, direction), [])
            self.assertEqual([f.get(0x5867 + 2 * i) for i in range(4)], list(counts))
            self.assertEqual(f.get(0x5851), budget)
            self.assertEqual(f.get(0x585C), direction)


if __name__ == '__main__':
    unittest.main()
