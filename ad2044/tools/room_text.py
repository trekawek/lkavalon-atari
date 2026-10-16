"""Human-editable AD2044 actions and hit maps, independent of disk allocation.

Action sections are zero-based clickable zone IDs, not drawable image IDs.
Messages use quoted Unicode text; unsupported game-font slots use \\xNN escapes.
Encoders return a resource BODY: callers supply its outer u16 record length.
"""

from __future__ import annotations

import json
from pathlib import Path
import re

# Lowercase font slots with unambiguous Polish capital glyphs. The original z
# slot is deliberately escaped: available evidence does not distinguish Z-dot
# from Z-acute. '=' is the game's blank. Original byte $20 needs an escape.
POLISH = dict(zip("acelnos", "ĄĆĘŁŃÓŚ"))
POLISH_REVERSE = {value: ord(key) for key, value in POLISH.items()}
SYMBOLS = "123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
# LOAD-HIT-MAP expands into $4FED; the next live dictionary header is $5140.
HITMAP_CAPACITY = 0x5140 - 0x4FED

# Ordered native fields; names are inferred from the actual handler consumers.
ACTION_SPECS = {
    0: ('cancel', (('u8', 'unused_parameter_1'),)),
    1: ('back', (('u8', 'unused_parameter_1'), ('u8', 'unused_parameter_2'))),
    2: ('show-closeup', (('u8', 'view_id'),)),
    4: ('lift-energy-gated', (('u8', 'view_id'), ('u8', 'energy_threshold_exclusive'), ('message', 'message_1'))),
    6: ('goto-room', (('u8', 'room_id'),)),
    7: ('examine', (('message', 'message_1'),)),
    8: ('eat', (('u8', 'object_id'), ('u8', 'energy_added'), ('message', 'message_1'))),
    9: ('drink', (('u8', 'object_id'), ('u8', 'energy_added'), ('u8', 'unused_parameter_3'), ('message', 'message_1'))),
    10: ('break-reveal', (('u8', 'revealed_object_id'), ('u8', 'unused_parameter_2'))),
    11: ('open-with-item', (('u8', 'object_id'), ('u8', 'required_inventory_id'), ('u8', 'exit_direction'), ('message', 'message_1'))),
    12: ('close-exit', (('u8', 'hidden_object_id'), ('u8', 'exit_direction'))),
    13: ('use-relative-exit', (('u8', 'relative_direction'),)),
    14: ('take-item', ()),
    15: ('smoke', (('u8', 'revealed_object_id'), ('u8', 'exit_direction'))),
    16: ('drop-inventory-item', (('message', 'message_1'),)),
    17: ('open-exit', (('u8', 'revealed_object_id'), ('u8', 'exit_direction'))),
    18: ('show-closeup-18', (('u8', 'view_id'),)),
    19: ('show-closeup-19', (('u8', 'view_id'),)),
    20: ('reveal-object', (('u8', 'revealed_object_id'),)),
    21: ('hide-object', (('u8', 'hidden_object_id'),)),
    22: ('off-remove-remote', (('u8', 'revealed_object_id'), ('u8', 'remote_room_id'), ('u8', 'remote_object_id'), ('u8', 'remote_exit_direction'))),
    23: ('on-add-remote', (('u8', 'hidden_object_id'), ('u8', 'remote_room_id'), ('u8', 'remote_object_id'), ('u8', 'remote_exit_direction'))),
    24: ('enable-if-clear', (('u8', 'revealed_object_id'), ('u8', 'cleared_view_id'), ('u8', 'tested_state_index'), ('u8', 'set_state_index'), ('message', 'message_1'))),
    25: ('disable-flag', (('u8', 'hidden_object_id'), ('u8', 'cleared_state_index'))),
    26: ('open-if-counter-clear', (('u8', 'revealed_object_id'), ('u8', 'tested_state_index'), ('u8', 'incremented_state_index'), ('message', 'message_1'))),
    27: ('close-decrement', (('u8', 'hidden_object_id'), ('u8', 'decremented_state_index'))),
    28: ('move-reveal', (('u8', 'revealed_object_id'),)),
    29: ('move-hide', (('u8', 'hidden_object_id'),)),
    30: ('press-add-counter', (('u8', 'revealed_object_id'), ('u8', 'counter_delta'), ('u8', 'counter_index'), ('u8', 'target_counter_value'), ('u8', 'question_object_id'), ('u8', 'answer_object_id'), ('u8', 'success_state_index'), ('counted-text', 'expected_answer'))),
    31: ('release-sub-counter', (('u8', 'hidden_object_id'), ('u8', 'counter_delta'), ('u8', 'counter_index'), ('u8', 'target_counter_value'), ('u8', 'question_object_id'), ('u8', 'answer_object_id'), ('u8', 'success_state_index'), ('counted-text', 'expected_answer'))),
    32: ('press-if-state-set', (('u8', 'revealed_object_id'), ('u8', 'exit_direction'), ('u8', 'tested_state_index'), ('message', 'message_1'))),
    33: ('throw-relocate-room', (('u8', 'source_room_id'), ('u8', 'required_inventory_id'), ('u8', 'destination_room_id'), ('u8', 'set_state_index'), ('message', 'message_1'))),
    34: ('examine-flag', (('u8', 'tested_state_index'), ('message', 'message_1'), ('message', 'message_2'))),
    35: ('select-floor', (('u8', 'floor_id'), ('u8', 'indicator_object_base'), ('u8', 'door_object_id'), ('u8', 'animation_object_id'))),
    36: ('shout-answer', (('u8', 'revealed_object_id'), ('u8', 'answer_result_bias'))),
    37: ('show-item-open', (('u8', 'revealed_object_id'), ('u8', 'exit_direction'), ('u8', 'animation_frame_count'), ('u8', 'required_inventory_id'), ('message', 'message_1'))),
    38: ('animate-open', (('u8', 'revealed_object_id'), ('u8', 'exit_direction'), ('u8', 'animation_frame_count'))),
    39: ('animate-close', (('u8', 'hidden_object_id'), ('u8', 'exit_direction'), ('u8', 'animation_frame_count'))),
    40: ('adult-gated-closeup', (('u8', 'view_id'), ('counted-text', 'expected_answer'), ('message', 'message_1'))),
    41: ('refuse-closeup', (('message', 'message_1'),)),
    42: ('refuse-with-overlay', (('u8', 'revealed_object_id_or_255'), ('message', 'message_1'))),
    43: ('move-reveal-43', (('u8', 'revealed_object_id'),)),
    44: ('move-hide-44', (('u8', 'hidden_object_id'),)),
    45: ('swim-require-item', (('u8', 'view_id'), ('u8', 'required_inventory_id'), ('message', 'message_1'))),
    46: ('take-parameter-object', (('u8', 'revealed_object_id'), ('u8', 'selected_object_id'))),
    47: ('take-item-47', (('u8', 'unused_parameter_1'),)),
    48: ('discard-object', (('u8', 'hidden_object_id'),)),
    49: ('open-remove-with-item', (('u8', 'object_id'), ('u8', 'required_inventory_id'), ('u8', 'exit_direction'), ('message', 'message_1'))),
    50: ('reveal-object-50', (('u8', 'revealed_object_id'),)),
    51: ('press-if-flag-set', (('u8', 'revealed_object_id'), ('u8', 'exit_direction'), ('u8', 'animation_frame_count'), ('u8', 'tested_state_index'), ('message', 'message_1'))),
    52: ('show-item-set-flag', (('u8', 'hidden_object_id'), ('u8', 'required_inventory_id'), ('u8', 'alternate_inventory_id'), ('u8', 'set_state_index'), ('message', 'message_1'), ('message', 'message_2'))),
    53: ('shout-reveal-if-clear', (('u8', 'revealed_object_id'), ('u8', 'answer_result_bias'), ('counted-text', 'expected_answer'))),
    54: ('refuse-with-overlay-54', (('u8', 'revealed_object_id_or_255'), ('message', 'message_1'))),
    55: ('refuse-with-overlay-55', (('u8', 'revealed_object_id_or_255'), ('message', 'message_1'))),
    56: ('password-press', (('u8', 'revealed_object_id'), ('u8', 'exit_direction'), ('u8', 'animation_frame_count'), ('counted-text', 'expected_answer'), ('message', 'message_1'))),
    57: ('cut-with-item', (('u8', 'revealed_object_id'), ('u8', 'exit_direction'), ('u8', 'animation_frame_count'), ('u8', 'required_inventory_id'), ('message', 'message_1'))),
    58: ('inactive-button', ()),
    59: ('turn-set-flag', (('u8', 'revealed_object_id'), ('u8', 'exit_direction'), ('u8', 'animation_frame_count'), ('u8', 'set_state_index'))),
    60: ('turn-clear-flag', (('u8', 'hidden_object_id'), ('u8', 'exit_direction'), ('u8', 'animation_frame_count'), ('u8', 'cleared_state_index'))),
    61: ('open-if-puzzle-set', (('u8', 'revealed_object_id'), ('u8', 'exit_direction'), ('u8', 'tested_state_index'), ('message', 'message_1'))),
    62: ('reveal-object-62', (('u8', 'revealed_object_id'),)),
    63: ('hide-object-63', (('u8', 'hidden_object_id'),)),
    64: ('screw-in-item', (('u8', 'hidden_object_id'), ('u8', 'required_inventory_id'), ('u8', 'bit_source_state_index'), ('u8', 'counter_state_index'), ('message', 'message_1'))),
    65: ('examine-counter', (('u8', 'counter_state_index'), ('message', 'message_1'), ('message', 'message_2'), ('message', 'message_3'))),
    66: ('unscrew-item', (('u8', 'revealed_object_id'), ('u8', 'selected_object_id'), ('u8', 'bit_source_state_index'), ('u8', 'counter_state_index'))),
    67: ('press-if-state-two', (('u8', 'revealed_object_id'), ('u8', 'exit_direction'), ('u8', 'animation_frame_count'), ('u8', 'tested_state_index'), ('u8', 'unused_parameter_5'), ('message', 'message_1'))),
    68: ('press-flash-advance', (('u8', 'revealed_object_id'), ('u8', 'exit_direction'), ('u8', 'animation_frame_count'), ('u8', 'tested_state_index'), ('u8', 'set_state_index'), ('message', 'message_1'), ('message', 'message_2'))),
    69: ('press-two-and-flag', (('u8', 'revealed_object_id'), ('u8', 'exit_direction'), ('u8', 'animation_frame_count'), ('u8', 'tested_state_index'), ('u8', 'second_tested_state_index'), ('message', 'message_1'), ('message', 'message_2'))),
    70: ('apply-item-set-three', (('u8', 'required_inventory_id'), ('u8', 'state_index'), ('message', 'message_1'), ('message', 'message_2'), ('message', 'message_3'))),
    71: ('on-increment', (('u8', 'revealed_object_id'), ('u8', 'incremented_state_index'))),
    72: ('off-decrement', (('u8', 'hidden_object_id'), ('u8', 'decremented_state_index'))),
    73: ('animate-close-73', (('u8', 'hidden_object_id'), ('u8', 'exit_direction'), ('u8', 'animation_frame_count'))),
    74: ('chromosome-ending', (('counted-text', 'expected_answer'), ('message', 'message_1'))),
    75: ('insert-either-item', (('u8', 'animation_object_id'), ('u8', 'exit_direction'), ('u8', 'animation_frame_count'), ('u8', 'accepted_inventory_id_1'), ('u8', 'accepted_inventory_id_2'), ('u8', 'hidden_object_id'), ('message', 'message_1'))),
}
BY_NAME = {name: (opcode, fields) for opcode, (name, fields) in ACTION_SPECS.items()}


