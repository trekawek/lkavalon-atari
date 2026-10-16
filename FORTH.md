# Forth adventure games

[AD2044](ad2044), [Klątwa](klatwa) and [Władcy Ciemności](wladcy-ciemnosci)
contain reconstructed ASCII Forth sources and editable game content. Their
Makefiles generate the APX fig-Forth compiler, game disks and Forth source disks
from repository files. The supplied sources reproduce the released executable
bytes; resource sizes determine the generated disk layout.

The game READMEs describe their rooms, maps, actions and file formats. This
guide covers the shared build tools, graphics conventions and compiler.

## Build

Keep the repository directory structure intact: the games share tools in
`util/` and `ad2044/tools/`. Host compilation requires Python 3.9 or later,
GNU Make 3.81 or later and the pinned `py65` package. macOS's bundled `make`
is supported.

Run these commands inside the game directory:

```sh
python3 -m venv .venv
.venv/bin/python -m pip install -r requirements.txt
make PYTHON=.venv/bin/python
make test PYTHON=.venv/bin/python
```

Game READMEs list the bootable ATR files. Every game also generates
`build/figforth.atr` (the compiler) and `build/sources.atr` (ASCII Forth source
screens). Generated files stay in the ignored `build/` directory.

The first build executes the original APX compiler in a 6502 emulator and can
take several minutes. Keep `build/program/` between builds: it caches the
compiled executable. Resource edits repack and link disks; Forth source and
embedded-data edits recompile the executable. The game guides identify which
data is embedded. `make clean` removes the cache and all other build outputs.

Generated game disks are writable. Saving in the game changes the disk, and
repacking it resets its save data. Keep personal saved disks separately.

## Faster compilation

