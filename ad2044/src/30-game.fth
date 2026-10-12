( AD 2044 30-game.fth: target 7B4F..9246 )
( Hexadecimal. BYTES emits hex bytes; CELL emits a 16-bit )
( cell. )
( LIT8/LIT16 compile literals; branch cells are signed )
( offsets. )
( 6502 mnemonics use 06-assembler.fth; operands follow )
( words. )

( w7B54 | NFA 7B4F CFA 7B54 )
( Unknown erased name; CFA identifier )
AT 7B4F
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D9EA7A
DOCOL
w7594 t.@ t.+ t.2+ t.;S
AT 7B60

( w7B66 | NFA 7B60 CFA 7B66 )
( Unknown erased name; CFA identifier )
AT 7B60
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C04F7B
DOCOL
w7B54 t.C@ t.;S
AT 7B6E

( w7B73 | NFA 7B6E CFA 7B73 )
( Unknown erased name; CFA identifier )
AT 7B6E
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D3607B
DOVAR
CELL 7CC7
AT 7B77

( w7B7C | NFA 7B77 CFA 7B7C )
( Unknown erased name; CFA identifier )
AT 7B77
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CC6E7B
DOCON
CELL 0021
AT 7B80

( w7B87 | NFA 7B80 CFA 7B87 )
( Unknown erased name; CFA identifier )
AT 7B80
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C5777B
DOCOL
t.0 t.SWAP t.4 t.0 t.(DO)
( label 7B93 )
t.DUP t.I w773C t.C@ t.=
t.0BRANCH CELL 000E ( -> 7BAD )
t.SWAP t.DROP t.I w773C t.SWAP t.LEAVE
( label 7BAD )
t.(LOOP) CELL FFE4 ( -> 7B93 )
t.DROP t.;S
AT 7BB5

( w7BBB | NFA 7BB5 CFA 7BBB )
( Unknown erased name; CFA identifier )
( Decoded text: Message lines )
( line 1 $7BC1: NIE UNIESIESZ )
AT 7BB5
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CD807B
DOVAR
BYTES 0F00010D4E49453D554E4945534945535A20
AT 7BCF

( w7BD6 | NFA 7BCF CFA 7BD6 )
( Unknown erased name; CFA identifier )
AT 7BCF
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A1B57B
DOCOL
t.OVER t.4 t.<
t.0BRANCH CELL 0018 ( -> 7BF8 )
w4678 t.DUP t.>R t.C@ t.SWAP t.C2^ t.OR t.R> t.C!
t.BRANCH CELL 0004 ( -> 7BFA )
( label 7BF8 )
t.2DROP
( label 7BFA )
t.;S
AT 7BFC

( w7C04 | NFA 7BFC CFA 7C04 )
( Unknown erased name; CFA identifier )
AT 7BFC
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A1CF7B
DOCOL
t.OVER t.4 t.<
t.0BRANCH CELL 001D ( -> 7C2B )
w4678 t.DUP t.>R t.C@ t.SWAP t.C2^ LIT8 FF t.XOR t.AND t.R>
t.C!
t.BRANCH CELL 0004 ( -> 7C2D )
( label 7C2B )
t.2DROP
( label 7C2D )
t.;S
AT 7C2F

( READ-BOOT-TAIL | NFA 7C2F CFA 7C35 )
( Inferred descriptive name, not recovered original: Reads )
( the extra saved memory pages using HE/SP&/BDISK, then )
( restores patched ABORT and SAVE cells. )
AT 7C2F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000ABFC7B
DOCOL
t.DISABLE-DISPLAY-DMA t.HE t.SP& t.C@ t.SP& t.1+ t.C@ t.1
t.S-L t.! t.BDISK LIT8 08 t.?ERROR LIT16 115F LIT16 1ECC t.!
LIT16 1625 LIT16 2984 t.! t.CR t.;S
AT 7C6A

( w7C70 | NFA 7C6A CFA 7C70 )
( Unknown erased name; CFA identifier )
AT 7C6A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C32F7C
DOCOL
t.0 t.RESOURCE-ADDR w74ED t.@ w74E2 t.+ t.1 t.1 w76A7
t.0=_12DE t.0 t.RESOURCE-ADDR w74ED t.2+ t.@ w74E2 t.+ t.1 t.1
w76A7 t.+ t.;S
AT 7C9E

( w7CA3 | NFA 7C9E CFA 7CA3 )
( Unknown erased name; CFA identifier )
AT 7C9E
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D76A7C
DOCOL
t.1 w7B66 t.;S
AT 7CAB

( w7CB0 | NFA 7CAB CFA 7CB0 )
( Unknown erased name; CFA identifier )
AT 7CAB
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D79E7C
DOCOL
t.2 w7B66 t.;S
AT 7CB8

( w7CBD | NFA 7CB8 CFA 7CBD )
( Unknown erased name; CFA identifier )
AT 7CB8
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D7AB7C
DOCOL
t.3 w7B66 t.;S
AT 7CC5

( w7CCA | NFA 7CC5 CFA 7CCA )
( Unknown erased name; CFA identifier )
AT 7CC5
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D7B87C
DOCOL
t.4 w7B66 t.;S
AT 7CD2

( w7CD7 | NFA 7CD2 CFA 7CD7 )
( Unknown erased name; CFA identifier )
AT 7CD2
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D7C57C
DOCOL
LIT16 0005 w7B66 t.;S
AT 7CE1

( w7CE6 | NFA 7CE1 CFA 7CE6 )
( Unknown erased name; CFA identifier )
AT 7CE1
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D7D27C
DOCOL
LIT16 0006 w7B66 t.;S
AT 7CF0

( w7CF6 | NFA 7CF0 CFA 7CF6 )
( Unknown erased name; CFA identifier )
AT 7CF0
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A9E17C
DOCOL
t.DUP LIT8 0E t.=
t.0BRANCH CELL 003F ( -> 7D40 )
w4A6F t.@ t.2 t.=
t.0BRANCH CELL 0033 ( -> 7D40 )
w7B73 t.@ w7B7C t.=
t.0BRANCH CELL 0006 ( -> 7D1F )
t.BRANCH CELL 0023 ( -> 7D40 )
( label 7D1F )
w7C70 t.2 t.=
t.0BRANCH CELL 000D ( -> 7D34 )
LIT8 21 w7B73 t.!
t.BRANCH CELL 000E ( -> 7D40 )
( label 7D34 )
t.DROP LIT16 0024 t.0 w715A t.!
( label 7D40 )
w7B7C t.;S
AT 7D44

( w7D4A | NFA 7D44 CFA 7D4A )
( Unknown erased name; CFA identifier )
AT 7D44
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A1F07C
DOCOL
t.0 w47A4 t.! t.;S
AT 7D54

( w7D59 | NFA 7D54 CFA 7D59 )
( Unknown erased name; CFA identifier )
AT 7D54
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B0447D
DOCOL
w5390 w59C3 t.1 t.;S
AT 7D63

( w7D68 | NFA 7D63 CFA 7D68 )
( Unknown erased name; CFA identifier )
AT 7D63
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B1547D
DOCOL
w5390 t.1 t.SOUND-COMMAND! w59A3 t.1 t.;S
AT 7D76

( w7D7B | NFA 7D76 CFA 7D7B )
( Unknown erased name; CFA identifier )
AT 7D76
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B2637D
DOCOL
t.2 t.SOUND-COMMAND! w7CA3 w598D t.1 t.;S
AT 7D89

( w7D8E | NFA 7D89 CFA 7D8E )
( Unknown erased name; CFA identifier )
AT 7D89
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B4767D
DOCOL
w7CB0 w4377 t.@ t.<
t.0BRANCH CELL 0012 ( -> 7DAC )
LIT16 001C t.SOUND-COMMAND! w7CA3 w598D t.1
t.BRANCH CELL 0010 ( -> 7DBA )
( label 7DAC )
LIT16 0013 t.SOUND-COMMAND! t.3 w7B54 w6D82 t.0
( label 7DBA )
t.;S
AT 7DBC

( w7DC1 | NFA 7DBC CFA 7DC1 )
( Unknown erased name; CFA identifier )
AT 7DBC
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B6897D
DOCOL
w7CA3 w6E1F t.1 t.;S
AT 7DCB

