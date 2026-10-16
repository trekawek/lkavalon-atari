# A.D. 2044: Sexmisja

Reconstructed Forth sources for A.D. 2044, with editable rooms, maps, pictures
and text. The build produces two writable game disks whose executable matches
the original release.

![Rebuilt game running in Atari800](img/first-room.png)

Start with [room 01](rooms/01), a small corridor. Its
[scene](rooms/01/scene.txt) places the [picture](rooms/01/base.png) and
[hitmap](rooms/01/base.hit.txt). A `2` in the hitmap selects zone `[02]` in
[actions.txt](rooms/01/actions.txt): use the right exit, or examine “KORYTARZ.”
The [world map](world/map.txt) supplies that room's position, facing and open
exits. Initially, room 01's right exit leads to room 02.

| Where | What to edit |
| --- | --- |
| [world/map.txt](world/map.txt) | Room coordinates, facing, map glyphs and open directions |
| [world/initial.txt](world/initial.txt) | Starting room, energy, inventory and puzzle cells |
| [rooms/00…36](rooms) | One folder per room; pictures, hitmaps, actions and initial views |
| `rooms/NN/room.txt` | Which drawable objects initially appear in each view |
| `rooms/NN/scene.txt` | Picture positions, Atari colors and resource IDs |
| `rooms/NN/*.png` | Four-color indexed pictures and animation frames |
| `rooms/NN/*.hit.txt` | Character grids identifying clickable zones |
| `rooms/NN/actions.txt` | All room actions and messages, grouped by clickable zone |
| [items](items) | Inventory pictures and actions, grouped into four-item banks |
| [interface](interface) | Title, screen frame, fonts, cursor and [credits.txt](interface/credits.txt) |
| [ending](ending) | Background and frames, with the message in [scene.txt](ending/scene.txt) |
| [music/ad2044.snd](music/ad2044.snd) | Custom player, music and effects bank |
| [src/30-game.fth](src/30-game.fth) | Game logic; framework and kernel are beside it |
| [tools](tools) | Builders, validation and recovery tools |
| `build/` | Generated disks, compiler, packing report and research catalogs; ignored by Git |

The [room](rooms/README.md), [inventory](items/README.md) and
[world](world/README.md) guides explain the numeric IDs and engine limits.
The builder calculates record lengths, compression and disk placement.

## Build

Follow the [shared build instructions](../FORTH.md#build), selecting `ad2044`.
The guide also covers [faster compilation with PyPy](../FORTH.md#faster-compilation)
and [available Make targets](../FORTH.md#build-targets).

| Output | Purpose |
| --- | --- |
| `build/ad2044-side1.atr` | Bootable first game disk |
| `build/ad2044-side2.atr` | Second game disk |
| `build/sources.atr` | ASCII Forth source screens |
| `build/figforth.atr` | APX fig-Forth compiler |
| `build/assets-side1.atr` | Resource disk used as D3 for [compilation on Atari](../FORTH.md#compile-on-atari) |

Room, text, map, font and picture edits repack resources and reuse the cached
executable. Music and cursor graphics are embedded in the executable, so changing
either also requires Forth compilation.

Both game disks must remain writable. A resource build initializes the game
state and save slots from [world/initial.txt](world/initial.txt). In-game save/load
modifies the generated disks. Repacking resets that save; keep personal saved
disks separately.

For an optional emulator smoke check, install Atari800, Xvfb and Python Xlib,
then run from `ad2044`:

```sh
python3 tools/emulate.py build/ad2044-side1.atr build/ad2044-side2.atr \
  --scenario tools/emulate-smoke.json --output build/emulator-smoke
```

The scenario opens the menu, enters the first room and moves the cursor, saving
screenshots for inspection.

## Code and recovery

[10-kernel.fth](src/10-kernel.fth), [20-framework.fth](src/20-framework.fth) and
[30-game.fth](src/30-game.fth) reconstruct the kernel, GAM framework and game.
See the shared guide for [Forth source conventions](../FORTH.md#forth-sources)
and [validation and reference material](../FORTH.md#validation-and-reference-material).

The 901 dictionary entries have 473 recovered or matched names, 425 inferred
descriptive names and three unresolved address names.
[tools/names.json](tools/names.json) retains the naming evidence;
[tools/recovery-notes.txt](tools/recovery-notes.txt) explains the analysis.
`python3 tools/decompile.py` regenerates Forth sources and writes dictionaries,
symbol lists and string catalogs under `build/research/`. The required reference
filenames are recorded in [reference/sources.json](reference/sources.json).

### GAM-Forth compatibility check

[tools/check_gam_forth.py](tools/check_gam_forth.py) compiles eleven definitions
from the original [GAM-Forth source screens](https://github.com/ptodt/gam-forth)
through the generated APX compiler and compares them with built AD2044. The
validated upstream revision is `a1de7b5fa1c2871c15c1d842681fee386fe48700`.

`SELECT`, `<=<`, `%`, `X!`, `Y!`, `X@`, `Y@`, `POS`, `OUNT`, `PAUSE` and `ARRAY`
match 210 bytes of code fields and bodies at their game addresses. The check also
executes range-boundary and cursor tests. It excludes dictionary headers and a
full game rebuild; `PAUSE` is checked by bytes because the test does not simulate
clock interrupts.

After building AD2044, run from its directory with a local GAM-Forth checkout:

```sh
.venv/bin/python tools/check_gam_forth.py /path/to/gam-forth
```
