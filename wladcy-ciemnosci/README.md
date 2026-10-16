# Władcy Ciemności

Reconstructed ASCII Forth code with editable rooms, actions, maps, graphics
and music. The boot-loaded executable matches the original game. The disk is
packed afresh; old editor residue, physical allocation manifests, duplicate
previews and historical saves are not authoring inputs.

![Rebuilt game running in Atari800](img/first-room.png)

Start with [room 01](rooms/01). Its [scene](rooms/01/scene.txt) lists the
background layers and Atari colors. [objects.txt](rooms/01/objects.txt) supplies
initial objects and close-ups. [actions.txt](rooms/01/actions.txt) connects hit
zones to the shared action collections in [stage 1](stages/1/actions.txt).
[world/map.txt](world/map.txt) holds the ordinary room connections.

| Where | Meaning |
| --- | --- |
| [rooms](rooms) | 24 room folders, each with scene, object state and action selectors |
| [world/map.txt](world/map.txt) | Room, clicked zone, destination and direction label |
| [world/initial.txt](world/initial.txt) | Initial executable fields; starting a game still enters room 1 |
| [world/powers.txt](world/powers.txt) | Initial power slots and displayed names |
| [world/puzzles.txt](world/puzzles.txt), [progress.txt](world/progress.txt) | Puzzle cells and room achievement bits |
| [stages/1](stages/1), [stages/2](stages/2) | Shared pictures, hit/depth grids and action collections |
| `stages/N/art.txt` | Picture positions and the resource/frame IDs used by the engine |
| `stages/N/art/*.png` | Editable indexed pictures, four pixel values |
| `stages/N/art/*.hit.txt` | Editable grids of clicked zones and depth values |
| [items](items) | Item pictures, actions and starting coordinates for both stages |
| [interface](interface) | Title art, readable title pages, fonts and hardware cursor |
| [text](text) | Separate game messages referenced by the engine |
| [music](music) | Native title/gameplay CMC modules |
| [src](src) | Forth kernel, GAM framework, native assembler and game logic |
| `build/` | Generated ATRs, compiler, packing report, previews and research catalogs |

The stages share art between rooms. Stage 1 contains rooms 1–15; stage 2
contains rooms 16–24. Numeric resource and action IDs are runtime identities,
not disk offsets. Lengths, compression, sector counts and placement are generated.
[Format notes](../util/gam-content-format.md) explain each small text format.

## Build

Keep the sibling `ad2044` and `util` directories. Python 3 and the pinned
`py65` package are required for compilation on the host:

```sh
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
make PYTHON=.venv/bin/python
make test PYTHON=.venv/bin/python
```

Outputs are `build/wladcy-ciemnosci.atr` and `build/sources.atr`. The compiler itself is
generated as `build/figforth.atr` from [readable APX sources](../util/figforth).
No original ATR or network download is a build input.

The first build runs the original APX compiler on an emulated 6502 and takes
several minutes. Its executable is cached in `build/program/`. Picture, map,
action, message and CMC edits then only repack resources and link the disk.
Initial world state, item coordinates, room objects and the hardware cursor
are embedded in the executable, so editing those also recompiles Forth.

`make assets` packs resources; `make sources` packs ASCII Forth screens;
`make music` generates listening exports under `build/music`.
`make test-content` checks authoring formats. `make verify` checks the released
executable code, the current authored initial world, and freshly built resources.
With the supplied sources it also confirms that every loaded executable byte
matches the original. Intentional Forth code or cursor changes require updating
the release signature; ordinary `make` still builds them. Resource edits can
change the disk layout. Oversized banks and unsafe resource buffers are rejected.

The disk is writable. Its save slot starts from the authored initial state
with room 1 and stage 1 selected. Saving in the game modifies the generated
disk. Repacking resets that slot, so keep personal saved disks separately.
The startup word explicitly enters room 1; `boot-room` is the pre-menu cell,
not a setting for choosing a different starting room.

The supplied emulator scenario checks the menu, first room and joystick.
With Atari800, Xvfb and Python Xlib installed, run from this directory:

```sh
python3 ../ad2044/tools/emulate.py build/wladcy-ciemnosci.atr \
  --scenario tools/emulate-smoke.json --output build/runtime-validation
```

## Compile on Atari

Mount `build/figforth.atr` as D1, `build/sources.atr` as D2 and a writable copy
of `build/assets.atr` as D3. Disable BASIC and enter:

```forth
HEX 1000 2463 ! 1000 OFFSET ! 1 LOAD
```

After the completion message, D3 is the game disk. `INCBIN` inputs are expanded
to ASCII Forth before packing the source ATR, including the generated initial
state. The source disk needs no host tools when compiling on Atari.

## Code and recovery

These are reconstructed sources, not the author's missing game listings.
Forth and assembler words retain their original addresses; resizing code
requires deliberate relocation. Native routines use 6502 mnemonics. The
interleaved headers and fixed addresses of initial state are generated by
[gam_world.py](../util/gam_world.py), leaving editable values in the room,
world and item files. All Forth files remain ASCII, at most 64 columns wide.

[tools/names.json](tools/names.json) and
[tools/inferred-names.json](tools/inferred-names.json) retain naming evidence;
[tools/recovery-notes.txt](tools/recovery-notes.txt) explains inferred behavior.
Optional `make research` regenerates listings and writes large catalogs under
`build/research/`; it is not part of a normal build. Original fixtures are
optional forensic material described in [reference/README.md](reference/README.md).

GAM-Forth is the common foundation. The [preserved author sources](https://github.com/ptodt/gam-forth)
help recover definitions, but are not a replacement for game-specific routines.
The current build uses the local reconstruction. The separate
[AD2044 compatibility investigation](../ad2044/README.md#relationship-to-the-original-gam-forth)
describes a possible later source-level integration.

Władcy has 24 active rooms. Three obsolete room layouts were removed. Its
stored walking sprite bank is retained as editable PNGs, but its use in this
first-person game has not been established. Both fonts contain 1,024 bytes.

The gameplay CMC file includes six restored bytes that the original player
reads from adjacent title-music memory. Packing verifies those bytes and writes
only the original 1,899-byte gameplay resource. The title module keeps its
original load address; moving it would break that overlap. Music listening
exports preserve the complete restored module.

The original games and assets remain the work of their original authors.
