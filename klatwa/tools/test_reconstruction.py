#!/usr/bin/env python3
"""Independent checks for image layout, threaded operands and screen packing."""

import contextlib
import io
import json
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

import decompile
import pack_sources
import recover
from shared import ROOT, load

compiler = load("compile")
from forth_assets import dependencies, source_lines


def uncommented_tokens(text):
    """Read standalone parenthesis comments independently of the packer."""
    result = []
    for line in text.splitlines():
        inside = False
        for token in line.split():
            if not inside and token == "(":
                inside = True
            elif inside:
                if ")" in token:
                    inside = False
            else:
                result.append(token)
        if inside:
            raise AssertionError("Unclosed comment")
    return result


class DictionaryTests(unittest.TestCase):
    def test_boot_residue_and_resource_boundaries(self):
        raw = (ROOT / "reference/klatwa-v1.atr").read_bytes()
        data = recover.memory(raw)
        self.assertEqual(data[0x0E80:0x8880], raw[16:0x7A10])
        self.assertEqual(data[0x8880:0x8B80], raw[0x7A10:0x7D10])
        self.assertEqual(recover.cell(data, 0x0F1C), recover.END)
        self.assertEqual(recover.cell(data, 0x0F0C), recover.LAST)
        bad = bytearray(raw)
        bad[4] = 0
        with self.assertRaises(ValueError):
            recover.memory(bad)

    def test_dictionary_rejects_cycles_bad_flags_and_bad_name_lengths(self):
        original = recover.memory()
        words, count = recover.dictionary(original)
        self.assertEqual((len(words), count), (902, 824))
        self.assertEqual(sum(bool(w.get("private_vocabulary")) for w in words), 76)
        last = words[-1]
        mutations = [
            (last["cfa"] - 2, recover.LAST.to_bytes(2, "little")),
            (recover.LAST, bytes([original[recover.LAST] & 0x7F])),
            (recover.LAST, bytes([(original[recover.LAST] & 0xE0) | 2])),
            (recover.LAST + 1, bytes(32)),
        ]
        for address, replacement in mutations:
            with self.subTest(address=address, replacement=replacement):
                data = bytearray(original)
                data[address : address + len(replacement)] = replacement
                with self.assertRaises(ValueError):
                    recover.dictionary(data)


class ThreadTests(unittest.TestCase):
    def test_real_apx_compiler_round_trip_for_inline_operands(self):
        # COMPILE CLIT consumes the CFA as data; the following actual CLIT
        # shifts alignment, and the custom string contains non-ASCII ATASCII.
        body = bytes.fromhex("1b18670f2d0fefbe670f078b3a05")
        body += b"A)\x9bB("
        body += bytes.fromhex("a20ff6ff77124200fe")
        address = 0x4000
        data = bytearray(65536)
        data[address : address + len(body)] = body
        targets = {
            0x181B: "XCOMPILE",
            0x0F67: "XCLIT",
            0x0F2D: "XLIT",
            0x3A8B: "XSTRING",
            0x0FA2: "XBRANCH",
            0x1277: "XEXIT",
        }
        by_cfa = {cfa: {"id": name} for cfa, name in targets.items()}
        decoded, stop = decompile.decode(data, address, address + len(body), by_cfa)
        self.assertEqual(decoded[0]["compiled_cfa"], 0x0F67)
        self.assertEqual(decoded[2]["value"], 7)
        self.assertEqual(decoded[3]["string"], b"A)\x9bB(")
        self.assertEqual(decoded[4]["target"], 0x400B)
        self.assertEqual(stop, address + len(body) - 3)
        listing = decompile.base.Listing()
        decompile.base.emit_thread(
            listing, data, {"pfa": address, "end": address + len(body)}, by_cfa
        )
        listing.flush()
        lines = compiler.read_sources([ROOT / "src/metacompiler.fth"])
        extra = [f"TARGET {cfa:04X} {name}" for cfa, name in targets.items()]
        extra += (ROOT / "src/05-emission.fth").read_text("ascii").splitlines()
        extra += ["3 T-DISK 4000 T-ORG"] + listing.lines + ["T-FINISH"]
        lines += [("<synthetic>", i, line) for i, line in enumerate(extra, 1) if line]
        machine = compiler.ForthMachine(
            ROOT / "reference/figforth.atr", lines, 20_000_000
        )
        machine.run()
        self.assertEqual(bytes(machine.output_disks[3][: len(body)]), body)

    def test_partial_string_and_compile_operand_are_retained_raw(self):
        targets = {cfa: {} for cfa in (0x181B, 0x0F67, 0x3A8B, 0x0F2D)}
        for body in (
            bytes.fromhex("1b18"),
            bytes.fromhex("670f"),
            bytes.fromhex("8b3a054142"),
            bytes.fromhex("2d0f00"),
        ):
            with self.subTest(body=body):
                self.assertEqual(decompile.decode(body, 0, len(body), targets), ([], 0))


class PackingTests(unittest.TestCase):
    def test_physical_screens_preserve_all_tokens_and_column_delimiters(self):
        manifest = json.loads((ROOT / "sources.json").read_text())
        expected = []
        with tempfile.TemporaryDirectory(prefix="klatwa-screens-") as dirname:
            temp = Path(dirname)
            (temp / "sources.json").write_text(json.dumps(manifest))
            for name in dependencies('klatwa'):
                path = temp / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_bytes((ROOT / name).read_bytes())
            for filename in manifest["sources"]:
                text = (ROOT / filename).read_text("ascii")
                path = temp / filename
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(text, encoding="ascii")
                expanded = '\n'.join(line for _, _, line in source_lines(path, temp))
                expected += uncommented_tokens(expanded)
            with (
                patch.object(pack_sources, "ROOT", temp),
                contextlib.redirect_stdout(io.StringIO()),
            ):
                pack_sources.main()
            disk = (temp / "build/sources.atr").read_bytes()
            mapping = json.loads((temp / "build/source-screens.json").read_text())
            actual = []
            for screen in range(1, len(mapping) + 1):
                block = disk[16 + screen * 1024 : 16 + (screen + 1) * 1024]
                self.assertTrue(all(block[i] == 32 for i in range(63, 1024, 64)))
                tokens = block.decode("ascii").split()
                if screen < len(mapping):
                    self.assertEqual(tokens.pop(), "-->")
                else:
                    end = 'CR ." KLATWA BUILD COMPLETE" CR'.split()
                    self.assertEqual(tokens[-len(end) :], end)
                    del tokens[-len(end) :]
                actual += tokens
            self.assertEqual(actual, expected)
            self.assertIn("t.(LOOP)", actual)


if __name__ == "__main__":
    unittest.main()
