# Text screens

`credits/00.txt` through `07.txt` are the title's rotating credit messages.
`intro/00.txt` through `15.txt` preserve the prologue pages. This release retains
the prologue data but its normal menu does not select that resource group.
The ending's message lives beside its pictures in `ending/message.txt`.

Each quoted line is one displayed line. Spaces inside quotes are significant.
The builder generates line counts, string lengths and enclosing records.
Polish capitals use the known game-font slots. In gameplay text, write `Ż` and
`Ź` normally; both encode to the shared `$7A` glyph. Automatic decoding defaults to
`Ż` because the byte alone cannot distinguish their spelling.
Title credits use a separate font, which has a lowercase `z` in that slot.
`\\xNN` inside a quoted string
preserves an uncertain, inverse or special glyph byte exactly. The title font
uses ASCII spaces; room messages use the game's custom blank glyph.
