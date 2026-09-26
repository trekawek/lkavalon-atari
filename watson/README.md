# Watson

The [LK Avalon Other 1 archive](http://sources.pigwa.net/files/programy/lk_avalon_other_1.zip) contains two Watson source sets. The original ZIP is preserved in `archive/`.

`src/WATSON2.ASM` was decoded from the packed `Backup 02 ASM ASM A/WATSON.ASM` source using `util/decode-jbw.py`. `src/AUX2.ASM` and `src/WGEM.ASM` came from the archive's plain ATASCII sources; their packed Backup 02 versions decode to the same text. Together they build `watson.xex` ("New Watson"). `src/WATSON.ASM`, `src/NEW.ASM`, `src/DEC.ASM`, and `src/NEW2.ASM` build `watson-5.xex` ("Watson 5.0"). The converted UTF-8 files include MADS syntax repairs.

## Background and starting the programs

The [WACIO article in *Tajemnice Atari* 4/91](https://tajemnice.atari8.info/4_91/4_91_wacio.html) introduces disk monitors through a shortened version of Turbo-Watson. Its explanation of the sector number, hexadecimal bytes, and character view applies here. WACIO is a different build, so use the key assignments below for these sources.

Build with `make`. Mount a disk image as D1: before starting either program; both try to read a sector on startup. For Atari800, from this directory:

```sh
atari800 -xl -nobasic -run bin/watson-5.xex disk.atr
atari800 -xl -nobasic -run bin/watson.xex disk.atr
```

The displayed sector data is a working buffer. Editing the hex or character view changes that buffer. **Put sector writes it to the mounted disk**. Work on a copy of a disk image when experimenting.

Key names below refer to Atari keyboard keys; an emulator may map host key combinations differently.

## Watson 5.0: `watson-5.xex`

This version has seven selectable areas: **aux**, two sector-number controls, the hex editor, character editor, **mem**, and **old**. The menu and lower status line remain visible while editing.

| Key / area | Action |
| --- | --- |
| Shift+Space / Control+Space | Move to the next / previous area. |
| Return in **aux** | Open the auxiliary menu. Use Up/Down to choose, Return to run, Esc to close. |
| Left / Right in the first sector-number area | Read the previous / next numbered sector. |
| Down in the first sector-number area | Read the sector linked from the current one. |
| Hex digits in the second sector-number area | Edit the three-digit sector number; Return reads it. Arrows move between digits. |
| Hex digits in the hex area | Change the selected nibble of the working sector. Arrows move the cursor. |
| Typing in the character area | Change the selected byte; arrows move the cursor. Esc prefixes the next character for special characters. |
| Backspace / Delete / Insert in the character area | Move left / remove a byte / insert a byte within the working sector. |
| Down / Up in **mem** | Save the current 128-byte buffer to temporary memory / restore that saved buffer. |
| Up in **old** | Copy the sector saved before the last **Put sector** back into the working buffer. This does not write it to disk. |

The auxiliary menu contains:

| Option | Action |
| --- | --- |
| Directory | Calls a separate routine at `$5000`, which is not included in this XEX. Avoid this entry. |
| File work | Toggle sequential disk-sector mode and file-chain mode. File-chain mode follows the link stored in each DOS sector. |
| Disk search | Search for a pattern entered as hex, ATASCII, or internal screen codes. The search dialog offers **continue** and **new pattern**. |
| Display mode | Toggle the character view between ATASCII and internal screen codes. |
| Conversion | Open the hex/decimal converter. |
| Char set | Show the character table; arrows inspect characters, Return or Esc closes it. |
| Disk map | Scan and display a visual map of sectors; Esc aborts the scan. |
| New drive | Select drive 1–4 with Up/Down and Return; Esc cancels. |
| Fast forward | Enter a four-digit hexadecimal **byte** count and press Return to skip ahead, including across sector boundaries. |
| Put sector | Read the old sector into the **old** buffer, then write the edited working buffer to disk. |
| Exit to DOS | Leave the monitor and return to the loader/DOS environment. |

## New Watson: `watson.xex`

This version has three edit areas: the sector number at the top, hexadecimal bytes on the left, and characters on the right. The bottom line shows the current mode and disk status.

| Key / area | Action |
| --- | --- |
| Shift+Space / Control+Space | Move to the next / previous edit area. |
| Hex digits in the sector-number area | Edit the sector number; Left/Right moves between digits and Return reads the selected sector. |
| `+` / `*` / `=` in the sector-number area | Read the previous / next numbered sector / sector linked from the current one. |
| Hex digits in the hex area | Change a nibble of the working sector. Arrows move between nibbles and rows. |
| Typing in the character area | Change the selected byte. Arrows move between bytes and rows. |
| Tab | Toggle the character display between ATASCII and internal screen codes. |
| Shift+Control+Return | Source-defined shortcut for the auxiliary menu. Use Up/Down, Return, and Esc to navigate it. |

The source also maps Shift+Control plus a letter directly to a menu action:

| Letter | Menu action | What it does |
| --- | --- | --- |
| D | Directory | Calls a helper at `$E450`; no directory helper is included in this XEX. Avoid this entry. |
| W | Work mode | Toggle sequential disk sectors and linked file sectors. |
| S | Search | Enter a pattern as hex, ATASCII, or internal codes; search and choose **edit** or **cont** at a match. |
| H | Hex/dec | Calls the same `$E450` helper as Directory; no converter helper is included. Avoid this entry. |
| M | Map disk | Scan sectors and inspect the map. Arrows move, `<`/`>` move by a page, Return refreshes, and Esc exits. |
| N | New drive | Select D1: through D4: with Up/Down or the digit keys, then Return. |
| F | Fast forward | Enter a four-digit hexadecimal **byte** count; Return skips ahead and Esc cancels. |
| R | Restore | Restore the sector number and buffer saved before the last write. To put those bytes back on disk, use **Put sector** afterward. |
| P | Put sector | Save the old sector in memory, then write the current buffer to disk. |
| E | Exit to DOS | Leave the monitor. |

These letter shortcuts execute the actions directly; **Shift+Control+P writes immediately**. On a disk error, choose **Abort** or **Retry** with Left/Right and Return, or press A/R; Esc aborts.

## Build and verification status

`make test` checks that both source sets assemble with MADS; the recorded build used MADS 2.1.7. Each XEX ends with a RUNAD vector pointing to its startup stub at `$0480`. Both versions were checked to reach their disk monitor screens in Atari800 4.2.0. The Watson 5.0 auxiliary menu was also opened in the emulator. In this Atari800 setup, host Shift+Control+Return did not open the later version's menu; its modifier shortcuts and most disk operations are documented from the source and have not been exercised end to end.

**The archive has no matching Watson executable or disk image**, so these generated XEX files cannot yet be verified byte for byte against an original. The XEX files combine the assembled object segments in source order; original loader details have not been verified.
