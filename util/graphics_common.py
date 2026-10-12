"""Small, dependency-free image helpers for the recovered Atari graphics.

The PAL RGB table is the complete PLTE chunk from the repository's existing
Atari800 5.2.0 PAL screenshots (all three games contain the same table).
GTIA register bytes remain authoritative; RGB is an emulator visualization,
not a claim that every analog Atari display produces these exact colors.
"""

from pathlib import Path
import struct
import zlib

GRAYSCALE = ((0, 0, 0), (85, 85, 85), (170, 170, 170), (255, 255, 255))


def atari_colors(registers):
    palette = Path(__file__).with_name("atari800-pal.pal").read_bytes()
    if len(palette) != 768:
        raise ValueError("Expected the 256-color Atari800 PAL RGB table")
    return [tuple(palette[(c & 0xFE) * 3 : (c & 0xFE) * 3 + 3]) for c in registers]


def _chunk(kind, data):
    return (
        struct.pack(">I", len(data))
        + kind
        + data
        + struct.pack(">I", zlib.crc32(kind + data) & 0xFFFFFFFF)
    )


def encode_png(width, height, pixels, palette=None):
    """Encode 8-bit indexed pixels or packed RGB triples as a lossless PNG."""
    if width <= 0 or height <= 0:
        raise ValueError("PNG dimensions must be positive")
    channels = 1 if palette is not None else 3
    pixels = bytes(pixels)
    if len(pixels) != width * height * channels:
        raise ValueError("Pixel count does not match PNG dimensions")
    header = struct.pack(
        ">IIBBBBB", width, height, 8, 3 if palette is not None else 2, 0, 0, 0
    )
    result = b"\x89PNG\r\n\x1a\n" + _chunk(b"IHDR", header)
    if palette is not None:
        if not 1 <= len(palette) <= 256 or max(pixels) >= len(palette):
            raise ValueError("Invalid indexed PNG palette")
        if any(len(color) != 3 for color in palette):
            raise ValueError("Palette entries must be RGB triples")
        result += _chunk(b"PLTE", bytes(c for color in palette for c in color))
    stride = width * channels
    scanlines = b"".join(
        b"\0" + pixels[start : start + stride]
        for start in range(0, len(pixels), stride)
    )
    return result + _chunk(b"IDAT", zlib.compress(scanlines, 9)) + _chunk(b"IEND", b"")


def unpack_2bpp(data, width, height, stride=None):
    """Decode row-major Atari bitmap bytes, leftmost pixel in bits 7..6."""
    if width <= 0 or height <= 0 or width % 4:
        raise ValueError("2bpp width must be a positive multiple of four")
    row_bytes = width // 4
    stride = row_bytes if stride is None else stride
    if stride < row_bytes or len(data) != stride * height:
        raise ValueError("Bitmap byte count or stride does not match dimensions")
    pixels = bytearray()
    for y in range(height):
        for value in data[y * stride : y * stride + row_bytes]:
            pixels.extend((value >> 6, (value >> 4) & 3, (value >> 2) & 3, value & 3))
    return bytes(pixels)


def scale_indexed(pixels, width, height, xscale=2, yscale=1):
    """Nearest-neighbor scale; returns (width, height, pixels)."""
    if len(pixels) != width * height or min(width, height, xscale, yscale) < 1:
        raise ValueError("Invalid image dimensions or scale")
    output = bytearray()
    for y in range(height):
        row = bytes(
            value
            for value in pixels[y * width : (y + 1) * width]
            for _ in range(xscale)
        )
        output.extend(row * yscale)
    return width * xscale, height * yscale, bytes(output)


