#!/usr/bin/env python3
"""Execute the target assembler using the original APX fig-Forth compiler.

py65's independent NMOS 6502 instruction table is the byte-level oracle.
The source under test is interpreted by the Atari Forth, not by Python.
"""
import importlib.util
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
try:
    from py65.devices.mpu6502 import MPU
except ImportError:
    MPU = None

if MPU is not None:
    SPEC = importlib.util.spec_from_file_location(
        "assembler_compile", Path(__file__).with_name("compile.py"))
    compiler = importlib.util.module_from_spec(SPEC)
    SPEC.loader.exec_module(compiler)

SUFFIX = {
    "imp": "", "acc": ".A", "imm": ".#", "zpg": ".ZP",
    "zpx": ".ZPX", "zpy": ".ZPY", "abs": ".ABS",
    "abx": ".ABSX", "aby": ".ABSY", "inx": ".INDX",
    "iny": ".INDY", "ind": ".IND", "rel": "",
}
WORD_MODES = {"abs", "abx", "aby", "ind"}
NO_OPERAND = {"imp", "acc"}


class AssemblerSourceTests(unittest.TestCase):
    def test_all_games_share_the_same_ascii_assembler(self):
        source = (ROOT / "src/06-assembler.fth").read_bytes()
        for game in ("klatwa", "wladcy-ciemnosci"):
            self.assertEqual(
                (ROOT.parent / game / "src/06-assembler.fth").read_bytes(),
                source)
        self.assertLessEqual(max(map(len, source.decode("ascii").splitlines())), 63)


@unittest.skipIf(MPU is None, "py65 is required to execute the APX compiler")
class AssemblerTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        paths = [ROOT / "src" / name for name in (
            "metacompiler.fth", "05-emission.fth", "06-assembler.fth")]
        cls.base = compiler.ForthMachine(
            ROOT / "build/figforth.atr", compiler.read_sources(paths))
        cls.base.run()

    def machine(self, source):
        lines = [("<assembler test>", no, line)
                 for no, line in enumerate(source.splitlines(), 1)]
        machine = compiler.ForthMachine(
            ROOT / "build/figforth.atr", lines, 20_000_000)
        machine.mem[:] = self.base.mem[:]
        for register in ("pc", "sp", "a", "x", "y", "p"):
            setattr(machine.cpu, register, getattr(self.base.cpu, register))
        return machine

    def assemble(self, source, origin=0x1000):
        machine = self.machine(
            f"3 T-DISK {origin:04X} T-ORG\n{source}\nT-FINISH")
        machine.run()
        return bytes(machine.output_disks[3])

    def rejects(self, source, message):
        with self.assertRaisesRegex(compiler.CompileError, message):
            self.assemble(source)

    def test_all_151_documented_opcodes(self):
        lines, expected = [], bytearray()
        count = 0
        for opcode, (mnemonic, mode) in enumerate(MPU.disassemble):
            if mnemonic == "???":
                continue
            count += 1
            line = mnemonic + SUFFIX[mode]
            if mode == "rel":
                line += f" {0x1000 + len(expected) + 2:04X}"
            elif mode not in NO_OPERAND:
                # Low addresses must not shorten absolute instructions.
                line += " 0042"
            lines.append(line)
            expected.append(opcode)
            if mode not in NO_OPERAND:
                expected.append(0 if mode == "rel" else 0x42)
            if mode in WORD_MODES:
                expected.append(0)
        self.assertEqual(count, 151)
        actual = self.assemble("\n".join(lines))
        self.assertEqual(actual[:len(expected)], expected)
        self.assertEqual(actual[len(expected):], bytes((-len(expected)) % 128))

    def test_zero_page_and_forced_absolute_are_distinct(self):
        source = "LDA.ZP 00 LDA.ABS 0000 LDA.ZPX 42 LDA.ABSX 0042"
        expected = bytes.fromhex("a500ad0000b542bd4200")
        self.assertEqual(self.assemble(source)[:len(expected)], expected)

    def test_full_unsigned_operand_and_little_endian_order(self):
        expected = bytes.fromhex("adffff6c0080a9ff")
        self.assertEqual(
            self.assemble("LDA.ABS FFFF JMP.IND 8000 LDA.# FF")[:len(expected)],
            expected)

    def test_each_branch_at_signed_limits_and_zero(self):
        for opcode, (mnemonic, mode) in enumerate(MPU.disassemble):
            if mode != "rel":
                continue
            with self.subTest(mnemonic=mnemonic):
                source = f"{mnemonic} 1002\n{mnemonic} 0F84\n{mnemonic} 1085"
                self.assertEqual(self.assemble(source)[:6],
                                 bytes((opcode, 0, opcode, 0x80, opcode, 0x7f)))

    def test_branch_wraps_at_16_bit_address_boundary(self):
        source = "BNE 0000\n0000 T-ORG BNE FF82"
        self.assertEqual(self.assemble(source, origin=0xfffe)[:4],
                         bytes.fromhex("d000d080"))

    def test_branch_out_of_range_is_rejected(self):
        for target in ("0F81", "1082", "8000"):
            with self.subTest(target=target):
                self.rejects("BNE " + target, "ASSEMBLER BRANCH RANGE")

    def test_byte_operand_overflow_is_rejected_for_each_byte_mode(self):
        for name in ("LDA.#", "LDA.ZP", "LDA.ZPX", "LDX.ZPY",
                     "LDA.INDX", "LDA.INDY"):
            with self.subTest(name=name):
                self.rejects(name + " 0100", "ASSEMBLER BYTE RANGE")

    def test_wide_or_negative_operand_is_rejected(self):
        for name in ("LDA.#", "LDA.ABS", "BNE"):
            for value in ("10000", "-1"):
                with self.subTest(name=name, value=value):
                    self.rejects(name + " " + value, "ASSEMBLER WORD RANGE")

    def test_nonnumeric_operand_is_rejected(self):
        self.rejects("LDA.# QX", "Forth ERROR or ABORT")

    def test_target_pc_tracks_operand_width(self):
        source = "LDA.# 12 LDA.ABS 0012 RTS AT 1006"
        self.assertEqual(self.assemble(source)[:6],
                         bytes.fromhex("a912ad120060"))


if __name__ == "__main__":
    unittest.main()
