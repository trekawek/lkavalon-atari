# Music and effects

`ad2044.snd` is the original 3,631-byte bank, including its custom player,
title/ending music, game-over cue and twenty selectable effects. This release
uses its own command-stream format, not CMC. The bank is intentionally binary
for now and occupies `$5E00..$6C2E` in the executable.

`INCBIN music/ad2044.snd` in `src/20-framework.fth` includes it during Forth
compilation. Resizing it requires changes to the executable's fixed addresses.

For listening, run `python3 ../util/extract_music.py --game ad2044` here.
It creates SAP playback wrappers in ignored `build/music/`. Their small player
adaptations affect those exports only; they do not change the game bank.
