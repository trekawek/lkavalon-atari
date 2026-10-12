# Chaos Commander

This directory contains Chaos Commander 2.2 source and the other Atari programs and tools found in the same [archive](archive/chaos_commander.zip). The archived assembler sources were decoded into readable MADS files. Run `make` to assemble the seven complete program sources.

## Source files

* [src/CCOM.ASM](src/CCOM.ASM) - Chaos Commander 2.2 disk and file manager.
* [src/CCOM3.ASM](src/CCOM3.ASM) - shorter `2.2T` variant; its missing DOS memory-limit symbol is supplied for assembly.
* [src/CP.ASM](src/CP.ASM) - Command Processor 3.08, a DOS command interface.
* [src/ADM.ASM](src/ADM.ASM) - Atari Drum Machine 4.0, with its screen and note tables included.
* [src/ADMSCR.ASM](src/ADMSCR.ASM) - Atari Drum screen data, included by `ADM.ASM`.
* [src/ADMTAB.ASM](src/ADMTAB.ASM) - Atari Drum note table, included by `ADM.ASM`.
* [src/LOADADM.ASM](src/LOADADM.ASM) - loading screen for Atari Drum.
* [src/X.ASM](src/X.ASM) - related loading screen at `$8000`.
* [src/DUMMY.ASM](src/DUMMY.ASM) - small program that finds the minimum of numbers entered by the user.
## Other archive files

* [files/ADM.FNT](files/ADM.FNT) - character set for the Atari Drum loading screen.
* [files/CCOM.XEX](files/CCOM.XEX) - archived Chaos Commander executable.
* [files/ASM.OBJ](files/ASM.OBJ) - another assembled Chaos Commander image.
* [files/CP.SYS](files/CP.SYS) - archived Command Processor image.
* [files/ASM.XEX](files/ASM.XEX) - bundled assembler and editor.
* [files/AXLF.XEX](files/AXLF.XEX) - XL-Friend utility.
* [files/CONV.XEX](files/CONV.XEX) - bundled executable named `CONV`; its function is unverified.
* files/CENTR.{[BAS](files/CENTR.BAS),[LST](files/CENTR.LST)} - tokenized Centronics printer interface program and its ASCII listing.
* [files/AUTORUN.SYS](files/AUTORUN.SYS) - boot helper that loads the bundled tools.
* [files/DOS.SYS](files/DOS.SYS) - DOS system file.
* files/WYNIKI.{[TXT](files/WYNIKI.TXT),[LST](files/WYNIKI.LST)} - sample run of the minimum-finding program and its ASCII listing.

The built objects are Atari binary files. The archived executables differ from the assembled sources, so `make` verifies assembly rather than byte identity.
