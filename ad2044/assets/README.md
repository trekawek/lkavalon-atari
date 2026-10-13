# AD2044 disk asset sources

`layout.json` assembles both 1040-sector disks from individual native Atari
records. Paths in its `parts` entries are relative to the `ad2044` directory.
The normal asset build does not read either original game ATR.

The layout references 350 existing bitmap/font records in `graphics/packed/`
and the following files here:

- `records/`: 323 other live records: 217 hit maps, 102 collection metadata
  records, two introduction records and two one-byte graphic references.
- `state/`: separate 896-byte initial and saved game states. Their contents
  differ and must remain separate.
- `padding/`: 32 nonzero collection tails, including record terminators and
  unused bytes left by the original editors. All-zero regions are implicit.
- `archive/`: 46 records from five retired inventory collections, one retired
  introduction record, and the 89-byte post-program editor residue. The
  retired records occupy unallocated sectors and are preserved for exact
  reconstruction; editing them does not change the live resources.
- `reserved/sector-1024.bin`: an identical reserved sector on both sides.
  Its purpose is not established; it is not identified as DOS metadata.

Each `counted16` file includes its two-byte little-endian payload length.
These native packed records are build inputs. PNG previews, decoded images,
composed scenes and SAP playback wrappers are derived views, not disk inputs.
The build validates each declared file size and counted-record length.
Same-size native edits affect the assembled disk; resizing requires updating
its layout and respecting the game's allocation and record boundaries.

Sector 500 is generated from the side ID and group sector counts. It is
excluded from group contents: side-one group 11 and side-two group 17 cross
this directory hole. Inventory groups 21 and 23 each contain nine independent
512-byte collections; the initial and saved versions are intentionally kept
separate. Record terminators and nonzero trailing bytes are preserved.

The side-one asset template leaves its first 33,959 payload bytes blank for
the Forth compiler. The following 89 bytes, at ATR offsets `$84B7..$850F`,
share the compiler's final partial sector and must be present before its
`T-FINISH` operation. The cursor bitmap and custom sound bank are inside the
compiled program; they belong to the Forth source build rather than the disk
writes in this manifest.

The import was checked against the previous `side1-tail.bin` and
`side2-data.bin` inputs and independently against both supplied release ATRs.
Every non-program byte matched. The only intentional header difference is
clearing ATR byte 15 to make the generated disks writable. The opaque inputs
were then removed; they are not needed to rebuild either disk.

Original media and resource provenance remain documented in the main README,
`graphics/extraction.json` and `music/extraction.json`.