def _u8(value, label):
    if type(value) is not int or not 0 <= value <= 255:
        raise ValueError(f"{label}: expected a decimal byte 0..255")
    return value


def _counted(data):
    if not 0 < len(data) <= 65535:
        raise ValueError("GAM record payload must contain 1..65535 bytes")
    return len(data).to_bytes(2, "little") + data


def _original_glyphs(value):
    if isinstance(value, str):
        return value.encode("ascii")
    result = bytearray()
    for run in value:
        if isinstance(run, str):
            result.extend(run.encode("ascii"))
        elif set(run) == {"glyph"}:
            result.append(_u8(run["glyph"], "glyph"))
        elif set(run) == {"inverse"}:
            result.extend(b | 128 for b in run["inverse"].encode("ascii"))
        else:
            raise ValueError(f"Unknown original glyph run {run!r}")
    return bytes(result)


def readable_text(raw):
    """Render original glyph bytes reversibly, without changing line spacing."""
    out = []
    for byte in raw:
        char = chr(byte)
        if char == "=":
            out.append(" ")
        elif char in POLISH:
            out.append(POLISH[char])
        elif 33 <= byte < 127 and char != "\\" and not char.islower():
            out.append(char)
        else:
            out.append(f"\\x{byte:02X}")
    return "".join(out)


