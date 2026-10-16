#!/usr/bin/env python3
"""Build the later GAM games' fixed-address initial state from editable text.

The saved state interleaves values with live Forth dictionary headers. Those
headers, DOES> pointers and small unused allocations are generated here. The
authoring files contain room objects, spell/power slots, coordinates and flags;
neither the build nor save initialization needs an original disk or JSON dump.
"""

from pathlib import Path

from gam_assets import glyph_bytes, readable_text


PROFILES = {
    "klatwa": dict(base=0x5562, end=0x58D3, rooms=31, slots=10,
                   positions=22, stage2_positions=12, puzzles=16,
                   slot_thread=0x3F47, array_thread=0x51CD,
                   room_capacity=442, room_tail=4, book="spells"),
    "wladcy-ciemnosci": dict(base=0x5502, end=0x587A, rooms=25, slots=8,
                            positions=29, stage2_positions=23, puzzles=25,
                            slot_thread=0x3F4E, array_thread=0x51DC,
                            room_capacity=382, room_tail=0, book="powers"),
}


def integer(value, maximum=65535, minimum=0):
    try:
        result = int(value, 10) if isinstance(value, str) else value
    except ValueError as exc:
        raise ValueError(f"Expected a decimal integer: {value!r}") from exc
    if type(result) is not int or not minimum <= result <= maximum:
        raise ValueError(f"Expected an integer in {minimum}..{maximum}: {value!r}")
    return result


def lines(path):
    """Whole-line comments keep # and spaces available inside glyph strings."""
    for number, line in enumerate(Path(path).read_text("utf-8").splitlines(), 1):
        if line.strip() and not line.lstrip().startswith("#"):
            yield number, line


def _initial(root):
    path = Path(root) / "world/initial.txt"
    values = {}
    for number, line in lines(path):
        fields = line.split("#", 1)[0].split()
        if len(fields) < 2 or fields[0] in values:
            raise ValueError(f"{path}:{number}: missing or duplicate initial field")
        values[fields[0]] = fields[1:]
    if values.get("game", [None])[0] not in PROFILES or len(values["game"]) != 1:
        raise ValueError(f"{path}: game must name a supported GAM game")
    profile = PROFILES[values["game"][0]]
    expected = {"game": 1, "state-prefix": 2, "boot-room": 1,
                "boot-part": 1, "last-direction": 1}
    if profile["book"] == "powers":
        expected.update({"path-x": 1, "path-y": 1, "path-moves-left": 1,
                         "path-last-direction": 1, "path-direction-counts": 4})
    if values.keys() != expected.keys():
        raise ValueError(f"{path}: expected fields {', '.join(expected)}")
    for key, count in expected.items():
        if len(values[key]) != count:
            raise ValueError(f"{path}: {key} needs {count} value(s)")
        if key != "game":
            values[key] = [integer(v, minimum=-32768 if key in ("path-x", "path-y") else 0)
                           for v in values[key]]
    if values["boot-room"][0] >= profile["rooms"]:
        raise ValueError(f"{path}: boot-room lies outside the mutable room table")
    if values["boot-part"][0] not in (1, 2, 4):
        raise ValueError(f"{path}: boot-part must be 1 (menu), 2 or 4")
    if values["last-direction"][0] > 3:
        raise ValueError(f"{path}: last-direction must be 0..3")
    return profile, values


def _word(value):
    return (value & 0xFFFF).to_bytes(2, "little")


def _record(payload):
    if not payload or len(payload) > 65535:
        raise ValueError("GAM records require 1..65535 bytes")
    return _word(len(payload)) + payload


def _numbered(path, count, columns, maximum=255, first=0):
    rows = {}
    for number, line in lines(path):
        fields = line.split("#", 1)[0].split()
        if len(fields) != columns + 1:
            raise ValueError(f"{path}:{number}: expected ID and {columns} value(s)")
        ident = integer(fields[0])
        if ident in rows:
            raise ValueError(f"{path}:{number}: duplicate ID {ident}")
        rows[ident] = [integer(v, maximum) for v in fields[1:]]
    if set(rows) != set(range(first, first + count)):
        raise ValueError(f"{path}: expected exactly IDs {first}..{first + count - 1}")
    return [rows[n] for n in range(first, first + count)]


