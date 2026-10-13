"""Encode the documented GAM resource structures shared by Klątwa and Władcy.

Lengths are derived from their contents. Text uses the game's byte-valued glyph
alphabet: '=' is its blank and lowercase glyph slots include Polish capitals.
\\xNN escapes preserve control/tile/inverse codes without guessing their glyphs.
Hit maps retain their original RLE token boundaries, but their grid is the sole
source of pixel/region values. Unknown allocation residue is explicitly bounded.
"""

import re


def _int(value, maximum, label):
    if isinstance(value, bool) or not isinstance(value, int) or not 0 <= value <= maximum:
        raise ValueError(f"{label}: expected integer 0..{maximum}")
    return value


def _byte(value):
    return bytes([_int(value, 255, "byte")])


def _word(value):
    return _int(value, 65535, "cell").to_bytes(2, "little")


def _bytes(values):
    return b"".join(_byte(value) for value in values)


def _counted(data):
    if not data:
        raise ValueError("An empty record is a terminator, not a GAM record")
    return _word(len(data)) + data


def _text(value):
    if not isinstance(value, str):
        raise ValueError("Glyph text must be a string")
    result = bytearray()
    i = 0
    while i < len(value):
        if value[i] == "\\":
            token = value[i : i + 4]
            if not re.fullmatch(r"\\x[0-9A-Fa-f]{2}", token):
                raise ValueError("Use exactly \\xNN for escaped glyph bytes")
            result.append(int(token[2:], 16))
            i += 4
        else:
            result.extend(_byte(ord(value[i])))
            i += 1
    return bytes(result)


def _residue(segments):
    out = bytearray()
    for segment in segments:
        if segment["offset"] != len(out):
            raise ValueError("Residue segments must be contiguous and ordered")
        if not segment.get("note"):
            raise ValueError("Unresolved residue requires a provenance note")
        if "fill" in segment:
            count = _int(segment["count"], 65535, "residue fill count")
            out.extend(_byte(segment["fill"]) * count)
        else:
            values = segment["unresolved_bytes"]
            if not 1 <= len(values) <= 16:
                raise ValueError("Unresolved byte segments are limited to 16 bytes")
            out.extend(_bytes(values))
    return bytes(out)


def _tail(node):
    return _residue(node.get("tail", []))


def _records(nodes, read):
    return b"".join(_counted(_node(node, read)) for node in nodes)


