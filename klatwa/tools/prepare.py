#!/usr/bin/env python3
"""Prepare the disk with every boot/residual-code sector blank."""

from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
HEADER = bytes.fromhex("96028020800000000000000000000000")


def main():
    tail = (ROOT / "assets/disk-tail.bin").read_bytes()
    assert len(tail) == 133120 - 32000
    build = ROOT / "build"
    build.mkdir(exist_ok=True)
    path = build / "assets.atr"
    data = HEADER + bytes(32000) + tail
    if not path.exists() or path.read_bytes() != data:
        path.write_bytes(data)
    print("Prepared disk: all 32000 boot/residual-code bytes are blank.")


if __name__ == "__main__":
    main()
