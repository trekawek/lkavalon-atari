# Optional reference media

Only provenance metadata is tracked here. Normal game builds use readable
Forth and structured records plus the native graphics, font and CMC inputs.
The compiler disk is generated from `util/figforth/` at repository level;
`reference/figforth.atr` is an ignored generated artifact, not a binary input.

Historical originals may be placed in this game's ignored `build/reference/`
directory under the filenames recorded in `sources.json`. They are optional
forensic fixtures. `make clean` removes this directory, so retain personal
archive copies outside `build/` when needed.

Without an original game fixture, verification can use an existing build only
if its complete historical SHA-256 matches. AD2044's writable header flag is
normalized before comparison. A modified build never silently becomes its
own comparison baseline. Source regeneration and extraction do not download
missing media; build the unchanged game first or supply an original fixture.
