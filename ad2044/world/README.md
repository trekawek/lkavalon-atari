# World and initial state

Edit `map.txt` to change room coordinates, orientation, map glyphs and initially
open exits. Room IDs are stable because action scripts refer to them. The map
columns are:

- `id`: room00..36.
- `floor`: the fixed executable's room range, or `shared` for rooms14 and30.
  The builder validates it; moving a room between floors requires a code change.
- `x y`: map coordinates0..7. These become the high/low nibbles of a position byte.
- `facing`: north, east, south or west. Relative exits rotate by this orientation.
- `glyph`: selector0..7 for the first of two map-font glyphs. This is not a floor.
- `visited`: whether the room's map marker is initially visible.
- `exits`: comma-separated `forward,right,back,left`, or `-` for none.

For example, room01 faces north; forward leads to room09, right to room02 and
left to room00. Rooms14 and30 are shared between floors, so their destinations
depend on the current floor. Some shared-room/floor combinations have no matching
adjacent room; keep their exits closed unless the action scripts support them.
The game computes destinations from coordinates rather than storing a fixed graph.

Each `../rooms/NN/room.txt` contains initial drawable lists, one `view N:` line per
base scene or closeup. A view number also selects its bitmap/hit-map pair. IDs1..100
refer to pictures in that room, while102..137 select the nine four-item inventory
banks. Zero means an empty slot: preserve enough empty slots for objects that can
appear or be dropped during play. Overlay order follows list order. Removing an
object writes zero; adding one uses the first empty slot. The builder allows list
sizes to change within the fixed462-byte state allocation and rejects overflow.

`initial.txt` controls starting room, energy, current map floor, four carried item
IDs and sixteen puzzle cells used by action scripts. `legacy-ubr` preserves the
original UBR variable; no gameplay reader has been established. Inventory zero
means an empty carried-item slot. The original four UI positions are generated.
Initial map-floor values are limited to 0..5. Original floor entries 6..8 refer
to unauthored room 38, and entry 9 is a table sentinel. Room 35 cannot be a
starting room because its disk group contains the ending rather than a normal
scene. These checks apply to new-game state; existing elevator actions retain
their original parameters.

The generated896-byte initial state also contains live Forth headers, array
runtime pointers and the beginning of the disk-save routine. `tools/world.py`
generates these invariant structures at their original addresses; they are not
editable world data. Unused list capacity and unused room-table entries are zero.
A fresh saved-game area is initialized from this same state; save writes replace
it during play. The historical playthrough snapshot is not a game asset.

Logical disk groups are allocated automatically by `tools/disk.py`. Side-one
rooms00..13 use groups5..18; side-two rooms14..34 use groups1..21. Side-two group22
is the ending, and group23 is room36's disk-check failure scene. Room35's state
entry remains reserved for the ending layout. Group indices must stay fixed, but
resource offsets and sector counts are calculated from encoded sizes. Directory
sector500 is skipped. Both disks retain1040 sectors, including sectors907/908
which the original disk gate reads for status rather than content.

The program reserves side-one groups1/2 at255/25 sectors. State groups19/20 are
seven sectors each, and inventory groups21/23 are nine512-byte blocks each.
Other groups are rounded up and padded with generated zeroes. Title group 3 must
fit 36 sectors. Gameplay groups must fit 39 sectors (4,992 bytes), ending below
the live picture-overlay scratch buffer at $A4E8. The larger range cleared by
the game is shared with scratch data, so it is not all available for resources.
These bounds are tighter than the loader's nominal 80-sector argument.
Retired editor data, historical save contents and unallocated sector residue do
not belong in the authored world.