def glyph_bytes(text):
    """Convert author text to original font slots; escapes denote exact bytes."""
    if not isinstance(text, str):
        raise ValueError("Expected quoted text")
    out = bytearray()
    i = 0
    while i < len(text):
        char = text[i]
        if char == "\\":
            token = text[i:i + 4]
            if not re.fullmatch(r"\\x[0-9A-Fa-f]{2}", token):
                raise ValueError("Unsupported glyph escape: use \\xNN")
            out.append(int(token[2:], 16))
            i += 4
            continue
        if char == " ":
            out.append(ord("="))
        elif char in POLISH_REVERSE:
            out.append(POLISH_REVERSE[char])
        elif 33 <= ord(char) < 127 and not char.islower():
            out.append(ord(char))
        else:
            raise ValueError(f"Unsupported game-font glyph {char!r}; use \\xNN for a known slot")
        i += 1
    return bytes(out)


def _quote(text):
    return json.dumps(text, ensure_ascii=False)


def _parameters(text, where):
    result = {}
    position = 0
    decoder = json.JSONDecoder()
    while position < len(text):
        while position < len(text) and text[position].isspace():
            position += 1
        if position == len(text):
            break
        match = re.match(r"([a-z][a-z0-9_]*)=", text[position:])
        if not match:
            raise ValueError(f"{where}: expected name=value")
        name = match.group(1)
        if name in result:
            raise ValueError(f"{where}: duplicate parameter {name}")
        position += len(match.group(0))
        if position < len(text) and text[position] == '"':
            try:
                value, count = decoder.raw_decode(text[position:])
            except json.JSONDecodeError as exc:
                raise ValueError(f"{where}: invalid quoted parameter") from exc
            position += count
        else:
            match = re.match(r"[0-9]+", text[position:])
            if not match:
                raise ValueError(f"{where}: parameter must be decimal or quoted text")
            value = int(match.group(0))
            position += len(match.group(0))
        if position < len(text) and not text[position].isspace():
            raise ValueError(f"{where}: parameters need whitespace separators")
        result[name] = value
    return result


