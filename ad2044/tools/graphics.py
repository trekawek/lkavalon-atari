#!/usr/bin/env python3
"""Extract AD2044's bounded GAM bitmap records from both original disks.

The directory at sector 500 stores sector counts, with that directory sector
excluded from file contents. DYC ($3976) walks u16-length records. PEN ($3A91)
expands FE,count,value runs with counts 1..255. ?PCOBJ ($3E86) interprets
the final flag numerically: values above one select compression, odd values
select five trailing color bytes. AD2044 copies only the first three colors.

The returned files contain graphics records, decompressed originals and PNG
previews. Scene previews combine the original interface with each base room;
they exclude runtime text, map markers, movable inventory and the cursor.
"""

from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "util"))
from graphics_common import (
    GRAYSCALE,
    atari_colors,
    encode_png,
    font_sheet,
    scale_indexed,
    unpack_2bpp,
)

DIRECTORY_SECTOR = 500
SCREEN_WIDTH = 160
SCREEN_HEIGHT = 104


def unpack(data, max_output=65536):
    """Expand the game's FE RLE while rejecting incomplete or excessive runs."""
    output = bytearray()
    cursor = 0
    while cursor < len(data):
        value = data[cursor]
        cursor += 1
        count = 1
        if value == 0xFE:
            if cursor + 2 > len(data):
                raise ValueError("Truncated FE,count,value run")
            count, value = data[cursor], data[cursor + 1]
            # The original 8-bit loop would fill 256 bytes for zero but then
            # advance its destination by zero, producing overlapping output.
            # No supplied graphics record uses that malformed case.
            if not count:
                raise ValueError(
                    "Zero-count FE run does not advance original destination"
                )
            cursor += 2
        if len(output) + count > max_output:
            raise ValueError("Expanded bitmap exceeds output limit")
        output.extend(bytes([value]) * count)
    return bytes(output)


def groups(disk, side):
    """Read sector-count directory entries, skipping physical sector 500."""
    if len(disk) != 133136 or disk[:6] != bytes.fromhex("960280208000"):
        raise ValueError("Expected a 1040-sector, 128-byte-sector ATR")
    directory = disk[0xF990:0xFA10]
    if directory[0] != side:
        raise ValueError("Unexpected disk side marker")
    logical = 1
    result = []
    for index, count in enumerate(directory[1:], 1):
        if not count:
            break
        sectors = [n + (n >= DIRECTORY_SECTOR) for n in range(logical, logical + count)]
        if sectors[-1] > 1040:
            raise ValueError("Directory group extends beyond disk")
        data = b"".join(disk[16 + (n - 1) * 128 : 16 + n * 128] for n in sectors)
        result.append(dict(side=side, group=index, sectors=sectors, data=data))
        logical += count
    return result


def records(data, start=0, end=None):
    """Walk one resource collection, stopping at its zero-length terminator."""
    end = len(data) if end is None else end
    if not 0 <= start <= end <= len(data):
        raise ValueError("Invalid resource collection bounds")
    result = []
    cursor = start
    while cursor + 2 <= end:
        length = int.from_bytes(data[cursor : cursor + 2], "little")
        if not length:
            return result, cursor
        following = cursor + length + 2
        if following > end:
            raise ValueError("Resource exceeds containing collection")
        result.append(
            dict(
                index=len(result),
                offset=cursor,
                end=following,
                body=data[cursor + 2 : following],
            )
        )
        cursor = following
    if cursor != end:
        raise ValueError("Truncated resource length")
    return result, cursor


def picture(body):
    """Return a structurally valid positioned picture, or None for other data."""
    if not body:
        return None
    flag = body[-1]
    try:
        decoded = unpack(body) if flag > 1 else bytes(body)
    except ValueError:
        return None
    if len(decoded) < 5:
        return None
    x, y, row_bytes, height = decoded[:4]
    size = row_bytes * height
    expected = 4 + size + 1 + (5 if flag & 1 else 0)
    if (
        not row_bytes
        or not height
        or x + row_bytes > 40
        or y + height > 104
        or len(decoded) != expected
    ):
        return None
    colors = list(decoded[-6:-1]) if flag & 1 else None
    return dict(
        x_byte=x,
        y=y,
        width=row_bytes * 4,
        height=height,
        row_bytes=row_bytes,
        flag=flag,
        decoded=decoded,
        bitmap=decoded[4 : 4 + size],
        colors=colors,
    )


