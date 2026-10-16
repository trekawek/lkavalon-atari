"""Readable asset codecs shared by Klątwa and Władcy Ciemności.

Pictures use ordinary indexed PNGs, hit/depth maps are symbol grids, actions
use named arguments and Polish text. Native record sizes and column packing
are generated. No saved disk layout or historical compression plan is needed.
"""

from __future__ import annotations

from functools import lru_cache
import importlib.util
import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
_spec = importlib.util.spec_from_file_location("gam_png", ROOT / "ad2044/tools/pictures.py")
png = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(png)

POLISH = dict(zip("acelnosz", "ĄĆĘŁŃÓŚŻ"))
POLISH_REVERSE = {value: ord(key) for key, value in POLISH.items()}
POLISH_REVERSE["Ź"] = ord("z")
SYMBOLS = "123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"


def byte(value, label="byte"):
    if type(value) is not int or not 0 <= value <= 255:
        raise ValueError(f"{label}: expected integer 0..255")
    return value


def record(body):
    if not 0 < len(body) <= 65535:
        raise ValueError("A GAM record requires 1..65535 bytes")
    return len(body).to_bytes(2, "little") + bytes(body)


def records(bodies, terminated=True):
    return b"".join(record(body) for body in bodies) + (b"\0\0" if terminated else b"")


