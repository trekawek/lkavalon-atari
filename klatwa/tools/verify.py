#!/usr/bin/env python3
"""Verify the original executable and current authored assets, without game ATR fixtures."""

import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT.parent / "util"))
from gam_program import PROGRAMS, boot_bytes, verify_authored_program, validate_atr


def verify(root=ROOT):
    from gam_content import build_disks

    root = Path(root)
    game = root.name
    manifest = json.loads((root / "sources.json").read_text("ascii"))
    for filename in manifest["sources"]:
        source = (root / filename).read_bytes()
        source.decode("ascii")
        if any(len(line) > 64 for line in source.splitlines()):
            raise ValueError(f"Forth source exceeds 64 columns: {filename}")
    compiled = (root / "build" / (game + ".atr")).read_bytes()
    template = (root / "build/assets.atr").read_bytes()
    expected = build_disks(root)["build/assets.atr"]
    if template != expected:
        raise ValueError("Resource template is stale; rebuild the authored content")
    validate_atr(template)
    end = 16 + boot_bytes(game)
    if any(template[16:end]):
        raise ValueError("The resource template contains executable bytes")
    digest = verify_authored_program(compiled, root)
    if compiled[:16] != template[:16] or compiled[end:] != template[end:]:
        raise ValueError("Compiled disk differs from its authored resource template")
    if compiled[15]:
        raise ValueError("The game disk must be writable for saved games")
    report_path = root / "build/program/compile-report.json"
    if report_path.exists():
        report = json.loads(report_path.read_text("ascii"))
        if report["sector_writes"] != PROGRAMS[game][0]:
            raise ValueError(f"Unexpected compiler sector-write count: {report['sector_writes']}")
    return {"program_bytes": boot_bytes(game), "program_sha256": digest,
            "resources_match_authored_inputs": True,
            "original_executable": digest == PROGRAMS[game][1]}


def main():
    result = verify()
    if result["original_executable"]:
        print(f"PASS: ASCII Forth sources and all {result['program_bytes']} original executable bytes.")
    else:
        print("PASS: original executable code and the current authored initial world.")
    print("PASS: disk contains the current authored resources; program template is blank.")


if __name__ == "__main__":
    main()
