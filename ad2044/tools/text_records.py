"""Bounded decoders for text records used by the three saved game dictionaries.

Profiles identify records from their actual consumers, rather than searching
arbitrary code, graphics, or uninitialised buffers for printable byte runs.
The original BYTES emission remains authoritative; these are annotations.
"""

import json
from pathlib import Path

PROFILES = {
    "ad2044": {
        "does": 0x39C1,
        "inline_game_font": (0x7828,),
        "messages": (
            0x7BBB,
            0x7DF0,
            0x7EA8,
            0x8037,
            0x86D7,
            0x8836,
            0x8967,
            0x8A0A,
            0x8D37,
        ),
        "vectors": {
            0x6D0A: ("messages", 4, "Hunger messages"),
            0x6FC7: ("strings", 4, "Direction labels"),
            0x72E2: ("actions", 76, "Action labels"),
        },
    },
    "klatwa": {
        "does": 0x3F47,
        "messages": (
            0x61EB,
            0x67EA,
            0x6916,
            0x6A0D,
            0x7619,
            0x7845,
            0x7B66,
            0x7BC2,
            0x7BDF,
            0x7D3A,
            0x7F38,
            0x7F4E,
            0x80B7,
            0x8363,
        ),
        "transforms": {0x7845: (0x26, 25)},
        "placeholders": {(0x61A0, 1): b"\x01"},
        "vectors": {
            0x45F5: ("messages", 4, "Disk and tape messages"),
            0x5577: ("slots", 10, "Spellbook display slots"),
            0x61A0: ("messages", 3, "Spell messages"),
            0x6369: ("actions", 54, "Action labels"),
        },
    },
    "wladcy-ciemnosci": {
        "does": 0x3F4E,
        "messages": (
            0x6844,
            0x697C,
            0x6A73,
            0x6DF4,
            0x722D,
            0x7511,
            0x7580,
            0x759D,
            0x7BA8,
        ),
        "transforms": {0x722D: (0x26, 25)},
        "placeholders": {(0x6142, 1): b"\x01"},
        "screens": (0x4644,),
        "vectors": {
            0x45D2: ("messages", 4, "Disk messages"),
            0x5517: ("slots", 8, "Power display slots"),
            0x6142: ("messages", 3, "Power messages"),
            0x62E7: ("actions", 80, "Action labels"),
        },
    },
}

# The dynamic indexers walk u16-length records from the data after the capacity
# cell. Menu consumers $74FA/$6593/$65ED resolve length-one action records once.
# Multiline renderers $5D75/$45A4/$45A1 use u8 line counts and u8 line lengths.
# Slot renderers $60B5/$603C skip three state bytes and display 13 glyphs.
# Encoded-message consumers $786B/$7253 add $26 to the first 25 characters.


def inline_encoding(game, runtime, address):
    overrides = PROFILES.get(game, {}).get("inline_game_font", ())
    return "game-font" if runtime != 0x1977 or address in overrides else "atascii"


def u16(data, address, end):
    if not 0 <= address <= end - 2 <= len(data) - 2:
        raise ValueError(f"Truncated length at ${address:04X}")
    return int.from_bytes(data[address : address + 2], "little")


def counted_lines(data, start, end):
    """Parse [line count:u8][length:u8, bytes]..., exhausting the payload."""
    if not 0 <= start < end <= len(data):
        raise ValueError(f"Missing line count at ${start:04X}")
    count = data[start]
    position = start + 1
    lines = []
    for index in range(count):
        if position >= end:
            raise ValueError(f"Missing line length at ${position:04X}")
        length = data[position]
        following = position + 1 + length
        if following > end:
            raise ValueError(f"Line exceeds message at ${position:04X}")
        lines.append(
            dict(
                index=index,
                length_address=position,
                address=position + 1,
                length=length,
                end=following,
            )
        )
        position = following
    if position != end:
        raise ValueError(f"Unconsumed message bytes at ${position:04X}")
    return lines