def parse_actions(text, source="actions"):
    """Parse sections and named action arguments into rich ordered metadata."""
    objects = []
    action = None
    message = None
    for lineno, line in enumerate(text.splitlines(), 1):
        where = f"{source}:{lineno}"
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        if line.startswith("["):
            match = re.fullmatch(r"\[([0-9]+)(?: ([^\]\r\n]+))?\]", line)
            if not match:
                raise ValueError(f"{where}: expected [ID optional-name]")
            ident = int(match.group(1))
            if ident != len(objects):
                raise ValueError(f"{where}: zone IDs must be consecutive from zero; expected {len(objects)}")
            _u8(ident, "zone ID")
            objects.append({"object_id": ident, "name": match.group(2) or "", "actions": []})
            action = message = None
        elif line.startswith("    "):
            if message is None:
                raise ValueError(f"{where}: quoted line needs a message field")
            try:
                value = json.loads(line[4:])
            except json.JSONDecodeError as exc:
                raise ValueError(f"{where}: message lines must be JSON-quoted strings") from exc
            glyph_bytes(value)
            message.append(value)
        elif line.startswith("  "):
            if action is None:
                raise ValueError(f"{where}: indented fields need an action")
            match = re.fullmatch(r"  ([a-z][a-z0-9_]*):", line)
            if not match:
                parameters = _parameters(line[2:], where)
                extra = parameters.keys() - {
                    name for _, name in ACTION_SPECS[action["opcode"]][1]
                }
                if extra:
                    raise ValueError(f"{where}: unknown parameters {', '.join(sorted(extra))}")
                repeated = parameters.keys() & action["arguments"].keys()
                if repeated:
                    raise ValueError(f"{where}: duplicate parameters {', '.join(sorted(repeated))}")
                action["arguments"].update(parameters)
                message = None
                continue
            name = match.group(1)
            fields = dict((field_name, kind) for kind, field_name in ACTION_SPECS[action["opcode"]][1])
            if fields.get(name) != "message":
                raise ValueError(f"{where}: {name} is not a message field of {action['verb']}")
            if name in action["arguments"]:
                raise ValueError(f"{where}: duplicate parameter {name}")
            message = []
            action["arguments"][name] = message
        elif line[0].isspace():
            raise ValueError(f"{where}: use no indentation for actions, two/four spaces for messages")
        else:
            if not objects:
                raise ValueError(f"{where}: action needs a zone section")
            name, _, tail = line.partition(" ")
            if name not in BY_NAME:
                raise ValueError(f"{where}: unknown action {name!r}")
            opcode, fields = BY_NAME[name]
            parameters = _parameters(tail, where)
            allowed = {field_name for _, field_name in fields}
            extra = parameters.keys() - allowed
            if extra:
                raise ValueError(f"{where}: unknown parameters {', '.join(sorted(extra))}")
            action = {"opcode": opcode, "verb": name, "arguments": parameters}
            objects[-1]["actions"].append(action)
            message = None
    if not objects:
        raise ValueError(f"{source}: no zones")
    # Validate complete fields and byte/string bounds before returning metadata.
    actions_body(objects)
    return {"objects": objects}


