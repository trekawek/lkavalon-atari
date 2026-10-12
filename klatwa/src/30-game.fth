( Klatwa v1 30-game.fth: target 6018..882B )
( Hexadecimal. BYTES emits bytes; CELL emits 16-bit cells. )
( LIT8/LIT16 compile literals; branches retain signed )
( offsets. )

( w601F | NFA 6018 CFA 601F )
( Unknown erased name; CFA identifier )
AT 6018
( Header: flags, saved name and link )
BYTES 84000000A1FA5F
DOCOL
w5E93 LIT16 069A t.- w5E9E t.! t.;S
AT 602F

( w6035 | NFA 602F CFA 6035 )
( Unknown erased name; CFA identifier )
AT 602F
( Header: flags, saved name and link )
BYTES 830000CC1860
DOCOL
t.1 LIT16 02F0 t.C! t.DISABLE-DISPLAY-DMA w601F LIT8 0C w5E9E
t.@ LIT16 0006 t.- w480C w5EE5 t.0 t.PLAY-MUSIC w4C3E w5E7E
t.0 t.1 t.POS
( ATASCII text:       )
t.(.")
BYTES 052020202020
LIT16 0007 LIT16 BC00 w480C LIT16 00BC LIT16 02F4 t.C! LIT8 0A
w5E93 w480C t.RESTORE-DISPLAY-DMA t.;S
AT 6089

( w608E | NFA 6089 CFA 608E )
( Unknown erased name; CFA identifier )
AT 6089
( Header: flags, saved name and link )
BYTES 8200A32F60
DOCOL
( ATASCII text: .=*********=#$=*********=. )
t.(S")
BYTES 1AA43D2A2A2A2A2A2A2A2A2A3D23243D2A2A2A2A2A2A2A2A2A3DA3
t.;S
AT 60AF

( w60B5 | NFA 60AF CFA 60B5 )
( Unknown erased name; CFA identifier )
AT 60AF
( Header: flags, saved name and link )
BYTES 830000D38960
DOCOL
LIT8 07 t.1 t.POS LIT8 A2 t.EMIT
( ATASCII text: ===KSIeGA==! )
t.(S")
BYTES 0C3D3D3D4B53496547413D3D21
LIT8 22 t.EMIT
( ATASCII text: ==CZARoW===. )
t.(S")
BYTES 0C3D3D435A41526F573D3D3DA1
LIT8 07 t.2 t.POS w608E LIT8 05 t.0 t.(DO)
( label 60F6 )
t.I t.3 t.+ t.Y! LIT8 07 t.X! t.I t.2 t.* w5577 LIT16 0005 t.+
LIT8 0D t.STYPE LIT8 14 t.X! t.I t.2 t.* t.1+ w5577 LIT16 0005
t.+ LIT8 0D t.STYPE
t.(LOOP) CELL FFC4 ( -> 60F6 )
LIT8 07 LIT8 08 t.POS w608E LIT8 07 LIT8 09 t.POS
( ATASCII text: .......................... )
t.(S")
BYTES 1AABDCDCDCDCDCDCDCDCDCDCDCA5A6DCDCDCDCDCDCDCDCDCDCDCAD
t.;S
AT 6165

( w616C | NFA 6165 CFA 616C )
( Unknown erased name; CFA identifier )
AT 6165
( Header: flags, saved name and link )
BYTES 84000000DAAF60
DOCOL
LIT8 13 w6000 t.;S
AT 6175

( w617B | NFA 6175 CFA 617B )
( Unknown erased name; CFA identifier )
AT 6175
( Header: flags, saved name and link )
BYTES 830000C26561
DOCOL
w5A35 t.DUP t.>R t.WORD-COUNT w3896 t.DUP
t.0BRANCH CELL 000A ( -> 6195 )
t.R t.+ t.1+ t.1
( label 6195 )
t.R> t.DROP t.;S
AT 619B

( w61A0 | NFA 619B CFA 61A0 )
( Unknown erased name; CFA identifier )
AT 619B
( Header: flags, saved name and link )
BYTES 8200C37561
DODOES
( DOES> thread at 3F47 )
BYTES 473F40001700020C54454E3D435A41523D4E4945085A41445A49416C
BYTES 410100011C00020F4252414B3D43493D4A45444E45474F0A50525A45
BYTES 444D494F54555A45444D8242
AT 61E6

( w61EB | NFA 61E6 CFA 61EB )
( Unknown erased name; CFA identifier )
AT 61E6
( Header: flags, saved name and link )
BYTES 8200C39B61
DOVAR
BYTES 3B00040C4E49453D4D41535A3D4A557A0F4D414749435A4E454A3D4D
BYTES 4F43592C0F4A4544454E3D5A3D4B414D49454E490C4A613D50525A59
BYTES 57526F4349528341
AT 622D

( w6233 | NFA 622D CFA 6233 )
( Unknown erased name; CFA identifier )
AT 622D
( Header: flags, saved name and link )
BYTES 830000DAE661
DOCOL
t.C@ t.DUP t.0 t.1 w617B
t.0BRANCH CELL 000A ( -> 624B )
t.2DROP t.1
t.BRANCH CELL 0004 ( -> 624D )
( label 624B )
t.0=_12DE
( label 624D )
t.;S
AT 624F

( w6256 | NFA 624F CFA 6256 )
( Unknown erased name; CFA identifier )
AT 624F
( Header: flags, saved name and link )
BYTES 84000000C12D62
DOCOL
t.2 w58A4 t.@ t.0=_12DE
t.0BRANCH CELL 0093 ( -> 62F5 )
t.>R w5211 LIT8 0C LIT8 92 w50ED t.2 LIT16 0005 w511B LIT8 34
LIT16 0008 w513E t.0 w4F59 t.! t.0 w4F73 t.! w469B w60B5 t.1
w6000 w5D92 t.2 t.* t.+ w5577 t.2+ t.DUP t.C@ t.R> t.=
t.0BRANCH CELL 0032 ( -> 62DD )
t.1+ t.DUP w6233 t.SWAP t.1+ w6233 t.2DUP t.*
t.0BRANCH CELL 000A ( -> 62C9 )
t.2DROP t.1
t.BRANCH CELL 0012 ( -> 62D9 )
( label 62C9 )
w469B w616C t.+ t.1+ w61A0 t.2+ w45A4 t.0
( label 62D9 )
t.BRANCH CELL 0012 ( -> 62ED )
( label 62DD )
t.DROP w616C w469B t.0 w61A0 t.2+ w45A4 t.0
( label 62ED )
w5257 w51F5
t.BRANCH CELL 0010 ( -> 6303 )
( label 62F5 )
t.DROP w469B w616C w61EB t.2+ w45A4 t.0
( label 6303 )
t.;S
AT 6305

( w630A | NFA 6305 CFA 630A )
( Unknown erased name; CFA identifier )
AT 6305
( Header: flags, saved name and link )
BYTES 8200C34F62
DOVAR
BYTES 00000541
AT 6310

( w6316 | NFA 6310 CFA 6316 )
( Unknown erased name; CFA identifier )
AT 6310
( Header: flags, saved name and link )
BYTES 830000A10563
DOCOL
LIT8 0A t.0 t.(DO)
( label 631F )
t.I w5577 t.2+ t.C@ t.>R t.R t.OVER t.C@ t.= t.R> t.0=_12DE
t.+
t.0BRANCH CELL 000A ( -> 6343 )
t.I w5577 t.2+ t.LEAVE
( label 6343 )
t.(LOOP) CELL FFDA ( -> 631F )
t.2DUP t.3 t.CMOVE LIT8 05 t.+ w630A t.2+ t.! t.3 t.+ w630A
t.! t.;S
AT 6362

( w6369 | NFA 6362 CFA 6369 )
( Unknown erased name; CFA identifier )
AT 6362
( Header: flags, saved name and link )
BYTES 84000000C21063
DODOES
( DOES> thread at 3F47 )
BYTES 473F4A0103004E494309004E49453D504154525A01005E06005A4F53
BYTES 544157030057457A06005A4F4241435A0500434F3D544F0800504F43
BYTES 5A6154454B06004F44435A595405005A4150495301005001004B0100
BYTES 5206004F54576F525A07005A414D4B4E494A030049447A01000D0100
BYTES 0E080050525A455049535A01000606004F54576F525A08005A414B4C
BYTES 6543494507005A4E49535A435A0700504F444E4945730700444F544B
BYTES 4E494A01000601000D06005A424144414A01000D01001501000D0100
BYTES 0E010015030057457A06005A414752414A01000E06005A41506C4163
BYTES 07005A44454A4D494A01001504005A6C41500100150700504F444E49
BYTES 4573010012030049447A0A0050525A45435A5954414A08004E414349
BYTES 734E494A06005A424144414A01000501001601000D0700536C554348
BYTES 414A010024010015010015000000000000000000000000000000
AT 64B9

( w64BE | NFA 64B9 CFA 64BE )
( Unknown erased name; CFA identifier )
AT 64B9
( Header: flags, saved name and link )
BYTES 8200D46263
DOCON
CELL 97CA
AT 64C2

( w64C8 | NFA 64C2 CFA 64C8 )
( Unknown erased name; CFA identifier )
AT 64C2
( Header: flags, saved name and link )
BYTES 830000CBB964
DOVAR
CELL 0000
AT 64CC

( w64D2 | NFA 64CC CFA 64D2 )
( Unknown erased name; CFA identifier )
AT 64CC
( Header: flags, saved name and link )
BYTES 830000C5C264
DOVAR
CELL 0000
AT 64D6

( w64DB | NFA 64D6 CFA 64DB )
( Unknown erased name; CFA identifier )
AT 64D6
( Header: flags, saved name and link )
BYTES 8200C5CC64
DOVAR
CELL 0000
AT 64DF

( w64E5 | NFA 64DF CFA 64E5 )
( Unknown erased name; CFA identifier )
AT 64DF
( Header: flags, saved name and link )
BYTES 830000CBD664
DOCOL
LIT8 C8 t.+ t.1 w5993 w3F6D t.WORD-COUNT t.OVER t.>R w3896
t.-DUP
t.0BRANCH CELL 001A ( -> 6518 )
t.1 t.- t.R t.+ t.DUP t.2+ w64C8 t.! t.1+ t.C@
t.BRANCH CELL 0004 ( -> 651A )
( label 6518 )
t.1
( label 651A )
t.0 w64BE w481D w64BE w64D2 t.! t.R> t.DROP t.;S
AT 652C

( w6532 | NFA 652C CFA 6532 )
( Unknown erased name; CFA identifier )
AT 652C
( Header: flags, saved name and link )
BYTES 830000D2DF64
DOCOL
t.-DUP
t.0BRANCH CELL 002F ( -> 6567 )
LIT8 64 t.1 t.(DO)
( label 6541 )
t.I t.1 w5552 t.2+ w3F6D t.2+ t.DUP w64D2 t.! t.2+ t.C@ t.OVER
t.=
t.0BRANCH CELL 0004 ( -> 6561 )
t.LEAVE
( label 6561 )
t.(LOOP) CELL FFDE ( -> 6541 )
t.DROP
( label 6567 )
t.;S
AT 6569

( w656F | NFA 6569 CFA 656F )
( Unknown erased name; CFA identifier )
AT 6569
( Header: flags, saved name and link )
BYTES 830000D72C65
DOCOL
t.DUP w64DB t.! t.DUP LIT8 C8 t.>
t.0BRANCH CELL 0008 ( -> 6588 )
w6532
t.BRANCH CELL 0004 ( -> 658A )
( label 6588 )
w64E5
( label 658A )
t.;S
AT 658C

( w6593 | NFA 658C CFA 6593 )
( Unknown erased name; CFA identifier )
AT 658C
( Header: flags, saved name and link )
BYTES 84000000D26965
DOCOL
t.SWAP t.>R w6369 t.DUP t.C@ t.2 t.<
t.0BRANCH CELL 0008 ( -> 65AD )
t.2+ t.C@ w6369
( label 65AD )
t.WORD-COUNT t.DUP t.R t.C! t.R t.1+ t.SWAP t.CMOVE t.R>
t.COUNT t.+ t.;S
AT 65C5

( w65CA | NFA 65C5 CFA 65CA )
( Unknown erased name; CFA identifier )
AT 65C5
( Header: flags, saved name and link )
BYTES 8200C58C65
DODOES
( DOES> thread at 51CD )
BYTES CD512020202020202020202020202020202020202020
AT 65E2

( w65E8 | NFA 65E2 CFA 65E8 )
( Unknown erased name; CFA identifier )
AT 65E2
( Header: flags, saved name and link )
BYTES 830000D9C565
DOCOL
w47EF LIT8 4C t.ERASE w47EF t.1+ w5CE1 t.@
t.0BRANCH CELL 0014 ( -> 660F )
t.0 w6593 t.0 t.0 w65CA t.! t.1 w47EF w4C6A
( label 660F )
w64DB t.@
t.0BRANCH CELL 0047 ( -> 665C )
LIT8 0B t.1 t.(DO)
( label 661E )
t.I w64D2 t.@ w3F6D t.DUP t.C@
t.0BRANCH CELL 001E ( -> 664A )
t.2+ t.C@ t.DUP t.I t.1 t.- w47EF t.C@ t.+ w65CA t.! w6593
t.BRANCH CELL 0010 ( -> 6658 )
( label 664A )
t.DROP t.I t.1 t.- w47EF w4C6A t.LEAVE
( label 6658 )
t.(LOOP) CELL FFC4 ( -> 661E )
( label 665C )
w5CE1 t.@ w5157 t.C@ t.*
t.0BRANCH CELL 001C ( -> 6684 )
t.1 t.DUP w47EF t.C@ w65CA t.! w6593 t.DROP t.1 w47EF w4C6A
t.BRANCH CELL 0004 ( -> 6686 )
( label 6684 )
t.DROP
( label 6686 )
w47EF w45A4 t.;S
AT 668C

( w6692 | NFA 668C CFA 6692 )
( Unknown erased name; CFA identifier )
AT 668C
( Header: flags, saved name and link )
BYTES 830000D7E265
DOVAR
CELL 0000
AT 6696

( w669C | NFA 6696 CFA 669C )
( Unknown erased name; CFA identifier )
AT 6696
( Header: flags, saved name and link )
BYTES 830000D28C66
DOCOL
w5211 LIT8 15 w44F1 t.@ t.2 t./ t.- LIT8 89 w50ED w44F1 t.@
t.2 t.- w47EF t.C@ w511B LIT8 04 LIT8 08 w513E t.0 w4F73 t.1+
t.C! w44F1 t.@ t.2 t./ w44E8 t.@ t.2 t./MOD t.+ t.+ t.3 t.-
w4F73 t.C! w5D92 t.SWAP t.DROP t.DUP w64D2 t.@ w3F6D w6692 t.!
w65CA t.@ w5257 w51F5 t.;S
AT 6708

( w6710 | NFA 6708 CFA 6710 )
( Unknown erased name; CFA identifier )
AT 6708
( Header: flags, saved name and link )
BYTES 8500000000C29666
DOCOL
w65E8 w669C t.;S
AT 6718

( w671D | NFA 6718 CFA 671D )
( Unknown erased name; CFA identifier )
AT 6718
( Header: flags, saved name and link )
BYTES 8200D90867
DOCOL
w6692 t.@ t.+ t.2+ t.;S
AT 6729

( w672F | NFA 6729 CFA 672F )
( Unknown erased name; CFA identifier )
AT 6729
( Header: flags, saved name and link )
BYTES 830000C01867
DOCOL
w671D t.C@ t.;S
AT 6737

( w673C | NFA 6737 CFA 673C )
( Unknown erased name; CFA identifier )
AT 6737
( Header: flags, saved name and link )
BYTES 8200CB2967
DOCOL
w64C8 t.@ t.;S
AT 6744

( w6749 | NFA 6744 CFA 6749 )
( Unknown erased name; CFA identifier )
AT 6744
( Header: flags, saved name and link )
BYTES 8200CB3767
DOCOL
w673C t.C@ t.;S
AT 6751

( w6756 | NFA 6751 CFA 6756 )
( Unknown erased name; CFA identifier )
AT 6751
( Header: flags, saved name and link )
BYTES 8200CB4467
DOCOL
w673C t.1+ t.C@ t.;S
AT 6760

( w6765 | NFA 6760 CFA 6765 )
( Unknown erased name; CFA identifier )
AT 6760
( Header: flags, saved name and link )
BYTES 8200CB5167
DOCOL
w673C t.2+ t.C@ t.;S
AT 676F

( w6774 | NFA 676F CFA 6774 )
( Unknown erased name; CFA identifier )
AT 676F
( Header: flags, saved name and link )
BYTES 8200C26067
DOCOL
t.>R t.2DUP t.R w617B
t.0BRANCH CELL 000E ( -> 678E )
t.2DROP t.R> t.2DROP t.1
t.BRANCH CELL 001A ( -> 67A6 )
( label 678E )
t.0 t.SWAP t.R> w617B
t.0BRANCH CELL 000A ( -> 67A2 )
t.C! t.1
t.BRANCH CELL 0006 ( -> 67A6 )
( label 67A2 )
t.DROP t.0
( label 67A6 )
t.;S
AT 67A8

( w67AE | NFA 67A8 CFA 67AE )
( Unknown erased name; CFA identifier )
AT 67A8
( Header: flags, saved name and link )
BYTES 830000A16F67
DOCOL
w556D t.@ t.P w6774 t.DROP t.;S
AT 67BC

( w67C2 | NFA 67BC CFA 67C2 )
( Unknown erased name; CFA identifier )
AT 67BC
( Header: flags, saved name and link )
BYTES 830000C2A867
DOCOL
w617B
t.0BRANCH CELL 0008 ( -> 67D0 )
t.0 t.SWAP t.C!
( label 67D0 )
t.;S
AT 67D2

( w67D9 | NFA 67D2 CFA 67D9 )
( Unknown erased name; CFA identifier )
AT 67D2
( Header: flags, saved name and link )
BYTES 84000000A1BC67
DOCOL
w556D t.@ t.P w67C2 t.;S
AT 67E5

( w67EA | NFA 67E5 CFA 67EA )
( Unknown erased name; CFA identifier )
AT 67E5
( Header: flags, saved name and link )
BYTES 8200D2D267
DOVAR
BYTES 1400020D4E49453D554E4945534945535A0454594C4520
AT 6803

( w6809 | NFA 6803 CFA 6809 )
( Unknown erased name; CFA identifier )
AT 6803
( Header: flags, saved name and link )
BYTES 830000A1E567
DOCOL
t.>R t.R t.0 t.1 w6774
t.0BRANCH CELL 003B ( -> 6852 )
t.R LIT8 CA t.- t.R t.0 t.1 w5A35 t.WORD-COUNT w3896 t.2 t.-
LIT16 0004 t.* LIT8 0B t.+ t.OVER w5638 t.C! LIT8 4E t.SWAP
w5638 t.1+ t.C! t.1
t.BRANCH CELL 000C ( -> 685C )
( label 6852 )
w616C w67EA t.2+ w45A4 t.0
( label 685C )
t.R> t.DROP t.;S
AT 6862

( w6869 | NFA 6862 CFA 6869 )
( Unknown erased name; CFA identifier )
AT 6862
( Header: flags, saved name and link )
BYTES 84000000A10368
DOCOL
t.0 t.1 w67C2 t.;S
AT 6873

( w6878 | NFA 6873 CFA 6878 )
( Unknown erased name; CFA identifier )
AT 6873
( Header: flags, saved name and link )
BYTES 8200D76268
DOCOL
t.1 w672F t.;S
AT 6880

( w6885 | NFA 6880 CFA 6885 )
( Unknown erased name; CFA identifier )
AT 6880
( Header: flags, saved name and link )
BYTES 8200D77368
DOCOL
t.2 w672F t.;S
AT 688D

( w6892 | NFA 688D CFA 6892 )
( Unknown erased name; CFA identifier )
AT 688D
( Header: flags, saved name and link )
BYTES 8200D78068
DOCOL
t.3 w672F t.;S
AT 689A

( w689F | NFA 689A CFA 689F )
( Unknown erased name; CFA identifier )
AT 689A
( Header: flags, saved name and link )
BYTES 8200D78D68
DOCOL
LIT16 0004 w672F t.;S
AT 68A9

( w68AE | NFA 68A9 CFA 68AE )
( Unknown erased name; CFA identifier )
AT 68A9
( Header: flags, saved name and link )
BYTES 8200D79A68
DOCOL
LIT16 0005 w672F t.;S
AT 68B8

( w68BD | NFA 68B8 CFA 68BD )
( Unknown erased name; CFA identifier )
AT 68B8
( Header: flags, saved name and link )
BYTES 8200D7A968
DOCOL
LIT16 0006 w672F t.;S
AT 68C7

( w68CE | NFA 68C7 CFA 68CE )
( Unknown erased name; CFA identifier )
AT 68C7
( Header: flags, saved name and link )
BYTES 84000000CBB868
DOCOL
w4DA3 t.DUP t.>R t.2+ t.R w4C54 t.* w3896 t.1 t.- t.R> t.C@
t./MOD LIT8 06 t.* w5157 t.C@
t.0BRANCH CELL 000A ( -> 68FF )
w4C81 w4C54
t.BRANCH CELL 0008 ( -> 6905 )
( label 68FF )
LIT16 0004 t.0
( label 6905 )
t.ROT t.+ t.>R t.+ t.R> t.;S
AT 6911

( w6916 | NFA 6911 CFA 6916 )
( Unknown erased name; CFA identifier )
AT 6911
( Header: flags, saved name and link )
BYTES 8200D2C768
DOVAR
BYTES 1600020D4E49453D504F4B415A416C457306525A45435A59
AT 6930

( w6936 | NFA 6930 CFA 6936 )
( Unknown erased name; CFA identifier )
AT 6930
( Header: flags, saved name and link )
BYTES 830000BF1169
DOCOL
w5C61 LIT8 10 w6000 w5D92 w5289 t.DUP t.0=_12DE
t.0BRANCH CELL 000C ( -> 6955 )
w616C w469B w6916 t.2+ w45A4
( label 6955 )
w5C9F t.;S
AT 6959

( w695F | NFA 6959 CFA 695F )
( Unknown erased name; CFA identifier )
AT 6959
( Header: flags, saved name and link )
BYTES 830000B03069
DOCOL
( Trailing native code/data at 6961; retained exactly )
BYTES 01000101000701000800007712
AT 696E

( w6974 | NFA 696E CFA 6974 )
( Unknown erased name; CFA identifier )
AT 696E
( Header: flags, saved name and link )
BYTES 830000B15969
DOCOL
( Trailing native code/data at 6976; retained exactly )
BYTES 01000101000900007712
AT 6980

( w6986 | NFA 6980 CFA 6986 )
( Unknown erased name; CFA identifier )
AT 6980
( Header: flags, saved name and link )
BYTES 830000D36E69
DOCOL
t.DROP w5CE1 t.@
t.0BRANCH CELL 000A ( -> 699A )
LIT16 6976
t.BRANCH CELL 0006 ( -> 699E )
( label 699A )
LIT16 6961
( label 699E )
w64D2 t.! t.1 w64DB t.! t.0 w5D51 t.! t.;S
AT 69B0

( w69B6 | NFA 69B0 CFA 69B6 )
( Unknown erased name; CFA identifier )
AT 69B0
( Header: flags, saved name and link )
BYTES 830000C38069
DOVAR
CELL 0000
AT 69BA

( w69C0 | NFA 69BA CFA 69C0 )
( Unknown erased name; CFA identifier )
AT 69BA
( Header: flags, saved name and link )
BYTES 830000D2B069
CELL 69C2 ( native entry point )
BYTES 86D1 ( 69C2: STX $d1 )
BYTES A000 ( 69C4: LDY #$00 )
BYTES 8CB869 ( 69C6: STY $69b8 )
BYTES A208 ( 69C9: LDX #$08 )
BYTES B97E58 ( 69CB: LDA $587e,Y )
BYTES 18 ( 69CE: CLC )
BYTES 4A ( 69CF: LSR A )
BYTES 9003 ( 69D0: BCC $69d5 )
BYTES EEB869 ( 69D2: INC $69b8 )
BYTES CA ( 69D5: DEX )
BYTES D0F6 ( 69D6: BNE $69ce )
BYTES C8 ( 69D8: INY )
BYTES C01F ( 69D9: CPY #$1f )
BYTES D0EC ( 69DB: BNE $69c9 )
BYTES A6D1 ( 69DD: LDX $d1 )
BYTES 4C470F ( 69DF: JMP $0f47 )
AT 69E2

( w69E8 | NFA 69E2 CFA 69E8 )
( Unknown erased name; CFA identifier )
AT 69E2
( Header: flags, saved name and link )
BYTES 830000A1BA69
DOCOL
w556D t.@ w587C t.+ t.2DUP t.C@ t.AND t.0=_12DE
t.0BRANCH CELL 0008 ( -> 6A04 )
w4C6A
t.BRANCH CELL 0004 ( -> 6A06 )
( label 6A04 )
t.2DROP
( label 6A06 )
t.;S
AT 6A08

( w6A0D | NFA 6A08 CFA 6A0D )
( Unknown erased name; CFA identifier )
AT 6A08
( Header: flags, saved name and link )
BYTES 8200C4E269
DOVAR
BYTES 1C00011A57594B4F4E416C45733D3D3D3D50524F43454E543D4D4953
BYTES 4A49202020
AT 6A30

( w6A37 | NFA 6A30 CFA 6A37 )
( Unknown erased name; CFA identifier )
AT 6A30
( Header: flags, saved name and link )
BYTES 84000000C3086A
DOCOL
w5CE1 t.@
t.0BRANCH CELL 0032 ( -> 6A71 )
w69C0 w69B6 t.C@ LIT8 64 t.* LIT8 41 t./ t.0 t.<# t.#_268F
t.#_268F t.#> w6A0D LIT8 0E t.+ t.SWAP t.CMOVE w6A0D t.2+
LIT8 05 t.Y! w45A4
( label 6A71 )
t.;S
AT 6A73

( w6A79 | NFA 6A73 CFA 6A79 )
( Unknown erased name; CFA identifier )
AT 6A73
( Header: flags, saved name and link )
BYTES 830000C2306A
DOCOL
w5D51 t.@ t.>R t.0 w5D64 t.! t.R t.0=_12DE
t.0BRANCH CELL 0006 ( -> 6A93 )
w656F w6710
( label 6A93 )
t.R t.1 t.=
t.0BRANCH CELL 000A ( -> 6AA5 )
w6986 w65E8 w6A37 w669C
( label 6AA5 )
t.R t.1 t.>
t.0BRANCH CELL 000C ( -> 6AB9 )
t.DROP t.R LIT16 0008 t.+
( label 6AB9 )
t.R> t.DROP t.0 w5D51 t.! t.;S
AT 6AC5

( GET-GAME-INPUT | NFA 6AC5 CFA 6ACB )
( Inferred descriptive name, not recovered original: Sets )
( an input-mode flag, invokes input/pointer polling, )
( normalizes the result, clears the flag and returns it. )
AT 6AC5
( Header: flags, saved name and link )
BYTES 830000CB736A
DOCOL
t.1 w5D64 t.! w5D92 w5289 t.DUP LIT8 05 t.= t.0=_12DE t.*
w5157 t.C@ t.0=_12DE
t.0BRANCH CELL 0007 ( -> 6AF1 )
LIT8 1F t.AND
( label 6AF1 )
t.0 w5D64 t.! t.;S
AT 6AF9

( w6AFE | NFA 6AF9 CFA 6AFE )
( Unknown erased name; CFA identifier )
AT 6AF9
( Header: flags, saved name and link )
BYTES 8200C2C56A
DODOES
( DOES> thread at 51CD )
BYTES CD5143764C765C768577D277FC770E7822787A79C779357A4B7A2020
BYTES 627A847AA67AB47AD27A577B847B837C977CEF7C2D7D917DC77DDE7D
BYTES EE7D237E447E587E6F7E817EE57E6B7F137FEA7F478059806D808180
BYTES 4780A480E380FE80B47A34815581B7813481DF821883D5831684
AT 6B6E

( EXECUTE-GAME-ACTION | NFA 6B6E CFA 6B74 )
( Inferred descriptive name, not recovered original: )
( Selects an action PFA from a variable, converts to CFA )
( and executes it. )
AT 6B6E
( Header: flags, saved name and link )
BYTES 830000C2F96A
DOCOL
w6AFE t.@ t.-DUP t.0=_12DE
t.0BRANCH CELL 0008 ( -> 6B88 )
t.0 w6AFE t.@
( label 6B88 )
t.CFA t.EXECUTE t.;S
AT 6B8E

( w6B94 | NFA 6B8E CFA 6B94 )
( Unknown erased name; CFA identifier )
AT 6B8E
( Header: flags, saved name and link )
BYTES 830000D46E6B
DOVAR
BYTES 940B00004C4C28053605
AT 6BA0

( w6BA6 | NFA 6BA0 CFA 6BA6 )
( Unknown erased name; CFA identifier )
AT 6BA0
( Header: flags, saved name and link )
BYTES 830000C58E6B
DOVAR
BYTES E0AB040A4C4C05053628
AT 6BB2

( w6BB7 | NFA 6BB2 CFA 6BB7 )
( Unknown erased name; CFA identifier )
AT 6BB2
( Header: flags, saved name and link )
BYTES 8200D0A06B
DOVAR
BYTES 000005414C4C4F542020
AT 6BC3

( w6BC8 | NFA 6BC3 CFA 6BC8 )
( Unknown erased name; CFA identifier )
AT 6BC3
( Header: flags, saved name and link )
BYTES 8200C2B26B
DOVAR
CELL 0000
AT 6BCC

( w6BD2 | NFA 6BCC CFA 6BD2 )
( Unknown erased name; CFA identifier )
AT 6BCC
( Header: flags, saved name and link )
BYTES 830000CFC36B
CELL 6BD4 ( native entry point )
BYTES ADCA6B ( 6BD4: LDA $6bca )
BYTES D0FB ( 6BD7: BNE $6bd4 )
BYTES 4C470F ( 6BD9: JMP $0f47 )
AT 6BDC

( w6BE1 | NFA 6BDC CFA 6BE1 )
( Unknown erased name; CFA identifier )
AT 6BDC
( Header: flags, saved name and link )
BYTES 8200C6CC6B
DODOES
( DOES> thread at 51CD )
BYTES CD5120202020
AT 6BE9

( w6BEE | NFA 6BE9 CFA 6BEE )
( Unknown erased name; CFA identifier )
AT 6BE9
( Header: flags, saved name and link )
BYTES 8200AADC6B
DOCOL
t.0 w6BE1 t.@ t.OVER t.+ t.C@ t.SWAP t.1 w6BE1 t.@ t.+ t.C@
t.;S
AT 6C0A

( w6C10 | NFA 6C0A CFA 6C10 )
( Unknown erased name; CFA identifier )
AT 6C0A
( Header: flags, saved name and link )
BYTES 830000D9E96B
DOCOL
w6BEE t.- t.DUP t.0<_12F3 t.0=_12DE t.* t.;S
AT 6C20

( w6C26 | NFA 6C20 CFA 6C26 )
( Unknown erased name; CFA identifier )
AT 6C20
( Header: flags, saved name and link )
BYTES 830000D90A6C
DOCOL
t.>R t.R w6BEE t.R t.2+ w6BEE t.ROT t.+ t.>R t.+ t.R> t.MIN
t.R> w6BEE t.MAX t.- t.DUP t.0 t.> t.;S
AT 6C50

( w6C55 | NFA 6C50 CFA 6C55 )
( Unknown erased name; CFA identifier )
AT 6C50
( Header: flags, saved name and link )
BYTES 8200AA206C
DOCOL
t.1 w6BE1 t.@ t.2+ t.C@ t.DUP t.1 w6C10 t.* t.0 w6C10 t.+ t.1
w6BE1 t.@ LIT16 0004 t.+ t.+ t.;S
AT 6C7F

( w6C85 | NFA 6C7F CFA 6C85 )
( Unknown erased name; CFA identifier )
AT 6C7F
( Header: flags, saved name and link )
BYTES 830000C2506C
DOCOL
t.2DUP t.0 w6BE1 t.! t.1 w6BE1 t.! t.0 w6C26 t.>R w3AF2 t.C!
t.1 w6C26 t.R> t.* t.SWAP w3AFC t.C!
t.0BRANCH CELL 0033 ( -> 6CE2 )
w6C55 w3ACC t.! w3AE8 t.C! t.1 w6BE1 t.! t.0 w6BE1 t.! w6C55
w3AC3 t.! w3B05 t.C! w3AC3 w6BB7 LIT8 0A t.CMOVE w543B t.1
t.BRANCH CELL 0006 ( -> 6CE6 )
( label 6CE2 )
t.2DROP t.0
( label 6CE6 )
t.;S
AT 6CE8

( w6CED | NFA 6CE8 CFA 6CED )
( Unknown erased name; CFA identifier )
AT 6CE8
( Header: flags, saved name and link )
BYTES 8200D07F6C
DOCON
CELL 0A00
AT 6CF1

( w6CF6 | NFA 6CF1 CFA 6CF6 )
( Unknown erased name; CFA identifier )
AT 6CF1
( Header: flags, saved name and link )
BYTES 8200CAE86C
DOVAR
CELL 0000
AT 6CFA

( w6D00 | NFA 6CFA CFA 6D00 )
( Unknown erased name; CFA identifier )
AT 6CFA
( Header: flags, saved name and link )
BYTES 830000CAF16C
DODOES
( DOES> thread at 51CD )
BYTES CD51000001000000FFFF0000
AT 6D0E

( w6D14 | NFA 6D0E CFA 6D14 )
( Unknown erased name; CFA identifier )
AT 6D0E
( Header: flags, saved name and link )
BYTES 830000CAFA6C
DODOES
( DOES> thread at 51CD )
BYTES CD51FAFF0000060000000000
AT 6D22

( w6D29 | NFA 6D22 CFA 6D29 )
( Unknown erased name; CFA identifier )
AT 6D22
( Header: flags, saved name and link )
BYTES 84000000C00E6D
DOCOL
w6CF6 t.@ w6D00 t.@ t.;S
AT 6D35

( w6D3C | NFA 6D35 CFA 6D3C )
( Unknown erased name; CFA identifier )
AT 6D35
( Header: flags, saved name and link )
BYTES 84000000C0226D
DOCOL
w6CF6 t.@ w6D14 t.@ t.;S
AT 6D48

( w6D4E | NFA 6D48 CFA 6D4E )
( Unknown erased name; CFA identifier )
AT 6D48
( Header: flags, saved name and link )
BYTES 830000CA356D
DOCOL
w485E t.@ w54E6 w4C54 LIT8 28 t.* t.+ t.+ t.;S
AT 6D63

( w6D69 | NFA 6D63 CFA 6D69 )
( Unknown erased name; CFA identifier )
AT 6D63
( Header: flags, saved name and link )
BYTES 830000BC486D
DOCOL
w3AC3 LIT8 0A t.CMOVE t.;S
AT 6D74

( w6D79 | NFA 6D74 CFA 6D79 )
( Unknown erased name; CFA identifier )
AT 6D74
( Header: flags, saved name and link )
BYTES 8200D4636D
DOCOL
w54E6 t.1+ t.C! w54E6 t.C! w6D4E t.DUP w6B94 t.2+ t.! w6BA6
t.! w6B94 w6D69 w543B t.;S
AT 6D9B

( w6DA0 | NFA 6D9B CFA 6DA0 )
( Unknown erased name; CFA identifier )
AT 6D9B
( Header: flags, saved name and link )
BYTES 8200CA746D
DOCOL
w54E6 w6CED LIT16 0004 t.CMOVE t.;S
AT 6DAE

( w6DB4 | NFA 6DAE CFA 6DB4 )
( Unknown erased name; CFA identifier )
AT 6DAE
( Header: flags, saved name and link )
BYTES 830000B09B6D
DOVAR
CELL 0006
AT 6DB8

( w6DBE | NFA 6DB8 CFA 6DBE )
( Unknown erased name; CFA identifier )
AT 6DB8
( Header: flags, saved name and link )
BYTES 830000D4AE6D
DOCOL
w6BD2 w54E6 w6CED LIT16 0112 t.CMOVE w54E6 w4C54 w6D3C t.+
t.>R w6D29 t.+ t.R> w6D79 w6CF6 t.@ w6DB4 t.@ t.=
t.0BRANCH CELL 000C ( -> 6DF6 )
w6BB7 w6D69 w543B
t.BRANCH CELL 0012 ( -> 6E06 )
( label 6DF6 )
w6CED w54E6 w6C85 t.DROP w6CF6 t.@ w6DB4 t.!
( label 6E06 )
w6DA0 t.;S
AT 6E0A

( w6E0F | NFA 6E0A CFA 6E0F )
( Unknown erased name; CFA identifier )
AT 6E0A
( Header: flags, saved name and link )
BYTES 8200CAB86D
DOCOL
w5E93 w3F6D t.2+ w3F6D t.2+ t.;S
AT 6E1D

( w6E22 | NFA 6E1D CFA 6E22 )
( Unknown erased name; CFA identifier )
AT 6E1D
( Header: flags, saved name and link )
BYTES 8200D70A6E
DOVAR
BYTES 000005
AT 6E27

( w6E2D | NFA 6E27 CFA 6E2D )
( Unknown erased name; CFA identifier )
AT 6E27
( Header: flags, saved name and link )
BYTES 830000D91D6E
DOVAR
CELL 0000
AT 6E31

( w6E36 | NFA 6E31 CFA 6E36 )
( Unknown erased name; CFA identifier )
AT 6E31
( Header: flags, saved name and link )
BYTES 8200B6276E
CELL 6E38 ( native entry point )
BYTES EE246E ( 6E38: INC $6e24 )
BYTES A0FF ( 6E3B: LDY #$ff )
BYTES A900 ( 6E3D: LDA #$00 )
BYTES 18 ( 6E3F: CLC )
BYTES 6906 ( 6E40: ADC #$06 )
BYTES C8 ( 6E42: INY )
BYTES CD246E ( 6E43: CMP $6e24 )
BYTES 90F7 ( 6E46: BCC $6e3f )
BYTES 38 ( 6E48: SEC )
BYTES ED246E ( 6E49: SBC $6e24 )
BYTES 8D246E ( 6E4C: STA $6e24 )
BYTES A905 ( 6E4F: LDA #$05 )
BYTES 38 ( 6E51: SEC )
BYTES ED246E ( 6E52: SBC $6e24 )
BYTES 8C256E ( 6E55: STY $6e25 )
BYTES 8D246E ( 6E58: STA $6e24 )
BYTES 60 ( 6E5B: RTS )
AT 6E5C

( w6E62 | NFA 6E5C CFA 6E62 )
( Unknown erased name; CFA identifier )
AT 6E5C
( Header: flags, saved name and link )
BYTES 830000B0316E
CELL 6E64 ( native entry point )
BYTES AD010A ( 6E64: LDA $0a01 )
BYTES 8DD353 ( 6E67: STA $53d3 )
BYTES 8D246E ( 6E6A: STA $6e24 )
BYTES 20386E ( 6E6D: JSR $6e38 )
BYTES AD256E ( 6E70: LDA $6e25 )
BYTES 38 ( 6E73: SEC )
BYTES E903 ( 6E74: SBC #$03 )
BYTES C908 ( 6E76: CMP #$08 )
BYTES 9002 ( 6E78: BCC $6e7c )
BYTES A907 ( 6E7A: LDA #$07 )
BYTES A005 ( 6E7C: LDY #$05 )
BYTES 0A ( 6E7E: ASL A )
BYTES 88 ( 6E7F: DEY )
BYTES D0FC ( 6E80: BNE $6e7e )
BYTES 8D3A53 ( 6E82: STA $533a )
BYTES AD010A ( 6E85: LDA $0a01 )
BYTES 18 ( 6E88: CLC )
BYTES 6D306E ( 6E89: ADC $6e30 )
BYTES 8D246E ( 6E8C: STA $6e24 )
BYTES 20386E ( 6E8F: JSR $6e38 )
BYTES A906 ( 6E92: LDA #$06 )
BYTES 38 ( 6E94: SEC )
BYTES ED246E ( 6E95: SBC $6e24 )
BYTES 85FB ( 6E98: STA $fb )
BYTES AD000A ( 6E9A: LDA $0a00 )
BYTES 18 ( 6E9D: CLC )
BYTES 6D2F6E ( 6E9E: ADC $6e2f )
BYTES 38 ( 6EA1: SEC )
BYTES E902 ( 6EA2: SBC #$02 )
BYTES 8D246E ( 6EA4: STA $6e24 )
BYTES 4C470F ( 6EA7: JMP $0f47 )
AT 6EAA

( w6EB0 | NFA 6EAA CFA 6EB0 )
( Unknown erased name; CFA identifier )
AT 6EAA
( Header: flags, saved name and link )
BYTES 830000B15C6E
CELL 6EB2 ( native entry point )
BYTES A901 ( 6EB2: LDA #$01 )
BYTES 8D8C53 ( 6EB4: STA $538c )
BYTES AD4653 ( 6EB7: LDA $5346 )
BYTES 8D4553 ( 6EBA: STA $5345 )
BYTES 4C470F ( 6EBD: JMP $0f47 )
AT 6EC0

( w6EC6 | NFA 6EC0 CFA 6EC6 )
( Unknown erased name; CFA identifier )
AT 6EC0
( Header: flags, saved name and link )
BYTES 830000C2AA6E
DOCOL
w6BD2 w54E6 w6CED LIT16 0112 t.CMOVE w6CED t.2+ t.C@ t.>R
t.DUP t.@ w6E2D t.! w6E62 w6E22 w4C54 LIT8 20 t.* t.+ w4DA3
t.+ w3EA9 t.! t.DUP w4C54 t.R t.* t.+ w6CED LIT16 0004 t.+ t.+
w3AC3 t.! w6EB0 t.2+ t.DUP t.R> w5468 t.1 w5343 t.C! t.0 w538A
t.C! t.;S
AT 6F29

( w6F2F | NFA 6F29 CFA 6F2F )
( Unknown erased name; CFA identifier )
AT 6F29
( Header: flags, saved name and link )
BYTES 830000D0C06E
CELL 6F31 ( native entry point )
BYTES A902 ( 6F31: LDA #$02 )
BYTES CDCA6B ( 6F33: CMP $6bca )
BYTES D010 ( 6F36: BNE $6f48 )
BYTES A900 ( 6F38: LDA #$00 )
BYTES 8DDC53 ( 6F3A: STA $53dc )
BYTES 20E653 ( 6F3D: JSR $53e6 )
BYTES EEDC53 ( 6F40: INC $53dc )
BYTES A900 ( 6F43: LDA #$00 )
BYTES 8DCA6B ( 6F45: STA $6bca )
BYTES 60 ( 6F48: RTS )
AT 6F49

( w6F4E | NFA 6F49 CFA 6F4E )
( Unknown erased name; CFA identifier )
AT 6F49
( Header: flags, saved name and link )
BYTES 8200CA296F
DODOES
( DOES> thread at 51CD )
BYTES CD5107200A2006200320
AT 6F5A

( w6F5F | NFA 6F5A CFA 6F5F )
( Unknown erased name; CFA identifier )
AT 6F5A
( Header: flags, saved name and link )
BYTES 8200CA496F
DOCOL
w6BA6 w6D69 t.2 w6BC8 t.C! t.;S
AT 6F6D

( w6F72 | NFA 6F6D CFA 6F72 )
( Unknown erased name; CFA identifier )
AT 6F6D
( Header: flags, saved name and link )
BYTES 8200C25A6F
DOCOL
t.DUP LIT8 05 t.=
t.0BRANCH CELL 0042 ( -> 6FBF )
t.DROP t.2 t.OVER t.2 t.MOD t.0=_12DE
t.0BRANCH CELL 0028 ( -> 6FB5 )
t.OVER w6E0F t.OVER w6F4E t.C@ t.OVER t.1+ t.C! t.DUP w6EC6
t.OVER t.1+ w6F4E t.C@ t.SWAP t.1+ t.C!
t.BRANCH CELL 0008 ( -> 6FBB )
( label 6FB5 )
t.OVER w6E0F w6EC6
( label 6FBB )
t.BRANCH CELL 0008 ( -> 6FC5 )
( label 6FBF )
t.OVER w6E0F w6EC6
( label 6FC5 )
t.DROP t.;S
AT 6FC9

( w6FCF | NFA 6FC9 CFA 6FCF )
( Unknown erased name; CFA identifier )
AT 6FC9
( Header: flags, saved name and link )
BYTES 830000C26D6F
DOCOL
w6F72 w6F5F t.;S
AT 6FD7

( w6FDD | NFA 6FD7 CFA 6FDD )
( Unknown erased name; CFA identifier )
AT 6FD7
( Header: flags, saved name and link )
BYTES 830000D0C96F
DOCON
CELL 002B
AT 6FE1

( w6FE7 | NFA 6FE1 CFA 6FE7 )
( Unknown erased name; CFA identifier )
AT 6FE1
( Header: flags, saved name and link )
BYTES 830000AAD76F
DOCOL
t.>R t.OVER t.R> t.SWAP w6CF6 t.! w6DBE t.OVER t.>R t.(DO)
( label 6FFD )
t.DUP t.I w6FCF t.I t.0=_12DE t.I t.3 t.= t.+
t.0BRANCH CELL 0006 ( -> 7017 )
t.3 w6000
( label 7017 )
t.(LOOP) CELL FFE4 ( -> 6FFD )
t.R> w6FCF t.;S
AT 7021

( w7028 | NFA 7021 CFA 7028 )
( Unknown erased name; CFA identifier )
AT 7021
( Header: flags, saved name and link )
BYTES 84000000C1E16F
DOCOL
t.-DUP
t.0BRANCH CELL 0039 ( -> 7067 )
t.0 t.(DO)
( label 7034 )
t.DUP t.DUP t.2 t.MOD
t.0BRANCH CELL 001E ( -> 705C )
t.I t.2 t.MOD
t.0BRANCH CELL 000A ( -> 7052 )
t.2 t.0
t.BRANCH CELL 0008 ( -> 7058 )
( label 7052 )
LIT16 0005 t.3
( label 7058 )
t.BRANCH CELL 0007 ( -> 7061 )
( label 705C )
LIT8 05 t.0
( label 7061 )
w6FE7
t.(LOOP) CELL FFCF ( -> 7034 )
( label 7067 )
t.DROP w6BD2 t.;S
AT 706D

( w7073 | NFA 706D CFA 7073 )
( Unknown erased name; CFA identifier )
AT 706D
( Header: flags, saved name and link )
BYTES 830000CA2170
DOCOL
LIT8 06 t.* w6FDD t.- t.SWAP t.2+ t.SWAP LIT8 05 w54E6 t.2+
t.C! LIT8 36 w54E6 t.3 t.+ t.C! w6D79 w6DA0 t.RUN-VBI1 w6CF6
t.@ LIT8 05 w6FCF w6BD2 t.;S
AT 70AB

( w70B1 | NFA 70AB CFA 70B1 )
( Unknown erased name; CFA identifier )
AT 70AB
( Header: flags, saved name and link )
BYTES 830000D26D70
DOVAR
CELL 0004
AT 70B5

( w70BB | NFA 70B5 CFA 70BB )
( Unknown erased name; CFA identifier )
AT 70B5
( Header: flags, saved name and link )
BYTES 830000D2AB70
DODOES
( DOES> thread at 51CD )
BYTES CD510203011000030310000020202020202020202020
AT 70D3

( w70DA | NFA 70D3 CFA 70DA )
( Unknown erased name; CFA identifier )
AT 70D3
( Header: flags, saved name and link )
BYTES 84000000DAB570
DOCOL
( label 70DC )
t.-1 w70B1 t.+! w70B1 t.@ w70BB t.DUP t.C@ t.SWAP t.1+ t.C@
w7028 w70B1 t.@ t.0=_12DE
t.0BRANCH CELL FFE0 ( -> 70DC )
t.;S
AT 7100

( w7106 | NFA 7100 CFA 7106 )
( Unknown erased name; CFA identifier )
AT 7100
( Header: flags, saved name and link )
BYTES 830000CAD370
DOVAR
CELL 0000
AT 710A

( w7110 | NFA 710A CFA 7110 )
( Unknown erased name; CFA identifier )
AT 710A
( Header: flags, saved name and link )
BYTES 830000CB0071
DOVAR
CELL 0000
AT 7114

( w711A | NFA 7114 CFA 711A )
( Unknown erased name; CFA identifier )
AT 7114
( Header: flags, saved name and link )
BYTES 830000D90A71
DODOES
( DOES> thread at 51CD )
BYTES CD510100020101020001
AT 7126

( w712C | NFA 7126 CFA 712C )
( Unknown erased name; CFA identifier )
AT 7126
( Header: flags, saved name and link )
BYTES 830000C01471
CELL 712E ( native entry point )
BYTES ADF86C ( 712E: LDA $6cf8 )
BYTES 0A ( 7131: ASL A )
BYTES A8 ( 7132: TAY )
BYTES B91E71 ( 7133: LDA $711e,Y )
BYTES 38 ( 7136: SEC )
BYTES E901 ( 7137: SBC #$01 )
BYTES 18 ( 7139: CLC )
BYTES 6D0871 ( 713A: ADC $7108 )
BYTES 8D2F6E ( 713D: STA $6e2f )
BYTES C8 ( 7140: INY )
BYTES B91E71 ( 7141: LDA $711e,Y )
BYTES 38 ( 7144: SEC )
BYTES E901 ( 7145: SBC #$01 )
BYTES 18 ( 7147: CLC )
BYTES 6D0971 ( 7148: ADC $7109 )
BYTES 8D306E ( 714B: STA $6e30 )
BYTES 4C470F ( 714E: JMP $0f47 )
AT 7151

( w7158 | NFA 7151 CFA 7158 )
( Unknown erased name; CFA identifier )
AT 7151
( Header: flags, saved name and link )
BYTES 84000000C02671
DOCOL
w712C w6E2D w4C54 t.;S
AT 7162

( w7168 | NFA 7162 CFA 7168 )
( Unknown erased name; CFA identifier )
AT 7162
( Header: flags, saved name and link )
BYTES 830000AB5171
DOCOL
w6CF6 t.@ t.1+ LIT16 0004 t.MOD w6CF6 t.! t.;S
AT 717C

( w7182 | NFA 717C CFA 7182 )
( Unknown erased name; CFA identifier )
AT 717C
( Header: flags, saved name and link )
BYTES 830000AD6271
DOCOL
w6CF6 t.@ t.1 t.- t.DUP t.0<_12F3 LIT16 0004 t.* t.+ w6CF6 t.!
t.;S
AT 719E

( w71A4 | NFA 719E CFA 71A4 )
( Unknown erased name; CFA identifier )
AT 719E
( Header: flags, saved name and link )
BYTES 830000AA7C71
DOCOL
t.ROT t.- t.ABS t.>R t.- t.ABS t.R> t.;S
AT 71B6

( w71BC | NFA 71B6 CFA 71BC )
( Unknown erased name; CFA identifier )
AT 71B6
( Header: flags, saved name and link )
BYTES 830000C99E71
DOCOL
w7158 w7110 w4C54 w71A4 w7106 w4C54 w7110 w4C54 w71A4 t.ROT
t.< t.>R t.> t.R> t.+ t.0=_12DE t.;S
AT 71E0

( w71E6 | NFA 71E0 CFA 71E6 )
( Unknown erased name; CFA identifier )
AT 71E0
( Header: flags, saved name and link )
BYTES 830000CCB671
DOCOL
w7158 w5289 LIT8 1F t.AND LIT8 05 t.= t.0=_12DE t.;S
AT 71FA

( w7200 | NFA 71FA CFA 7200 )
( Unknown erased name; CFA identifier )
AT 71FA
( Header: flags, saved name and link )
BYTES 830000D7E071
DOCOL
t.DUP t.1 t.>
t.0BRANCH CELL 000A ( -> 7214 )
t.2 t.-
t.BRANCH CELL 0004 ( -> 7216 )
( label 7214 )
t.2+
( label 7216 )
t.;S
AT 7218

( w721E | NFA 7218 CFA 721E )
( Unknown erased name; CFA identifier )
AT 7218
( Header: flags, saved name and link )
BYTES 830000D3FA71
DOVAR
CELL 0000
AT 7222

( w7228 | NFA 7222 CFA 7228 )
( Unknown erased name; CFA identifier )
AT 7222
( Header: flags, saved name and link )
BYTES 830000AA1872
DOCOL
w71E6 t.2 t.* w71BC t.+ w721E t.@ w6CF6 t.! t.;S
AT 723E

( w7244 | NFA 723E CFA 7244 )
( Unknown erased name; CFA identifier )
AT 723E
( Header: flags, saved name and link )
BYTES 830000C42272
DOCOL
w6CF6 t.@ w721E t.! t.0
( label 7250 )
t.OVER
t.0BRANCH CELL 0010 ( -> 7264 )
w7158 w7106 t.1+ t.C! w7106 t.C! t.1+
( label 7264 )
t.2DUP t.> t.0=_12DE
t.0BRANCH CELL 0048 ( -> 72B4 )
w71BC w71E6 t.* t.0=_12DE
t.0BRANCH CELL 003C ( -> 72B4 )
w7168 w7228 w7182 w7228 t.2DUP t.MAX t.DUP t.>R t.3 t.= t.R>
t.1 t.> w71E6 t.0=_12DE t.* t.+
t.0BRANCH CELL 0014 ( -> 72B2 )
t.<
t.0BRANCH CELL 0008 ( -> 72AC )
w7182
t.BRANCH CELL 0004 ( -> 72AE )
( label 72AC )
w7168
( label 72AE )
t.BRANCH CELL 0004 ( -> 72B4 )
( label 72B2 )
t.2DROP
( label 72B4 )
t.OVER t.0=_12DE w7106 t.@ w7110 t.@ t.= t.+ w6CF6 t.@ w721E
t.@ t.= t.0=_12DE t.+
t.0BRANCH CELL FF7C ( -> 7250 )
w70B1 t.@ w70BB w721E t.@ w7200 t.OVER t.C! t.1+ t.C! t.1
w70B1 t.+! t.DROP t.;S
AT 72F4

( w72F9 | NFA 72F4 CFA 72F9 )
( Unknown erased name; CFA identifier )
AT 72F4
( Header: flags, saved name and link )
BYTES 8200CB3E72
DOVAR
CELL 0000
AT 72FD

( w7302 | NFA 72FD CFA 7302 )
( Unknown erased name; CFA identifier )
AT 72FD
( Header: flags, saved name and link )
BYTES 8200D8F472
DOCOL
t.>R w72F9 w4C54 t.SWAP w711A t.R t.+ t.C@ t.1 t.- t.* w7110
t.R> t.+ w4C6A t.;S
AT 7324

( w732B | NFA 7324 CFA 732B )
( Unknown erased name; CFA identifier )
AT 7324
( Header: flags, saved name and link )
BYTES 84000000D3FD72
DOCOL
w72F9 t.@ t.>R t.0 w7302 t.1 w7302 t.2DUP w7200 w72F9 t.C!
w72F9 t.1+ t.C! w7200 w6CF6 t.! t.0 w70B1 t.!
( label 7355 )
w7244 t.1 w7106 t.@ w7110 t.@ t.=
t.0BRANCH CELL FFF0 ( -> 7355 )
t.DROP t.R> t.-DUP
t.0BRANCH CELL 0010 ( -> 737F )
w70B1 t.@ w70BB t.! t.1 w70B1 t.+!
( label 737F )
t.;S
AT 7381

( w7387 | NFA 7381 CFA 7387 )
( Unknown erased name; CFA identifier )
AT 7381
( Header: flags, saved name and link )
BYTES 830000D02473
DOCOL
w6CF6 t.@ w7200 t.1+ w656F w64D2 t.@ w6692 t.! t.0 w72F9 t.!
w6885 w6892 w7073 t.;S
AT 73A9

( w73B1 | NFA 73A9 CFA 73B1 )
( Unknown erased name; CFA identifier )
AT 73A9
( Header: flags, saved name and link )
BYTES 8500000000C58173
DOCOL
t.>R w54E6 w4C54 w6FDD t.+ LIT8 06 t./ w7110 t.1+ t.C! t.2 t.-
w7110 t.C! w7106 t.1+ t.C! w7106 t.C! w7106 t.@ w7110 t.@ t.=
t.0=_12DE
t.0BRANCH CELL 0024 ( -> 740C )
t.SWAP w732B w70DA t.R LIT8 04 t.<
t.0BRANCH CELL 000F ( -> 7408 )
t.R LIT8 05 w6FCF t.R w6CF6 t.!
( label 7408 )
t.BRANCH CELL 0004 ( -> 740E )
( label 740C )
t.2DROP
( label 740E )
t.R> t.DROP LIT16 0004 w6DB4 t.! t.;S
AT 741C

( w7423 | NFA 741C CFA 7423 )
( Unknown erased name; CFA identifier )
AT 741C
( Header: flags, saved name and link )
BYTES 84000000C3A973
DOCOL
w469B w4ABE w5A49 t.1 w5993 t.2+ w3F6D t.WORD-COUNT w42DB
t.SWAP t.CMOVE t.2 w5993 t.2+ w3F6D t.WORD-COUNT t.3 t.>
t.0BRANCH CELL 0008 ( -> 7453 )
w45A4
t.BRANCH CELL 0004 ( -> 7455 )
( label 7453 )
t.DROP
( label 7455 )
w7387 w4AF8 t.1 w70B1 t.! t.0 w672F w7200 t.DUP w58CF t.! t.0
w70BB t.C! w556D t.@ t.1 t.-
t.0BRANCH CELL 0006 ( -> 7481 )
t.1 w69E8
( label 7481 )
w6878 w68AE t.0=_12DE t.0=_12DE t.+ t.0 w70BB t.1+ t.C! w70DA
t.;S
AT 7497

( w749C | NFA 7497 CFA 749C )
( Unknown erased name; CFA identifier )
AT 7497
( Header: flags, saved name and link )
BYTES 8200D41C74
DOCOL
t.1 w5343 t.1+ t.C! w4C81 w54E6 w6C85
t.0BRANCH CELL 0013 ( -> 74C1 )
w6CF6 t.@ LIT8 05 w6F72 w6CED w4C81 w6C85 t.DROP
( label 74C1 )
t.0 w5343 t.1+ t.C! t.;S
AT 74CB

( w74D1 | NFA 74CB CFA 74D1 )
( Unknown erased name; CFA identifier )
AT 74CB
( Header: flags, saved name and link )
BYTES 830000DA9774
DOVAR
CELL 0000
AT 74D5

( GAME-LOOP | NFA 74D5 CFA 74DB )
( Inferred descriptive name, not recovered original: )
( Initializes interface and action state, then repeatedly )
( obtains input and executes game actions until the exit )
( flag is set. )
AT 74D5
( Header: flags, saved name and link )
BYTES 830000C1CB74
DOCOL
w6035 t.0 w74D1 t.!
( label 74E5 )
t.1 w5D51 t.! t.0 w5CE1 t.! w469B t.1 w6A79
t.EXECUTE-GAME-ACTION w4215 t.@ t.0=_12DE
t.0BRANCH CELL FFE4 ( -> 74E5 )
( label 7503 )
t.0 w5D51 t.! t.GET-GAME-INPUT w469B w6A79 w469B t.DUP t.2 t.=
t.0=_12DE
t.0BRANCH CELL 0046 ( -> 7561 )
t.DUP LIT16 0005 t.> t.OVER LIT16 000D t.< t.* t.OVER
t.0=_12DE t.+ t.0=_12DE w5157 t.C@ t.0=_12DE t.*
t.0BRANCH CELL 0020 ( -> 7561 )
w6692 t.@ w64D2 t.@ w6692 t.! t.0 w672F w6878 w6885 w6892
w689F w73B1 w6692 t.!
( label 7561 )
t.EXECUTE-GAME-ACTION w74D1 t.@
t.0BRANCH CELL FF9A ( -> 7503 )
t.;S
AT 756D

( w7573 | NFA 756D CFA 7573 )
( Unknown erased name; CFA identifier )
AT 756D
( Header: flags, saved name and link )
BYTES 830000D4D574
DOCOL
w749C w4DA3 t.DUP t.0 w4D90 t.! w4DA3 t.C@ w4C81 LIT16 0004
t.0 w4CD2 t.DROP w4DA3 t.2+ t.OVER w52A4 w3AC3 t.! w5468 w4C81
w548F t.;S
AT 75A5

( w75AA | NFA 75A5 CFA 75AA )
( Unknown erased name; CFA identifier )
AT 75A5
( Header: flags, saved name and link )
BYTES 8200CF6D75
DOCOL
t.SWAP w59B1 t.DROP w596F w59B1
t.0BRANCH CELL 0004 ( -> 75BC )
w5981
( label 75BC )
t.;S
AT 75BE

( w75C5 | NFA 75BE CFA 75C5 )
( Unknown erased name; CFA identifier )
AT 75BE
( Header: flags, saved name and link )
BYTES 84000000C2A575
DOCOL
w75AA w7573 t.;S
AT 75CD

( w75D4 | NFA 75CD CFA 75D4 )
( Unknown erased name; CFA identifier )
AT 75CD
( Header: flags, saved name and link )
BYTES 84000000C2BE75
DOCOL
t.>R w75AA t.R> w59B1
t.0BRANCH CELL 0004 ( -> 75E4 )
w5981
( label 75E4 )
w7573 t.;S
AT 75E8

( w75EE | NFA 75E8 CFA 75EE )
( Unknown erased name; CFA identifier )
AT 75E8
( Header: flags, saved name and link )
BYTES 830000D3CD75
DOCOL
LIT8 FF LIT16 02FC t.!
( label 75F9 )
t.0 t.TRIGGER@ t.0=_12DE LIT16 02FC t.C@ LIT8 FF t.= t.0=_12DE
t.+
t.0BRANCH CELL FFE9 ( -> 75F9 )
t.;S
AT 7614

( w7619 | NFA 7614 CFA 7619 )
( Unknown erased name; CFA identifier )
AT 7614
( Header: flags, saved name and link )
BYTES 8200D4E875
DOVAR
BYTES 05000103434F3F
AT 7622

( w7629 | NFA 7622 CFA 7629 )
( Unknown erased name; CFA identifier )
AT 7622
( Header: flags, saved name and link )
BYTES 84000000CD1476
DOCOL
w4830 w469B t.0 w47FE LIT8 04 t.+ w45A4 t.;S
AT 763C

( w7641 | NFA 763C CFA 7641 )
( Unknown erased name; CFA identifier )
AT 763C
( Header: flags, saved name and link )
BYTES 8200B02276
DOCOL
t.;S
AT 7645

( w764A | NFA 7645 CFA 764A )
( Unknown erased name; CFA identifier )
AT 7645
( Header: flags, saved name and link )
BYTES 8200B13C76
DOCOL
LIT8 09 w6000 w5C39 t.;S
AT 7655

( w765A | NFA 7655 CFA 765A )
( Unknown erased name; CFA identifier )
AT 7655
( Header: flags, saved name and link )
BYTES 8200B24576
DOCOL
t.1 w74D1 t.! t.;S
AT 7664

( w7669 | NFA 7664 CFA 7669 )
( Unknown erased name; CFA identifier )
AT 7664
( Header: flags, saved name and link )
BYTES 8200DA5576
DOVAR
BYTES 1F19821C6B1C07196B17
AT 7675

( w767B | NFA 7675 CFA 767B )
( Unknown erased name; CFA identifier )
AT 7675
( Header: flags, saved name and link )
BYTES 830000D96476
DOCOL
LIT16 02C8 t.DUP t.C@ t.SWAP LIT8 0E t.OVER t.C! t.3 t.PAUSE
t.C! t.;S
AT 7696

( w769B | NFA 7696 CFA 769B )
( Unknown erased name; CFA identifier )
AT 7696
( Header: flags, saved name and link )
BYTES 8200D47576
DOCOL
t.0 LIT16 0004 t.0 t.(DO)
( label 76A7 )
LIT8 CA t.I t.+ LIT8 19 t.I t.+ t.1 w617B
t.0BRANCH CELL 0006 ( -> 76C1 )
t.DROP t.1+
( label 76C1 )
t.(LOOP) CELL FFE4 ( -> 76A7 )
t.;S
AT 76C7

( w76CC | NFA 76C7 CFA 76CC )
( Unknown erased name; CFA identifier )
AT 76C7
( Header: flags, saved name and link )
BYTES 8200D79676
DOCOL
LIT8 0D w58A4 t.;S
AT 76D5

( w76DB | NFA 76D5 CFA 76DB )
( Unknown erased name; CFA identifier )
AT 76D5
( Header: flags, saved name and link )
BYTES 830000DAC776
DOCOL
LIT8 18 w556D t.@ LIT8 1D t.<=< w76CC t.@ t.0=_12DE t.*
t.0BRANCH CELL 0089 ( -> 777C )
w769B LIT8 04 t.=
t.0BRANCH CELL 007E ( -> 777C )
LIT8 0A t.0 t.(DO)
( label 7707 )
w7669 t.I t.+ t.DUP t.C@ t.SWAP t.1+ t.C@ t.0 w6774 t.DROP t.2
t.(+LOOP) CELL FFE6 ( -> 7707 )
LIT8 0B w6000 LIT8 08 w69E8 LIT8 10 w69E8 w767B w5C39 LIT8 31
w7629 w556D t.@ LIT8 1C t.=
t.0BRANCH CELL 0010 ( -> 7756 )
LIT8 82 t.0 w75C5 LIT8 6B t.0 w75C5
( label 7756 )
w556D t.@ LIT8 19 t.=
t.0BRANCH CELL 0010 ( -> 7771 )
LIT8 1F t.0 w75C5 LIT8 07 t.0 w75C5
( label 7771 )
t.1 w76CC t.! LIT8 05 w6000
( label 777C )
t.;S
AT 777E

( w7783 | NFA 777E CFA 7783 )
( Unknown erased name; CFA identifier )
AT 777E
( Header: flags, saved name and link )
BYTES 8200B3D576
DOCOL
w7619 t.2+ w45A4 w6936 t.-DUP
t.0BRANCH CELL 0036 ( -> 77C7 )
t.>R LIT8 C9 w469B w68CE t.R LIT8 CA t.- w5638 t.1+ t.C! t.R
LIT8 CA t.- w5638 t.C! t.R w6869 t.1 w67D9 t.R> w67AE w5C26
LIT8 0C w6000
( label 77C7 )
w76DB t.;S
AT 77CB

( w77D0 | NFA 77CB CFA 77D0 )
( Unknown erased name; CFA identifier )
AT 77CB
( Header: flags, saved name and link )
BYTES 8200B47E77
DOCOL
w64DB t.@ t.DUP w6809
t.0BRANCH CELL 0013 ( -> 77EF )
w67D9 t.1 w67AE w5C26 LIT8 11 w6000
t.BRANCH CELL 0006 ( -> 77F3 )
( label 77EF )
w616C t.DROP
( label 77F3 )
t.;S
AT 77F5

( w77FA | NFA 77F5 CFA 77FA )
( Unknown erased name; CFA identifier )
AT 77F5
( Header: flags, saved name and link )
BYTES 8200B5CB77
DOCOL
w6756 w5C15 LIT8 09 w6000 t.;S
AT 7807

( w780C | NFA 7807 CFA 780C )
( Unknown erased name; CFA identifier )
AT 7807
( Header: flags, saved name and link )
BYTES 8200B6F577
DOCOL
LIT8 16 w6000 t.1 w671D w45A4 t.;S
AT 781B

( w7820 | NFA 781B CFA 7820 )
( Unknown erased name; CFA identifier )
AT 781B
( Header: flags, saved name and link )
BYTES 8200B70778
DOCOL
w469B t.1 w5CE1 t.! t.2 w5691 t.! LIT16 0004 w5CED t.0
t.PLAY-MUSIC t.1 w7423 t.;S
AT 7840

( w7845 | NFA 7840 CFA 7845 )
( Unknown erased name; CFA identifier )
AT 7840
( Header: flags, saved name and link )
BYTES 8200A31B78
DOVAR
BYTES 1C00011A1D221D1F2D3417212C1B3D04252F2A2F2417292C33212328
BYTES 1B6C
AT 7865

( w786B | NFA 7865 CFA 786B )
( Unknown erased name; CFA identifier )
AT 7865
( Header: flags, saved name and link )
BYTES 830000AB4078
DOCOL
w7845 LIT8 04 t.+ t.DUP LIT8 19 t.+ t.SWAP t.(DO)
( label 787F )
LIT8 26 t.I w4C6A
t.(LOOP) CELL FFF7 ( -> 787F )
t.;S
AT 788C

( w7891 | NFA 788C CFA 7891 )
( Unknown erased name; CFA identifier )
AT 788C
( Header: flags, saved name and link )
BYTES 8200C16578
DOCOL
t.FIRST LIT16 01F5 LIT16 0196 t.+ t.;S
AT 78A1

( w78A6 | NFA 78A1 CFA 78A6 )
( Unknown erased name; CFA identifier )
AT 78A1
( Header: flags, saved name and link )
BYTES 8200D38C78
DOVAR
CELL 02D1
AT 78AA

( w78B0 | NFA 78AA CFA 78B0 )
( Unknown erased name; CFA identifier )
AT 78AA
( Header: flags, saved name and link )
BYTES 830000C3A178
DOCOL
w7891 t.1 t.1 t.-DISK t.0=_12DE t.0=_12DE w7891 t.1+ t.1 t.1
t.-DISK t.0=_12DE t.+ t.2 t.= t.0=_12DE w78A6 t.@ LIT8 21 t.=
t.0=_12DE t.* t.;S
AT 78E1

( w78E8 | NFA 78E1 CFA 78E8 )
( Unknown erased name; CFA identifier )
AT 78E1
( Header: flags, saved name and link )
BYTES 84000000D0AA78
DOCOL
w58CF t.2+ w5560 t.- t.;S
AT 78F4

( w78FA | NFA 78F4 CFA 78FA )
( Unknown erased name; CFA identifier )
AT 78F4
( Header: flags, saved name and link )
BYTES 830000CBE178
DOCOL
w78E8 LIT16 0080 t./ t.1+ t.;S
AT 7908

( w790F | NFA 7908 CFA 790F )
( Unknown erased name; CFA identifier )
AT 7908
( Header: flags, saved name and link )
BYTES 84000000D0F478
DOCOL
t.1 w46B6 t.! t.1 w3FBE t.! t.0 LIT8 14 LIT8 08 w46C0 t.DROP
t.2DROP t.0 w3FBE t.! t.;S
AT 7933

( w7938 | NFA 7933 CFA 7938 )
( Unknown erased name; CFA identifier )
AT 7933
( Header: flags, saved name and link )
BYTES 8200D50879
DOCOL
w5F4E t.C@ t.0=_12DE
t.0BRANCH CELL 0006 ( -> 7948 )
t.0 t.PLAY-MUSIC
( label 7948 )
t.;S
AT 794A

( w7950 | NFA 794A CFA 7950 )
( Unknown erased name; CFA identifier )
AT 794A
( Header: flags, saved name and link )
BYTES 830000D43379
DOCOL
LIT8 06 t.=
t.0BRANCH CELL 0018 ( -> 7971 )
w78B0
t.0BRANCH CELL 0012 ( -> 7971 )
w469B w616C w786B w7845 t.2+ w45A4
( label 796D )
t.BRANCH CELL FFFE ( -> 796D )
( label 7971 )
t.;S
AT 7973

( w7978 | NFA 7973 CFA 7978 )
( Unknown erased name; CFA identifier )
AT 7973
( Header: flags, saved name and link )
BYTES 8200B84A79
DOCOL
w469B t.STOP-MUSIC w790F w4215 t.@ t.0=_12DE
t.0BRANCH CELL 0036 ( -> 79BE )
w5560 t.0 w78E8 w3D97 t.1 w5CE1 t.! t.0 w5F4E t.! w5691 t.@
t.2+ t.DUP t.>R w5CED t.R> w7950 w7938 w58CF t.@ w6CF6 t.!
w556D t.@ w7423
( label 79BE )
t.;S
AT 79C0

( w79C5 | NFA 79C0 CFA 79C5 )
( Unknown erased name; CFA identifier )
AT 79C0
( Header: flags, saved name and link )
BYTES 8200B97379
DOCOL
w469B w5560 w78FA LIT8 08 t.STOP-MUSIC t.STOP-VBI1 w472A
t.RUN-VBI1 w7938 t.;S
AT 79DC

( w79E3 | NFA 79DC CFA 79E3 )
( Unknown erased name; CFA identifier )
AT 79DC
( Header: flags, saved name and link )
BYTES 84000000DAC079
DOCOL
w469B t.1 w5CE1 t.! LIT8 04 w5691 t.! t.STOP-MUSIC LIT16 0006
w5CED LIT8 06 w7950 w7938 t.0 w566E t.0 w5638 LIT8 16 t.CMOVE
t.0 w6CF6 t.! LIT8 17 w7423 t.;S
AT 7A1D

( w7A24 | NFA 7A1D CFA 7A24 )
( Unknown erased name; CFA identifier )
AT 7A1D
( Header: flags, saved name and link )
BYTES 84000000DADC79
DOCOL
LIT8 0E w6000 t.;S
AT 7A2D

( w7A33 | NFA 7A2D CFA 7A33 )
( Unknown erased name; CFA identifier )
AT 7A2D
( Header: flags, saved name and link )
BYTES 830000B01D7A
DOCOL
t.1 w6000 w469B w60B5 w75EE w469B t.;S
AT 7A43

( w7A49 | NFA 7A43 CFA 7A49 )
( Unknown erased name; CFA identifier )
AT 7A43
( Header: flags, saved name and link )
BYTES 830000B12D7A
DOCOL
w469B w5C61 LIT8 10 w6000 w75EE w5C9F t.;S
AT 7A5A

( w7A60 | NFA 7A5A CFA 7A60 )
( Unknown erased name; CFA identifier )
AT 7A5A
( Header: flags, saved name and link )
BYTES 830000B3437A
DOCOL
w6878 w67D9 w6749 w67D9 w6892 w67AE w689F w67AE w6892 w689F
w75C5 w7A24 t.;S
AT 7A7C

( w7A82 | NFA 7A7C CFA 7A82 )
( Unknown erased name; CFA identifier )
AT 7A7C
( Header: flags, saved name and link )
BYTES 830000B45A7A
DOCOL
w6878 w67D9 w6885 w67D9 w6892 w67AE w6749 w67AE w6892 w6749
w75C5 w7A24 t.;S
AT 7A9E

( w7AA4 | NFA 7A9E CFA 7AA4 )
( Unknown erased name; CFA identifier )
AT 7A9E
( Header: flags, saved name and link )
BYTES 830000B57C7A
DOCOL
w6749 w7423 t.;S
AT 7AAC

( w7AB2 | NFA 7AAC CFA 7AB2 )
( Unknown erased name; CFA identifier )
AT 7AAC
( Header: flags, saved name and link )
BYTES 830000B69E7A
DOCOL
w6749 w67D9 w6885 w67D9 w6892 w67AE w6878 w6892 w75C5 w7A24
t.;S
AT 7ACA

( w7AD0 | NFA 7ACA CFA 7AD0 )
( Unknown erased name; CFA identifier )
AT 7ACA
( Header: flags, saved name and link )
BYTES 830000B7AC7A
DOCOL
w6885 w67D9 w6892 w67AE w6749 w67AE w6878 w6892 w6749 w75D4
w7A24 t.;S
AT 7AEA

( w7AF0 | NFA 7AEA CFA 7AF0 )
( Unknown erased name; CFA identifier )
AT 7AEA
( Header: flags, saved name and link )
BYTES 830000B8CA7A
DOCOL
w673C t.1+ w6316 LIT8 C8 w630A t.2+ t.@ LIT16 0004 t.- t.2DUP
w4C6A t.1+ w4C6A w469B w60B5 w630A t.@ t.C@ t.0 t.(DO)
( label 7B1D )
t.2 t.PAUSE LIT8 12 w6000 w630A t.@ t.1+ t.I t.+ t.C@ w630A
t.2+ t.@ t.I t.+ t.C! w60B5
t.(LOOP) CELL FFDB ( -> 7B1D )
w75EE w469B LIT8 40 w69E8 t.;S
AT 7B4F

( w7B55 | NFA 7B4F CFA 7B55 )
( Unknown erased name; CFA identifier )
AT 7B4F
( Header: flags, saved name and link )
BYTES 830000B8EA7A
DOCOL
w6749 w67D9 w5C26 w7AF0 t.;S
AT 7B61

( w7B66 | NFA 7B61 CFA 7B66 )
( Unknown erased name; CFA identifier )
AT 7B61
( Header: flags, saved name and link )
BYTES 8200C34F7B
DOVAR
BYTES 07000105435A41523D2020202020202020202020
AT 7B7C

( w7B82 | NFA 7B7C CFA 7B82 )
( Unknown erased name; CFA identifier )
AT 7B7C
( Header: flags, saved name and link )
BYTES 830000B9617B
DOCOL
w673C LIT16 0004 t.+ t.COUNT LIT16 0005 w7B66 t.3 t.+ t.C!
t.DUP w7B66 t.3 t.+ w4C6A w7B66 LIT16 0009 t.+ t.SWAP t.CMOVE
w7B66 t.2+ LIT8 16 w6000 w45A4 t.;S
AT 7BBD

( w7BC2 | NFA 7BBD CFA 7BC2 )
( Unknown erased name; CFA identifier )
AT 7BBD
( Header: flags, saved name and link )
BYTES 8200CE7C7B
DOVAR
BYTES 1000020754594D3D4E4945064D4F7A45535A20202020
AT 7BDA

( w7BDF | NFA 7BDA CFA 7BDF )
( Unknown erased name; CFA identifier )
AT 7BDA
( Header: flags, saved name and link )
BYTES 8200D9BD7B
DOVAR
BYTES 07000105435A594D3F20
AT 7BEB

( w7BF0 | NFA 7BEB CFA 7BF0 )
( Unknown erased name; CFA identifier )
AT 7BEB
( Header: flags, saved name and link )
BYTES 8200D2DA7B
DOVAR
CELL 0000
AT 7BF4

( w7BFA | NFA 7BF4 CFA 7BFA )
( Unknown erased name; CFA identifier )
AT 7BF4
( Header: flags, saved name and link )
BYTES 830000DAEB7B
DOCOL
LIT8 C8 t.+ t.>R t.R
t.0BRANCH CELL 0032 ( -> 7C39 )
w469B w7BDF t.2+ w45A4 w6936 t.DUP w7BF0 t.! t.DUP
t.0BRANCH CELL 0018 ( -> 7C35 )
t.R t.= t.DUP t.0=_12DE
t.0BRANCH CELL 000C ( -> 7C35 )
w469B w616C w7BC2 t.2+ w45A4
( label 7C35 )
t.BRANCH CELL 0004 ( -> 7C3B )
( label 7C39 )
t.1
( label 7C3B )
t.R> t.DROP t.;S
AT 7C41

( w7C47 | NFA 7C41 CFA 7C47 )
( Unknown erased name; CFA identifier )
AT 7C41
( Header: flags, saved name and link )
BYTES 830000D7F47B
DOVAR
CELL 0000
AT 7C4B

( w7C51 | NFA 7C4B CFA 7C51 )
( Unknown erased name; CFA identifier )
AT 7C4B
( Header: flags, saved name and link )
BYTES 830000A1417C
DOCOL
w7C47 t.! t.;S
AT 7C59

( w7C5F | NFA 7C59 CFA 7C5F )
( Unknown erased name; CFA identifier )
AT 7C59
( Header: flags, saved name and link )
BYTES 830000D44B7C
DOCOL
t.0BRANCH CELL 0016 ( -> 7C79 )
w469B w6878 w67AE w6878 t.2 w69E8 w7C47 t.@ w75C5 w7A24
( label 7C79 )
t.;S
AT 7C7B

( w7C81 | NFA 7C7B CFA 7C81 )
( Unknown erased name; CFA identifier )
AT 7C7B
( Header: flags, saved name and link )
BYTES 830000B0597C
DOCOL
t.0 w7C51 w6756 w7BFA w7C5F t.;S
AT 7C8F

( w7C95 | NFA 7C8F CFA 7C95 )
( Unknown erased name; CFA identifier )
AT 7C8F
( Header: flags, saved name and link )
BYTES 830000B17B7C
DOCOL
t.0 w7C51 w6749 w6256 w7C5F t.;S
AT 7CA3

( w7CAA | NFA 7CA3 CFA 7CAA )
( Unknown erased name; CFA identifier )
AT 7CA3
( Header: flags, saved name and link )
BYTES 84000000D48F7C
DOCOL
t.0BRANCH CELL 0019 ( -> 7CC7 )
w469B w6878 w7C47 t.@ t.DUP w67AE w75C5 w6885 w67D9 LIT8 04
w69E8
( label 7CC7 )
t.;S
AT 7CC9

( w7CCF | NFA 7CC9 CFA 7CCF )
( Unknown erased name; CFA identifier )
AT 7CC9
( Header: flags, saved name and link )
BYTES 830000B2A37C
DOCOL
t.DUP w7CAA
t.0BRANCH CELL 000E ( -> 7CE5 )
t.1 w6765 w58A4 t.! t.2 w6000
( label 7CE5 )
t.;S
AT 7CE7

( w7CED | NFA 7CE7 CFA 7CED )
( Unknown erased name; CFA identifier )
AT 7CE7
( Header: flags, saved name and link )
BYTES 830000B2C97C
DOCOL
t.0 w7C51 w6756 w7BFA w7CCF t.;S
AT 7CFB

( w7D01 | NFA 7CFB CFA 7D01 )
( Unknown erased name; CFA identifier )
AT 7CFB
( Header: flags, saved name and link )
BYTES 830000B3E77C
DOCOL
w6756 w58A4 t.@ t.DUP w7CAA t.0=_12DE
t.0BRANCH CELL 0010 ( -> 7D21 )
w616C w469B w673C t.2+ w45A4
t.BRANCH CELL 0004 ( -> 7D23 )
( label 7D21 )
w7A24
( label 7D23 )
t.;S
AT 7D25

( w7D2B | NFA 7D25 CFA 7D2B )
( Unknown erased name; CFA identifier )
AT 7D25
( Header: flags, saved name and link )
BYTES 830000B3FB7C
DOCOL
t.0 w7C51 w7D01 t.;S
AT 7D35

( w7D3A | NFA 7D35 CFA 7D3A )
( Unknown erased name; CFA identifier )
AT 7D35
( Header: flags, saved name and link )
BYTES 8200CD257D
DOVAR
BYTES 1900020A4F445A59534B416C45730C4D414749435A4E613D4D4F4320
AT 7D58

( w7D5F | NFA 7D58 CFA 7D5F )
( Unknown erased name; CFA identifier )
AT 7D58
( Header: flags, saved name and link )
BYTES 84000000D3357D
DOCOL
LIT8 08 t.0 t.(DO)
( label 7D68 )
t.OVER w59B1 t.DROP w5949 t.3 t.PAUSE t.DUP w59B1 t.DROP w5949
LIT8 06 t.PAUSE
t.(LOOP) CELL FFE5 ( -> 7D68 )
t.2DROP t.;S
AT 7D89

( w7D8F | NFA 7D89 CFA 7D8F )
( Unknown erased name; CFA identifier )
AT 7D89
( Header: flags, saved name and link )
BYTES 830000B4587D
DOCOL
LIT8 08 w6000 w6749 w6756 w7D5F t.2 w58A4 t.@ w6765 t.=
t.0BRANCH CELL 0015 ( -> 7DBD )
LIT8 05 w6000 w7D3A t.2+ w45A4 t.0 t.2 w58A4 t.!
( label 7DBD )
t.;S
AT 7DBF

( w7DC5 | NFA 7DBF CFA 7DC5 )
( Unknown erased name; CFA identifier )
AT 7DBF
( Header: flags, saved name and link )
BYTES 830000B5897D
DOCOL
LIT8 16 w6000 w673C t.3 t.+ w45A4 t.;S
AT 7DD6

( w7DDC | NFA 7DD6 CFA 7DDC )
( Unknown erased name; CFA identifier )
AT 7DD6
( Header: flags, saved name and link )
BYTES 830000B6BF7D
DOCOL
w6892 w7C51 w7D01 t.;S
AT 7DE6

( w7DEC | NFA 7DE6 CFA 7DEC )
( Unknown erased name; CFA identifier )
AT 7DE6
( Header: flags, saved name and link )
BYTES 830000B7D67D
DOCOL
LIT8 16 w6000 w673C t.2+ w45A4 t.;S
AT 7DFB

( w7E02 | NFA 7DFB CFA 7E02 )
( Unknown erased name; CFA identifier )
AT 7DFB
( Header: flags, saved name and link )
BYTES 84000000A1E67D
DOCOL
t.2 w58A4 t.! t.Y@ LIT8 04 t.+ t.Y! w61EB t.2+ w45A4 t.;S
AT 7E1B

( w7E21 | NFA 7E1B CFA 7E21 )
( Unknown erased name; CFA identifier )
AT 7E1B
( Header: flags, saved name and link )
BYTES 830000B8FB7D
DOCOL
w7DDC w6756 w58A4 t.@ t.0=_12DE
t.0BRANCH CELL 000B ( -> 7E3A )
LIT8 0F w6000 w6749 w7E02
( label 7E3A )
t.;S
AT 7E3C

( w7E42 | NFA 7E3C CFA 7E42 )
( Unknown erased name; CFA identifier )
AT 7E3C
( Header: flags, saved name and link )
BYTES 830000B91B7E
DOCOL
t.0 w7C51 w6749 w6256 w7CCF t.;S
AT 7E50

( w7E56 | NFA 7E50 CFA 7E56 )
( Unknown erased name; CFA identifier )
AT 7E50
( Header: flags, saved name and link )
BYTES 830000B03C7E
DOCOL
w6878 w67AE w5C26 w7A24 LIT8 20 w69E8 t.;S
AT 7E67

( w7E6D | NFA 7E67 CFA 7E6D )
( Unknown erased name; CFA identifier )
AT 7E67
( Header: flags, saved name and link )
BYTES 830000B1507E
DOCOL
w6878 w67D9 w5C26 w7A24 t.;S
AT 7E79

( w7E7F | NFA 7E79 CFA 7E7F )
( Unknown erased name; CFA identifier )
AT 7E79
( Header: flags, saved name and link )
BYTES 830000B2677E
DOCOL
w6885 w6256
t.0BRANCH CELL 0054 ( -> 7EDB )
w469B w556D t.@ w6878 w5A35 t.3 t.+ t.C@ w6892 t.=
t.0BRANCH CELL 0032 ( -> 7ED1 )
LIT8 08 w69E8 LIT8 0B w6000 w767B w556D t.@ w6892 t.OVER w6878
w67C2 LIT8 05 t.PAUSE w689F t.SWAP w6878 w6774 t.DROP LIT8 01
w6000
t.BRANCH CELL 000C ( -> 7EDB )
( label 7ED1 )
w616C LIT16 0005 w671D w45A4
( label 7EDB )
t.;S
AT 7EDD

( w7EE3 | NFA 7EDD CFA 7EE3 )
( Unknown erased name; CFA identifier )
AT 7EDD
( Header: flags, saved name and link )
BYTES 830000B3797E
DOCOL
w6892 w6809
t.0BRANCH CELL 001E ( -> 7F09 )
w6885 w67D9 w6878 t.0 w75C5 LIT8 11 w6000 LIT8 20 w69E8 t.0
w689F w58A4 t.!
( label 7F09 )
t.;S
AT 7F0B

( w7F11 | NFA 7F0B CFA 7F11 )
( Unknown erased name; CFA identifier )
AT 7F0B
( Header: flags, saved name and link )
BYTES 830000B5DD7E
DOCOL
w6885 w67D9 w6892 w67AE w689F w58A4 t.@ w67AE w6878 w6892
w689F w58A4 t.@ w75D4 w7A24 t.;S
AT 7F33

( w7F38 | NFA 7F33 CFA 7F38 )
( Unknown erased name; CFA identifier )
AT 7F33
( Header: flags, saved name and link )
BYTES 8200C70B7F
DOVAR
BYTES 0A00010857594752416C4573202020
AT 7F49

( w7F4E | NFA 7F49 CFA 7F4E )
( Unknown erased name; CFA identifier )
AT 7F49
( Header: flags, saved name and link )
BYTES 8200C7337F
DOVAR
BYTES 0E00010C4A557A3D4E49453D4752414D202020
AT 7F63

( w7F69 | NFA 7F63 CFA 7F69 )
( Unknown erased name; CFA identifier )
AT 7F63
( Header: flags, saved name and link )
BYTES 830000B4497F
DOCOL
w689F w58A4 t.@ t.0=_12DE
t.0BRANCH CELL 0061 ( -> 7FD6 )
w6885 LIT8 C8 t.- w7BFA
t.0BRANCH CELL 0030 ( -> 7FB2 )
w469B w6892 w556D t.@ w6756 w6774 t.DROP LIT8 0A w6000 w7F38
t.2+ w45A4 w6756 w5C15 t.1 w689F w58A4 t.! LIT8 08 w69E8
t.BRANCH CELL 0022 ( -> 7FD2 )
( label 7FB2 )
w7BF0 t.@ w6878 t.=
t.0BRANCH CELL 0016 ( -> 7FD2 )
t.Y@ LIT16 0004 t.+ t.Y! w616C LIT16 0005 w671D w45A4
( label 7FD2 )
t.BRANCH CELL 000C ( -> 7FE0 )
( label 7FD6 )
w469B w616C w7F4E t.2+ w45A4
( label 7FE0 )
t.;S
AT 7FE2

( w7FE8 | NFA 7FE2 CFA 7FE8 )
( Unknown erased name; CFA identifier )
AT 7FE2
( Header: flags, saved name and link )
BYTES 830000B6637F
DOCOL
w6756 w7BFA
t.0BRANCH CELL 0018 ( -> 8008 )
w7AB2 w469B w6756 LIT8 C8 t.+ w6869 LIT8 08 w69E8
t.BRANCH CELL 0037 ( -> 803D )
( label 8008 )
w6765 LIT8 C8 t.+ w7BF0 t.@ t.=
t.0BRANCH CELL 0026 ( -> 803D )
w673C LIT8 04 t.+ w4C54 w7D5F w469B LIT8 0F w6000 LIT16 0004
w671D w45A4 w673C t.3 t.+ t.C@ w7E02
( label 803D )
t.;S
AT 803F

( w8045 | NFA 803F CFA 8045 )
( Unknown erased name; CFA identifier )
AT 803F
( Header: flags, saved name and link )
BYTES 830000B7E27F
DOCOL
w616C t.1 w671D w45A4 t.;S
AT 8051

( w8057 | NFA 8051 CFA 8057 )
( Unknown erased name; CFA identifier )
AT 8051
( Header: flags, saved name and link )
BYTES 830000B83F80
DOCOL
w6756 w7C51 w6749 w6256 w7CCF t.;S
AT 8065

( w806B | NFA 8065 CFA 806B )
( Unknown erased name; CFA identifier )
AT 8065
( Header: flags, saved name and link )
BYTES 830000B95180
DOCOL
w68AE w7BFA
t.0BRANCH CELL 0004 ( -> 8077 )
w7EE3
( label 8077 )
t.;S
AT 8079

( w807F | NFA 8079 CFA 807F )
( Unknown erased name; CFA identifier )
AT 8079
( Header: flags, saved name and link )
BYTES 830000B06580
DOCOL
w6885 w6256
t.0BRANCH CELL 0013 ( -> 809A )
w6878 w67D9 w5C26 LIT8 08 w69E8 w469B t.1 w6000
( label 809A )
t.;S
AT 809C

( w80A2 | NFA 809C CFA 80A2 )
( Unknown erased name; CFA identifier )
AT 809C
( Header: flags, saved name and link )
BYTES 830000B27980
DOCOL
w6878 t.0 w75C5 w6749 w67D9 w7AF0 t.;S
AT 80B2

( w80B7 | NFA 80B2 CFA 80B7 )
( Unknown erased name; CFA identifier )
AT 80B2
( Header: flags, saved name and link )
BYTES 8200CD9C80
DOVAR
BYTES 2000021250525A45535A45446C45733D734349414E650B5A3D414E54
BYTES 594D41474961
AT 80DB

( w80E1 | NFA 80DB CFA 80E1 )
( Unknown erased name; CFA identifier )
AT 80DB
( Header: flags, saved name and link )
BYTES 830000B3B280
DOCOL
w6756 w7AA4 LIT8 0F w6000 w80B7 t.2+ w45A4 w7E02 t.;S
AT 80F6

( w80FC | NFA 80F6 CFA 80FC )
( Unknown erased name; CFA identifier )
AT 80F6
( Header: flags, saved name and link )
BYTES 830000B4DB80
DOCOL
LIT8 15 w6000 t.1 w671D w45A4 t.;S
AT 810B

( w8111 | NFA 810B CFA 8111 )
( Unknown erased name; CFA identifier )
AT 810B
( Header: flags, saved name and link )
BYTES 830000C7F680
DOCOL
w616C LIT8 2E w7629 t.;S
AT 811C

( w8121 | NFA 811C CFA 8121 )
( Unknown erased name; CFA identifier )
AT 811C
( Header: flags, saved name and link )
BYTES 8200C30B81
DOCOL
LIT8 09 w58A4 t.@ t.;S
AT 812C

( w8132 | NFA 812C CFA 8132 )
( Unknown erased name; CFA identifier )
AT 812C
( Header: flags, saved name and link )
BYTES 830000B61C81
DOCOL
w8121
t.0BRANCH CELL 0011 ( -> 8149 )
LIT8 16 w6000 t.1 w671D w45A4
t.BRANCH CELL 0004 ( -> 814B )
( label 8149 )
w8111
( label 814B )
t.;S
AT 814D

( w8153 | NFA 814D CFA 8153 )
( Unknown erased name; CFA identifier )
AT 814D
( Header: flags, saved name and link )
BYTES 830000B72C81
DOCOL
w8121
t.0BRANCH CELL 0008 ( -> 8161 )
w77FA
t.BRANCH CELL 0004 ( -> 8163 )
( label 8161 )
w8111
( label 8163 )
t.;S
AT 8165

( w816A | NFA 8165 CFA 816A )
( Unknown erased name; CFA identifier )
AT 8165
( Header: flags, saved name and link )
BYTES 8200C14D81
DOVAR
CELL 0000
AT 816E

( w8174 | NFA 816E CFA 8174 )
( Unknown erased name; CFA identifier )
AT 816E
( Header: flags, saved name and link )
BYTES 830000C96581
DOCOL
w816A t.! t.0 t.(DO)
( label 817E )
t.DUP t.I t.+ t.C@ w4830 t.0 w4D22 w816A t.@ t.PAUSE
t.(LOOP) CELL FFEA ( -> 817E )
t.DROP t.;S
AT 819A

( w819F | NFA 819A CFA 819F )
( Unknown erased name; CFA identifier )
AT 819A
( Header: flags, saved name and link )
BYTES 8200D56E81
DOVAR
BYTES 292A2B
AT 81A4

( w81A9 | NFA 81A4 CFA 81A9 )
( Unknown erased name; CFA identifier )
AT 81A4
( Header: flags, saved name and link )
BYTES 8200D29A81
DOVAR
BYTES 22242325
AT 81AF

( w81B5 | NFA 81AF CFA 81B5 )
( Unknown erased name; CFA identifier )
AT 81AF
( Header: flags, saved name and link )
BYTES 830000B8A481
DOCOL
w8121
t.0BRANCH CELL 00AC ( -> 8267 )
w7CED LIT8 0A w58A4 t.@
t.0BRANCH CELL 009B ( -> 8263 )
w819F t.3 LIT16 0004 w8174 LIT8 19 w4830 t.2 w4D22 LIT8 7C
LIT8 26 LIT8 27 w75D4 LIT8 0B w6000 w767B LIT8 45 t.PAUSE
LIT8 28 t.0 w75C5 LIT8 7C LIT8 27 w75C5 LIT8 7C LIT8 1B w75C5
w7A24 LIT8 1E t.PAUSE LIT8 7C t.0 w75C5 LIT8 2C w4830 t.0
w4D22 LIT8 2D w4830 t.0 w4D22 t.1 t.1 LIT8 11 LIT8 0F t.2
w73B1 LIT8 32 t.PAUSE LIT8 1C w4830 t.2 w5949 t.1 t.PLAY-MUSIC
w469B t.3 w671D w45A4
( label 8253 )
w81A9 LIT16 0004 LIT16 0004 w8174
t.BRANCH CELL FFF2 ( -> 8253 )
( label 8263 )
t.BRANCH CELL 0004 ( -> 8269 )
( label 8267 )
w8111
( label 8269 )
t.;S
AT 826B

( w8270 | NFA 826B CFA 8270 )
( Unknown erased name; CFA identifier )
AT 826B
( Header: flags, saved name and link )
BYTES 8200D3AF81
DOVAR
CELL 0000
AT 8274

( w8279 | NFA 8274 CFA 8279 )
( Unknown erased name; CFA identifier )
AT 8274
( Header: flags, saved name and link )
BYTES 8200B16B82
DOCOL
LIT8 09 t.0 t.(DO)
( label 8282 )
t.1 t.PAUSE t.0 t.TRIGGER@ t.0=_12DE
t.0BRANCH CELL 000C ( -> 829A )
t.1 w8270 t.! w469B t.LEAVE
( label 829A )
t.(LOOP) CELL FFE6 ( -> 8282 )
t.;S
AT 82A0

( w82A6 | NFA 82A0 CFA 82A6 )
( Unknown erased name; CFA identifier )
AT 82A0
( Header: flags, saved name and link )
BYTES 830000D77482
DOCOL
t.0 w8270 t.! w5D6D
( label 82B0 )
LIT8 07 w6000 LIT8 1A w4830 t.0 w4D22 w8279 LIT8 21 w4830 t.2
w4D22 w8279 w8270 t.@
t.0BRANCH CELL FFDF ( -> 82B0 )
w5D6D t.;S
AT 82D7

( w82DD | NFA 82D7 CFA 82DD )
( Unknown erased name; CFA identifier )
AT 82D7
( Header: flags, saved name and link )
BYTES 830000B0A082
DOCOL
w8121
t.0BRANCH CELL 001C ( -> 82FF )
LIT8 2F w7629 LIT8 7E t.0 w75C5 w82A6 LIT8 7C LIT8 19 w75C5
t.BRANCH CELL 0011 ( -> 830E )
( label 82FF )
t.1 w671D w45A4 w82A6 LIT8 19 t.0 w75C5
( label 830E )
t.;S
AT 8310

( w8316 | NFA 8310 CFA 8316 )
( Unknown erased name; CFA identifier )
AT 8310
( Header: flags, saved name and link )
BYTES 830000B1D782
DOCOL
w6749 w7BFA
t.0BRANCH CELL 0025 ( -> 8343 )
t.1 LIT16 0009 w58A4 t.! LIT8 05 w6000 LIT8 10 w69E8 w82DD
w6749 LIT8 C8 t.+ w6869
t.BRANCH CELL 001B ( -> 835C )
( label 8343 )
w6756 LIT8 C8 t.+ w7BF0 t.@ t.=
t.0BRANCH CELL 000A ( -> 835C )
w469B t.1 w671D w45A4
( label 835C )
t.;S
AT 835E

( w8363 | NFA 835E CFA 8363 )
( Unknown erased name; CFA identifier )
AT 835E
( Header: flags, saved name and link )
BYTES 8200CE1083
DOVAR
BYTES 260002134D4154455249413D4E49454F7A5957494F4E4110435A4153
BYTES 553D4E49453D504F4B4F4E415A
AT 838E

( w8393 | NFA 838E CFA 8393 )
( Unknown erased name; CFA identifier )
AT 838E
( Header: flags, saved name and link )
BYTES 8200D05E83
DOCOL
t.0 t.1 w5A35 t.3 t.+ t.0 LIT8 05 t.0 t.(DO)
( label 83A8 )
t.OVER t.I t.+ t.C@ t.DUP t.0=_12DE t.SWAP LIT8 D8 t.= t.+
t.0=_12DE t.+
t.(LOOP) CELL FFE5 ( -> 83A8 )
t.0=_12DE t.SWAP t.DROP t.;S
AT 83CD

( w83D3 | NFA 83CD CFA 83D3 )
( Unknown erased name; CFA identifier )
AT 83CD
( Header: flags, saved name and link )
BYTES 830000B28E83
DOCOL
LIT8 09 w6256
t.0BRANCH CELL 0030 ( -> 840C )
w8393
t.0BRANCH CELL 0020 ( -> 8402 )
LIT8 05 w6000 w767B LIT8 32 t.PAUSE LIT8 10 w69E8 w4ABE w79E3
LIT8 30 w7629
t.BRANCH CELL 000C ( -> 840C )
( label 8402 )
w616C w469B w8363 t.2+ w45A4
( label 840C )
t.;S
AT 840E

( w8414 | NFA 840E CFA 8414 )
( Unknown erased name; CFA identifier )
AT 840E
( Header: flags, saved name and link )
BYTES 830000B3CD83
DOCOL
w6749 w6256
t.0BRANCH CELL 000F ( -> 842B )
w6878 w67AE w5C26 LIT8 10 w69E8 w7A24
( label 842B )
t.;S
AT 842D

( DICTIONARY-MARK | NFA 842D CFA 8432 )
( Inferred descriptive name, not recovered original: Two )
( saved cells contain HERE and LATEST for dictionary )
( restoration. )
AT 842D
( Header: flags, saved name and link )
BYTES 8200C80E84
DOVAR
BYTES 4F843884
AT 8438

( SAVE-DICTIONARY-MARK | NFA 8438 CFA 843D )
( Inferred descriptive name, not recovered original: Stores )
( HERE and LATEST in the two cells at CFA8432. )
AT 8438
( Header: flags, saved name and link )
BYTES 8200C82D84
DOCOL
t.HERE t.DICTIONARY-MARK t.! t.LATEST t.DICTIONARY-MARK t.2+
t.! t.;S
AT 844F

( RESTORE-DICTIONARY | NFA 844F CFA 8454 )
( Inferred descriptive name, not recovered original: )
( Restores DP and the cold-start DP/FENCE/latest cells from )
( the dictionary mark. )
AT 844F
( Header: flags, saved name and link )
BYTES 8200BE3884
DOCOL
t.DICTIONARY-MARK t.@ t.DP t.! t.DICTIONARY-MARK t.@ t.DUP
LIT16 001C t.+ORIGIN t.! LIT16 001E t.+ORIGIN t.!
t.DICTIONARY-MARK t.2+ t.@ LIT16 000C t.+ORIGIN t.! t.;S
AT 8484

( w848B | NFA 8484 CFA 848B )
( Unknown erased name; CFA identifier )
AT 8484
( Header: flags, saved name and link )
BYTES 84000000CE4F84
DOCOL
t.>R LIT16 0014 t.OVER t.R t.SWAP w3F6D t.@ t.2 t./ t.- t.R
t.1+ t.POS t.R> t.OVER w3F6D t.WORD-COUNT t.STYPE t.;S
AT 84B5

( w84BC | NFA 84B5 CFA 84BC )
( Unknown erased name; CFA identifier )
AT 84B5
( Header: flags, saved name and link )
BYTES 84000000AB8484
DOCOL
LIT16 0006 w4830 LIT16 000C t.0 t.(DO)
( label 84CC )
t.I w4D22 LIT16 0004 t.PAUSE
t.(LOOP) CELL FFF4 ( -> 84CC )
t.;S
AT 84DC

( TITLE-SKIP-FLAG | NFA 84DC CFA 84E2 )
( Inferred descriptive name, not recovered original: )
( Boolean flag set after controller-zero trigger is pressed. )
AT 84DC
( Header: flags, saved name and link )
BYTES 830000C7B584
DOVAR
CELL 0000
AT 84E6

( POLL-TITLE-SKIP | NFA 84E6 CFA 84EC )
( Inferred descriptive name, not recovered original: Tests )
( trigger zero and sets title-skip flag on first press; )
( stops the music. )
AT 84E6
( Header: flags, saved name and link )
BYTES 830000C7DC84
DOCOL
t.0 LIT8 4D t.C! t.0 t.TRIGGER@ t.0=_12DE t.TITLE-SKIP-FLAG
t.@ t.0=_12DE t.*
t.0BRANCH CELL 000A ( -> 850F )
t.1 t.TITLE-SKIP-FLAG t.! t.STOP-MUSIC
( label 850F )
t.;S
AT 8511

( WAIT-TITLE | NFA 8511 CFA 8517 )
( Inferred descriptive name, not recovered original: Waits )
( a specified number of frame ticks while polling trigger )
( zero; exits early on title-skip flag. )
AT 8511
( Header: flags, saved name and link )
BYTES 830000D5E684
DOCOL
t.0 t.(DO)
( label 851D )
t.POLL-TITLE-SKIP t.1 t.PAUSE t.TITLE-SKIP-FLAG t.@
t.0BRANCH CELL 0004 ( -> 852D )
t.LEAVE
( label 852D )
t.(LOOP) CELL FFEE ( -> 851D )
t.;S
AT 8533

( INIT-TITLE-DISPLAY | NFA 8533 CFA 853A )
( Inferred descriptive name, not recovered original: )
( Disables DMA, loads/installs intro display and character )
( resources, initializes music and VBI; prints ERROR on )
( failed load. )
AT 8533
( Header: flags, saved name and link )
BYTES 84000000D41185
DOCOL
t.0 w5CE1 t.! t.1 w3FBE t.! t.DISABLE-DISPLAY-DMA t.1 w3FCA
t.! t.0 LIT8 A0 t.3 w4221 w4215 t.@
t.0BRANCH CELL 0012 ( -> 8571 )
t.RESTORE-DISPLAY-DMA t.CR
( ATASCII text: ERROR )
t.(.")
BYTES 054552524F52
( label 856D )
t.BRANCH CELL FFFE ( -> 856D )
( label 8571 )
w4C29 w5E4F LIT8 06 t.2 t.(DO)
( label 857C )
t.I w4830 t.0 w4D22
t.(LOOP) CELL FFF6 ( -> 857C )
LIT8 06 w4830 LIT16 0000 w4D22 t.0 t.1 t.POS
( ATASCII text:   )
t.(.")
BYTES 0120
LIT16 0008 LIT16 BC00 w480C LIT16 00BC LIT16 02F4 t.C! w5E93
w5E9E t.! LIT16 000D w5E9E t.@ LIT8 06 t.- w480C LIT8 58 t.@
LIT8 28 t.- LIT8 28 t.1 t.FILL t.RESTORE-DISPLAY-DMA w5EE5 t.0
t.PLAY-MUSIC t.RUN-VBI1 t.;S
AT 85E3

( w85E9 | NFA 85E3 CFA 85E9 )
( Unknown erased name; CFA identifier )
AT 85E3
( Header: flags, saved name and link )
BYTES 830000CC3385
DOVAR
CELL 0901
AT 85ED

( w85F3 | NFA 85ED CFA 85F3 )
( Unknown erased name; CFA identifier )
AT 85ED
( Header: flags, saved name and link )
BYTES 830000A1E385
DOCOL
t.DUP t.C@ LIT16 0020 t.OR t.SWAP t.C! t.;S
AT 8605

( w860C | NFA 8605 CFA 860C )
( Unknown erased name; CFA identifier )
AT 8605
( Header: flags, saved name and link )
BYTES 84000000A1ED85
DOCOL
t.DUP t.C@ LIT16 00DF t.AND t.SWAP t.C! t.;S
AT 861E

( w8624 | NFA 861E CFA 8624 )
( Unknown erased name; CFA identifier )
AT 861E
( Header: flags, saved name and link )
BYTES 830000C40586
DOCON
CELL A7E8
AT 8628

( w862D | NFA 8628 CFA 862D )
( Unknown erased name; CFA identifier )
AT 8628
( Header: flags, saved name and link )
BYTES 8200D31E86
DOCON
CELL D405
AT 8631

( PRINT-CENTERED-TEXT | NFA 8631 CFA 8637 )
( Inferred descriptive name, not recovered original: )
( Centers a word-counted string in a 40-column line and )
( calls STYPE. )
AT 8631
( Header: flags, saved name and link )
BYTES 830000D42886
DOCOL
t.DUP t.>R t.@ t.2 t./ LIT16 0014 t.SWAP t.- t.SWAP t.POS t.R>
t.WORD-COUNT t.STYPE t.;S
AT 8657

( SCREEN-ROW-ADDR | NFA 8657 CFA 865D )
( Inferred descriptive name, not recovered original: )
( Multiplies row by 40 and adds the OS screen pointer at )
( $58. )
AT 8657
( Header: flags, saved name and link )
BYTES 830000D33186
DOCOL
LIT16 0028 t.* LIT16 0058 t.@ t.+ t.;S
AT 866F

( COPY-TEXT-ROW | NFA 866F CFA 8675 )
( Inferred descriptive name, not recovered original: Copies )
( 40 bytes from the temporary line buffer into the )
( requested screen row. )
AT 866F
( Header: flags, saved name and link )
BYTES 830000CC5786
DOCOL
t.SCREEN-ROW-ADDR w47EF t.SWAP LIT16 0028 t.CMOVE t.;S
AT 8685

( CLEAR-TEXT-ROW | NFA 8685 CFA 868B )
( Inferred descriptive name, not recovered original: Erases )
( 40 bytes at the requested screen row. )
AT 8685
( Header: flags, saved name and link )
BYTES 830000CC6F86
DOCOL
t.SCREEN-ROW-ADDR LIT16 0028 t.ERASE t.;S
AT 8697

( RENDER-CENTERED-ROW | NFA 8697 CFA 869E )
( Inferred descriptive name, not recovered original: )
( Temporarily switches the OS screen pointer to a 40-byte )
( buffer, renders centered text, then restores it. )
AT 8697
( Header: flags, saved name and link )
BYTES 84000000C98586
DOCOL
w47EF LIT16 0028 t.ERASE LIT16 0058 t.@ t.>R w47EF LIT16 0058
t.! t.0 t.SWAP t.PRINT-CENTERED-TEXT t.R> LIT16 0058 t.! t.;S
AT 86C8

( SCROLL-EIGHT-PIXELS | NFA 86C8 CFA 86CD )
( Inferred descriptive name, not recovered original: Writes )
( 0,2,4,6 into ANTIC VSCROL [$D405], pausing one tick )
( between values. )
AT 86C8
( Header: flags, saved name and link )
BYTES 8200C79786
DOCOL
LIT16 0008 t.0 t.(DO)
( label 86D7 )
t.I w862D t.C! t.1 t.PAUSE t.2
t.(+LOOP) CELL FFF2 ( -> 86D7 )
t.;S
AT 86E9

( SCROLL-TITLE-ROW | NFA 86E9 CFA 86EF )
( Inferred descriptive name, not recovered original: Moves )
( the prepared row through screen lines with vertical fine )
( scrolling, polling for the skip trigger. )
AT 86E9
( Header: flags, saved name and link )
BYTES 830000C7C886
DOCOL
w85E9 w4C54 t.>R t.1+ t.DUP t.R> t.1+ t.(DO)
( label 8701 )
t.POLL-TITLE-SKIP t.0 w862D t.C! t.I t.COPY-TEXT-ROW t.I w8624
t.+ t.1 t.- w85F3 t.SCROLL-EIGHT-PIXELS t.DUP t.1+ t.I t.=
t.0BRANCH CELL 000E ( -> 8733 )
t.I t.1 t.- t.COPY-TEXT-ROW
t.BRANCH CELL 0006 ( -> 8737 )
( label 8733 )
t.I t.CLEAR-TEXT-ROW
( label 8737 )
t.-1
t.(+LOOP) CELL FFC6 ( -> 8701 )
w85E9 t.C@ t.1+ w85E9 t.C! LIT16 0007 w862D t.C! t.DUP w8624
t.+ w860C t.1+ t.CLEAR-TEXT-ROW t.;S
AT 875D

( SCROLL-TITLE-TEXT | NFA 875D CFA 8763 )
( Inferred descriptive name, not recovered original: Looks )
( up consecutive packed lines, centers them in the )
( temporary buffer and scrolls each into the title area. )
AT 875D
( Header: flags, saved name and link )
BYTES 830000C7E986
DOCOL
t.1+ t.1 t.(DO)
( label 876B )
t.I t.OVER w3F6D t.RENDER-CENTERED-ROW t.SCROLL-TITLE-ROW
t.(LOOP) CELL FFF4 ( -> 876B )
t.DROP t.;S
AT 877D

( SHOW-TITLE-PAGE | NFA 877D CFA 8783 )
( Inferred descriptive name, not recovered original: )
( Scrolls the lines of one packed title page and waits 150 )
( frame ticks. )
AT 877D
( Header: flags, saved name and link )
BYTES 830000D85D87
DOCOL
t.DUP t.2+ t.C@ t.1 w85E9 t.C! t.SCROLL-TITLE-TEXT LIT8 96
t.WAIT-TITLE t.;S
AT 879A

( SHOW-TITLE-SEQUENCE | NFA 879A CFA 87A0 )
( Inferred descriptive name, not recovered original: Loops )
( over eight intro text pages until trigger zero is )
( pressed, then changes music and presents the final page. )
AT 879A
( Header: flags, saved name and link )
BYTES 830000D87D87
DOCOL
LIT16 0009 w4830
( label 87A8 )
LIT8 08 t.0 t.(DO)
( label 87AF )
t.I w47FE t.2+ t.SHOW-TITLE-PAGE t.TITLE-SKIP-FLAG t.@
t.0BRANCH CELL 0004 ( -> 87C1 )
t.LEAVE
( label 87C1 )
t.(LOOP) CELL FFEC ( -> 87AF )
t.TITLE-SKIP-FLAG t.@
t.0BRANCH CELL FFDD ( -> 87A8 )
t.1 t.PLAY-MUSIC t.0 w47FE t.2+ t.SHOW-TITLE-PAGE t.2
t.PLAY-MUSIC t.;S
AT 87DF

( BOOT-INTRO | NFA 87DF CFA 87E7 )
( Inferred descriptive name, not recovered original: )
( Selects intro resources, initializes the title, restores )
( dictionary state, shows intro pages, selects gameplay )
( resources and enters GAME-LOOP. )
AT 87DF
( Header: flags, saved name and link )
BYTES 8500000000CC9A87
DOCOL
t.1 LIT16 0244 t.C! LIT16 A050 t.RESOURCE-BASE t.!
t.INIT-TITLE-DISPLAY t.DICTIONARY-MARK t.@ t.DP t.!
t.RESTORE-DICTIONARY t.SHOW-TITLE-SEQUENCE LIT16 0006 w4830
w84BC t.3 t.PLAY-MUSIC LIT8 14 t.PAUSE LIT16 A3E0
t.RESOURCE-BASE t.! t.STOP-MUSIC t.3 t.PAUSE t.STOP-VBI1
t.GAME-LOOP t.;S
AT 882C
( Final saved boot-sector padding: retired N>N / SAVE-RUN )
BYTES 834E3ECEDF87411466173417E413771288534156452D5255CE2C8841
BYTES 14A5242D0FE987D5146216A5132D0FCE1E08145117A51309167313E4
BYTES 13670F1F0312CD146216A513C10F0800371AA20F040080273288A513
AT 8880
