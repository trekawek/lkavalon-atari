#!/usr/bin/env python3
"""Decode Klątwa's GAM resource containers and column-packed graphics."""

from pathlib import Path
import hashlib
import sys

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "util"))
import graphics_common as common


def gam_groups(atr):
    """Read GAM's sector-count directory; physical sector 500 is reserved."""
    if len(atr) != 16 + 1040 * 128 or atr[:2] != b"\x96\x02":
        raise ValueError("Expected a 1040-sector single-density ATR")
    directory_sector = 500
    directory_offset = 16 + (directory_sector - 1) * 128
    directory = atr[directory_offset : directory_offset + 128]
    logical_sector = 1
    groups = {}
    for index, count in enumerate(directory[1:], 1):
        if count == 0:
            continue
        sectors = [
            number + (number >= directory_sector)
            for number in range(logical_sector, logical_sector + count)
        ]
        logical_sector += count
        if sectors[-1] > 1040:
            raise ValueError("GAM group exceeds disk")
        data = bytearray()
        spans = []
        for sector in sectors:
            file_offset = 16 + (sector - 1) * 128
            if spans and spans[-1]["file_offset"] + spans[-1]["length"] == file_offset:
                spans[-1]["length"] += 128
            else:
                spans.append(
                    dict(offset=len(data), file_offset=file_offset, length=128)
                )
            data.extend(atr[file_offset : file_offset + 128])
        groups[index] = dict(data=bytes(data), sectors=sectors, spans=spans)
    return groups


def record_spans(group, offset, length):
    """Map a logical group slice back to its physical ATR byte intervals."""
    if offset < 0 or length < 0 or offset + length > len(group["data"]):
        raise ValueError("Invalid GAM source slice")
    result = []
    for span in group["spans"]:
        first = max(offset, span["offset"])
        end = min(offset + length, span["offset"] + span["length"])
        if end > first:
            result.append(
                dict(
                    file_offset=span["file_offset"] + first - span["offset"],
                    length=end - first,
                )
            )
    if sum(span["length"] for span in result) != length:
        raise ValueError("Incomplete GAM source mapping")
    return result


def read_records(data, start=0, end=None):
    """Read u16-length GAM records, stopping before a zero-length sentinel."""
    end = len(data) if end is None else end
    if not 0 <= start <= end <= len(data):
        raise ValueError("Invalid GAM record bounds")
    position = start
    result = []
    while position + 2 <= end:
        length = int.from_bytes(data[position : position + 2], "little")
        if length == 0:
            break
        following = position + 2 + length
        if following > end:
            raise ValueError(f"GAM record at ${position:X} exceeds its container")
        result.append(
            dict(
                index=len(result),
                offset=position,
                length=length,
                data=bytes(data[position + 2 : following]),
            )
        )
        position = following
    return result, position


def decode_rle(data, width_bytes, height):
    """Decode native $3BC3: column order, $8D escape, repeated 1-4-byte runs.

    The control byte's low six bits are a repeat count; zero means 256
    because the original 6502 loop decrements an initially zero byte.
    Its high two bits select the repeated group's length minus one.
    """
    if not 1 <= width_bytes <= 255 or not 1 <= height <= 255:
        raise ValueError("Invalid packed-image dimensions")
    output = bytearray(width_bytes * height)
    position = 0
    for column in range(width_bytes):
        row = 0
        while row < height:
            if position >= len(data):
                raise ValueError("Truncated packed image")
            value = data[position]
            position += 1
            if value != 0x8D:
                run = bytes([value])
            else:
                if position >= len(data):
                    raise ValueError("Truncated RLE control")
                control = data[position]
                position += 1
                size = (control >> 6) + 1
                count = (control & 63) or 256
                if position + size > len(data):
                    raise ValueError("Truncated RLE pattern")
                run = bytes(data[position : position + size]) * count
                position += size
            if row + len(run) > height:
                raise ValueError("RLE run crosses an image column")
            for value in run:
                output[row * width_bytes + column] = value
                row += 1
    return bytes(output), position


