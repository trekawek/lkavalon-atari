# Władcy Ciemności

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
| [rooms](rooms) | 24 room folders, each with scene, object state and action selectors |
| [world/map.txt](world/map.txt) | Room, clicked zone, destination and direction label |
| [world/initial.txt](world/initial.txt) | Initial executable fields; gameplay starts in room 1 |
| [world/powers.txt](world/powers.txt) | Initial power slots and displayed names |
| [world/puzzles.txt](world/puzzles.txt), [progress.txt](world/progress.txt) | Puzzle cells and room achievement bits |
| [stages/1](stages/1), [stages/2](stages/2) | Shared pictures, hit/depth grids and action collections |
| `stages/N/art.txt` | Picture positions and the resource/frame IDs used by the engine |
| `stages/N/art/*.png` | Editable indexed pictures, four pixel values |
| `stages/N/art/*.hit.txt` | Editable grids of clicked zones and depth values |
| [items](items) | Item pictures, actions and starting coordinates for both stages |
| [interface](interface) | Title art, fonts and hardware cursor |
| [interface/pages.txt](interface/pages.txt) | All title pages, with numbered sections |
| [stages/1/messages.txt](stages/1/messages.txt), [stages/2/messages.txt](stages/2/messages.txt) | Each stage's messages, grouped by bank/message IDs |
| [music](music) | Native title/gameplay CMC modules |
| [src](src) | Forth kernel, GAM framework, native assembler and game logic |
| `build/` | Generated ATRs, compiler, packing report, previews and research catalogs |

The stages share art between rooms. Stage 1 contains rooms 1–15; stage 2
contains rooms 16–24. Resource and action IDs identify runtime records.
The builder calculates their lengths, compression and disk placement.
Each stage's `messages.txt` contains the complete quoted text under sections
such as `[00 000]` (bank 0, message 0). Inline action messages stay beside their
actions, and room notices belong directly in `scene.txt`.
[Format notes](../util/gam-content-format.md) explain each small text format.

## Build

Follow the [shared build instructions](../FORTH.md#build), selecting `wladcy-ciemnosci`.
The guide also covers [faster compilation with PyPy](../FORTH.md#faster-compilation)
and [available Make targets](../FORTH.md#build-targets).

| Output | Purpose |
| --- | --- |
| `build/wladcy-ciemnosci.atr` | Playable game disk |
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
python3 ../ad2044/tools/emulate.py build/wladcy-ciemnosci.atr \
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
and the [Władcy reference metadata](reference/README.md).

## Graphics and music details

Władcy uses a first-person view without walking animation. Both fonts contain
1,024 bytes. See the shared [graphics guide](../FORTH.md#graphics) for PNG
editing rules.

The gameplay CMC file includes six trailing bytes that the player reads from
adjacent title-music memory. Packing verifies those bytes and emits the
1,899-byte gameplay resource. The title module's fixed load address preserves
that overlap.
