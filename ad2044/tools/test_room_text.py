#!/usr/bin/env python3
"""Exercise compact authoring syntax, native lengths and reversible font text."""

import json
from pathlib import Path
import tempfile
import unittest

import room_text as rt


class ActionTextTests(unittest.TestCase):
    def encode(self, text):
        return rt.actions_body(rt.parse_actions(text)["objects"])

    def test_simple_corridor_action_records_have_native_lengths(self):
        text = '[00 empty]\nback\n[01 exits]\nback\n[02 corridor]\nuse-relative-exit relative_direction=1\nexamine\n  message_1:\n    "KORYTARZ."\n'
        expected = bytes.fromhex("0500010001000005000100010000140002000D010C000701094B4F52595441525A2E0000")
        self.assertEqual(self.encode(text), expected)
        metadata = rt.parse_actions(text)
        self.assertEqual(metadata["objects"][2]["name"], "corridor")
        self.assertEqual(metadata["objects"][2]["actions"][0]["opcode"], 13)

    def test_text_length_and_line_count_are_derived(self):
        short = self.encode('[0]\nexamine\n  message_1:\n    "A"\n')
        long = self.encode('[0]\nexamine\n  message_1:\n    "AB"\n    "C"\n')
        self.assertEqual(short, bytes.fromhex("08000400070101410000"))
        self.assertEqual(long, bytes.fromhex("0B000700070202414201430000"))

    def test_every_byte_of_original_font_has_a_reversible_rendering(self):
        original = bytes(range(256))
        self.assertEqual(rt.glyph_bytes(rt.readable_text(original)), original)
        self.assertEqual(rt.readable_text(b"URZaDZENIA=KLIMATYZACYJNE."), "URZĄDZENIA KLIMATYZACYJNE.")
        self.assertEqual(rt.readable_text(b" =z"), "\\x20 \\x7A")
        self.assertEqual(rt.glyph_bytes("ĄĆĘŁŃÓŚ"), b"acelnos")

    def test_quoted_message_whitespace_and_glyph_escapes_survive(self):
        text = '[0]\nexamine\n  message_1:\n    ' + json.dumps(" A  \\x20\\xFF ") + '\n'
        body = self.encode(text)
        self.assertIn(bytes([61, 65, 61, 61, 32, 255, 61]), body)
        self.assertEqual(body[6], 7)  # Native line byte length.

    def test_counted_answer_and_parameter_order(self):
        first = '[0]\nshout-reveal-if-clear revealed_object_id=2 answer_result_bias=0 expected_answer="ASIA"\n'
        second = '[0]\nshout-reveal-if-clear expected_answer="ASIA" answer_result_bias=0 revealed_object_id=2\n'
        self.assertEqual(self.encode(first), self.encode(second))
        self.assertEqual(self.encode(first), bytes.fromhex("0C00080035020004415349410000"))

    def test_continued_parameters_keep_action_field_order(self):
        text = '[0]\nshout-reveal-if-clear\n  expected_answer="ASIA"\n  answer_result_bias=0 revealed_object_id=2\n'
        self.assertEqual(self.encode(text), bytes.fromhex("0C00080035020004415349410000"))
        for tail in ('  revealed_object_id=3\n', '  typo=3\n'):
            with self.subTest(tail=tail), self.assertRaises(ValueError):
                self.encode(text + tail)

    def test_export_wraps_long_actions_without_splitting_quoted_values(self):
        fields = [
            {"type": kind, "name": name, **({"text": "ASIA"} if kind == "counted-text" else {"value": 1})}
            for kind, name in rt.ACTION_SPECS[30][1]
        ]
        document = {"objects": [{"object_id": 0, "actions": [{"opcode": 30, "fields": fields}]}]}
        exported = rt.export_actions(document)
        self.assertTrue(all(len(line) <= 88 for line in exported.splitlines()))
        self.assertIn('\n  ', exported)
        self.assertEqual(rt.parse_actions(exported)["objects"][0]["actions"][0]["arguments"]["expected_answer"], "ASIA")

    def test_shared_handlers_keep_distinct_menu_opcodes(self):
        left = self.encode('[0]\nreveal-object revealed_object_id=7\n')
        right = self.encode('[0]\nreveal-object-62 revealed_object_id=7\n')
        self.assertEqual(left[:4] + left[5:], right[:4] + right[5:])
        self.assertEqual((left[4], right[4]), (20, 62))
        self.assertNotIn("show-closeup-3", rt.BY_NAME)
        self.assertNotIn("show-closeup-5", rt.BY_NAME)

    def test_explicit_unused_back_parameters_are_preserved(self):
        self.assertEqual(self.encode('[0]\nback unused_parameter_1=2 unused_parameter_2=3\n'), bytes.fromhex("070003000102030000"))
        with self.assertRaisesRegex(ValueError, "both"):
            self.encode('[0]\nback unused_parameter_1=2\n')

    def test_unknown_or_incomplete_authoring_is_rejected(self):
        cases = [
            '[1]\nback\n',
            '[0]\nfly\n',
            '[0]\nuse-relative-exit typo=1\n',
            '[0]\nuse-relative-exit relative_direction=1 relative_direction=2\n',
            '[0]\nuse-relative-exit\n',
            '[0]\nuse-relative-exit relative_direction=256\n',
            '[0]\nuse-relative-exit relative_direction=-1\n',
            '[0]\nexamine\n  message_2:\n    "ABC"\n',
            '[0]\nexamine\n  message_1:\n    unquoted\n',
            '[0]\nexamine\n  message_1:\n    "lowercase"\n',
            '[0]\nexamine\n  message_1:\n    "' + 'A' * 256 + '"\n',
        ]
        for case in cases:
            with self.subTest(source=case), self.assertRaises(ValueError):
                self.encode(case)

    def test_per_zone_exports_keep_indices_and_directory_order(self):
        original = {"objects": [
            {"object_id": 0, "actions": [{"opcode": 1, "fields": []}]},
            {"object_id": 1, "actions": [{"opcode": 13, "fields": [{"type": "u8", "name": "relative_direction", "value": 3}]}]},
        ]}
        sections = rt.export_action_sections(original, {1: "left corridor"})
        self.assertEqual(set(sections), {"00.txt", "01.txt"})
        self.assertTrue(sections["01.txt"].startswith("[01 left corridor]"))
        with tempfile.TemporaryDirectory() as tmp:
            for name in reversed(list(sections)):
                (Path(tmp) / name).write_text(sections[name], encoding="utf-8")
            self.assertEqual(rt.encode_actions(tmp), self.encode(rt.export_actions(original)))
            (Path(tmp) / "00.txt").unlink()
            with self.assertRaisesRegex(ValueError, "consecutive"):
                rt.encode_actions(tmp)
        subset = {"objects": [{"object_id": 14, "actions": [{"opcode": 1, "fields": []}]}]}
        self.assertTrue(rt.export_action_sections(subset)["14.txt"].startswith("[14]"))

    def test_export_omits_allocation_metadata_and_keeps_semantic_bytes(self):
        original = {"objects": [{"object_id": 0, "actions": [{"opcode": 7, "handler": "ACT-EXAMINE", "fields": [{"type": "message", "name": "message_1", "lines": ["A=B", [{"inverse": "YES"}, {"glyph": 8}]]}]}], "unused": [{"type": "fill", "value": 32, "count": 9}]}]}
        text = rt.export_actions(original, {0: "notice"})
        self.assertIn('[00 notice]', text)
        self.assertIn('"A B"', text)
        body = self.encode(text)
        self.assertIn(b"A=B", body)
        self.assertIn(bytes([ord("Y") | 128, ord("E") | 128, ord("S") | 128, 8]), body)
        self.assertNotIn(b" " * 9, body)


