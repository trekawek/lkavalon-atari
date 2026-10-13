`layout.json` packs `build/assets.atr` from editable sources. Its 32,000-byte
program prefix stays blank until fig-Forth compilation. The normal build reads
neither a reference ATR nor a stored whole GAM group.

- `resources/*.json` describes action dispatch/arguments, nested room records,
  title pages, message banks and player-bank structure. Lengths are generated.
- `graphics/layouts/room-*.json` supplies the individual stored room layouts:
  image references, three color registers, flags and object lookup metadata.
  Twenty-four are active rooms; three retained layouts are obsolete records.
- `hit-maps/*.json` supplies object hit/depth grids and native column RLE plans.
  Grid values occur once; encoding tokens contain only run structure.
- `state/saved-game.json` describes the saved room, power slots, item positions,
  room/view object lists, achievement bits, puzzle/path cells and interspersed
  saved dictionary headers. This release snapshot is separate from new-game
  state in the Forth program.
- `filesystem/vtoc.json` is preserved DOS metadata, independent of GAM's
  generated resource directory. `padding/*.json` holds small unresolved unused
  remnants, with explicit offsets and bounded annotated segments.

Actual graphics remain binary: compressed picture leaves in
`graphics/native/*.pic` or single-picture `graphics/records/*.bin`, two
1,024-byte `.fnt` fonts, and 20 sprite pixel arrays. The player-bank JSON
supplies frame dimensions, offsets, nested lengths and residual padding.
The stored sprites are inherited engine data; their use in this game's
first-person presentation is unverified. Other PNGs and decoded raster exports
are derived graphics, not duplicate packed resource inputs.

Text uses original game-font byte glyphs: `=` is the normal blank, lowercase
slots include Polish capitals, and `\xNN` explicitly represents control/tile or
inverse glyphs. Message lengths and line counts are generated. Argument names
are inferred from consumers; unproved parameters retain their byte-offset names.

`music/*.cmc` is authoritative. The gameplay export's final six bytes
`00 FF FF B9 8C A8` reconstruct memory used by the original player but were
not stored in this resource. The manifest verifies and omits exactly those
bytes. Title bytes beyond its declared CMC module are retained separately in
`padding/title-cmc-tail.json`; their musical interpretation is unproved.

`../klatwa/tools/asset_formats.py` is the shared `gam.*` encoder. To inspect an
encoded resource or list all build inputs:

```
python3 ../util/structured_assets.py assets/resources/g05-r002.json --game-dir . --output build/messages.bin
python3 ../util/pack_assets.py --game-dir . --dependencies
```

Edits must fit declared encoded sizes and fixed CMC headers. Hit-map edits must
fit the explicit column token plan, or that plan and disk allocation must be
changed deliberately. Errors never trigger a fallback to original binary data.
`binary-migration.json` lists the disposition of every old binary export.
