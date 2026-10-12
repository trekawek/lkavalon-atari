#!/usr/bin/env python3
"""Prepare game media from non-code assets, leaving ALL program bytes blank."""
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
HEADER = bytes.fromhex('96028020800000000000000000000000')


def main():
    build = ROOT / 'build'
    build.mkdir(exist_ok=True)
    tail = (ROOT / 'assets/side1-tail.bin').read_bytes()
    second = (ROOT / 'assets/side2-data.bin').read_bytes()
    assert len(tail) == 133136 - 0x84B7
    assert len(second) == 133120
    # The compiler writes every byte preceding the assets, including the boot
    # loader, kernel, framework, game definitions, and duplicated continuation.
    blank = bytes(0x84B7 - 16) + tail
    (build / 'assets-side1.atr').write_bytes(HEADER + blank)
    (build / 'ad2044-side2.atr').write_bytes(HEADER + second)
    print('Prepared asset disks; 33959 bytes of side-one program remain blank')


if __name__ == '__main__':
    main()
