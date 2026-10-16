# Reference media

[`sources.json`](sources.json) records original release URLs, filenames and
digests for forensic extraction and source recovery. AD2044's game fixtures are
`ad2044-side1.atr` and `ad2044-side2.atr`.

Follow the shared [reference-media instructions](../../FORTH.md#validation-and-reference-material)
to supply fixtures under `build/reference/`. Recovery tools validate the original
full-disk digests. Normal builds use repository sources and the generated
compiler at `build/figforth.atr`.
