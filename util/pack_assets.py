#!/usr/bin/env python3
"""Pack explicit game assets into writable ATR templates.

The versioned assets/layout.json manifest owns every nonzero asset byte.
Unspecified sectors are zero; the compiler's prefix stays blank. No reference
ATR, opaque disk tail, extraction hash, or generated preview is read here.
"""

import argparse
import importlib.util
import json
from pathlib import Path
import struct
import sys
import structured_assets


class AssetError(ValueError):
    """An asset or its placement violates the manifest contract."""


def _room_builder(root):
    """AD2044 uses human room sources; the other games retain their manifests."""
    root = Path(root).resolve()
    path = root / "tools/content.py"
    if not (root / "world/map.txt").exists() or not path.exists():
        return None
    sys.path.insert(0, str(path.parent))
    try:
        spec = importlib.util.spec_from_file_location("ad2044_content", path)
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        return module
    finally:
        sys.path.pop(0)


def _integer(value, label, minimum=0, maximum=None):
    if type(value) is not int or value < minimum:
        raise AssetError(f"{label}: expected an integer >= {minimum}")
    if maximum is not None and value > maximum:
        raise AssetError(f"{label}: exceeds {maximum}")
    return value


def _path(game_dir, value, label):
    if not isinstance(value, str) or not value or Path(value).is_absolute():
        raise AssetError(f"{label}: expected a relative file path")
    root = Path(game_dir).resolve()
    path = (root / value).resolve()
    if not path.is_relative_to(root):
        raise AssetError(f"{label}: path escapes the game directory")
    return path


def _hex(value, label):
    if not isinstance(value, str):
        raise AssetError(f"{label}: expected hexadecimal text")
    try:
        return bytes.fromhex(value)
    except ValueError as exc:
        raise AssetError(f"{label}: invalid hexadecimal text") from exc


def _disks(manifest):
    if not isinstance(manifest, dict) or type(manifest.get("version")) is not int:
        raise AssetError("assets/layout.json: missing integer version")
    if manifest["version"] != 1:
        raise AssetError(f"Unsupported asset layout version {manifest['version']}")
    disks = manifest.get("disks")
    if not isinstance(disks, list) or not disks:
        raise AssetError("assets/layout.json: expected a nonempty disks list")
    if any(not isinstance(disk, dict) for disk in disks):
        raise AssetError("assets/layout.json: each disk must be an object")
    return disks


def load_manifest(game_dir):
    """Read a game's versioned asset layout, without opening asset files."""
    path = Path(game_dir) / "assets/layout.json"
    try:
        manifest = json.loads(path.read_text(encoding="ascii"))
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        raise AssetError(f"{path}: {exc}") from exc
    _disks(manifest)
    return manifest


def _writes(disk, label):
    writes = disk.get("writes")
    if not isinstance(writes, list) or any(not isinstance(w, dict) for w in writes):
        raise AssetError(f"{label}: expected a writes list")
    return writes


def _parts(write, label):
    parts = write.get("parts")
    if not isinstance(parts, list) or any(not isinstance(p, dict) for p in parts):
        raise AssetError(f"{label}: expected a parts list")
    return parts


def dependencies(game_dir):
    """List the manifest and all authoritative file inputs, without duplicates."""
    root = Path(game_dir).resolve()
    builder = _room_builder(root)
    if builder is not None:
        return builder.dependencies(root)
    result = [root / "assets/layout.json"]
    manifest = load_manifest(root)
    for disk in _disks(manifest):
        label = disk.get("output", "disk")
        for write in _writes(disk, label):
            label = write.get("label", label)
            for part in _parts(write, label):
                if "file" in part:
                    path = _path(root, part["file"], label)
                    for source in structured_assets.dependencies(root, part["file"]):
                        if source not in result:
                            result.append(source)
    return result


def _part_data(root, part, label):
    if "zeros" in part:
        if set(part) != {"zeros"}:
            raise AssetError(f"{label}: zero padding cannot also have file fields")
        return bytes(_integer(part["zeros"], label + " zeros"))
    path = _path(root, part.get("file"), label)
    label = f"{label} [{part['file']}]"
    expected = _integer(part.get("size"), label + " size")
    try:
        data = structured_assets.encode_file(root, part["file"])
    except (OSError, structured_assets.AssetError) as exc:
        raise AssetError(f"{label}: {exc}") from exc
    if len(data) != expected:
        raise AssetError(f"{label}: expected {expected} bytes, found {len(data)}")
    format_name = part.get("format")
    if format_name not in (None, "counted16"):
        raise AssetError(f"{label}: unknown part format {format_name!r}")
    if format_name == "counted16":
        if len(data) < 2 or int.from_bytes(data[:2], "little") + 2 != len(data):
            raise AssetError(f"{label}: invalid counted16 length prefix")
    if "header_hex" in part:
        header = _hex(part["header_hex"], label + " header_hex")
        if not data.startswith(header):
            raise AssetError(f"{label}: fixed header changed")
    take = _integer(part.get("take", len(data)), label + " take", maximum=len(data))
    if format_name == "counted16" and take != len(data):
        raise AssetError(f"{label}: counted16 records cannot be truncated")
    if take < len(data) and "expected_tail_hex" not in part:
        raise AssetError(f"{label}: truncated bytes require expected_tail_hex")
    if "expected_tail_hex" in part:
        tail = _hex(part["expected_tail_hex"], label + " expected_tail_hex")
        if data[take:] != tail:
            raise AssetError(f"{label}: discarded tail changed; edit cannot be packed")
    return data[:take]


