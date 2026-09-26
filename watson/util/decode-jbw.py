#!/usr/bin/env python3
"""Decode the line-based JBW editor files in the LK Avalon backup ZIP."""

import argparse
import sys
from pathlib import Path
from zipfile import ZipFile


def decode(data: bytes) -> bytes:
    if len(data) < 2 or data[0] != 0 or data[-1] != 0:
        raise ValueError("expected zero-delimited JBW source")

    position = 1
    lines = []
    while position < len(data) - 1:
        length = data[position]
        end = position + length
        if length < 2 or end >= len(data) or data[end - 1] != length:
            raise ValueError(f"invalid line record at offset {position}")

        encoded = data[position + 1 : end - 1]
        line = bytearray()
        index = 0
        while index < len(encoded):
            value = encoded[index]
            index += 1
            if value & 0x80:
                if index == len(encoded):
                    raise ValueError(f"incomplete repeat at offset {position}")
                line.extend([value & 0x7F] * (encoded[index] + 1))
                index += 1
            else:
                line.append(value)
        lines.append(bytes(line))
        position = end

    if position != len(data) - 1:
        raise ValueError("trailing data")
    return b"\x9b".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("archive", type=Path)
    parser.add_argument("member", help="path of the packed source in the ZIP")
    args = parser.parse_args()
    with ZipFile(args.archive) as archive:
        sys.stdout.buffer.write(decode(archive.read(args.member)))


if __name__ == "__main__":
    main()
