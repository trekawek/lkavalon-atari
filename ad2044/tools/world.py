#!/usr/bin/env python3
"""Build AD2044's fixed-address initial state from room and world text.

The executable reads seven whole sectors into $436B. That range contains both
mutable game data and live Forth headers. This builder generates the invariant
headers and thread cells, then places editable values at their original target
addresses. It never reads an ATR, a compiled program, or an extraction snapshot.
"""

from pathlib import Path

BASE = 0x436B
END = 0x46EB
ROOM_COUNT = 37
TABLE_CAPACITY = 90
OBJECT_LIST_START = 0x438D
OBJECT_LIST_END = 0x455B
FACING = {"north": 0, "east": 1, "south": 2, "west": 3}
DIRECTIONS = {"forward": 0, "right": 1, "back": 2, "left": 3}
# Entry addresses, original names, links and execution fields. Loading a save
# restores these live dictionary headers as well as the mutable data between.
HEADERS = (
    (0x436D, "ENERGIA", 0x4362, 0x1499),
    (0x437B, "UBR", 0x436D, 0x1499),
    (0x4385, "#OB", 0x437B, 0x1499),
    (0x455B, "ILKOM", 0x4385, 0x147D),
    (0x4567, "#RZE", 0x455B, 0x1499),
    (0x457E, "MAP", 0x4567, 0x18D8),
    (0x463C, "CZY", 0x457E, 0x18D8),
    (0x4666, "#POZ", 0x463C, 0x1499),
    (0x4671, "KIER", 0x4666, 0x18D8),
    (0x46D6, "BSAVE", 0x4671, 0x1441),
)
INVENTORY_POSITIONS = ((2, 25), (6, 25), (2, 56), (6, 56))


def integer(text, maximum=65535):
    """Decimal only: leading zeroes in room IDs are formatting, not octal."""
    try:
        value = int(text, 10) if isinstance(text, str) else text
    except ValueError as exc:
        raise ValueError(f"Expected a decimal integer: {text!r}") from exc
    if type(value) is not int or not 0 <= value <= maximum:
        raise ValueError(f"Expected an integer in 0..{maximum}: {text!r}")
    return value


def drawable_id(value):
    value = integer(value, 137)
    if value == 101:
        raise ValueError("Drawable ID101 falls before the inventory base102")
    return value


def lines(path):
    for number, line in enumerate(Path(path).read_text("ascii").splitlines(), 1):
        body = line.split("#", 1)[0].strip()
        if body:
            yield number, body


def floor_for_room(room):
    """The room ranges are fixed in executable words $5B41/$5B55."""
    if room in (14, 30):
        return "shared"
    for floor, first, end in ((0, 25, 30), (1, 22, 25), (2, 31, 36),
                              (3, 0, 14), (4, 15, 22), (5, 36, 37)):
        if first <= room < end:
            return str(floor)
    raise ValueError(f"No fixed map floor for room {room}")


def read_map(root):
    """Read authoritative map rows keyed by room ID.

    Columns: id floor x y facing glyph visited exits. Facing rotates relative
    exit directions; glyph is the high three-bit font selector. Floor is checked
    against the executable, since changing a text field cannot change its ranges.
    """
    path = Path(root) / "world/map.txt"
    result = {}
    for number, line in lines(path):
        try:
            fields = line.split()
            if len(fields) != 8:
                raise ValueError("Expected: id floor x y facing glyph visited exits")
            ident, floor, x, y, facing, glyph, visited, exit_text = fields
            room = integer(ident, ROOM_COUNT - 1)
            if room in result:
                raise ValueError(f"Duplicate room {room}")
            if floor != floor_for_room(room):
                raise ValueError(f"Room {room}'s floor must remain {floor_for_room(room)}")
            if facing not in FACING or visited not in ("yes", "no"):
                raise ValueError("Expected north/east/south/west and yes/no")
            exits = [] if exit_text == "-" else exit_text.split(",")
            if len(exits) != len(set(exits)) or any(d not in DIRECTIONS for d in exits):
                raise ValueError("Exits must be distinct forward/right/back/left names")
            result[room] = {
                "floor": floor, "x": integer(x, 7), "y": integer(y, 7),
                "facing": facing, "glyph": integer(glyph, 7),
                "visited": visited == "yes", "exits": exits,
            }
        except ValueError as exc:
            raise ValueError(f"{path}:{number}: {exc}") from exc
    if set(result) != set(range(ROOM_COUNT)):
        raise ValueError(f"{path}: expected exactly rooms 00..36")
    return result


