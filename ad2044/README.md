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
There are 473 recovered or matched names, 425 explicitly inferred descriptive
names, and three unknown names represented by their code-field address.
Names matched against a different GAM FORTH revision remain candidates; they
do not change the compiled bytes.

[symbols.txt](symbols.txt) gives the inferred names, behavior evidence, known
stack effects and decoded callers. For example, the former `w6F8A` is now
`t.ROOM-EXIT-OPEN?`: it tests a direction bit in the current room's exit mask.
The remaining `w4381`, `w6C9A` and `w78BA` have no proven consumers that establish
their purpose. [research-notes.txt](research-notes.txt) records the memory-map
anchors, tutorial comparisons and limits of the naming evidence.

## Sources

| File | Contents |
| --- | --- |
| [src/metacompiler.fth](src/metacompiler.fth) | Portable APX compiler, disk writer, target literals and data emission |
| [src/00-target-words.fth](src/00-target-words.fth) | Symbolic target code-field addresses |
| [src/05-emission.fth](src/05-emission.fth) | Fast emitters used while reading the reconstructed sources |
| [src/06-assembler.fth](src/06-assembler.fth) | Forth target assembler for all 151 official NMOS 6502 opcodes |
| [src/10-kernel.fth](src/10-kernel.fth) | Boot code and modified APX fig-Forth kernel |
| [src/20-framework.fth](src/20-framework.fth) | Assembler, disk I/O, graphics, text, input, and game framework |
| [src/30-game.fth](src/30-game.fth) | Game definitions, startup, and turnkey saving |

All `.fth` files are ASCII with LF newlines and lines no longer than 64
characters. ATASCII strings retain their exact bytes, with readable comments.
Native 6502 bodies and verified machine-code tails use executable assembler
mnemonics. Embedded data and unclassified mixed regions retain `BYTES`.
`INCBIN` imports the cursor bitmap and encodes the structured sound source; the
build expands these directives to ASCII `BYTES` before compilation or source-ATR
packing. The sound source itself contains assembly, envelopes and music commands,
not a binary bank.

[strings.txt](strings.txt) lists decoded messages and menu labels with their
target addresses. [strings.json](strings.json) additionally records original
bytes, lengths, inverse characters, and action-label references. The Forth
listings have matching `Decoded text:` comments beside the packed records.
Game-font text is transliterated to ASCII: `=` becomes a space and Polish
glyphs become their base letters. Unsupported glyphs remain `[XX]` escapes;
ordinary ATASCII text retains its case and punctuation.

The decoder follows counted records and resolves action aliases once. It
excludes unused buffer contents and separate disk records. Those disk messages
are now editable strings in [assets/records](assets/records), alongside named
object/action parameters. See [assets/README.md](assets/README.md) for their
record formats.
`make decompile` regenerates both catalogs and annotations. `BYTES` still
controls the compiled data; editing a comment or catalog does not change it.

`make decompile` also regenerates the symbol catalog. Naming metadata lives in
[tools/names.json](tools/names.json); `confidence: inferred` identifies
descriptive names rather than recovered original spellings. Stack effects and
assembly-only calling conventions appear beside the affected definitions.

The build deliberately preserves addresses: machine code, variables, tables,
and disk overlays contain absolute pointers. Ordinary `: name ... ;` compiling
into the running interpreter would move those pointers and overwrite the
compiler. Here, `DOCOL` emits a target colon definition; `t.DUP` emits its
target `DUP` call; `LIT16 1234` compiles a 16-bit literal; and `AT 1234` checks
the target address. `t.0BRANCH CELL xxxx` and loop branches keep the original
signed offsets, with destination labels in comments. `BYTES` is used for
headers and raw data. The `t.` names and `wXXXX` identifiers
belong to the build interpreter; the saved game's headers retain their
original bytes.

The assembler loads after `05-emission.fth` and uses hexadecimal prefix
operands: `LDA.# 03`, `STA.ZP D1`, `LDA.ABS 0000`, and `JSR.ABS E456`.
`BNE 2A01` names an absolute destination and computes the signed relative
displacement; `RTS` has no operand and `ASL.A` selects the accumulator.
Addressing modes are explicit, so an absolute address below `$0100` stays
absolute. Byte operands and branch displacements are range-checked.

