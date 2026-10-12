# A.D. 2044: Sexmisja

ASCII Forth reconstruction of the supplied v1 two-sided Atari disk release.
The sources describe the saved fig-Forth dictionary, including the kernel,
GAM FORTH extensions, and game. They use a small **APX fig-Forth metacompiler**
to keep the original memory layout. These are reconstructed sources, not
Roland Pantola's original source screens.

![Rebuilt game running in Atari800](img/first-room.png)

Start reading [src/30-game.fth](src/30-game.fth). The dictionary contains 901
entries: 786 in the main chain, 113 in additional vocabularies, and two native
entry points without headers. Of these, 550 are colon definitions.
[dictionary.json](dictionary.json) records addresses and naming evidence.
There are 473 recovered or matched names, 55 explicitly inferred descriptive
names, and 373 unknown names represented by their code-field address.
Names matched against a different GAM FORTH revision remain candidates; they
do not change the compiled bytes.

## Sources

| File | Contents |
| --- | --- |
| [src/metacompiler.fth](src/metacompiler.fth) | Portable APX compiler, disk writer, target literals and data emission |
| [src/00-target-words.fth](src/00-target-words.fth) | Symbolic target code-field addresses |
| [src/05-emission.fth](src/05-emission.fth) | Fast emitters used while reading the reconstructed sources |
| [src/10-kernel.fth](src/10-kernel.fth) | Boot code and modified APX fig-Forth kernel |
| [src/20-framework.fth](src/20-framework.fth) | Assembler, disk I/O, graphics, text, input, and game framework |
| [src/30-game.fth](src/30-game.fth) | Game definitions, startup, and turnkey saving |

All `.fth` files are ASCII with LF newlines and lines no longer than 64
characters. ATASCII strings retain their exact bytes, with readable comments.
Native 6502 code has disassembly comments alongside hex emission. Some native
regions contain embedded tables, so linear disassembly there is only an aid.

The build deliberately preserves addresses: machine code, variables, tables,
and disk overlays contain absolute pointers. Ordinary `: name ... ;` compiling
into the running interpreter would move those pointers and overwrite the
compiler. Here, `DOCOL` emits a target colon definition; `t.DUP` emits its
target `DUP` call; `LIT16 1234` compiles a 16-bit literal; and `AT 1234` checks
the target address. `t.0BRANCH CELL xxxx` and loop branches keep the original
signed offsets, with destination labels in comments. `BYTES` is used for
headers, native instructions, and data. The `t.` names and `wXXXX` identifiers
belong to the build interpreter; the saved game's headers retain their
original bytes.

This is readable, low-level threaded Forth, **not a portable, relocatable
rewrite**. Editing definition sizes requires updating absolute addresses and
branch offsets. Graphics, room records, text, and other disk resources remain
binary in [assets](assets); their higher-level formats are not reconstructed.

## Build on the host

Python 3 and `py65` are required:

```sh
cd ad2044
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
make PYTHON=.venv/bin/python
make test PYTHON=.venv/bin/python
```

Outputs:

* `build/ad2044-side1.atr` and `build/ad2044-side2.atr`: rebuilt game disks.
* `build/sources.atr`: the Forth sources packed into 64-by-16 character screens.
* `build/assets-side1.atr`: target disk with its entire program region blank.
* `build/compile-report.json`: actual compiler instruction and disk-write counts.
* `build/source-screens.json`: source-file locations for each packed screen.

[tools/compile.py](tools/compile.py) runs the unmodified APX fig-Forth 6502
interpreter from `reference/figforth.atr`. Only Atari OS input/output services
are supplied by Python. Forth parses the sources and executes the
metacompiler; Python does not translate Forth or insert saved program bytes.
The original game ATRs are used by regeneration and verification, **not by
the build**. `tools/prepare.py` makes the target from independent non-code
assets and leaves all 33,959 program bytes zero.

The verifier requires every sector of both rebuilt disks to match the supplied
release. ATR header byte 15 is cleared to make the outputs writable; it is not
a game sector. Compilation takes several minutes with the Python 6502 emulator.

## Compile the source ATR in Atari fig-Forth

Use an Atari XL/XE with BASIC disabled and at least 48 KB of available RAM.
An emulator supporting 128-byte-sector ATRs larger than 720 sectors is needed
for the source disk. The target still uses the original 1040-sector format.

