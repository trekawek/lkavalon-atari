#!/usr/bin/env python3
"""Recover the saved indirect-threaded dictionary, not an executable wrapper.

Regeneration requires py65 only for disassembly comments. Building the checked-in
Forth sources does not run this decompiler or read the reference game disks.
"""
import argparse
import importlib.util
import json
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
_text_spec = importlib.util.spec_from_file_location(
    "apx_text_records", ROOT / "tools/text_records.py")
text_records = importlib.util.module_from_spec(_text_spec)
_text_spec.loader.exec_module(text_records)
ORIGIN, END, LAST = 0x0E80, 0x9247, 0x91F4
RUNTIMES = {0x1441: 'DOCOL', 0x147D: 'DOCON', 0x1499: 'DOVAR',
            0x14B2: 'DOUSER', 0x18D8: 'DODOES'}
BRANCHES = {0x0FA2, 0x0FC1, 0x0FE2, 0x1012}


def cell(data, at):
    return int.from_bytes(data[at:at + 2], 'little')


def memory(disk):
    if len(disk) != 133136 or disk[:6] != bytes.fromhex('960280208000'):
        raise ValueError('Expected the supplied 1040-sector side-one ATR')
    data = bytearray(65536)
    data[ORIGIN:0x8D80] = disk[16:0x7F10]
    # The turnkey loader reads its continuation with a 224-byte overlap.
    data[0x8CA0:END] = disk[0x7F10:0x84B7]
    return data


def dictionary(data):
    result = []
    at, end = LAST, END
    while at:
        if not ORIGIN <= at < end:
            raise ValueError(f'Invalid dictionary link {at:04X}')
        if not data[at] & 0x80:
            raise ValueError(f'Invalid header flags at {at:04X}')
        last_char = at + 1
        # Some headers have an extra inverse space beyond the length field.
        while last_char < min(at + 33, end - 4) and not data[last_char] & 128:
            last_char += 1
        if last_char >= min(at + 33, end - 4) or not data[last_char] & 128:
            raise ValueError(f'Unterminated name at {at:04X}')
        cfa = last_char + 3
        declared = data[at] & 31
        actual = last_char - at
        if actual != declared and not (actual == declared + 1 and data[last_char] == 0xA0):
            raise ValueError(f'Invalid name length at {at:04X}')
        result.append(dict(nfa=at, cfa=cfa, pfa=cfa + 2, end=end,
                           code=cell(data, cfa), flags=data[at],
                           suffix=chr(data[last_char] & 127)))
        end, at = at, cell(data, last_char + 1)
    result += json.loads((ROOT / 'tools/extra-headers.json').read_text())
    result.sort(key=lambda w: w['nfa'])
    if len({w['nfa'] for w in result}) != len(result) or len({w['cfa'] for w in result}) != len(result):
        raise ValueError('Duplicate dictionary entry')
    for index, word in enumerate(result):
        word['end'] = result[index + 1]['nfa'] if index + 1 < len(result) else END
        if not (ORIGIN <= word['nfa'] <= word['cfa'] < word['pfa'] <= word['end'] <= END):
            raise ValueError(f"Invalid dictionary extent at {word['nfa']:04X}")
        if word['pfa'] != word['cfa'] + 2 or cell(data, word['cfa']) != word['code']:
            raise ValueError(f"Invalid recorded code field at {word['cfa']:04X}")
    return result


def safe_name(name):
    return ''.join(c if 33 <= ord(c) < 127 else '_' for c in name)


def identifiers(words, names):
    counts = Counter(item['name'] for item in names.values())
    for word in words:
        entry = names.get(f"{word['cfa']:04x}")
        if entry:
            name = safe_name(entry['name'])
            ident = 't.' + name
            if counts[entry['name']] > 1:
                ident += f"_{word['cfa']:04X}"
            word.update(name=entry['name'], evidence=entry['evidence'])
        else:
            ident = f"w{word['cfa']:04X}"
            word.update(name=ident, evidence='Unknown erased name; CFA identifier')
        word['id'] = ident[:31]
    if len({w['id'].upper() for w in words}) != len(words):
        raise ValueError('Duplicate target identifier')