def read_objects(path):
    """Return full room/view drawable lists, including their reserved zero slots."""
    views = {}
    for number, line in lines(path):
        fields = line.split("#", 1)[0].split()
        if len(fields) < 3 or fields[0] != "view":
            raise ValueError(f"{path}:{number}: expected view NUMBER DRAWABLE...")
        view = integer(fields[1], 255)
        if view in views:
            raise ValueError(f"{path}:{number}: duplicate view {view}")
        views[view] = bytes(integer(v, 255) for v in fields[2:])
    if not views or set(views) != set(range(len(views))):
        raise ValueError(f"{path}: view IDs must start at zero with no gaps")
    return [views[n] for n in range(len(views))]


def _slots(root, profile):
    path = Path(root) / f"world/{profile['book']}.txt"
    slots = {}
    for number, line in lines(path):
        if "|" not in line:
            raise ValueError(f"{path}:{number}: expected slot power req1 req2 |display")
        fields, display = line.split("|", 1)
        fields = fields.split()
        if len(fields) != 4:
            raise ValueError(f"{path}:{number}: expected slot power req1 req2")
        slot, power, req1, req2 = (integer(v, 255) for v in fields)
        if slot in slots:
            raise ValueError(f"{path}:{number}: duplicate slot {slot}")
        encoded = glyph_bytes(display)
        if len(encoded) != 13:
            raise ValueError(f"{path}:{number}: display must contain exactly 13 glyphs")
        slots[slot] = bytes((power, req1, req2)) + encoded
    if set(slots) != set(range(profile["slots"])):
        raise ValueError(f"{path}: expected slots 0..{profile['slots'] - 1}")
    return [_record(slots[n]) for n in range(profile["slots"])]


def _positions(root, profile):
    path = Path(root) / "items/positions.txt"
    result = {1: {}, 2: {}}
    for number, line in lines(path):
        fields = line.split("#", 1)[0].split()
        if len(fields) != 4:
            raise ValueError(f"{path}:{number}: expected STAGE ITEM X_BYTE Y")
        stage, item, x, y = (integer(v, 255) for v in fields)
        if stage not in result or item in result[stage]:
            raise ValueError(f"{path}:{number}: invalid stage or duplicate item")
        result[stage][item] = bytes((x, y))
    for stage, count in ((1, profile["positions"]), (2, profile["stage2_positions"])):
        if set(result[stage]) != set(range(202, 202 + count)):
            raise ValueError(f"{path}: stage {stage} needs IDs 202..{201 + count}")
    return [b"".join(result[s][n] for n in sorted(result[s])) for s in (1, 2)]


def _encode(root, saved=False):
    root = Path(root)
    profile, values = _initial(root)
    output = bytearray()
    previous_header = profile["base"] - 8
    addresses = {}

    def append_cells(items):
        output.extend(b"".join(_word(n) for n in items))

    def header(name, length, suffix, runtime):
        nonlocal previous_header
        address = profile["base"] + len(output)
        output.extend(bytes((0x80 | length,)) + bytes(length - 1)
                      + bytes((ord(suffix) | 0x80,)))
        append_cells((previous_header, runtime))
        previous_header = address
        addresses[name] = profile["base"] + len(output)

    append_cells(values["state-prefix"])
    header("room", 4, "M", 0x1499)
    append_cells([1] if saved else values["boot-room"])
    header("slots", 3, "I", 0x18D8)
    append_cells((profile["slot_thread"], 18 * profile["slots"]))
    output.extend(b"".join(_slots(root, profile)))
    positions, stage2_positions = _positions(root, profile)
    header("positions", 4, "Y", 0x18D8)
    append_cells((profile["array_thread"],))
    output.extend(positions)
    header("stage2-positions", 3, "2", 0x18D8)
    append_cells((profile["array_thread"],))
    output.extend(stage2_positions)
    header("part", 4, "K", 0x1499)
    append_cells([2] if saved else values["boot-part"])
    # Two unused allocation bytes retain the executable's residual ALLOT prefix.
    output.extend(bytes((5, ord("A"))))
    header("unused-array", 4, "I", 0x18D8)
    append_cells((profile["array_thread"],))
    output.extend(b" " * 6)
    header("objects", 3, "B", 0x1499)
    rooms = b"".join(_record(b"".join(_record(view) for view in
                       read_objects(root / f"rooms/{room:02d}/objects.txt")))
                     for room in range(profile["rooms"]))
    if len(rooms) > profile["room_capacity"]:
        raise ValueError(f"Room/view lists need {len(rooms)} bytes; fixed state capacity is {profile['room_capacity']}")
    output.extend(rooms.ljust(profile["room_capacity"], b"\0"))
    header("room-count", 5, "M", 0x147D)
    append_cells((profile["rooms"] - 1,))
    header("progress", 3, "P", 0x1499)
    output.extend(bytes(row[0] for row in _numbered(root / "world/progress.txt", profile["rooms"], 1)))
    output.extend(b" ")  # Unused allocation byte after the last room flag.
    header("puzzles", 3, "Y", 0x18D8)
    append_cells((profile["array_thread"],))
    append_cells(row[0] for row in _numbered(root / "world/puzzles.txt", profile["puzzles"], 1, 65535))
    if profile["book"] == "powers":
        for key, length, suffix in (("path-x", 2, "T"), ("path-y", 2, "T"),
                                    ("path-moves-left", 2, "K"),
                                    ("path-last-direction", 4, "R"),
                                    ("path-direction-counts", 4, "S")):
            header(key, length, suffix, 0x1499)
            append_cells(values[key])
    header("direction", 4, "E", 0x1499)
    append_cells(values["last-direction"])
    if len(output) != profile["end"] - profile["base"]:
        raise ValueError("Internal GAM state layout does not match the fixed executable addresses")
    return bytes(output), addresses, profile