def _action_body(action):
    opcode = action["opcode"]
    spec = ACTION_SPECS[opcode][1]
    values = action["arguments"]
    extra = values.keys() - {name for _, name in spec}
    if extra:
        raise ValueError(f"{action['verb']}: unknown parameters {sorted(extra)}")
    body = bytearray([opcode])
    for kind, name in spec:
        if name not in values:
            if opcode in (0, 1) and name.startswith("unused_parameter_"):
                continue
            raise ValueError(f"{action['verb']}: missing parameter {name}")
        value = values[name]
        if kind == "u8":
            body.append(_u8(value, name))
        elif kind == "counted-text":
            raw = glyph_bytes(value)
            body.append(_u8(len(raw), f"{name} length"))
            body.extend(raw)
        elif kind == "message":
            if not isinstance(value, list):
                raise ValueError(f"{name}: use an indented message block")
            body.append(_u8(len(value), f"{name} line count"))
            for line in value:
                raw = glyph_bytes(line)
                body.append(_u8(len(raw), f"{name} line length"))
                body.extend(raw)
    # Extra bytes on back/cancel are retained only when explicitly supplied.
    if opcode == 1 and ("unused_parameter_1" in values) != ("unused_parameter_2" in values):
        raise ValueError("back: provide both preserved unused parameters or neither")
    return bytes(body)


def actions_body(objects):
    """Generate nested action lengths and each object's zero terminator."""
    out = bytearray()
    for obj in objects:
        body = b"".join(_counted(_action_body(action)) for action in obj["actions"])
        out.extend(_counted(body + b"\0\0"))
    return bytes(out)


def read_actions(path):
    """Read one collection file or concatenate its ordered per-zone files."""
    path = Path(path)
    if path.is_dir():
        def order(child):
            return (0, int(child.stem)) if child.stem.isdecimal() else (1, child.name)
        files = sorted(path.glob("*.txt"), key=order)
        text = "\n".join(child.read_text(encoding="utf-8") for child in files)
    else:
        text = path.read_text(encoding="utf-8")
    return parse_actions(text, str(path))


def encode_actions(path):
    return actions_body(read_actions(path)["objects"])


def export_action_sections(document, names=None):
    """Return one text file per zone, retaining its existing numeric index.

    A single section can therefore be exported for an edit/review without
    silently being renumbered zero. read_actions(directory) checks that the
    complete collection has every index in sequence before encoding it.
    """
    names = names or {}
    result = {}
    for index, obj in enumerate(document["objects"]):
        ident = _u8(obj.get("object_id", index), "zone ID")
        filename = f"{ident:02d}.txt"
        if filename in result:
            raise ValueError(f"Duplicate zone ID {ident}")
        label = names.get(ident, "")
        if any(c in label for c in "[]\r\n"):
            raise ValueError("Zone names cannot contain brackets or newlines")
        lines = [f"[{ident:02d}{' ' + label if label else ''}]"]
        for action in obj["actions"]:
            verb, spec = ACTION_SPECS[action["opcode"]]
            values = {f["name"]: f for f in action["fields"]}
            pieces = [verb]
            for kind, name in spec:
                if name not in values:
                    continue
                field = values[name]
                if kind == "u8":
                    pieces.append(f"{name}={field['value']}")
                elif kind == "counted-text":
                    value = readable_text(_original_glyphs(field['text']))
                    pieces.append(f"{name}={_quote(value)}")
            current = pieces[0]
            for piece in pieces[1:]:
                if len(current) + len(piece) + 1 > 88:
                    lines.append(current)
                    current = "  " + piece
                else:
                    current += " " + piece
            lines.append(current)
            for kind, name in spec:
                if kind == "message" and name in values:
                    lines.append(f"  {name}:")
                    for line in values[name]["lines"]:
                        lines.append("    " + _quote(readable_text(_original_glyphs(line))))
        result[filename] = "\n".join(lines) + "\n"
    return result


