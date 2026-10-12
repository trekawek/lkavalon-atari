#!/usr/bin/env python3
"""Check inferred game semantics by executing the original Forth on a 6502.

The oracle is the released disk, not a Python translation of its words. These
bounded routines need RAM and controller registers, but no Atari OS services.
"""

import importlib.util
from pathlib import Path
import unittest

from py65.devices.mpu6502 import MPU

SPEC = importlib.util.spec_from_file_location(
    'semantic_decompiler', Path(__file__).with_name('decompile.py'))
d = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(d)


class OriginalForth:
    def __init__(self):
        self.memory = d.memory((d.ROOT / 'reference/ad2044-side1.atr').read_bytes())
        self.cpu = MPU(memory=self.memory)
        # Cold-start normally installs the indirect JMP used by NEXT at $CC.
        self.memory[0xCC] = 0x6C
        self.put(0xCF, 0xBC00)
        self.put(0x0604, 0x0606)  # Sentinel CFA -> stop address.

    def put(self, address, value):
        self.memory[address:address + 2] = (value & 0xFFFF).to_bytes(2, 'little')

    def get(self, address):
        return int.from_bytes(self.memory[address:address + 2], 'little')

    def call(self, cfa, *arguments):
        self.cpu.x = 0x80
        self.cpu.sp = 0xFF
        for value in arguments:
            self.cpu.x -= 2
            self.put(self.cpu.x, value)
        self.put(0x0600, cfa)
        self.put(0x0602, 0x0604)
        self.put(0xCA, 0x0600)  # Thread pointer; NEXT fetches the first CFA.
        self.cpu.pc = 0x0F47
        for _ in range(100_000):
            self.cpu.step()
            if self.cpu.pc == 0x0606:
                if self.cpu.sp != 0xFF or not 0x20 <= self.cpu.x <= 0x80:
                    raise AssertionError('Unbalanced original Forth stacks')
                return [self.get(a) for a in range(0x7E, self.cpu.x - 1, -2)]
        raise AssertionError(f'Word ${cfa:04X} did not return: PC=${self.cpu.pc:04X}')


class SemanticTests(unittest.TestCase):
    def setUp(self):
        self.forth = OriginalForth()

    def test_current_room_exit_returns_mask_bit_not_normalized_boolean(self):
        f = self.forth
        f.put(0x436B, 3)  # Current room variable.
        address = f.call(0x4678, 3)[0]
        self.assertEqual(address, 0x467C + 3)
        for mask in range(16):
            f.memory[address] = mask
            for direction in range(4):
                self.assertEqual(f.call(0x6F8A, direction), [mask & (1 << direction)])

    def test_exit_set_and_clear_select_room_and_preserve_other_bits(self):
        f = self.forth
        for room in (0, 1, 25):
            address = f.call(0x4678, room)[0]
            f.memory[address] = 0xA0
            for direction in range(4):
                self.assertEqual(f.call(0x7BD6, direction, room), [])
            self.assertEqual(f.memory[address], 0xAF)
            for direction in (0, 2):
                self.assertEqual(f.call(0x7C04, direction, room), [])
            self.assertEqual(f.memory[address], 0xAA)

    def test_os_joystick_shadow_and_all_nine_direction_deltas(self):
        f = self.forth
        movements = {15: (0, 0), 14: (0, -1), 13: (0, 1),
                     11: (-1, 0), 7: (1, 0), 10: (-1, -1),
                     9: (-1, 1), 6: (1, -1), 5: (1, 1)}
        for controller in range(4):
            for stick, delta in movements.items():
                f.memory[0x0278 + controller] = stick
                self.assertEqual(f.call(0x4F38, controller), [stick])
                self.assertEqual(f.call(0x4F98, stick),
                                 [v & 0xFFFF for v in delta])

    def test_trigger_reads_gtia_and_masks_only_bit_zero(self):
        f = self.forth
        for controller in range(4):
            for raw in (0, 1, 0xFE, 0xFF):
                f.memory[0xD010 + controller] = raw
                self.assertEqual(f.call(0x4F22, controller), [raw & 1])

    def test_keyboard_poll_consumes_os_ch_latch(self):
        f = self.forth
        f.memory[0x02FC] = 0x21
        self.assertEqual(f.call(0x4748), [0x21])
        self.assertEqual(f.memory[0x02FC], 0xFF)
        self.assertEqual(f.call(0x4748), [0xFF])

    def test_action_parameter_address_and_byte_skip_record_length(self):
        f = self.forth
        f.put(0x7596, 0xA000)  # Pointer to the current counted action record.
        f.memory[0xA000:0xA008] = bytes((6, 0, 0xAA, 0xBB, 0xCC, 0xDD, 0, 0))
        for index, value in enumerate((0xAA, 0xBB, 0xCC, 0xDD)):
            self.assertEqual(f.call(0x7B54, index), [0xA002 + index])
            self.assertEqual(f.call(0x7B66, index), [value])

    def test_stack_copy_and_unsigned_byte_pair_helpers(self):
        f = self.forth
        self.assertEqual(f.call(0x70E9, 11, 22, 33), [11, 22, 33, 11])
        self.assertEqual(f.call(0x53B0, 0xFEDC), [0xDC, 0xFE])
        self.assertEqual(f.call(0x590E, 0x34, 0x78, 0xA000), [])
        self.assertEqual(f.memory[0xA000:0xA002], bytes((0x34, 0x78)))
        self.assertEqual(f.call(0x5923, 0xA000), [0x34, 0x78])

    def test_map_fields_ignore_visited_and_top_bits(self):
        f = self.forth
        for value in range(256):
            f.memory[0xA000] = value
            self.assertEqual(f.call(0x5B1A, 0xA000),
                             [(value & 0x70) >> 4, value & 7])

    def test_counted_string_comparison_includes_length(self):
        f = self.forth
        for left, right, expected in ((b'ABC', b'ABC', 1), (b'ABC', b'ABD', 0),
                                      (b'ABC', b'AB', 0), (b'', b'', 1),
                                      (b'', b'A', 0)):
            f.memory[0xA000:0xA010] = bytes(16)
            f.memory[0xA100:0xA110] = bytes(16)
            f.memory[0xA000:0xA001 + len(left)] = bytes((len(left),)) + left
            f.memory[0xA100:0xA101 + len(right)] = bytes((len(right),)) + right
            self.assertEqual(f.call(0x8340, 0xA000, 0xA100), [expected])

    def test_game_instr_returns_first_match_unlike_tutorial_reverse_search(self):
        f = self.forth
        f.memory[0xA000:0xA005] = b'ABACA'
        self.assertEqual(f.call(0x3071, ord('A'), 0xA000, 5), [1])
        self.assertEqual(f.call(0x3071, ord('C'), 0xA000, 5), [4])
        self.assertEqual(f.call(0x3071, ord('Z'), 0xA000, 5), [0])

    def test_tutorial_cursor_words_use_os_column_word_and_row_byte(self):
        f = self.forth
        f.memory[0x0054:0x0058] = bytes(4)
        self.assertEqual(f.call(0x364A, 0x1234), [])
        self.assertEqual(f.call(0x3658, 0x56), [])
        self.assertEqual(f.memory[0x54:0x57], bytes((0x56, 0x34, 0x12)))
        self.assertEqual(f.call(0x3666), [0x1234])
        self.assertEqual(f.call(0x3674), [0x56])


if __name__ == '__main__':
    unittest.main()
