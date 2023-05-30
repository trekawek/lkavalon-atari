# Robbo

![Robbo](img/robbo.png)

This repository contains the source code of the 8-bit Atari game Robbo, created by Janusz Pelc in 1989 and published by LK Avalon.

Sources were downloaded from the [Atari XL/XE Source Archive](http://sources.pigwa.net/) and then stripped of the ATASCII characters, so they can be read and edited in ASCII editors. In particular:

* all ATASCII characters in `dta c''` and `dta d''` statements were replaced with `dta b()` (see [dta-escape.go](util/dta-escape.go)),
* all ATASCII characters in comments were replaced with ASCII characters,
* map files were replaced with custom ASCII text files that can be compiled with [level-parser.go](util/level-parser.go).

Using ASM files for the levels would be difficult, as escaping ATASCII characters and replacing them with `dta b()` would make design unreadable. That's why there were translated to a different format, visually similar to the ATASCII version.

Now the code can be compiled with [MADS](https://mads.atari8.info/) and the [checksums](checksum.md5) of the compiled modules match the ones from the [original archive](archive).

## Requirements

* MADS assembler
* optionally, for building maps:
  * make
  * golang

## Source files

Original files:

* [d1/R1.ASM](d1/R1.ASM) - main implementation, including also [R2.ASM](d1/R2.ASM),
* [d1/TITLE.ASM](d1/TITLE.ASM) - title screen,
* [d1/RS.ASM](d1/RS.ASM) - saver utility,
* level files in a format accepted by [level-parser.go](util/level-parser.go):
  * [d2/C1.txt](d2/C1.txt)
  * [d2/C2.txt](d2/C2.txt)
  * [d2/C3.txt](d2/C3.txt)
  * [d2/DEMOL.txt](d2/DEMOL.txt) - demo levels

MADS files linking all the objects and producing executables:

* [main.asm](main.asm)
* [demo.asm](demo.asm)
* [saver.asm](saver.asm)

## Compilation

```bash
mads main.asm -o:bin/robbo.xex
```

Or with Make:

```bash
make
```

Checksums can be validated with:
```bash
make test
```