( w7DD0 | NFA 7DCB CFA 7DD0 )
( Unknown erased name; CFA identifier )
AT 7DCB
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B7BC7D
DOCOL
LIT8 07 t.SOUND-COMMAND! t.1 w7B54 w6D82 t.0 t.;S
AT 7DE1

( w7DE7 | NFA 7DE1 CFA 7DE7 )
( Unknown erased name; CFA identifier )
AT 7DE1
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C5CB7D
DOCON
CELL 00A0
AT 7DEB

( w7DF0 | NFA 7DEB CFA 7DF0 )
( Unknown erased name; CFA identifier )
( Decoded text: Message lines )
( line 1 $7DF6: OBZARSTWO TO GRZECH )
AT 7DEB
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C5E17D
DOVAR
BYTES 150001134F427A41525354574F3D544F3D47525A45434820
AT 7E0A

( w7E0F | NFA 7E0A CFA 7E0F )
( Unknown erased name; CFA identifier )
AT 7E0A
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CDEB7D
DOCOL
t.CLEAR-TEXT-AREA w4377 t.@ w7DE7 t.<
t.0BRANCH CELL 0008 ( -> 7E25 )
w6D82
t.BRANCH CELL 0010 ( -> 7E33 )
( label 7E25 )
t.DROP w7DF0 t.2+ w6D82 w7DE7 w4377 t.!
( label 7E33 )
t.;S
AT 7E35

( w7E3A | NFA 7E35 CFA 7E3A )
( Unknown erased name; CFA identifier )
AT 7E35
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B80A7E
DOCOL
w7CA3 w70D5 w7CB0 w4377 t.+! t.3 w7B54 w5390 t.8
t.SOUND-COMMAND! w59C3 w7E0F w7D4A t.1 t.;S
AT 7E5A

( w7E60 | NFA 7E5A CFA 7E60 )
( Unknown erased name; CFA identifier )
AT 7E5A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C2357E
DOCOL
w7CF6 t.;S
AT 7E66

( w7E6B | NFA 7E66 CFA 7E6B )
( Unknown erased name; CFA identifier )
AT 7E66
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B95A7E
DOCOL
w7CA3 w70D5 w7CB0 w4377 t.+! t.4 w7B54 w5390 t.8
t.SOUND-COMMAND! w59C3 w7E0F w7D4A t.1 t.;S
AT 7E8B

( w7E91 | NFA 7E8B CFA 7E91 )
( Unknown erased name; CFA identifier )
AT 7E8B
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B0667E
DOCOL
LIT8 0A t.SOUND-COMMAND! w7CA3 w7134 w59C3 t.1 t.;S
AT 7EA2

( w7EA8 | NFA 7EA2 CFA 7EA8 )
( Unknown erased name; CFA identifier )
( Decoded text: Message lines )
( line 1 $7EAE: CZYM? )
AT 7EA2
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D48B7E
DOVAR
BYTES 07000105435A594D3F20
AT 7EB4

( w7EBD | NFA 7EB4 CFA 7EBD )
( Unknown erased name; CFA identifier )
AT 7EB4
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000DAA27E
DOCOL
LIT8 15 t.SOUND-COMMAND! t.2+ w6D82 t.2 w4D70 t.! t.4 t.PAUSE
t.WAIT-TRIGGER-RELEASE t.WAIT-GAME-INPUT t.0 w4D70 t.! t.2 t.*
t.+ w773C t.;S
AT 7EE6

( w7EEB | NFA 7EE6 CFA 7EEB )
( Unknown erased name; CFA identifier )
AT 7EE6
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D4B47E
DOVAR
CELL 0000
AT 7EEF

( w7EF5 | NFA 7EEF CFA 7EF5 )
( Unknown erased name; CFA identifier )
AT 7EEF
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B1E67E
DOCOL
w7EA8 w7EBD t.C@ w7CB0 t.=
t.0BRANCH CELL 0027 ( -> 7F2A )
w7CA3 w7EEB t.@
t.0BRANCH CELL 0008 ( -> 7F15 )
w7134
t.BRANCH CELL 0004 ( -> 7F17 )
( label 7F15 )
w70D5
( label 7F17 )
LIT8 0B t.SOUND-COMMAND! w59C3 w7CBD w4369 t.@ w7BD6
t.BRANCH CELL 0013 ( -> 7F3B )
( label 7F2A )
w59C3 t.CLEAR-TEXT-AREA LIT8 13 t.SOUND-COMMAND! t.4 w7B54
w6D82 w7D4A
( label 7F3B )
t.1 t.;S
AT 7F3F

( w7F45 | NFA 7F3F CFA 7F45 )
( Unknown erased name; CFA identifier )
AT 7F3F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B1EF7E
DOCOL
t.1 w7EEB t.! w7EF5 t.;S
AT 7F51

( w7F57 | NFA 7F51 CFA 7F57 )
( Unknown erased name; CFA identifier )
AT 7F51
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B23F7F
DOCOL
w7CA3 w70D5 LIT8 0C t.SOUND-COMMAND! w59C3 w7CB0 w4369 t.@
w7C04 t.1 t.;S
AT 7F70

( w7F76 | NFA 7F70 CFA 7F76 )
( Unknown erased name; CFA identifier )
AT 7F70
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B3517F
DOCOL
w6EE6 w7E60 w7B7C t.=
t.0BRANCH CELL 0008 ( -> 7F8A )
w6E1F
t.BRANCH CELL 000F ( -> 7F97 )
( label 7F8A )
t.DROP LIT8 24 t.0 w715A t.! w6E1F
( label 7F97 )
t.1 t.;S
AT 7F9B

( w7FA1 | NFA 7F9B CFA 7FA1 )
( Unknown erased name; CFA identifier )
AT 7F9B
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B3707F
DOCOL
w7CA3 w7F76 t.;S
AT 7FA9

( w7FB0 | NFA 7FA9 CFA 7FB0 )
( Unknown erased name; CFA identifier )
AT 7FA9
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CE9B7F
DOCOL
w554E t.@ t.4 t.* w7243 t.@ t.+ LIT8 64 t.+ t.;S
AT 7FC7

( w7FCD | NFA 7FC7 CFA 7FCD )
( Unknown erased name; CFA identifier )
AT 7FC7
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B4A97F
DOCOL
t.0 w7B87 t.DUP
t.0BRANCH CELL 0045 ( -> 801C )
t.CLEAR-TEXT-AREA LIT8 0E t.SOUND-COMMAND! w7FB0 t.OVER t.C!
t.1+ t.@ w7243 t.@ t.2 t.- w56A7 t.RESOURCE-ADDR t.2+ t.DUP
t.>R t.! w7FB0 w70D5 w5390 t.R> t.2 t.- w76E1 t.<MOVE w59C3
w5374 w76E1 t.?POBJ w5390
t.BRANCH CELL 0013 ( -> 802D )
( label 801C )
w59C3 LIT8 13 t.SOUND-COMMAND! t.CLEAR-TEXT-AREA w7BBB t.2+
w6D82 w7D4A
( label 802D )
t.1 t.;S
AT 8031

( w8037 | NFA 8031 CFA 8037 )
( Unknown erased name; CFA identifier )
( Decoded text: Message lines )
( line 1 $803D: PALENIE SZKODZI )
AT 8031
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D0C77F
DOVAR
BYTES 1100010F50414C454E49453D535A4B4F445A4920
AT 804D

( w8053 | NFA 804D CFA 8053 )
( Unknown erased name; CFA identifier )
AT 804D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B53180
DOCOL
w4369 t.@ t.0=_12DE
t.0BRANCH CELL 001D ( -> 807A )
w5868 t.DROP w7CA3 w7134 w7CB0 w4369 t.@ w7BD6 w5390 LIT8 0F
t.SOUND-COMMAND!
t.BRANCH CELL 0007 ( -> 807F )
( label 807A )
LIT8 13 t.SOUND-COMMAND!
( label 807F )
w59C3 LIT16 FFE2 w4377 t.+! w4377 t.@ t.1 t.<
t.0BRANCH CELL 0008 ( -> 809B )
t.1 w4377 t.!
( label 809B )
t.CLEAR-TEXT-AREA w8037 t.2+ w6D82 w7D4A t.1 t.;S
AT 80A9

( w80B0 | NFA 80A9 CFA 80B0 )
( Unknown erased name; CFA identifier )
AT 80A9
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A94D80
DOCOL
t.2DUP w5147 t.DUP LIT8 64 t.= t.SWAP LIT8 65 t.= t.+
t.0=_12DE t.;S
AT 80CA

