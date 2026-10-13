"""Assemble the repository's explicit-mode NMOS 6502 mnemonic syntax.

The opcode declarations are the same 151 instructions used by the Atari
Forth target assembler. Operands are hexadecimal; branch operands are target
addresses, not encoded displacements. No opcode choice depends on its value.
"""

from pathlib import Path
import re

OPCODE_SOURCE = Path(__file__).resolve().parents[1] / "ad2044/src/06-assembler.fth"


def opcodes():
    result = {}
    for line in OPCODE_SOURCE.read_text("ascii").splitlines():
        match = re.fullmatch(r"([0-9A-F]{2}) (A[012R]): (\S+)", line)
        if match:
            value, emitter, name = match.groups()
            result[name] = (int(value, 16), {"A0": 1, "A1": 2, "A2": 3, "AR": 2}[emitter], emitter == "AR")
    if len(result) != 151:
        raise ValueError("Expected all 151 official 6502 opcode declarations")
    return result


def assemble(lines, origin):
    """Assemble a sequence of mnemonic lines at the supplied fixed origin."""
    table = opcodes()
    output = bytearray()
    for number, line in enumerate(lines, 1):
        fields = line.split(";", 1)[0].split()
        if not fields:
            continue
        try:
            opcode, size, branch = table[fields[0]]
            if len(fields) != (1 if size == 1 else 2):
                raise ValueError("wrong operand count")
            operand = int(fields[1], 16) if size > 1 else 0
            if not 0 <= operand <= (0xFFFF if branch or size == 3 else 0xFF):
                raise ValueError("operand out of range")
            if branch:
                operand = ((operand - (origin + len(output) + 2) + 32768) & 65535) - 32768
                if not -128 <= operand <= 127:
                    raise ValueError("branch target out of range")
                operand &= 255
            output.append(opcode)
            if size > 1:
                output.extend(operand.to_bytes(size - 1, "little"))
        except (KeyError, ValueError) as exc:
            raise ValueError(f"6502 line {number} at ${origin + len(output):04X}: {line}: {exc}") from exc
    return bytes(output)
