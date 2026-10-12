#!/usr/bin/env python3
"""Extract Wladcy Ciemnosci v1's GAM graphics and stored room layouts.

The native blitter is at $3BC3. Room rendering ($59B4/$59F0) selects picture
0 for IDs below 100 and picture 2 for IDs 100..199, then applies the initial
mutable object list at $5650. Source bytes and palettes stay authoritative.
"""

import importlib.util
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "util"))
import graphics_common as common

spec = importlib.util.spec_from_file_location(
    "wladcy_shared_gam_graphics", ROOT / "klatwa/tools/graphics.py"
)
gam = importlib.util.module_from_spec(spec)
spec.loader.exec_module(gam)


def counted(data, count):
    """Read an explicitly counted vector whose allocated tail is not a record."""
    records, position = [], 0
    for index in range(count):
        if position + 2 > len(data):
            raise ValueError("Truncated counted graphics vector")
        size = int.from_bytes(data[position : position + 2], "little")
        following = position + 2 + size
        if not size or following > len(data):
            raise ValueError("Invalid counted graphics record")
        records.append(
            dict(
                index=index,
                offset=position,
                length=size,
                data=data[position + 2 : following],
            )
        )
        position = following
    return records, position


def paint(canvas, picture, width_bytes=40, height=112):
    """Apply an opaque native picture, clipping only the room preview canvas."""
    for y in range(picture["height"]):
        for x in range(picture["width_bytes"]):
            dest_x, dest_y = picture["x"] + x, picture["y"] + y
            if 0 <= dest_x < width_bytes and 0 <= dest_y < height:
                canvas[dest_y * width_bytes + dest_x] = picture["packed"][
                    y * picture["width_bytes"] + x
                ]


def bitmap_png(packed, width_bytes, height, palette=common.GRAYSCALE):
    width = width_bytes * 4
    pixels = common.unpack_2bpp(packed, width, height)
    width, height, pixels = common.scale_indexed(pixels, width, height)
    return common.encode_png(width, height, pixels, palette)