( w80D0 | NFA 80CA CFA 80D0 )
( Unknown erased name; CFA identifier )
AT 80CA
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C0A980
DOCOL
t.0 w4D70 t.! w4D92 w5923
( label 80DC )
t.1+ w80B0
t.0BRANCH CELL FFFA ( -> 80DC )
t.4 t.-
( label 80E8 )
t.>R t.1 t.- t.R> w80B0
t.0BRANCH CELL FFF4 ( -> 80E8 )
t.>R t.1+ t.R> LIT16 0006 t.* t.FIRST t.1+ t.C@ t.+ t.SWAP
t.FIRST t.C@ t.+ t.SWAP t.;S
AT 8116

( w811C | NFA 8116 CFA 811C )
( Unknown erased name; CFA identifier )
AT 8116
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C1CA80
DOCOL
t.DUP t.0 t.SWAP t.C! w7840 t.;S
AT 812A

( w8130 | NFA 812A CFA 8130 )
( Unknown erased name; CFA identifier )
AT 812A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B61681
DOCOL
LIT8 15 t.SOUND-COMMAND! t.1 w7B54 w6D82 t.4 t.PAUSE t.2 w4D70
t.! t.WAIT-TRIGGER-RELEASE t.WAIT-GAME-INPUT t.2 t.* t.+ w773C
t.DUP t.C@
t.0BRANCH CELL 0026 ( -> 817F )
t.DUP t.>R t.C@ t.DUP t.>R w7134 w80D0 t.R> w56A7
t.RESOURCE-ADDR t.2+ w590E w5390 t.R> w811C w59C3
t.BRANCH CELL 000C ( -> 8189 )
( label 817F )
t.DROP w5390 t.0 w4D70 t.!
( label 8189 )
LIT8 10 t.SOUND-COMMAND! t.1 t.;S
AT 8192

( w8198 | NFA 8192 CFA 8198 )
( Unknown erased name; CFA identifier )
AT 8192
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B72A81
DOCOL
w7CA3 w7134 LIT8 0B t.SOUND-COMMAND! w59C3 w7CB0 w4369 t.@
w7BD6 t.1 t.;S
AT 81B1

( w81B7 | NFA 81B1 CFA 81B7 )
( Unknown erased name; CFA identifier )
AT 81B1
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B09281
DOCOL
w7CA3 w7134 LIT8 0B t.SOUND-COMMAND! w59C3 t.1 t.;S
AT 81C8

( w81CE | NFA 81C8 CFA 81CE )
( Unknown erased name; CFA identifier )
AT 81C8
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B1B181
DOCOL
w7CA3 w70D5 LIT8 0C t.SOUND-COMMAND! w59C3 t.1 t.;S
AT 81DF

( w81E5 | NFA 81DF CFA 81E5 )
( Unknown erased name; CFA identifier )
AT 81DF
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B2C881
DOCOL
w7CA3 w7134 LIT8 16 t.SOUND-COMMAND! w59C3 w7CBD w7CB0 t.0
w70A2 w7CCA w7CB0 w7BD6 t.1 t.;S
AT 8204

( w820A | NFA 8204 CFA 820A )
( Unknown erased name; CFA identifier )
AT 8204
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B3DF81
DOCOL
w7CA3 w70D5 LIT8 16 t.SOUND-COMMAND! w59C3 w7CBD w7CB0 t.0
w70FC w7CCA w7CB0 w7C04 t.1 t.;S
AT 8229

( w8230 | NFA 8229 CFA 8230 )
( Unknown erased name; CFA identifier )
AT 8229
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C00482
DOCOL
w4642 t.@ t.;S
AT 8238

( w823F | NFA 8238 CFA 823F )
( Unknown erased name; CFA identifier )
AT 8238
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A12982
DOCOL
w4642 t.! t.;S
AT 8247

( w824D | NFA 8247 CFA 824D )
( Unknown erased name; CFA identifier )
AT 8247
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B43882
DOCOL
w7CBD w8230 t.0=_12DE
t.0BRANCH CELL 0025 ( -> 827C )
w4369 t.@ w7CB0 w520C t.OUNT t.ERASE t.1 w7CCA w823F w7CA3
w7134 LIT8 16 t.SOUND-COMMAND! w59C3 t.1
t.BRANCH CELL 0011 ( -> 828B )
( label 827C )
LIT8 13 t.SOUND-COMMAND! LIT16 0005 w7B54 w6D82 t.0
( label 828B )
t.;S
AT 828D

( w8293 | NFA 828D CFA 8293 )
( Unknown erased name; CFA identifier )
AT 828D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B54782
DOCOL
t.0 w7CB0 w823F w7CA3 w70D5 LIT8 16 t.SOUND-COMMAND! w59C3 t.1
t.;S
AT 82AA

( w82B0 | NFA 82AA CFA 82B0 )
( Unknown erased name; CFA identifier )
AT 82AA
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B68D82
DOCOL
w7CB0 w8230 t.0=_12DE
t.0BRANCH CELL 001B ( -> 82D5 )
t.1 w7CBD w4642 t.+! w7CA3 w7134 LIT8 0B t.SOUND-COMMAND!
w59C3 t.1
t.BRANCH CELL 000F ( -> 82E2 )
( label 82D5 )
LIT8 13 t.SOUND-COMMAND! t.4 w7B54 w6D82 t.0
( label 82E2 )
t.;S
AT 82E4

( w82EA | NFA 82E4 CFA 82EA )
( Unknown erased name; CFA identifier )
AT 82E4
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B7AA82
DOCOL
t.-1 w7CB0 w4642 t.+! w7CA3 w70D5 LIT8 0C t.SOUND-COMMAND!
w59C3 t.1 t.;S
AT 8303

( w8309 | NFA 8303 CFA 8309 )
( Unknown erased name; CFA identifier )
AT 8303
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B8E482
DOCOL
w7CA3 w7134 LIT8 1C t.SOUND-COMMAND! w59C3 t.1 t.;S
AT 831A

( w8320 | NFA 831A CFA 8320 )
( Unknown erased name; CFA identifier )
AT 831A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B90383
DOCOL
w7CA3 w70D5 LIT8 1C t.SOUND-COMMAND! w59C3 t.1 t.;S
AT 8331

( w8336 | NFA 8331 CFA 8336 )
( Unknown erased name; CFA identifier )
AT 8331
( Saved dictionary header: flags, name bytes, link )
BYTES 8200AB1A83
DOVAR
CELL 0000
AT 833A

( w8340 | NFA 833A CFA 8340 )
( Unknown erased name; CFA identifier )
AT 833A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D23183
DOCOL
t.0 w8336 t.! t.DUP t.C@ t.1+ t.0 t.(DO)
( label 8352 )
t.OVER t.I t.+ t.C@ t.OVER t.I t.+ t.C@ t.=
t.0BRANCH CELL 0008 ( -> 836E )
t.1 w8336 t.+!
( label 836E )
t.(LOOP) CELL FFE2 ( -> 8352 )
t.C@ t.1+ w8336 t.@ t.= t.SWAP t.DROP t.;S
AT 8382

