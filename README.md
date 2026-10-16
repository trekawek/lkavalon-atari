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
* GNU make (3.81 or later for the Forth games; macOS's bundled version works)
* golang - optionally, for running extra tools
* Python 3 - for Heartlight's cave data and Watson's packed source tools
* Python 3.9 or later with py65 - for the original fig-Forth compiler used by A.D. 2044, Klątwa, and Władcy Ciemności

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

## Building the Forth games from sources

AD 2044, Klątwa and Władcy Ciemności generate their game disks and APX Forth
compiler from repository sources. No original ATR is a normal build input.
The compiler's readable sources live in [util/figforth](util/figforth).

AD 2044 now uses a simpler authoring layout: [world directions](ad2044/world/map.txt),
[room folders](ad2044/rooms), character-grid hitmaps, one action file per room/item bank,
indexed PNG pictures, raw fonts and a binary music bank. Its builder calculates
record lengths, compression and disk placement. The executable matches the
original release; historical editor data, disk padding and saves are omitted.
Start with the [AD 2044 guide](ad2044/README.md) and
[room 01](ad2044/rooms/01).

Klątwa and Władcy Ciemności use the same readable approach, with shared art
and action collections grouped by stage. Each room has a small scene file,
initial objects and action selectors; maps, hit/depth grids, messages and
spell/power slots are text. Shared messages live directly in each stage's
`messages.txt`, and each game's `interface/pages.txt` contains its title pages.
Room notices and action messages sit beside the settings that use them.
Indexed PNGs, fonts and CMC music are the graphics
and sound inputs. The builder calculates compression and placement within each
engine's bank limits. Klątwa has 30 rooms; Władcy has 24 active rooms.
Their initial world state also generates the fixed-address Forth data.
See the [Klątwa guide](klatwa/README.md), [Władcy guide](wladcy-ciemnosci/README.md)
and [shared format notes](util/gam-content-format.md).

| Game | Pictures and fonts | Music |
| --- | --- | --- |
| [AD 2044](ad2044/README.md) | Indexed PNGs beside each room/item, `interface/*.fnt`, `interface/cursor.pmg` | `music/ad2044.snd`, custom binary bank |
| [Klątwa](klatwa/README.md) | Stage/item PNGs, text hitmaps, player PNGs, `interface/*.fnt` and cursor | `music/*.cmc` |
| [Władcy Ciemności](wladcy-ciemnosci/README.md) | Stage/item PNGs, text hitmaps, `interface/*.fnt` and cursor | `music/*.cmc` |

Install each game's Python requirements, then run its Makefile:

```sh
make -C ad2044
make -C klatwa
make -C wladcy-ciemnosci
```

`make assets` packs resources; `make sources` generates an ASCII Forth source
ATR. The generated source screens compile with the original Atari `LOAD`
command. `INCBIN` directives expand embedded cursor, music or generated world
data into ordinary Forth byte-emission statements during source packing and
host compilation. All three games cache their compiled executables, so
resource edits only repack disks; embedded state changes also recompile Forth.

Generated media and reports stay in ignored `build/` folders. Historical game
images are optional forensic fixtures under `build/reference/`; historical
extraction tools require their original full-disk hashes. Fresh game disks
intentionally have different layouts. `python3 util/audit_forth_binaries.py`
checks that tracked binary files are graphics, fonts or music.

## Faster Forth compilation

The first build runs the original APX compiler instruction by instruction in
the Python `py65` 6502 emulator. A single game's compiler has shared dictionary
and output state, so `make -j4` only overlaps preparation tasks; it does not
divide that compiler across cores. Different games can build concurrently.

[PyPy](https://pypy.org/) can speed up the same emulator without changing the
Forth sources or compiler. On macOS, install it with
[Homebrew](https://formulae.brew.sh/formula/pypy3.12), then run these commands
from the game directory (`ad2044`, `klatwa` or `wladcy-ciemnosci`):

```sh
brew install pypy3.12
pypy3 -m venv .venv-pypy
.venv-pypy/bin/python -m pip install -r requirements.txt
make -j4 PYTHON=.venv-pypy/bin/python
```

A full AD2044 validation build on Linux took 54.5 seconds with PyPy 7.3.23
(Python 3.11), versus 906.9 seconds in the earlier CPython build report.
Both executed the same 1.65 billion 6502 instructions, and the final linked
disk was byte-for-byte identical. These are reference timings, not Mac measurements.

Keep `build/program/` between builds: it caches the compiled executable.
Ordinary asset edits then only repack and link disks. Forth source and embedded
data edits require compilation again. `make clean` discards that cache.
The compiler records its elapsed time in `build/program/compile-report.json`.

## Music exports

* [AD 2044](ad2044/music): custom player with title/ending music, game-over cue and twenty effects. Its binary bank is intentionally retained for now.
* [Klątwa](klatwa/music): original title and gameplay CMC modules, six subsongs.
* [Władcy Ciemności](wladcy-ciemnosci/music): title and gameplay CMC modules, three subsongs; its gameplay module restores six adjacent runtime bytes.

`python3 util/extract_music.py` creates listening exports under each game's
`build/music/`, including SAP wrappers for AD 2044. It does not change inputs.
`--check` compares audio data with optional original fixtures. The CMC and SAP
exports can be played with [ASAP](https://asap.sourceforge.net/).

## Graphics

AD 2044's editable pictures are ordinary indexed PNGs in its
[room](ad2044/rooms), [item](ad2044/items), [interface](ad2044/interface) and
[ending](ad2044/ending) folders. Its [room guide](ad2044/rooms/README.md)
explains picture placement, palette indices and clickable grids.

Klątwa and Władcy use indexed PNGs as build inputs in their stage, item and
interface folders; Klątwa also has player animation. Text hitmaps preserve
clickable zones and depth information; [shared format notes](util/gam-content-format.md) explain
the resource IDs, placement and palette rules.

`python3 util/extract_graphics.py` is an optional historical extraction tool;
it reads original reference fixtures and writes galleries under
`build/graphics/`. `--check` compares authored graphics with the originals by
decoded content, allowing different compression and disk placement.
