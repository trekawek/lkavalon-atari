# LK Avalon sources

Repository contains sources of the LK Avalon games for 8-bit Atari, released around 1990.

Sources were downloaded from [Atari XL/XE Source Archive](http://sources.pigwa.net/), transformed from ATASCII to ASCII with [convert-atascii.go](util/convert-atascii.go) and manually cleaned up. Now they can be compiled with [MADS](https://mads.atari8.info/).

## Available sources

* [Fred](fred)
* [Hans Kloss](hans-kloss)
* [Misja](misja)
* [Robbo](robbo)

## Requirements

* MADS assembler
* GNU make
* golang - optionally, for running extra tools

## Compilation

Each game can be compiled with:

```bash
mads main.asm -o:game.xex
```

Or with make:

```bash
make
```

Checksums can be validated with:
```bash
make test
```