def encode_world(root):
    """Return the initial state bytes included by Forth at their original address."""
    return _encode(root)[0]


def save_state(root):
    """Initialize group 8 as a new game at room 1; no historical snapshot."""
    return _encode(root, saved=True)[0].ljust(896, b"\0")


def dependencies(root):
    root = Path(root)
    profile, _ = _initial(root)
    return [root / "world/initial.txt", root / f"world/{profile['book']}.txt",
            root / "world/progress.txt", root / "world/puzzles.txt",
            root / "items/positions.txt",
            *(root / f"rooms/{n:02d}/objects.txt" for n in range(profile["rooms"]))]


def _read_original_state(source, game):
    """Migration only: decode the old Forth's data directives, never an ATR."""
    profile = PROFILES[game]
    memory = bytearray(65536)
    position = 0
    for line in (Path(source) / "src/20-framework.fth").read_text("ascii").splitlines():
        fields = line.split("(", 1)[0].split()
        if not fields:
            continue
        if fields[0] == "AT":
            position = int(fields[1], 16)
        elif profile["base"] <= position < profile["end"]:
            if fields[0] == "BYTES":
                payload = bytes.fromhex(fields[1])
            elif fields[0] == "CELL":
                payload = _word(int(fields[1], 16))
            elif fields[0] in ("DOVAR", "DODOES", "DOCON", "DOCOL"):
                payload = _word({"DOVAR": 0x1499, "DODOES": 0x18D8,
                                 "DOCON": 0x147D, "DOCOL": 0x1441}[fields[0]])
            else:
                raise ValueError(f"Unexpected original state directive: {line}")
            memory[position:position + len(payload)] = payload
            position += len(payload)
        elif fields[0] in ("DOVAR", "DODOES", "DOCON", "DOCOL"):
            position += 2
        elif fields[0] == "BYTES":
            position += len(bytes.fromhex(fields[1]))
    return memory


