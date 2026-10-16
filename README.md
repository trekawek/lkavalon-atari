# LK Avalon Atari sources

Sources, editable game data and build tools for LK Avalon games and programs
for 8-bit Atari computers. Each project has its own directory, Makefile and
README.

## Projects

- [A.D. 2044: Sexmisja](ad2044)
- [Automat Perkusyjny](automat-perkusyjny)
- [Chaos Commander](chaos-commander)
- [Digi Duck](digi-duck)
- [Fred](fred)
- [Hans Kloss](hans-kloss)
- [Heartlight](heartlight)
- [Klątwa](klatwa)
- [Misja](misja)
- [Robbo](robbo)
- [Watson](watson)
- [Władcy Ciemności](wladcy-ciemnosci)

## Building

Run Make in the project directory, or select it from the repository root:

```sh
make -C robbo
```

Build requirements depend on the project:

| Tool | Used by |
| --- | --- |
| GNU Make | All projects |
| [MADS](https://mads.atari8.info/) | Assembly projects |
| Go | Robbo's level builder and Hans Kloss's protection tool |
| Python 3 | Heartlight's data builder and the Forth game toolchain |

See the project README and Makefile for its source layout, outputs and checks.
Projects with a `test` target can run it with, for example, `make -C robbo test`.
Shared setup and editing guidance for AD2044, Klątwa and Władcy Ciemności is in
[FORTH.md](FORTH.md).

## Source material and utilities

Much of the original source material comes from the
[Atari XL/XE Source Archive](http://sources.pigwa.net/). Project guides describe
source provenance and any reconstruction limits.

Shared tools live in [util](util). For example,
[convert-atascii.go](util/convert-atascii.go) converts ATASCII source text to
ASCII for editing on modern systems.
