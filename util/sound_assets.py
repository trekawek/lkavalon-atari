"""Encode AD2044's custom 6502/command-stream sound bank from named fields.

This is not a CMC module. Its native routines, voice state, envelopes and music
bytecode have distinct representations; retained editor/demo fragments are
identified separately. No reference ATR or binary sound bank is read.
"""

from __future__ import annotations

from asm6502 import assemble


VOICE_FIELDS = (
    ("finished", 1), ("release_ticks", 1), ("gate_threshold", 1),
    ("audc_distortion_mask", 1), ("complex_envelope", 1),
    ("fade_initial_volume", 1), ("fade_period", 1), ("fade_countdown", 1),
    ("pitch_slide_step", 1), ("pitch_slide_end", 1),
    ("pending_pitch_slide_step", 1), ("volume_bias", 1), ("fade_volume", 1),
    ("base_frequency", 1), ("mute_or_redirect_audio", 1),
    ("control_pointer", 2), ("pitch_pointer", 2), ("sustain_index", 1),
    ("release_index", 1), ("envelope_position", 1), ("elapsed_ticks", 1),
    ("duration_ticks", 1), ("phase_handler_index", 1), ("post_effect_mode", 1),
    ("initialized_audf_offset", 1), ("initialized_audc_offset", 1),
    ("unknown_28", 1), ("unknown_29", 1), ("unknown_30", 1), ("unknown_31", 1),
)

VM_FIELDS = {
    "jump": (0x10, (("target", 2),)),
    "call": (0x11, (("target", 2),)),
    "fade": (0x12, (("initial_volume", 1), ("period", 1))),
    "pitch-slide": (0x13, (("step", 1), ("end_frequency", 1))),
    "store": (0x18, (("address", 2), ("value", 1))),
    "jump-if-register": (0x20, (("register", 1), ("equals", 1), ("target", 2))),
    "call-if-register": (0x21, (("register", 1), ("equals", 1), ("target", 2))),
    "envelope": (0x28, (("control_pointer", 2), ("pitch_pointer", 2),
                        ("sustain_index", 1), ("release_index", 1),
                        ("release_ticks", 1), ("gate_threshold", 1))),
    "durations": (0x29, tuple((f"duration_{i}", 1) for i in range(8))),
    "simple-envelope": (0x30, (("control_pointer", 2), ("pitch_pointer", 2),
                               ("start_index", 1))),
    "return-or-end": (0x38, ()),
}


def integer(value, bits=8, signed=False):
    low, high = (-(1 << (bits-1)), 1 << (bits-1)) if signed else (0, 1 << bits)
    if type(value) is not int or not low <= value < high:
        raise ValueError(f"Invalid {'signed ' if signed else ''}{bits}-bit value {value!r}")
    return value


def scalar(value, size=1):
    return integer(value, size * 8).to_bytes(size, "little")


def fields(record, specification):
    return b"".join(scalar(record[name], size) for name, size in specification)


def vm_instruction(record):
    channel = integer(record.get("channel", 0), 2)
    op = record["op"]
    if op in ("note", "rest"):
        code = integer(record["duration_index"], 3) + (8 if op == "rest" else 0)
        operands = scalar(record["frequency_divider"]) if op == "note" else b""
    else:
        code, specification = VM_FIELDS[op]
        if op == "pitch-slide":
            operands = bytes([integer(record["step"], 8, signed=True) & 255]) + scalar(record["end_frequency"])
        else:
            operands = fields(record, specification)
    return bytes([code | channel << 6]) + operands


def section_bytes(section):
    kind = section["type"]
    if kind == "assembly":
        return assemble(section["instructions"], section["address"])
    if kind == "fields":
        return b"".join(scalar(f["value"], f.get("bytes", 1)) for f in section["fields"])
    if kind == "byte-table":
        return bytes(integer(value) for value in section["values"])
    if kind == "fill":
        count = integer(section["count"], 16)
        return scalar(section["value"]) * count
    if kind == "vm-handlers":
        records = section["entries"]
        if len(records) != 57:
            raise ValueError("The VM dispatch table must contain 57 entries")
        if any(r["opcode"] != i for i, r in enumerate(records)):
            raise ValueError("VM handler opcode indices must remain in table order")
        targets = [integer(r["target"], 16) for r in records]
        return (bytes(integer(r["flags"]) for r in records)
                + bytes(v & 255 for v in targets) + bytes(v >> 8 for v in targets))
    if kind == "voice-states":
        if len(section["voices"]) != 4:
            raise ValueError("The player requires four 32-byte voice records")
        if any(v["channel"] != i for i, v in enumerate(section["voices"])):
            raise ValueError("Voice channel indices must remain in table order")
        return b"".join(fields(v, VOICE_FIELDS) for v in section["voices"])
    if kind == "voice-handlers":
        targets = [integer(v, 16) for v in section["targets"]]
        if len(targets) != 8:
            raise ValueError("The voice phase table must contain eight entries")
        return bytes(v & 255 for v in targets) + bytes(v >> 8 for v in targets)
    if kind == "pitch-envelope":
        return bytes(integer(v, 8, signed=True) & 255 for v in section["steps"])
    if kind == "control-envelope":
        result = bytearray()
        for step in section["steps"]:
            if type(step["loop"]) is not bool or type(step["flag6"]) is not bool:
                raise ValueError("Envelope flags must be Boolean")
            result.append(integer(step["volume"], 6) | (128 if step["loop"] else 0)
                          | (64 if step["flag6"] else 0))
        return bytes(result)
    if kind == "stream":
        result = bytearray()
        for record in section["instructions"]:
            if record["at"] != section["address"] + len(result):
                raise ValueError("VM instruction address differs from its encoded position")
            result.extend(vm_instruction(record))
        return bytes(result)
    if kind == "retained-os-vectors":
        return b"".join(fields(v, (("low_address", 2), ("high_address", 2),
                                   ("value", 2))) for v in section["vectors"])
    raise ValueError(f"Unknown sound section type {kind!r}")


def dependencies(document):
    return []


def encode(document, read):
    if document.get("format") != "sound.ad2044-bank" or document.get("version") != 1:
        raise ValueError("Unsupported sound resource format/version")
    origin = integer(document["origin"], 16)
    output = bytearray()
    for section in document["sections"]:
        address = integer(section["address"], 16)
        if address != origin + len(output):
            raise ValueError(f"Sound section {section['name']} is not contiguous at ${address:04X}")
        data = section_bytes(section)
        expected_end = integer(section["end_address"], 16)
        if address + len(data) != expected_end:
            raise ValueError(f"Sound section {section['name']} has changed size; expected end ${expected_end:04X}")
        output.extend(data)
    if len(output) != integer(document["size"], 16):
        raise ValueError("Sound bank size differs from its fixed target allocation")
    return bytes(output)