def build_disks(game_dir, manifest=None):
    """Return output-path -> ATR bytes, validating all files and placements."""
    root = Path(game_dir).resolve()
    builder = _room_builder(root) if manifest is None else None
    if builder is not None:
        try:
            return builder.build_disks(root)
        except (OSError, ValueError) as exc:
            raise AssetError(str(exc)) from exc
    if manifest is None:
        manifest = load_manifest(root)
    result = {}
    output_paths = set()
    for disk in _disks(manifest):
        output = disk.get("output")
        output_path = _path(root, output, "output")
        if output_path in output_paths:
            raise AssetError(f"{output}: duplicate output path")
        output_paths.add(output_path)
        label = output
        sector_size = _integer(disk.get("sector_size"), label + " sector_size", 1)
        if sector_size != 128:
            raise AssetError(f"{label}: only 128-byte-sector ATRs are supported")
        count = _integer(disk.get("sector_count"), label + " sector_count", 1)
        payload_size = sector_size * count
        paragraphs = payload_size // 16
        if paragraphs > 0xFFFFFF:
            raise AssetError(f"{label}: ATR size exceeds its 24-bit paragraph field")
        prefix = _integer(
            disk.get("compiled_prefix_bytes"),
            label + " compiled prefix",
            maximum=payload_size,
        )
        directory_sector = _integer(
            disk.get("directory_sector", 500), label + " directory sector", 1, count
        )
        directory_start = 16 + (directory_sector - 1) * sector_size
        directory_end = directory_start + sector_size
        if 16 + prefix > directory_start:
            raise AssetError(f"{label}: compiled prefix overlaps the GAM directory")
        disk_id = _integer(disk.get("disk_id"), label + " disk_id", maximum=255)
        groups = disk.get("group_sector_counts")
        if not isinstance(groups, list) or len(groups) > 127:
            raise AssetError(f"{label}: expected at most 127 group sector counts")
        for index, value in enumerate(groups, 1):
            _integer(value, f"{label} group{index} sector count", maximum=255)
        if sum(groups) > count - 1:
            raise AssetError(f"{label}: GAM groups exceed available sectors")
        data = bytearray(16 + payload_size)
        struct.pack_into("<HHH", data, 0, 0x0296, paragraphs & 0xFFFF, sector_size)
        data[6] = paragraphs >> 16
        data[directory_start:directory_end] = (
            bytes([disk_id] + groups) + bytes(127 - len(groups))
        )
        occupied = []
        for index, write in enumerate(_writes(disk, label)):
            write_label = f"{label}: {write.get('label', f'write{index}')}"
            body = b"".join(
                _part_data(root, part, write_label)
                for part in _parts(write, write_label)
            )
            record16 = write.get("record16", False)
            if type(record16) is not bool:
                raise AssetError(f"{write_label}: record16 must be Boolean")
            if record16:
                if len(body) > 65535:
                    raise AssetError(f"{write_label}: record exceeds a 16-bit count")
                body = len(body).to_bytes(2, "little") + body
            spans = write.get("spans")
            if not isinstance(spans, list) or not spans:
                raise AssetError(f"{write_label}: expected nonempty spans")
            cursor = 0
            for span in spans:
                if not isinstance(span, dict):
                    raise AssetError(f"{write_label}: invalid span")
                start = _integer(span.get("offset"), write_label + " offset")
                size = _integer(span.get("length"), write_label + " length", 1)
                end = start + size
                if start < 16 + prefix:
                    raise AssetError(
                        f"{write_label}: span overlaps ATR header or compiled prefix"
                    )
                if end > len(data):
                    raise AssetError(f"{write_label}: span extends beyond disk bounds")
                if start < directory_end and end > directory_start:
                    raise AssetError(
                        f"{write_label}: span overlaps generated GAM directory"
                    )
                for old_start, old_end, old_label in occupied:
                    if start < old_end and end > old_start:
                        raise AssetError(f"{write_label}: span overlaps {old_label}")
                if cursor + size > len(body):
                    raise AssetError(f"{write_label}: spans exceed generated bytes")
                occupied.append((start, end, write_label))
                data[start:end] = body[cursor : cursor + size]
                cursor += size
            if cursor != len(body):
                raise AssetError(
                    f"{write_label}: spans cover {cursor} bytes, generated {len(body)}"
                )
        result[output] = bytes(data)
    return result


def prepare(game_dir):
    """Validate every template, then write targets to refresh Make timestamps."""
    root = Path(game_dir).resolve()
    outputs = build_disks(root)
    for output, data in outputs.items():
        path = _path(root, output, "output")
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)
        print(f"Prepared {path}: {len(data) - 16} payload bytes from explicit assets")
    return outputs


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--game-dir", type=Path, default=Path.cwd())
    parser.add_argument("--dependencies", action="store_true")
    args = parser.parse_args()
    try:
        if args.dependencies:
            print(" ".join(map(str, dependencies(args.game_dir))))
        else:
            prepare(args.game_dir)
    except (AssetError, structured_assets.AssetError) as exc:
        parser.exit(1, f"asset packing failed: {exc}\n")


if __name__ == "__main__":
    main()
