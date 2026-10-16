# Optional historical references

`sources.json` records provenance for the original releases. Normal builds and
validation need none of those disks: code, assets and the compiler are built
from repository sources, and verification pins only the original executable.
Generated compiler media live at `build/figforth.atr`.

For forensic extraction or source recovery, place historical game images in
ignored `build/reference/` using the filenames in `sources.json`. Those tools
require the original full-disk hashes. Newly packed AD2044 disks intentionally
do not match them. Keep archive copies elsewhere: `make clean` removes `build/`.
