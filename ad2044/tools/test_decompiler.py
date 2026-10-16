#!/usr/bin/env python3
"""Independent edge-case checks for recovered dictionary and source screens."""
import contextlib
import importlib.util
import io
import json
import tempfile
import unittest
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "util"))
from reference_media import read_reference
from dictionary_signatures import read as read_signatures
from unittest.mock import patch

HERE = Path(__file__).resolve().parent


def module(name, filename):
    spec = importlib.util.spec_from_file_location(name, HERE / filename)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


d = module("ad2044_decompile", "decompile.py")
c = module("ad2044_compiler", "compile.py")
p = module("ad2044_pack", "pack_sources.py")
from forth_assets import dependencies, source_lines
ROOT = d.ROOT


def comments_removed_tokens(source):
    """Independent lexer for this project's standalone, single-line comments."""
    tokens = []
    for line in source.splitlines():
        inside = False
        for token in line.split():
            if not inside and token == "(":
                inside = True
            elif inside:
                if ")" in token:
                    inside = False
            else:
                tokens.append(token)
        if inside:
            raise AssertionError("comment extends past a source line")
    return tokens


class DictionaryTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.original = read_reference(ROOT / "reference/ad2044-side1.atr")
        cls.data = d.memory(cls.original)

    def test_bad_atr_geometry_is_rejected(self):
        malformed = bytearray(self.original)
        malformed[4] = 0
        with self.assertRaises(ValueError):
            d.memory(malformed)

    def test_compact_shared_signatures_match_the_original_dictionary(self):
        original = d.dictionary(self.data)
        signatures = read_signatures(ROOT / "tools/runtime-signatures.tsv")
        self.assertEqual(len(original), len(signatures))
        for word, compact in zip(original, signatures):
            with self.subTest(cfa=f"{word['cfa']:04X}"):
                for field in ("cfa", "pfa", "end", "flags", "suffix", "code"):
                    self.assertEqual(word[field], compact[field])

    def test_dictionary_link_cannot_point_forward_or_cycle(self):
        data = bytearray(self.data)
        last = next(w for w in d.dictionary(data) if w["nfa"] == d.LAST)
        data[last["cfa"] - 2:last["cfa"]] = d.LAST.to_bytes(2, "little")
        with self.assertRaisesRegex(ValueError, "Invalid dictionary link"):
            d.dictionary(data)

    def test_unterminated_name_is_rejected(self):
        data = bytearray(self.data)
        data[d.LAST + 1:d.LAST + 33] = bytes(32)
        with self.assertRaisesRegex(ValueError, "Unterminated name"):
            d.dictionary(data)

    def test_header_flag_is_required(self):
        data = bytearray(self.data)
        data[d.LAST] &= 0x7f
        with self.assertRaises(ValueError):
            d.dictionary(data)

    def test_declared_name_length_must_match(self):
        data = bytearray(self.data)
        data[d.LAST] = (data[d.LAST] & 0xe0) | 2
        with self.assertRaisesRegex(ValueError, "Invalid name length"):
            d.dictionary(data)

    def test_header_cannot_extend_beyond_word_boundary(self):
        data = bytearray(self.data)
        short = d.END - 2
        data[short:d.END] = bytes([0x81, 0xc1])
        with patch.object(d, "LAST", short), self.assertRaises(ValueError):
            d.dictionary(data)

    def test_hidden_definitions_and_internal_native_entries_are_real(self):
        extras = json.loads((ROOT / "tools/extra-headers.json").read_text())
        words = d.dictionary(self.data)
        addresses = {word["cfa"] for word in words}
        self.assertEqual(len(words), 901)
        self.assertEqual(len(addresses), len(words))
        for extra in extras:
            with self.subTest(cfa=f"{extra['cfa']:04X}"):
                self.assertIn(extra["cfa"], addresses)
                self.assertEqual(extra["pfa"], extra["cfa"] + 2)
                actual = int.from_bytes(self.data[extra["cfa"]:extra["pfa"]], "little")
                self.assertEqual(extra["code"], actual)
        internal = [word for word in extras if word.get("headerless")]
        self.assertEqual({word["cfa"] for word in internal}, {0x29ae, 0x2a1b})