def extract(atr):
    groups = gam.gam_groups(atr)
    if [len(groups[n]["data"]) // 128 for n in range(1, 9)] != [
        255,
        105,
        92,
        112,
        40,
        103,
        37,
        7,
    ]:
        raise ValueError("Unexpected Wladcy Ciemnosci v1 GAM directory")
    records = {
        number: gam.read_records(group["data"])[0]
        for number, group in groups.items()
        if 3 <= number <= 7
    }
    if [len(records[n]) for n in range(3, 8)] != [14, 66, 58, 54, 46]:
        raise ValueError("Unexpected Wladcy resource record counts")
    files, pictures, masks, fonts, sprites, aliases = {}, [], [], [], [], []
    decoded = {}
    source_groups = []
    for group_id in range(3, 8):
        group = groups[group_id]
        _, used = gam.read_records(group["data"])
        filename = f"groups/group-{group_id:02d}.bin"
        files[filename] = group["data"]
        info = dict(
            index=group_id,
            file=filename,
            sectors=group["sectors"],
            spans=group["spans"],
            records_end=used,
            records=[],
        )
        for record in records[group_id]:
            name = f"records/g{group_id:02d}-r{record['index']:03d}.bin"
            files[name] = record["data"]
            info["records"].append(
                dict(
                    index=record["index"],
                    file=name,
                    group_offset=record["offset"],
                    length=record["length"],
                    atr_spans=gam.record_spans(
                        group, record["offset"] + 2, record["length"]
                    ),
                )
            )
        source_groups.append(info)

    def provenance(group, resource, child=None):
        record = records[group][resource]
        offset = record["offset"] + 2
        size = record["length"]
        if child is not None:
            offset += child["offset"] + 2
            size = child["length"]
        return gam.record_spans(groups[group], offset, size)

    def picture(group, resource, child, data, spans, role):
        name = f"pictures/g{group:02d}-r{resource:03d}-s{child:02d}"
        if len(data) == 1:
            aliases.append(
                dict(
                    group=group,
                    resource=resource,
                    subrecord=child,
                    value=data[0],
                    source_spans=spans,
                )
            )
            return
        item = gam.decode_picture(data)
        if item["x"] >= 40 or item["y"] >= 192 or item["width_bytes"] > 40:
            raise ValueError(f"Unexpected picture geometry: {name}")
        decoded[group, resource, child] = item
        files[name + ".bin"] = item["packed"]
        files[name + ".png"] = bitmap_png(
            item["packed"], item["width_bytes"], item["height"]
        )
        pictures.append(
            dict(
                file=name + ".png",
                raw_file=name + ".bin",
                role=role,
                group=group,
                resource=resource,
                subrecord=child,
                x_byte=item["x"],
                y=item["y"],
                width_bytes=item["width_bytes"],
                height=item["height"],
                compressed_bytes=item["consumed"],
                unused_tail_hex=data[item["consumed"] :].hex().upper(),
                palette="grayscale; scene-dependent colors",
                source_spans=spans,
            )
        )

    def mask(group, resource, child, data, spans):
        if len(data) == 1:
            return
        width, height = data[:2]
        packed, consumed = gam.decode_rle(data[2:], width, height)
        name = f"masks/g{group:02d}-r{resource:03d}-s{child:02d}"
        files[name + ".bin"] = packed
        files[name + ".png"] = common.encode_png(
            width, height, packed, [(v, v, v) for v in range(256)]
        )
        masks.append(
            dict(
                file=name + ".png",
                raw_file=name + ".bin",
                group=group,
                resource=resource,
                subrecord=child,
                width=width,
                height=height,
                role="object hit-test grid, not image transparency",
                unused_tail_hex=data[2 + consumed :].hex().upper(),
                source_spans=spans,
            )
        )

    # Title art contains pictures in every subrecord, including odd indices.
    for resource in range(2, 7):
        children, _ = gam.read_records(records[3][resource]["data"])
        for child in children:
            picture(
                3,
                resource,
                child["index"],
                child["data"],
                provenance(3, resource, child),
                "title art",
            )

    # Each scene object contains image/hit-test pairs; its two image states
    # are selected by quotient/remainder of the encoded image ID by 100.
    for group in (4, 6):
        picture(group, 2, 0, records[group][2]["data"], provenance(group, 2), "pointer")
        for resource in range(3, len(records[group])):
            if len(records[group][resource]["data"]) == 1:
                continue
            children, _ = gam.read_records(records[group][resource]["data"])
            for child in children:
                if child["index"] % 2:
                    mask(
                        group,
                        resource,
                        child["index"],
                        child["data"],
                        provenance(group, resource, child),
                    )
                else:
                    picture(
                        group,
                        resource,
                        child["index"],
                        child["data"],
                        provenance(group, resource, child),
                        "scene object",
                    )

    # Inventory art uses direct, alternating image/grid records rather than
    # the scene objects' additional nested vector. Resource 2 holds text
    # messages and resource 3 is a one-byte $3B placeholder in both groups.
    for group in (5, 7):
        for resource in range(4, len(records[group])):
            data = records[group][resource]["data"]
            if resource % 2:
                mask(group, resource, 0, data, provenance(group, resource))
            else:
                picture(
                    group,
                    resource,
                    0,
                    data,
                    provenance(group, resource),
                    "inventory object",
                )

    for resource, label in ((7, "gameplay"), (8, "title")):
        data = records[3][resource]["data"]
        if len(data) != 1024:
            raise ValueError("Unexpected font length")
        filename = f"fonts/{label}.fnt"
        files[filename] = data
        files[f"fonts/{label}.png"] = common.font_sheet(data)
        fonts.append(
            dict(
                file=filename,
                preview=f"fonts/{label}.png",
                bytes=len(data),
                source_spans=provenance(3, resource),
                preview_format="one-bit glyph sheet in stored order",
            )
        )

    # Stored player frames use uncompressed row-major bytes in 4 x 5 vectors.
    # The engine retains this bank, but its use in this game is unverified.
    direction_records, _ = counted(records[3][10]["data"], 4)
    for direction in direction_records:
        frames, _ = counted(direction["data"], 5)
        for frame in frames:
            data = frame["data"]
            x, y, width, height = data[:4]
            if len(data) != 4 + width * height + 1 or width != 3:
                raise ValueError("Unexpected player-frame format")
            packed = data[4 : 4 + width * height]
            name = f"sprites/direction-{direction['index']}-frame-{frame['index']}"
            files[name + ".bin"] = packed
            files[name + ".png"] = bitmap_png(packed, width, height)
            offset = (
                records[3][10]["offset"]
                + 2
                + direction["offset"]
                + 2
                + frame["offset"]
                + 2
            )
            sprites.append(
                dict(
                    file=name + ".png",
                    raw_file=name + ".bin",
                    direction_index=direction["index"],
                    frame_index=frame["index"],
                    x_offset=x,
                    y_offset=y,
                    width_bytes=width,
                    height=height,
                    source_spans=gam.record_spans(groups[3], offset, len(data)),
                    role="stored player sprite bank; runtime use unverified",
                    palette="grayscale; original runtime palette unverified",
                )
            )

    ram = bytearray(65536)
    ram[0x0E80:0x8B80] = atr[16:0x7D10]
    state_records, _ = gam.read_records(ram[0x5650:0x57CE])
    if len(state_records) != 25:
        raise ValueError("Unexpected initial room-state count")
    rooms = []
    room_payloads = {}
    for group in (4, 6):
        room_records, _ = gam.read_records(records[group][1]["data"])
        for room in room_records:
            if room["length"] == 1:
                continue
            number = room["index"] + 1
            duplicate_of = next(
                (n for n, data in room_payloads.items() if data == room["data"]), None
            )
            room_payloads[number] = room["data"]
            sections, _ = gam.read_records(room["data"])
            visual, _ = gam.read_records(sections[0]["data"])
            layers = list(visual[0]["data"])
            registers = list(visual[1]["data"])
            if len(registers) != 3:
                raise ValueError("Room must define three playfield colors")
            defaults = []
            if number < len(state_records):
                state, _ = gam.read_records(state_records[number]["data"])
                defaults = list(state[0]["data"])
            canvas = bytearray(40 * 112)
            missing = []
            for index in layers + defaults:
                if index <= 1:
                    continue
                key = group, index % 100, (index // 100) * 2
                if key not in decoded:
                    if number < len(state_records):
                        raise ValueError(f"Missing room {number} picture {key}")
                    missing.append(
                        dict(group=key[0], resource=key[1], subrecord=key[2])
                    )
                    continue
                paint(canvas, decoded[key])
            initial = number < len(state_records)
            name = f"rooms/room-{number:02d}"
            layout_file = f"layouts/room-{number:02d}.gam"
            files[layout_file] = room["data"]
            if initial:
                files[name + ".bin"] = bytes(canvas)
                files[name + ".png"] = bitmap_png(
                    canvas, 40, 112, common.atari_colors([0] + registers)
                )
            offset = records[group][1]["offset"] + 2 + room["offset"] + 2
            rooms.append(
                dict(
                    number=number,
                    group=group,
                    file=name + ".png" if initial else None,
                    raw_file=name + ".bin" if initial else None,
                    width_bytes=40,
                    height=112,
                    static_layers=layers,
                    default_state_layers=defaults,
                    layout_file=layout_file,
                    duplicate_layout_of=duplicate_of,
                    missing_images=missing,
                    preview_complete=initial and not missing,
                    palette_registers=[0] + registers,
                    status=(
                        "initial game state"
                        if number < len(state_records)
                        else "extra stored layout; no corresponding initial room state"
                    ),
                    source_spans=gam.record_spans(
                        groups[group], offset, room["length"]
                    ),
                )
            )

    title = bytearray(40 * 112)
    title_layers = [(3, 2, 1), (3, 4, 1), (3, 3, 0), (3, 4, 0), (3, 5, 0)]
    for key in title_layers:
        paint(title, decoded[key])
    title_palette = [0] + list(ram[0x42E4:0x42E7])
    files["title.bin"] = bytes(title)
    files["title.png"] = bitmap_png(title, 40, 112, common.atari_colors(title_palette))
    metadata = dict(
        game="wladcy-ciemnosci",
        groups=source_groups,
        directory=dict(sector=500, disk_id=3, sector_bytes=128),
        format="GAM u16-counted resources; $8D column-order run-length compression",
        pictures=pictures,
        masks=masks,
        fonts=fonts,
        sprites=sprites,
        aliases=aliases,
        rooms=rooms,
        title=dict(
            file="title.png",
            raw_file="title.bin",
            layers=title_layers,
            width_bytes=40,
            height=112,
            palette_registers=title_palette,
            palette_evidence="DLI $4314 reads COLPF0..2 from ($DB),Y; title $DB=$42E4 and Y=0.",
        ),
        initial_room_state_count=24,
        rendered_initial_room_count=24,
        stored_room_layout_count=len(rooms),
        notes=[
            "PNG bitmap previews double horizontal pixels; raw files use row-major packed 2bpp bytes.",
            "Group and resource files preserve original compressed containers, metadata and allocated tails unchanged.",
            "Individual pictures use grayscale because colors depend on their scene; rooms use saved GTIA colors.",
            "Rooms include the initial mutable object overlays for rooms 1..24.",
            "Layouts 25..27 are additional stored records without initial room-state entries.",
            "The three obsolete layouts are retained as data only; some refer to unavailable image states.",
            "Room previews omit decorative UI framing, the player, cursor and later gameplay changes.",
            "Title preview represents the decoded bitmap plane, not the full ANTIC display or text overlays.",
            "Hit-test grids contain object identifiers and are not transparency masks.",
            "Fonts are preserved unchanged; their generic sheet preview does not simulate display-list modes.",
            "The retained 4-by-5 player sprite bank is exported, but its actual use in Wladcy Ciemnosci is unverified.",
            "Inventory groups 5/7 resources 2 are message containers and resources 3 are one-byte placeholders, so image extraction starts at resource 4.",
        ],
    )
    return files, metadata