class HitMapTests(unittest.TestCase):
    def test_compressible_map_cannot_overwrite_the_next_forth_definition(self):
        # 21*16 cells fit at $4FED; 22*16 would reach past the header at $5140.
        fitting = 'size 21 16\ngrid\n' + ('.' * 21 + '\n') * 16
        self.assertLess(len(rt.hitmap_body(rt.parse_hitmap(fitting))), 20)
        excessive = 'size 22 16\ngrid\n' + ('.' * 22 + '\n') * 16
        with self.assertRaisesRegex(ValueError, "runtime buffer"):
            rt.parse_hitmap(excessive)
        with self.assertRaisesRegex(ValueError, "runtime buffer"):
            rt.hitmap_body({"width": 22, "height": 16, "object_ids": [[0]*22]*16})

    def test_grid_symbols_and_inventory_legend(self):
        text = 'size 4 2\nlegend A=101 B=120\ngrid\n.2AB\n2222\n'
        document = rt.parse_hitmap(text)
        self.assertEqual(document["object_ids"], [[0, 2, 101, 120], [2, 2, 2, 2]])
        self.assertEqual(rt.hitmap_body(document), bytes([4, 2, 0, 2, 101, 120, 254, 4, 2]))
        exported = rt.export_hitmap(document, "room 8, view 2")
        self.assertEqual(rt.parse_hitmap(exported)["object_ids"], document["object_ids"])

    def test_editing_grid_changes_encoded_cell_without_an_encoding_plan(self):
        before = rt.hitmap_body(rt.parse_hitmap('size 2 2\ngrid\n23\n45\n'))
        after = rt.hitmap_body(rt.parse_hitmap('size 2 2\ngrid\n23\n46\n'))
        self.assertEqual(before[:-1], after[:-1])
        self.assertEqual((before[-1], after[-1]), (5, 6))

    def test_invalid_dimensions_symbols_and_legends_fail(self):
        cases = ['size 0 2\ngrid\n..\n..\n', 'size 2 2\ngrid\n..\n',
                 'size 2 1\ngrid\n...\n', 'size 2 1\ngrid\n.a\n',
                 'size 2 1\nlegend A=256\ngrid\n.A\n',
                 'size 2 1\nlegend A=100 A=101\ngrid\n.A\n',
                 'size 2 1\nlegend .=1\ngrid\n..\n', 'grid\n..\n']
        for case in cases:
            with self.subTest(source=case), self.assertRaises(ValueError):
                rt.parse_hitmap(case)

    def test_path_apis_return_body_not_outer_count(self):
        with tempfile.TemporaryDirectory() as tmp:
            actions = Path(tmp) / 'actions.txt'
            actions.write_text('[0]\nback\n', encoding='utf-8')
            self.assertEqual(rt.encode_actions(actions), bytes.fromhex('05000100010000'))
            grid = Path(tmp) / 'base.hit.txt'
            grid.write_text('size 1 1\ngrid\n2\n', encoding='utf-8')
            self.assertEqual(rt.encode_hitmap(grid), bytes([1, 1, 2]))


if __name__ == '__main__':
    unittest.main()
