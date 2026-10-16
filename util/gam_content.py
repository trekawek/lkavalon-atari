#!/usr/bin/env python3
"""Build Klątwa/Władcy resources from rooms, pictures and readable text."""

import argparse
import json
from pathlib import Path
import shlex
import struct
import sys

from gam_program import boot_bytes, validate_atr
import gam_assets as assets
import gam_world as world
from gam_limits import validate_groups

GAMES = {"klatwa": (30, 22), "wladcy-ciemnosci": (24, 15)}
ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "ad2044/tools"))
import pictures


def word(value):
    if type(value) is not int or not 0 <= value <= 65535:
        raise ValueError(f"Invalid unsigned cell {value!r}")
    return value.to_bytes(2, "little")


def record(body):
    if not body:
        raise ValueError("Empty GAM record would terminate its parent")
    return word(len(body)) + body


def records(bodies, terminated=False):
    return b"".join(record(body) for body in bodies) + (b"\0\0" if terminated else b"")


def lines(path):
    for number, line in enumerate(path.read_text("utf-8").splitlines(), 1):
        fields = shlex.split(line, comments=True)
        if fields:
            yield number, fields


def source_path(root, base, value):
    path = (base / value).resolve()
    if not path.is_relative_to(root.resolve()):
        raise ValueError(f"Source path escapes game directory: {value}")
    return path


def art(root, directory):
    """Read resource ID/variant/placement rows; positions never live in PNGs."""
    result, nested = {}, {}
    path = root / directory / "art.txt"
    for number, fields in lines(path):
        kind, resource, variant, *args = fields
        resource = int(resource)
        if not 0 <= resource < 256:
            raise ValueError(f"{path}:{number}: invalid resource ID")
        if kind == "picture" and len(args) == 3:
            filename, x, y = args
            body = assets.encode_picture(source_path(root, path.parent, filename).read_bytes(), int(x), int(y))
        elif kind == "hitmap" and len(args) == 1:
            body = assets.encode_hitmap(source_path(root, path.parent, args[0]))
        elif kind == "placeholder" and len(args) == 1:
            body = bytes([int(args[0])])
        else:
            raise ValueError(f"{path}:{number}: invalid art declaration")
        if variant == "-":
            if resource in result or resource in nested:
                raise ValueError(f"Duplicate direct resource {resource} in {path}")
            result[resource] = body
        else:
            sub = int(variant)
            if resource in result or sub in nested.get(resource, {}):
                raise ValueError(f"Duplicate resource {resource}/{sub} in {path}")
            nested.setdefault(resource, {})[sub] = body
    for resource, parts in nested.items():
        if sorted(parts) != list(range(len(parts))):
            raise ValueError(f"Missing art variants in {path}, resource {resource}")
        result[resource] = records([parts[i] for i in range(len(parts))], True)
    return result


def navigation(root):
    result = {}
    for number, fields in lines(root / "world/map.txt"):
        if len(fields) != 4:
            raise ValueError(f"world/map.txt:{number}: room zone destination direction")
        room, zone, target = map(int, fields[:3])
        if (not 1 <= room <= GAMES[root.name][0] or not 0 <= zone <= 55
                or not 1 <= target <= GAMES[root.name][0] or (room, zone) in result):
            raise ValueError(f"world/map.txt:{number}: invalid/duplicate connection")
        first = GAMES[root.name][1]
        if (room <= first) != (target <= first):
            raise ValueError(f"world/map.txt:{number}: ordinary exits cannot switch stages")
        result[room, zone] = target
    return result


