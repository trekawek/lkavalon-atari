#!/usr/bin/env python3
"""Make a writable target disk with all code and saved-code residue blank."""

from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PREFIX = 0x7D00
HEADER = bytes.fromhex("96028020800000000000000000000000")


def main():
    tail = (ROOT / "assets/disk-tail.bin").read_bytes()
    assert len(tail) == 133120 - PREFIX
    build = ROOT / "build"
    build.mkdir(exist_ok=True)
    target = build / "assets.atr"
    data = HEADER + bytes(PREFIX) + tail
    if not target.exists() or target.read_bytes() != data:
        target.write_bytes(data)
    print(f"Prepared target with all {PREFIX} program/residue bytes blank")


if __name__ == "__main__":
    main()
