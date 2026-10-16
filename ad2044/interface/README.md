# Interface pictures

- `title.png`: title screen; its changing scanline colors remain in Forth code.
- `frame.png`: the interface surrounding the room picture.
- `title.fnt`, `game.fnt`: raw 992-byte Atari fonts, 124 eight-byte glyphs each.
- `cursor.pmg`: the three 13-byte player/missile graphics planes used by the cursor.

PNGs are indexed images with pixel values 0..3, at the Atari's logical size.
Keep palette indices when editing; RGB conversions are rejected. Full screens
have 160x105 stored pixels, with only the first 104 rows displayed. PNG palette
colors are previews: the title's actual color changes come from the executable.
Fonts are compiled into disk resources; the cursor is embedded in Forth code.
