#!/usr/bin/env python3
"""Compile Klatwa sources through the original APX 6502 interpreter."""

import argparse, json
from shared import ROOT, load

core = load("compile")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--progress", action="store_true")
    parser.add_argument("--max-steps", type=int, default=2_000_000_000)
    args = parser.parse_args()
    manifest = json.loads((ROOT / "sources.json").read_text())
    machine = core.ForthMachine(
        ROOT / "reference/figforth.atr",
        core.read_sources([ROOT / p for p in manifest["sources"]]),
        args.max_steps,
        args.progress,
    )
    machine.mount_disk(3, ROOT / "build/assets.atr")
    report = machine.run()
    assert set(machine.output_disks) == {3}, "Unexpected target drives"
    (ROOT / "build/klatwa.atr").write_bytes(
        core.atr(bytes(machine.output_disks[3]), machine.disk_headers[3])
    )
    (ROOT / "build/compile-report.json").write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps(report, indent=2))


if __name__ == "__main__":
    main()
