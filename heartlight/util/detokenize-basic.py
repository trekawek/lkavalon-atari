#!/usr/bin/env python3
"""Print an ASCII listing of an Atari BASIC SAVE file."""

import argparse
from decimal import Decimal
from pathlib import Path


COMMANDS = (
    "REM", "DATA", "INPUT", "COLOR", "LIST", "ENTER", "LET", "IF", "FOR",
    "NEXT", "GOTO", "GO TO", "GOSUB", "TRAP", "BYE", "CONT", "COM",
    "CLOSE", "CLR", "DEG", "DIM", "END", "NEW", "OPEN", "LOAD", "SAVE",
    "STATUS", "NOTE", "POINT", "XIO", "ON", "POKE", "PRINT", "RAD",
    "READ", "RESTORE", "RETURN", "RUN", "STOP", "POP", "?", "GET",
    "PUT", "GRAPHICS", "PLOT", "POSITION", "DOS", "DRAWTO", "SETCOLOR",
    "LOCATE", "SOUND", "LPRINT", "CSAVE", "CLOAD", "",
)

OPERANDS = {
    0x12: ",", 0x13: "$", 0x14: ":", 0x15: ";", 0x16: "",
    0x17: "GOTO", 0x18: "GOSUB", 0x19: "TO", 0x1A: "STEP",
    0x1B: "THEN", 0x1C: "#", 0x1D: "<=", 0x1E: "<>", 0x1F: ">=",
    0x20: "<", 0x21: ">", 0x22: "=", 0x23: "^", 0x24: "*",
    0x25: "+", 0x26: "-", 0x27: "/", 0x28: "NOT", 0x29: "OR",
    0x2A: "AND", 0x2B: "(", 0x2C: ")", 0x2D: "=", 0x2E: "=",
    0x2F: "<=", 0x30: "<>", 0x31: ">=", 0x32: "<", 0x33: ">",
    0x34: "=", 0x35: "+", 0x36: "-", 0x37: "(", 0x38: "(",
    0x39: "(", 0x3A: "(", 0x3B: "(", 0x3C: ",", 0x3D: "STR$",
    0x3E: "CHR$", 0x3F: "USR", 0x40: "ASC", 0x41: "VAL",
    0x42: "LEN", 0x43: "ADR", 0x44: "ATN", 0x45: "COS",
    0x46: "PEEK", 0x47: "SIN", 0x48: "RND", 0x49: "FRE",
    0x4A: "EXP", 0x4B: "LOG", 0x4C: "CLOG", 0x4D: "SQR",
    0x4E: "SGN", 0x4F: "ABS", 0x50: "INT", 0x51: "PADDLE",
    0x52: "STICK", 0x53: "PTRIG", 0x54: "STRIG",
}


def atascii(data: bytes, *, inverse_as_text: bool = False) -> str:
    """Make ATASCII readable in a seven-bit text file."""
    result = []
    for byte in data:
        if inverse_as_text and 0xA0 <= byte <= 0xFE:
            byte &= 0x7F
        result.append(chr(byte) if 0x20 <= byte <= 0x7E else f"\\x{byte:02X}")
    return "".join(result)


def number(data: bytes) -> str:
    if len(data) != 6:
        raise ValueError("truncated numeric constant")
    if data == b"\0" * 6:
        return "0"
    digits = "".join(f"{byte >> 4}{byte & 15}" for byte in data[1:])
    if any(nibble > 9 for byte in data[1:] for nibble in (byte >> 4, byte & 15)):
        raise ValueError(f"invalid BCD constant: {data.hex()}")
    power = (data[0] & 0x7F) - 0x40 - 4
    value = format(Decimal(int(digits)).scaleb(2 * power), "f")
    if "." in value:
        value = value.rstrip("0").rstrip(".")
    return ("-" if data[0] & 0x80 else "") + value


def variables(data: bytes) -> list[str]:
    names = []
    chars = []
    for byte in data:
        chars.append(chr(byte & 0x7F))
        if byte & 0x80:
            names.append("".join(chars))
            chars = []
    if chars:
        raise ValueError("unterminated variable name")
    return names


