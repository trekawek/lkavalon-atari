`layout.json` lists the inputs used to build `build/assets.atr`. Run `make
assets` from the game directory to repack them. The first 32,000 payload
bytes remain zero until fig-Forth compiles the program into that disk.

The authoritative inputs are:

- `graphics/records/*.bin`: native GAM record payloads, including compressed
  pictures, hit maps, action records and text. The packer generates their
  two-byte length prefixes.
- `graphics/fonts/*.bin`: the two original 1,023-byte font records.
- `graphics/sprites/*.bin`: the 20 uncompressed player-frame pixel arrays.
  `structure/player-bank-*.bin` preserves their nested record lengths,
  positioning headers and allocation residue.
- `music/*.cmc`: the playable modules, with their original load headers.
  Gameplay adds five zero bytes on disk; the title's six extra resource bytes
  are preserved in `padding/title-cmc-tail.bin`.

The corresponding font, sprite-bank and music records in `graphics/records`
are extraction copies and are not also packed. PNGs, decoded compressed-image
previews, complete room/title bitmaps and `graphics/groups` are derived exports.
Use `python3 ../util/pack_assets.py --game-dir . --dependencies` for the exact
list of inputs. The cursor stored inside the program is handled separately by
`util/forth_assets.py` during source compilation.

`filesystem/vtoc.bin` preserves the DOS allocation map; `state/saved-game.bin`
preserves the release's saved-game slot. Small files under `padding` retain
nonzero allocation residue, including unused sector 709. Other unused bytes
are generated as zeros. The GAM directory is generated from the manifest.

Edits must preserve each declared input size and fixed CMC header. An invalid
size or overlapping placement is an error. Reference comparison and extraction
checks intentionally detect changes from the released game; they are separate
from packing edited assets. The normal packer never reads the reference ATR.
