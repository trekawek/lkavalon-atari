# Editing inventory items

Items use global IDs starting at 102. Each directory contains one four-item bank:
`102-105`, `106-109`, and so on. Empty positions need no picture. The sources
contain items 102..120 and 122; the remaining reserved banks are generated
empty. Keep the existing IDs because room overlays and action parameters use
them.

Each bank has `scene.txt`, indexed `item-NNN.png` pictures, matching `*.hit.txt`
grids and one `actions.txt` file. Picture positions, colors, grid syntax and
message syntax work as described in the [room guide](../rooms/README.md).
An item's scene position is used when it appears in a room; the game adjusts its
position when drawing it in a carried-item slot or dropping it.

The IDs inside a bank differ from its global item IDs:

| Global item in `102-105` | Local drawable | Picture / hitmap resources | Action zone |
| --- | --- | --- | --- |
| 102 | 0 | 2 / 3 | 2 |
| 103 | 1 | 4 / 5 | 3 |
| 104 | 2 | 6 / 7 | 4 |
| 105 | 3 | 8 / 9 | 5 |

The same local numbering repeats in every bank. For example,
[102-105/item-102.hit.txt](102-105/item-102.hit.txt) defines `legend A=102`.
Selecting an `A` switches to that item's bank and selects action zone 2, section
`[02]` in [102-105/actions.txt](102-105/actions.txt):

```text
[02]
examine
  message_1:
    "JAKIŚ OWOC"
eat object_id=102 energy_added=70
  message_1:
take-item
```

Changing `energy_added=70` to `80` changes the energy gained from eating this
item. Editing the quoted line changes its description. Keep the empty message
block: this action still requires that field. Zones 0 and 1 are retained entries,
so keep their sections even when they contain no actions.

To put an item in the initial scene, add its global ID to the appropriate
`view N:` list in `rooms/NN/room.txt`. To start with it carried, edit one of the
four `inventory:` values in [world/initial.txt](../world/initial.txt); zero means
an empty carried slot. Those four slots are separate from the four-item resource
banks.

Use the shared [build instructions](../../FORTH.md#build) to rebuild the disks.
The executable reserves 512 bytes for each bank, including its compressed
pictures, hitmaps and actions. The builder checks this limit and generates
padding and fresh saved inventory automatically.