1. Boot `reference/figforth.atr` in D1.
2. Mount `build/sources.atr` in D2.
3. Make a writable copy of `build/assets-side1.atr` and mount it in D3.
4. At the Forth prompt, enter:

   ```forth
   HEX 1000 2463 ! 1000 OFFSET ! 1 LOAD
   ```

5. Wait for `AD2044 BUILD COMPLETE`. D3 now contains the rebuilt first side.
   Boot it as D1, using `build/ad2044-side2.atr` when the game asks for side two.

The initial `Isn't unique` notices for the common emitters are expected:
`05-emission.fth` deliberately redefines them to speed dictionary lookup.

The command changes this exact APX version's host `R/W` sector divisor at
`$2463` from 720 to 4096 and selects D2 source blocks. It does not patch the
game. This permits one large source disk; screen zero is reserved and source
begins at screen one. Continuation uses the stock `-->` word. Target writes
use `-DISK` directly, so the source-drive mapping does not affect D3.
Do not substitute another fig-Forth revision for this address-specific command.
Turbo mode considerably speeds compilation in an emulator.

## Recovery and verification

`make decompile` regenerates the checked-in Forth files and asset split from
the two reference disks, using [tools/names.json](tools/names.json) and
[tools/extra-headers.json](tools/extra-headers.json). Normal builds do not run
this command, so source edits are preserved.

Important details recovered from the executable:

* The boot dictionary loads at `$0E80`; its final saved address is `$9247`.
* Erased headers still retain links and an inverse final character. Some
  headers have an extra inverse space beyond their declared name length.
* Additional vocabularies link through the FORTH vocabulary's dummy header,
  rather than the final main dictionary chain.
* `CLIT` consumes one byte, so threaded cells are not necessarily aligned.
* `COMPILE` consumes a following CFA as data. Both stock `(.")` and the custom
  string runtime at `$36E5` have counted inline strings.
* The disk continuation duplicates `$8CA0..$8D7F`. Its first copy has four
  surviving name bytes absent from the second copy. The Forth writer recreates
  this overlap and preserves the partial final sector's resource bytes.

`make test` runs compiler regression tests and checks all 2080 sectors against
the supplied release. Optional full Atari800 testing is available with
[tools/emulate.py](tools/emulate.py) and
[tools/emulate-smoke.json](tools/emulate-smoke.json). It requires Atari800,
Xvfb, and Python Xlib:

```sh
python3 tools/emulate.py build/ad2044-side1.atr build/ad2044-side2.atr \
  --output build/emulator --scenario tools/emulate-smoke.json
```

The scenario holds START through the title sequence, enters the first room,
and moves the selection cursor. It is a smoke test, not a complete playthrough.

This reconstruction was also compiled through the original Atari800 `LOAD`
path from the source ATR. All 2080 sectors matched the reference media, and
the menu, first-room, and cursor-movement screenshots matched the original
pixel for pixel. Local evidence is in `build/runtime-validation/`.

## Provenance

The starting investigation is bartgo's
[Forth - eksperyment z AD... forum thread](https://atarionline.pl/forum/comments.php?DiscussionID=7059&page=1).
It identifies erased dictionary names and the modified `ABORT` startup call.

Reference media from AtariOnline:

* [A.D. 2044 v1, side 1](https://atarionline.pl/v01/kazip.php?ct=kazip&sub=A&title=+A.D.+2044+Sexmisja&file=A.D.+2044+Sexmisja+%28v1%2Cs1%29.atr)
* [A.D. 2044 v1, side 2](https://atarionline.pl/v01/kazip.php?ct=kazip&sub=A&title=+A.D.+2044+Sexmisja&file=A.D.+2044+Sexmisja+%28v1%2Cs2%29.atr)
* [Fig-Forth catalog](https://atarionline.pl/v01/index.php?ct=utils2&sub=4.%20Programowanie&title=+Fig-Forth#kaz_5e1378ca54e4be7921002662b90a091c), v1 ATR

Additional naming evidence comes from the preserved
[GAM FORTH tools](https://github.com/ptodt/gam-forth), especially the intact
`09_A_Forth`, `11_A_Graf`, and `42_A_GrafDos` dictionaries. The
[APX fig-Forth documentation](https://atariwiki.org/wiki/Wiki.jsp?page=Extended%20Atari%20FIG-Forth%20APX20029)
explains the original block editor, compiler, and saving conventions.
The game, original runtime, and original resource data retain their authors'
rights; reconstruction does not relicense them.
