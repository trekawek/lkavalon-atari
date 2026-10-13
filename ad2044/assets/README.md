# AD2044 disk asset sources

`layout.json` assembles both 1040-sector disks from individual native Atari
resources. Paths are relative to `ad2044`. The normal build reads neither
original game ATR. It references 350 bitmap/font records in `graphics/packed/`,
18 retired bitmaps in `graphics/packed/archive/`, and 388 editable JSON documents.
`tools/asset_formats.py` encodes these documents directly, without intermediate
binary files.

- `records/`: 323 live hit maps, object/action tables, editor records, text pages
  and one-byte graphic references.
- `state/`: named fields from separate 896-byte initial and saved RAM snapshots.
  Their contents differ and must remain separate.
- `padding/`: 32 short collection tails, including record terminators and unused
  editor fragments, expressed as fills, text and annotated values. Other
  all-zero disk regions are implicit.
- `archive/`: 18 retired hit maps, ten inventory metadata/action records, an old
  introduction and the 89-byte post-program editor residue. These occupy
  unallocated sectors; editing them does not change live resources. Their 18
  actual bitmap partners remain binary graphics.
- `reserved/sector-1024.json`: an identical reserved sector on both sides. Its
  purpose is not established; it is not identified as DOS metadata.

A manifest `counted16` part encodes a two-byte little-endian payload length
followed by its body. JSON encoders calculate these lengths; native graphics
files already include them. PNG previews, decoded images, composed scenes and
SAP wrappers are derived views. The build validates the encoded size and record
length. Same-size edits affect the assembled disk; resizing requires updating
its layout and respecting the game's allocation and record boundaries.

Sector 500 is generated from the side ID and group sector counts. It is excluded
from group contents: side-one group 11 and side-two group 17 cross this directory
hole. Inventory groups 21 and 23 each contain nine independent 512-byte
collections. Initial and saved versions are intentionally separate. Record
terminators and nonzero trailing bytes are preserved.

The side-one template leaves its first 33,959 payload bytes blank for the Forth
compiler. The following 89 bytes, at ATR offsets `$84B7..$850F`, share its final
partial sector and must exist before `T-FINISH`. The cursor bitmap and custom
sound bank are inside the program and belong to the Forth source build, rather
than this disk manifest.

## Editable formats

Every document has `version: 1` and a format beginning `ad2044.`:

| Format | Editable representation | Native encoding |
| --- | --- | --- |
| `hit-map` | Width, height and rows of object IDs | Width/height bytes, row-major grid, FE run compression, u16 count |
| `object-actions` | Ordered objects, actions, opcode, handler annotation, named parameters and message lines | Nested u16-counted object/action records with explicit terminators |
| `text-pages` | Nested page records and line strings | u16 records; generated message line counts and line lengths |
| `editor-records` | Nested record boundaries, counted labels or small unknown values | u16 records and typed fields; no claimed gameplay meaning for unused leaves |
| `state` | Forth headers, named values, room/view objects, inventory slots, map descriptors, puzzle cells and exit masks | Seven sectors of RAM starting at `$436B` |
| `reference` | Resource ID | One-byte body in a u16-counted record |
| `residue` | Short annotated text/value fragments and fills | Exact unused bytes, with no claimed gameplay meaning |

All 235 live/retired hit maps recompress exactly with the editor's greedy
`FE,count,value` rule: runs of at least three bytes are compressed, `FE` is always
escaped, and runs are limited to 255. Object/action tables expose 839 actions and
474 message groups. Four page documents expose another 41 messages. Encoders
calculate all record/string lengths; the disk manifest enforces allocations.

Strings retain the original printable ASCII *font slots*, not Unicode
translations: `=` is generally a blank glyph, lowercase slots hold Polish
capitals, and punctuation can be decoration. `{"inverse": "TEXT"}` sets bit 7;
`{"glyph": 8}` preserves an unsupported glyph explicitly. This keeps inverse text,
border tiles and spelling reversible. Display translations are not authoritative.

Record order determines object, room and view indices. `object_id`, `room_id`,
`view_id`, `handler`, `name`, `address`, `consumer` and `note` annotate the records;
opcodes and typed values determine their bytes. Action 53 also uses the first
expected-answer glyph as a puzzle-state index; its annotation records that
overlap. Certain action-36 records omit unused expected-answer storage; this is
preserved rather than inventing bytes.

The snapshots include intact Forth names such as `ENERGIA` and `#OB`, dictionary
links and execution fields between the state tables. Their final sector also
includes the start of `SAVE-GAM-GROUP`; identified thread cells are named. No live
consumer has been established for the reserved sector or editor tails. Small
unknown fragments remain explicitly marked as unknown.

All 406 former binary inputs were accounted for: 388 became structured documents
and 18 moved as genuine archived graphics. Every document was encoded and compared
with its entire original byte sequence before its binary input was removed. The
earlier opaque disk tails had also been checked byte-for-byte against both
release ATRs. Generated disks intentionally clear header byte 15 (write protection).
Original media provenance remains in the main README, `graphics/extraction.json`
and `music/extraction.json`.