class Listing:
    def __init__(self):
        self.lines = []
        self.pending = ''

    def flush(self):
        if self.pending:
            self.lines.append(self.pending)
            self.pending = ''

    def line(self, text=''):
        self.flush()
        if len(text) > 64:
            raise ValueError(f'Source line longer than screen width: {text}')
        self.lines.append(text)

    def token(self, text):
        if len(self.pending) + len(text) + 1 > 62:
            self.flush()
        self.pending += (' ' if self.pending else '') + text

    def comment(self, text):
        # Parentheses in names and disassembler output must not end a comment.
        text = text.replace('(', '[').replace(')', ']')
        while text:
            n = min(58, len(text))
            if n < len(text) and ' ' in text[:n]:
                n = text.rfind(' ', 0, n)
            self.line('( ' + text[:n] + ' )')
            text = text[n:].lstrip()

    def raw(self, data):
        for start in range(0, len(data), 28):
            self.line('BYTES ' + bytes(data[start:start+28]).hex().upper())

    def save(self, path):
        self.flush()
        path.write_text('\n'.join(self.lines) + '\n', encoding='ascii')


def decode(data, start, end, by_cfa):
    """Decode every cell, including CLIT's odd alignment and counted strings.

    Stop at the first unrecognised instruction: trailing code/data is explicitly
    marked, never silently guessed or skipped. The emission remains lossless.
    """
    result = []
    at = start
    while at + 1 < end:
        cfa = cell(data, at)
        if cfa not in by_cfa:
            break
        insn = dict(at=at, cfa=cfa, end=at + 2)
        if cfa == 0x181B:
            if at + 4 > end or cell(data, at + 2) not in by_cfa:
                break
            insn.update(compiled_cfa=cell(data, at + 2), end=at + 4)
        elif cfa == 0x0F2D or cfa in BRANCHES:
            if at + 4 > end:
                break
            insn.update(value=cell(data, at + 2), end=at + 4)
            if cfa in BRANCHES:
                offset = insn['value']
                if offset >= 32768:
                    offset -= 65536
                insn['target'] = at + 2 + offset
        elif cfa == 0x0F67:
            if at + 3 > end:
                break
            insn.update(value=data[at + 2], end=at + 3)
        elif cfa in (0x1977, 0x36E5):
            if at + 3 > end or at + 3 + data[at + 2] > end:
                break
            insn.update(string=bytes(data[at + 3:at + 3 + data[at + 2]]),
                        end=at + 3 + data[at + 2])
        result.append(insn)
        at = insn['end']
        # These words replace the code field with the following machine code.
        if cfa in (0x188E, 0x18CC):
            break
    return result, at


def emit_thread(out, data, word, by_cfa):
    instructions, stop = decode(data, word['pfa'], word['end'], by_cfa)
    targets = {i['target'] for i in instructions if 'target' in i}
    for insn in instructions:
        at, cfa = insn['at'], insn['cfa']
        if at in targets:
            out.line(f'( label {at:04X} )')
        if cfa == 0x0F2D:
            out.token(f"LIT16 {insn['value']:04X}")
        elif cfa == 0x0F67:
            out.token(f"LIT8 {insn['value']:02X}")
        elif cfa in BRANCHES:
            out.line(f"{by_cfa[cfa]['id']} CELL {insn['value']:04X}"
                     f" ( -> {insn['target']:04X} )")
        elif 'string' in insn:
            encoding = text_records.inline_encoding(
                getattr(out, 'text_game', None), cfa, at + 3)
            text = text_records.display_text(insn['string'], encoding)
            out.comment(('ATASCII text: ' if encoding == 'atascii'
                         else 'Game text: ') + text)
            out.token(by_cfa[cfa]['id'])
            out.raw(bytes([len(insn['string'])]) + insn['string'])
        elif 'compiled_cfa' in insn:
            out.token(by_cfa[cfa]['id'])
            out.token(by_cfa[insn['compiled_cfa']]['id'])
        else:
            out.token(by_cfa[cfa]['id'])
    out.flush()
    if stop != word['end']:
        out.comment(f'Trailing native code/data at {stop:04X}; retained exactly')
        out.raw(data[stop:word['end']])
    return len(instructions), word['end'] - stop


