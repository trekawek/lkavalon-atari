#!/usr/bin/env python3
"""Extract Heartlight's palette and cave data from its ASCII BASIC listing."""

from pathlib import Path
import sys


def listing_data(path: Path) -> dict[int, bytes]:
    result = {}
    for line in path.read_text(encoding="ascii").splitlines():
        line_number, separator, statement = line.partition(" ")
        if not separator or not line_number.isdigit():
            raise ValueError(f"invalid BASIC listing line: {line!r}")
        if statement.startswith("DATA "):
            number = int(line_number)
            if number in result:
                raise ValueError(f"duplicate DATA in BASIC line {number}")
            result[number] = statement[5:].encode("ascii")
    return result


def segment(start: int, data: bytes) -> bytes:
    return start.to_bytes(2, "little") + (start + len(data) - 1).to_bytes(2, "little") + data


def main() -> None:
    source, target = map(Path, sys.argv[1:])
    data = listing_data(source)
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
