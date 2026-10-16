# Optional reference media

Only provenance metadata is tracked here. Normal game builds use readable
Forth, readable room/world text, indexed PNGs, fonts and CMC inputs.
The compiler disk is generated from `util/figforth/` at repository level;
`reference/figforth.atr` is an ignored generated artifact, not a binary input.

Historical originals may be placed in this game's ignored `build/reference/`
directory under the filenames recorded in `sources.json`. They are optional
forensic fixtures. `make clean` removes this directory, so retain personal
archive copies outside `build/` when needed.

Normal `make verify` checks the matching executable and current authored
resources without an original disk. Historical extraction and recovery need
an original fixture: fresh builds deliberately use different disk allocation
and save contents. An older full reconstruction is accepted only if its entire
historical SHA-256 matches. These tools do not download missing media or use
the current build as its own comparison baseline.