This target assembler is implemented in ordinary Forth because the stock APX
host has no assembler. The saved GAM dictionary's original postfix assembler
is still reconstructed separately. Conventional `CODE` definitions would allocate new
headers and addresses; these sources instead emit the saved headers and
machine instructions at their original target locations.

This is readable, low-level threaded Forth, **not a portable, relocatable
rewrite**. Editing definition sizes requires updating absolute addresses and
branch offsets. The build packs native [graphics/packed](graphics/packed)
records, [music/sound-bank.json](music/sound-bank.json), and structured room,
state, text and padding documents in [assets](assets).
[assets/layout.json](assets/layout.json) defines their disk placement. Lengths and
compression are generated from named fields, messages and object-ID grids.
Decoded graphics and PNGs are previews. No compiled game image or opaque data-tail
file is a build input.

## Graphics

Browse [graphics/index.html](graphics/index.html) locally or view the
[scene overview](graphics/rooms-overview.png). The export includes 345 positioned
bitmaps (rooms, objects, inventory images and animation frames), three full-screen
bitmaps, two fonts, three cursor player planes, and 36 base-scene compositions.
Scene IDs follow the game's resource numbering; these include special animation
backgrounds and a purchase notice, so they are not a count of playable rooms.

The format is a custom GAM resource container. Physical sector 500 holds a
sector-count directory, and group contents skip that sector. Resources use a
little-endian 16-bit length followed by their payload. The graphics decoder
expands `$FE,count,value` byte runs; ordinary bytes remain literal. A zero
count has unsafe pointer behavior in the original routine and is rejected;
none of the extracted graphics uses it.

Positioned pictures decode to `x-byte, y, width-bytes, height`, row-major bitmap
bytes, optionally five color-register bytes, then a flag. Each bitmap byte
contains four pixels, most significant pair first. Flags greater than one select
compression; odd flags include colors. The game copies the first three color
bytes into `COLPF0..2`, retaining a black background. Uncolored overlays inherit
their room palette when that relationship is established; unknown contextual
colors use an explicitly marked grayscale preview.

| Directory | Contents |
| --- | --- |
| `graphics/packed` | Native length-prefixed graphics and cursor bytes; `archive/` preserves 18 retired inventory bitmaps |
| `graphics/decoded` | Expanded records, preserving picture headers, colors and flags |
| `graphics/images` | PNG previews of individual assets and font sheets |
| `graphics/scenes` | Base room plus interface, before dynamic overlays, text, map markers and cursor |

Full-screen records expand to 4,200 bytes; 4,160 are displayed as 160 by 104
logical pixels, and the final offscreen row remains in the decoded file. The
title PNG also reproduces the original display-list color changes. Fonts are
992 **uncompressed** bytes (124 eight-by-eight glyphs); literal `$FE` bytes
in these fonts must not pass through the bitmap decoder.

All 348 compressed bitmap records were compared with the game's actual 6502
decoder. The title preview matches an Atari800 screenshot pixel for pixel;
the first room's bitmap and both fonts match live memory. Preview RGB values
come from the existing Atari800 PAL screenshots. Original Atari color codes,
asset bounds and disk offsets are recorded in
[graphics/extraction.json](graphics/extraction.json).

Run `make graphics` to export historical graphics into `build/graphics`, or
`python3 ../util/extract_graphics.py --game ad2044 --check` to verify the files.
The checked-in native `graphics/packed` files are build inputs. Exporting writes
only under `build/`; it does not overwrite those inputs. Decoded files and PNGs
remain previews. Object-ID hit maps are editable row grids in the asset JSON
documents rather than binary graphics files.

## Music