@lru_cache(maxsize=8192)
def _column(data):
    """Shortest valid encoding of one column; escapes contain 1..4 bytes."""
    size = len(data)
    costs = [0] * (size + 1)
    choices = [None] * size
    for start in range(size - 1, -1, -1):
        token = bytes([data[start]]) if data[start] != 0x8D else bytes([0x8D, 1, 0x8D])
        best, choice = len(token) + costs[start + 1], (start + 1, token)
        for length in range(1, min(4, size - start) + 1):
            pattern = data[start:start + length]
            for repeat in range(1, min(63, (size - start) // length) + 1):
                end = start + length * repeat
                if data[end - length:end] != pattern:
                    break
                cost = 2 + length + costs[end]
                if cost < best:
                    best = cost
                    choice = end, bytes([0x8D, (length - 1) * 64 + repeat]) + pattern
        costs[start], choices[start] = best, choice
    result, position = bytearray(), 0
    while position < size:
        position, token = choices[position]
        result.extend(token)
    return bytes(result)


def compress_rle(data, width, height):
    """Pack row-major byte cells in the native $8D column order."""
    if not 1 <= byte(width, "width") or not 1 <= byte(height, "height"):
        raise ValueError("Packed dimensions must be nonzero")
    data = bytes(data)
    if len(data) != width * height:
        raise ValueError("Packed dimensions do not match cells")
    return b"".join(_column(data[x::width]) for x in range(width))


def decompress_rle(data, width, height):
    """Return (row-major cells, consumed bytes), rejecting column overruns."""
    if not 1 <= byte(width, "width") or not 1 <= byte(height, "height"):
        raise ValueError("Packed dimensions must be nonzero")
    result, position = bytearray(width * height), 0
    for x in range(width):
        y = 0
        while y < height:
            if position >= len(data):
                raise ValueError("Truncated packed column")
            value = data[position]
            position += 1
            if value != 0x8D:
                run = bytes([value])
            else:
                if position >= len(data):
                    raise ValueError("Truncated column escape")
                control = data[position]
                position += 1
                count, length = (control & 63) or 256, (control >> 6) + 1
                if position + length > len(data):
                    raise ValueError("Truncated column pattern")
                run = bytes(data[position:position + length]) * count
                position += length
            if y + len(run) > height:
                raise ValueError("Packed run crosses its column")
            for value in run:
                result[y * width + x] = value
                y += 1
    return bytes(result), position


def encode_picture(source, x, y, packed=True):
    """Encode PNG indices, deriving width/height; x is measured in Atari bytes."""
    width, height, pixels, _ = png.decode_png(source)
    data = png.pack_pixels(width, height, pixels)
    width //= 4
    header = bytes([byte(x, "picture x"), byte(y, "picture y"),
                    byte(width, "picture width"), byte(height, "picture height")])
    return header + (compress_rle(data, width, height) if packed else data)


def export_picture(body, packed=True, palette=png.GRAYSCALE):
    """Return (PNG, x, y), omitting bytes after the complete native bitmap."""
    if len(body) < 4:
        raise ValueError("Truncated native picture")
    x, y, width, height = body[:4]
    if packed:
        data, _ = decompress_rle(body[4:], width, height)
    else:
        data = body[4:4 + width * height]
    pixels = png.unpack_pixels(data)
    return png.encode_png(width * 4, height, pixels, palette), x, y


def parse_hitmap(text, source="hit map"):
    width = height = None
    legend = {".": 0, **{symbol: n for n, symbol in enumerate(SYMBOLS, 1)}}
    declared, rows = set(), []
    reading_rows = False
    for lineno, line in enumerate(text.splitlines(), 1):
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        where = f"{source}:{lineno}"
        if reading_rows:
            if len(line) != width or any(symbol not in legend for symbol in line):
                raise ValueError(f"{where}: expected {width} declared grid symbols")
            rows.append([legend[symbol] for symbol in line])
        elif line.startswith("size "):
            fields = line.split()
            if width is not None or len(fields) != 3:
                raise ValueError(f"{where}: expected one size WIDTH HEIGHT row")
            width, height = (byte(int(v), "grid size") for v in fields[1:])
            if not width or not height:
                raise ValueError(f"{where}: grid dimensions must be nonzero")
        elif line.startswith("legend "):
            for token in line[7:].split():
                match = re.fullmatch(r"([1-9A-Za-z])=([0-9]+)", token)
                if not match or match[1] in declared:
                    raise ValueError(f"{where}: expected unique legend A=101 entries")
                legend[match[1]] = byte(int(match[2]), "hit/depth value")
                declared.add(match[1])
        elif line == "grid" and width is not None:
            reading_rows = True
        else:
            raise ValueError(f"{where}: expected size, legend or grid")
    if width is None or not reading_rows or len(rows) != height:
        raise ValueError(f"{source}: grid row count differs from height")
    return {"width": width, "height": height, "rows": rows}


def hitmap_body(document):
    width, height, rows = document["width"], document["height"], document["rows"]
    if len(rows) != height or any(len(row) != width for row in rows):
        raise ValueError("Hit/depth map dimensions do not match its rows")
    raw = bytes(byte(value, "hit/depth value") for row in rows for value in row)
    return bytes([byte(width), byte(height)]) + compress_rle(raw, width, height)


def encode_hitmap(path):
    path = Path(path)
    return hitmap_body(parse_hitmap(path.read_text(encoding="utf-8"), str(path)))


def export_hitmap(document, context=""):
    document = document.get("data", document)
    rows = document.get("rows", document.get("object_ids"))
    values = {value for row in rows for value in row}
    symbols = {0: "."}
    symbols.update({v: SYMBOLS[v - 1] for v in values if 0 < v <= len(SYMBOLS)})
    available = iter(s for s in SYMBOLS if s not in symbols.values())
    for value in sorted(values - symbols.keys()):
        symbol = next(available, None)
        if symbol is None:
            raise ValueError("A hit map uses more distinct values than available symbols")
        symbols[value] = symbol
    lines = ["# " + context] if context else []
    lines.append(f"size {document['width']} {document['height']}")
    overrides = [f"{symbol}={value}" for value, symbol in sorted(symbols.items())
                 if value and SYMBOLS.index(symbol) + 1 != value]
    if overrides:
        lines.append("legend " + " ".join(overrides))
    lines.append("grid")
    lines.extend("".join(symbols[v] for v in row) for row in rows)
    return "\n".join(lines) + "\n"


def raw_glyph_bytes(text):
    """Decode an archival byte-glyph string without assuming a font."""
    out, position = bytearray(), 0
    while position < len(text):
        if text[position] == "\\":
            escape = text[position:position + 4]
            if not re.fullmatch(r"\\x[0-9A-Fa-f]{2}", escape):
                raise ValueError("Use \\xNN for an explicit glyph byte")
            out.append(int(escape[2:], 16))
            position += 4
        else:
            out.append(byte(ord(text[position]), "glyph"))
            position += 1
    return bytes(out)


def raw_glyph_text(data):
    return "".join(chr(v) if 32 <= v < 127 and v != 92 else f"\\x{v:02X}" for v in data)


def title_text(data):
    """Render paired title-font letters as {WORDS}, inverse as {~WORDS}.

    The two games store each large Latin letter in an upper/lower ASCII pair;
    Ł occupies the adjacent ':' and ';' tiles. Digits and ornamental tiles
    remain explicit glyphs because their title-font assignments differ.
    """
    def pair(position):
        if position + 1 >= len(data):
            return None
        first, second = data[position:position + 2]
        inverse = first & 128
        if second & 128 != inverse:
            return None
        first, second = first & 127, second & 127
        if 65 <= first <= 90 and second == first + 32:
            return chr(first), inverse
        if (first, second) == (58, 59):
            return "Ł", inverse
        return None
    result, position = [], 0
    while position < len(data):
        found = pair(position)
        if found:
            letters, inverse = [], found[1]
            while position < len(data):
                found = pair(position)
                if found and found[1] == inverse:
                    letters.append(found[0])
                    position += 2
                elif data[position] == (32 | inverse):
                    # A blank is one tile, unlike the two-tile letters.
                    letters.append(" ")
                    position += 1
                else:
                    break
            result.append("{" + ("~" if inverse else "") + "".join(letters) + "}")
        else:
            value = data[position]
            result.append(chr(value) if 32 <= value < 127 and value not in (92, 123, 125)
                          else f"\\x{value:02X}")
            position += 1
    return "".join(result)


def title_bytes(text):
    """Encode the readable paired-letter notation, preserving other tiles."""
    result, position = bytearray(), 0
    while position < len(text):
        char = text[position]
        if char == "{":
            end = text.find("}", position + 1)
            if end < 0:
                raise ValueError("Unclosed title letter group")
            value = text[position + 1:end]
            inverse = 128 if value.startswith("~") else 0
            value = value.removeprefix("~")
            if not value:
                raise ValueError("Empty title letter group")
            for letter in value:
                if "A" <= letter <= "Z":
                    result.extend((ord(letter) | inverse, (ord(letter) + 32) | inverse))
                elif letter == "Ł":
                    result.extend((58 | inverse, 59 | inverse))
                elif letter == " ":
                    result.append(32 | inverse)
                else:
                    raise ValueError(f"Unsupported paired title letter {letter!r}")
            position = end + 1
        elif char == "\\":
            result.extend(raw_glyph_bytes(text[position:position + 4]))
            position += 4
        elif char == "}":
            raise ValueError("Use \\x7D for a literal closing brace tile")
        else:
            result.append(byte(ord(char), "title glyph"))
            position += 1
    return bytes(result)


def readable_text(data):
    """Game font: equals is blank; lowercase slots contain Polish capitals."""
    return "".join(" " if v == 61 else POLISH[chr(v)] if chr(v) in POLISH else
                   chr(v) if 33 <= v < 127 and v != 92 and not chr(v).islower()
                   else f"\\x{v:02X}" for v in data)


def glyph_bytes(text):
    if not isinstance(text, str):
        raise ValueError("Expected quoted text")
    out, position = bytearray(), 0
    while position < len(text):
        char = text[position]
        if char == "\\":
            out.extend(raw_glyph_bytes(text[position:position + 4]))
            position += 4
            continue
        if char == " ":
            out.append(61)
        elif char in POLISH_REVERSE:
            out.append(POLISH_REVERSE[char])
        elif 33 <= ord(char) < 127 and not char.islower():
            out.append(ord(char))
        else:
            raise ValueError(f"Unsupported gameplay glyph {char!r}; use uppercase or \\xNN")
        position += 1
    return bytes(out)


def message_body(lines):
    if not isinstance(lines, (list, tuple)):
        raise ValueError("A message needs a list of quoted lines")
    encoded = [glyph_bytes(line) for line in lines]
    if not 1 <= len(encoded) <= 255:
        raise ValueError("A message needs 1..255 lines")
    return bytes([len(encoded)]) + b"".join(bytes([byte(len(line), "line length")]) + line
                                           for line in encoded)


def decode_message(raw):
    if not raw:
        raise ValueError("Missing message line count")
    lines, position = [], 1
    for _ in range(raw[0]):
        if position >= len(raw) or position + 1 + raw[position] > len(raw):
            raise ValueError("Truncated counted message")
        length = raw[position]
        lines.append(readable_text(raw[position + 1:position + 1 + length]))
        position += length + 1
    if position != len(raw):
        raise ValueError("Trailing data after counted message")
    return lines


# Dispatch numbers and parameter order are the unchanged executable's ABI.
# A '?' is an optional trailing byte retained by some original action records.
ACTION_SPECS = {
    'klatwa': {
        3: ('drop-item', ''),
        4: ('take-item', ''),
        5: ('enter-view', ''),
        6: ('describe', 'message:message'),
        13: ('open-pair', 'removed_object argument_2 added_object_1 added_object_2'),
        14: ('close-pair', 'removed_object_1 removed_object_2 added_object argument_4'),
        15: ('enter-room', ''),
        16: ('open-replacement-16', 'redraw_background removed_object replacement_object'),
        17: ('close-replacement', 'redraw_background removed_object replacement_object'),
        18: ('copy-spell', ''),
        19: ('describe-spell', ''),
        20: ('open-with-item', 'argument_1'),
        21: ('open-with-spell', 'argument_1'),
        22: ('destroy-with-item', 'argument_1 argument_2'),
        23: ('lift-if-ready', 'argument_1 argument_2 argument_3'),
        24: ('touch-magic-stone', ''),
        25: ('describe-object', ''),
        26: ('open-if-ready', 'argument_1 argument_2 replacement_object'),
        27: ('examine-object', ''),
        28: ('open-magic-trap', 'argument_1 argument_2 argument_3'),
        29: ('replace-with-spell', 'argument_1 argument_2'),
        30: ('add-scene-object', 'added_object'),
        31: ('remove-scene-object', 'removed_object'),
        32: ('spell-remote-view', 'view required_spell expected_object replacement_object message:message'),
        33: ('take-reward', 'redraw_background removed_object inventory_item puzzle_cell'),
        34: ('play-for-prize', 'argument_1 argument_2 argument_3 argument_4 message:message'),
        35: ('close-puzzle-view', 'redraw_background removed_object replacement_object puzzle_cell'),
        36: ('pay-or-trigger-trap', 'argument_1 argument_2 argument_3 message:message'),
        37: ('cannot-take-37', 'message:message'),
        38: ('spell-replacement', 'argument_1 argument_2'),
        39: ('catch-with-item', 'redraw_background removed_object inventory_item puzzle_cell required_item'),
        40: ('spell-remove-object', 'removed_object required_spell'),
        41: ('cannot-take-41', 'message:message'),
        42: ('copy-hidden-spell', 'argument_1'),
        43: ('cross-antimagic-wall', ''),
        44: ('read-message', 'message:message'),
        45: ('open-replacement-45', 'redraw_background removed_object replacement_object'),
        46: ('examine-if-ready-46', 'message:message'),
        47: ('view-if-ready', ''),
        48: ('final-destruction', 'argument_1 argument_2 message:message'),
        49: ('examine-if-ready-49', 'message:message'),
        50: ('listen', 'message:message'),
        51: ('pay-warlock', 'message:message'),
        52: ('travel-through-time', ''),
        53: ('spell-add-object', 'added_object'),
    },
    'wladcy-ciemnosci': {
        3: ('drop-item', ''),
        4: ('take-item', ''),
        5: ('look-closer', ''),
        6: ('describe-arg', 'argument_1'),
        12: ('enter-linked-room-12', ''),
        13: ('enter-linked-room-13', ''),
        14: ('enter-linked-room-14', ''),
        15: ('enter-linked-room-15', ''),
        16: ('open-scene-object', 'redraw_background removed_object replacement_object'),
        17: ('close-scene-object', 'redraw_background removed_object replacement_object'),
        18: ('break-release-power', 'argument_1 power_id requirement_1 requirement_2 text:counted-text'),
        20: ('open-with-item-20', 'argument_1'),
        21: ('open-with-power', 'argument_1'),
        23: ('open-at-state4', 'argument_1 argument_2'),
        24: ('close-and-darken', 'added_object argument_2 light_state_cell dark_overlay darkness_message set_state_cell'),
        25: ('open-restore-light', 'redraw_background removed_object replacement_object cleared_state_cell'),
        27: ('bury-in-room-range', 'exclusive_room_lower exclusive_room_upper additional_allowed_room argument_4 argument_5 argument_6 argument_7 required_item'),
        28: ('open-with-item-28', 'argument_1 argument_2'),
        29: ('extinguish', 'argument_1 replacement_item updated_state_cell darkness_state_cell darkness_message'),
        30: ('refuse-take', 'error_message'),
        31: ('strike-with-item', 'argument_1'),
        32: ('take-set-state', 'redraw_background removed_object inventory_item state_value state_cell argument_6?'),
        33: ('break-off-item', 'redraw_background removed_object inventory_item state_value state_cell'),
        34: ('take-after-state', 'required_state_cell argument_2 argument_3 argument_4 argument_5 argument_6 revealed_object inventory_item'),
        35: ('cheer-with-item', 'argument_1 argument_2 argument_3 argument_4 argument_5 argument_6 argument_7'),
        36: ('fill-with-item-36', 'required_item message state_value state_cell'),
        37: ('wear-set-state', 'removed_object message state_value state_cell'),
        39: ('take-set-two-states', 'state_value_1 state_cell_1 state_value_2 state_cell_2'),
        40: ('smear-with-item', 'required_item added_object view state_limit state_cell argument_6 error_message'),
        41: ('feed-dogs', 'added_object message'),
        42: ('open-two-objects', 'added_object'),
        43: ('transform-with-power', 'required_power replacement_item'),
        44: ('listen-state-reply', 'argument_1 argument_2 argument_3 argument_4 argument_5 argument_6 argument_7'),
        45: ('light-with-item', 'required_item replacement_item argument_3 argument_4 argument_5 argument_6 required_state_cell'),
        46: ('describe-metadata', ''),
        47: ('read-metadata-state', ''),
        48: ('read-action-state', 'state_cell argument_2 argument_3 argument_4?'),
        49: ('enter-with-power', 'required_power'),
        50: ('enter-after-state', 'required_state_cell argument_2 argument_3 argument_4 argument_5 argument_6'),
        51: ('buy-with-item', 'argument_1 argument_2 argument_3 argument_4 argument_5 argument_6'),
        52: ('tell-story', 'argument_1'),
        53: ('tell-truth', 'argument_1 argument_2 argument_3 argument_4'),
        54: ('use-power-once', 'argument_1 state_value'),
        55: ('refuse-jump', 'error_message'),
        56: ('open-with-item-56', 'argument_1'),
        57: ('describe-inline', 'message:message'),
        58: ('path-forward', ''),
        59: ('path-right', ''),
        60: ('path-back', ''),
        61: ('path-left', ''),
        62: ('reveal-with-power', 'revealed_object required_power state_cell error_message'),
        63: ('path-enter-with-item', 'required_state_cell error_message required_item'),
        64: ('fill-with-item-64', 'required_item message state_value state_cell'),
        65: ('enter-second-stage', ''),
        66: ('enter-update-pairs', 'state_cell'),
        67: ('swim-with-light-load', 'error_message argument_2'),
        68: ('reset-paired-items', 'argument_1 message argument_3 argument_4'),
        69: ('reveal-set-power-state', 'revealed_object required_power message state_value state_cell'),
        70: ('give-inventory', 'revealed_object power_id requirement_1 requirement_2 text:counted-text'),
        71: ('empower-trained-state', 'required_power state_cell argument_3 argument_4 argument_5 argument_6 argument_7'),
        72: ('train-with-item', 'required_item state_cell argument_3 error_message'),
        73: ('enter-after-training', 'error_message'),
        74: ('drop-required-item', 'revealed_object exact_inventory_id wrong_item_message'),
        75: ('open-with-item-75', 'argument_1'),
        76: ('patch-with-item', 'argument_1 state_value state_cell'),
        77: ('release-power-in-view-77', 'required_room required_view error_message argument_4 power_id requirement_1 requirement_2 text:counted-text'),
        78: ('open-with-item-78', 'argument_1'),
        79: ('release-power-in-view-79', 'required_room required_view error_message argument_4 power_id requirement_1 requirement_2 text:counted-text'),
    },
}


def _fields(spec):
    result = []
    for field in spec.split():
        name, _, kind = field.partition(":")
        result.append((name.rstrip("?"), kind or "byte", name.endswith("?")))
    return result


def _parameters(text, where):
    result, position = {}, 0
    decoder = json.JSONDecoder()
    while position < len(text):
        while position < len(text) and text[position].isspace():
            position += 1
        if position == len(text):
            break
        match = re.match(r"([a-z][a-z0-9_]*)=", text[position:])
        if not match or match[1] in result:
            raise ValueError(f"{where}: expected unique name=value arguments")
        name = match[1]
        position += len(match[0])
        if position < len(text) and text[position] == '"':
            value, count = decoder.raw_decode(text[position:])
            position += count
        else:
            match = re.match(r"[0-9]+", text[position:])
            if not match:
                raise ValueError(f"{where}: expected a decimal byte or quoted text")
            value = int(match[0])
            position += len(match[0])
        if position < len(text) and not text[position].isspace():
            raise ValueError(f"{where}: arguments need whitespace separators")
        result[name] = value
    return result


def parse_actions(text, game, source="actions"):
    """Parse consecutive collection sections and validate named handler fields."""
    by_name = {name: (opcode, fields) for opcode, (name, fields) in ACTION_SPECS[game].items()}
    result, section, action, message = [], None, None, None
    for lineno, line in enumerate(text.splitlines(), 1):
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        where = f"{source}:{lineno}"
        if line.startswith("["):
            match = re.fullmatch(r"\[([0-9]+)(?: [^\]\r\n]+)?\]", line)
            if not match or int(match[1]) != len(result):
                raise ValueError(f"{where}: collections must be consecutive from zero")
            section = {"id": len(result), "approach": None, "item": None, "actions": []}
            result.append(section)
            action = message = None
            continue
        if section is None:
            raise ValueError(f"{where}: expected a [collection ID] section")
        if line.startswith("    "):
            if message is None:
                raise ValueError(f"{where}: text requires an indented message: field")
            value = json.loads(line[4:])
            glyph_bytes(value)
            message.append(value)
            continue
        if line.startswith("  "):
            if action is None or line.strip() != "message:":
                raise ValueError(f"{where}: expected message: under an action")
            if "message" in action["parameters"]:
                raise ValueError(f"{where}: duplicate message")
            message = action["parameters"]["message"] = []
            continue
        message = None
        name, _, parameters = line.partition(" ")
        if name in ("approach", "item", "empty"):
            if (section["approach"] is not None or section["item"] is not None
                    or section.get("empty") or section["actions"]):
                raise ValueError(f"{where}: collection metadata must appear exactly once, first")
            if name == "item":
                section["item"] = byte(int(parameters), "inventory item")
            elif name == "empty":
                if parameters:
                    raise ValueError(f"{where}: empty takes no arguments")
                section["empty"] = True
            elif parameters.startswith("legacy="):
                values = parameters.removeprefix("legacy=").split(",")
                section["approach"] = bytes(byte(int(v)) for v in values)
            else:
                values = _parameters(parameters, where)
                keys = ("control",) if "control" in values else ("facing", "run", "x", "y", "final")
                if set(values) != set(keys):
                    raise ValueError(f"{where}: approach needs control, or facing/run/x/y/final")
                section["approach"] = bytes(byte(values[key], key) for key in keys)
            continue
        if name not in by_name:
            raise ValueError(f"{where}: unknown {game} action {name!r}")
        if section.get("empty") or (section["approach"] is None and section["item"] is None):
            raise ValueError(f"{where}: an action requires approach or item metadata")
        opcode, _ = by_name[name]
        action = {"opcode": opcode, "name": name, "parameters": _parameters(parameters, where)}
        section["actions"].append(action)
    for section in result:
        if not section.get("empty") and section["approach"] is None and section["item"] is None:
            raise ValueError(f"{source}: section {section['id']} needs approach, item or empty")
        for action in section["actions"]:
            fields = _fields(ACTION_SPECS[game][action["opcode"]][1])
            actual = action["parameters"]
            required = {name for name, _, optional in fields if not optional}
            allowed = {name for name, _, _ in fields}
            if not required <= actual.keys() <= allowed:
                raise ValueError(f"{source}: {action['name']} expects {', '.join(sorted(required)) or 'no parameters'}")
            for name, kind, _ in fields:
                if name not in actual:
                    continue
                value = actual[name]
                if kind == "message":
                    message_body(value)
                elif kind == "counted-text":
                    byte(len(glyph_bytes(value)), "counted text length")
                else:
                    byte(value, name)
    return result


def actions_body(collections, game):
    encoded = []
    for collection in collections:
        children = []
        if collection["item"] is not None:
            children.append(bytes([collection["item"]]))
        elif collection["approach"] is not None:
            children.append(collection["approach"])
        for action in collection["actions"]:
            payload = bytearray([action["opcode"]])
            for name, kind, _ in _fields(ACTION_SPECS[game][action["opcode"]][1]):
                if name not in action["parameters"]:
                    continue
                value = action["parameters"][name]
                if kind == "message":
                    payload.extend(message_body(value))
                elif kind == "counted-text":
                    text = glyph_bytes(value)
                    payload.extend(bytes([len(text)]) + text)
                else:
                    payload.append(value)
            children.append(bytes(payload))
        encoded.append(records(children))
    return records(encoded, terminated=False)


def encode_actions(path, game):
    path = Path(path)
    return actions_body(parse_actions(path.read_text(encoding="utf-8"), game, str(path)), game)


def export_actions(document, game):
    """Migrate old semantic nodes to compact text, never copying packed bytes."""
    document = document.get("data", document)
    lines = ["# Shared action collections. Room selector rows choose these IDs.", ""]
    for ident, collection in enumerate(document["records"]):
        lines.append(f"[{ident:02d}]")
        children = collection["records"]
        if not children:
            lines.extend(("empty", ""))
            continue
        head = children[0]
        if head["kind"] == "byte":
            lines.append(f"item {head['value']}" if head.get("name") == "global_item_id"
                         else f"approach control={head['value']}")
        elif head["kind"] == "sequence":
            values = [n["value"] for n in head["parts"]]
            if [n.get("name") for n in head["parts"]] == ["facing", "approach_run", "x", "y", "final_facing"]:
                lines.append("approach " + " ".join(f"{name}={value}" for name, value in
                                                    zip(("facing", "run", "x", "y", "final"), values)))
            else:
                lines.append("approach legacy=" + ",".join(map(str, values)))
        else:
            raise ValueError(f"Unsupported action metadata {head['kind']}")
        for action in children[1:]:
            opcode = action["dispatch_id"]
            name, fields = ACTION_SPECS[game][opcode]
            args = action["arguments"]
            values = []
            if game == "klatwa" and opcode in (50, 51):
                values = [decode_message(bytes(arg["value"] for arg in args))]
            elif game == "wladcy-ciemnosci" and opcode == 70:
                raw = bytes(arg["value"] for arg in args)
                if len(raw) != 5 + raw[4]:
                    raise ValueError("Malformed give-inventory power name")
                values = [*raw[:4], readable_text(raw[5:])]
            else:
                for arg in args:
                    if arg["kind"] == "message":
                        values.append([readable_text(raw_glyph_bytes(line)) for line in arg["lines"]])
                    elif arg["kind"] == "counted-text":
                        values.append(readable_text(raw_glyph_bytes(arg["text"])))
                    elif arg["kind"] == "byte":
                        values.append(arg["value"])
                    else:
                        raise ValueError(f"Unsupported action parameter {arg['kind']}")
            params, messages = [], []
            ordered_fields = _fields(fields)
            if not sum(not optional for _, _, optional in ordered_fields) <= len(values) <= len(ordered_fields):
                raise ValueError(f"Unexpected stored parameter count for {name}")
            for (key, kind, _), value in zip(ordered_fields, values):
                if kind == "message":
                    messages.append(value)
                else:
                    params.append(f"{key}={json.dumps(value, ensure_ascii=False)}")
            lines.append(" ".join([name, *params]))
            for message in messages:
                lines.append("  message:")
                lines.extend("    " + json.dumps(line, ensure_ascii=False) for line in message)
        lines.append("")
    text = "\n".join(lines)
    parse_actions(text, game)
    return text
