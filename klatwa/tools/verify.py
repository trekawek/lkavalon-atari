#!/usr/bin/env python3
"""Verify source completeness and every reconstructed Klatwa disk sector."""

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def main():
    manifest = json.loads((ROOT / "sources.json").read_text())
    for filename in manifest["sources"]:
        raw = (ROOT / filename).read_bytes()
        raw.decode("ascii")
        assert all(len(line) <= 64 for line in raw.splitlines()), filename
    original = (ROOT / "reference/klatwa-v1.atr").read_bytes()
    rebuilt = (ROOT / "build/klatwa.atr").read_bytes()
    assert len(original) == len(rebuilt) == 133136
    assert original[:16] == rebuilt[:16]
    if original[16:] != rebuilt[16:]:
        position = next(
            i for i in range(16, len(original)) if original[i] != rebuilt[i]
        )
        raise AssertionError(
            f"Sector {(position - 16) // 128 + 1}, byte {(position - 16) % 128}: "
            f"rebuilt {rebuilt[position]:02X}, expected {original[position]:02X}"
        )
    blank = (ROOT / "build/assets.atr").read_bytes()
    assert len(blank) == len(original)
    assert not any(blank[16:0x7D10]), "Template contains saved program/residual code"
    assert blank[0x7D10:] == original[0x7D10:]
    report = json.loads((ROOT / "build/compile-report.json").read_text())
    assert report["sector_writes"] == 250, report
    assert report["output_bytes"] == {"3": 133120}, report
    dictionary = json.loads((ROOT / "dictionary.json").read_text())
    words = dictionary["words"]
    assert len(words) == 902 and dictionary["statistics"]["DOCOL"] == 519
    assert len({word["cfa"] for word in words}) == len(words)
    for previous, following in zip(words, words[1:]):
        assert previous["end"] == following["nfa"]
    print("PASS: all 1040 sectors and ATR metadata match Klatwa v1 exactly.")
    print("PASS: ASCII sources rebuild 32000 blank boot/residual-code bytes.")
    print("PASS: 902 dictionary entries, 519 colon definitions; 250 sector writes.")


if __name__ == "__main__":
    main()
