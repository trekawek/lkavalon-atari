# Readable APX fig-Forth bootstrap

`compiler.json` reconstructs the original APX Extended fig-FORTH 1.1 revision
2.0 boot image from its intact dictionary names and executable structure. It
contains 253 linked Forth definitions, two embedded native SAVE entry points,
named threaded calls, literals, counted strings, relative branch destinations,
explicit-mode 6502 instructions, and typed initial values.

The small saved input buffer and partial retired definitions after the initial
dictionary pointer are represented separately. They are overwritten during
normal compilation, but retaining them reproduces all 58 original boot sectors
exactly. Unknown system fields retain neutral labels rather than guessed roles.

`disk.json` supplies disk geometry and screen placement. The 77 files in
`screens/` retain the original 16-line ASCII source screens, including error
messages and optional assembler, editor, graphics and floating-point tools.
Whitespace removed from line ends is restored to 64 columns when packing.

Stale, unloaded compiled debugger/editor/assembler data after the 58-sector
boot image and the unrelated DOS directory/description at screen 45 are omitted.
Unused sectors contain spaces. Consequently the generated compiler ATR has the
same executable boot bytes and preserved source screens, but is deliberately
not a byte-for-byte copy of the whole historical disk. Game output remains
independently checked against its original disk hashes.

Build with Python's standard library:

```sh
python3 util/build_figforth.py --output /tmp/figforth.atr
```

No original ATR, network download or binary snapshot is needed. The assembler
uses the explicit opcode declarations in `ad2044/src/06-assembler.fth`.
`--dependencies` lists every input as an absolute path for Make prerequisites.

The optional authentic-6502 test requires `py65`; it executes COLD, compiles a
new colon definition, and runs the portable target writer. The boot-sector
comparison uses the independently recorded historical digest in
`provenance.json`, so it also works without an archived binary fixture.
