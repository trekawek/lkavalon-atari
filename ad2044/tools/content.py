#!/usr/bin/env python3
"""Compile AD2044's rooms, text, pictures and initial world into GAM disks.

The executable fixes resource IDs, not their byte lengths or physical sectors.
Lengths, compression, directories, empty space and the initial save are generated.
No original ATR, extraction report or serialized disk layout is a build input.
"""

from __future__ import annotations

import argparse
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "util"))
from text_sections import quoted_strings, read_sections

import disk
import pictures
import room_text
import world

ROOT = Path(__file__).resolve().parents[1]
SOURCE_DIRS = ("world", "rooms", "items", "interface", "ending")


def record(body):
    if not 0 < len(body) <= 65535:
        raise ValueError("Resource bodies must contain 1..65535 bytes")
    return len(body).to_bytes(2, "little") + body


def collection(records):
    if set(records) != set(range(len(records))):
        raise ValueError(f"Resource IDs must be contiguous from zero: {sorted(records)}")
    return b"".join(record(records[n]) for n in range(len(records))) + b"\0\0"


def source_file(directory, name):
    path = directory / name
    if not path.resolve().is_relative_to(directory.resolve()):
        raise ValueError(f"Asset path escapes its folder: {name}")
    return path


def scene(directory, ending=False):
    """Read the small resource placement table beside its images and hitmaps."""
    path = directory / "scene.txt"
    result = {}
    for number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        fields = line.split("#", 1)[0].split()
        if not fields:
            continue
        try:
            if fields[0] == "message":
                if not ending:
                    raise ValueError("Only the ending scene accepts a message row")
                if 1 in result:
                    raise ValueError("The ending must have exactly one message row")
                texts = quoted_strings(line.strip()[len("message"):])
                result[1] = record(collection({0: message(texts)}))
                continue
            kind, index = fields[0], int(fields[1])
            if index < 2 or index in result:
                raise ValueError("Resource ID must be unique and at least 2")
            if directory.parent.name in ("rooms", "items") and index in (2, 3):
                expected = "picture" if index == 2 else "hitmap"
                if kind != expected:
                    raise ValueError(f"Resource {index} must be the base {expected}")
            if kind == "picture" and len(fields) in (6, 7):
                _, _, filename, x, y, colors = fields[:6]
                colors = None if colors == "-" else [int(v, 16) for v in colors.split(",")]
                flag = None if len(fields) == 6 or fields[6] == "-" else int(fields[6])
                body = pictures.encode_picture(source_file(directory, filename).read_bytes(),
                                               int(x), int(y), colors, flag)
            elif kind == "hitmap" and len(fields) == 3:
                body = room_text.encode_hitmap(source_file(directory, fields[2]))
                if index == 3 and body[0] > 21:
                    # COMPOSE-CURRENT-VIEW sets base hitmap height to 16.
                    raise ValueError("Base hitmap width exceeds its 21-column runtime buffer")
            elif kind == "placeholder" and len(fields) == 3:
                body = bytes([int(fields[2])])
            else:
                raise ValueError("Expected picture, hitmap or placeholder row; see rooms/README.md")
            result[index] = body
        except (ValueError, IndexError, OSError) as exc:
            raise ValueError(f"{path}:{number}: {exc}") from exc
    if ending and 1 not in result:
        raise ValueError(f"{path}: the ending requires a message row")
    return result


def message(texts, title_font=False):
    """Encode displayed lines; line counts and lengths are generated."""
    lines = []
    for text in texts:
        if not isinstance(text, str):
            raise ValueError("Expected a string for each displayed line")
        if title_font:
            # The title font uses ASCII space; the room font uses '='.
            # Explicit glyph escapes still retain their requested byte.
            text = text.replace(" ", "\\x20")
        raw = room_text.glyph_bytes(text)
        if len(raw) > 255:
            raise ValueError("A message line exceeds 255 glyphs")
        lines.append(bytes([len(raw)]) + raw)
    if not 1 <= len(lines) <= 255:
        raise ValueError("Expected 1..255 displayed lines")
    return bytes([len(lines)]) + b"".join(lines)


