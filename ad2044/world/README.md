# World and initial state

Edit [map.txt](map.txt) to change room coordinates, orientation, map glyphs and
initially open exits. Room IDs are stable because action scripts refer to them.
The map columns are:

| Column | Meaning |
| --- | --- |
| `id` | Room 00..36. |
| `floor` | The executable's fixed room range, or `shared` for rooms 14 and 30. Moving a room between floors requires a code change. |
| `x y` | Coordinates 0..7, stored as the high and low nibbles of a position byte. |
| `facing` | North, east, south or west; relative exits rotate by this orientation. |
| `glyph` | Selector 0..7 for the first of two map-font glyphs. |
| `visited` | Whether the map marker is initially visible. |
| `exits` | Comma-separated `forward,right,back,left`, or `-` for none. |

For example, room 01 faces north; forward leads to room 09, right to room 02 and
left to room 00. Rooms 14 and 30 are shared between floors, so their destinations
depend on the current floor. Some shared-room/floor combinations have no matching
adjacent room; keep their exits closed unless the action scripts support them.
The game computes destinations from coordinates.

## Room views

Each `rooms/NN/room.txt` contains initial drawable lists, one `view N:` line per
base scene or closeup. A view number also selects its picture and hitmap. IDs
1..100 refer to pictures in that room, while 102..137 select the nine four-item
inventory banks. Zero means an empty slot: preserve enough empty slots for
objects that can appear or be dropped during play.

Overlay order follows list order. Removing an object writes zero; adding one
uses the first empty slot. The builder allows list sizes to change within the
fixed 462-byte state allocation and rejects overflow. See the
[room guide](../rooms/README.md) for examples and resource numbering.

## Initial state and saves

[initial.txt](initial.txt) controls starting room, energy, current map floor,
four carried item IDs and sixteen puzzle cells used by action scripts.
`legacy-ubr` preserves the original UBR variable; no gameplay reader has been
established. Inventory zero means an empty carried-item slot. The four inventory
screen positions are generated.

Initial map-floor values are limited to 0..5. Floor entries 6..8 refer to
unauthored room 38, and entry 9 is a table sentinel. Room 35 cannot be a starting
room because its disk group contains the ending. These checks apply to new-game
state; elevator actions have their own parameters.

The generated 896-byte state also contains live Forth headers, array runtime
pointers and the beginning of the disk-save routine. [world.py](../tools/world.py)
generates these structures at their fixed addresses. Unused list capacity and
room-table entries are zero. The initial-state and saved-game areas both start
from this state; in-game saves replace the saved copy on the generated disk.
Repacking resources resets that copy.

## Disk groups and memory limits

[disk.py](../tools/disk.py) allocates logical disk groups automatically. Group
indices form part of the executable's interface; offsets and sector counts are
calculated from encoded sizes.

| Contents | Side | Groups | Allocation |
| --- | --- | --- | --- |
| Executable | 1 | 1 and 2 | 255 and 25 sectors |
| Title | 1 | 3 | At most 36 sectors |
| Interface frame and font | 1 | 4 | At most 39 sectors |
| Rooms 00..13 | 1 | 5..18 | At most 39 sectors per room |
| Initial state and saved state | 1 | 19 and 20 | Seven sectors each |
| Initial and saved inventory | 1 | 21 and 23 | Nine 512-byte banks each |
| Rooms 14..34 | 2 | 1..21 | At most 39 sectors per room |
| Ending | 2 | 22 | At most 39 sectors |
| Room 36 disk-check notice | 2 | 23 | At most 39 sectors |

Room 35 has a state entry reserved for the ending. Directory sector 500 is
skipped when writing group data. Both disks have 1,040 sectors, including sectors
907 and 908, which the disk gate reads for status.

Gameplay resource groups must end below the live picture-overlay scratch buffer
at `$A4E8`, limiting them to 39 sectors (4,992 bytes). The larger range cleared by
the game includes scratch data. Group lengths are rounded to whole sectors and
padded with zeroes.
