#!/usr/bin/env python3
"""Check the linked XEX against the archive's combined font/code image."""

from pathlib import Path
import sys


def main() -> None:
    executable, combined = map(Path, sys.argv[1:])
    data = executable.read_bytes()
    memory = bytearray(65536)
    position = 0
    while position < len(data):
        if data[position : position + 2] == b"\xff\xff":
            position += 2
        if position + 4 > len(data):
            raise ValueError("truncated XEX segment header")
        start = int.from_bytes(data[position : position + 2], "little")
        end = int.from_bytes(data[position + 2 : position + 4], "little")
        position += 4
        length = end - start + 1
        if length <= 0 or position + length > len(data):
            raise ValueError("invalid XEX segment length")
        memory[start : end + 1] = data[position : position + length]
        position += length

    original = combined.read_bytes()
    if memory[0x9014:0x9900] != original:
        raise ValueError("loaded font/code differs from the archived HL.DTA")
    if memory[0x02E0:0x02E2] != b"\x60\x92":
        raise ValueError("wrong Heartlight startup address")
    if memory[0x7000:0x7003] != bytes((3, 2, 4)):
        raise ValueError("wrong Heartlight cave settings")
    print("Heartlight XEX: original font/code image, cave settings, and RUNAD verified.")


if __name__ == "__main__":
    main()