def build_groups(root=ROOT):
    root = Path(root)
    interface = root / "interface"
    credits = collection({n: message(lines, title_font=True) for n, lines in
                          read_sections(interface / "credits.txt", expected_ids=range(8)).items()})
    # Credit pages 1..3 are empty in the executable's four-page interface.
    credit_pages = b"".join(record(body) for body in (credits, b"\0\0", b"\0\0", b"\0\0"))
    groups = {
        (1, 3): collection({0: pictures.encode_fullscreen((interface / "title.png").read_bytes()),
                            1: pictures.encode_font((interface / "title.fnt").read_bytes()),
                            2: credit_pages}),
        (1, 4): collection({0: pictures.encode_fullscreen((interface / "frame.png").read_bytes()),
                            1: pictures.encode_font((interface / "game.fnt").read_bytes())}),
    }
    room_scenes = {}
    for room_id in list(range(35)) + [36]:
        directory = root / "rooms" / f"{room_id:02d}"
        records = scene(directory)
        room_scenes[room_id] = records
        # Resource zero is the old editor's label list, never read by the game.
        records[0] = b"\0\0"
        records[1] = (b"\1" if room_id == 36 else
                      room_text.encode_actions(directory / "actions.txt"))
        key = (1, room_id + 5) if room_id < 14 else (2, room_id - 13)
        groups[key] = collection(records)

    inventory = bytearray()
    item_ids = set()
    item_pictures = {}
    for bank in range(6):
        first = 102 + bank * 4
        directory = root / "items" / f"{first:03d}-{first + 3:03d}"
        records = scene(directory)
        item_ids.update(first + slot for slot in range(4) if 2 * slot + 2 in records)
        item_pictures.update({first + slot: (records[2 * slot + 2], records[2 * slot + 3])
                              for slot in range(4) if 2 * slot + 2 in records})
        # INVENTORY-RESOURCE-BASE starts two bytes into record zero. Its nested
        # framing must land at the same next record as the ordinary outer walk.
        records[0] = b"\5\0\1\0\1\0\0"
        records[1] = room_text.encode_actions(directory / "actions.txt")
        data = collection(records)
        if len(data) > 512:
            raise ValueError(f"{directory}: inventory bank needs {len(data)} bytes; capacity is 512")
        inventory.extend(data.ljust(512, b"\0"))
    inventory.extend(bytes(3 * 512))  # Empty banks reserved by the executable.
    rooms = world.read_world(root)
    selected_items = set(world.read_initial(root)["inventory"]) - {0}
    selected_items.update(value for room in rooms
                          for objects in room["views"].values()
                          for value in objects if value >= 102)
    if missing := selected_items - item_ids:
        raise ValueError(f"Initial state selects inventory items without pictures/actions: {sorted(missing)}")
    for room in rooms:
        if room["id"] == 35:  # World entry retained; this disk slot is the ending.
            continue
        resources = room_scenes[room["id"]]
        for view, objects in room["views"].items():
            for drawable in filter(None, objects):
                try:
                    picture, hitmap = (item_pictures[drawable] if drawable >= 102 else
                                       (resources[2 * drawable + 2], resources[2 * drawable + 3]))
                    pictures.validate_overlay(resources[2 * view + 2], picture,
                                              resources[2 * view + 3], hitmap)
                except (KeyError, ValueError) as exc:
                    raise ValueError(f"Room {room['id']:02d}, view {view}, drawable {drawable}: {exc}") from exc
    state = world.build_state(root, rooms)
    groups.update({(1, 19): state, (1, 20): state,
                   (1, 21): bytes(inventory), (1, 23): bytes(inventory)})
    ending = root / "ending"
    records = scene(ending, ending=True)
    records[0] = pictures.encode_fullscreen((ending / "background.png").read_bytes())
    groups[2, 22] = collection(records)
    return groups


def dependencies(root=ROOT):
    root = Path(root).resolve()
    # Fail during Make's dependency scan too: removing a required source must
    # not leave a cached disk looking current merely because the file vanished.
    disk.allocations(build_groups(root))
    return sorted(p for name in SOURCE_DIRS for p in (root / name).rglob("*")
                  if p.is_file() and p.suffix != ".md")


def build_disks(root=ROOT):
    return disk.build_disks(build_groups(root))


def prepare(root=ROOT):
    root = Path(root)
    groups = build_groups(root)
    for name, data in disk.build_disks(groups).items():
        path = root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)
        print(f"Wrote {name} ({len(data)} bytes)")
    (root / "build/disk-layout.txt").write_text(disk.describe(groups))


def link_program(program, root=ROOT):
    """Combine independently compiled code and assets for quick content edits."""
    root = Path(root)
    code = Path(program).read_bytes()
    template = bytearray((root / "build/assets-side1.atr").read_bytes())
    end = 16 + disk.COMPILED_PREFIX_BYTES
    if len(code) < end or code[:2] != b"\x96\x02":
        raise ValueError("Compiled program is not a complete AD2044 program ATR")
    if any(template[16:end]):
        raise ValueError("Asset template must leave executable space blank")
    template[16:end] = code[16:end]
    (root / "build/ad2044-side1.atr").write_bytes(template)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--dependencies", action="store_true")
    mode.add_argument("--empty-disk", type=Path)
    mode.add_argument("--link", type=Path, metavar="PROGRAM_ATR")
    args = parser.parse_args()
    if args.dependencies:
        print(" ".join(str(p.relative_to(ROOT)) for p in dependencies()))
    elif args.empty_disk:
        args.empty_disk.parent.mkdir(parents=True, exist_ok=True)
        # Boot compilation needs readable sectors, but no game assets.
        args.empty_disk.write_bytes(disk.build_disks({})["build/assets-side1.atr"])
    elif args.link:
        link_program(args.link)
    else:
        prepare()
