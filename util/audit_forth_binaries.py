#!/usr/bin/env python3
"""Reject tracked non-graphic binaries in the three reconstructed Forth games.

Generated ATRs/SAPs may exist locally in ignored build directories. This audit
uses Git's index, so ignored outputs and unrelated historical projects are not
part of the source policy. Raster .bin files contain Atari pixels, not code.
"""

import argparse
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
GAMES = ("ad2044", "klatwa", "wladcy-ciemnosci")
RASTER_DIRS = {
    "ad2044": {"packed", "decoded", "scenes"},
    "klatwa": {"pictures", "rooms", "records", "sprites", "title-animation", "cursors"},
    "wladcy-ciemnosci": {"pictures", "rooms", "records", "sprites", "cursors"},
}


def allowed_binary(path):
    """Recognized native music/font or one of the audited raster locations."""
    path = Path(path)
    game, *parts = path.parts
    if game not in GAMES:
        return False
    if path.suffix in (".png", ".fnt", ".cmc"):
        return True
    if not parts or parts[0] != "graphics":
        return False
    if path.suffix in (".png", ".pic"):
        return True
    if path.suffix != ".bin":
        return False
    return (parts == ["graphics", "title.bin"] or
            len(parts) >= 3 and parts[1] in RASTER_DIRS[game])


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
    print(f"Audited {count} tracked binary files: graphics, fonts and CMC only")


if __name__ == "__main__":
    main()
