# Robbo

![Robbo](img/robbo.png)

This repository contains the source code of the 8-bit Atari game Robbo, created by Janusz Pelc in 1989 and published by LK Avalon.

Sources were downloaded from the [Atari XL/XE Source Archive](http://sources.pigwa.net/) and cleaned-up:

* ATASCII `$0a` characters in `dta c` were translated to `dta b($0a)`, to avoid syntax errors,
* similarly, Atari internal `$0a` in `dta d` were translated to `dta b(74)`,
* inline comments were separated with semicolon,
* ATASCII characters in comments were translated to ASCII (e.g. "ball" to `O`)

Now the code can be compiled with [MADS](https://mads.atari8.info/) and the [checksums](checksum.md5) of the compiled modules match the ones from the [original archive](archive).

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
