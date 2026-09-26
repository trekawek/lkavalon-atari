# Automat Perkusyjny

This directory contains the Automat Perkusyjny source from the [Atari XL/XE Source Archive](http://sources.pigwa.net/files/gry/automat_perkusyjny.zip). The original ZIP is preserved in `archive/`.

The ATASCII assembly sources in `d1/` and `d2/` were converted to UTF-8 and adjusted for MADS. `d2/AP.ASM` includes `AP2.ASM` and builds the disk version; `d1/CAP.ASM` includes `CAP2.ASM` and builds the cassette version. `APLOAD.ASM` builds the common loader. The font, demo, and data objects are copied from the archive.

Run `make` for both XEX files. Run `make test` to compare all three assembled objects and both complete XEX files byte for byte with the archive originals. The XEX files are the original component objects concatenated in their original order. The recorded checks were run with MADS 2.1.7.
