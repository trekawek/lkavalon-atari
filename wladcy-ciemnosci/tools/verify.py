#!/usr/bin/env python3
"""Check that genuine Forth compilation reproduced every original sector."""

import json
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "util"))
from reference_media import read_reference

ROOT = Path(__file__).resolve().parents[1]


def main():
    manifest = json.loads((ROOT / "sources.json").read_text())
    for filename in manifest["sources"]:
        source = (ROOT / filename).read_bytes()
        source.decode("ascii")
        assert all(len(line) <= 64 for line in source.splitlines()), filename
    original = read_reference(ROOT / "reference/wladcy-ciemnosci.atr")
    rebuilt = (ROOT / "build/wladcy-ciemnosci.atr").read_bytes()
    assert len(original) == len(rebuilt) == 133136
    if original != rebuilt:
        offset = next(i for i, (a, b) in enumerate(zip(original, rebuilt)) if a != b)
        raise AssertionError(f"First disk difference at file offset ${offset:05X}")
    blank = (ROOT / "build/assets.atr").read_bytes()
    assert not any(blank[16:0x7D10]), "Target contains a fallback copy of program bytes"
    assert blank[0x7D10:] == original[0x7D10:]
    report = json.loads((ROOT / "build/compile-report.json").read_text())
    assert report["sector_writes"] == 250, report
    print("PASS: ASCII sources and all 1040 rebuilt disk sectors match.")
    print(
        "PASS: all 32000 program/residue bytes compiled into an initially blank region."
    )


if __name__ == "__main__":
    main()