def room(root, number, links, used_links=None):
    directory = root / f"rooms/{number:02}"
    fields = {}
    for no, values in lines(directory / "scene.txt"):
        key, *args = values
        if key in fields:
            raise ValueError(f"Duplicate scene field {key}: {directory}")
        fields[key] = args
    if set(fields) != {"stage", "colors", "layers", "notice"}:
        raise ValueError(f"Missing/unknown scene fields in {directory}")
    colors = bytes(int(n, 16) for n in fields["colors"])
    if len(colors) != 3:
        raise ValueError(f"Expected three Atari colors in {directory}")
    layers = bytes(int(n) for n in fields["layers"])
    if not layers:
        raise ValueError(f"A room needs at least one background layer: {directory}")
    if len(fields["notice"]) != 1:
        raise ValueError(f"Expected notice none or one text filename in {directory}")
    notice = (b"\1" if fields["notice"] == ["none"] else
              message_file(source_path(root, directory, fields["notice"][0])))
    layout = records([layers, colors, notice], True)
    selectors = bytearray()
    for no, values in lines(directory / "actions.txt"):
        if len(values) < 3 or values[0] != "object":
            raise ValueError(f"{directory}/actions.txt:{no}: expected object ID collection [metadata]")
        _, zone, collection, *args = values
        zone, collection = int(zone), int(collection)
        # Original rooms can repeat selectors; the engine searches in order.
        if not 0 <= zone <= 55:
            raise ValueError(f"Invalid selector {zone} in {directory}")
        selectors.extend((200 + zone, collection))
        for index, value in enumerate(args):
            if value == "message":
                selectors.extend(assets.message_body(args[index + 1:]))
                break
            if value == "destination":
                key = number, zone
                if key not in links:
                    raise ValueError(f"Room {number} zone {zone}: missing world/map.txt destination")
                selectors.append(links[key])
                if used_links is not None:
                    used_links.add(key)
            else:
                selectors.append(int(value))
    if not selectors:
        raise ValueError(f"Missing room action selectors: {directory}")
    body = records([layout, records([bytes(selectors)], True)])
    limit = 120 if root.name == "klatwa" else 95
    if len(body) > limit:
        raise ValueError(f"Room {number} exceeds its {limit}-byte runtime buffer")
    return int(fields["stage"][0]), body, layers


def quoted_lines(path, decoder=None):
    decoder = assets.glyph_bytes if decoder is None else decoder
    result = []
    for no, line in enumerate(path.read_text("utf-8").splitlines(), 1):
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        try:
            value = json.loads(line)
            if not isinstance(value, str):
                raise ValueError("Expected a quoted text line")
            result.append(decoder(value))
        except (ValueError, TypeError) as error:
            raise ValueError(f"{path}:{no}: {error}") from error
    return result


def message_file(path):
    data = quoted_lines(path)
    return bytes([len(data)]) + b"".join(bytes([len(line)]) + line for line in data)


def numbered_texts(directory, digits, count=None):
    paths = sorted(directory.glob("*.txt"))
    expected = [f"{n:0{digits}d}.txt" for n in range(len(paths) if count is None else count)]
    if not paths or [p.name for p in paths] != expected:
        raise ValueError(f"{directory}: expected consecutive numbered text files from zero"
                         + (f" ({count} files)" if count is not None else ""))
    return paths


def title_pages(root):
    pages = numbered_texts(root / "interface/pages", 2, 8 if root.name == "klatwa" else 9)
    result = []
    for path in pages:
        data = quoted_lines(path, assets.title_bytes)
        result.append(records([bytes([len(data)]), *data]))
    return records(result, True)


def message_banks(root, stage):
    banks = []
    base = root / f"text/stage-{stage}"
    directories = sorted(path for path in base.iterdir() if path.is_dir())
    expected = [f"{n:02d}" for n in range(4 if stage == 1 else 3)]
    if [p.name for p in directories] != expected:
        raise ValueError(f"{base}: expected message banks {', '.join(expected)}")
    for directory in directories:
        paths = numbered_texts(directory, 3)
        banks.append(records([message_file(path) for path in paths], True))
    return records(banks)