def decode_picture(data):
    """Decode a record payload with x, y, width-in-bytes, height header."""
    if len(data) < 4:
        raise ValueError("Truncated picture header")
    x, y, width, height = data[:4]
    packed, consumed = decode_rle(data[4:], width, height)
    return dict(
        x=x, y=y, width_bytes=width, height=height, packed=packed, consumed=consumed + 4
    )


def take_records(data, count):
    """Read a known number of records without interpreting allocation residue."""
    records = []
    position = 0
    for index in range(count):
        if position + 2 > len(data):
            raise ValueError("Missing counted resource")
        length = int.from_bytes(data[position : position + 2], "little")
        end = position + 2 + length
        if not length or end > len(data):
            raise ValueError("Invalid counted resource")
        records.append(
            dict(
                index=index,
                offset=position,
                length=length,
                data=bytes(data[position + 2 : end]),
            )
        )
        position = end
    return records, position


def picture_png(picture, palette=common.GRAYSCALE):
    width = picture["width_bytes"] * 4
    height = picture["height"]
    pixels = common.unpack_2bpp(picture["packed"], width, height)
    width, height, pixels = common.scale_indexed(pixels, width, height)
    return common.encode_png(width, height, pixels, palette)


def blit(canvas, picture, stride=40, height=112):
    """Copy an opaque image into a visible bitmap, clipping its bottom edge."""
    if len(canvas) != stride * height:
        raise ValueError("Invalid composition buffer")
    x, y, width = picture["x"], picture["y"], picture["width_bytes"]
    if x + width > stride:
        raise ValueError("Picture exceeds composition width")
    for row in range(picture["height"]):
        if y + row >= height:
            break
        source = row * width
        target = (y + row) * stride + x
        canvas[target : target + width] = picture["packed"][source : source + width]