def font_sheet(data, columns=16):
    """Preview 8-byte, 8x8 one-bit glyphs, including a partial final glyph.

    Missing bytes in a partial final glyph are blank only in the preview.
    Glyphs stay in stored order, left to right then top to bottom.
    """
    if not data or columns < 1:
        raise ValueError("Empty font or invalid column count")
    count = (len(data) + 7) // 8
    width, height = columns * 9 + 1, ((count + columns - 1) // columns) * 9 + 1
    pixels = bytearray([2] * (width * height))
    for glyph in range(count):
        x, y = 1 + glyph % columns * 9, 1 + glyph // columns * 9
        bits = data[glyph * 8 : glyph * 8 + 8].ljust(8, b"\0")
        for row, value in enumerate(bits):
            for col in range(8):
                pixels[(y + row) * width + x + col] = (value >> (7 - col)) & 1
    width, height, pixels = scale_indexed(pixels, width, height, 2, 2)
    return encode_png(width, height, pixels, ((0, 0, 0), (255, 255, 255), (55, 55, 55)))


def read_preview(data):
    """Read our filter-zero PNG previews as (width, height, RGB bytes).

    Intentionally limited to the PNGs emitted above; this is not a general
    PNG reader and rejects filters, interlacing, and other color types.
    """
    if not data.startswith(b"\x89PNG\r\n\x1a\n"):
        raise ValueError("Missing PNG signature")
    cursor, compressed, palette, header = 8, bytearray(), None, None
    while cursor < len(data):
        size = int.from_bytes(data[cursor : cursor + 4], "big")
        kind = data[cursor + 4 : cursor + 8]
        payload = data[cursor + 8 : cursor + 8 + size]
        if len(payload) != size or cursor + 12 + size > len(data):
            raise ValueError("Truncated PNG chunk")
        crc = int.from_bytes(data[cursor + 8 + size : cursor + 12 + size], "big")
        if zlib.crc32(kind + payload) & 0xFFFFFFFF != crc:
            raise ValueError("PNG checksum mismatch")
        if kind == b"IHDR":
            header = struct.unpack(">IIBBBBB", payload)
        elif kind == b"PLTE":
            palette = [payload[i : i + 3] for i in range(0, len(payload), 3)]
        elif kind == b"IDAT":
            compressed.extend(payload)
        elif kind == b"IEND":
            break
        cursor += size + 12
    if header is None:
        raise ValueError("Missing PNG header")
    width, height, depth, color_type, compression, filtering, interlace = header
    if depth != 8 or color_type not in (2, 3) or compression or filtering or interlace:
        raise ValueError("Unsupported preview PNG encoding")
    stride = width * (3 if color_type == 2 else 1)
    rows = zlib.decompress(compressed)
    if len(rows) != (stride + 1) * height:
        raise ValueError("Unexpected PNG scanline length")
    pixels = bytearray()
    for y in range(height):
        start = y * (stride + 1)
        if rows[start] != 0:
            raise ValueError("Only unfiltered preview PNGs are supported")
        row = rows[start + 1 : start + 1 + stride]
        if color_type == 3:
            if palette is None or max(row) >= len(palette):
                raise ValueError("Invalid PNG palette index")
            pixels.extend(b"".join(palette[value] for value in row))
        else:
            pixels.extend(row)
    return width, height, bytes(pixels)


def contact_sheet(images, columns=6, cell_width=168, cell_height=136):
    """Fit previews in an ordered RGB grid without altering the asset PNGs."""
    if not images or min(columns, cell_width, cell_height) < 1:
        raise ValueError("Empty sheet or invalid grid")
    width, height = (
        columns * cell_width,
        ((len(images) + columns - 1) // columns) * cell_height,
    )
    canvas = bytearray(bytes((36, 38, 42)) * width * height)
    for index, image in enumerate(images):
        source_width, source_height, pixels = read_preview(image)
        scale = min(
            (cell_width - 8) / source_width, (cell_height - 8) / source_height, 1
        )
        target_width, target_height = max(1, int(source_width * scale)), max(
            1, int(source_height * scale)
        )
        left = index % columns * cell_width + (cell_width - target_width) // 2
        top = index // columns * cell_height + (cell_height - target_height) // 2
        for y in range(target_height):
            sy = min(source_height - 1, int(y / scale))
            for x in range(target_width):
                sx = min(source_width - 1, int(x / scale))
                source = (sy * source_width + sx) * 3
                dest = ((top + y) * width + left + x) * 3
                canvas[dest : dest + 3] = pixels[source : source + 3]
    return encode_png(width, height, canvas)