def read_room(path):
    """Read a room's initial drawable lists; zero entries reserve empty slots."""
    result = {"views": {}}
    for number, line in lines(path):
        try:
            if line.startswith("room "):
                if "id" in result:
                    raise ValueError("Duplicate room declaration")
                result["id"] = integer(line[5:].strip(), ROOM_COUNT - 1)
            elif line.startswith("name "):
                if "name" in result:
                    raise ValueError("Duplicate room name")
                result["name"] = line[5:].strip()
            elif line.startswith("view ") and ":" in line:
                ident, values = line[5:].split(":", 1)
                view = integer(ident.strip(), 100)
                if view in result["views"]:
                    raise ValueError(f"Duplicate view {view}")
                result["views"][view] = [drawable_id(v) for v in values.split()]
            else:
                raise ValueError("Expected room, name or view declaration")
        except ValueError as exc:
            raise ValueError(f"{path}:{number}: {exc}") from exc
    if "id" not in result:
        raise ValueError(f"{path}: missing room declaration")
    validate_views(result["views"])
    return result


def render_room(room):
    """Return compact editable text for a room, without duplicate map fields."""
    output = [f"room {room['id']:02d}"]
    if room.get("name"):
        output.append(f"name {room['name']}")
    output += ["# Drawable IDs; 0 is an empty slot available during play."]
    for view, objects in sorted(room["views"].items()):
        output.append(f"view {view}: " + " ".join(map(str, objects)))
    return "\n".join(output) + "\n"


def validate_views(views):
    if not views or set(views) != set(range(len(views))):
        raise ValueError("Views must be consecutive integers starting at zero")
    for view, objects in views.items():
        if type(view) is not int or not objects:
            raise ValueError("Each view must have at least one drawable slot")
        for value in objects:
            drawable_id(value)


def read_initial(root):
    path = Path(root) / "world/initial.txt"
    counts = {"current-room": 1, "energy": 1, "legacy-ubr": 1,
              "map-floor": 1, "inventory": 4, "puzzle-cells": 16}
    result = {}
    for number, line in lines(path):
        try:
            fields = line.split()
            key = fields.pop(0).rstrip(":")
            if key not in counts or key in result or len(fields) != counts[key]:
                raise ValueError("Unknown, duplicate or wrong-sized initial-state field")
            result[key] = [integer(value) for value in fields]
        except ValueError as exc:
            raise ValueError(f"{path}:{number}: {exc}") from exc
    if set(result) != set(counts):
        raise ValueError(f"{path}: missing initial-state fields")
    integer(result["current-room"][0], ROOM_COUNT - 1)
    if result["current-room"][0] == 35:
        raise ValueError(f"{path}: room35 is the ending collection, not a starting room")
    # The original floor entries 6..8 select room38, outside the authored world
    # and its room/view lists. The tenth table bytes are both $20: selecting
    # floor9 gives DRAW-FLOOR-MAP an equal DO limit/start and a wrapping LOOP.
    integer(result["map-floor"][0], 5)
    for value in result["inventory"]:
        if value != 0 and not 102 <= value <= 137:
            raise ValueError(f"{path}: inventory IDs must be zero or102..137")
    return result


