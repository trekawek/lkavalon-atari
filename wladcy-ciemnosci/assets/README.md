`layout.json` lists the inputs used to build `build/assets.atr`. Run `make
assets` from the game directory to repack them. The first 32,000 payload
bytes remain zero until fig-Forth compiles the program into that disk.

The authoritative inputs are:

- `graphics/records/*.bin`: native GAM record payloads, including compressed
  pictures, hit maps, action records and text. The packer generates their
  two-byte length prefixes.
- `graphics/fonts/*.fnt`: the two original 1,024-byte fonts.
- `graphics/sprites/*.bin`: the 20 stored player-frame pixel arrays.
  `structure/player-bank-*.bin` preserves their nested record lengths,
  positioning headers and allocation residue. Their gameplay use is unverified.
- `music/*.cmc`: the playable modules, with their original load headers.

The gameplay CMC contains 1,905 bytes, but its disk resource contains only the
first 1,899. The final six bytes, `00 FF FF B9 8C A8`, reproduce bytes retained
in runtime memory after loading the title. They are checked and omitted when
packing; modifying them is rejected rather than silently ignored. The title
CMC's 164 extra on-disk resource bytes are preserved separately in
`padding/title-cmc-tail.bin`.

The corresponding font, sprite-bank and music records in `graphics/records`
are extraction copies and are not also packed. PNGs, decoded compressed-image
previews, complete room/title bitmaps and `graphics/groups` are derived exports.
Use `python3 ../util/pack_assets.py --game-dir . --dependencies` for the exact
list of inputs. The cursor stored inside the program is handled separately by
`util/forth_assets.py` during source compilation.

`filesystem/vtoc.bin` preserves the DOS allocation map; `state/saved-game.bin`
preserves the release's saved-game slot. Small files under `padding` retain
nonzero allocation residue. Other unused bytes are generated as zeros, and
the GAM directory is generated from the manifest.

Edits must preserve each declared input size and fixed CMC header. An invalid
size or overlapping placement is an error. Reference comparison and extraction
checks intentionally detect changes from the released game; they are separate
from packing edited assets. The normal packer never reads the reference ATR.
