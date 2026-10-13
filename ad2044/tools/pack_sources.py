#!/usr/bin/env python3
"""Put ASCII Forth into genuine 64-column, 16-line APX source screens."""
import json
import re
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT.parent / "util"))
from forth_assets import source_lines


def main():
    manifest = json.loads((ROOT / 'sources.json').read_text())
    lines = []
    for filename in manifest['sources']:
        for _, number, line in source_lines(ROOT / filename, ROOT):
            # Generated comments are single-line and use brackets internally.
            # Only a standalone '(' opens a comment; t.(LOOP) is a word.
            line = re.sub(r'(?<!\S)\( .*?\)', '', line).strip()
            if not line:
                continue
            # APX sees a continuous 1024-byte string, not 16 separate lines.
            # Column 64 must remain a space so adjacent lines cannot merge
            # identifiers (e.g. T-LAST followed by 0 must not become T-LAST0).
            if len(line) > 63:
                raise ValueError(f'{filename}:{number}: exceeds 63 source columns')
            if lines and len(lines[-1][0]) + len(line) + 1 <= 63:
                old, first_file, first_number = lines[-1]
                lines[-1] = (old + ' ' + line, first_file, first_number)
            else:
                lines.append((line, filename, number))
    # Reserve the last line for -->. The LOAD remains active across screens,
    # including any colon definition split across a screen boundary.
    chunks = [lines[i:i+15] for i in range(0, len(lines), 15)]
    if len(chunks) > 511:
        raise ValueError(f'{len(chunks)} screens exceeds source disk capacity')
    payload = bytearray(b' ' * (4096 * 128))
    mapping = []
    for screen, chunk in enumerate(chunks, 1):
        source = [entry[0] for entry in chunk]
        if screen < len(chunks):
            source += ['-->']
        else:
            source += ['CR ." AD2044 BUILD COMPLETE" CR']
        block = ''.join(s.ljust(64) for s in source).ljust(1024)
        payload[screen*1024:(screen+1)*1024] = block.encode('ascii')
        mapping.append({'screen': screen, 'first': list(chunk[0][1:]),
                        'last': list(chunk[-1][1:])})
    header = bytearray(16)
    struct.pack_into('<HHH', header, 0, 0x296, len(payload)//16, 128)
    build = ROOT / 'build'
    build.mkdir(exist_ok=True)
    (build / 'sources.atr').write_bytes(header + payload)
    (build / 'source-screens.json').write_text(json.dumps(mapping, indent=2) + '\n')
    print(f'Packed {len(lines)} lines into {len(chunks)} screens in build/sources.atr')


if __name__ == '__main__':
    main()
