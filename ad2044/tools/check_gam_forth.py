#!/usr/bin/env python3
"""Compile eleven original GAM definitions and compare them with built AD2044.

Optional research check: supply a checkout of https://github.com/ptodt/gam-forth.
Uses its source screens, our generated APX compiler, and the verified game build.
No upstream boot executable is loaded and no game/build inputs are modified.
"""

import argparse
import json
import re
from pathlib import Path

from compile import ForthMachine, ROOT
from verify import program_memory


# Name, screen, first/last 32-column row, game CFA, code+body length.
# These definitions retain their original name lengths in the stripped game.
DEFINITIONS = (
    ("SELECT", 108, 29, 30, 0x30AA, 24),
    ("<=<", 1, 3, 3, 0x34F2, 16),
    ("%", 1, 12, 15, 0x3506, 56),
    ("X!", 77, 3, 3, 0x364A, 9),
    ("Y!", 77, 5, 5, 0x3658, 9),
    ("X@", 77, 7, 7, 0x3666, 9),
    ("Y@", 77, 9, 9, 0x3674, 9),
    ("POS", 77, 11, 11, 0x3683, 8),
    ("OUNT", 7, 3, 3, 0x39D2, 14),
    ("PAUSE", 3, 20, 23, 0x3FB1, 34),
    ("ARRAY", 6, 3, 4, 0x4138, 22),
)


def check(upstream):
    path = upstream / "img/09_B_Ekrany.ATR"
    raw = path.read_bytes()
    if len(raw) != 133136 or raw[:6] != bytes.fromhex("960280208000"):
        raise ValueError(f"Unexpected GAM source disk format: {path}")
    game = program_memory((ROOT / "build/ad2044-side1.atr").read_bytes())
    lines, definitions = [], []

    def add(line):
        lines.append((str(path), len(lines) + 1, line))

    for i, (name, screen, first, last, cfa, size) in enumerate(DEFINITIONS):
        start = 16 + screen * 1024 + first * 32
        end = 16 + screen * 1024 + (last + 1) * 32
        # Read continuous screen bytes before wrapping into host input lines.
        # NUMBER and ENDIF, for example, cross the editor's row boundaries.
        source = raw[start:end].decode("ascii").strip()
        if not source.startswith(f": {name} "):
            raise ValueError(f"Missing {name} at screen {screen}, row {first}")
        nfa = cfa - len(name) - 3
        add(f"HEX {nfa:X} DP ! DECIMAL")
        line = ""
        # Keep .\" strings together, including their literal spaces.
        for token in re.findall(r'\." [^"]*"|\S+', source):
            if len(line) + len(token) + 1 > 63:
                add(line)
                line = ""
            line += (" " if line else "") + token
        add(line)
        add(f"HEX HERE {0x600 + 2*i:X} ! DECIMAL")
        definitions.append({"name": name, "screen": screen,
                            "rows": [first, last], "cfa": f"{cfa:04X}",
                            "compiled_bytes": size})

    # Execute the newly compiled range and cursor words through APX itself.
    for i, value in enumerate((-6, -5, -4, 0, 4, 5, 6)):
        add(f"-5 {value} 5 <=< {0x620 + 2*i} !")
    add("12 7 POS X@ 1616 ! Y@ 1618 !")  # Results at $650/$652.
    machine = ForthMachine(ROOT / "build/figforth.atr", lines, 10_000_000)
    report = machine.run()
    for i, (name, _, _, _, cfa, size) in enumerate(DEFINITIONS):
        end = machine.get16(0x600 + 2*i)
        if end != cfa + size or bytes(machine.mem[cfa:end]) != game[cfa:cfa + size]:
            raise ValueError(f"Compiled {name} differs from AD2044 at ${cfa:04X}")
        definitions[i]["exact_match"] = True

    bounds = [machine.get16(0x620 + 2*i) for i in range(7)]
    cursor = [machine.get16(0x650), machine.get16(0x652)]
    if bounds != [0, 0, 1, 1, 1, 0, 0] or cursor != [12, 7]:
        raise ValueError(f"Unexpected behavior: bounds={bounds}, cursor={cursor}")
    return {"compiler": report, "definitions": definitions,
            "matched_code_bytes": sum(row[-1] for row in DEFINITIONS),
            "bounds_results": bounds, "cursor": cursor,
            "upstream_boot_image_used": False,
            "scope": "Code fields and bodies only; not stripped headers or a full game build. "
                     "PAUSE is byte-checked; the OS clock is not simulated."}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("upstream", type=Path, help="local GAM-Forth repository checkout")
    args = parser.parse_args()
    print(json.dumps(check(args.upstream), indent=2))


if __name__ == "__main__":
    main()