class ThreadTests(unittest.TestCase):
    def test_compile_operand_clit_strings_and_odd_branch_compile_exactly(self):
        # COMPILE CLIT is an inline CFA operand, not a byte literal. The real
        # CLIT that follows makes subsequent calls and branch cells unaligned.
        # A custom counted string includes ATASCII and literal parentheses.
        body = bytes.fromhex("1b18670f2d0fefbe670f07e53605")
        body += b"A)\x9bB("
        body += bytes.fromhex("a20ff6ff77124200fe")
        start = 0x4000
        memory = bytearray(65536)
        memory[start:start + len(body)] = body
        names = {0x181b: "XCOMPILE", 0x0f67: "XCLIT", 0x0f2d: "XLIT",
                 0x36e5: "XSTRING", 0x0fa2: "XBRANCH", 0x1277: "XEXIT"}
        by_cfa = {cfa: {"id": name} for cfa, name in names.items()}
        instructions, stop = d.decode(memory, start, start + len(body), by_cfa)
        self.assertEqual(instructions[0]["compiled_cfa"], 0x0f67)
        self.assertEqual(instructions[1]["value"], 0xbeef)
        self.assertEqual(instructions[2]["value"], 7)
        self.assertEqual(instructions[3]["string"], b"A)\x9bB(")
        self.assertEqual(instructions[4]["at"], 0x4013)
        self.assertEqual(instructions[4]["target"], 0x400b)
        self.assertEqual(stop, start + len(body) - 3)
        listing = d.Listing()
        d.emit_thread(listing, memory, {"pfa": start, "end": start + len(body)}, by_cfa)
        listing.flush()
        # Use the genuine APX compiler as the round-trip oracle, so this test
        # does not duplicate the emitter or reparse its output on the host.
        lines = c.read_sources([ROOT / "src/metacompiler.fth"])
        extra = [f"TARGET {cfa:04X} {name}" for cfa, name in names.items()]
        extra += (ROOT / "src/05-emission.fth").read_text("ascii").splitlines()
        extra += ["3 T-DISK 4000 T-ORG"] + listing.lines + ["T-FINISH"]
        lines += [("<synthetic thread>", i, line) for i, line in enumerate(extra, 1) if line]
        machine = c.ForthMachine(ROOT / "reference/figforth.atr", lines, 20_000_000)
        machine.run()
        self.assertEqual(bytes(machine.output_disks[3][:len(body)]), body)

    def test_incomplete_inline_operands_stay_raw(self):
        by_cfa = {x: {"id": str(x)} for x in (0x181b, 0x0f67, 0x36e5, 0x0f2d)}
        for body in (bytes.fromhex("1b18"), bytes.fromhex("670f"),
                     bytes.fromhex("e536054142"), bytes.fromhex("2d0f00")):
            with self.subTest(body=body.hex()):
                instructions, stop = d.decode(body, 0, len(body), by_cfa)
                self.assertEqual(instructions, [])
                self.assertEqual(stop, 0)

    def test_runtime_definers_stop_before_unclassified_tail(self):
        for cfa in (0x188e, 0x18cc):
            body = cfa.to_bytes(2, "little") + bytes.fromhex("670f00")
            instructions, stop = d.decode(body, 0, len(body), {cfa: {}, 0x0f67: {}})
            self.assertEqual(len(instructions), 1)
            self.assertEqual(stop, 2)


