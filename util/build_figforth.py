#!/usr/bin/env python3
"""Build the shared APX compiler disk from readable dictionary and 6502 records.

No ATR, emulator snapshot, binary template or network resource is a build input.
The original 58 boot sectors are reconstructed exactly. Optional Forth source
screens remain readable files; unused stale compiled sectors are left blank.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
import struct

import asm6502

SOURCE = Path(__file__).resolve().parent / 'figforth'


def number(value, bits=16):
    result = int(value, 16) if isinstance(value, str) else value
    if not isinstance(result, int) or isinstance(result, bool) or not 0 <= result < (1 << bits):
        raise ValueError(f'Expected unsigned {bits}-bit value: {value!r}')
    return result


def cell(value):
    return number(value).to_bytes(2, 'little')


def relative_file(root, name):
    path = (root / name).resolve()
    if not path.is_relative_to(root.resolve()):
        raise ValueError(f'Compiler source escapes its directory: {name}')
    return path


def dependencies(source=SOURCE):
    """All canonical build inputs, including the shared opcode declarations."""
    source = Path(source)
    layout = json.loads((source / 'disk.json').read_text('ascii'))
    return [Path(__file__).resolve(), Path(asm6502.__file__).resolve(),
            asm6502.OPCODE_SOURCE.resolve(), (source / 'disk.json').resolve(),
            relative_file(source, layout['compiler'])] + [
                relative_file(source, entry['file']) for entry in layout['screens']]


def encode_compiler(document):
    """Encode named Forth headers, indirect threads, typed fields and code."""
    if document['format'] != 'apx-figforth-bootstrap-v1':
        raise ValueError('Unsupported compiler source format')
    origin = number(document['origin'])
    output = bytearray()
    definitions = document['definitions'] + document.get('retired_definitions', [])
    symbols = {word['name']: number(word['cfa']) for word in definitions}
    if len(symbols) != len(definitions):
        raise ValueError('Duplicate compiler dictionary name')
    runtimes = {name: number(address) for name, address in document['runtimes'].items()}

    def at():
        return origin + len(output)

    def expect(address):
        if at() != number(address):
            raise ValueError(f'Compiler address mismatch: ${at():04X}, expected ${number(address):04X}')

    def named(name):
        try:
            return cell(symbols[name])
        except KeyError as exc:
            raise ValueError(f'Unknown compiler Forth word: {name!r}') from exc

    def text_bytes(text):
        # JSON remains ASCII; escaped ATASCII control/inverse characters retain
        # their original single-byte values, independently of locale/UTF-8.
        return text.encode('latin1')

    def thread(tokens):
        for token in tokens:
            if isinstance(token, str):
                output.extend(named(token))
            elif set(token) == {'lit16'}:
                output.extend(named('LIT') + cell(token['lit16']))
            elif set(token) == {'lit8'}:
                output.extend(named('CLIT') + bytes([number(token['lit8'], 8)]))
            elif set(token) == {'compile'}:
                output.extend(named('COMPILE') + named(token['compile']))
            elif set(token) == {'branch', 'target'}:
                if token['branch'] not in ('BRANCH', '0BRANCH', '(LOOP)', '(+LOOP)'):
                    raise ValueError('Unsupported Forth relative branch word')
                output.extend(named(token['branch']))
                # APX branches are relative to the offset cell, not the next IP.
                output.extend(cell((number(token['target']) - at()) & 0xFFFF))
            elif set(token) == {'word', 'string'}:
                text = text_bytes(token['string'])
                output.extend(named(token['word']) + bytes([number(len(text), 8)]) + text)
            else:
                raise ValueError(f'Unsupported Forth thread token: {token!r}')

    def fields(items):
        for field in items:
            types = set(field) - {'name', 'note'}
            if types == {'cell'}:
                output.extend(cell(field['cell']))
            elif types == {'byte'}:
                output.append(number(field['byte'], 8))
            elif types == {'bytes'}:
                output.extend(number(value, 8) for value in field['bytes'])
            else:
                raise ValueError(f'Unsupported compiler field: {field!r}')

    def name_bytes(name, flags):
        raw = bytearray(text_bytes(name))
        if not raw or any(value >= 128 for value in raw):
            raise ValueError('Dictionary names must be nonempty seven-bit text')
        if flags & 31 != len(raw) or not flags & 128:
            raise ValueError('Dictionary flag length does not match its name')
        raw[-1] |= 128
        return bytes([flags]) + raw

    def parts(records):
        for part in records:
            expect(part['at'])
            types = set(part) - {'at', 'note'}
            if types == {'asm'}:
                output.extend(asm6502.assemble(part['asm'], at()))
            elif types == {'thread'}:
                thread(part['thread'])
            elif types == {'fields'}:
                fields(part['fields'])
            elif types == {'boot'}:
                boot = part['boot']
                output.extend(bytes([number(boot['flags'], 8), number(boot['sectors'], 8)])
                              + cell(boot['load']) + cell(boot['init']))
            elif types == {'fill'}:
                fill = part['fill']
                output.extend(bytes([number(fill['value'], 8)]) * number(fill['count']))
            elif types == {'cells'}:
                for value in part['cells']:
                    output.extend(cell(value))
            elif types == {'bytes'}:
                output.extend(number(value, 8) for value in part['bytes'])
            elif types == {'text'}:
                output.extend(text_bytes(part['text']))
            elif types == {'counted_buffer'}:
                buffer = part['counted_buffer']
                text = text_bytes(buffer['text'])
                raw = bytes([number(len(text), 8)]) + text
                width = number(buffer['width'])
                if len(raw) > width:
                    raise ValueError('Counted input exceeds its reserved buffer')
                output.extend(raw + bytes([number(buffer['padding'], 8)]) * (width - len(raw)))
            elif types == {'partial_header'}:
                header = part['partial_header']
                output.extend(name_bytes(header['name'], number(header['flags'], 8)))
            else:
                raise ValueError(f'Unsupported compiler record at ${at():04X}: {types}')

    def words(records):
        for word in records:
            expect(word['at'])
            if not word.get('headerless'):
                output.extend(name_bytes(word['name'], number(word['flags'], 8)))
                output.extend(cell(word['link']))
            expect(word['cfa'])
            code = number(word['entry']) if word['runtime'] == 'native' else runtimes[word['runtime']]
            output.extend(cell(code))
            parts(word['body'])
            expect(word['end'])

    parts(document['prefix'])
    words(document['definitions'])
    expect(document['dictionary_end'])
    parts(document.get('post_dictionary', []))
    words(document.get('retired_definitions', []))
    parts(document.get('trailer', []))
    expect(document['boot_end'])
    if len(output) != output[1] * 128 or number(document['origin']) != int.from_bytes(output[2:4], 'little'):
        raise ValueError('Boot header does not describe the reconstructed compiler')
    return bytes(output)


def build(source=SOURCE):
    """Return a ready-to-boot compiler ATR built exclusively from text files."""
    source = Path(source)
    layout = json.loads((source / 'disk.json').read_text('ascii'))
    if layout['format'] != 'apx-figforth-disk-v1' or layout['sector_size'] != 128:
        raise ValueError('Unsupported compiler disk geometry')
    length = number(layout['sectors']) * 128
    compiler = encode_compiler(json.loads(relative_file(source, layout['compiler']).read_text('ascii')))
    if len(compiler) > length:
        raise ValueError('Compiler exceeds its disk geometry')
    payload = bytearray([number(layout['default_fill'], 8)]) * length
    payload[:len(compiler)] = compiler
    occupied = set(range((len(compiler) + 1023) // 1024))
    for entry in layout['screens']:
        screen = number(entry['number'])
        if screen in occupied or (screen + 1) * 1024 > length:
            raise ValueError(f'Duplicate, overlapping or out-of-bounds source screen: {screen}')
        occupied.add(screen)
        lines = relative_file(source, entry['file']).read_text('ascii').splitlines()
        if len(lines) != 16 or any(len(line) > 64 or any(ord(ch) < 32 for ch in line) for line in lines):
            raise ValueError(f'Source screen {screen} must have 16 printable lines, at most 64 columns')
        payload[screen * 1024:(screen + 1) * 1024] = ''.join(line.ljust(64) for line in lines).encode('ascii')
    header = bytearray(16)
    struct.pack_into('<HHH', header, 0, 0x296, length // 16, 128)
    for field in layout['header_fields']:
        offset = number(field['offset'])
        if not 7 <= offset < 16:
            raise ValueError('Preserved ATR fields cannot override generated geometry')
        header[offset] = number(field['value'], 8)
    return bytes(header + payload)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path)
    parser.add_argument('--dependencies', action='store_true')
    args = parser.parse_args()
    if args.dependencies:
        print(' '.join(str(path) for path in dependencies()))
    elif args.output:
        data = build()
        args.output.parent.mkdir(parents=True, exist_ok=True)
        if not args.output.exists() or args.output.read_bytes() != data:
            args.output.write_bytes(data)
        print(f'Built APX fig-Forth: {len(data)} bytes, 58 exact boot sectors')
    else:
        parser.error('provide --output or --dependencies')


if __name__ == '__main__':
    main()