def vector_records(data, start, end, count):
    """Read the consumer's known number of u16-counted records within capacity."""
    if not 0 <= start <= end <= len(data) or count < 0:
        raise ValueError("Invalid vector bounds")
    records = []
    position = start
    for index in range(count):
        length = u16(data, position, end)
        following = position + 2 + length
        if not length or following > end:
            raise ValueError(f"Invalid vector record at ${position:04X}")
        records.append(
            dict(
                index=index,
                length_address=position,
                address=position + 2,
                length=length,
                end=following,
            )
        )
        position = following
    return records, position


def encoded_text(raw):
    """Reversible ASCII representation; every non-ASCII byte is escaped."""
    return "".join(chr(b) if 32 <= b < 127 and b != 92 else f"\\x{b:02X}" for b in raw)


def display_text(raw, encoding="game-font"):
    """Readable ASCII, retaining unsupported glyphs as explicit [XX] bytes."""
    if encoding == "atascii":
        return "".join(chr(b) if 32 <= b < 127 else f"[{b:02X}]" for b in raw)
    if encoding == "screen-codes":
        return "".join(f"[{b:02X}]" for b in raw)
    if encoding != "game-font":
        raise ValueError(f"Unknown encoding: {encoding}")
    # Lowercase slots hold uppercase Polish letters. ASCII cannot distinguish
    # their diacritics; z is used for both Z-acute and Z-dot. Bit 7 is inverse.
    polish = dict(zip(b"acelnosz", "ACELNOSZ"))
    result = []
    for byte in raw:
        code = byte & 0x7F
        if code == ord("="):
            result.append(" ")
        elif code in polish:
            result.append(polish[code])
        # Many ASCII punctuation slots contain frame tiles in these fonts.
        # Keep only confirmed common punctuation; the other bytes stay visible.
        elif 65 <= code <= 90 or 48 <= code <= 57 or chr(code) in " .,?":
            result.append(chr(code))
        else:
            result.append(f"[{byte:02X}]")
    return "".join(result)


