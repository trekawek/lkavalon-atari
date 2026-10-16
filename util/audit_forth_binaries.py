#!/usr/bin/env python3
"""Reject tracked binaries other than graphics, fonts and music in Forth games.

Generated ATRs/SAPs may exist locally in ignored build directories. This audit
uses Git's index, so ignored outputs and unrelated historical projects are not
part of the source policy. Compressed intermediates and raw raster duplicates
belong in build/; source pictures are PNGs and the cursor uses a native PMG.
"""

import argparse
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
GAMES = ("ad2044", "klatwa", "wladcy-ciemnosci")


def allowed_binary(path):
    """Recognized graphics/font/music inputs, without obsolete binary aliases."""
    path = Path(path)
    if not path.parts:
        return False
    game = path.parts[0]
    if game not in GAMES:
        return False
    if path == Path(game) / "interface/cursor.pmg" or str(path) == "ad2044/music/ad2044.snd":
        return True
    return path.suffix in (".png", ".fnt", ".cmc")


def audit(root=ROOT):
    root = Path(root)
    names = subprocess.check_output(
        ["git", "ls-files", "-z", "--", *GAMES], cwd=root).decode().split("\0")
    failures, count = [], 0
    for name in filter(None, names):
        path = root / name
        if not path.exists():  # Working-tree removals awaiting staging.
            continue
        raw = path.read_bytes()
        try:
            text = raw.decode("utf-8")
            binary = "\0" in text or path.suffix in (".bin", ".atr", ".sap", ".gam")
        except UnicodeDecodeError:
            binary = True
        if binary:
            count += 1
            if not allowed_binary(name):
                failures.append(name)
    return count, failures


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=ROOT)
    args = parser.parse_args()
    count, failures = audit(args.root)
    if failures:
        raise SystemExit("Forbidden binary sources:\n" + "\n".join(failures))
    print(f"Audited {count} tracked binary files: graphics, fonts and music only")


if __name__ == "__main__":
    main()
