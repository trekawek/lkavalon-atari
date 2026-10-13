`layout.json` packs `build/assets.atr` from the editable sources below. The
first 32,000 payload bytes stay blank until fig-Forth compiles the program.
`make assets` does not read a reference ATR or a stored whole resource group.

- `resources/*.json` describes nested GAM records: action dispatch IDs and
  arguments, room image references and color registers, object lookup streams,
  title pages, messages, and sprite-bank structure. Record lengths are derived.
- `hit-maps/*.json` contains row-by-row object hit/depth values. Its column RLE
  plan preserves the original encoding boundaries without duplicating values.
- `state/saved-game.json` describes the release's saved snapshot: room, spell
  slots, item coordinates, room/view objects, achievement bits and puzzle cells.
  Saved dictionary headers between fields are explicit. This is separate from
  the new-game state compiled into Forth.
- `filesystem/vtoc.json` preserves DOS allocation metadata. GAM uses the
  separate directory generated from `layout.json`.
- `padding/*.json` preserves small unused allocation remnants in annotated,
  bounded segments. Their meaning is unresolved; they are not live game data.

Native compressed pictures remain in `graphics/native/*.pic` or the few
single-picture `graphics/records/*.bin`. Fonts are `graphics/fonts/*.fnt`;
the two Klątwa records each contain 1,023 bytes. The player bank references
20 `graphics/sprites/*.bin` pixel arrays; JSON generates the nested lengths,
frame offsets, dimensions and padding. Other PNGs and raster `.bin` exports
are derived previews, not inputs to the disk packer.

Text fields use original game-font byte glyphs: `=` is the normal blank and
lowercase slots include Polish capitals. `\xNN` denotes an explicit control,
font tile or inverse glyph. These are editable text, not hexadecimal copies
of a whole resource. Messages and title pages generate their own line counts.
Action/object parameter names are descriptive inferences; unproved arguments
retain offset names instead of guessed meanings.

`music/*.cmc` supplies the music. The gameplay resource adds five zero bytes;
the title's six bytes beyond its declared module are represented by
`padding/title-cmc-tail.json`.

The shared encoder is `../klatwa/tools/asset_formats.py`. For example:

```
python3 ../util/structured_assets.py assets/resources/g04-r000.json --game-dir . --output build/actions.bin
python3 ../util/pack_assets.py --game-dir . --dependencies
```

Edits must preserve each manifest's encoded size and fixed CMC header. A hit-map
edit must still fit its column token plan; otherwise adjust the plan and the
fixed disk allocation deliberately. Invalid dimensions, records, references or
sizes fail instead of falling back to the original disk. `binary-migration.json`
accounts for every replaced, removed or retained binary export.