def export_world(baseline_root, target_root):
    """One-time migration from the previous Forth and typed saved-state schema.

    The schema supplies field boundaries only; every value comes from the
    executable's boot data, not from the release's partially completed save.
    """
    import json

    baseline_root, root = Path(baseline_root), Path(target_root)
    game = baseline_root.name
    profile = PROFILES[game]
    memory = _read_original_state(baseline_root, game)
    schema = json.loads((baseline_root / "assets/state/saved-game.json").read_text())
    fields = {part["name"]: int(part["address"], 16)
              for part in schema["data"]["parts"]
              if part.get("kind") == "sequence" and "address" in part}

    def word(address):
        return int.from_bytes(memory[address:address + 2], "little")

    def write(name, text):
        path = root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8")

    initial = ["# Initial executable state; values are decimal.",
               "# POCZATEK always selects room 1 and part 2 in game code.",
               "# boot-room/boot-part describe pre-menu cells, not a start-room setting.",
               f"game {game}", f"state-prefix {word(profile['base'])} {word(profile['base'] + 2)}",
               f"boot-room {word(fields['CURRENT-ROOM'])}",
               f"boot-part {word(fields['CURRENT-PART-GROUP'])}",
               f"last-direction {word(fields['LAST-DIRECTION'])}"]
    if game == "wladcy-ciemnosci":
        for name in ("PATH-X", "PATH-Y", "PATH-MOVES-LEFT", "PATH-LAST-DIRECTION", "PATH-DIRECTION-COUNTS"):
            count = 4 if name == "PATH-DIRECTION-COUNTS" else 1
            initial.append(name.lower() + " " + " ".join(str(word(fields[name] + 2 * i)) for i in range(count)))
    write("world/initial.txt", "\n".join(initial) + "\n")
    slot_address = fields["SPELLBOOK-RECORDS" if game == "klatwa" else "POWER-SLOT-RECORDS"] + 4
    slots = ["# slot power-id requirement-1 requirement-2 |13 game-font glyphs",
             "# Empty slots keep decorative borders; spaces after | are significant."]
    for index in range(profile["slots"]):
        size = word(slot_address)
        if size != 16:
            raise ValueError("Unexpected original power/spell slot size")
        payload = memory[slot_address + 2:slot_address + 2 + size]
        slots.append(f"{index} {payload[0]} {payload[1]} {payload[2]} |{readable_text(payload[3:])}")
        slot_address += size + 2
    write(f"world/{profile['book']}.txt", "\n".join(slots) + "\n")
    positions = ["# stage item-id x-byte y-pixels; each x byte is four Atari pixels.",
                 "# All allocated slots are listed, including unused/spare coordinates.",
                 "# Stage 2 copies the first 11 entries (Klatwa) or 23 (Wladcy)."]
    for stage, name, count in ((1, "ITEM-POSITIONS", profile["positions"]),
                               (2, "PART2-ITEM-POSITIONS", profile["stage2_positions"])):
        for index in range(count):
            address = fields[name] + 2 + 2 * index
            positions.append(f"{stage} {202 + index} {memory[address]} {memory[address + 1]}")
    write("items/positions.txt", "\n".join(positions) + "\n")
    room_address = fields["ROOM-OBJECT-STATE"]
    for room in range(profile["rooms"]):
        size = word(room_address)
        end, position = room_address + 2 + size, room_address + 2
        views = ["# Initial mutable drawables. 0 reserves an empty slot; 1 is a placeholder.",
                 "# IDs 2..99 select shared art frame 0; 102..199 select frame 2.",
                 "# IDs 202+ are items. View 0 is the room; later views are close-ups."]
        if room == 0:
            views.append("# Room 00 is engine inventory storage, not a navigable room.")
        view = 0
        while position < end:
            length = word(position)
            if length == 0 or position + 2 + length > end:
                raise ValueError("Unexpected original room/view record")
            views.append(f"view {view} " + " ".join(map(str, memory[position + 2:position + 2 + length])))
            position += length + 2
            view += 1
        write(f"rooms/{room:02d}/objects.txt", "\n".join(views) + "\n")
        room_address = end
    progress = ["# room achievement-bits (decimal bit mask); 00 is inventory storage."]
    progress.extend(f"{n:02d} {memory[fields['ROOM-ACHIEVEMENT-BITS'] + n]}" for n in range(profile["rooms"]))
    write("world/progress.txt", "\n".join(progress) + "\n")
    puzzles = ["# Puzzle-state index and initial 16-bit value (decimal).",
               "# Individual action words in src/30-game.fth read/write these indices."]
    puzzles.extend(f"{n:02d} {word(fields['PUZZLE-STATE-CELLS'] + 2 + 2 * n)}" for n in range(profile["puzzles"]))
    write("world/puzzles.txt", "\n".join(puzzles) + "\n")
    expected = bytes(memory[profile["base"]:profile["end"]])
    actual = encode_world(root)
    if actual != expected:
        first = next(i for i, pair in enumerate(zip(actual, expected)) if pair[0] != pair[1])
        raise ValueError(f"World migration changed boot byte ${profile['base'] + first:04X}")
    path = root / "src/20-framework.fth"
    text = path.read_text("ascii")
    start = text.index("BYTES 02000A00", text.index("( SAVED-STATE-BASE |"))
    end = text.index(f"AT {profile['end']:04X}", start)
    text = (text[:start] + "( Editable initial world, room lists and item coordinates. )\n"
            "( Includes fixed dictionary headers generated by gam_world. )\n"
            "INCBIN world/initial.txt\n" + text[end:])
    path.write_text(text, encoding="ascii")
    return dict(game=game, bytes=len(actual), files=len(dependencies(root)))