def _node(node, read):
    kind = node["kind"]
    if kind == "file":
        result = read(node["file"])
        if len(result) != node["size"]:
            raise ValueError(f"{node['file']}: expected {node['size']} encoded bytes")
        return result
    if kind == "records":
        if type(node.get("terminated", False)) is not bool:
            raise ValueError("Record terminator flag must be boolean")
        return _records(node["records"], read) + (b"\0\0" if node.get("terminated", False) else b"") + _tail(node)
    if kind == "sequence":
        return b"".join(_node(part, read) for part in node["parts"])
    if kind == "residue":
        return _residue(node["segments"])
    if kind == "fill":
        return _byte(node["value"]) * _int(node["count"], 65535, "fill count")
    if kind == "byte":
        return _byte(node["value"])
    if kind == "cell":
        return _word(node["value"])
    if kind == "signed-cell":
        value = node["value"]
        if type(value) is not int or not -32768 <= value <= 32767:
            raise ValueError("Signed cell must fit -32768..32767")
        return _word(value & 65535)
    if kind == "bytes":
        return _bytes(node["values"])
    if kind == "cells":
        return b"".join(_word(value) for value in node["values"])
    if kind == "text":
        return _text(node["text"])
    if kind == "counted-text":
        text = _text(node["text"])
        return _byte(len(text)) + text
    if kind == "title-page":
        lines = [_text(line) for line in node["lines"]]
        return _counted(_byte(len(lines))) + b"".join(_counted(line) for line in lines) + _tail(node)
    if kind == "message":
        lines = [_text(line) for line in node["lines"]]
        return _byte(len(lines)) + b"".join(_byte(len(line)) + line for line in lines)
    if kind == "action":
        return _byte(node["dispatch_id"]) + b"".join(_node(arg, read) for arg in node["arguments"])
    if kind == "room-layers":
        values = []
        for layer in node["layers"]:
            resource = _int(layer["resource"], 99, "layer resource")
            subrecord = _int(layer["subrecord"], 4, "image subrecord")
            if subrecord not in (0, 2, 4):
                raise ValueError("Room image subrecord must be 0, 2 or 4")
            values.append(resource + 100 * (subrecord // 2))
        return _bytes(values)
    if kind == "object-selectors":
        out = bytearray()
        for entry in node["objects"]:
            out.extend(_byte(200 + _int(entry["object_id"], 55, "object ID")))
            out.extend(_byte(entry["action_collection"]))
            out.extend(b"".join(_node(arg, read) for arg in entry["arguments"]))
        return bytes(out)
    if kind == "positions":
        return b"".join(_byte(p["x"]) + _byte(p["y"]) for p in node["positions"])
    if kind == "slot":
        if len(_text(node["display"])) != 13:
            raise ValueError("Power/spell display slots require exactly 13 glyph bytes")
        return _bytes([node["power_id"], node["requirement_1"], node["requirement_2"]]) + _text(node["display"])
    if kind == "view-objects":
        return _byte(node["control"]) + _bytes(node["objects"])
    if kind == "dictionary-header":
        name = _bytes(node["stored_name_bytes"])
        flags = _int(node["flags"], 255, "header flags")
        if len(name) != flags & 31 or not name or name[-1] < 128:
            raise ValueError("Saved dictionary header name/flags mismatch")
        return _byte(flags) + name + _word(node["link_nfa"]) + _word(node["runtime"])
    if kind == "sprite-frame":
        pixels = read(node["pixels"])
        width = _int(node["width_bytes"], 255, "sprite width")
        height = _int(node["height"], 255, "sprite height")
        if len(pixels) != width * height:
            raise ValueError("Sprite pixel byte length differs from width times height")
        return _bytes([node["x_offset"], node["y_offset"], width, height]) + pixels + _tail(node)
    if kind == "hit-map":
        width, height = node["width"], node["height"]
        _int(width, 255, "hit map width")
        _int(height, 255, "hit map height")
        rows = node["rows"]
        columns = node["encoding_columns"]
        if not width or not height or len(rows) != height or any(len(row) != width for row in rows) or len(columns) != width:
            raise ValueError("Hit map grid and encoding columns must match dimensions")
        for row in rows:
            _bytes(row)
        out = bytearray(_bytes([width, height]))
        for x, tokens in enumerate(columns):
            y = 0
            for token in tokens:
                if "literals" in token:
                    count = _int(token["literals"], 255, "literal count")
                    if not count or y + count > height:
                        raise ValueError("Hit map literals cross column")
                    values = [rows[n][x] for n in range(y, y + count)]
                    if 0x8D in values:
                        raise ValueError("Literal $8D needs an RLE escape token")
                    out.extend(_bytes(values))
                else:
                    size = _int(token["pattern_size"], 4, "RLE pattern size")
                    repeat = _int(token["repeat"], 256, "RLE repeat")
                    if size not in (1, 2, 3, 4) or repeat not in (*range(1, 64), 256):
                        raise ValueError("Invalid native RLE pattern/repeat")
                    count = size * repeat
                    if y + count > height:
                        raise ValueError("Hit map repeat crosses column")
                    pattern = [rows[n][x] for n in range(y, y + size)]
                    values = [rows[n][x] for n in range(y, y + count)]
                    if pattern * repeat != values:
                        raise ValueError("Edited hit map no longer matches its encoding plan; adjust the column tokens")
                    out.extend(bytes([0x8D, (size - 1) * 64 + (repeat & 63)]))
                    out.extend(_bytes(pattern))
                y += count
            if y != height:
                raise ValueError("Hit map encoding does not exhaust column")
        return bytes(out) + _tail(node)
    if kind == "vtoc":
        bitmap = bytearray(node["bitmap_bytes"])
        previous = -1
        for start, end in node["free_sector_ranges"]:
            if not 0 <= start <= end < len(bitmap) * 8 or start <= previous:
                raise ValueError("VTOC ranges must be sorted, disjoint and in bounds")
            for sector in range(start, end + 1):
                bitmap[sector // 8] |= 128 >> (sector % 8)
            previous = end
        return _byte(node["dos_code"]) + _word(node["declared_total_sectors"]) + _word(node["declared_free_sectors"]) + _bytes(node["reserved_header"]) + bitmap + _tail(node)
    raise ValueError(f"Unsupported GAM node kind: {kind}")


def encode(document, read):
    """Encode one version-1 GAM document; read resolves game-relative files."""
    formats = {"record-list", "action-collections", "room", "rooms", "player-bank", "reserved", "title-pages", "message-banks", "placeholder", "hit-map", "residue", "vtoc", "saved-state"}
    if type(document.get("version")) is not int or document["version"] != 1 or document.get("format") not in {"gam." + name for name in formats}:
        raise ValueError("Expected version 1 gam.* structured asset")
    return _node(document["data"], read)


def dependencies(document):
    """Return all external native image or structured-document input paths."""
    result = set()
    def visit(node):
        if isinstance(node, dict):
            if node.get("kind") == "file":
                result.add(node["file"])
            if node.get("kind") == "sprite-frame":
                result.add(node["pixels"])
            for value in node.values():
                visit(value)
        elif isinstance(node, list):
            for value in node:
                visit(value)
    visit(document.get("data"))
    return sorted(result)
