# Music and effects

`ad2044.snd` is a 3,631-byte binary bank containing its custom player,
title/ending music, game-over cue and twenty selectable effects. It uses the
game's command-stream format and occupies `$5E00..$6C2E` in the executable.

`INCBIN music/ad2044.snd` in `src/20-framework.fth` includes it during Forth
compilation. Resizing it requires changes to the executable's fixed addresses.