class Catalog:
    def __init__(self, game, data, words, decode):
        self.game = game
        self.data = data
        self.definitions = []
        self.by_word = {}
        profile = PROFILES[game]
        by_cfa = {word["cfa"]: word for word in words}
        expected = (
            set(profile["messages"])
            | set(profile["vectors"])
            | set(profile.get("screens", ()))
        )
        if not expected <= by_cfa.keys():
            missing = ", ".join(f"${a:04X}" for a in sorted(expected - by_cfa.keys()))
            raise ValueError("Missing profiled text definitions: " + missing)
        for word in words:
            cfa = word["cfa"]
            records = []
            description = None
            details = {}
            if cfa in profile["messages"]:
                if word["code"] != 0x1499:
                    raise ValueError(f"Expected message variable at ${cfa:04X}")
                size = u16(data, word["pfa"], word["end"])
                start = word["pfa"] + 2
                end = start + size
                if end > word["end"]:
                    raise ValueError(f"Message exceeds definition at ${cfa:04X}")
                records = [
                    self.string(line, f"line {line['index'] + 1}")
                    for line in counted_lines(data, start, end)
                ]
                if cfa in profile.get("transforms", {}):
                    add, count = profile["transforms"][cfa]
                    if len(records) != 1 or records[0]["length"] < count:
                        raise ValueError(f"Invalid encoded message at ${cfa:04X}")
                    record = records[0]
                    raw = bytes.fromhex(record["raw_hex"])
                    decoded = bytes((b + add) & 255 for b in raw[:count]) + raw[count:]
                    record.update(
                        transform=dict(add=add, count=count),
                        decoded_hex=decoded.hex().upper(),
                        encoded=encoded_text(decoded),
                        text=display_text(decoded),
                        inverse_positions=[i for i, b in enumerate(decoded) if b & 128],
                    )
                description = "Message lines"
                details = dict(
                    payload_start=start,
                    payload_end=end,
                    unused_tail_hex=bytes(data[end : word["end"]]).hex().upper(),
                )
            elif cfa in profile["vectors"]:
                kind, count, description = profile["vectors"][cfa]
                pfa = word["pfa"]
                if (
                    word["code"] != 0x18D8
                    or u16(data, pfa, word["end"]) != profile["does"]
                ):
                    raise ValueError(f"Unexpected vector DOES> at ${cfa:04X}")
                capacity = u16(data, pfa + 2, word["end"])
                start, end = pfa + 4, pfa + 4 + capacity
                if end > word["end"]:
                    raise ValueError(f"Vector exceeds definition at ${cfa:04X}")
                entries, live_end = vector_records(data, start, end, count)
                for entry in entries:
                    label = f"item {entry['index']}"
                    placeholder = profile.get("placeholders", {}).get(
                        (cfa, entry["index"])
                    )
                    if placeholder is not None:
                        raw = bytes(data[entry["address"] : entry["end"]])
                        if raw != placeholder:
                            raise ValueError(
                                f"Unexpected placeholder at ${entry['address']:04X}"
                            )
                        records.append(
                            dict(
                                entry,
                                kind="placeholder",
                                label=label,
                                raw_hex=raw.hex().upper(),
                                text="[incomplete message placeholder; retained raw]",
                            )
                        )
                    elif kind == "messages":
                        for line in counted_lines(data, entry["address"], entry["end"]):
                            records.append(
                                self.string(line, f"{label} line {line['index'] + 1}")
                            )
                    elif kind == "actions" and entry["length"] == 1:
                        target_index = data[entry["address"]]
                        alias = dict(
                            entry,
                            kind="alias",
                            label=label,
                            target_index=target_index,
                            raw_hex=f"{target_index:02X}",
                        )
                        if target_index >= count:
                            alias.update(
                                text="[reference outside this table; retained raw]",
                                resolved=False,
                            )
                        elif entries[target_index]["length"] == 1:
                            alias.update(
                                text="[target is another one-byte record; not followed recursively]",
                                resolved=False,
                                target_address=entries[target_index]["address"],
                            )
                        else:
                            target = entries[target_index]
                            alias.update(
                                target_address=target["address"],
                                resolved=True,
                                text=display_text(
                                    data[target["address"] : target["end"]]
                                ),
                            )
                        records.append(alias)
                    elif kind == "slots":
                        if entry["length"] != 16:
                            raise ValueError(
                                f"Invalid inventory slot at ${entry['address']:04X}"
                            )
                        display = dict(
                            entry,
                            address=entry["address"] + 3,
                            length=13,
                            state_hex=bytes(
                                data[entry["address"] : entry["address"] + 3]
                            )
                            .hex()
                            .upper(),
                        )
                        records.append(self.string(display, label + " display"))
                    elif kind in ("strings", "actions"):
                        records.append(self.string(entry, label))
                    else:
                        raise ValueError(f"Unknown vector kind: {kind}")
                if kind == "actions" and u16(data, live_end, end) != 0:
                    raise ValueError(
                        f"Missing action-vector terminator at ${live_end:04X}"
                    )
                details = dict(
                    capacity=capacity,
                    payload_start=start,
                    payload_end=live_end,
                    capacity_end=end,
                    unused_tail_hex=bytes(data[live_end : word["end"]]).hex().upper(),
                )
            elif cfa in profile.get("screens", ()):
                start = word["pfa"] + 2
                end = start + u16(data, word["pfa"], word["end"])
                if word["code"] != 0x1499 or end > word["end"]:
                    raise ValueError(f"Invalid screen pattern at ${cfa:04X}")
                records = [
                    self.string(
                        dict(
                            address=start,
                            end=end,
                            length=end - start,
                            length_address=word["pfa"],
                        ),
                        "background tiles",
                        "screen-codes",
                    )
                ]
                description = "Screen background glyphs, not prose"
            elif word["code"] == 0x1441:
                instructions, _ = decode(data, word["pfa"], word["end"], by_cfa)
                for instruction in instructions:
                    if "string" not in instruction:
                        continue
                    record = dict(
                        address=instruction["at"] + 3,
                        length_address=instruction["at"] + 2,
                        length=len(instruction["string"]),
                        end=instruction["end"],
                    )
                    encoding = inline_encoding(
                        game, instruction["cfa"], record["address"]
                    )
                    records.append(self.string(record, "inline", encoding))
                description = "Inline strings"
                # This counted banner survives after the overwritten ABORT
                # startup thread in all three images; it is not executed.
                if cfa == 0x1EC4:
                    address = 0x1ED1
                    size = data[address - 1]
                    if size != 20 or address + size > word["end"]:
                        raise ValueError("Unexpected retired startup banner")
                    records.append(
                        self.string(
                            dict(
                                address=address,
                                length=size,
                                end=address + size,
                                length_address=address - 1,
                            ),
                            "retired startup banner",
                            "atascii",
                        )
                    )
                    description = "Retired startup banner, not executed"
            if records:
                definition = dict(
                    cfa=cfa,
                    symbol=word["id"],
                    description=description,
                    records=records,
                    **details,
                )
                self.definitions.append(definition)
                self.by_word[cfa] = definition

    def string(self, record, label, encoding="game-font"):
        raw = bytes(self.data[record["address"] : record["end"]])
        return dict(
            record,
            kind="string",
            label=label,
            encoding=encoding,
            raw_hex=raw.hex().upper(),
            encoded=encoded_text(raw),
            text=display_text(raw, encoding),
            inverse_positions=(
                [i for i, b in enumerate(raw) if b & 128]
                if encoding == "game-font"
                else []
            ),
        )

    def annotate(self, out, word):
        out.text_game = self.game
        definition = self.by_word.get(word["cfa"])
        if not definition or definition["description"] == "Inline strings":
            return
        out.comment("Decoded text: " + definition["description"])
        for record in definition["records"]:
            prefix = f"{record['label']} ${record['address']:04X}"
            if record["kind"] == "alias":
                prefix += f" -> item {record['target_index']}"
            if "transform" in record:
                transform = record["transform"]
                out.comment(
                    f"Decoded by adding ${transform['add']:02X} to first {transform['count']} bytes"
                )
            out.comment(f"{prefix}: {record['text']}")

    def save(self, root):
        notes = [
            "Addresses are target RAM addresses in hexadecimal in strings.txt.",
            "Only identified record formats and counted inline strings are decoded.",
            "Game-font '=' is a space; Polish glyphs use ASCII transliteration.",
            "Unsupported/control glyphs are [XX]; raw_hex preserves exact bytes.",
            "Action aliases are zero-based indices, resolved exactly once.",
            "Incomplete records and out-of-table references are marked, not guessed.",
            "BYTES remains authoritative. Editing a comment or this catalog does not change the game.",
            "Binary disk assets, unused capacity, and retired scratch-buffer text are not catalogued.",
        ]
        report = dict(game=self.game, notes=notes, definitions=self.definitions)
        lines = [self.game + " - decoded dictionary strings", ""] + notes + [""]
        for definition in self.definitions:
            lines.append(
                f"${definition['cfa']:04X} {definition['symbol']} - {definition['description']}"
            )
            for record in definition["records"]:
                label = record["label"]
                if record["kind"] == "alias":
                    label += f" -> item {record['target_index']}"
                lines.append(
                    f"  ${record['address']:04X} {label}: {json.dumps(record['text'])}"
                )
            lines.append("")
        for name, content in (
            ("strings.json", json.dumps(report, indent=2) + "\n"),
            ("strings.txt", "\n".join(lines)),
        ):
            path = Path(root) / name
            raw = content.encode("ascii")
            if not path.exists() or path.read_bytes() != raw:
                path.write_bytes(raw)
