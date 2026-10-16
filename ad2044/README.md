# A.D. 2044: Sexmisja

A reconstruction of the game's Forth executable, with editable rooms, maps,
pictures and text. The executable retains the original addresses and bytes.
The disks are packed afresh: old editor records, historical saves, abandoned
resources and disk padding are not source files.

![Rebuilt game running in Atari800](img/first-room.png)

Start with [room 01](rooms/01), a small corridor. Its
[scene](rooms/01/scene.txt) places the [picture](rooms/01/base.png) and
[hitmap](rooms/01/base.hit.txt). A `2` in the hitmap selects
[zone 02](rooms/01/actions/02.txt): use the right exit, or examine “KORYTARZ.”
The [world map](world/map.txt) supplies that room's position, facing and open
exits. Initially, room 01's right exit leads to room 02.

| Where | What to edit |
| --- | --- |
| [world/map.txt](world/map.txt) | Room coordinates, facing, map glyphs and open directions |
| [world/initial.txt](world/initial.txt) | Starting room, energy, inventory and puzzle cells |
| [rooms/00…36](rooms) | One folder per room; pictures, hitmaps, actions and initial views |
| `rooms/NN/room.txt` | Which drawable objects initially appear in each view |
| `rooms/NN/scene.txt` | Picture positions, Atari colors and resource IDs |
| `rooms/NN/*.png` | Editable four-color indexed pictures and animation frames |
| `rooms/NN/*.hit.txt` | Character grids identifying clickable zones |
| `rooms/NN/actions/NN.txt` | One zone's actions, parameters and displayed messages |
| [items](items) | Inventory pictures and actions, grouped into the engine's four-item banks |
| [interface](interface) | Title, screen frame, fonts and cursor |
| [text](text) | Credits and prologue, one short text file per message/page |
| [ending](ending) | Ending background, frames and message |
| [music/ad2044.snd](music/ad2044.snd) | Original custom music/effects bank; binary for now |
| [src/30-game.fth](src/30-game.fth) | Game logic; framework and kernel are beside it |
| [tools](tools) | Builders, validation and optional recovery tools |
| `build/` | Generated disks, compiler, packing report and research catalogs; ignored by Git |

[Room format notes](rooms/README.md), [inventory notes](items/README.md) and
[world notes](world/README.md) explain the numeric IDs and engine limits.
The numbers are runtime identities, not disk addresses. Lengths, compression,
sector positions and the directory are calculated by the builder.

## Build

Python 3 and the pinned `py65` dependency are required for host compilation:

```sh
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
make PYTHON=.venv/bin/python
make test PYTHON=.venv/bin/python
```

Outputs are `build/ad2044-side1.atr`, `build/ad2044-side2.atr` and
`build/sources.atr`. The APX compiler itself is generated from the readable
sources in [../util/figforth](../util/figforth), as `build/figforth.atr`.
No original ATR or downloaded binary is required.

The first build executes the original APX fig-Forth compiler on an emulated
6502 and takes several minutes. Its result is cached under `build/program/`.
Subsequent room, text, map, font and picture edits only repack resources and
combine them with that executable. Music and cursor are embedded in the
executable, so changing either requires Forth compilation too.

`make assets` packs resources only. `make sources` packs the ASCII Forth
screens. `make music` exports SAP listening files. `make test-content` exercises the authoring formats without compiling
Forth. `make verify` checks the original executable bytes and the current
source-generated assets; it deliberately does not require the old disk layout.
A changed executable intentionally fails that release-matching check.

The game requires writable disks. A new build starts both the initial-state
and save slots from [world/initial.txt](world/initial.txt). In-game save/load
then modifies only the generated disks, not source files. Repacking resets
that save; keep personal saved disks separately.

## Compile on Atari

Mount `build/figforth.atr` as D1, `build/sources.atr` as D2 and a writable copy
of `build/assets-side1.atr` as D3. At the Forth prompt enter:

```forth
HEX 1000 2463 ! 1000 OFFSET ! 1 LOAD
```

D3 becomes the bootable first game disk. Use it with `build/ad2044-side2.atr`.
The source disk contains ordinary ASCII Forth; the packer expands the two
`INCBIN` directives into byte-emission statements before writing its screens.

## Forth and recovery

These are reconstructed sources, not Roland Pantola's original listings.
`src/10-kernel.fth`, `src/20-framework.fth` and `src/30-game.fth` reconstruct
the kernel, GAM framework and game. Native 6502 routines use assembler
mnemonics. Absolute pointers mean that resizing definitions requires deliberate
address and branch adjustments; the resource builder cannot relocate code.
All Forth files remain ASCII with lines at most 64 characters long.

The 901 recovered dictionary entries have 473 recovered/matched names,
425 inferred descriptive names and three unresolved address names.
[tools/names.json](tools/names.json) retains the naming evidence and
[tools/recovery-notes.txt](tools/recovery-notes.txt) explains the analysis.
Optional decompilation writes large dictionaries, symbol lists and string
catalogs under `build/research/`. They are reports, not build inputs.
Historical extraction tools need an original fixture as described in
[reference/README.md](reference/README.md).

This layout is the first simplification pass. Klątwa and Władcy Ciemności
still use their existing asset manifests pending review of this version.
