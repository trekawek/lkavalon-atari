# Klątwa

Reconstructed ASCII Forth code with editable rooms, actions, maps, graphics
and music. The build generates a playable ATR whose boot-loaded executable
matches the original game.

![Rebuilt game running in Atari800](img/first-room.png)

Start with [room 01](rooms/01). Its [scene](rooms/01/scene.txt) lists the
background layers and Atari colors. [objects.txt](rooms/01/objects.txt) supplies
initial objects and close-ups. [actions.txt](rooms/01/actions.txt) connects hit
zones to the shared action collections in [stage 1](stages/1/actions.txt).
[world/map.txt](world/map.txt) holds the ordinary room connections.

| Where | What to edit |
| --- | --- |
| [rooms](rooms) | 30 room folders, each with scene, object state and action selectors |
| [world/map.txt](world/map.txt) | Room, clicked zone, destination and direction label |
| [world/initial.txt](world/initial.txt) | Initial executable fields; gameplay starts in room 1 |
| [world/spells.txt](world/spells.txt) | Initial spellbook slots and displayed names |
| [world/puzzles.txt](world/puzzles.txt), [progress.txt](world/progress.txt) | Puzzle cells and room achievement bits |
| [stages/1](stages/1), [stages/2](stages/2) | Shared pictures, hit/depth grids and action collections |
| `stages/N/art.txt` | Picture positions and the resource/frame IDs used by the engine |
| `stages/N/art/*.png` | Editable indexed pictures, four pixel values |
| `stages/N/art/*.hit.txt` | Editable grids of clicked zones and depth values |
| [items](items) | Item pictures, actions and starting coordinates for both stages |
| [interface](interface) | Title art, fonts and hardware cursor |
| [interface/pages.txt](interface/pages.txt) | All title pages, with numbered sections |
| [player](player) | Four directions with five PNG animation frames each |
| [stages/2/messages.txt](stages/2/messages.txt) | The four shared second-stage messages, inline under their resource IDs |
| [music](music) | Native title/gameplay CMC modules |
| [src](src) | Forth kernel, GAM framework, native assembler and game logic |
| `build/` | Generated ATRs, compiler, packing report, previews and research catalogs |

The stages share art between rooms. Stage 1 contains rooms 1–22; stage 2
contains rooms 23–30. Resource and action IDs identify runtime records.
The builder calculates their lengths, compression and disk placement.
Room notices are quoted directly in `scene.txt`; action messages stay beside
their actions.
[Format notes](../util/gam-content-format.md) explain each small text format.

## Build

Follow the [shared build instructions](../FORTH.md#build), selecting `klatwa`.
The guide also covers [faster compilation with PyPy](../FORTH.md#faster-compilation)
and [available Make targets](../FORTH.md#build-targets).

| Output | Purpose |
| --- | --- |
| `build/klatwa.atr` | Playable game disk |
| `build/sources.atr` | ASCII Forth source screens |
| `build/figforth.atr` | APX fig-Forth compiler |
| `build/assets.atr` | Resource disk used as D3 for [compilation on Atari](../FORTH.md#compile-on-atari) |

Initial world state, item coordinates, room objects and the hardware cursor
are embedded in the executable. Editing them recompiles Forth. Resource sizes
are checked against the engine's [memory and disk limits](../util/gam-content-format.md#generated-output-and-limits).

The disk is writable. Its save slot starts from the authored initial state
with room 1 and stage 1 selected. Saving in the game modifies the generated
disk. Repacking resets that slot, so keep personal saved disks separately.
The startup word explicitly enters room 1; `boot-room` describes the pre-menu
cell and does not select the starting room.

The supplied emulator scenario checks the menu, first room and joystick.
With Atari800, Xvfb and Python Xlib installed, run from this directory:

```sh
python3 ../ad2044/tools/emulate.py build/klatwa.atr \
  --scenario tools/emulate-smoke.json --output build/runtime-validation
```

## Code and recovery

The [Forth source guide](../FORTH.md#forth-sources) explains the compiler,
GAM-Forth foundation and fixed-address code. [gam_world.py](../util/gam_world.py)
generates the initial state's interleaved dictionary headers from editable
room, world and item values.

[tools/names.json](tools/names.json) and
[tools/inferred-names.json](tools/inferred-names.json) retain naming evidence;
[tools/recovery-notes.txt](tools/recovery-notes.txt) explains inferred behavior.
`make research` uses the generated game disk to regenerate Forth listings and
naming evidence, with diagnostic catalogs in `build/research/`.
See [validation and reference material](../FORTH.md#validation-and-reference-material)
and the [Klątwa reference metadata](reference/README.md).

## Graphics details

Klątwa's walking animation is active gameplay content. Hitmaps combine object
IDs with depth/occlusion information. Some background pictures extend to
114 rows although the visible scene is 112 rows.
The two fonts contain 1,023 bytes each, matching what the game loads.
See the shared [graphics guide](../FORTH.md#graphics) for PNG editing rules.
