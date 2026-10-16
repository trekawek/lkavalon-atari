#!/usr/bin/env python3
"""Compile the game with the shared original APX 6502 interpreter."""

import argparse
import json
from pathlib import Path
from shared import ROOT, load

core = load("compile")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--reference", type=Path, default=ROOT / "build/figforth.atr")
    parser.add_argument("--manifest", type=Path, default=ROOT / "sources.json")
    parser.add_argument("--disk3-template", type=Path, default=ROOT / "build/empty.atr")
    parser.add_argument("--output-dir", type=Path, default=ROOT / "build/program")
    parser.add_argument("--progress", action="store_true")
    parser.add_argument("--max-steps", type=int, default=2_000_000_000)
    args = parser.parse_args()
    manifest = json.loads(args.manifest.read_text("ascii"))
    machine = core.ForthMachine(
        args.reference,
        core.read_sources([args.manifest.parent / p for p in manifest["sources"]],
                          game_root=ROOT),
        args.max_steps, args.progress,
    )
    machine.mount_disk(3, args.disk3_template)
    report = machine.run()
    if set(machine.output_disks) != {3}:
        raise core.CompileError("Unexpected target drives")
    args.output_dir.mkdir(parents=True, exist_ok=True)
    (args.output_dir / (ROOT.name + ".atr")).write_bytes(
        core.atr(bytes(machine.output_disks[3]), machine.disk_headers[3])
    )
    (args.output_dir / "compile-report.json").write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps(report, indent=2))


if __name__ == "__main__":
    main()
