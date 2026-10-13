# AD2044 custom sound source

`sound-bank.json` is the authoritative source of the custom sound engine, two
music selections and twenty selectable effects. This game does not use CMC.
The format `sound.ad2044-bank`, version1, is encoded by `util/sound_assets.py`.
Its 3631 bytes occupy Atari addresses `$5E00..$6C2E` and are included by the
Forth source build. No original ATR, binary bank or SAP is needed to encode it.

Sections distinguish 551 actual 6502 instructions, named globals, 57 VM opcode
handlers, four live and four default voice records, eight pitch/control envelope
pairs, and436 VM instructions. The command dispatcher and each distinct music
or effect entry have their own stream. Command aliases share a stream. Addresses
and section ends are checked; sections must remain contiguous and keep their
fixed allocation. Native instructions use the repository's explicit-addressing
6502 syntax, such as `LDA.# 98` or `STA.ABS 6035`; branch operands are addresses.
The assembler reads the opcode declarations in `src/06-assembler.fth`.

Stream instructions name their operation and operands: note/rest duration index,
frequency divider, jump/call target, register condition, memory store, envelope
pointers, envelope stages, duration table, fade, signed pitch slide, or return/end.
The `channel` field supplies the opcode's upper two bits. `at` is a checked stream
position; for `store`, `address` is the write destination. Pitch envelopes use
signed byte steps. Control envelopes retain volume bits0..5, loop bit7 and the
unresolved bit6 separately. Volume is subsequently combined with the voice's
POKEY distortion mask by the original player.

Every voice retains separate duration, gate/release, fade, pitch-slide, frequency,
control/pitch pointers, stage indices and counter fields. The last six bytes
retain initialized AUDF/AUDC offsets and four unknown scalar fields; their live
consumers are not established. Saved mutable pointers/defaults are preserved
exactly, including values overwritten by initialization or later stream commands.

The old demo note stream, an unused indirect-jump fragment, marker, OS-vector
triplets and empty regions are individually identified. They are preserved for
byte-exact reconstruction, not presented as additional game music. In particular,
the demo's old jump and retained vector values are not silently relocated.

Useful edits include the `sound_command` field in `command registers`, note
`frequency_divider`, duration indices, and envelope steps. Fixed-size edits reach
the game through `INCBIN music/sound-bank.json`. Length changes require explicit
layout/code relocation work; the encoder rejects them rather than shifting data.

SAP files are generated playback wrappers, not checked-in sources. They change
the old-OS VBI-chain jump to RTS and add an initialization stub; those patches
never change the game bank. Original extraction provenance remains in
`extraction.json`. The structured bank was compared byte-for-byte with the entire
original before removing `sound-bank.bin` and the three redundant SAP files.