def read_world(root):
    """Return room metadata merged with the authoritative global map table."""
    root = Path(root)
    maps = read_map(root)
    rooms = []
    for ident in range(ROOM_COUNT):
        room = read_room(root / f"rooms/{ident:02d}/room.txt")
        if room["id"] != ident:
            raise ValueError(f"rooms/{ident:02d}/room.txt declares a different room ID")
        room["map"] = maps[ident]
        rooms.append(room)
    return rooms


def build_state(root, rooms=None):
    """Encode 896 bytes for initial group19 and a fresh saved-game group20.

    Supplied room dictionaries need only id/views; the current map.txt is always
    authoritative. Variable-length drawable lists may use the reserved space up
    to the next Forth header, without relocating any executable definition.
    """
    root = Path(root)
    rooms = read_world(root) if rooms is None else list(rooms)
    maps, initial = read_map(root), read_initial(root)
    by_id = {}
    for room in rooms:
        ident = integer(room["id"], ROOM_COUNT - 1)
        if ident in by_id:
            raise ValueError(f"Duplicate room {ident}")
        validate_views(room["views"])
        by_id[ident] = room
    if set(by_id) != set(range(ROOM_COUNT)):
        raise ValueError("State requires exactly rooms 00..36")
    output = bytearray(END - BASE)

    def put(address, data):
        if not BASE <= address <= address + len(data) <= END:
            raise ValueError("State field exceeds its fixed target allocation")
        output[address-BASE:address-BASE+len(data)] = data

    def cell(value):
        return integer(value).to_bytes(2, "little")

    for address, name, link, code in HEADERS:
        spelling = bytearray(name.encode("ascii"))
        spelling[-1] |= 128
        put(address, bytes([0x80 | len(name)]) + spelling + cell(link) + cell(code))
    for address, key in ((0x436B, "current-room"), (0x4379, "energy"),
                         (0x4383, "legacy-ubr"), (0x466F, "map-floor")):
        put(address, cell(initial[key][0]))
    lists = bytearray()
    for ident in range(ROOM_COUNT):
        views = bytearray()
        for _, objects in sorted(by_id[ident]["views"].items()):
            views.extend(cell(len(objects)) + bytes(objects))
        lists.extend(cell(len(views)) + views)
    if OBJECT_LIST_START + len(lists) > OBJECT_LIST_END:
        raise ValueError(f"Drawable lists need {len(lists)} bytes; allocation permits "
                         f"{OBJECT_LIST_END-OBJECT_LIST_START}")
    put(OBJECT_LIST_START, lists)
    put(0x4565, cell(TABLE_CAPACITY))
    put(0x4570, bytes(value for obj, (x, y) in zip(initial["inventory"], INVENTORY_POSITIONS)
                      for value in (obj, x, y)))
    # Literal spaces after the four inventory triples are retained; not a call.
    put(0x457C, b"  ")
    for address, thread in ((0x4586, 0x4144), (0x4644, 0x4144), (0x467A, 0x412C)):
        put(address, cell(thread))
    for ident, data in maps.items():
        descriptor = FACING[data["facing"]] | (8 if data["visited"] else 0) | data["glyph"] << 4
        put(0x4588 + 2*ident, bytes([data["x"] << 4 | data["y"], descriptor]))
        put(0x467C + ident, bytes([sum(1 << DIRECTIONS[d] for d in data["exits"])]))
    put(0x4646, b"".join(cell(v) for v in initial["puzzle-cells"]))
    # Seven-sector rounding includes the start of BSAVE: >R >R DUP R> R>,
    # then the low byte of 2DUP. These are executable cells, not padding.
    put(0x46E0, b"".join(cell(v) for v in (0x12A5, 0x12A5, 0x13A5, 0x12B7, 0x12B7))
        + cell(0x1370)[:1])
    return bytes(output)


def dependencies(root):
    root = Path(root)
    return [root / "world/map.txt", root / "world/initial.txt"] + [
        root / f"rooms/{ident:02d}/room.txt" for ident in range(ROOM_COUNT)]