This release uses its own command-stream sound engine, rather than the CMC
player in Klatwa and Wladcy Ciemnosci. The authoritative source is
[music/sound-bank.json](music/sound-bank.json): 551 actual 6502 instructions,
named globals and voice state, pitch/control envelopes, and 436 bytecode
instructions split into dispatcher, song and effect streams. The
[music format notes](music/README.md) explain edits and uncertain retained data.
The encoder recreates all 3,631 bytes at `$5E00..$6C2E` inside the Forth definition
at CFA `$5DB3`; no binary bank is required.

Run `make music` to generate playback files from the current structured source:

* `build/music/title.sap`: looping title and ending music, command `$50`.
* `build/music/game-over.sap`: the game-over cue, command `$19`.
* `build/music/sound-effects.sap`: the other 20 commands as separate subsongs.
* `build/music/sound-bank.bin`: the encoded game bank, for inspection.

SAP wrappers include the original player for [ASAP](https://asap.sourceforge.net/).
They initialize its command dispatcher and call `$5F6F` once per PAL frame.
Their only bank patch changes the old Atari OS VBI-chain jump at `$62E1` to
`RTS`; the Forth build uses the unpatched bank. The game's introduction credits
Leszek Holda for the music. Historical offsets, command mappings and the wrapper
patch remain in [music/extraction.json](music/extraction.json).

All 22 selections were rendered with ASAP 8.0.0. Original-6502 trace tests compare
11,700 frames of ordered POKEY writes across all commands. Structured-source tests
also check the full bank, note/envelope edits, instruction bounds and addresses.
For a WAV after `make music`, run
`asapconv -t 01:00 -o title.wav build/music/title.sap`.

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

[tools/compile.py](tools/compile.py) runs the APX fig-Forth 6502 interpreter from
`reference/figforth.atr`, which Make generates from the readable compiler sources
in [../util/figforth](../util/figforth). Only Atari OS input/output services
are supplied by Python. Forth parses the sources and executes the
metacompiler; Python does not translate Forth or insert saved program bytes.
Original game ATRs are optional forensic fixtures, **not build inputs**.
Verification accepts an unchanged built image only after checking its historical
checksum; edited builds require a separate original fixture for comparisons. `tools/prepare.py` makes the target from independent non-code
assets listed in [assets/layout.json](assets/layout.json) and leaves all
33,959 program bytes zero. No prebuilt game disk or disk-tail blob is copied.
Changes to native graphics or structured assets trigger rebuilding through Make. Run
`make assets` to pack only the resource disks, or `make sources` to pack the
Forth sources including embedded assets. Asset sizes remain fixed; changing
sizes requires updating the layout and any dependent game addresses.
See the [shared asset-build notes](../README.md#building-the-forth-games-from-assets).

The verifier requires every sector of both rebuilt disks to match the supplied
release. ATR header byte 15 is cleared to make the outputs writable; it is not
a game sector. Compilation takes several minutes with the Python 6502 emulator.

## Compile the source ATR in Atari fig-Forth

Use an Atari XL/XE with BASIC disabled and at least 48 KB of available RAM.
An emulator supporting 128-byte-sector ATRs larger than 720 sectors is needed
for the source disk. The target still uses the original 1040-sector format.

1. Boot the generated `reference/figforth.atr` in D1 (run `make` first).
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

`make decompile` regenerates the checked-in Forth files from
optional reference disks or checksum-verified unchanged builds, using
[tools/names.json](tools/names.json) and
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

[tools/test_semantics.py](tools/test_semantics.py) executes selected original
game words on the 6502 to check the inferred meanings, including exit masks,
joystick deltas, keyboard input, action-record fields and counted strings.
The 206-screen source ATR with descriptive names was compiled through actual
Atari800 `LOAD`; its payload matches the original. The build interpreter's
dictionary ends at `$8435`, below the writer's `$9F00` limit. Local evidence is
in `build/runtime-validation/semantic-load-report.json`.

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
Roland Pantola's [Forth tutorial](https://tajemnice.atari8.info/1_92/1_92_forth.html)
corroborates several words and calling conventions; [research-notes.txt](research-notes.txt)
compares all eleven installments and links each one.
The game, original runtime, and original resource data retain their authors'
rights; reconstruction does not relicense them.