def _source(group, offset, length):
    spans = []
    for position in range(offset, offset + length):
        sector = group["sectors"][position // 128]
        file_offset = 16 + (sector - 1) * 128 + position % 128
        if spans and spans[-1]["offset"] + spans[-1]["length"] == file_offset:
            spans[-1]["length"] += 1
        else:
            spans.append(dict(offset=file_offset, length=1))
    return dict(
        disk=f"reference/ad2044-side{group['side']}.atr",
        side=group["side"],
        group=group["group"],
        group_offset=offset,
        byte_count=length,
        spans=spans,
    )


def _indexed_preview(bitmap, width, height, palette):
    pixels = unpack_2bpp(bitmap, width, height)
    display_width, display_height, pixels = scale_indexed(pixels, width, height)
    return encode_png(display_width, display_height, pixels, palette)


def extract(side1, side2):
    """Return ``(files, metadata)`` without reading emulator snapshots."""
    all_groups = groups(side1, 1) + groups(side2, 2)
    files, assets, scenes, group_report = {}, [], [], []
    palettes = {}
    collections = []
    for group in all_groups:
        side, number, data = group["side"], group["group"], group["data"]
        report = {key: group[key] for key in ("side", "group", "sectors")}
        report["byte_count"] = len(data)
        group_report.append(report)
        if side == 1 and number in (1, 2, 19, 20):
            report["kind"] = "saved program" if number < 3 else "game state"
            continue
        if side == 1 and number in (21, 23):
            # The game copies nine $200-byte inventory collections through
            # extended RAM; each has its own zero-terminated DYC records.
            report["kind"] = "nine inventory collections"
            bounds = [(i, i * 512, (i + 1) * 512) for i in range(9)]
            if len(data) != 9 * 512:
                raise ValueError("Unexpected inventory-group size")
        else:
            report["kind"] = "resource collection"
            bounds = [(None, 0, len(data))]
        count = 0
        for slot, start, end in bounds:
            entries, stop = records(data, start, end)
            count += len(entries)
            collections.append((group, slot, entries))
            expected_room = (
                side == 1 and 5 <= number <= 18 or side == 2 and number != 22
            )
            if slot is None and expected_room and len(entries) <= 2:
                raise ValueError("Missing positioned base picture")
            if slot is None and len(entries) > 2:
                room = picture(entries[2]["body"])
                if room and room["colors"]:
                    palettes[(side, number)] = [0] + room["colors"][:3]
                elif expected_room:
                    raise ValueError("Expected a positioned base picture with palette")
        report["record_count"] = count

    def add(
        group, slot, record, kind, decoded, width, height, preview, palette, extra=None
    ):
        ident = f"s{group['side']}-g{group['group']:02d}"
        if slot is not None:
            ident += f"-slot{slot:02d}"
        ident += f"-r{record['index']:03d}"
        packed_path, decoded_path = f"packed/{ident}.bin", f"decoded/{ident}.bin"
        preview_path = f"images/{ident}.png"
        files[packed_path] = group["data"][record["offset"] : record["end"]]
        files[decoded_path], files[preview_path] = decoded, preview
        item = dict(
            id=ident,
            kind=kind,
            source=_source(group, record["offset"], record["end"] - record["offset"]),
            record=record["index"],
            packed_file=packed_path,
            decoded_file=decoded_path,
            preview_file=preview_path,
            width=width,
            height=height,
            display_width=width * 2,
            display_height=height,
            palette=palette,
        )
        if slot is not None:
            item["slot"] = slot
        if extra:
            item.update(extra)
        assets.append(item)
        return item

    interface = None
    for group, slot, entries in collections:
        side, number = group["side"], group["group"]
        special = side == 1 and number in (3, 4)
        ending = side == 2 and number == 22
        for record in entries:
            index, body = record["index"], record["body"]
            if special and index == 1:
                if len(body) != 992:
                    raise ValueError("Unexpected raw font extent")
                preview = font_sheet(body)
                add(
                    group,
                    slot,
                    record,
                    "font",
                    bytes(body),
                    8,
                    8,
                    preview,
                    {"source": "monochrome glyph-bit preview"},
                    dict(
                        glyph_count=124,
                        glyph_width=8,
                        glyph_height=8,
                        note="The game copies 992 bytes unchanged; four of 128 glyph slots are not supplied.",
                        compression="none; font bytes including FE remain literal",
                        display_width=290,
                        display_height=146,
                    ),
                )
                continue
            if (special or ending) and index == 0:
                decoded = unpack(body)
                if len(decoded) != 4200:
                    raise ValueError("Unexpected full-screen bitmap extent")
                bitmap = decoded[:4160]
                width, height = SCREEN_WIDTH, SCREEN_HEIGHT
                if side == 1 and number == 3:
                    # The title marks display-list rows 42,46,...,90 for DLI.
                    # They switch the following row to successive triples in
                    # TITLE-DISPLAY-DATA at $8E5D. Row103 switches to text colors.
                    start = 0x8E5D - 0x8CA0 + 0x7F10
                    triples = [
                        list(side1[start + i * 3 : start + i * 3 + 3])
                        for i in range(14)
                    ]
                    pixels = unpack_2bpp(bitmap, width, height)
                    rgb = bytearray()
                    for y in range(height):
                        band = 0 if y < 43 else min(13, 1 + (y - 43) // 4)
                        colors = atari_colors([0] + triples[band])
                        for value in pixels[y * width : (y + 1) * width]:
                            rgb.extend(bytes(colors[value]) * 2)
                    preview = encode_png(width * 2, height, rgb)
                    palette = dict(
                        source="title DLI triples at $8E5D",
                        bands=triples,
                        first_change_row=43,
                        band_height=4,
                    )
                    kind = "title bitmap"
                elif side == 1:
                    registers = [0, 0x24, 0xF8, 0xFC]
                    preview = _indexed_preview(
                        bitmap, width, height, atari_colors(registers)
                    )
                    palette = dict(
                        source="initial game display colors at $4002",
                        registers=registers,
                    )
                    kind, interface = "interface bitmap", bitmap
                else:
                    preview = _indexed_preview(bitmap, width, height, GRAYSCALE)
                    palette = dict(
                        source="grayscale preview; game retains prior scene colors",
                        known=False,
                    )
                    kind = "ending bitmap"
                add(
                    group,
                    slot,
                    record,
                    kind,
                    decoded,
                    width,
                    height,
                    preview,
                    palette,
                    dict(
                        compression="FE RLE",
                        visible_bytes=4160,
                        offscreen_trailing_bytes=40,
                    ),
                )
                continue
            if index < 2 or special or side == 1 and number in (22, 24, 25):
                continue
            pic = picture(body)
            if pic is None:
                # Every other record in these image collections is either a
                # bounded hit-map grid or one of two known one-byte references.
                # A damaged bitmap must not silently disappear from exports.
                if (
                    side == 2
                    and number == 19
                    and index in (4, 5)
                    and body in (b"\3", b"\4")
                ):
                    continue
                decoded = unpack(body)
                if len(decoded) >= 2 and len(decoded) == 2 + decoded[0] * decoded[1]:
                    continue
                raise ValueError(
                    f"Unrecognized graphic collection record: side {side}, group {number}, record {index}"
                )
            own_colors = pic["colors"]
            registers = (
                [0] + own_colors[:3] if own_colors else palettes.get((side, number))
            )
            if registers is not None:
                rgb = atari_colors(registers)
                palette = dict(
                    registers=registers,
                    source=(
                        "picture suffix" if own_colors else "parent room picture suffix"
                    ),
                )
            else:
                rgb = GRAYSCALE
                palette = dict(
                    source="grayscale preview; contextual game palette is not stored here",
                    known=False,
                )
            is_room = index == 2 and own_colors is not None
            kind = (
                "room bitmap"
                if is_room
                else (
                    "inventory bitmap"
                    if slot is not None
                    else "object or animation bitmap"
                )
            )
            preview = _indexed_preview(pic["bitmap"], pic["width"], pic["height"], rgb)
            item = add(
                group,
                slot,
                record,
                kind,
                pic["decoded"],
                pic["width"],
                pic["height"],
                preview,
                palette,
                dict(
                    x_byte=pic["x_byte"],
                    y=pic["y"],
                    row_bytes=pic["row_bytes"],
                    bitmap_offset=4,
                    flag=pic["flag"],
                    stored_colors=own_colors,
                    compression="FE RLE" if pic["flag"] > 1 else "none",
                ),
            )
            if is_room:
                if interface is None:
                    raise ValueError("Room rendering needs the interface bitmap")
                canvas = bytearray(interface)
                for row in range(pic["height"]):
                    dest = (pic["y"] + row) * 40 + pic["x_byte"]
                    source = row * pic["row_bytes"]
                    canvas[dest : dest + pic["row_bytes"]] = pic["bitmap"][
                        source : source + pic["row_bytes"]
                    ]
                room_id = number - 5 if side == 1 else number + 13
                path = f"scenes/room-{room_id:02d}.png"
                decoded_path = f"scenes/room-{room_id:02d}.bin"
                files[decoded_path] = bytes(canvas)
                files[path] = _indexed_preview(canvas, 160, 104, rgb)
                scene_kind = (
                    "retail-version purchase notice"
                    if room_id == 36
                    else (
                        "explosion-animation background"
                        if room_id == 25
                        else "base room graphic"
                    )
                )
                scenes.append(
                    dict(
                        id=f"room-{room_id:02d}",
                        room=room_id,
                        scene_kind=scene_kind,
                        base_asset=item["id"],
                        preview_file=path,
                        decoded_file=decoded_path,
                        width_bytes=40,
                        composition_assets=["s1-g04-r000", item["id"]],
                        width=160,
                        height=104,
                        display_width=320,
                        display_height=104,
                        palette=palette,
                        note="Derived composition of original base graphic and interface; dynamic object overlays, map markers, text and cursor excluded.",
                    )
                )

    # The cursor copy at CFA $4D2C transfers three 13-byte player bitplanes
    # from $4CA1 to PMBASE+$500, +$600 and +$700. Colors come from CPM $4BB4.
    cursor_start = 0x4CA1 - 0x0E70
    cursor = bytes(side1[cursor_start : cursor_start + 39])
    colors = list(side1[0x4BB4 - 0x0E70 + 1 : 0x4BB4 - 0x0E70 + 4])
    files["packed/cursor-players.bin"] = cursor
    for plane in range(3):
        data = cursor[plane * 13 : (plane + 1) * 13]
        pixels = bytes(
            (value >> shift) & 1 for value in data for shift in range(7, -1, -1)
        )
        w, h, pixels = scale_indexed(pixels, 8, 13)
        path = f"images/cursor-player-{plane + 1}.png"
        files[path] = encode_png(w, h, pixels, atari_colors([0, colors[plane]]))
        assets.append(
            dict(
                id=f"cursor-player-{plane + 1}",
                kind="cursor player bitplane",
                source=dict(
                    disk="reference/ad2044-side1.atr",
                    spans=[dict(offset=cursor_start + plane * 13, length=13)],
                ),
                packed_file="packed/cursor-players.bin",
                packed_offset=plane * 13,
                preview_file=path,
                width=8,
                height=13,
                display_width=w,
                display_height=h,
                palette=dict(registers=[0, colors[plane]], source="CPM at $4BB4"),
            )
        )
    metadata = dict(
        game="ad2044",
        assets=assets,
        scenes=scenes,
        groups=group_report,
        graphics_credit=dict(
            name="Roland Pantola",
            disk="reference/ad2044-side1.atr",
            role_offset=0x9AA5,
            role_ascii="GRAFIKA",
            name_offset=0x9AC3,
            name_ascii="ROLAND  PANTOlA",
        ),
        format="GAM length-prefixed records and FE RLE",
        pixel_aspect="2:1 for ANTIC E bitmap and single-width player previews",
        palette_note="PAL RGB visualization; original GTIA bytes retained. Contextual palettes without evidence use grayscale.",
        coverage=dict(
            positioned_bitmaps=sum(
                "bitmap" in a["kind"]
                and a["kind"]
                not in ("title bitmap", "interface bitmap", "ending bitmap")
                for a in assets
            ),
            fullscreen_bitmaps=3,
            fonts=2,
            cursor_bitplanes=3,
            base_room_scenes=len(scenes),
        ),
        notes=[
            "Raw fonts are not FE-compressed.",
            "One room uses flag $13; this is valid under the original numeric and parity tests.",
            "The 36 base-scene previews include an explosion-animation background and a retail-version purchase notice; this is not a count of playable rooms.",
            "Groups 1/2 on side one are program data; groups 19/20 are game state, not graphics.",
            "Inventory groups 21/23 contain nine independent 512-byte collections.",
        ],
    )
    return files, metadata
