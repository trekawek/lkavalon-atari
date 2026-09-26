# LK Avalon sources

Repository contains sources of LK Avalon games and programs for 8-bit Atari.

Sources were downloaded from [Atari XL/XE Source Archive](http://sources.pigwa.net/), transformed from ATASCII to ASCII with [convert-atascii.go](util/convert-atascii.go) and manually cleaned up. The assembly sources can be compiled with [MADS](https://mads.atari8.info/).

## Available sources

* [Automat Perkusyjny](automat-perkusyjny)
* [Digi Duck](digi-duck)
* [Fred](fred)
* [Hans Kloss](hans-kloss)
* [Heartlight](heartlight)
* [Misja](misja)
* [Robbo](robbo)
* [Watson](watson)

## Requirements

* MADS assembler
* GNU make
* golang - optionally, for running extra tools
* Python 3 - optionally, for decoding Watson's packed source

## Compilation

The older game directories can be compiled with:

```bash
mads main.asm -o:game.xex
```

All directories can be built with make:

```bash
make
```

Run the available build checks with:
```bash
make test
```

Heartlight builds the two machine-code objects supplied in its archive. Automat Perkusyjny builds the original disk and cassette XEX files byte for byte. Watson assembles two source revisions, but its archive has no matching executable for a binary comparison. See each directory's README for details.
