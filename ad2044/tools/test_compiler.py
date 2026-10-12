#!/usr/bin/env python3
"""Regression checks for failures that could make a false rebuild claim.

These execute the original APX 6502 Forth in the same OS shim as compile.py.
"""
import importlib.util
import unittest
from pathlib import Path

SPEC = importlib.util.spec_from_file_location("ad2044_compile", Path(__file__).with_name("compile.py"))
compiler = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(compiler)
ROOT = compiler.ROOT


class CompilerTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        # Compile the portable Forth writer once, then clone its settled state.
        cls.writer = compiler.ForthMachine(
            ROOT / "reference/figforth.atr",
            compiler.read_sources([ROOT / "src/metacompiler.fth",
                                   ROOT / "src/05-emission.fth"]),
        )
        cls.writer.run()

    def machine(self, source, writer=False):
        lines = [("<test>", n, line) for n, line in enumerate(source.splitlines(), 1)]
        machine = compiler.ForthMachine(ROOT / "reference/figforth.atr", lines, 20_000_000)
        if writer:
            machine.mem[:] = self.writer.mem[:]
            for register in ("pc", "sp", "a", "x", "y", "p"):
                setattr(machine.cpu, register, getattr(self.writer.cpu, register))
        return machine

    def test_undefined_word_stops_compiler(self):
        with self.assertRaisesRegex(compiler.CompileError, "Forth ERROR or ABORT"):
            self.machine("THIS-WORD-DOES-NOT-EXIST").run()

    def test_explicit_abort_stops_compiler(self):
        with self.assertRaisesRegex(compiler.CompileError, "Forth ERROR or ABORT"):
            self.machine("ABORT").run()

    def test_unfinished_definition_is_rejected(self):
        with self.assertRaisesRegex(compiler.CompileError, "unfinished Forth definition"):
            self.machine(": INCOMPLETE DUP").run()

    def test_unbalanced_stack_is_rejected(self):
        with self.assertRaisesRegex(compiler.CompileError, "unbalanced Forth stack"):
            self.machine("1").run()

    def test_address_assertion_is_enforced(self):
        with self.assertRaisesRegex(compiler.CompileError, "Forth ERROR or ABORT"):
            self.machine("3 T-DISK 100 T-ORG 101 T-AT", writer=True).run()

    def test_missing_finish_is_rejected(self):
        with self.assertRaisesRegex(compiler.CompileError, "unfinished sector"):
            self.machine("3 T-DISK 42 B,", writer=True).run()

    def test_overlap_patches_and_partial_sector_preserve_assets(self):
        # Start at the overlap window: output disk offset is intentionally zero,
        # while the independently tracked target PC has its genuine address.
        source = """HEX
: SAMPLE 8D91 8CA0 DO I FF AND B, LOOP ;
3 T-DISK 8CA0 T-ORG GAME-MODE SAMPLE
8D91 T-AT T-FINISH"""
        machine = self.machine(source, writer=True)
        template = bytes((i * 7 + 3) & 255 for i in range(1024))
        machine.input_disks[3] = template
        machine.run()
        canonical = bytes(addr & 255 for addr in range(0x8ca0, 0x8d91))
        first = bytearray(canonical[:0xe0])
        for addr, value in ((0x8d32, 0x23), (0x8d33, 0x4a), (0x8d45, 0x26), (0x8d46, 0x37)):
            first[addr - 0x8ca0] = value
        emitted = bytes(first) + canonical[:0xe0] + canonical[0xe0:]
        expected = emitted + template[len(emitted):]
        self.assertEqual(bytes(machine.output_disks[3]), expected)
        self.assertEqual(machine.write_count, 4)

    def test_exact_sector_boundary_has_no_extra_write(self):
        machine = self.machine("3 T-DISK : SAMPLE 80 0 DO I B, LOOP ; SAMPLE T-FINISH", writer=True)
        machine.run()
        self.assertEqual(bytes(machine.output_disks[3]), bytes(range(128)))
        self.assertEqual(machine.write_count, 1)

    def test_full_unsigned_cells_and_literals(self):
        source = "3 T-DISK FFFF W, 8000 W, FF #8 8000 #16 T-FINISH"
        machine = self.machine(source, writer=True)
        machine.run()
        self.assertEqual(machine.output_disks[3][:11], bytes.fromhex("ffff0080670fff2d0f0080"))

    def test_atr_preserves_template_metadata(self):
        header = (ROOT / "reference/ad2044-side1.atr").read_bytes()[:16]
        rebuilt = compiler.atr(bytes(133120), header)
        self.assertEqual(rebuilt[:16], header)

    def test_hex_runs_emit_all_byte_values(self):
        source = "3 T-DISK\n" + "\n".join(
            "BYTES " + bytes(range(start, start + 16)).hex().upper()
            for start in range(0, 256, 16)
        ) + "\nT-FINISH"
        machine = self.machine(source, writer=True)
        machine.run()
        self.assertEqual(bytes(machine.output_disks[3]), bytes(range(256)))

    def test_odd_hex_run_is_rejected(self):
        with self.assertRaisesRegex(compiler.CompileError, "Forth ERROR or ABORT"):
            self.machine("3 T-DISK BYTES 123", writer=True).run()

    def test_nonhex_run_is_rejected(self):
        with self.assertRaisesRegex(compiler.CompileError, "Forth ERROR or ABORT"):
            self.machine("3 T-DISK BYTES 0Z", writer=True).run()

    def test_prefix_operands_and_target_creation(self):
        source = """3 T-DISK E80 T-ORG
TARGET 1234 SAMPLE
SAMPLE CELL FFFF LIT16 8000 LIT8 FE AT 0E8B
T-FINISH"""
        machine = self.machine(source, writer=True)
        machine.run()
        self.assertEqual(machine.output_disks[3][:11], bytes.fromhex("3412ffff2d0f0080670ffe"))


if __name__ == "__main__":
    unittest.main()
