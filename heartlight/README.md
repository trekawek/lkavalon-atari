# Heartlight

This directory contains Janusz Pelc's Heartlight source from the [Atari XL/XE Source Archive](http://sources.pigwa.net/files/gry/heartlight.zip). The original ZIP is preserved in `archive/`.

`d1/HL.ASM` and `d1/HLREAD.ASM` are ATASCII source files converted to UTF-8 and adjusted for MADS. Their assembled objects are byte-identical to `reference/HL.OBJ` and `reference/HLREAD.OBJ` from the archive. The build of `HL.ASM` ends at its `endp` label, where the archived `HL.OBJ` ends; the original source text after that point remains in the ZIP. The tokenized BASIC files and game data in `d1/` and `d2/` are copied unchanged from the ZIP.

## BASIC listings

The tokenized Atari BASIC files have complete, readable ASCII listings:

| Tokenized file | ASCII listing | Purpose |
| --- | --- | --- |
| `d1/HL.BAS` | `d1/HL.LST` | Heartlight loader, color and cave data, and machine-code DATA lines. |
| `d1/HLAPD.BAS` | `d1/HLAPD.LST` | Combines the font and assembled object into `HL.DTA`. |
| `d1/HLCONV.BAS` | `d1/HLCONV.LST` | Converts `HL.DTA` bytes into hexadecimal DATA lines. |
| `d1/HLREAD.BAS` | `d1/HLREAD.LST` | Prints memory bytes as decimal DATA lines. |

Regenerate the listings from this directory with:

```sh
for file in d1/*.BAS; do python3 util/detokenize-basic.py "$file" > "${file%.BAS}.LST"; done
```

The listings show inverse-video REM text as ordinary characters and escape nonprintable ATASCII bytes in string literals as `\xNN`. The `.BAS` files remain the original tokenized programs. The archive's `HL.LST` and `HLREAD.LST` contain fragments of `HL.BAS`, rather than complete listings of the corresponding `.BAS` files. All 194 lines of the archived `HL.LST` match the generated `HL.LST`; 23 of 24 lines of the archived `HLREAD.LST` match the generated `HL.LST`. At line 730, `HL.BAS` adds a final `,-1` absent from the archived fragment.

Run `make` to build the standalone `bin/heartlight.xex`. The original `HL.BAS` loads its five color values and four cave maps, then unpacks the font and machine code and starts the game at `$9260`. The build extracts the colors and caves from its ASCII listing `d1/HL.LST` into `bin/CAVES.OBJ`, loads `HL.FNT` before the overlapping `HL.OBJ`, and sets RUNAD to `$9260`. The BASIC loader helper `HLREAD.OBJ` is unnecessary in the standalone XEX.

Run `make test` to compare both assembled objects with the originals and verify that the linked font/code image matches the archive's `HL.DTA` byte for byte. The archive has no standalone Heartlight XEX to compare with the final executable. The recorded checks used MADS 2.1.7. The XEX was also tested in Atari800 4.2.0 through its title screen and first cave:

```sh
atari800 -xl -nobasic -run bin/heartlight.xex
```

Press Start (F4 in Atari800) at the title screen.