class NativeListingTests(unittest.TestCase):
    def listing(self, body, start):
        data = bytearray(65536)
        data[start:start + len(body)] = body
        out = d.Listing()
        d.native(out, data, start, start + len(body))
        return comments_removed_tokens('\n'.join(out.lines))

    def test_mnemonics_preserve_width_and_signed_branch_destination(self):
        self.assertEqual(
            self.listing(bytes.fromhex('ad0000a500d0f960'), 0x4000),
            ['LDA.ABS', '0000', 'LDA.ZP', '00', 'BNE', '4000', 'RTS'])

    def test_save_counter_is_data_and_error_entry_is_resynchronized(self):
        self.assertEqual(
            self.listing(bytes.fromhex('4c5910c64cf31e'), 0x29fd),
            ['JMP.ABS', '1059', 'BYTES', 'C6', 'JMP.ABS', '1EF3'])

    def test_cassette_filename_is_data(self):
        self.assertEqual(self.listing(b'C', 0x2a75), ['BYTES', '43'])

    def test_unknown_or_truncated_code_is_retained_without_guessing(self):
        for raw in (bytes.fromhex('ad00'), bytes.fromhex('0260')):
            with self.subTest(raw=raw.hex()):
                self.assertEqual(self.listing(raw, 0x4000),
                                 ['BYTES', raw.hex().upper()])

    def test_does_thread_is_not_assumed_to_be_native_code(self):
        data = bytearray(65536)
        data[0x4000:0x4004] = bytes.fromhex('cc18670f')
        out = d.Listing()
        d.emit_thread(out, data, {'pfa': 0x4000, 'end': 0x4004},
                      {0x18cc: {'id': 't.DOES>'}})
        self.assertEqual(comments_removed_tokens('\n'.join(out.lines)),
                         ['t.DOES>', 'BYTES', '670F'])

    def test_io_device_names_between_code_islands_stay_data(self):
        data = d.memory(read_reference(ROOT / 'reference/ad2044-side1.atr'))
        out = d.Listing()
        d.emit_region(out, data, 0x22be, 0x2386)
        raw = [line for line in out.lines if line.startswith('BYTES ')]
        self.assertEqual(raw, ['BYTES 4B4550'])  # KEP device names


class PackingTests(unittest.TestCase):
    def test_screen_packing_preserves_every_noncomment_token(self):
        manifest = json.loads((ROOT / "sources.json").read_text())
        with tempfile.TemporaryDirectory(prefix="ad2044-screens-") as dirname:
            temp = Path(dirname)
            (temp / "sources.json").write_text(json.dumps(manifest))
            for name in dependencies('ad2044'):
                path = temp / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_bytes((ROOT / name).read_bytes())
            expected = []
            for filename in manifest["sources"]:
                text = (ROOT / filename).read_text("ascii")
                path = temp / filename
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(text, encoding="ascii")
                expanded = '\n'.join(line for _, _, line in source_lines(path, temp))
                expected.extend(comments_removed_tokens(expanded))
            with patch.object(p, "ROOT", temp), contextlib.redirect_stdout(io.StringIO()):
                p.main()
            disk = (temp / "build/sources.atr").read_bytes()
            mapping = json.loads((temp / "build/source-screens.json").read_text())
            actual = []
            for index in range(1, len(mapping) + 1):
                screen = disk[16 + index * 1024:16 + (index + 1) * 1024]
                # Forth sees 1024 contiguous bytes, with no implicit newline
                # or delimiter at column 64. Split the physical block itself.
                tokens = screen.decode("ascii").split()
                if index < len(mapping):
                    self.assertEqual(tokens.pop(), "-->")
                else:
                    completion = 'CR ." AD2044 BUILD COMPLETE" CR'.split()
                    self.assertEqual(tokens[-len(completion):], completion)
                    del tokens[-len(completion):]
                actual.extend(tokens)
            self.assertEqual(actual, expected)
            self.assertLessEqual(len(mapping), 511)
            self.assertIn("t.(LOOP)", actual)


if __name__ == "__main__":
    unittest.main()
