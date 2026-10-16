# APX fig-Forth compiler sources

These files build the APX Extended fig-FORTH 1.1 revision 2.0 compiler used by
the three [Forth game projects](../../FORTH.md#forth-sources).

| File | Contents |
| --- | --- |
| [compiler.json](compiler.json) | 253 linked Forth definitions, two native SAVE entry points, 6502 instructions and initial memory values. |
| [disk.json](disk.json) | Disk geometry and source-screen placement. |
| [screens](screens) | 77 ASCII Forth screens: error messages and optional assembler, editor, graphics and floating-point tools. |
| [provenance.json](provenance.json) | Compiler edition, source location and reference hashes. |
| [test_builder.py](test_builder.py) | Source validation, boot-byte comparisons and compiler execution tests. |

The dictionary uses named calls, literals, counted strings and relative branch
destinations. Native instructions use the opcode declarations in
[ad2044/src/06-assembler.fth](../../ad2044/src/06-assembler.fth). Saved input
buffers and partial retired definitions preserve the initial memory image;
normal compilation overwrites them. Unknown system fields have neutral labels.

Each source screen has 16 lines, padded to 64 columns when packed. The generated
ATR reproduces all 58 boot sectors and the retained screens. Other sectors
contain spaces; the complete disk does not match the historical ATR byte for
byte.

Build from the repository root with Python 3.9 or later; only its standard
library is required:

```sh
python3 util/build_figforth.py --output /tmp/figforth.atr
```

The game Makefiles generate this compiler automatically. No original ATR or
download is needed. `--dependencies` lists its build inputs as absolute paths.

Run the compiler tests from the repository root:

```sh
python3 util/figforth/test_builder.py
```

The tests compare the ATR header and boot sectors with the recorded hashes in
`provenance.json`, and check source-screen packing. With `py65` installed they
also execute COLD, compile new definitions, exercise target emission and load a
source screen from disk. Those execution tests are skipped without `py65`.
Game verification checks executable bytes and current resources separately;
see [validation and reference material](../../FORTH.md#validation-and-reference-material).
