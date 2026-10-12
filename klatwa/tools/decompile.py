#!/usr/bin/env python3
"""Regenerate ASCII low-level Forth and asset split from Klatwa v1."""

from pathlib import Path
from collections import Counter
import json
from shared import ROOT, load
from recover import memory, dictionary, ORIGIN, END, BOOT_END, DISK_END, RUNTIMES, cell

base = load("decompile")
STRINGS = {0x1977, 0x3A8B}


def write_if_changed(path, data):
    if not path.exists() or path.read_bytes() != data:
        path.write_bytes(data)


class Listing(base.Listing):
    def save(self, path):
        self.flush()
        write_if_changed(path, ("\n".join(self.lines) + "\n").encode("ascii"))


def decode(m, start, end, by_cfa):
    result = []
    at = start
    while at + 1 < end:
        cfa = cell(m, at)
        if cfa not in by_cfa:
            break
        ins = {"at": at, "cfa": cfa, "end": at + 2}
        if cfa == 0x181B:
            if at + 4 > end or cell(m, at + 2) not in by_cfa:
                break
            ins.update(compiled_cfa=cell(m, at + 2), end=at + 4)
        elif cfa == 0xF2D or cfa in base.BRANCHES:
            if at + 4 > end:
                break
            val = cell(m, at + 2)
            ins.update(value=val, end=at + 4)
            if cfa in base.BRANCHES:
                ins["target"] = at + 2 + (val if val < 32768 else val - 65536)
        elif cfa == 0xF67:
            if at + 3 > end:
                break
            ins.update(value=m[at + 2], end=at + 3)
        elif cfa in STRINGS:
            if at + 3 > end or at + 3 + m[at + 2] > end:
                break
            ins.update(
                string=bytes(m[at + 3 : at + 3 + m[at + 2]]), end=at + 3 + m[at + 2]
            )
        result.append(ins)
        at = ins["end"]
        if cfa in (0x188E, 0x18CC):
            break
    return result, at


base.decode = decode


def main():
    m = memory()
    words, main_count = dictionary(m)
    names = json.loads((ROOT / "tools/names.json").read_text())
    base.identifiers(words, names)
    by_cfa = {w["cfa"]: w for w in words}
    catalog = base.text_records.Catalog("klatwa", m, words, decode)
    source = ROOT / "src"
    source.mkdir(exist_ok=True)
    out = Listing()
    out.comment("Klatwa v1 target dictionary. Recovered and inferred names.")
    out.line("HEX")
    usage = Counter(cell(m, a) for a in range(ORIGIN, END - 1))
    for w in sorted(words, key=lambda w: usage[w["cfa"]]):
        out.line(f"TARGET {w['cfa']:04X} {w['id']}")
    for code, name in RUNTIMES.items():
        out.line(f"TARGET {code:04X} {name}")
    out.save(source / "00-target-words.fth")
    split = next(w["nfa"] for w in words if w["nfa"] >= 0x6000)
    groups = [
        ("10-kernel.fth", ORIGIN, 0x2A76),
        ("20-framework.fth", 0x2A76, split),
        ("30-game.fth", split, END),
    ]
    stats = Counter()
    for i, (filename, start, end) in enumerate(groups):
        out = Listing()
        out.comment(f"Klatwa v1 {filename}: target {start:04X}..{end-1:04X}")
        out.comment("Hexadecimal. BYTES emits bytes; CELL emits 16-bit cells.")
        out.comment("LIT8/LIT16 compile literals; branches retain signed offsets.")
        out.comment("6502 mnemonics use 06-assembler.fth; operands follow words.")
        if i == 0:
            out.line("3 T-DISK")
            out.line(f"{ORIGIN:04X} T-ORG")
            out.comment("Boot loader, copy-protection bypass and cold-start settings")
            base.emit_region(out, m, ORIGIN, words[0]["nfa"])
        for w in words:
            if not start <= w["nfa"] < end:
                continue
            out.line()
            out.comment(f"{w['name']} | NFA {w['nfa']:04X} CFA {w['cfa']:04X}")
            out.comment(w["evidence"])
            catalog.annotate(out, w)
            out.line(f"AT {w['nfa']:04X}")
            out.comment(
                "Headerless native CFA"
                if w.get("headerless")
                else "Header: flags, saved name and link"
            )
            out.raw(m[w["nfa"] : w["cfa"]])
            kind = RUNTIMES.get(w["code"])
            stats[kind or "native"] += 1
            if kind:
                out.line(kind)
                if kind == "DOCOL":
                    count, trailing = base.emit_thread(out, m, w, by_cfa)
                    stats["threaded_instructions"] += count
                    stats["trailing_bytes"] += trailing
                elif kind in ("DOCON", "DOUSER", "DOVAR") and w["end"] - w["pfa"] == 2:
                    out.line(f"CELL {cell(m,w['pfa']):04X}")
                else:
                    if kind == "DODOES":
                        out.comment(f"DOES> thread at {cell(m,w['pfa']):04X}")
                    out.raw(m[w["pfa"] : w["end"]])
            else:
                out.line(f"CELL {w['code']:04X} ( native entry point )")
                base.native(out, m, w["pfa"], w["end"])
            out.line(f"AT {w['end']:04X}")
        if i == len(groups) - 1:
            out.comment("Final saved boot-sector padding: retired N>N / SAVE-RUN")
            out.raw(m[END:BOOT_END])
            out.line(f"AT {BOOT_END:04X}")
        out.save(source / filename)
    out = Listing()
    out.comment("Retired Forth definitions and save-command residue on disk.")
    out.comment("Outside the 244-sector boot image; retained for exact media.")
    out.line(f"AT {BOOT_END:04X}")
    out.raw(m[BOOT_END:DISK_END])
    out.line(f"AT {DISK_END:04X}")
    out.line("T-FINISH")
    out.save(source / "40-disk-residue.fth")
    report = {
        "origin": ORIGIN,
        "end": END,
        "boot_end": BOOT_END,
        "reconstructed_disk_end": DISK_END,
        "main_chain": main_count,
        "words": words,
        "statistics": dict(stats),
    }
    write_if_changed(
        ROOT / "dictionary.json", (json.dumps(report, indent=2) + "\n").encode("ascii")
    )
    raw = (ROOT / "reference/klatwa-v1.atr").read_bytes()
    write_if_changed(ROOT / "assets/disk-tail.bin", raw[0x7D10:])
    catalog.save(ROOT)
    print(f"Recovered {len(words)} entries, {len(names)} names, {dict(stats)}")


if __name__ == "__main__":
    main()
