# Heartlight

This directory contains Janusz Pelc's Heartlight source.

![Heartlight](img/heartlight.png)

## Original game files

`*.BAS` files are tokenized BASIC programs, that can be loaded with `LOAD` command. `*.LST` are ASCII listings for these programs, readable in GitHub.

* [d1/HL.ASM](d1/HL.ASM) - 6502 game code, including the title screen, cave logic, graphics, and sound.
* d1/HL.{[BAS](d1/HL.BAS),[LST](d1/HL.LST)} - Atari BASIC loader with palette, caves, and machine-code DATA lines
* [d1/HL.FNT](d1/HL.FNT) - loadable character set at `$9000–$93FF`.

## Intermediate build files

* [d1/HL.DTA](d1/HL.DTA) - archived raw image combining the needed font bytes and assembled game code.

## Original build tools

These tools can be used to generate a standalone HL.BAS game, containing loader, palette, caves & game engine in DATA lines.

* d1/HLAPD.{[BAS](d1/HLAPD.BAS),[LST](d1/HLAPD.LST)} - BASIC utility that combines `HL.FNT` and `HL.OBJ` into `HL.DTA`.
* d1/HLCONV.{[BAS](d1/HLCONV.BAS),[LST](d1/HLCONV.LST)} - BASIC utility that converts `HL.DTA` to hexadecimal DATA lines.
* [d1/HLREAD.ASM](d1/HLREAD.ASM) - BASIC-callable routines for copying cave rows and decoding hexadecimal DATA.
* d1/HLREAD.{[BAS](d1/HLREAD.BAS),[LST](d1/HLREAD.LST)} - BASIC utility that prints memory bytes as decimal DATA lines.
* [d1/HLMAKE.DOC](d1/HLMAKE.DOC) - original Polish instructions for assembling the files and preparing `HL.BAS`.

## Disk 2 editor assets

These files appear to belong to the Game Graph Editor included in the original archive. The Heartlight build does not use them.

* [d2/GAME.FNT](d2/GAME.FNT) - 2 KB character set loaded at `$4C00–$53FF`.
* [d2/GAME.DTA](d2/GAME.DTA) - 61-byte data segment loaded at `$5400–$543C`.
* [d2/GAME.STA](d2/GAME.STA) - 64-byte zero-filled segment loaded at `$3FC0–$3FFF`.