def export_actions(document, names=None):
    """Export a complete collection, omitting unused allocation/editor tails."""
    sections = export_action_sections(document, names)
    ordered = sorted(sections, key=lambda name: int(Path(name).stem))
    return ("# Clickable zone IDs; drawable image IDs are a separate namespace.\n"
            + "\n".join(sections[name] for name in ordered))


def parse_hitmap(text, source="hit-map"):
    width = height = None
    legend = {".": 0, **{symbol: int(symbol, 36) for symbol in SYMBOLS}}
    declared = set()
    rows = []
    reading_rows = False
    for lineno, line in enumerate(text.splitlines(), 1):
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        where = f"{source}:{lineno}"
        if reading_rows:
            if len(line) != width or any(symbol not in legend for symbol in line):
                raise ValueError(f"{where}: expected exactly {width} grid symbols (., 1..9, A..Z)")
            rows.append([legend[symbol] for symbol in line])
        elif line.startswith("size "):
            if width is not None or not re.fullmatch(r"size [0-9]+ [0-9]+", line):
                raise ValueError(f"{where}: expected one size WIDTH HEIGHT line")
            _, w, h = line.split()
            width, height = _u8(int(w), "width"), _u8(int(h), "height")
            if not width or not height:
                raise ValueError(f"{where}: hit-map dimensions must be nonzero")
            if 2 + width * height > HITMAP_CAPACITY:
                raise ValueError(f"{where}: decoded hit-map exceeds its {HITMAP_CAPACITY}-byte runtime buffer")
        elif line.startswith("legend "):
            for token in line[7:].split():
                match = re.fullmatch(r"([1-9A-Z])=([0-9]+)", token)
                if not match:
                    raise ValueError(f"{where}: expected legend A=101 entries")
                symbol, value = match.groups()
                if symbol in declared:
                    raise ValueError(f"{where}: duplicate legend symbol {symbol}")
                legend[symbol] = _u8(int(value), "legend object ID")
                declared.add(symbol)
        elif line == "grid":
            if width is None:
                raise ValueError(f"{where}: size must precede grid")
            reading_rows = True
        else:
            raise ValueError(f"{where}: expected size, legend or grid")
    if width is None or not reading_rows or len(rows) != height:
        raise ValueError(f"{source}: grid row count does not match height")
    return {"width": width, "height": height, "object_ids": rows, "legend": legend}


def _fe_rle(data):
    result = bytearray()
    i = 0
    while i < len(data):
        end = i + 1
        while end < len(data) and data[end] == data[i] and end - i < 255:
            end += 1
        count = end - i
        result.extend((254, count, data[i]) if count >= 3 or data[i] == 254 else data[i:end])
        i = end
    return bytes(result)


def read_hitmap(path):
    return parse_hitmap(Path(path).read_text(encoding="utf-8"), str(path))


def hitmap_body(document):
    width, height = _u8(document["width"], "width"), _u8(document["height"], "height")
    if not width or not height or 2 + width * height > HITMAP_CAPACITY:
        raise ValueError(f"Decoded hit-map must fit its {HITMAP_CAPACITY}-byte runtime buffer")
    rows = document["object_ids"]
    if len(rows) != height or any(len(row) != width for row in rows):
        raise ValueError("Hit-map rows must match their declared dimensions")
    data = bytes([width, height]) + bytes(_u8(v, "hit-map zone ID") for row in rows for v in row)
    return _fe_rle(data)


def encode_hitmap(path):
    return hitmap_body(read_hitmap(path))


def export_hitmap(document, context=""):
    values = set(v for row in document["object_ids"] for v in row)
    symbols = {0: "."}
    symbols.update({v: SYMBOLS[v - 1] for v in values if 0 < v < 36})
    available = iter(symbol for symbol in "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789" if symbol not in symbols.values())
    for value in sorted(values - symbols.keys()):
        symbol = next(available, None)
        if symbol is None:
            raise ValueError("Hit-map has more than 35 distinct nonzero object IDs; split or use a different authoring representation")
        symbols[value] = symbol
    lines = ["# " + context] if context else []
    lines.append(f"size {document['width']} {document['height']}")
    overrides = [f"{symbol}={value}" for value, symbol in sorted(symbols.items()) if value and int(symbol, 36) != value]
    if overrides:
        lines.append("legend " + " ".join(overrides))
    lines.append("grid")
    lines.extend("".join(symbols[v] for v in row) for row in document["object_ids"])
    return "\n".join(lines) + "\n"
