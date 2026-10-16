#!/usr/bin/env python3
"""Editable indexed PNG sources for AD2044's two-bit pictures.

PNG palette indices, not RGB colors, are the four Atari pixel values. A PNG
palette is a preview; the five native color registers are explicit picture
metadata, and the title's DLI colors remain executable data. Source PNGs use
logical pixel widths (four pixels per Atari byte), not doubled display widths.

The build API returns record BODY bytes; callers add the u16 record length.
Positioned pictures preserve x/y, dimensions, optional five colors and flag.
Full-screen sources retain all 105 stored rows, including the offscreen row.

The optional export command migrates old packed records plus their extraction
report to editable files. It never reads a game ATR and is not a build step.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
import struct
import zlib

PNG_SIGNATURE = b"\x89PNG\r\n\x1a\n"
MAX_FILE_SIZE = 8 * 1024 * 1024
MAX_PIXELS = 1024 * 1024
# Positioned pictures expand at FIRST=$0600, below fig-Forth LIMIT=$0E40.
POSITIONED_CAPACITY = 0x0E40 - 0x0600
OVERLAY_CAPACITY = 0xA8FC - 0xA4E8
GRAYSCALE = ((0, 0, 0), (85, 85, 85), (170, 170, 170), (255, 255, 255))


def _chunk(kind, payload):
    return (struct.pack(">I", len(payload)) + kind + payload
            + struct.pack(">I", zlib.crc32(kind + payload) & 0xFFFFFFFF))


def encode_png(width, height, pixels, palette=GRAYSCALE):
    """Encode a four-entry indexed PNG without changing any pixel indices."""
    if type(width) is not int or type(height) is not int or min(width, height) < 1:
        raise ValueError("PNG dimensions must be positive integers")
    if width * height > MAX_PIXELS:
        raise ValueError("PNG dimensions exceed the source image limit")
    pixels = bytes(pixels)
    if len(pixels) != width * height or any(value > 3 for value in pixels):
        raise ValueError("Expected one pixel index 0..3 per image pixel")
    if len(palette) != 4 or any(len(color) != 3 for color in palette):
        raise ValueError("Source PNG palette must contain four RGB entries")
    colors = bytes(c for color in palette for c in color)
    header = struct.pack(">IIBBBBB", width, height, 8, 3, 0, 0, 0)
    rows = b"".join(b"\0" + pixels[y * width:(y + 1) * width]
                    for y in range(height))
    return (PNG_SIGNATURE + _chunk(b"IHDR", header) + _chunk(b"PLTE", colors)
            + _chunk(b"IDAT", zlib.compress(rows, 9)) + _chunk(b"IEND", b""))


def _paeth(left, above, upper_left):
    estimate = left + above - upper_left
    distances = (abs(estimate - left), abs(estimate - above), abs(estimate - upper_left))
    return (left, above, upper_left)[distances.index(min(distances))]


def decode_png(data):
    """Return (width, height, indices, RGB_palette) from an indexed PNG.

    Supports depths 1/2/4/8 and all five PNG filters, with bounded decompression.
    RGB/RGBA, interlacing, transparent pixels and values outside 0..3 are rejected
    instead of quantizing or interpreting colors as Atari pixel identities.
    """
    if len(data) > MAX_FILE_SIZE:
        raise ValueError("PNG exceeds the source file size limit")
    if not data.startswith(PNG_SIGNATURE):
        raise ValueError("Missing PNG signature")
    cursor, header, palette = 8, None, None
    compressed = bytearray()
    saw_idat = ended_idat = saw_end = False
    while cursor < len(data):
        if cursor + 12 > len(data):
            raise ValueError("Truncated PNG chunk")
        size = int.from_bytes(data[cursor:cursor + 4], "big")
        kind = data[cursor + 4:cursor + 8]
        end = cursor + size + 12
        if end > len(data):
            raise ValueError("Truncated PNG chunk payload")
        payload = data[cursor + 8:end - 4]
        crc = int.from_bytes(data[end - 4:end], "big")
        if zlib.crc32(kind + payload) & 0xFFFFFFFF != crc:
            raise ValueError("PNG chunk checksum mismatch")
        if header is None and kind != b"IHDR":
            raise ValueError("PNG must start with IHDR")
        if saw_idat and kind != b"IDAT":
            ended_idat = True
        if kind == b"IHDR":
            if header is not None or size != 13:
                raise ValueError("Invalid or duplicate PNG header")
            header = struct.unpack(">IIBBBBB", payload)
            width, height, depth, color, compression, filtering, interlace = header
            if color != 3:
                raise ValueError("Use an indexed PNG source; RGB/RGBA conversion is not supported")
            if depth not in (1, 2, 4, 8) or compression or filtering or interlace:
                raise ValueError("Unsupported PNG depth, compression, filtering or interlacing")
            if not width or not height or width * height > MAX_PIXELS:
                raise ValueError("PNG dimensions exceed the source image limit")
        elif kind == b"PLTE":
            if palette is not None or saw_idat or not size or size % 3 or size > 768:
                raise ValueError("Invalid or duplicate PNG palette")
            palette = tuple(tuple(payload[i:i + 3]) for i in range(0, size, 3))
            if len(palette) > 1 << header[2]:
                raise ValueError("PNG palette exceeds its bit depth")
        elif kind == b"IDAT":
            if palette is None or ended_idat:
                raise ValueError("PNG image data requires an earlier palette and contiguous chunks")
            saw_idat = True
            compressed.extend(payload)
        elif kind == b"tRNS":
            if palette is None or saw_idat or size > len(palette) or any(v != 255 for v in payload):
                raise ValueError("Transparent indexed PNG sources are not supported")
        elif kind == b"IEND":
            if size or not saw_idat or end != len(data):
                raise ValueError("Invalid PNG end or trailing bytes")
            saw_end = True
            break
        elif not kind[0] & 32:
            raise ValueError("Unsupported critical PNG chunk")
        cursor = end
    if header is None or not saw_end:
        raise ValueError("Missing PNG header, image data or end")
    width, height, depth = header[:3]
    stride = (width * depth + 7) // 8
    expected = (stride + 1) * height
    try:
        decoder = zlib.decompressobj()
        rows = decoder.decompress(compressed, expected + 1)
    except zlib.error as error:
        raise ValueError("Invalid PNG compressed data") from error
    if (len(rows) != expected or not decoder.eof or decoder.unused_data
            or decoder.unconsumed_tail):
        raise ValueError("PNG decompressed size or stream boundary is invalid")
    pixels, previous = bytearray(), bytes(stride)
    for y in range(height):
        offset = y * (stride + 1)
        method = rows[offset]
        if method > 4:
            raise ValueError("Unknown PNG filter")
        row = bytearray(rows[offset + 1:offset + 1 + stride])
        # Indexed PNG samples occupy at most one byte, so filter bpp is one
        # even when several packed one/two/four-bit pixels share that byte.
        for x in range(stride):
            left, above = row[x - 1] if x else 0, previous[x]
            upper_left = previous[x - 1] if x else 0
            predictor = (0, left, above, (left + above) // 2,
                         _paeth(left, above, upper_left))[method]
            row[x] = (row[x] + predictor) & 255
        mask = (1 << depth) - 1
        for x in range(width):
            value = (row[x * depth // 8] >> (8 - depth - x * depth % 8)) & mask
            if value >= len(palette) or value > 3:
                raise ValueError("PNG pixel indices must be 0..3 and present in its palette")
            pixels.append(value)
        previous = row
    return width, height, bytes(pixels), palette


def pack_pixels(width, height, pixels):
    """Pack four logical pixels into each Atari byte, left pixel in bits 7..6."""
    if width <= 0 or height <= 0 or width % 4 or len(pixels) != width * height:
        raise ValueError("Atari bitmap width must be a multiple of four and match its pixels")
    if any(value > 3 for value in pixels):
        raise ValueError("Atari bitmap indices must be 0..3")
    return bytes((pixels[i] << 6) | (pixels[i + 1] << 4)
                 | (pixels[i + 2] << 2) | pixels[i + 3]
                 for i in range(0, len(pixels), 4))


def unpack_pixels(data):
    return bytes((value >> shift) & 3 for value in data for shift in (6, 4, 2, 0))


def compress(data):
    """Stock FE,count,value compression; never emits an unsafe zero count."""
    result, position = bytearray(), 0
    while position < len(data):
        end = position + 1
        while end < len(data) and data[end] == data[position] and end - position < 255:
            end += 1
        count = end - position
        if count >= 3 or data[position] == 254:
            result.extend((254, count, data[position]))
        else:
            result.extend(data[position:end])
        position = end
    return bytes(result)


def decompress(data, limit=65536):
    result, cursor = bytearray(), 0
    while cursor < len(data):
        value, count = data[cursor], 1
        cursor += 1
        if value == 254:
            if cursor + 2 > len(data) or not data[cursor]:
                raise ValueError("Truncated or zero-count FE run")
            count, value = data[cursor:cursor + 2]
            cursor += 2
        if len(result) + count > limit:
            raise ValueError("Expanded picture exceeds its size limit")
        result.extend(bytes([value]) * count)
    return bytes(result)


def encode_picture(png, x_byte, y, colors=None, flag=None):
    """Build a positioned picture BODY from indexed PNG and explicit fields."""
    width, height, pixels, _ = decode_png(png)
    if (type(x_byte) is not int or type(y) is not int or min(x_byte, y) < 0
            or width % 4 or x_byte + width // 4 > 40 or y + height > 104):
        raise ValueError("Positioned picture lies outside the 40-byte by 104-row screen")
    if colors is not None:
        if len(colors) != 5 or any(type(c) is not int or not 0 <= c <= 255 for c in colors):
            raise ValueError("Positioned picture colors must be five register bytes")
    flag = (3 if colors is not None else 2) if flag is None else flag
    if type(flag) is not int or not 0 <= flag <= 255 or bool(flag & 1) != (colors is not None):
        raise ValueError("Picture flag parity must agree with the optional five colors")
    raw = (bytes([x_byte, y, width // 4, height]) + pack_pixels(width, height, pixels)
           + (bytes(colors) if colors is not None else b"") + bytes([flag]))
    if len(raw) > POSITIONED_CAPACITY:
        raise ValueError(f"Decoded positioned picture exceeds its {POSITIONED_CAPACITY}-byte runtime buffer")
    return compress(raw) if flag > 1 else raw


def encode_fullscreen(png):
    """Build a compressed full-screen BODY, preserving all 4200 stored bytes."""
    width, height, pixels, _ = decode_png(png)
    if (width, height) != (160, 105):
        raise ValueError("Full-screen sources must retain all 160 by 105 stored pixels")
    return compress(pack_pixels(width, height, pixels))


def validate_overlay(base_body, overlay_body, base_hitmap_body, overlay_hitmap_body):
    """Check one known runtime composition; return None or raise ValueError.

    $52A1 expands overlays at $A4E8 and copies without clipping into FIRST.
    $5308 then places the hit map at (x-base_x, ceil((y-base_y)/6)), also
    without clipping. These checks apply when the actual base is known, not
    to every stored picture independently of the view in which it is used.
    """
    def picture(body, limit, label):
        if not body:
            raise ValueError(f"{label}: missing positioned picture")
        raw = decompress(body, limit) if body[-1] > 1 else bytes(body)
        if len(raw) > limit:
            raise ValueError(f"{label}: decoded picture exceeds its {limit}-byte runtime buffer")
        if len(raw) < 5:
            raise ValueError(f"{label}: incomplete positioned picture")
        x, y, width, height = raw[:4]
        expected = 4 + width * height + (5 if raw[-1] & 1 else 0) + 1
        if not width or not height or len(raw) != expected:
            raise ValueError(f"{label}: invalid positioned picture dimensions or length")
        return x, y, width, height

    def hitmap(body, label):
        raw = decompress(body, 0x5140 - 0x4FED)
        if len(raw) < 2 or not raw[0] or not raw[1] or len(raw) != 2 + raw[0] * raw[1]:
            raise ValueError(f"{label}: invalid hit-map dimensions or length")
        return raw[0], raw[1]

    bx, by, bw, bh = picture(base_body, POSITIONED_CAPACITY, "Base picture")
    x, y, width, height = picture(overlay_body, OVERLAY_CAPACITY, "Overlay picture")
    if not (bx <= x and by <= y and x + width <= bx + bw and y + height <= by + bh):
        raise ValueError("Overlay picture extends outside its current base picture")
    map_width, map_height = hitmap(base_hitmap_body, "Base hit map")
    width, height = hitmap(overlay_hitmap_body, "Overlay hit map")
    dx, dy = x - bx, (y - by + 5) // 6
    if dx + width > map_width or dy + height > map_height:
        raise ValueError("Overlay hit map extends outside its current base grid")


def encode_font(data):
    """Fonts are raw .fnt sources, including literal FE bytes and all 124 glyphs."""
    if len(data) != 992:
        raise ValueError("AD2044 fonts must contain exactly 992 bytes")
    return bytes(data)


def export_sources(graphics_dir, output):
    """One-time conversion of existing packed graphics and extraction metadata."""
    graphics_dir, output = Path(graphics_dir), Path(output)
    report = json.loads((graphics_dir / "extraction.json").read_text())["details"]
    # The PAL table is only needed by this migration, never by picture encoding.
    palette_data = (Path(__file__).resolve().parents[2] / "util/atari800-pal.pal").read_bytes()
    if len(palette_data) != 768:
        raise ValueError("Expected 256-entry PAL preview palette")
    def palette(registers):
        return tuple(tuple(palette_data[(c & 254) * 3:(c & 254) * 3 + 3]) for c in registers)
    output.mkdir(parents=True, exist_ok=True)
    mapping = []
    for item in report["assets"]:
        if item["kind"] == "cursor player bitplane":
            continue
        packed = (graphics_dir / item["packed_file"]).read_bytes()
        if int.from_bytes(packed[:2], "little") != len(packed) - 2:
            raise ValueError(f"Invalid record length: {item['id']}")
        body = packed[2:]
        entry = {key: item[key] for key in ("id", "kind", "record")}
        entry.update({key: item["source"][key] for key in ("side", "group")})
        if "slot" in item:
            entry["slot"] = item["slot"]
        entry["old_record"] = item["packed_file"]
        if item["kind"] == "font":
            name = item["id"] + ".fnt"
            result = encode_font(body)
        else:
            name = item["id"] + ".png"
            meta = item["palette"]
            registers = meta.get("registers")
            if "bands" in meta:
                registers = [0] + meta["bands"][0]
            rgb = palette(registers) if registers else GRAYSCALE
            entry["preview_palette"] = meta
            if "bitmap_offset" in item:
                raw = decompress(body) if item["flag"] > 1 else body
                x, y, row_bytes, height = raw[:4]
                pixels = unpack_pixels(raw[4:4 + row_bytes * height])
                result = encode_png(row_bytes * 4, height, pixels, rgb)
                entry.update(x_byte=x, y=y, width=row_bytes * 4, height=height,
                             colors=item["stored_colors"], flag=item["flag"])
                rebuilt = encode_picture(result, x, y, entry["colors"], entry["flag"])
                if (decompress(rebuilt) if entry["flag"] > 1 else rebuilt) != raw:
                    raise ValueError(f"Picture conversion changed native data: {item['id']}")
            else:
                raw = decompress(body)
                if len(raw) != 4200:
                    raise ValueError("Unexpected full-screen raster extent")
                result = encode_png(160, 105, unpack_pixels(raw), rgb)
                entry.update(width=160, height=105, visible_height=104,
                             offscreen_nonzero_bytes=sum(v != 0 for v in raw[4160:]))
                if decompress(encode_fullscreen(result)) != raw:
                    raise ValueError(f"Full-screen conversion changed data: {item['id']}")
        (output / name).write_bytes(result)
        entry["file"] = name
        mapping.append(entry)
    (output / "mapping.json").write_text(json.dumps(mapping, indent=2) + "\n")
    return mapping


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--export", type=Path, required=True, help="Destination for one-time PNG/font conversion")
    parser.add_argument("--graphics-dir", type=Path, default=Path(__file__).resolve().parents[1] / "graphics")
    args = parser.parse_args()
    mapping = export_sources(args.graphics_dir, args.export)
    print(f"Converted {len(mapping)} native picture/font records into {args.export}")


if __name__ == "__main__":
    main()