def expression(data: bytes, names: list[str]) -> tuple[str, int]:
    result = ""
    last_token = None
    position = 0
    terminator = None
    while position < len(data):
        token = data[position]
        position += 1
        if token == 0x0E:
            text = number(data[position:position + 6])
            position += 6
        elif token == 0x0F:
            if position >= len(data):
                raise ValueError("truncated string constant")
            length = data[position]
            position += 1
            if position + length > len(data):
                raise ValueError("truncated string constant")
            text = '"' + atascii(data[position:position + length]) + '"'
            position += length
        elif token >= 0x80:
            index = token - 0x80
            if index >= len(names):
                raise ValueError(f"unknown variable index {index}")
            text = names[index]
        else:
            if token not in OPERANDS:
                raise ValueError(f"unknown operand token ${token:02X}")
            text = OPERANDS[token]
        if token in (0x14, 0x16, 0x1B):
            terminator = token
            if position != len(data):
                raise ValueError("statement terminator before end of statement")
            if token != 0x1B:
                break
        if text:
            word = token in (0x17, 0x18, 0x19, 0x1A, 0x1B, 0x28, 0x29, 0x2A)
            previous_word = last_token in (0x17, 0x18, 0x19, 0x1A, 0x1B, 0x28, 0x29, 0x2A)
            if result and (word or previous_word) and not result.endswith(" "):
                result += " "
            elif result and last_token in (0x12, 0x3C) and token not in (0x2C, 0x12, 0x3C):
                result += " "
            result += text
            last_token = token
    if terminator is None:
        raise ValueError("missing statement terminator")
    return result, terminator


def detokenize(data: bytes) -> str:
    if len(data) < 14:
        raise ValueError("short Atari BASIC file")
    lomem, vnt, vnte, vvt, stmtab, stmcur, starp = (
        int.from_bytes(data[i:i + 2], "little") for i in range(0, 14, 2)
    )
    if not (lomem <= vnt <= vnte <= vvt <= stmtab <= stmcur <= starp):
        raise ValueError("invalid Atari BASIC section pointers")
    offset = 14 - vnt
    if starp + offset != len(data):
        raise ValueError("file length does not match Atari BASIC header")
    names = variables(data[14:vnte + offset])
    lines = []
    position = stmtab + offset
    while position < stmcur + offset:
        if position + 3 > len(data):
            raise ValueError("truncated BASIC line")
        line_number = int.from_bytes(data[position:position + 2], "little")
        length = data[position + 2]
        line = data[position:position + length]
        if length < 5 or position + length > stmcur + offset:
            raise ValueError(f"invalid length at line {line_number}")
        listing = ""
        statement_position = 3
        previous_end = 0x14
        while statement_position < length:
            next_position = line[statement_position]
            if not statement_position + 1 < next_position <= length:
                raise ValueError(f"invalid statement offset at line {line_number}")
            command = line[statement_position + 1]
            if command >= len(COMMANDS):
                raise ValueError(f"unknown command ${command:02X} at line {line_number}")
            body = line[statement_position + 2:next_position]
            if command in (0, 1):
                if not body.endswith(b"\x9b"):
                    raise ValueError(f"missing ATASCII line ending at line {line_number}")
                text = COMMANDS[command] + " " + atascii(body[:-1], inverse_as_text=command == 0)
                end = 0x16
            else:
                expression_text, end = expression(body, names)
                text = COMMANDS[command]
                if text and expression_text:
                    text += " "
                text += expression_text
            if listing:
                listing += " " if previous_end == 0x1B else ":"
            listing += text
            previous_end = end
            statement_position = next_position
        lines.append(f"{line_number} {listing}".rstrip())
        position += length
    if position != stmcur + offset:
        raise ValueError("statement table ends mid-line")
    return "\n".join(lines) + "\n"


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path, help="tokenized Atari BASIC .BAS file")
    args = parser.parse_args()
    print(detokenize(args.input.read_bytes()), end="")


if __name__ == "__main__":
    main()