def native(out, data, start, end, disassembler):
    at = start
    while at < end:
        n, text = disassembler.instruction_at(at)
        n = min(n, end - at)
        text = text.replace('(', '[').replace(')', ']')
        out.line('BYTES ' + bytes(data[at:at+n]).hex().upper() +
                 f' ( {at:04X}: {text} )')
        at += n


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--reference', type=Path,
                        default=ROOT / 'reference/ad2044-side1.atr')
    args = parser.parse_args()
    from py65.devices.mpu6502 import MPU
    from py65.disassembler import Disassembler
    disk = args.reference.read_bytes()
    data = memory(disk)
    words = dictionary(data)
    names = json.loads((ROOT / 'tools/names.json').read_text())
    identifiers(words, names)
    by_cfa = {w['cfa']: w for w in words}
    catalog = text_records.Catalog('ad2044', data, words, decode)
    disassembler = Disassembler(MPU(memory=data))
    source = ROOT / 'src'
    source.mkdir(exist_ok=True)
    out = Listing()
    out.comment('AD 2044 target dictionary. Host words emit target CFA cells.')
    out.comment('t. = recovered/inferred name; wXXXX = unknown CFA.')
    out.line('HEX')
    # Frequently used targets are defined last, near the head of FIND's chain.
    usage = Counter(cell(data, a) for a in range(ORIGIN, END - 1))
    for word in sorted(words, key=lambda w: usage[w['cfa']]):
        out.line(f"TARGET {word['cfa']:04X} {word['id']}")
    for code, name in RUNTIMES.items():
        out.line(f'TARGET {code:04X} {name}')
    out.save(source / '00-target-words.fth')
    groups = [('10-kernel.fth', 0x0E80, 0x2A14),
              ('20-framework.fth', 0x2A14, 0x7B00),
              ('30-game.fth', 0x7B00, END)]
    # Choose the nearest actual dictionary boundary to each requested split.
    boundaries = [ORIGIN] + [next(w['nfa'] for w in words if w['nfa'] >= a)
                             for _, a, _ in groups[1:]] + [END]
    stats = Counter()
    for index, (filename, _, _) in enumerate(groups):
        start, end = boundaries[index:index+2]
        out = Listing()
        out.comment(f'AD 2044 {filename}: target {start:04X}..{end-1:04X}')
        out.comment('Hexadecimal. BYTES emits hex bytes; CELL emits a 16-bit cell.')
        out.comment('LIT8/LIT16 compile literals; branch cells are signed offsets.')
        if index == 0:
            out.line('3 T-DISK')
            out.line(f'{ORIGIN:04X} T-ORG')
            out.line('GAME-MODE')
            out.comment('Boot loader, cold-start parameters, initial user area')
            out.raw(data[ORIGIN:words[0]['nfa']])
        for word in words:
            if not start <= word['nfa'] < end:
                continue
            out.line()
            out.comment(f"{word['name']} | NFA {word['nfa']:04X} CFA {word['cfa']:04X}")
            out.comment(word['evidence'])
            catalog.annotate(out, word)
            out.line(f"AT {word['nfa']:04X}")
            out.comment('Saved dictionary header: flags, name bytes, link' if not word.get('headerless')
                        else 'Headerless internal native entry point')
            out.raw(data[word['nfa']:word['cfa']])
            kind = RUNTIMES.get(word['code'])
            stats[kind or 'native'] += 1
            if kind:
                out.line(kind)
                if kind == 'DOCOL':
                    instructions, trailing = emit_thread(out, data, word, by_cfa)
                    stats['threaded_instructions'] += instructions
                    stats['trailing_bytes'] += trailing
                else:
                    if kind in ('DOCON', 'DOUSER', 'DOVAR') and word['end'] - word['pfa'] == 2:
                        out.line(f"CELL {cell(data, word['pfa']):04X}")
                    else:
                        if kind == 'DODOES':
                            out.comment(f"DOES> thread at {cell(data, word['pfa']):04X}")
                        out.raw(data[word['pfa']:word['end']])
            else:
                out.line(f"CELL {word['code']:04X} ( native entry point )")
                native(out, data, word['pfa'], word['end'], disassembler)
            out.line(f"AT {word['end']:04X}")
        if index == len(groups) - 1:
            out.line('T-FINISH')
        out.save(source / filename)
    report = {'origin': ORIGIN, 'end': END, 'words': words, 'statistics': dict(stats)}
    (ROOT / 'dictionary.json').write_text(json.dumps(report, indent=2, ensure_ascii=True) + '\n')
    # Assets are independent of the saved dictionary and never contain a
    # fallback copy of the code being rebuilt.
    assets = ROOT / 'assets'
    assets.mkdir(exist_ok=True)
    (assets / 'side1-tail.bin').write_bytes(disk[0x84B7:])
    side2 = ROOT / 'reference/ad2044-side2.atr'
    (assets / 'side2-data.bin').write_bytes(side2.read_bytes()[16:])
    catalog.save(ROOT)
    print(f"Recovered {len(words)} words ({len(names)} names), {dict(stats)}")


if __name__ == '__main__':
    main()
