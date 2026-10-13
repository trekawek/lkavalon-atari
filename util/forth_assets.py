#!/usr/bin/env python3
"""Expand native binary assets into portable ASCII Forth byte emission.

The checked-in sources are build inputs: a standalone ``INCBIN path`` line
is a build directive, not an APX Forth word. Both the 6502 compiler harness
and source-screen packers expand it with this module before feeding APX.
The resulting source ATR contains ordinary ``BYTES`` lines and is directly
compilable with the checked-in Forth metacompiler on Atari hardware.

Paths are relative to the game directory. Only the declared fixed-size
assets are supported. Missing, resized or unrecognized assets are errors;
there is no fallback to a game ATR, extraction output or cached source.
Regeneration uses the address metadata to preserve directives without
overwriting the current native assets.
"""

from __future__ import annotations

import argparse
import structured_assets
from pathlib import Path


# Target addresses, not ATR offsets. End addresses are exclusive. Cursor
# spans deliberately omit the following saved ;S token (77 12).
ASSETS_BY_GAME = {
    "ad2044": (
        {"path": "graphics/packed/cursor-players.bin", "start": 0x4CA1, "size": 39},
        {"path": "music/sound-bank.json", "start": 0x5E00, "size": 0xE2F},
    ),
    "klatwa": (
        {"path": "graphics/cursors/player-planes.bin", "start": 0x4E8D, "size": 39},
    ),
    "wladcy-ciemnosci": (
        {"path": "graphics/cursors/player-planes.bin", "start": 0x4E9C, "size": 39},
    ),
}
ASSET_SIZES = {
    asset["path"]: asset["size"]
    for assets in ASSETS_BY_GAME.values()
    for asset in assets
}
BYTES_PER_LINE = 28  # 'BYTES ' + 56 hex digits = 62 columns, leaving a delimiter.


class AssetError(ValueError):
    """An INCBIN input cannot be represented by the declared target layout."""


def dependencies(game: str) -> tuple[str, ...]:
    """Return game-relative native inputs for build prerequisites."""
    return tuple(asset["path"] for asset in ASSETS_BY_GAME[game])


def bytes_lines(data: bytes):
    """Emit arbitrary bytes using only existing APX metacompiler words."""
    for start in range(0, len(data), BYTES_PER_LINE):
        yield "BYTES " + data[start:start + BYTES_PER_LINE].hex().upper()


def read_asset(game_root: Path, name: str) -> bytes:
    """Read a declared native input, enforcing its fixed target extent."""
    if name not in ASSET_SIZES:
        raise AssetError(f"unsupported INCBIN asset: {name}")
    root = Path(game_root).resolve()
    path = root / name
    if not path.resolve().is_relative_to(root):
        raise AssetError(f"INCBIN asset escapes game directory: {name}")
    try:
        data = structured_assets.encode_file(root, name)
    except (OSError, structured_assets.AssetError) as exc:
        raise AssetError(f"cannot read INCBIN asset {name}: {exc}") from exc
    expected = ASSET_SIZES[name]
    if len(data) != expected:
        raise AssetError(
            f"INCBIN asset {name}: expected {expected} bytes, got {len(data)}"
        )
    return data


def source_lines(path: Path, game_root: Path):
    """Yield (filename, original line number, expanded ASCII line).

Every generated line retains the directive's source location for compiler
errors and source-screen mapping. Ordinary lines and comments are unchanged.
"""
    path = Path(path)
    for number, line in enumerate(path.read_bytes().decode("ascii").splitlines(), 1):
        fields = line.split()
        if fields and fields[0] == "INCBIN":
            if len(fields) != 2:
                raise AssetError(f"{path}:{number}: INCBIN requires one asset path")
            try:
                data = read_asset(game_root, fields[1])
            except AssetError as exc:
                raise AssetError(f"{path}:{number}: {exc}") from exc
            for expanded in bytes_lines(data):
                yield str(path), number, expanded
        else:
            yield str(path), number, line


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--game", choices=tuple(ASSETS_BY_GAME), required=True)
    parser.add_argument("--dependencies", action="store_true", required=True)
    args = parser.parse_args()
    print(" ".join(dependencies(args.game)))


if __name__ == "__main__":
    main()
