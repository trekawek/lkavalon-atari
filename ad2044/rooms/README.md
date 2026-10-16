# Editing rooms

Start with [00](00), the hibernation room. Each numbered directory keeps the
room's pictures, clickable areas and actions together. Room IDs are decimal and
stable: actions elsewhere can refer to them.

| File | What to edit |
| --- | --- |
| `room.txt` | Objects initially visible in each view or closeup. |
| `scene.txt` | Picture positions, Atari colors and resource IDs. |
| `base.png`, `image-NN.png` | Indexed, four-color picture pixels. |
| `*.hit.txt` | Grids assigning clickable zones to areas of a picture. |
| `actions.txt` | Actions and messages, with one `[NN]` section per clickable zone. |
| `frame-NN.png` | Animation frames, where present. |

Room coordinates, facing and open exits live in [world/map.txt](../world/map.txt).
Starting room, energy and carried items live in
[world/initial.txt](../world/initial.txt). See the [world guide](../world/README.md)
for directions and puzzle state.

## Views, pictures and actions

These are three separate sets of IDs. For example, [00/room.txt](00/room.txt)
contains:

```text
view 0: 0 0 0
view 1: 0 5 6 102 103 0
```

View 0 draws `base.png` automatically, even though its overlay list is empty.
View 1 selects `image-01.png` as its base and overlays local pictures 5 and 6,
then inventory items 102 and 103. Zero is an empty overlay slot. Keep spare slots
for objects revealed or dropped during play; the game inserts into the first
empty slot. Overlay order follows list order. Views are closeups, not compass
directions.

The build checks initially visible overlays against their base picture and
clickable grid, including the game's fixed buffer limits. Objects revealed
later by actions must also have matching picture and hitmap bounds in the view
where they appear; the builder does not explore every later puzzle state.

Local drawable N uses picture resource `2*N+2` and hitmap resource `2*N+3` in
`scene.txt`. Thus drawable 5 uses resources 12 and 13. Inventory drawable IDs
102..137 use the shared [item banks](../items/README.md).

A hitmap value selects an **action zone**, independently of the picture's ID.
For example, a `4` in a room's grid selects section `[04]` in `actions.txt`. `.` means no zone;
digits and letters have their base-36 values (`A=10`, `B=11`, and so on).
Value `1` is special: it opens the direction chooser rather than action zone 1.
A `legend A=102` line overrides a symbol to select an inventory item. Preserve
the grid's declared width and height when editing cells; changing a picture does
not automatically resize or repaint its clickable grid.

## Moving and recoloring a picture

This row from [00/scene.txt](00/scene.txt) places the base picture:

```text
picture 2 base.png 10 8 24,F8,FD,A2,00
```

The columns are resource ID, filename, X, Y and colors. X is in
four-pixel units; changing 10 to 11 moves the image four logical pixels right.
Y is in scanlines. Width and height come from the PNG. Positioned pictures must
fit the 160 by 104 logical-pixel screen, and their width must be a multiple of
four.

Follow the shared [graphics format](../../FORTH.md#graphics) when editing PNGs.
The five comma-separated values in `scene.txt` are hexadecimal bytes. The first
three supply the room's playfield colors; retain the last two unless changing
their native behavior deliberately. `-` means the picture has no color block.
The builder selects compression flags automatically. Room 25's base picture
uses the explicit decimal flag `19` in an optional final column.

Resource IDs must stay consecutive. Animation scripts can address frame
resources directly, so preserve their numbers. Room 32's `placeholder` rows
retain single-byte unused entries; they are not aliases to other pictures.

## Editing an action or message

Section `[02]` in [00/actions.txt](00/actions.txt) is a small example:

```text
[02]
use-relative-exit relative_direction=0
examine
  message_1:
    "KORYTARZ."
```

Each room keeps all its zones in one `actions.txt`. The section number is the
clickable zone. Keep sections consecutive from zero, including empty sections.
Action parameters are decimal. Two spaces introduce
continued parameters or a message field; four spaces introduce a quoted message
line. An empty message block is valid. Quoted text uses uppercase game glyphs,
including `ĄĆĘŁŃÓŚŹŻ`, for example `"NÓŻ DO PAPIERU."`. The narrow gameplay font
uses the same byte `$7A` for `Ż` and `Ź`; the builder accepts either spelling.
Unsupported or inverse glyphs retain exact escapes such as `"\\xFF"`. The
doubled backslash is required inside a quoted line.
Long text may need manual line breaks to fit the game's display.

Use the shared [build instructions](../../FORTH.md#build) after an edit.
The [content tests](../../FORTH.md#build-targets) check parsers and builders.
Record lengths, compression and disk placement are generated. The executable
fixes the available room IDs, action kinds and memory limits.

## Special rooms

- Rooms [14](14) and [30](30) are elevators shared between map floors.
- Room [35](35) retains an initial-state entry for the ending; edit its actual
  pictures and message in [ending](../ending).
- Room [36](36) is the disk-check failure notice, with an empty clickable grid
  and no action collection.
