#!/usr/bin/env python3
"""Independent media and source-completeness checks after Forth compilation."""
import json
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "util"))
from reference_media import read_reference

ROOT = Path(__file__).resolve().parents[1]


def main():
    manifest = json.loads((ROOT / 'sources.json').read_text())
    for name in manifest['sources']:
        source = (ROOT / name).read_bytes()
        source.decode('ascii')
        assert all(len(line) <= 64 for line in source.splitlines()), name
    for side in (1, 2):
        original = read_reference(ROOT / f'reference/ad2044-side{side}.atr')
        rebuilt = (ROOT / f'build/ad2044-side{side}.atr').read_bytes()
        assert len(original) == len(rebuilt) == 133136
        # The source ATR marks the disk write-protected. Built disks must be
        # writable during compilation; every sector byte must still match.
        assert original[:15] == rebuilt[:15]
        assert rebuilt[15] == 0
        if original[16:] != rebuilt[16:]:
            pos = next(i for i in range(16, len(original)) if original[i] != rebuilt[i])
            raise AssertionError(f'side {side}, sector {(pos-16)//128+1}, '
                                 f'offset {(pos-16)%128}: '
                                 f'{rebuilt[pos]:02X} != {original[pos]:02X}')
    blank = (ROOT / 'build/assets-side1.atr').read_bytes()
    assert not any(blank[16:0x84B7]), 'asset template contains executable code'
    report = json.loads((ROOT / 'build/compile-report.json').read_text())
    assert report['sector_writes'] == 266, report
    print('PASS: ASCII sources; all 2080 game sectors match the supplied disks.')
    print('PASS: all 33959 program bytes rebuilt from Forth into a blank region.')
    print('Only ATR metadata byte 15 differs (write protection cleared).')


if __name__ == '__main__':
    main()
