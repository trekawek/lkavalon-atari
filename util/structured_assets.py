#!/usr/bin/env python3
"""Encode typed game resources; binary graphics remain ordinary file inputs.

JSON documents name their format and version. Each format's encoder owns the
layout, so counts, strings and compression are generated from editable fields.
References are relative to the game directory, including references nested in
other structured resources. No extraction snapshot or reference ATR is read.
"""

import argparse
import importlib.util
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CODECS = {
    "ad2044": ROOT / "ad2044/tools/asset_formats.py",
    "gam": ROOT / "klatwa/tools/asset_formats.py",
    "sound": ROOT / "util/sound_assets.py",
}
_modules = {}


class AssetError(ValueError):
    pass


def _path(root, name):
    root = Path(root).resolve()
    path = (root / name).resolve()
    if Path(name).is_absolute() or not path.is_relative_to(root):
        raise AssetError(f"Asset path escapes the game directory: {name}")
    return path


def _document(path):
    try:
        doc = json.loads(path.read_text(encoding="ascii"))
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        raise AssetError(f"{path}: {exc}") from exc
    if (not isinstance(doc, dict) or type(doc.get("version")) is not int
            or doc["version"] != 1):
        raise AssetError(f"{path}: expected a version 1 structured asset")
    format_name = doc.get("format")
    if not isinstance(format_name, str) or format_name.split(".")[0] not in CODECS:
        raise AssetError(f"{path}: unsupported structured format {format_name!r}")
    prefix = format_name.split(".")[0]
    if prefix not in _modules:
        spec = importlib.util.spec_from_file_location("asset_codec_" + prefix, CODECS[prefix])
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        _modules[prefix] = module
    return doc, _modules[prefix]


def encode_file(game_dir, name, _stack=()):
    """Read a native graphics file or encode a versioned JSON resource."""
    path = _path(game_dir, name)
    if path in _stack:
        raise AssetError(f"Cyclic asset reference: {path}")
    if path.suffix != ".json":
        return path.read_bytes()
    doc, codec = _document(path)
    try:
        data = codec.encode(doc, lambda child: encode_file(game_dir, child, _stack + (path,)))
    except (ValueError, KeyError, TypeError, OverflowError, OSError) as exc:
        raise AssetError(f"{path}: {exc}") from exc
    if not isinstance(data, (bytes, bytearray)):
        raise AssetError(f"{path}: encoder did not return bytes")
    return bytes(data)


def dependencies(game_dir, name, _stack=()):
    """Return every source file used by a native or structured asset."""
    path = _path(game_dir, name)
    if path in _stack:
        raise AssetError(f"Cyclic asset reference: {path}")
    result = {path}
    if path.suffix == ".json":
        doc, codec = _document(path)
        for child in codec.dependencies(doc):
            result.update(dependencies(game_dir, child, _stack + (path,)))
    return sorted(result)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", help="asset path relative to --game-dir")
    parser.add_argument("--game-dir", type=Path, default=Path.cwd())
    parser.add_argument("--output", type=Path)
    parser.add_argument("--dependencies", action="store_true")
    args = parser.parse_args()
    if args.dependencies:
        print(" ".join(map(str, dependencies(args.game_dir, args.source))))
    elif args.output:
        data = encode_file(args.game_dir, args.source)
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_bytes(data)
        print(f"Encoded {args.source}: {len(data)} bytes -> {args.output}")
    else:
        parser.error("provide --output or --dependencies")


if __name__ == "__main__":
    main()
