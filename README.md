# LK Avalon sources

Repository contains sources of LK Avalon games and programs for 8-bit Atari.

Most original sources were downloaded from [Atari XL/XE Source Archive](http://sources.pigwa.net/), transformed from ATASCII to ASCII with [convert-atascii.go](util/convert-atascii.go) and manually cleaned up. The assembly sources can be compiled with [MADS](https://mads.atari8.info/). The Forth games listed below were reconstructed from their released disk images and rebuild through the original APX fig-Forth compiler.

## Available sources

* [A.D. 2044: Sexmisja](ad2044) - reconstructed ASCII fig-Forth sources
* [Automat Perkusyjny](automat-perkusyjny)
* [Digi Duck](digi-duck)
* [Fred](fred)
* [Hans Kloss](hans-kloss)
* [Heartlight](heartlight)
* [Klątwa](klatwa) - reconstructed ASCII fig-Forth sources
* [Misja](misja)
* [Robbo](robbo)
* [Watson](watson)
* [Władcy Ciemności](wladcy-ciemnosci) - reconstructed ASCII fig-Forth sources

## Requirements

* MADS assembler
* GNU make
* golang - optionally, for running extra tools
* Python 3 - for Heartlight's cave data and Watson's packed source tools
* Python 3 with py65 - for the original fig-Forth compiler used by A.D. 2044, Klątwa, and Władcy Ciemności

## Compilation

The older game directories can be compiled with:

```bash
mads main.asm -o:game.xex
```

Directories can be built with make (see each Forth game's README for its setup):

```bash
make
```

Run the available build checks with:
```bash
make test
```

Heartlight builds a standalone XEX from its original objects and the caves embedded in its BASIC loader. Automat Perkusyjny builds the original disk and cassette XEX files byte for byte. Watson assembles two source revisions, but its archive has no matching executable for a binary comparison. See each directory's README for details.

The three reconstructed Forth games assemble native 6502 routines through
`src/06-assembler.fth`, a target assembler written in Forth and loaded by the
stock APX interpreter. Instructions use explicit addressing modes, such as
`LDA.# 03`, `STA.ZP D1`, and `JSR.ABS E456`; branches name their hexadecimal
destination address. Headers, tables, strings and unclassified mixed regions
remain byte data. This keeps the saved dictionary's original addresses while
making verified machine code editable as mnemonics. See each game's source
notes for the syntax and remaining reconstruction limits.

## Extracted music

* [Klątwa music](klatwa/music): original title and gameplay CMC modules, six subsongs.
* [Władcy Ciemności music](wladcy-ciemnosci/music): title and gameplay CMC modules, three subsongs. The gameplay module restores six bytes used from adjacent runtime memory; see its [extraction notes](wladcy-ciemnosci/README.md#music).
* [A.D. 2044 music](ad2044/music): title/ending, game-over cue and sound effects in SAP format, plus the unchanged raw sound bank. This release uses a custom player rather than CMC.

Each music directory contains `extraction.json` with source offsets, original
load addresses, hashes and any restoration or player adaptations. Regenerate
all exports with Python 3, independently of the Forth build:

```sh
python3 util/extract_music.py
python3 util/extract_music.py --check
python3 util/test_extract_music.py
```

[ASAP](https://asap.sourceforge.net/) can play the CMC and SAP files. Optional
independent validation loads and renders every subsong into temporary WAV files:

```sh
python3 util/extract_music.py --check --asapconv /path/to/asapconv
```

All 31 exported subsongs (including 20 AD 2044 effects) were rendered with
ASAP 8.0.0. The original-player regression checks additionally use `py65`:

```sh
python3 ad2044/tools/test_music_sap.py
python3 util/test_cmc_playback.py
```

## Extracted graphics

Graphics are stored in custom GAM FORTH resource records, rather than ordinary
image files. The exports preserve their packed bytes and decoded bitmap data,
with PNG previews, fonts, and static room compositions:

* [A.D. 2044 gallery](ad2044/graphics/index.html) and [format notes](ad2044/README.md#graphics).
* [Klątwa gallery](klatwa/graphics/index.html) and [format notes](klatwa/README.md#graphics).
* [Władcy Ciemności gallery](wladcy-ciemnosci/graphics/index.html) and [format notes](wladcy-ciemnosci/README.md#graphics).

Open a gallery locally to browse the files. Each directory also has
`rooms-overview.png`, paginated contact sheets, and `extraction.json` with
resource IDs, physical disk offsets, dimensions, palette evidence and checksums.
PNG bitmap previews double the horizontal pixels to match the Atari display
aspect. Grayscale previews identify assets whose contextual colors are unknown;
the stored bitmap and original color-register bytes remain unchanged.

Regenerate or check the exports using Python 3, independently of Forth compilation:

```sh
python3 util/extract_graphics.py
python3 util/extract_graphics.py --check
python3 util/test_graphics_common.py
```

Each game also provides `make graphics` and `make test-graphics`. Install
`py65` to include comparisons with the original 6502 decompression routines;
the other extraction checks use only the standard library. These exports do
not change the game disks or replace the original binary assets used by the
Forth builds.
