# Optional reference media

[sources.json](sources.json) records the original disk names, hashes and
provenance. Historical extraction and comparison tools accept a hash-checked
Klątwa disk at `klatwa/build/reference/klatwa-v1.atr`.

Builds, `make verify` and `make research` use generated disks. Original media
is optional; see [validation and reference material](../../FORTH.md#validation-and-reference-material)
for the distinction between reconstruction checks and historical comparisons.

`make clean` removes `build/reference/`. Keep archive copies outside `build/`.
