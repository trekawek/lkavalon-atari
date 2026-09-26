#!/usr/bin/env python3
"""Extract Heartlight's palette and cave data from the saved Atari BASIC file."""

from pathlib import Path
import sys


def word(data: bytes, offset: int) -> int:
    return int.from_bytes(data[offset : offset + 2], "little")


def basic_data(path: Path) -> dict[int, bytes]:
    saved = path.read_bytes()
    # Atari BASIC's SAVE format omits the memory used before the variable table.
    file_offset = word(saved, 2) - 14
    cursor = word(saved, 8) - file_offset
    end = word(saved, 10) - file_offset
    if word(saved, 12) - file_offset != len(saved):
        raise ValueError("unexpected Atari BASIC file length")

    result = {}
    while cursor < end:
        number = word(saved, cursor)
        length = saved[cursor + 2]
        if length < 5 or cursor + length > end:
            raise ValueError(f"invalid BASIC line {number}")
        statement = 3
        while statement < length:
            next_statement = saved[cursor + statement]
            token = saved[cursor + statement + 1]
            if not statement + 2 <= next_statement <= length:
                raise ValueError(f"invalid statement in BASIC line {number}")
            if token == 1:  # DATA
                value = saved[cursor + statement + 2 : cursor + next_statement]
                if not value.endswith(b"\x9b") or number in result:
                    raise ValueError(f"invalid DATA in BASIC line {number}")
                result[number] = value[:-1]
            statement = next_statement
        cursor += length
    if cursor != end:
        raise ValueError("invalid end of BASIC program")
    return result


def segment(start: int, data: bytes) -> bytes:
    return start.to_bytes(2, "little") + (start + len(data) - 1).to_bytes(2, "little") + data


def main() -> None:
    source, target = map(Path, sys.argv[1:])
    data = basic_data(source)
    colors = bytes(map(int, data[1030].split(b",")))
    settings = bytes(map(int, data[1050].split(b",")))
    rows = [value for number, value in data.items() if 1070 <= number < 10000 and value.startswith(b"/")]
    if len(colors) != 5 or len(settings) != 3 or len(rows) != 1 + 12 * settings[2]:
        raise ValueError("unexpected Heartlight palette or cave count")
    if any(len(row) != 22 or row[-1:] != b"/" for row in rows):
        raise ValueError("unexpected Heartlight cave row")
    caves = settings + b"".join(row[1:-1] for row in rows)
    target.write_bytes(b"\xff\xff" + segment(0x02C4, colors) + segment(0x7000, caves))


if __name__ == "__main__":
    main()