def player_bank(root):
    frames = {}
    for no, row in lines(root / "player/frames.txt"):
        if len(row) != 5:
            raise ValueError(f"player/frames.txt:{no}: direction frame PNG x-offset y-offset")
        direction, frame, filename, x, y = row
        width, height, pixels, _ = pictures.decode_png(source_path(root, root / "player", filename).read_bytes())
        if width % 4 or width // 4 > 255 or height > 255:
            raise ValueError("Invalid player frame size")
        key = int(direction), int(frame)
        if key in frames:
            raise ValueError("Duplicate player animation frame")
        frames[key] = bytes((int(x), int(y), width // 4, height)) + pictures.pack_pixels(width, height, pixels)
    if set(frames) != {(d, f) for d in range(4) for f in range(5)}:
        raise ValueError("Player bank requires four directions with five frames each")
    return records([records([frames[d, f] for f in range(5)], True) for d in range(4)], True)


def cmc(root, title=False):
    name = "title" if title else "gameplay"
    data = (root / f"music/{name}.cmc").read_bytes()
    expected = {"klatwa": {False: (0x86B8, 0x8D3C), True: (0x8D52, 0x9443)},
                "wladcy-ciemnosci": {False: (0x854D, 0x8CB7), True: (0x8CB9, 0x92A8)}}[root.name][title]
    start, end = expected
    if data[:6] != b"\xff\xff" + word(start) + word(end) or len(data) != end - start + 7:
        raise ValueError(f"{name}.cmc must retain its engine load address and size")
    if root.name == "wladcy-ciemnosci" and not title:
        if data[-6:] != bytes.fromhex("00FFFFB98CA8"):
            raise ValueError("Gameplay CMC must retain the six restored overlap bytes")
        return data[:-6]
    if root.name == "klatwa" and not title:
        return data + bytes(5)
    return data


def build_groups(root):
    root = Path(root).resolve()
    total, first = GAMES[root.name]
    links = navigation(root)
    used_links = set()
    room_data = {}
    for number in range(1, total + 1):
        stage, body, layers = room(root, number, links, used_links)
        if stage != (1 if number <= first else 2):
            raise ValueError(f"Room {number}: stage differs from the fixed engine split")
        room_data[number] = body
    if unused := links.keys() - used_links:
        raise ValueError(f"Unused world/map.txt connections: {sorted(unused)}")
    title = art(root, "interface")
    stub = records([records([b"\1"], True)])
    title.update({0: stub, 1: stub, 7: (root / "interface/game.fnt").read_bytes(),
                  8: (root / "interface/title.fnt").read_bytes(), 9: title_pages(root),
                  10: player_bank(root), 11: bytes(192), 12: cmc(root), 13: cmc(root, True)})
    font_size = 1023 if root.name == "klatwa" else 1024
    if any(len(title[n]) != font_size for n in (7, 8)):
        raise ValueError(f"Fonts must contain exactly {font_size} bytes")
    groups = {3: ordered_records(title)}
    for stage in (1, 2):
        scenes = art(root, f"stages/{stage}")
        scenes[0] = assets.encode_actions(root / f"stages/{stage}/actions.txt", root.name)
        count = first if stage == 1 else total
        scenes[1] = records([room_data[n] if (n <= first) == (stage == 1) else b"-"
                             for n in range(1, count + 1)], True)
        if root.name == "klatwa" and stage == 2:
            path = root / "stages/2/messages.txt"
            for _, (number, filename) in lines(path):
                scenes[int(number)] = records([records([message_file(source_path(root, path.parent, filename))], True)])
        items = art(root, f"items/{stage}")
        items[0] = records([records([bytes([2 * stage + 1])], True)])
        items[1] = assets.encode_actions(root / f"items/{stage}/actions.txt", root.name)
        if root.name == "wladcy-ciemnosci":
            items[2] = message_banks(root, stage)
        groups[2 * stage + 2] = ordered_records(scenes)
        groups[2 * stage + 3] = ordered_records(items)
    groups[8] = world.save_state(root)
    validate_groups(root, groups)
    return groups


def ordered_records(mapping):
    if sorted(mapping) != list(range(max(mapping) + 1)):
        raise ValueError(f"Missing resource ID in {sorted(mapping)}")
    return records([mapping[n] for n in range(len(mapping))], True)


def empty_disk():
    image = bytearray(16 + 1040 * 128)
    struct.pack_into("<HHH", image, 0, 0x296, 8320, 128)
    return image


def allocate(root, groups):
    image = empty_disk()
    directory = 16 + 499 * 128
    image[directory] = 3
    logical, report = 1, []
    for number in range(1, 9):
        body = groups.get(number, b"")
        count = {1: 255, 2: 105, 8: 7}.get(number, max(1, (len(body) + 127) // 128))
        if number in (3, 4, 6):
            limit = 14058 if root.name == "klatwa" and number in (4, 6) else 14336
            if len(body) > limit or count > 112:
                raise ValueError(f"Group {number}: {len(body)} bytes exceeds bank workspace {limit}")
        if number in (5, 7):
            limit = 24 if root.name == "klatwa" else 60
            if count > limit:
                raise ValueError(f"Item bank {number}: exceeds {limit} sectors")
        if number == 8 and len(body) != 896:
            raise ValueError("Save state requires exactly seven sectors")
        image[directory + number] = count
        sectors = [n + (n >= 500) for n in range(logical, logical + count)]
        # The preserved loader patch intercepts sectors $0300..$03FF.
        # Even the save slot must finish before that range; geometry alone
        # does not tell us which sectors this executable can actually use.
        if sectors[-1] > 767:
            raise ValueError("Resources exceed sector 767: the game loader cannot access sectors 768..1023")
        for i, sector in enumerate(sectors):
            chunk = body[i*128:(i+1)*128]
            offset = 16 + (sector - 1) * 128
            image[offset:offset + len(chunk)] = chunk
        report.append(f"{number} {len(body)} {count} {sectors[0]}..{sectors[-1]}")
        logical += count
    return bytes(image), report


def build_disks(root):
    root = Path(root).resolve()
    image, _ = allocate(root, build_groups(root))
    return {"build/assets.atr": image}


def dependencies(root):
    # Parse and validate even on a cached build so missing/invalid content fails.
    root = Path(root).resolve()
    build_disks(root)
    result = {path for directory in ("world", "rooms", "stages", "items", "interface", "player", "text", "music")
              for path in (root / directory).rglob("*")
              if path.is_file() and path.suffix.lower() in (".txt", ".png", ".fnt", ".pmg", ".cmc")}
    # A table may share a file anywhere inside its game directory. Include
    # those actual references even when they live outside the default folders
    # or have a different extension, so cached Make targets cannot miss edits.
    for directory in ("interface", "stages/1", "stages/2", "items/1", "items/2"):
        table = root / directory / "art.txt"
        for _, fields in lines(table):
            if fields[0] in ("picture", "hitmap"):
                result.add(source_path(root, table.parent, fields[3]))
    for _, fields in lines(root / "player/frames.txt"):
        result.add(source_path(root, root / "player", fields[2]))
    for number in range(1, GAMES[root.name][0] + 1):
        directory = root / f"rooms/{number:02}"
        for _, fields in lines(directory / "scene.txt"):
            if fields[0] == "notice" and fields[1] != "none":
                result.add(source_path(root, directory, fields[1]))
    if root.name == "klatwa":
        table = root / "stages/2/messages.txt"
        for _, (_, filename) in lines(table):
            result.add(source_path(root, table.parent, filename))
    return sorted(result)


def link_program(image, program, game):
    """Combine authored resources with the current compiled Forth program.

    Release-byte comparisons belong to verification, so editing Forth or its
    initial world state remains possible through the ordinary build.
    """
    validate_atr(image)
    validate_atr(program)
    count = boot_bytes(game)
    if program[16:20] != bytes((0, count // 128, 0x80, 0x0E)):
        raise ValueError(f"{game}: compiled boot header does not match its load span")
    return image[:16] + program[16:16 + count] + image[16 + count:]


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--game-dir", type=Path, required=True)
    choice = parser.add_mutually_exclusive_group()
    choice.add_argument("--dependencies", action="store_true")
    choice.add_argument("--empty-disk", type=Path)
    choice.add_argument("--link", type=Path)
    args = parser.parse_args(argv)
    root = args.game_dir.resolve()
    if args.empty_disk:
        args.empty_disk.parent.mkdir(parents=True, exist_ok=True)
        args.empty_disk.write_bytes(empty_disk())
    elif args.dependencies:
        print(" ".join(str(p) for p in dependencies(root)))
    else:
        image, report = allocate(root, build_groups(root))
        (root / "build").mkdir(exist_ok=True)
        if args.link:
            image = link_program(image, args.link.read_bytes(), root.name)
            target = root / f"build/{root.name}.atr"
        else:
            target = root / "build/assets.atr"
        target.write_bytes(image)
        (root / "build/packing.txt").write_text("group bytes sectors physical-sectors\n" + "\n".join(report) + "\n")
        print(f"Built {target}")


if __name__ == "__main__":
    main()