( w8389 | NFA 8382 CFA 8389 )
( Unknown erased name; CFA identifier )
AT 8382
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C43A83
DOCOL
t.SWAP t.>R t.DUP t.3 w4973
( ATASCII text: =?= )
t.(.")
BYTES 033D3F3D
LIT16 0006 t.- t.HERE t.16 t.+ t.16 t.PAUSE t.0 LIT16 02B6
t.C! t.64 LIT16 02BE t.C! w57EE t.HERE t.16 t.+ t.R> w8340
t.;S
AT 83C9

( w83D0 | NFA 83C9 CFA 83D0 )
( Unknown erased name; CFA identifier )
AT 83C9
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000BD8283
DOCOL
LIT16 000C w8389 t.;S
AT 83DA

( w83E0 | NFA 83DA CFA 83E0 )
( Unknown erased name; CFA identifier )
AT 83DA
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D3C983
DOCOL
w7CBD w8230 w7CCA t.=
t.0BRANCH CELL 005B ( -> 8447 )
w7CD7 w7134 w59C3 LIT8 19 t.PAUSE LIT8 12 t.SOUND-COMMAND!
t.CLEAR-TEXT-AREA t.8 w7B54 w83D0
t.0BRANCH CELL 0028 ( -> 8430 )
w7CD7 w70D5 LIT16 0006 w7B66 w7134 w59C3 LIT8 14
t.SOUND-COMMAND! t.1 LIT16 0007 w7B66 w823F LIT8 64 t.PAUSE
t.BRANCH CELL 0007 ( -> 8435 )
( label 8430 )
LIT8 13 t.SOUND-COMMAND!
( label 8435 )
w4369 t.@ w5855 w520C t.OUNT t.ERASE t.0 w7CBD w823F
( label 8447 )
w59C3 t.1 t.;S
AT 844D

( w8453 | NFA 844D CFA 8453 )
( Unknown erased name; CFA identifier )
AT 844D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B0DA83
DOCOL
LIT8 20 t.SOUND-COMMAND! w7CA3 w7134 w7CB0 w7CBD w4642 t.+!
w83E0 t.;S
AT 846A

( w8470 | NFA 846A CFA 8470 )
( Unknown erased name; CFA identifier )
AT 846A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B14D84
DOCOL
LIT8 1F t.SOUND-COMMAND! w7CA3 w70D5 w7CB0 t.MINUS w7CBD w4642
t.+! w83E0 t.;S
AT 8489

( w848F | NFA 8489 CFA 848F )
( Unknown erased name; CFA identifier )
AT 8489
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B26A84
DOCOL
w7CBD w8230 LIT8 20 t.SOUND-COMMAND! LIT16 0014 t.PAUSE
t.0BRANCH CELL 001B ( -> 84BD )
w7CA3 w7134 w7CB0 w4369 t.@ w7BD6 w59C3 LIT8 0B
t.SOUND-COMMAND! t.1
t.BRANCH CELL 000F ( -> 84CA )
( label 84BD )
t.4 w7B54 w6D82 LIT8 13 t.SOUND-COMMAND! t.0
( label 84CA )
t.;S
AT 84CC

( w84D2 | NFA 84CC CFA 84D2 )
( Unknown erased name; CFA identifier )
AT 84CC
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B38984
DOCOL
w7EA8 LIT8 15 t.SOUND-COMMAND! w7EBD t.DUP t.>R t.C@ t.DUP
t.0BRANCH CELL 0007 ( -> 84EE )
LIT8 21 t.SOUND-COMMAND!
( label 84EE )
w7CB0 t.=
t.0BRANCH CELL 0028 ( -> 851C )
w7CA3 w4584 t.@ w7CBD w4584 t.! t.0 w7CA3 w4584 t.! t.1 w7CCA
w823F t.CLEAR-TEXT-AREA LIT16 0005 w7B54 w6D82 w7D4A
( label 851C )
t.R> w811C w5390 t.1 t.;S
AT 8526

( w852D | NFA 8526 CFA 852D )
( Unknown erased name; CFA identifier )
AT 8526
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D4CC84
DOCOL
t.-DUP
t.0BRANCH CELL 0018 ( -> 854B )
t.0 t.(DO)
( label 8539 )
t.COUNT t.0 t.(DO)
( label 853F )
t.COUNT t.+
t.(LOOP) CELL FFFA ( -> 853F )
t.(LOOP) CELL FFF0 ( -> 8539 )
( label 854B )
t.;S
AT 854D

( w8555 | NFA 854D CFA 8555 )
( Unknown erased name; CFA identifier )
AT 854D
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D42685
DOCOL
t.1 w852D w6D82 t.;S
AT 855F

( w8565 | NFA 855F CFA 8565 )
( Unknown erased name; CFA identifier )
AT 855F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B44D85
DOCOL
w7CA3 w8230 LIT8 07 t.SOUND-COMMAND!
t.0BRANCH CELL 000C ( -> 857E )
t.2 w7B54 w6D82
t.BRANCH CELL 0008 ( -> 8584 )
( label 857E )
t.2 w7B54 w8555
( label 8584 )
t.0 t.;S
AT 8588

( w858D | NFA 8588 CFA 858D )
( Unknown erased name; CFA identifier )
AT 8588
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D45F85
DOVAR
CELL 0000
AT 8591

( w8598 | NFA 8591 CFA 8598 )
( Unknown erased name; CFA identifier )
AT 8591
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A98885
DOCOL
t.RESOURCE-ADDR t.?PCOBJ w858D t.C@ t.PAUSE t.;S
AT 85A6

( w85AC | NFA 85A6 CFA 85AC )
( Unknown erased name; CFA identifier )
AT 85A6
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C99185
DOCOL
t.SWAP w56A7 t.DUP t.>R t.+ t.R> t.(DO)
( label 85BC )
t.I w8598
t.(LOOP) CELL FFFA ( -> 85BC )
t.;S
AT 85C6

( w85CD | NFA 85C6 CFA 85CD )
( Unknown erased name; CFA identifier )
AT 85C6
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C9A685
DOCOL
t.SWAP w56A7 t.1 t.- t.SWAP t.OVER t.+ t.(DO)
( label 85DF )
t.I w8598 t.-1
t.(+LOOP) CELL FFF8 ( -> 85DF )
t.;S
AT 85EB

( w85F1 | NFA 85EB CFA 85F1 )
( Unknown erased name; CFA identifier )
AT 85EB
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CEC685
DOCOL
t.0 t.(DO)
( label 85F7 )
t.2DUP w858D t.1+ t.C@
t.0BRANCH CELL 0008 ( -> 8609 )
w85CD
t.BRANCH CELL 0004 ( -> 860B )
( label 8609 )
w85AC
( label 860B )
t.(LOOP) CELL FFEA ( -> 85F7 )
t.;S
AT 8611

( w8619 | NFA 8611 CFA 8619 )
( Unknown erased name; CFA identifier )
AT 8611
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000ABEB85
DOCOL
w85F1 t.DROP w56A7 w8598 t.;S
AT 8625

( w862D | NFA 8625 CFA 862D )
( Unknown erased name; CFA identifier )
AT 8625
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D31186
DOCOL
w85F1 t.2DROP t.;S
AT 8635

( w863B | NFA 8635 CFA 863B )
( Unknown erased name; CFA identifier )
AT 8635
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B52586
DOCOL
LIT8 1F t.SOUND-COMMAND! w466D t.@ t.DUP w7CA3 t.> w858D t.1+
t.C! w7CB0 t.+ t.1 t.- w70D5 w7CA3 w7CB0 t.+ t.1 t.- w7134
w59C3 t.32 t.PAUSE w5868 t.DROP w4369 t.@ w4678 t.C@
t.0BRANCH CELL 0019 ( -> 8695 )
w7CBD w70D5 t.3 w4369 t.@ w7C04 LIT8 0C t.SOUND-COMMAND! w59C3
t.32 t.PAUSE
( label 8695 )
w59C3 t.2 w858D t.C! LIT8 23 t.SOUND-COMMAND! w7CCA LIT16 0019
w466D t.@ w7CA3 t.- t.ABS w8619 w6CF7 LIT8 15 t.SOUND-COMMAND!
w7CA3 w466D t.! w5C86 w5CC2 w5CF6 w4369 t.@ w5BF6 t.1 t.;S
AT 86D1

( w86D7 | NFA 86D1 CFA 86D7 )
( Unknown erased name; CFA identifier )
( Decoded text: Message lines )
( line 1 $86DD: CO? )
AT 86D1
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CF3586
DOVAR
BYTES 05000103434F3F54
AT 86E1

( w86E6 | NFA 86E1 CFA 86E6 )
( Unknown erased name; CFA identifier )
AT 86E1
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CBD186
DOCOL
t.>R LIT8 15 t.SOUND-COMMAND! t.2+ w6D82 w5D36 w5D36 w5D36
w5D36 t.R> t.;S
AT 86FF

( w8706 | NFA 86FF CFA 8706 )
( Unknown erased name; CFA identifier )
AT 86FF
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C4E186
DOCOL
w86E6 w83D0 t.;S
AT 870E

( w8714 | NFA 870E CFA 8714 )
( Unknown erased name; CFA identifier )
AT 870E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000DAFF86
DOCOL
t.CLEAR-TEXT-AREA w86D7 t.3 w7B54 w8706 w7CB0 t.+ w5D36 t.;S
AT 8728

( w872E | NFA 8728 CFA 872E )
( Unknown erased name; CFA identifier )
AT 8728
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B60E87
DOCOL
w8714
t.0BRANCH CELL 000B ( -> 873F )
w7CA3 w7134 LIT8 1C t.SOUND-COMMAND!
( label 873F )
w59C3 t.1 t.;S
AT 8745

( w874C | NFA 8745 CFA 874C )
( Unknown erased name; CFA identifier )
AT 8745
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D42887
DOCOL
t.CLEAR-TEXT-AREA LIT8 13 t.SOUND-COMMAND! w6D82 t.0 w47A4 t.!
w59C3 t.1 t.;S
AT 8763

( w8768 | NFA 8763 CFA 8768 )
( Unknown erased name; CFA identifier )
AT 8763
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C44587
DOCOL
LIT8 28 t.SOUND-COMMAND! w7CBD
t.0BRANCH CELL 0021 ( -> 8794 )
LIT8 28 t.SOUND-COMMAND! t.8 t.PAUSE t.4 w858D t.C! w7CA3 t.1+
w7CBD t.1 w862D w6CF7
t.BRANCH CELL 0007 ( -> 8799 )
( label 8794 )
LIT8 0B t.SOUND-COMMAND!
( label 8799 )
t.2 t.PAUSE t.;S
AT 879F

( w87A4 | NFA 879F CFA 87A4 )
( Unknown erased name; CFA identifier )
AT 879F
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C16387
DOCOL
w7EBD t.C@ w7CCA t.=
t.0BRANCH CELL 0020 ( -> 87D0 )
t.0 w858D t.1+ t.C! w8768 w7CA3 w7134 w59C3 w7CB0 w4369 t.@
w7BD6 t.1
t.BRANCH CELL 000A ( -> 87D8 )
( label 87D0 )
LIT16 0005 w7B54 w874C
( label 87D8 )
t.;S
AT 87DA

( w87E0 | NFA 87DA CFA 87E0 )
( Unknown erased name; CFA identifier )
AT 87DA
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B79F87
DOCOL
w86D7 w87A4 t.;S
AT 87E8

( w87EE | NFA 87E8 CFA 87EE )
( Unknown erased name; CFA identifier )
AT 87E8
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B8DA87
DOCOL
t.0 w858D t.1+ t.C! w8768 w7CA3 w7134 w59C3 w7CB0 w4369 t.@
w7BD6 t.1 t.;S
AT 880C

( w8812 | NFA 880C CFA 8812 )
( Unknown erased name; CFA identifier )
AT 880C
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B9E887
DOCOL
t.1 w858D t.1+ t.C! w8768 w7CA3 w70D5 w59C3 w7CB0 w4369 t.@
w7C04 t.1 t.;S
AT 8830

( w8836 | NFA 8830 CFA 8836 )
( Unknown erased name; CFA identifier )
( Decoded text: Message lines )
( line 1 $883C: JESTES DOROSLY? )
AT 8830
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CF0C88
DOVAR
BYTES 1100010F4A45535445733D444F524F536C593F20
AT 884C

( w8851 | NFA 884C CFA 8851 )
( Unknown erased name; CFA identifier )
AT 884C
( Saved dictionary header: flags, name bytes, link )
BYTES 8200DA3088
DOCOL
t.COUNT t.+ w874C t.;S
AT 885B

( w8861 | NFA 885B CFA 8861 )
( Unknown erased name; CFA identifier )
AT 885B
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B04C88
DOCOL
t.CLEAR-TEXT-AREA w8836 t.2 w7B54 w8706
t.0BRANCH CELL 0008 ( -> 8877 )
w7D7B
t.BRANCH CELL 0008 ( -> 887D )
( label 8877 )
t.2 w7B54 w8851
( label 887D )
t.;S
AT 887F

( w8885 | NFA 887F CFA 8885 )
( Unknown erased name; CFA identifier )
AT 887F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B15B88
DOCOL
w5390 w59C3 t.1 w7B54 w874C t.;S
AT 8893

( w8899 | NFA 8893 CFA 8899 )
( Unknown erased name; CFA identifier )
AT 8893
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B27F88
DOCOL
LIT8 13 t.SOUND-COMMAND! w7CA3 LIT16 00C8 t.<
t.0BRANCH CELL 0006 ( -> 88B0 )
w7CA3 w7134
( label 88B0 )
t.8 t.PAUSE w59C3 t.2 w7B54 w874C t.;S
AT 88BE

( w88C4 | NFA 88BE CFA 88C4 )
( Unknown erased name; CFA identifier )
AT 88BE
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B59388
DOCOL
w7CB0 w7B87
t.0BRANCH CELL 0008 ( -> 88D4 )
w7D7B
t.BRANCH CELL 0015 ( -> 88E7 )
( label 88D4 )
LIT8 13 t.SOUND-COMMAND! t.CLEAR-TEXT-AREA t.3 w7B54 w6D82
w7D4A w59C3 t.1
( label 88E7 )
t.;S
AT 88E9

( w88EF | NFA 88E9 CFA 88EF )
( Unknown erased name; CFA identifier )
AT 88E9
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B6BE88
DOCOL
t.0 w7B87
t.0BRANCH CELL 0006 ( -> 88FD )
w7CA3 w7134
( label 88FD )
w7CB0 w7243 t.! w7684 w7FCD t.;S
AT 8909

( w890F | NFA 8909 CFA 890F )
( Unknown erased name; CFA identifier )
AT 8909
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B8E988
DOCOL
w7CA3 w70D5 w5390 LIT8 21 t.SOUND-COMMAND! w59C3 t.1 t.;S
AT 8922

( w8928 | NFA 8922 CFA 8928 )
( Unknown erased name; CFA identifier )
AT 8922
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B90989
DOCOL
t.0 w7EEB t.! w7EF5 t.;S
AT 8934

( w893A | NFA 8934 CFA 893A )
( Unknown erased name; CFA identifier )
AT 8934
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B12289
DOCOL
w7CCA w8230
t.0BRANCH CELL 0008 ( -> 894A )
w87EE
t.BRANCH CELL 0017 ( -> 895F )
( label 894A )
t.CLEAR-TEXT-AREA LIT8 13 t.SOUND-COMMAND! LIT16 0005 w7B54
w6D82 w7D4A w59C3 t.1
( label 895F )
t.;S
AT 8961

( w8967 | NFA 8961 CFA 8967 )
( Unknown erased name; CFA identifier )
( Decoded text: Message lines )
( line 1 $896D: W PORZADKU )
AT 8961
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D03489
DOVAR
BYTES 0C00010A573D504F525A61444B5520
AT 8978

( w897E | NFA 8978 CFA 897E )
( Unknown erased name; CFA identifier )
AT 8978
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B26189
DOCOL
w86D7 w7EBD t.C@ t.DUP t.>R t.CLEAR-TEXT-AREA w7CB0 t.=
t.0BRANCH CELL 0017 ( -> 89A9 )
LIT8 14 t.SOUND-COMMAND! t.1 w7CCA w823F w8967 t.2+ w6D82
t.BRANCH CELL 001F ( -> 89C6 )
( label 89A9 )
LIT16 0005 w7B54 LIT8 13 t.SOUND-COMMAND! w7CBD t.R t.=
t.0BRANCH CELL 0008 ( -> 89C4 )
w8555
t.BRANCH CELL 0004 ( -> 89C6 )
( label 89C4 )
w6D82
( label 89C6 )
t.R> t.DROP w7D4A w7CA3 w70D5 t.64 t.PAUSE LIT8 0C
t.SOUND-COMMAND! w59C3 t.1 t.;S
AT 89DF

( w89E5 | NFA 89DF CFA 89E5 )
( Unknown erased name; CFA identifier )
AT 89DF
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B37889
DOCOL
w8714 t.DROP w7CCA w8230 t.0=_12DE
t.0BRANCH CELL 000B ( -> 89FE )
w7CA3 w7134 LIT8 1C t.SOUND-COMMAND!
( label 89FE )
w59C3 t.1 t.;S
AT 8A04

( w8A0A | NFA 8A04 CFA 8A0A )
( Unknown erased name; CFA identifier )
( Decoded text: Message lines )
( line 1 $8A10: PODAJ HASLO )
AT 8A04
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D3DF89
DOVAR
BYTES 0D00010B504F44414A3D4841536C4F202020
AT 8A1E

( w8A26 | NFA 8A1E CFA 8A26 )
( Unknown erased name; CFA identifier )
AT 8A1E
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C4048A
DOCOL
t.>R w86E6 t.R> w8389 t.;S
AT 8A32

( w8A38 | NFA 8A32 CFA 8A38 )
( Unknown erased name; CFA identifier )
AT 8A32
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B61E8A
DOCOL
t.CLEAR-TEXT-AREA w8A0A t.4 w7B54 LIT16 0014 w8A26
t.0BRANCH CELL 0008 ( -> 8A52 )
w87EE
t.BRANCH CELL 0008 ( -> 8A58 )
( label 8A52 )
t.4 w7B54 w8851
( label 8A58 )
t.;S
AT 8A5A

( w8A60 | NFA 8A5A CFA 8A60 )
( Unknown erased name; CFA identifier )
AT 8A5A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B7328A
DOCOL
w7EA8 w87A4 t.;S
AT 8A68

( w8A6E | NFA 8A68 CFA 8A6E )
( Unknown erased name; CFA identifier )
AT 8A68
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B85A8A
DOCOL
LIT8 15 t.SOUND-COMMAND! t.32 t.PAUSE t.0 t.;S
AT 8A7D

( w8A83 | NFA 8A7D CFA 8A83 )
( Unknown erased name; CFA identifier )
AT 8A7D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B9688A
DOCOL
t.1 w7CCA w823F w87EE t.;S
AT 8A8F

( w8A95 | NFA 8A8F CFA 8A95 )
( Unknown erased name; CFA identifier )
AT 8A8F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B07D8A
DOCOL
t.0 w7CCA w823F w8812 t.;S
AT 8AA1

( w8AA7 | NFA 8AA1 CFA 8AA7 )
( Unknown erased name; CFA identifier )
AT 8AA1
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B18F8A
DOCOL
w7CBD w8230
t.0BRANCH CELL 0008 ( -> 8AB7 )
w8198
t.BRANCH CELL 0008 ( -> 8ABD )
( label 8AB7 )
t.4 w7B54 w874C
( label 8ABD )
t.;S
AT 8ABF

( w8AC7 | NFA 8ABF CFA 8AC7 )
( Unknown erased name; CFA identifier )
AT 8ABF
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A1A18A
DOCOL
t.>R t.R w8230 t.+ t.R> w823F t.;S
AT 8AD7

( w8ADD | NFA 8AD7 CFA 8ADD )
( Unknown erased name; CFA identifier )
AT 8AD7
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B4BF8A
DOCOL
w86D7 w7EBD t.DUP t.>R t.C@ w7CB0 t.=
t.0BRANCH CELL 0022 ( -> 8B11 )
w7CA3 w70D5 w7CBD w8230 t.1 t.AND w7CCA w8AC7 t.16
t.SOUND-COMMAND! t.R> w811C w59C3 t.1
t.BRANCH CELL 000E ( -> 8B1D )
( label 8B11 )
LIT16 0005 w7B54 w874C t.R> t.DROP
( label 8B1D )
t.;S
AT 8B1F

( w8B25 | NFA 8B1F CFA 8B25 )
( Unknown erased name; CFA identifier )
AT 8B1F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B5D78A
DOCOL
LIT8 07 t.SOUND-COMMAND! w7CA3 w8230 t.DUP t.3 t.= t.- t.2
w7B54 t.SWAP w852D w6D82 t.0 t.;S
AT 8B46

( w8B4C | NFA 8B46 CFA 8B4C )
( Unknown erased name; CFA identifier )
AT 8B46
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B61F8B
DOCOL
t.0 w7B87
t.0BRANCH CELL 001A ( -> 8B6E )
w7CBD w8230 t.1 t.AND t.MINUS w7CCA w8AC7 t.3 LIT16 001C t.0
w70A2
( label 8B6E )
w88EF t.;S
AT 8B72

( w8B78 | NFA 8B72 CFA 8B78 )
( Unknown erased name; CFA identifier )
AT 8B72
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B7468B
DOCOL
w7CCA w8230 t.2 t.=
t.0BRANCH CELL 0008 ( -> 8B8C )
w87EE
t.BRANCH CELL 000A ( -> 8B94 )
( label 8B8C )
LIT16 0006 w7B54 w874C
( label 8B94 )
t.;S
AT 8B96

( w8B9C | NFA 8B96 CFA 8B9C )
( Unknown erased name; CFA identifier )
AT 8B96
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B8728B
DOCOL
w7CCA w8230 t.2 t.=
t.0BRANCH CELL 0042 ( -> 8BEA )
t.3 w70D5 w87EE w4000 t.C@ t.8 w4000 t.C! t.3 t.PAUSE w4000
t.C! t.1 w7CD7 w823F t.-1 w7CCA w8AC7 t.0 LIT16 000A w823F
t.16 t.PAUSE LIT16 0006 w7B54 t.1 w852D w874C
t.BRANCH CELL 000A ( -> 8BF2 )
( label 8BEA )
LIT16 0006 w7B54 w874C
( label 8BF2 )
t.;S
AT 8BF4

( w8BFA | NFA 8BF4 CFA 8BFA )
( Unknown erased name; CFA identifier )
AT 8BF4
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B0968B
DOCOL
w7EA8 w7EBD t.DUP t.>R t.C@ w7CA3 t.= w5390
t.0BRANCH CELL 003A ( -> 8C48 )
w7CB0 w8230
t.0BRANCH CELL 0010 ( -> 8C26 )
t.3 w7B54 t.1 w852D w874C
t.BRANCH CELL 0020 ( -> 8C44 )
( label 8C26 )
t.3 w7CB0 w823F LIT16 0014 t.SOUND-COMMAND! t.R w811C w59C3
t.CLEAR-TEXT-AREA t.3 w7B54 w6D82 w7D4A t.1
( label 8C44 )
t.BRANCH CELL 000C ( -> 8C52 )
( label 8C48 )
t.3 w7B54 t.2 w852D w874C
( label 8C52 )
t.R> t.DROP w59C3 t.;S
AT 8C5A

( w8C60 | NFA 8C5A CFA 8C60 )
( Unknown erased name; CFA identifier )
AT 8C5A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B1F48B
DOCOL
LIT8 16 t.SOUND-COMMAND! w7CA3 w7134 t.1 w7CB0 w8AC7 w59C3 t.1
t.;S
AT 8C77

( w8C7D | NFA 8C77 CFA 8C7D )
( Unknown erased name; CFA identifier )
AT 8C77
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B25A8C
DOCOL
LIT8 16 t.SOUND-COMMAND! w7CA3 w70D5 t.-1 w7CB0 w8AC7 t.3
LIT16 001C t.0 w70A2 w59C3 t.1 t.;S
AT 8C9E

( w8CA4 | NFA 8C9E CFA 8CA4 )
( Unknown erased name; CFA identifier )
AT 8C9E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B9778C
DOCOL
w7CCA w8230 t.2 t.=
t.0BRANCH CELL 0026 ( -> 8CD6 )
w7CD7 w8230
t.0BRANCH CELL 000E ( -> 8CC6 )
w5868 t.DROP w59C3 w87EE
t.BRANCH CELL 000E ( -> 8CD2 )
( label 8CC6 )
LIT16 0006 w7B54 t.1 w852D w874C
( label 8CD2 )
t.BRANCH CELL 000A ( -> 8CDE )
( label 8CD6 )
LIT16 0006 w7B54 w874C
( label 8CDE )
t.;S
AT 8CE0

( w8CE6 | NFA 8CE0 CFA 8CE6 )
( Unknown erased name; CFA identifier )
AT 8CE0
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B59E8C
DOCOL
w86D7 w7EBD t.DUP t.>R t.C@ t.DUP w7CCA t.= t.SWAP w7CD7 t.=
t.+
t.0BRANCH CELL 0022 ( -> 8D24 )
w7CE6 w70D5 t.16 t.SOUND-COMMAND! t.R> w811C w59C3 t.32
t.PAUSE w87EE t.DROP t.8 t.PAUSE w8812
t.BRANCH CELL 000D ( -> 8D2F )
( label 8D24 )
LIT8 07 w7B54 w874C t.R> t.DROP
( label 8D2F )
t.;S
AT 8D31

( w8D37 | NFA 8D31 CFA 8D37 )
( Unknown erased name; CFA identifier )
( Decoded text: Message lines )
( line 1 $8D3D: JAKIE )
AT 8D31
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C1E08C
DOVAR
BYTES 070001054A414B49452020
AT 8D44

( w8D4A | NFA 8D44 CFA 8D4A )
( Unknown erased name; CFA identifier )
AT 8D44
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B4318D
DOCOL
t.CLEAR-TEXT-AREA w8D37 t.1 w7B54 t.8 w8A26
t.0BRANCH CELL 0094 ( -> 8DEE )
t.CLEAR-TEXT-AREA w47DC LIT8 21 t.SOUND-COMMAND! t.64 t.PAUSE
LIT8 14 t.SOUND-COMMAND! LIT8 32 t.PAUSE t.8 t.INPUT-STATE t.!
t.2 w4A6F t.! LIT8 16 w4B95 t.0 t.RESOURCE-ADDR t.ADGR t.@
LIT8 50 t.SOUND-COMMAND! t.<MOVE w47E9 t.1 t.RESOURCE-ADDR
LIT16 0006 t.+ w6D82 LIT8 FF LIT16 02FC t.C! t.1 w858D t.C!
t.0 LIT8 E2 t.C!
( label 8DB7 )
LIT8 E2 t.C@
t.0BRANCH CELL 000F ( -> 8DCD )
t.0 t.16 w85AC t.0 LIT8 E2 t.C!
( label 8DCD )
LIT16 02FC t.C@ LIT8 FF t.= t.0=_12DE
t.0BRANCH CELL FFDB ( -> 8DB7 )
w6CF7 t.1 w4A6F t.! w4B4C t.1
t.BRANCH CELL 000C ( -> 8DF8 )
( label 8DEE )
t.1 w7B54 t.COUNT t.+ w874C
( label 8DF8 )
t.;S
AT 8DFA

( DICTIONARY-MARK | NFA 8DFA CFA 8E00 )
( Inferred descriptive name, not recovered original: Two )
( saved cells hold HERE and LATEST, consumed by dictionary )
( restore. )
AT 8DFA
( Saved dictionary header: flags, name bytes, link )
BYTES 820048A0448D
DOVAR
BYTES 1D8E068E
AT 8E06

( SAVE-DICTIONARY-MARK | NFA 8E06 CFA 8E0B )
( Inferred descriptive name, not recovered original: Saves )
( HERE and LATEST into CFA8E00. )
AT 8E06
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C8FA8D
DOCOL
t.HERE t.DICTIONARY-MARK t.! t.LATEST t.DICTIONARY-MARK t.2+
t.! t.;S
AT 8E1D

( RESTORE-DICTIONARY | NFA 8E1D CFA 8E22 )
( Inferred descriptive name, not recovered original: )
( Restores DP, cold-start DP/FENCE cells and latest )
( dictionary link from saved mark. )
AT 8E1D
( Saved dictionary header: flags, name bytes, link )
BYTES 8200BE068E
DOCOL
t.DICTIONARY-MARK t.@ t.DP t.! t.DICTIONARY-MARK t.@ t.DUP
LIT16 001C t.+ORIGIN t.! LIT16 001E t.+ORIGIN t.!
t.DICTIONARY-MARK t.2+ t.@ LIT16 000C t.+ORIGIN t.! t.;S
AT 8E52

( TITLE-DISPLAY-DATA | NFA 8E52 CFA 8E5B )
( Inferred descriptive name, not recovered original: Data )
( selected as the active display/palette structure by )
( CFA8EA1. )
AT 8E52
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000D91D8E
DOVAR
BYTES C634DA32F44634F44836F44838F44A3AF44C3CF44E3EF44E3CF44E3A
BYTES F44C38F44C36F44A34F44832F446A63C880000
AT 8E8C

( LOAD-TITLE-ASSETS | NFA 8E8C CFA 8E92 )
( Inferred descriptive name, not recovered original: Calls )
( LOAD-ASSET-GROUP with group 3. )
AT 8E8C
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D9528E
DOCOL
t.3 t.LOAD-ASSET-GROUP t.;S
AT 8E9A

( INSTALL-TITLE-DISPLAY | NFA 8E9A CFA 8EA1 )
( Inferred descriptive name, not recovered original: )
( Selects title display data, installs thirteen repeated )
( display regions and a DLI vector. )
AT 8E9A
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D48C8E
DOCOL
t.TITLE-DISPLAY-DATA w4025 t.! w3FDA t.1+ w3FE4 LIT16 000D
LIT16 0000 t.(DO)
( label 8EB9 )
w3FDA LIT16 0030 t.+ t.I t.4 t.* t.+ w3FE4
t.(LOOP) CELL FFEC ( -> 8EB9 )
w3FDA LIT16 006D t.+ w3FE4 LIT16 403C w4070 t.;S
AT 8EE1

( INIT-TITLE-DISPLAY | NFA 8EE1 CFA 8EEA )
( Inferred descriptive name, not recovered original: Loads )
( title assets, installs scene and title display state, )
( then restores DMA. )
AT 8EE1
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000CC9A8E
DOCOL
t.LOAD-TITLE-ASSETS t.INSTALL-SCENE-ASSETS
t.INSTALL-TITLE-DISPLAY t.RESTORE-DISPLAY-DMA t.;S
AT 8EF6

( TITLE-COLORS | NFA 8EF6 CFA 8EFB )
( Inferred descriptive name, not recovered original: )
( Returns the address 42 bytes into TITLE-DISPLAY-DATA, )
( used as three mutable color registers. )
AT 8EF6
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C3E18E
DOCOL
t.TITLE-DISPLAY-DATA LIT16 002A t.+ t.;S
AT 8F07

( TITLE-HUES | NFA 8F07 CFA 8F0C )
( Inferred descriptive name, not recovered original: )
( Three-byte table $80,$D0,$80 used as color bases during )
( title transitions. )
AT 8F07
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D4F68E
DODOES
( DOES> thread at 412C )
BYTES 2C4180D080
AT 8F13

( TITLE-LEVELS | NFA 8F13 CFA 8F18 )
( Inferred descriptive name, not recovered original: )
( Three-byte table 6,12,8 used as brightness limits during )
( title transitions. )
AT 8F13
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D4078F
DODOES
( DOES> thread at 412C )
BYTES 2C41060C08
AT 8F1F

( TITLE-FADE-IN-STEP | NFA 8F1F CFA 8F25 )
( Inferred descriptive name, not recovered original: Sets )
( each color base at its threshold, then increments )
( brightness by two below that threshold. )
AT 8F1F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C1138F
DOCOL
t.3 t.0 t.(DO)
( label 8F2D )
t.DUP t.I t.TITLE-LEVELS t.C@ t.=
t.0BRANCH CELL 0010 ( -> 8F49 )
t.I t.TITLE-HUES t.C@ t.TITLE-COLORS t.I t.+ t.C!
( label 8F49 )
t.DUP t.I t.TITLE-LEVELS t.C@ t.<
t.0BRANCH CELL 000C ( -> 8F61 )
t.2 t.TITLE-COLORS t.I t.+ w4732
( label 8F61 )
t.(LOOP) CELL FFCA ( -> 8F2D )
t.DROP t.;S
AT 8F69

( TITLE-FADE-IN | NFA 8F69 CFA 8F70 )
( Inferred descriptive name, not recovered original: Runs )
( fade-in steps from 12 down to zero, pausing three ticks )
( after each. )
AT 8F69
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D31F8F
DOCOL
LIT16 FFFE LIT16 000C t.(DO)
( label 8F7C )
t.I t.TITLE-FADE-IN-STEP t.3 t.PAUSE LIT16 FFFE
t.(+LOOP) CELL FFF2 ( -> 8F7C )
t.;S
AT 8F8E

( TITLE-FADE-OUT-STEP | NFA 8F8E CFA 8F94 )
( Inferred descriptive name, not recovered original: Clears )
( each color at its base, otherwise subtracts two below its )
( brightness threshold. )
AT 8F8E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C9698F
DOCOL
t.3 t.0 t.(DO)
( label 8F9C )
t.TITLE-COLORS t.I t.+ t.C@ t.I t.TITLE-HUES t.C@ t.=
t.0BRANCH CELL 000C ( -> 8FBA )
t.0 t.TITLE-COLORS t.I t.+ t.C!
( label 8FBA )
t.DUP t.I t.TITLE-LEVELS t.C@ t.<
t.0BRANCH CELL 000E ( -> 8FD4 )
LIT16 FFFE t.TITLE-COLORS t.I t.+ w4732
( label 8FD4 )
t.(LOOP) CELL FFC6 ( -> 8F9C )
t.DROP t.;S
AT 8FDC

( TITLE-FADE-OUT | NFA 8FDC CFA 8FE3 )
( Inferred descriptive name, not recovered original: Runs )
( fade-out steps for levels zero through twelve, pausing )
( three ticks after each. )
AT 8FDC
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C58E8F
DOCOL
LIT16 000E t.0 t.(DO)
( label 8FED )
t.I t.TITLE-FADE-OUT-STEP t.3 t.PAUSE t.2
t.(+LOOP) CELL FFF4 ( -> 8FED )
t.;S
AT 8FFD

( PRINT-TEXT-LINES | NFA 8FFD CFA 9006 )
( Inferred descriptive name, not recovered original: )
( Traverses a count-prefixed collection of counted strings, )
( STYPEs each and emits CR. )
AT 8FFD
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000C5DC8F
DOCOL
t.COUNT t.0 t.(DO)
( label 900E )
t.DUP t.COUNT t.STYPE t.DUP t.C@ t.+ t.1+ t.CR
t.(LOOP) CELL FFEE ( -> 900E )
t.DROP t.;S
AT 9026

( PRINT-CENTERED-LINES | NFA 9026 CFA 902F )
( Inferred descriptive name, not recovered original: )
( Traverses count-prefixed strings, centers each at column )
( 19 minus half length and outputs successive rows. )
AT 9026
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000C5FD8F
DOCOL
t.COUNT t.0 t.(DO)
( label 9037 )
t.DUP t.COUNT LIT16 0013 t.OVER t.2 t./ t.- t.I t.2+ t.POS
t.STYPE t.DUP t.C@ t.+ t.1+
t.(LOOP) CELL FFDE ( -> 9037 )
t.DROP t.;S
AT 905F

( TITLE-SKIP-FLAG | NFA 905F CFA 9066 )
( Inferred descriptive name, not recovered original: Set by )
( polling START or controller-zero trigger. )
AT 905F
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C12690
DOVAR
CELL 0000
AT 906A

( POLL-TITLE-SKIP | NFA 906A CFA 9071 )
( Inferred descriptive name, not recovered original: Reads )
( CONSOL [$D01F], compares to six [START], combines )
( controller-zero trigger, stores CFA9066. )
AT 906A
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A15F90
DOCOL
LIT16 D01F t.C@ LIT16 0006 t.= t.0 t.TRIGGER@ t.0=_12DE t.+
t.TITLE-SKIP-FLAG t.! t.;S
AT 908D

( TITLE-SKIP? | NFA 908D CFA 9096 )
( Inferred descriptive name, not recovered original: )
( Fetches the title-skip flag. )
AT 908D
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000CF6A90
DOCOL
t.TITLE-SKIP-FLAG t.@ t.;S
AT 909E

( WAIT-TITLE-PAGE | NFA 909E CFA 90A4 )
( Inferred descriptive name, not recovered original: Fades )
( in, polls START/trigger for up to 23 ten-tick waits, then )
( fades out. )
AT 909E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C38D90
DOCOL
t.TITLE-FADE-IN LIT16 0017 t.0 t.(DO)
( label 90B0 )
t.POLL-TITLE-SKIP t.TITLE-SKIP?
t.0BRANCH CELL 0004 ( -> 90BA )
t.LEAVE
( label 90BA )
LIT16 000A t.PAUSE
t.(LOOP) CELL FFEE ( -> 90B0 )
t.TITLE-FADE-OUT t.;S
AT 90C8

( TITLE-PAGE-ADDR | NFA 90C8 CFA 90CE )
( Inferred descriptive name, not recovered original: Looks )
( up a packed text page in resource two at offset four. )
AT 90C8
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C19E90
DOCOL
t.2 t.RESOURCE-ADDR t.4 t.+ w4763 t.;S
AT 90DC

( SHOW-TITLE-PAGES | NFA 90DC CFA 90E4 )
( Inferred descriptive name, not recovered original: Loops )
( over packed title text pages, prints centered lines, )
( waits/fades, exits when START or trigger is pressed. )
AT 90DC
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D8C890
DOCOL
t.TITLE-FADE-OUT
( label 90E8 )
t.0 LIT16 004D t.C! t.0 t.TITLE-PAGE-ADDR t.ILEL t.0 t.(DO)
( label 90FA )
t.CLEAR-TEXT-AREA t.I t.TITLE-PAGE-ADDR t.2+
t.PRINT-CENTERED-LINES t.WAIT-TITLE-PAGE t.TITLE-SKIP?
t.0BRANCH CELL 0004 ( -> 910E )
t.LEAVE
( label 910E )
t.(LOOP) CELL FFEA ( -> 90FA )
t.TITLE-SKIP?
t.0BRANCH CELL FFD2 ( -> 90E8 )
LIT16 0058 t.@ LIT16 0190 t.ERASE t.;S
AT 9126

( SAVE-EXTENDED-IMAGE | NFA 9126 CFA 912D )
( Inferred descriptive name, not recovered original: Uses )
( ordinary SAVE below HE, otherwise patches startup and )
( SAVE, writes extra pages through BDISK and restores hooks. )
AT 9126
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C5DC90
DOCOL
t.HERE t.HE t.U<
t.0BRANCH CELL 0008 ( -> 913F )
t.SAVE
t.BRANCH CELL 0058 ( -> 9195 )
( label 913F )
LIT16 7C35 LIT16 1ECC t.! LIT16 35B4 LIT16 2984 t.! t.HERE
t.HE t.- LIT8 80 t./ t.1+ t.SP& t.1+ t.C! t.SAVE t.HE t.SP&
t.C@ t.SP& t.1+ t.C@ t.0 t.S-L t.! t.BDISK LIT8 08 t.?ERROR
LIT16 115F LIT16 1ECC t.! LIT16 1625 LIT16 2984 t.!
( label 9195 )
t.;S
AT 9197

( BOOT-INTRO | NFA 9197 CFA 919F )
( Inferred descriptive name, not recovered original: )
( Selects intro resource base, initializes title display, )
( shows title pages, restores dictionary, selects gameplay )
( resources and enters GAME-LOOP. )
AT 9197
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000CC2691
DOCOL
LIT16 96C8 t.RESOURCE-BASE t.! t.3 w59DF t.!
t.INIT-TITLE-DISPLAY t.2 t.PAUSE w6CF7 LIT8 50
t.SOUND-COMMAND! t.SHOW-TITLE-PAGES t.RESTORE-DICTIONARY
LIT16 9150 t.RESOURCE-BASE t.! LIT16 7AF2 t.CFA LIT16 1ECE t.!
w6CF7 t.0 t.TITLE-LEVELS t.TITLE-COLORS t.3 t.CMOVE
t.GAME-LOOP t.;S
AT 91E4

( PREVIOUS-NFA | NFA 91E4 CFA 91EA )
( Inferred descriptive name, not recovered original: )
( Computes PFA LFA @ to obtain the prior dictionary header. )
AT 91E4
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CE9791
DOCOL
t.PFA t.LFA t.@ t.;S
AT 91F4

( STRIP-NAMES-AND-SAVE | NFA 91F4 CFA 9200 )
( Inferred descriptive name, not recovered original: )
( Patches ABORT to the intro; traverses dictionary links )
( and erases every name except its final byte; saves the )
( extended image. )
AT 91F4
( Saved dictionary header: flags, name bytes, link )
BYTES 88000000000000004EA0E491
DOCOL
t.LATEST t.DUP t.PREVIOUS-NFA t.PREVIOUS-NFA t.PFA t.CFA
LIT16 1ECE t.!
( label 9214 )
t.DUP t.1+ t.OVER t.@ LIT8 1F t.AND t.1 t.- t.DUP
t.0BRANCH CELL 0008 ( -> 9231 )
t.ERASE
t.BRANCH CELL 0004 ( -> 9233 )
( label 9231 )
t.2DROP
( label 9233 )
t.PREVIOUS-NFA t.DUP LIT16 0F2F t.U<
t.0BRANCH CELL FFD5 ( -> 9214 )
t.DROP t.SAVE-EXTENDED-IMAGE t.;S
AT 9247
T-FINISH
