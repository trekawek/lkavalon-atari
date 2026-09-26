# Heartlight

This directory contains Janusz Pelc's Heartlight source from the [Atari XL/XE Source Archive](http://sources.pigwa.net/files/gry/heartlight.zip). The original ZIP is preserved in `archive/`.

`d1/HL.ASM` and `d1/HLREAD.ASM` are ATASCII source files converted to UTF-8 and adjusted for MADS. Their assembled objects are byte-identical to `reference/HL.OBJ` and `reference/HLREAD.OBJ` from the archive. The build of `HL.ASM` ends at its `endp` label, where the archived `HL.OBJ` ends; the original source text after that point remains in the ZIP. The tokenized BASIC files and game data in `d1/` and `d2/` are copied unchanged from the ZIP.

Run `make` to build the standalone `bin/heartlight.xex`. The original `HL.BAS` loads its five color values and four cave maps, then unpacks the font and machine code and starts the game at `$9260`. The build extracts the colors and caves from that tokenized BASIC file into `bin/CAVES.OBJ`, loads `HL.FNT` before the overlapping `HL.OBJ`, and sets RUNAD to `$9260`. The BASIC loader helper `HLREAD.OBJ` is unnecessary in the standalone XEX.

Run `make test` to compare both assembled objects with the originals and verify that the linked font/code image matches the archive's `HL.DTA` byte for byte. The archive has no standalone Heartlight XEX to compare with the final executable. The recorded checks used MADS 2.1.7. The XEX was also tested in Atari800 4.2.0 through its title screen and first cave:

```sh
atari800 -xl -nobasic -run bin/heartlight.xex
```

Press Start (F4 in Atari800) at the title screen.