def extract(atr):
    """Return decoded assets and provenance for the verified Klątwa v1 disk."""
    if (
        hashlib.sha256(atr).hexdigest()
        != "d28d336e4be5cd48d9bf03fac7d487e7a0cb69cc744e282cfe1eba1a0b6d7a95"
    ):
        raise ValueError("Graphics extraction requires the verified Klatwa v1 disk")
    groups = gam_groups(atr)
    files = {}
    metadata = {
        "game": "klatwa",
        "source": "reference/klatwa-v1.atr",
        "source_sha256": hashlib.sha256(atr).hexdigest(),
        "directory": {"sector": 500, "disk_id": 3, "sector_bytes": 128},
        "format": "GAM u16-counted resources; $8D column-order run-length compression",
        "preview": "2bpp images expanded horizontally by two; emulator PAL RGB palette",
        "notes": [
            "Room previews combine disk room lists and original saved default object-state lists.",
            "Player animation, generated screen borders, text windows and later gameplay changes are omitted from rooms.",
            "Individual picture previews are grayscale because their colors depend on the room.",
            "Title previews use the original DLI colors; room previews use each room's stored COLPF0/1/2 colors with COLBK=0.",
            "Raw picture bytes are decoded row-major 2bpp; resource .bin files preserve original packed payloads.",
            "Font previews show stored one-bit glyph patterns; actual ANTIC text display can use these as multicolor glyphs.",
            "The font records have 1023 bytes. The missing final glyph byte is blank only in previews.",
            "Interaction masks are byte-valued hit-test maps, not visible image layers.",
        ],
        "groups": [],
        "pictures": [],
        "fonts": [],
        "sprites": [],
        "masks": [],
        "rooms": [],
        "title": {},
    }
    records = {}
    for group_id in (3, 4, 5, 6, 7):
        group = groups[group_id]
        entries, used = read_records(group["data"])
        records[group_id] = entries
        group_file = f"groups/group-{group_id:02d}.bin"
        files[group_file] = group["data"]
        meta = dict(
            index=group_id,
            file=group_file,
            sectors=group["sectors"],
            spans=group["spans"],
            records_end=used,
            records=[],
        )
        for record in entries:
            name = f"records/g{group_id:02d}-r{record['index']:03d}.bin"
            files[name] = record["data"]
            meta["records"].append(
                dict(
                    index=record["index"],
                    file=name,
                    group_offset=record["offset"],
                    length=record["length"],
                    atr_spans=record_spans(
                        group, record["offset"] + 2, record["length"]
                    ),
                )
            )
        metadata["groups"].append(meta)

    pictures = {}

    def add_picture(group_id, record, subindex, data, offset, category, packed=False):
        if packed:
            if len(data) < 4:
                raise ValueError("Truncated sprite")
            x, y, width, height = data[:4]
            end = 4 + width * height
            if end > len(data):
                raise ValueError("Truncated sprite pixels")
            picture = dict(
                x=x,
                y=y,
                width_bytes=width,
                height=height,
                packed=bytes(data[4:end]),
                consumed=end,
            )
        else:
            picture = decode_picture(data)
        name = f"pictures/g{group_id:02d}-r{record:03d}-p{subindex:02d}"
        files[name + ".bin"] = picture["packed"]
        palette = (
            common.atari_colors((0, 0xE4, 0x18, 0x1C))
            if category == "title"
            else common.GRAYSCALE
        )
        files[name + ".png"] = picture_png(picture, palette)
        info = {key: value for key, value in picture.items() if key != "packed"}
        info.update(
            group=group_id,
            record=record,
            subrecord=subindex,
            category=category,
            raw=name + ".bin",
            preview=name + ".png",
            encoding="uncompressed row-major 2bpp" if packed else "8D column RLE",
            source_spans=record_spans(groups[group_id], offset, len(data)),
            unused_tail_hex=data[picture["consumed"] :].hex().upper(),
        )
        metadata["pictures"].append(info)
        pictures[(group_id, record, subindex)] = picture
        return picture

    def add_mask(group_id, record, subindex, data, offset):
        if len(data) < 2:
            raise ValueError("Truncated interaction mask")
        width, height = data[:2]
        pixels, used = decode_rle(data[2:], width, height)
        name = f"masks/g{group_id:02d}-r{record:03d}-m{subindex:02d}.bin"
        files[name] = pixels
        metadata["masks"].append(
            dict(
                group=group_id,
                record=record,
                subrecord=subindex,
                width=width,
                height=height,
                raw=name,
                source_spans=record_spans(groups[group_id], offset, len(data)),
                unused_tail_hex=data[used + 2 :].hex().upper(),
            )
        )

    for group_id, first, last in ((3, 2, 6), (4, 3, 53), (6, 3, 45)):
        for record in records[group_id][first : last + 1]:
            if record["length"] == 1:
                continue
            children, _ = read_records(record["data"])
            for child in children:
                offset = record["offset"] + 2 + child["offset"] + 2
                if group_id == 3 or child["index"] % 2 == 0:
                    add_picture(
                        group_id,
                        record["index"],
                        child["index"],
                        child["data"],
                        offset,
                        "title" if group_id == 3 else "scene-layer",
                    )
                else:
                    add_mask(
                        group_id, record["index"], child["index"], child["data"], offset
                    )

    for group_id in (4, 6):
        cursor = records[group_id][2]
        add_picture(group_id, 2, 0, cursor["data"], cursor["offset"] + 2, "cursor")
    for group_id in (5, 7):
        for record in records[group_id][2:]:
            if record["length"] == 1:
                continue
            offset = record["offset"] + 2
            if record["index"] % 2 == 0:
                add_picture(
                    group_id,
                    record["index"],
                    0,
                    record["data"],
                    offset,
                    "inventory-item",
                )
            else:
                add_mask(group_id, record["index"], 0, record["data"], offset)

    for index, label in ((7, "gameplay"), (8, "title")):
        record = records[3][index]
        name = f"fonts/{label}"
        files[name + ".bin"] = record["data"]
        files[name + ".png"] = common.font_sheet(record["data"])
        metadata["fonts"].append(
            dict(
                raw=name + ".bin",
                preview=name + ".png",
                size=record["length"],
                load_address=0xBC00,
                source_spans=record_spans(
                    groups[3], record["offset"] + 2, record["length"]
                ),
            )
        )

    sprite_record = records[3][10]
    directions, used = take_records(sprite_record["data"], 4)
    metadata["sprite_bank_unused_tail_hex"] = sprite_record["data"][used:].hex().upper()
    for direction in directions:
        frames, _ = take_records(direction["data"], 5)
        for frame in frames:
            data = frame["data"]
            x, y, width, height = data[:4]
            end = 4 + width * height
            if end > len(data):
                raise ValueError("Truncated uncompressed player sprite")
            picture = dict(
                x=x, y=y, width_bytes=width, height=height, packed=data[4:end]
            )
            name = f"sprites/direction-{direction['index']}-frame-{frame['index']}"
            files[name + ".bin"] = picture["packed"]
            files[name + ".png"] = picture_png(picture)
            offset = (
                sprite_record["offset"]
                + 2
                + direction["offset"]
                + 2
                + frame["offset"]
                + 2
            )
            metadata["sprites"].append(
                dict(
                    direction=direction["index"],
                    frame=frame["index"],
                    x_offset=x,
                    y_offset=y,
                    width_bytes=width,
                    height=height,
                    raw=name + ".bin",
                    preview=name + ".png",
                    encoding="uncompressed row-major 2bpp; grayscale preview",
                    source_spans=record_spans(groups[3], offset, len(data)),
                    unused_tail_hex=data[end:].hex().upper(),
                )
            )

    base = bytearray(40 * 112)
    for index in range(2, 6):
        blit(base, pictures[(3, index, 0)])
    for frame in range(12):
        canvas = base.copy()
        blit(canvas, pictures[(3, 6, frame)])
        name = "title" if frame == 0 else f"title-animation/frame-{frame:02d}"
        files[name + ".bin"] = bytes(canvas)
        files[name + ".png"] = picture_png(
            dict(width_bytes=40, height=112, packed=canvas),
            common.atari_colors((0, 0xE4, 0x18, 0x1C)),
        )
    metadata["title"] = dict(
        raw="title.bin",
        preview="title.png",
        width=160,
        height=112,
        palette_registers=[0, 0xE4, 0x18, 0x1C],
        animation_frames=12,
        layers=[dict(group=3, record=index, subrecord=0) for index in range(2, 7)],
    )

    state_start, state_end = 0x56B0 - 0xE70, 0x586A - 0xE70
    dynamic_rooms, _ = read_records(atr[state_start:state_end])
    for group_id in (4, 6):
        room_records, _ = read_records(records[group_id][1]["data"])
        for room_index, room_record in enumerate(room_records, 1):
            if room_record["length"] == 1:
                continue
            children, _ = read_records(room_record["data"])
            settings, _ = read_records(children[0]["data"])
            static_ids = settings[0]["data"]
            color_registers = settings[1]["data"]
            if len(color_registers) != 3:
                raise ValueError("Expected three room color registers")
            default_records, _ = read_records(dynamic_rooms[room_index]["data"])
            default_ids = default_records[0]["data"]
            canvas = bytearray(40 * 112)
            layers = []
            for image_id in static_ids + default_ids:
                if image_id < 2:
                    continue
                if image_id >= 200:
                    raise ValueError("Unsupported room image reference")
                record, subrecord = image_id % 100, (image_id // 100) * 2
                picture = pictures[(group_id, record, subrecord)]
                blit(canvas, picture)
                layers.append(
                    dict(image_id=image_id, record=record, subrecord=subrecord)
                )
            name = f"rooms/room-{room_index:02d}"
            files[name + ".bin"] = bytes(canvas)
            palette = (0, *color_registers)
            files[name + ".png"] = picture_png(
                dict(width_bytes=40, height=112, packed=canvas),
                common.atari_colors(palette),
            )
            metadata["rooms"].append(
                dict(
                    index=room_index,
                    group=group_id,
                    raw=name + ".bin",
                    preview=name + ".png",
                    width=160,
                    height=112,
                    palette_registers=list(palette),
                    static_image_ids=list(static_ids),
                    default_state_image_ids=list(default_ids),
                    layers=layers,
                    state_table_atr_offset=state_start
                    + dynamic_rooms[room_index]["offset"],
                )
            )
    return files, metadata
