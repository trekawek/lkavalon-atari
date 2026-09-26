# Heartlight

This directory contains Janusz Pelc's Heartlight source from the [Atari XL/XE Source Archive](http://sources.pigwa.net/files/gry/heartlight.zip). The original ZIP is preserved in `archive/`.

`d1/HL.ASM` and `d1/HLREAD.ASM` are ATASCII source files converted to UTF-8 and adjusted for MADS. Their assembled objects are byte-identical to `reference/HL.OBJ` and `reference/HLREAD.OBJ` from the archive. The build of `HL.ASM` ends at its `endp` label, where the archived `HL.OBJ` ends; the original source text after that point remains in the ZIP. The tokenized BASIC files and game data in `d1/` and `d2/` are copied unchanged from the ZIP.

Run `make` to build the two objects and `make test` to compare them with the originals. The archive contains tokenized BASIC and data files, but no single assembled Heartlight game XEX. The byte comparison covers the two available machine-code objects. The recorded checks were run with MADS 2.1.7.
