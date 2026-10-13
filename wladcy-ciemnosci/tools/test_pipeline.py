#!/usr/bin/env python3
"""Regression checks for this game's dictionary and Atari source format."""

import json
import unittest
from pathlib import Path
from unittest.mock import patch
import recover
import decompile
from forth_assets import source_lines

ROOT = Path(__file__).resolve().parents[1]


class PipelineTests(unittest.TestCase):
    def test_main_and_private_dictionary_coverage(self):
        memory = recover.memory()
        words, main = recover.dictionary(memory)
        self.assertEqual((main, len(words)), (828, 906))
        self.assertEqual(sum(w.get("private_vocabulary", False) for w in words), 76)
        self.assertEqual(sum(w.get("headerless", False) for w in words), 2)
        self.assertNotIn(0x61EF, {w["nfa"] for w in words})
        for index, word in enumerate(words):
            self.assertLessEqual(word["pfa"], word["end"])
            self.assertEqual(word["pfa"], word["cfa"] + 2)
            self.assertEqual(recover.cell(memory, word["cfa"]), word["code"])
            if index:
                self.assertEqual(words[index - 1]["end"], word["nfa"])
        self.assertEqual(words[-1]["end"], 0x8758)

    def test_malformed_header_is_rejected(self):
        memory = recover.memory()
        memory[recover.LAST] &= 0x7F
        with self.assertRaises(ValueError):
            recover.dictionary(memory)

    def test_compile_clit_and_custom_counted_string(self):
        data = bytes.fromhex("1b18670f670f7fe5360341299ba20ffaff7712")
        # Use this game's custom string CFA $3A8B, not AD2044's $36E5.
        data = data.replace(bytes.fromhex("e536"), bytes.fromhex("8b3a"))
        by_cfa = {a: {} for a in (0x181B, 0xF67, 0x3A8B, 0xFA2, 0x1277)}
        instructions, stop = decompile.decode(data, 0, len(data), by_cfa)
        self.assertEqual(stop, len(data))
        self.assertEqual(instructions[0]["compiled_cfa"], 0xF67)
        self.assertEqual(instructions[1]["value"], 0x7F)
        self.assertEqual(instructions[2]["string"], b"A)\x9b")
        self.assertEqual(instructions[3]["at"], 13)
        self.assertEqual(instructions[3]["target"], 9)

    def test_truncated_counted_string_is_not_guessed(self):
        data = bytes.fromhex("8b3a094142")
        self.assertEqual(decompile.decode(data, 0, len(data), {0x3A8B: {}}), ([], 0))

    def test_all_source_tokens_survive_physical_screen_packing(self):
        manifest = json.loads((ROOT / "sources.json").read_text())
        expected = []
        for filename in manifest["sources"]:
            for _, _, line in source_lines(ROOT / filename, ROOT):
                self.assertLessEqual(len(line), 64)
                inside = False
                for token in line.split():
                    if not inside and token == "(":
                        inside = True
                    elif inside:
                        if ")" in token:
                            inside = False
                    else:
                        expected.append(token)
                self.assertFalse(inside)
        disk = (ROOT / "build/sources.atr").read_bytes()
        mapping = json.loads((ROOT / "build/source-screens.json").read_text())
        actual = []
        for number in range(1, len(mapping) + 1):
            # Physical blocks have no newline at column 64.
            tokens = (
                disk[16 + number * 1024 : 16 + (number + 1) * 1024]
                .decode("ascii")
                .split()
            )
            if number < len(mapping):
                self.assertEqual(tokens.pop(), "-->")
            else:
                completion = 'CR ." WLADCY BUILD COMPLETE" CR'.split()
                self.assertEqual(tokens[-len(completion) :], completion)
                del tokens[-len(completion) :]
            actual.extend(tokens)
        self.assertEqual(actual, expected)


if __name__ == "__main__":
    unittest.main()