[PyPy](https://pypy.org/) can substantially reduce full compilation time by
accelerating the same Python emulator. On macOS, install it with
[Homebrew](https://formulae.brew.sh/formula/pypy3.12), then create a separate
environment inside the game directory:

```sh
brew install pypy3.12
pypy3 -m venv .venv-pypy
.venv-pypy/bin/python -m pip install -r requirements.txt
make -j4 PYTHON=.venv-pypy/bin/python
```

A single game's compiler runs sequentially. `make -j4` overlaps preparation
tasks; it does not divide the emulated compiler across cores. Different games
can build concurrently. Compilation time is recorded in
`build/program/compile-report.json`.

## Build targets

Run targets inside a game directory, with `PYTHON` pointing to the environment
created above.

| Target | Result |
| --- | --- |
| `make` | Build the game disks and ASCII Forth source disk. |
| `make assets` | Pack game resources without compiling Forth. |
| `make sources` | Pack the ASCII Forth source disk. |
| `make verify` | Build and check executable bytes and generated resources. |
| `make test-content` | Test content formats and build rules without compiling the game. |
| `make test-forth` | Build and test compiler/runtime behavior. |
| `make test` | Run content tests, Forth tests and verification. |
| `make clean` | Remove `build/`, including generated disks, saves and compiler cache. |

## Editing game content

Maps, room state, actions and messages are text files. Each game's README
provides a file index and a walkthrough of room 01. Picture and action IDs
identify runtime resources; the builders calculate record lengths,
compression, sector placement and disk directories.

AD2044 keeps pictures, hitmaps and actions beside individual rooms and item
banks. Klątwa and Władcy Ciemności share pictures and action collections
between rooms through stage directories. These arrangements follow each
engine's resource lookup rules.

Game messages use Unicode text with custom Atari font mappings, while Forth
source files use ASCII. Preserve spaces inside quoted display lines and
explicit `\\xNN` glyph escapes. The game format guides describe message IDs,
line widths, hitmap values and action parameters.

## Graphics

Editable pictures are indexed PNGs with pixel values 0–3 at their Atari logical
resolution, without transparency. Keep palette indices when editing; RGB images
are rejected by the builders. Scene files and Forth display code set the Atari
colors, so PNG palette colors are previews; shared Klątwa and Władcy art uses grayscale
previews. Builders do not quantize RGB images into the game's palette. Atari
display hardware stretches pixels horizontally.

Text hitmaps identify clickable regions. Klątwa also uses hitmap values for
depth and character occlusion. Hitmaps describe interaction and placement;
they are separate from a picture's pixel colors. Raw `.fnt` files contain the
game fonts, and `interface/cursor.pmg` contains hardware cursor graphics.

| Game | Picture locations | Format reference |
| --- | --- | --- |
| AD2044 | `rooms/`, `items/`, `interface/`, `ending/` | [Rooms and hitmaps](ad2044/rooms/README.md), [inventory](ad2044/items/README.md), [interface](ad2044/interface/README.md) |
| Klątwa | `stages/`, `items/`, `interface/`, `player/` | [Stage art, hitmaps and animation](util/gam-content-format.md) |
| Władcy Ciemności | `stages/`, `items/`, `interface/` | [Stage art and hitmaps](util/gam-content-format.md) |

The builders check picture dimensions, resource references and Atari buffer
limits. Free disk space does not imply enough runtime memory for larger art.

## Forth sources

The listings reconstruct fixed-address game dictionaries built on APX
fig-Forth and GAM-Forth. The generated [APX compiler](util/figforth) executes
the Forth metacompiler to emit the target executable.

| Source file | Purpose |
| --- | --- |
| `src/metacompiler.fth` | Target byte emission and disk writing. |
| `src/00-target-words.fth` | Names mapped to target dictionary addresses. |
| `src/05-emission.fth` | Cell, literal and address-checking helpers. |
| `src/06-assembler.fth` | 6502 assembler written in Forth. |
| `src/10-kernel.fth` | APX runtime and boot code. |
| `src/20-framework.fth` | GAM graphics, input, sound and resource routines. |
| `src/30-game.fth` | Game-specific logic. |

Native routines use explicit addressing modes, such as `LDA.# 03`,
`STA.ZP D1` and `JSR.ABS E456`; branch operands name hexadecimal destination
addresses. Headers, tables and unclassified regions use byte or cell data.
Definitions retain their original addresses, so resizing code requires
adjusting its layout, pointers and branches. Resource packing does not
relocate executable code.

`INCBIN` directives embed cursor, music or generated world data. Both the host
compiler and source-disk packer expand them into ASCII byte-emission statements
before APX reads the source. Forth files use lines of at most 64 characters.

The [preserved GAM-Forth sources](https://github.com/ptodt/gam-forth) provide
reference definitions for the shared runtime. Game-specific routines and
patches are represented in each game's listings. AD2044's guide describes
its [GAM-Forth compatibility check](ad2044/README.md#gam-forth-compatibility-check).

## Compile on Atari

Inside the game directory, prepare the resources, compiler and source disk:

```sh
make assets sources build/figforth.atr PYTHON=.venv/bin/python
```

Mount `build/figforth.atr` as D1, `build/sources.atr` as D2 and a writable copy
of the game's resource disk as D3:

| Game | D3 resource disk | Result |
| --- | --- | --- |
| AD2044 | `build/assets-side1.atr` | Bootable first disk; play with `build/ad2044-side2.atr`. |
| Klątwa | `build/assets.atr` | Bootable game disk. |
| Władcy Ciemności | `build/assets.atr` | Bootable game disk. |

Disable BASIC, boot D1 and enter at the Forth prompt:

```forth
HEX 1000 2463 ! 1000 OFFSET ! 1 LOAD
```

After the completion message, D3 contains the compiled game. The packed source
disk contains ordinary ASCII Forth and needs no host tools during Atari
compilation.

## Validation and reference material

`make verify` checks executable signatures and compares disk resources with
the authored content. Klątwa and Władcy Ciemności check embedded world state
against the editable room, world and item files. Intentional changes to code,
embedded cursor or AD2044 sound data require corresponding signature updates
for release verification; ordinary builds can compile those edits.

Naming evidence and reconstruction notes live under each game's `tools/`.
Some names are inferred from behavior; unresolved words retain address-based
identifiers. Optional recovery commands regenerate Forth listings and naming
metadata as well as reports under `build/research/`. In Klątwa and Władcy,
`make research` runs these commands against verified generated disks and can
rewrite tracked `src/*.fth` and `tools/names.json` files.

Historical extraction and AD2044 source recovery use hash-checked original
disk fixtures. Their filenames and provenance are documented in each game's
`reference/README.md`; fixtures belong in the ignored `build/reference/`
directory. Normal builds and verification use repository sources. Keep archive
copies outside `build/`, which `make clean` removes.

From the repository root, `python3 util/extract_graphics.py --game ad2044 --check`
compares graphics with those original fixtures without writing files. Omit
`--check` to export a gallery under the game's `build/graphics/`. The `--game`
option also accepts `klatwa` and `wladcy-ciemnosci`.
Run `python3 util/audit_forth_binaries.py` from the repository root to check that
tracked binaries in the three games are graphics, fonts or music.

The original games and assets are the work of their credited authors.
