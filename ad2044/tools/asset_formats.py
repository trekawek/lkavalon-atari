"""Encode AD2044's editable disk records without an original disk image.

JSON contains object-ID grids, object/action records, text pages and typed
saved-state fields. Length prefixes are calculated. Unknown editor fragments
are short, annotated typed segments rather than an undifferentiated disk dump.
"""

from __future__ import annotations


FORMATS = {
    "ad2044.hit-map", "ad2044.object-actions", "ad2044.text-pages",
    "ad2044.editor-records", "ad2044.state", "ad2044.residue",
    "ad2044.reference",
}


def number(value, bits=8):
    if type(value) is not int or not 0 <= value < 1 << bits:
        raise ValueError(f"Expected an unsigned {bits}-bit integer, got {value!r}")
    return value


def cell(value):
    return number(value, 16).to_bytes(2, "little")


def glyphs(value):
    """Encode literal game-font slots; inverse runs retain their high bits."""
    if isinstance(value, str):
        if any(not 32 <= ord(c) < 127 for c in value):
            raise ValueError("Text must use printable ASCII game-font slots")
        return value.encode("ascii")
    if not isinstance(value, list):
        raise ValueError("Expected text or a list of text/glyph/inverse runs")
    result = bytearray()
    for run in value:
        if isinstance(run, str):
            result.extend(glyphs(run))
        elif isinstance(run, dict) and set(run) == {"inverse"}:
            result.extend(b | 128 for b in glyphs(run["inverse"]))
        elif isinstance(run, dict) and set(run) == {"glyph"}:
            result.append(number(run["glyph"]))
        else:
            raise ValueError(f"Unknown text run {run!r}")
    return bytes(result)


def message(lines):
    result = bytearray([number(len(lines))])
    for line in lines:
        text = glyphs(line)
        result.append(number(len(text)))
        result.extend(text)
    return bytes(result)


def counted16(body):
    return cell(len(body)) + body


def fe_rle(data):
    """The original editor's deterministic FE,count,value run compression."""
    result = bytearray()
    position = 0
    while position < len(data):
        end = position + 1
        while end < len(data) and data[end] == data[position] and end-position < 255:
            end += 1
        count = end-position
        if count >= 3 or data[position] == 254:
            result.extend((254, count, data[position]))
        else:
            result.extend(data[position:end])
        position = end
    return bytes(result)


def segments(items):
    """Encode explicitly typed fields; names/notes are descriptive metadata."""
    return b"".join(segment(item) for item in items)


def segment(item):
    kind = item["type"]
    if kind == "u8":
        return bytes([number(item["value"])])
    if kind in ("u16", "forth-call"):
        return cell(item["value"])
    if kind == "u8-array":
        return bytes(number(v) for v in item["values"])
    if kind == "u16-array":
        return b"".join(cell(v) for v in item["values"])
    if kind == "fill":
        count = item["count"]
        if type(count) is not int or count < 0 or count > 65536:
            raise ValueError("Invalid fill count")
        return bytes([number(item["value"])]) * count
    if kind == "text":
        return glyphs(item["text"])
    if kind == "counted-text":
        text = glyphs(item["text"])
        return bytes([number(len(text))]) + text
    if kind == "message":
        return message(item["lines"])
    if kind == "record16":
        return counted16(segments(item["fields"]))
    if kind == "forth-header":
        name = item["name"]
        if not isinstance(name, str) or not name or not name.isascii():
            raise ValueError("A saved Forth name must be nonempty ASCII")
        flags = number(item["flags"])
        if flags & 31 != len(name):
            raise ValueError("Saved Forth name length does not match its flags")
        encoded = bytearray(name.encode("ascii"))
        encoded[-1] |= 128
        return bytes([flags]) + encoded + cell(item["link"]) + cell(item["code"])
    if kind == "inventory-slots":
        return bytes(number(slot[key]) for slot in item["slots"]
                     for key in ("object_id", "x_byte", "y"))
    if kind == "map-descriptors":
        result = bytearray()
        for entry in item["rooms"]:
            position = number(entry["position"])
            facing = number(entry["facing"], 3)
            visited = entry["visited"]
            if type(visited) is not bool:
                raise ValueError("The visited field must be Boolean")
            upper = number(entry["upper_bits"], 4)
            result.extend((position, facing | (8 if visited else 0) | upper << 4))
        return bytes(result)
    if kind == "exit-masks":
        result = bytearray()
        for entry in item["rooms"]:
            directions = entry["open_directions"]
            if len(set(directions)) != len(directions):
                raise ValueError("Duplicate exit direction")
            low = sum(1 << number(d, 2) for d in directions)
            result.append(low | number(entry["upper_bits"], 4) << 4)
        return bytes(result)
    raise ValueError(f"Unknown AD2044 field type {kind!r}")


def dependencies(document):
    """These records are self-contained; no hidden binary/reference reads."""
    return []


def encode(document, read):
    """Return the exact native record bytes expected by the disk manifest."""
    if document.get("version") != 1 or document.get("format") not in FORMATS:
        raise ValueError("Unknown AD2044 structured asset format/version")
    kind = document["format"]
    if kind == "ad2044.hit-map":
        width, height = number(document["width"]), number(document["height"])
        rows = document["object_ids"]
        if not width or not height or len(rows) != height or any(len(r) != width for r in rows):
            raise ValueError("Hit-map dimensions do not match its object-ID rows")
        body = bytes([width, height]) + bytes(number(v) for row in rows for v in row)
        return counted16(fe_rle(body))
    if kind == "ad2044.object-actions":
        body = bytearray()
        for obj in document["objects"]:
            actions = bytearray()
            for action in obj["actions"]:
                payload = bytes([number(action["opcode"])]) + segments(action["fields"])
                actions.extend(counted16(payload))
            actions.extend(bytes(2 * number(obj.get("terminator_cells", 1), 16)))
            actions.extend(segments(obj.get("unused", [])))
            body.extend(counted16(actions))
        body.extend(bytes(2 * number(document.get("terminator_cells", 0), 16)))
        body.extend(segments(document.get("unused", [])))
        return counted16(body)
    if kind == "ad2044.reference":
        return counted16(bytes([number(document["resource_id"])]))
    body = segments(document["fields"])
    return counted16(body) if document.get("counted16", False) else body
