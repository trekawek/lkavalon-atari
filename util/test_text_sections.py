"""Preserve explicit message IDs and significant characters during text edits."""

from pathlib import Path
import tempfile
import unittest

from text_sections import quoted_strings, read_sections


class TextSectionsTests(unittest.TestCase):
    def read(self, text, **kwargs):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "messages.txt"
            path.write_text(text, encoding="utf-8")
            return read_sections(path, **kwargs)

    def test_ids_survive_reordering_and_lines_preserve_spaces_and_escapes(self):
        data = '# Messages\n[02]\n"ŻÓŁĆ # \\\\x7A"\n[00]\n"  A  "\n""\n'
        self.assertEqual(self.read(data, expected_ids=(0, 2)),
                         {2: ["ŻÓŁĆ # \\x7A"], 0: ["  A  ", ""]})
        self.assertEqual(self.read('[01 002]\n"TEXT"\n', key_fields=2),
                         {(1, 2): ["TEXT"]})

    def test_duplicate_missing_empty_and_malformed_sections_are_rejected(self):
        for data in ('[01]\n"A"\n[1]\n"B"\n', '[0]\n', '"A"\n',
                     '[A]\n"TEXT"\n', '[0 1]\n"TEXT"\n', '[0]\n123\n'):
            with self.subTest(data=data), self.assertRaises(ValueError):
                self.read(data)
        with self.assertRaisesRegex(ValueError, "missing=\\[1\\]"):
            self.read('[0]\n"A"\n', expected_ids=(0, 1))

    def test_inline_text_is_quoted_and_preserves_line_boundaries(self):
        self.assertEqual(quoted_strings('"  Ż # " "\\\\x20" "say \\"A\\"" # note'),
                         ['  Ż # ', '\\x20', 'say "A"'])
        for invalid in ('notice.txt', 'none', '', '12', '"A""B"', '"A" garbage'):
            with self.subTest(invalid=invalid), self.assertRaises(ValueError):
                quoted_strings(invalid)


if __name__ == "__main__":
    unittest.main()
