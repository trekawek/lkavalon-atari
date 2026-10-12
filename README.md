# LK Avalon sources

Repository contains sources of LK Avalon games and programs for 8-bit Atari.

Most original sources were downloaded from [Atari XL/XE Source Archive](http://sources.pigwa.net/), transformed from ATASCII to ASCII with [convert-atascii.go](util/convert-atascii.go) and manually cleaned up. The assembly sources can be compiled with [MADS](https://mads.atari8.info/). The Forth games listed below were reconstructed from their released disk images and rebuild through the original APX fig-Forth compiler.

## Available sources

* [A.D. 2044: Sexmisja](ad2044) - reconstructed ASCII fig-Forth sources
* [Automat Perkusyjny](automat-perkusyjny)
* [Digi Duck](digi-duck)
* [Fred](fred)
* [Hans Kloss](hans-kloss)
* [Heartlight](heartlight)
* [Klątwa](klatwa) - reconstructed ASCII fig-Forth sources
* [Misja](misja)
* [Robbo](robbo)
* [Watson](watson)
* [Władcy Ciemności](wladcy-ciemnosci) - reconstructed ASCII fig-Forth sources

## Requirements

* MADS assembler
* GNU make
* golang - optionally, for running extra tools
* Python 3 - for Heartlight's cave data and Watson's packed source tools
* Python 3 with py65 - for the original fig-Forth compiler used by A.D. 2044, Klątwa, and Władcy Ciemności

## Compilation

The older game directories can be compiled with:

```bash
mads main.asm -o:game.xex
```

Directories can be built with make (see each Forth game's README for its setup):

```bash
make
```

Run the available build checks with:
```bash
make test
```

Heartlight builds a standalone XEX from its original objects and the caves embedded in its BASIC loader. Automat Perkusyjny builds the original disk and cassette XEX files byte for byte. Watson assembles two source revisions, but its archive has no matching executable for a binary comparison. See each directory's README for details.
