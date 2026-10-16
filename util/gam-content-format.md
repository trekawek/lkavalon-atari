# Editing Klątwa and Władcy Ciemności

Both games use the same authoring formats. Files contain decimal numbers unless
explicitly marked otherwise. A line starting with `#` is a comment. The builder
calculates compression and disk placement from these files.

## Follow a room

Open `rooms/01/scene.txt`: `stage` selects its shared art, `colors` supplies
three hexadecimal Atari playfield colors, and `layers` gives the background
drawing order. Layer `N` selects resource N, frame 0; `100+N` selects frame 2.
Ordinary scene-layer IDs must stay below 200. Some resources also contain
frame 4 for direct animation calls in Forth; `200+N` does not select that frame
from a room's drawing list. A `notice` is either `none` or quoted lines written
directly in the scene, for example `notice "PRACOWNIA" "ALCHEMIKA"`.
These descriptions are copied into a small runtime buffer.

Open the stage's `art.txt` to find each picture and paired hitmap:

```text
picture 003 0 art/003-0.png 0 0
hitmap  003 1 art/003-1.hit.txt
```

The picture's last two values are x in **bytes** and y in pixels. One bitmap
byte holds four horizontal pixels. Atari color registers in `scene.txt`
control the displayed colors. See the shared [graphics guide](../FORTH.md#graphics)
for PNG pixel formats, palettes and display proportions.

Variants 0/2/4 normally pair with hitmaps 1/3/5. `-` means a direct resource,
used by item pictures and the scene cursor. A `placeholder` reserves a one-byte
resource slot, preserving the indices of subsequent records.
The builder derives record lengths and column compression from current pixels.

## Hitmaps and actions

A `.hit.txt` file has a `size`, an optional `legend`, and a character grid.
The grid supplies the cell values.
Dots represent zero. Without a legend, `1`–`9` mean 1–9, `A`–`Z` mean 10–35,
and `a`–`z` mean 36–61. A declaration such as `legend A=192` overrides that
symbol for this file; the grid still stores the full byte, 0–255.
The values identify clickable regions and, especially in Klątwa, depth for the
walking character. They are not transparency. The engine transforms coordinates
and some values before looking up the room's object selector.

One grid cell spans one bitmap byte horizontally (four logical PNG pixels)
and six bitmap rows vertically. A paired hitmap follows the picture's position
relative to the active view; vertical placement uses the offset divided by six.
The main-room map has twice the width of its first stored grid, allowing the
remaining picture layers to fill it. Main-room clicks use the low five bits of
the stored value (`value % 32`); close-ups retain the full value. Keep depth
bits when changing a clickable zone in Klątwa.

`rooms/NN/actions.txt` maps those selectors to shared action collections:

```text
object 03 06 destination
object 17 21 109
```

The first line chooses collection `[06]` from `stages/N/actions.txt` and gets
its target from the matching room/zone row of `world/map.txt`. The second
chooses collection `[21]` with metadata value 109. Metadata belongs to the
chosen handler; it can mean a drawable, view, item or puzzle argument. A
`message` followed by quoted lines stores a local inline message. The runtime
searches repeated selectors in source order and uses the first match.

Shared collections have one section per ID. For example:

```text
[06]
approach facing=2 run=1 x=18 y=19 final=2
enter-room
```

Both games store approach metadata; Klątwa uses it for walking.
`control=` and `legacy=` preserve small fields whose
full behavior is not established. Action names and parameter names describe
recovered behavior; unproved parameters keep neutral names.

`world/map.txt` lists ordinary connections as room, zone, destination and a
direction label. The label describes the exit; the destination number feeds
`destination` fields in the room selectors. Named action handlers in
`src/30-game.fth` implement gated transitions, stage changes and
puzzle-dependent movement.

## Initial objects, inventory and puzzles

`rooms/NN/objects.txt` contains initial mutable drawing lists. View 0 is the
main room; later views are close-ups. Zero reserves an empty slot. Drawable
IDs below 200 select scene art. In close-ups and inventory, IDs 202 and above
select item art. The main-room drawing path has no item dispatch, so it must
use scene IDs. Room 00 is special: its view 1 is the inventory list.

`items/1` and `items/2` contain item pictures, hitmaps and actions for each
stage. Item 202 uses direct picture resource 2 and hitmap 3; each subsequent
item advances by two records. Władcy reserves that first pair for messages,
so its drawable items start at 203 (resources 4/5).
`items/positions.txt` supplies the item IDs and
their initial x-byte/y-pixel coordinates, including allocated spare slots.

`world/spells.txt` or `powers.txt` has one slot per line: slot ID, spell/power
ID, two requirement bytes, then `|` and exactly 13 game-font glyphs. Preserve
spaces after `|`. `puzzles.txt` stores indexed 16-bit cells, and `progress.txt`
stores each room's achievement byte. Action parameters refer to these indices.

The state is embedded between live Forth dictionary headers. The builder
generates those headers and verifies the fixed storage capacities. Editing a
value recompiles Forth; increasing the number of rooms, slots or views beyond
their allocations requires a deliberate code/layout change. Starting a new
game explicitly enters room 1. `boot-room` and `boot-part` describe pre-menu
memory and do not override that startup code.

## Text, title and animation

Game messages use quoted Unicode lines. Space becomes the game's blank glyph;
Polish capitals use its custom font slots. Ż and Ź share a stored glyph.
`\\xNN` inside a quoted string preserves an explicit byte, including ornaments
or inverse characters. Each message's line count and each line's byte length
are calculated. Keep individual lines within the game's displayed text width.

Klątwa's `stages/2/messages.txt` holds its four shared messages directly under
resource IDs `[46]` through `[49]`:

```text
[46]
"NIC NIE MOŻESZ ZROBIĆ."
"CZARNOKSIĘŻNIK NIE POZWALA."
```

Władcy has one `messages.txt` per stage. Sections identify the bank and message
used by its game code; both numbers are decimal:

```text
[00 000]
"KARCZMA POD"
"ŚWIŃSKIM RYJEM"

[00 001]
"BRAMA DO NIEBA"
```

Stage 1 has banks 0–3 containing 29, 28, 28 and 1 messages; stage 2 has banks
0–2 containing 26, 21 and 18 messages. IDs start at zero within each bank.
The complete set of IDs must remain present: removing a section fails the
build instead of shifting the messages referenced by the unchanged game code.
Room notices are inline in `scene.txt`; local action messages stay in
`actions.txt` beside the action that displays them.

Both games put all title pages in `interface/pages.txt`, under sections `[00]`
through `[07]` for Klątwa or `[08]` for Władcy. Each quoted line is one displayed
line on that page. Title pages use a font with paired glyphs: `{AUTOR}` expands
to wide letters, and `{~ROLAND PANTOŁA}` uses their inverse forms. Framing tiles
and unusual numeral glyphs use explicit escapes. The title decoder preserves
these font-specific mappings.

Klątwa's `player/frames.txt` gives direction, frame, PNG and sprite offsets.
Four directions each have five frames. Władcy has no walking animation;
its resource 10 is a generated placeholder that preserves the music indices.
`interface/cursor.pmg` is the small native hardware bitmap embedded in Forth.
Fonts use `.fnt` files and music uses `.cmc` files.

## Generated output and limits

`build/packing.txt` shows generated group sizes and sector locations. Group IDs
stay fixed: title 3, stage scenes/items 4/5 and 6/7, save slot 8. Sector 500
contains the generated directory. The builder supplies sector padding.
Runtime bank, cache, hitmap and state capacities are validated independently
of disk capacity; free disk sectors do not imply free Atari RAM.
Live resources and the save slot must finish at sector 767: the loader patch
intercepts sectors 768–1023. The builder checks this limit too.

See [validation and reference material](../FORTH.md#validation-and-reference-material)
for generated-disk checks, source regeneration and comparison with original media.
