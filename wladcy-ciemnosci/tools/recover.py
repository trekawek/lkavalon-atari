#!/usr/bin/env python3
"""Inspect the supplied Wladcy Ciemnosci v1 boot dictionary and recover naming evidence."""

from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "util"))
from reference_media import read_reference
from dictionary_signatures import read as read_signatures
import json
import difflib

ROOT = Path(__file__).resolve().parents[1]
ORIGIN = 0x0E80
END = 0x8758
BOOT_END = 0x8780
DISK_END = 0x8B80
LAST = 0x8715
RUNTIMES = {
    0x1441: "DOCOL",
    0x147D: "DOCON",
    0x1499: "DOVAR",
    0x14B2: "DOUSER",
    0x18D8: "DODOES",
}


def cell(m, a):
    return int.from_bytes(m[a : a + 2], "little")


def memory(raw=None):
    if raw is None:
        raw = read_reference(ROOT / "reference/wladcy-ciemnosci.atr")
    if (
        len(raw) != 133136
        or raw[:6] != bytes.fromhex("960280208000")
        or raw[16:22] != bytes.fromhex("00f2800eeb1e")
    ):
        raise ValueError("Expected the supplied 1040-sector Wladcy Ciemnosci v1 ATR")
    m = bytearray(65536)
    m[ORIGIN:DISK_END] = raw[16:0x7D10]
    return m


def header(m, a):
    if not ORIGIN <= a < END - 5 or not m[a] & 128:
        return None
    end = a + 1
    while end < min(a + 33, END - 4) and not m[end] & 128:
        end += 1
    if end >= min(a + 33, END - 4):
        return None
    n = m[a] & 31
    actual = end - a
    if actual != n and not (actual == n + 1 and m[end] == 0xA0):
        return None
    raw = m[a + 1 : end + 1]
    if any(x & 127 and not 32 <= x & 127 < 127 for x in raw):
        return None
    cfa = end + 3
    link = cell(m, end + 1)
    return dict(
        nfa=a,
        cfa=cfa,
        pfa=cfa + 2,
        code=cell(m, cfa),
        link=link,
        flags=m[a],
        suffix=chr(m[end] & 127),
        original_name=bytes(x & 127 for x in raw).decode("ascii").rstrip(),
    )


def dictionary(m):
    known = {}
    a = LAST
    while a:
        h = header(m, a)
        if h is None:
            raise ValueError(f"Invalid dictionary header at ${a:04X}")
        if h["link"] >= a:
            raise ValueError(f"Invalid dictionary link at ${a:04X}")
        known[a] = h
        a = h["link"]
    main_count = len(known)
    candidates = {}
    for a in range(0xF27, END - 6):
        if a in known:
            continue
        h = header(m, a)
        if h and 0xF27 <= h["link"] < a and h["code"] in {*RUNTIMES, h["cfa"] + 2}:
            candidates[a] = h
    while True:
        added = 0
        for a, h in candidates.items():
            if a not in known and (h["link"] in known or h["link"] == 0x1E44):
                known[a] = h
                h["private_vocabulary"] = True
                added += 1
        if not added:
            break
    for a in (0x29AE, 0x2A1B):
        known[a] = dict(
            nfa=a,
            cfa=a,
            pfa=a + 2,
            code=cell(m, a),
            flags=0,
            suffix="",
            original_name="",
            headerless=True,
        )
    ws = sorted(known.values(), key=lambda h: h["nfa"])
    for i, h in enumerate(ws):
        h["end"] = ws[i + 1]["nfa"] if i + 1 < len(ws) else END
        if not h["nfa"] <= h["cfa"] < h["pfa"] <= h["end"]:
            raise ValueError(f"Overlapping dictionary entries at ${h['nfa']:04X}")
    return ws, main_count


def signature(h):
    kind = h["code"] if h["code"] in RUNTIMES else "native"
    return h["flags"], h["suffix"], kind, h["end"] - h["pfa"]


def main():
    m = memory()
    ws, main_count = dictionary(m)
    names = {}
    oldnames = json.loads((ROOT.parent / "ad2044/tools/names.json").read_text())
    stock = bytearray(65536)
    stock_raw = read_reference(ROOT / "reference/figforth.atr")
    stock[ORIGIN : ORIGIN + stock_raw[17] * 128] = stock_raw[
        16 : 16 + stock_raw[17] * 128
    ]
    for h in ws:
        k = f'{h["cfa"]:04x}'
        actual = h["original_name"]
        if actual and "\0" not in actual:
            names[k] = {
                "name": actual,
                "nfa": f'{h["nfa"]:04x}',
                "confidence": "intact-original",
                "evidence": "Intact dictionary name in supplied Wladcy Ciemnosci v1 image.",
            }
        elif h.get("headerless"):
            names[k] = dict(oldnames[k])
        elif h["cfa"] < 0x2A76 and k in oldnames:
            reference = header(stock, h["nfa"])
            if not reference or any(
                reference[field] != h[field]
                for field in ("nfa", "cfa", "flags", "link")
            ):
                raise ValueError(f"Kernel header mismatch at ${h['nfa']:04X}")
            names[k] = {
                "name": oldnames[k]["name"],
                "nfa": f'{h["nfa"]:04x}',
                "confidence": "core-match",
                "evidence": "Same NFA/CFA and header shape as the APX fig-FORTH kernel, verified against the AD2044 reconstruction.",
            }
    ad = read_signatures(ROOT.parent / "ad2044/tools/runtime-signatures.tsv")
    for block in difflib.SequenceMatcher(
        None, [signature(h) for h in ad], [signature(h) for h in ws], autojunk=False
    ).get_matching_blocks():
        if block.size < 3:
            continue
        for rh, h in zip(
            ad[block.a : block.a + block.size], ws[block.b : block.b + block.size]
        ):
            k = f'{h["cfa"]:04x}'
            old = oldnames.get(f'{rh["cfa"]:04x}')
            if k in names or not old:
                continue
            if old.get("confidence") == "inferred":
                continue
            names[k] = {
                "name": old["name"],
                "nfa": f'{h["nfa"]:04x}',
                "confidence": "sequence-candidate",
                "evidence": f'Candidate name; structural sequence match, not an independently verified semantic match. Corresponding AD2044 CFA ${rh["cfa"]:04X} ({old["name"]}) in contiguous {block.size}-definition sequence matching header flags, name suffix, word kind and body size. '
                + old["evidence"],
            }
    manual = ROOT / "tools/inferred-names.json"
    if manual.exists():
        for k, v in json.loads(manual.read_text()).items():
            names[k] = v
    (ROOT / "tools/names.json").write_text(
        json.dumps(dict(sorted(names.items())), indent=2) + "\n", encoding="ascii"
    )
    (ROOT / "tools/headers.json").write_text(
        json.dumps(ws, indent=2) + "\n", encoding="ascii"
    )
    summary = {
        "main_chain": main_count,
        "private_vocabulary": sum(h.get("private_vocabulary", False) for h in ws),
        "headerless": 2,
        "entries": len(ws),
        "names": len(names),
    }
    (ROOT / "tools/recovery.json").write_text(json.dumps(summary, indent=2) + "\n")
    print(summary)


if __name__ == "__main__":
    main()
