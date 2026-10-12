( Wladcy Ciemnosci v1 30-game.fth: target 6010..8757 )
( Hexadecimal. BYTES emits bytes; CELL emits 16-bit cells. )
( LIT8/LIT16 compile literals; branches retain signed )
( offsets. )

( w6015 | NFA 6010 CFA 6015 )
( Unknown erased name; CFA identifier )
AT 6010
( Header: flags, saved name and link )
BYTES 8200A3CB5F
DOCOL
( ATASCII text: .=vvvvvvvvv=b.=vvvvvvvvv=. )
t.(S")
BYTES 1A813D7676767676767676763D62ED3D7676767676767676763D84
t.;S
AT 6036

( w603C | NFA 6036 CFA 603C )
( Unknown erased name; CFA identifier )
AT 6036
( Header: flags, saved name and link )
BYTES 830000D31060
DOCOL
LIT8 07 t.1 t.POS
( ATASCII text: .......................... )
t.(S")
BYTES 1A9197979797979797979797978591979797979797979797979785
LIT8 07 t.2 t.POS
( ATASCII text: .====SPIS===b.===MOCY====. )
t.(S")
BYTES 1A813D3D3D3D535049533D3D3D62ED3D3D3D4D4F43593D3D3D3D84
LIT8 07 t.3 t.POS w6015 LIT8 04 t.0 t.(DO)
( label 6096 )
t.I LIT16 0004 t.+ t.Y! LIT8 07 t.X! t.I t.2 t.* w5517
LIT16 0005 t.+ LIT8 0D t.STYPE LIT8 14 t.X! t.I t.2 t.* t.1+
w5517 LIT16 0005 t.+ LIT8 0D t.STYPE
t.(LOOP) CELL FFC2 ( -> 6096 )
LIT8 07 LIT8 08 t.POS w6015 LIT8 07 LIT8 09 t.POS
( ATASCII text: .......................... )
t.(S")
BYTES 1A9A9898989898989898989898839A989898989898989898989883
t.;S
AT 6107

( w610E | NFA 6107 CFA 610E )
( Unknown erased name; CFA identifier )
AT 6107
( Header: flags, saved name and link )
BYTES 84000000DA3660
DOCOL
LIT8 13 w5F9C t.;S
AT 6117

( w611D | NFA 6117 CFA 611D )
( Unknown erased name; CFA identifier )
AT 6117
( Header: flags, saved name and link )
BYTES 830000C20761
DOCOL
w59DC t.DUP t.>R w3F5F w3896 t.DUP
t.0BRANCH CELL 000A ( -> 6137 )
t.R t.+ t.1+ t.1
( label 6137 )
t.R> t.DROP t.;S
AT 613D

( w6142 | NFA 613D CFA 6142 )
( Unknown erased name; CFA identifier )
AT 613D
( Header: flags, saved name and link )
BYTES 8200C31761
DODOES
( DOES> thread at 3F4E )
BYTES 4E3F3A001500020A54413D4D4F433D4E4945085A41445A49416C4101
BYTES 00011C00020F4252414B3D43493D4A45444E45474F0A50525A45444D
BYTES 494F54553861
AT 6182

( w6187 | NFA 6182 CFA 6187 )
( Unknown erased name; CFA identifier )
AT 6182
( Header: flags, saved name and link )
BYTES 8200C33D61
DOVAR
BYTES 000005414C4C4F542020202020202020202020202020202020202020
BYTES 202020202020202013A513C514CD14F860C10F0A008027CD14A20F04
BYTES 00DE12834152DA7D
AT 61C9

( w61CF | NFA 61C9 CFA 61CF )
( Unknown erased name; CFA identifier )
AT 61C9
( Header: flags, saved name and link )
BYTES 830000DA8261
DOCOL
t.C@ t.DUP t.0 t.1 w611D
t.0BRANCH CELL 000A ( -> 61E7 )
t.2DROP t.1
t.BRANCH CELL 0004 ( -> 61E9 )
( label 61E7 )
t.0=_12DE
( label 61E9 )
t.;S
AT 61EB

( w61F2 | NFA 61EB CFA 61F2 )
( Unknown erased name; CFA identifier )
AT 61EB
( Header: flags, saved name and link )
BYTES 84000000C1C961
DOCOL
t.>R w5220 LIT8 0C LIT8 9A w50FC t.2 LIT16 0004 w512A LIT8 34
LIT16 0008 w514D t.0 w4F68 t.! t.0 w4F82 t.! w466E w603C t.1
w5F9C w5D2E t.2 t.* t.+ w5517 t.2+ t.DUP t.C@ t.R> t.=
t.0BRANCH CELL 0032 ( -> 626D )
t.1+ t.DUP w61CF t.SWAP t.1+ w61CF t.2DUP t.*
t.0BRANCH CELL 000A ( -> 6259 )
t.2DROP t.1
t.BRANCH CELL 0012 ( -> 6269 )
( label 6259 )
w466E w610E t.+ t.1+ w6142 t.2+ w45A1 t.0
( label 6269 )
t.BRANCH CELL 0012 ( -> 627D )
( label 626D )
t.DROP w610E w466E t.0 w6142 t.2+ w45A1 t.0
( label 627D )
w5266 w5204 t.;S
AT 6283

( w6288 | NFA 6283 CFA 6288 )
( Unknown erased name; CFA identifier )
AT 6283
( Header: flags, saved name and link )
BYTES 8200C3EB61
DOVAR
BYTES 00000541
AT 628E

( w6294 | NFA 628E CFA 6294 )
( Unknown erased name; CFA identifier )
AT 628E
( Header: flags, saved name and link )
BYTES 830000A18362
DOCOL
LIT8 08 t.0 t.(DO)
( label 629D )
t.I w5517 t.2+ t.C@ t.>R t.R t.OVER t.C@ t.= t.R> t.0=_12DE
t.+
t.0BRANCH CELL 000A ( -> 62C1 )
t.I w5517 t.2+ t.LEAVE
( label 62C1 )
t.(LOOP) CELL FFDA ( -> 629D )
t.2DUP t.3 t.CMOVE LIT8 05 t.+ w6288 t.2+ t.! t.3 t.+ w6288
t.! t.;S
AT 62E0

( w62E7 | NFA 62E0 CFA 62E7 )
( Unknown erased name; CFA identifier )
AT 62E0
( Header: flags, saved name and link )
BYTES 84000000C28E62
DODOES
( DOES> thread at 3F4E )
BYTES 4E3F260203004E494309004E49453D504154525A01005E06005A4F53
BYTES 544157030057457A06005A4F4241435A0500434F3D544F0800504F43
BYTES 5A6154454B06004F44435A595405005A4150495301004B0100520500
BYTES 57454A447A0B0049447A3D573D505241574F090049447A3D573D5459
BYTES 6C0A0049447A3D573D4C45574F06004F54576F525A07005A414D4B4E
BYTES 494A0600524F5A42494A07005A4E49535A435A06004F54576F525A09
BYTES 00557A594A3D4D4F435901001301001001001101001001001005005A
BYTES 414B4F5001001004005A4741730100040500554445525A0100040500
BYTES 4F446C414D0100040800524F5A574553454C08004E4150456C4E494A
BYTES 060055424945525A0100150100040800504F534D4152554A0A004E41
BYTES 4B41524D3D5053590100140100150700536C554348414A05005A4150
BYTES 414C0500434F3D544F0A0050525A45435A5954414A01002F01001501
BYTES 000C0C004B55503D493D5A41506C41630D00504F574945445A3D4241
BYTES 4A4B650E00504F574945445A3D505241574465010015090050525A45
BYTES 534B4F435A070050525A4542494A0100060A0049447A3D50524F5354
BYTES 4F01000D01000E01000F01001501003A07004E41424945525A070049
BYTES 447A3D54414D0100410400506C596E0600434F464E494A0100150300
BYTES 44414A010015080057595452454E554A01000C01000307005A4E4953
BYTES 5A435A07005A416C4154414A0700504F54525A594A0100120500576C
BYTES 61435A00000000000000000000000000000000000000
AT 6513

( w6518 | NFA 6513 CFA 6518 )
( Unknown erased name; CFA identifier )
AT 6513
( Header: flags, saved name and link )
BYTES 8200D4E062
DOCON
CELL 8D20
AT 651C

( w6522 | NFA 651C CFA 6522 )
( Unknown erased name; CFA identifier )
AT 651C
( Header: flags, saved name and link )
BYTES 830000CB1365
DOVAR
CELL 0000
AT 6526

( w652C | NFA 6526 CFA 652C )
( Unknown erased name; CFA identifier )
AT 6526
( Header: flags, saved name and link )
BYTES 830000C51C65
DOVAR
CELL 0000
AT 6530

( w6535 | NFA 6530 CFA 6535 )
( Unknown erased name; CFA identifier )
AT 6530
( Header: flags, saved name and link )
BYTES 8200C52665
DOVAR
CELL 0000
AT 6539

( w653F | NFA 6539 CFA 653F )
( Unknown erased name; CFA identifier )
AT 6539
( Header: flags, saved name and link )
BYTES 830000CB3065
DOCOL
LIT8 C8 t.+ t.1 w593A w3F74 w3F5F t.OVER t.>R w3896 t.-DUP
t.0BRANCH CELL 001A ( -> 6572 )
t.1 t.- t.R t.+ t.DUP t.2+ w6522 t.! t.1+ t.C@
t.BRANCH CELL 0004 ( -> 6574 )
( label 6572 )
t.1
( label 6574 )
t.0 w6518 w4849 w6518 w652C t.! t.R> t.DROP t.;S
AT 6586

( w658C | NFA 6586 CFA 658C )
( Unknown erased name; CFA identifier )
AT 6586
( Header: flags, saved name and link )
BYTES 830000D23965
DOCOL
t.-DUP
t.0BRANCH CELL 002F ( -> 65C1 )
LIT8 64 t.1 t.(DO)
( label 659B )
t.I t.1 w54F2 t.2+ w3F74 t.2+ t.DUP w652C t.! t.2+ t.C@ t.OVER
t.=
t.0BRANCH CELL 0004 ( -> 65BB )
t.LEAVE
( label 65BB )
t.(LOOP) CELL FFDE ( -> 659B )
t.DROP
( label 65C1 )
t.;S
AT 65C3

( w65C9 | NFA 65C3 CFA 65C9 )
( Unknown erased name; CFA identifier )
AT 65C3
( Header: flags, saved name and link )
BYTES 830000D78665
DOCOL
t.DUP w6535 t.! t.DUP LIT8 C8 t.>
t.0BRANCH CELL 0008 ( -> 65E2 )
w658C
t.BRANCH CELL 0004 ( -> 65E4 )
( label 65E2 )
w653F
( label 65E4 )
t.;S
AT 65E6

( w65ED | NFA 65E6 CFA 65ED )
( Unknown erased name; CFA identifier )
AT 65E6
( Header: flags, saved name and link )
BYTES 84000000D2C365
DOCOL
t.SWAP t.>R w62E7 t.DUP t.C@ t.2 t.<
t.0BRANCH CELL 0008 ( -> 6607 )
t.2+ t.C@ w62E7
( label 6607 )
w3F5F t.DUP t.R t.C! t.R t.1+ t.SWAP t.CMOVE t.R> t.COUNT t.+
t.;S
AT 661F

( w6624 | NFA 661F CFA 6624 )
( Unknown erased name; CFA identifier )
AT 661F
( Header: flags, saved name and link )
BYTES 8200C5E665
DODOES
( DOES> thread at 51DC )
BYTES DC512020202020202020202020202020202020202020
AT 663C

( w6642 | NFA 663C CFA 6642 )
( Unknown erased name; CFA identifier )
AT 663C
( Header: flags, saved name and link )
BYTES 830000D91F66
DOCOL
w481B LIT8 4C t.ERASE w481B t.1+ w5C7C t.@
t.0BRANCH CELL 0014 ( -> 6669 )
t.0 w65ED t.0 t.0 w6624 t.! t.1 w481B w4C79
( label 6669 )
w6535 t.@
t.0BRANCH CELL 0047 ( -> 66B6 )
LIT8 0B t.1 t.(DO)
( label 6678 )
t.I w652C t.@ w3F74 t.DUP t.C@
t.0BRANCH CELL 001E ( -> 66A4 )
t.2+ t.C@ t.DUP t.I t.1 t.- w481B t.C@ t.+ w6624 t.! w65ED
t.BRANCH CELL 0010 ( -> 66B2 )
( label 66A4 )
t.DROP t.I t.1 t.- w481B w4C79 t.LEAVE
( label 66B2 )
t.(LOOP) CELL FFC4 ( -> 6678 )
( label 66B6 )
w5C7C t.@ w5166 t.C@ t.*
t.0BRANCH CELL 001C ( -> 66DE )
t.1 t.DUP w481B t.C@ w6624 t.! w65ED t.DROP t.1 w481B w4C79
t.BRANCH CELL 0004 ( -> 66E0 )
( label 66DE )
t.DROP
( label 66E0 )
w481B w45A1 t.;S
AT 66E6

( w66EC | NFA 66E6 CFA 66EC )
( Unknown erased name; CFA identifier )
AT 66E6
( Header: flags, saved name and link )
BYTES 830000D73C66
DOVAR
CELL 0000
AT 66F0

( w66F6 | NFA 66F0 CFA 66F6 )
( Unknown erased name; CFA identifier )
AT 66F0
( Header: flags, saved name and link )
BYTES 830000D2E666
DOCOL
w5220 LIT8 15 w44EE t.@ t.2 t./ t.- LIT8 89 w50FC w44EE t.@
t.2 t.- w481B t.C@ w512A LIT8 04 LIT8 08 w514D t.0 w4F82 t.1+
t.C! w44EE t.@ t.2 t./ w44E5 t.@ t.2 t./MOD t.+ t.+ t.3 t.-
w4F82 t.C! w5D2E t.SWAP t.DROP t.DUP w652C t.@ w3F74 w66EC t.!
w6624 t.@ w5266 w5204 t.;S
AT 6762

( w676A | NFA 6762 CFA 676A )
( Unknown erased name; CFA identifier )
AT 6762
( Header: flags, saved name and link )
BYTES 8500000000C2F066
DOCOL
w6642 w66F6 t.;S
AT 6772

( w6777 | NFA 6772 CFA 6777 )
( Unknown erased name; CFA identifier )
AT 6772
( Header: flags, saved name and link )
BYTES 8200D96267
DOCOL
w66EC t.@ t.+ t.2+ t.;S
AT 6783

( w6789 | NFA 6783 CFA 6789 )
( Unknown erased name; CFA identifier )
AT 6783
( Header: flags, saved name and link )
BYTES 830000C07267
DOCOL
w6777 t.C@ t.;S
AT 6791

( w6796 | NFA 6791 CFA 6796 )
( Unknown erased name; CFA identifier )
AT 6791
( Header: flags, saved name and link )
BYTES 8200CB8367
DOCOL
w6522 t.@ t.;S
AT 679E

( w67A3 | NFA 679E CFA 67A3 )
( Unknown erased name; CFA identifier )
AT 679E
( Header: flags, saved name and link )
BYTES 8200CB9167
DOCOL
w6796 t.C@ t.;S
AT 67AB

( w67B0 | NFA 67AB CFA 67B0 )
( Unknown erased name; CFA identifier )
AT 67AB
( Header: flags, saved name and link )
BYTES 8200CB9E67
DOCOL
w6796 t.1+ t.C@ t.;S
AT 67BA

( w67BF | NFA 67BA CFA 67BF )
( Unknown erased name; CFA identifier )
AT 67BA
( Header: flags, saved name and link )
BYTES 8200CBAB67
DOCOL
w6796 t.2+ t.C@ t.;S
AT 67C9

( w67CE | NFA 67C9 CFA 67CE )
( Unknown erased name; CFA identifier )
AT 67C9
( Header: flags, saved name and link )
BYTES 8200C2BA67
DOCOL
t.>R t.2DUP t.R w611D
t.0BRANCH CELL 000E ( -> 67E8 )
t.2DROP t.R> t.2DROP t.1
t.BRANCH CELL 001A ( -> 6800 )
( label 67E8 )
t.0 t.SWAP t.R> w611D
t.0BRANCH CELL 000A ( -> 67FC )
t.C! t.1
t.BRANCH CELL 0006 ( -> 6800 )
( label 67FC )
t.DROP t.0
( label 6800 )
t.;S
AT 6802

( w6808 | NFA 6802 CFA 6808 )
( Unknown erased name; CFA identifier )
AT 6802
( Header: flags, saved name and link )
BYTES 830000A1C967
DOCOL
w550D t.@ t.P w67CE t.DROP t.;S
AT 6816

( w681C | NFA 6816 CFA 681C )
( Unknown erased name; CFA identifier )
AT 6816
( Header: flags, saved name and link )
BYTES 830000C20268
DOCOL
w611D
t.0BRANCH CELL 0008 ( -> 682A )
t.0 t.SWAP t.C!
( label 682A )
t.;S
AT 682C

( w6833 | NFA 682C CFA 6833 )
( Unknown erased name; CFA identifier )
AT 682C
( Header: flags, saved name and link )
BYTES 84000000A11668
DOCOL
w550D t.@ t.P w681C t.;S
AT 683F

( w6844 | NFA 683F CFA 6844 )
( Unknown erased name; CFA identifier )
AT 683F
( Header: flags, saved name and link )
BYTES 8200D22C68
DOVAR
BYTES 1400020D4E49453D554E4945534945535A0454594C4520
AT 685D

( w6863 | NFA 685D CFA 6863 )
( Unknown erased name; CFA identifier )
AT 685D
( Header: flags, saved name and link )
BYTES 830000A13F68
DOCOL
t.>R t.R t.0 t.1 w67CE
t.0BRANCH CELL 003B ( -> 68AC )
t.R LIT8 CA t.- t.R t.0 t.1 w59DC w3F5F w3896 t.2 t.-
LIT16 0004 t.* LIT8 0B t.+ t.OVER w55B4 t.C! LIT8 4E t.SWAP
w55B4 t.1+ t.C! t.1
t.BRANCH CELL 000C ( -> 68B6 )
( label 68AC )
w610E w6844 t.2+ w45A1 t.0
( label 68B6 )
t.R> t.DROP t.;S
AT 68BC

( w68C3 | NFA 68BC CFA 68C3 )
( Unknown erased name; CFA identifier )
AT 68BC
( Header: flags, saved name and link )
BYTES 84000000A15D68
DOCOL
t.0 t.1 w681C t.;S
AT 68CD

( w68D2 | NFA 68CD CFA 68D2 )
( Unknown erased name; CFA identifier )
AT 68CD
( Header: flags, saved name and link )
BYTES 8200D7BC68
DOCOL
t.1 w6789 t.;S
AT 68DA

( w68DF | NFA 68DA CFA 68DF )
( Unknown erased name; CFA identifier )
AT 68DA
( Header: flags, saved name and link )
BYTES 8200D7CD68
DOCOL
t.2 w6789 t.;S
AT 68E7

( w68EC | NFA 68E7 CFA 68EC )
( Unknown erased name; CFA identifier )
AT 68E7
( Header: flags, saved name and link )
BYTES 8200D7DA68
DOCOL
LIT8 03 w6789 t.;S
AT 68F5

( w68FA | NFA 68F5 CFA 68FA )
( Unknown erased name; CFA identifier )
AT 68F5
( Header: flags, saved name and link )
BYTES 8200D7E768
DOCOL
LIT8 04 w6789 t.;S
AT 6903

( w6908 | NFA 6903 CFA 6908 )
( Unknown erased name; CFA identifier )
AT 6903
( Header: flags, saved name and link )
BYTES 8200D7F568
DOCOL
LIT8 05 w6789 t.;S
AT 6911

( w6916 | NFA 6911 CFA 6916 )
( Unknown erased name; CFA identifier )
AT 6911
( Header: flags, saved name and link )
BYTES 8200D70369
DOCOL
LIT8 06 w6789 t.;S
AT 691F

( w6924 | NFA 691F CFA 6924 )
( Unknown erased name; CFA identifier )
AT 691F
( Header: flags, saved name and link )
BYTES 8200D71169
DOCOL
LIT8 07 w6789 t.;S
AT 692D

( w6934 | NFA 692D CFA 6934 )
( Unknown erased name; CFA identifier )
AT 692D
( Header: flags, saved name and link )
BYTES 84000000CB1F69
DOCOL
w4DB2 t.DUP t.>R t.2+ t.R w4C63 t.* w3896 t.1 t.- t.R> t.C@
t./MOD LIT8 06 t.* w5166 t.C@
t.0BRANCH CELL 000A ( -> 6965 )
w4C90 w4C63
t.BRANCH CELL 0008 ( -> 696B )
( label 6965 )
LIT16 0004 t.0
( label 696B )
t.ROT t.+ t.>R t.+ t.R> t.;S
AT 6977

( w697C | NFA 6977 CFA 697C )
( Unknown erased name; CFA identifier )
AT 6977
( Header: flags, saved name and link )
BYTES 8200D22D69
DOVAR
BYTES 1600020D4E49453D504F4B415A416C457306525A45435A59
AT 6996

( w699C | NFA 6996 CFA 699C )
( Unknown erased name; CFA identifier )
AT 6996
( Header: flags, saved name and link )
BYTES 830000BF7769
DOCOL
w5BFC LIT8 10 w5F9C w5D2E w5298 t.DUP t.0=_12DE
t.0BRANCH CELL 000C ( -> 69BB )
w610E w466E w697C t.2+ w45A1
( label 69BB )
w5C3A t.;S
AT 69BF

( w69C5 | NFA 69BF CFA 69C5 )
( Unknown erased name; CFA identifier )
AT 69BF
( Header: flags, saved name and link )
BYTES 830000B09669
DOCOL
( Trailing native code/data at 69C7; retained exactly )
BYTES 01000101000701000800007712
AT 69D4

( w69DA | NFA 69D4 CFA 69DA )
( Unknown erased name; CFA identifier )
AT 69D4
( Header: flags, saved name and link )
BYTES 830000B1BF69
DOCOL
( Trailing native code/data at 69DC; retained exactly )
BYTES 01000101000900007712
AT 69E6

( w69EC | NFA 69E6 CFA 69EC )
( Unknown erased name; CFA identifier )
AT 69E6
( Header: flags, saved name and link )
BYTES 830000D3D469
DOCOL
t.DROP w5C7C t.@
t.0BRANCH CELL 000A ( -> 6A00 )
LIT16 69DC
t.BRANCH CELL 0006 ( -> 6A04 )
( label 6A00 )
LIT16 69C7
( label 6A04 )
w652C t.! t.1 w6535 t.! t.0 w5CEC t.! t.;S
AT 6A16

( w6A1C | NFA 6A16 CFA 6A1C )
( Unknown erased name; CFA identifier )
AT 6A16
( Header: flags, saved name and link )
BYTES 830000C3E669
DOVAR
CELL 0000
AT 6A20

( w6A26 | NFA 6A20 CFA 6A26 )
( Unknown erased name; CFA identifier )
AT 6A20
( Header: flags, saved name and link )
BYTES 830000D2166A
CELL 6A28 ( native entry point )
BYTES 86D1 ( 6A28: STX $d1 )
BYTES A000 ( 6A2A: LDY #$00 )
BYTES 8C1E6A ( 6A2C: STY $6a1e )
BYTES A208 ( 6A2F: LDX #$08 )
BYTES B9E257 ( 6A31: LDA $57e2,Y )
BYTES 18 ( 6A34: CLC )
BYTES 4A ( 6A35: LSR A )
BYTES 9003 ( 6A36: BCC $6a3b )
BYTES EE1E6A ( 6A38: INC $6a1e )
BYTES CA ( 6A3B: DEX )
BYTES D0F6 ( 6A3C: BNE $6a34 )
BYTES C8 ( 6A3E: INY )
BYTES C019 ( 6A3F: CPY #$19 )
BYTES D0EC ( 6A41: BNE $6a2f )
BYTES A6D1 ( 6A43: LDX $d1 )
BYTES 4C470F ( 6A45: JMP $0f47 )
AT 6A48

( w6A4E | NFA 6A48 CFA 6A4E )
( Unknown erased name; CFA identifier )
AT 6A48
( Header: flags, saved name and link )
BYTES 830000A1206A
DOCOL
w550D t.@ w57E0 t.+ t.2DUP t.C@ t.AND t.0=_12DE
t.0BRANCH CELL 0008 ( -> 6A6A )
w4C79
t.BRANCH CELL 0004 ( -> 6A6C )
( label 6A6A )
t.2DROP
( label 6A6C )
t.;S
AT 6A6E

( w6A73 | NFA 6A6E CFA 6A73 )
( Unknown erased name; CFA identifier )
AT 6A6E
( Header: flags, saved name and link )
BYTES 8200C4486A
DOVAR
BYTES 1C00011A57594B4F4E416C45733D3D3D3D50524F43454E543D4D4953
BYTES 4A49202020
AT 6A96

( w6A9D | NFA 6A96 CFA 6A9D )
( Unknown erased name; CFA identifier )
AT 6A96
( Header: flags, saved name and link )
BYTES 84000000C36E6A
DOCOL
w5C7C t.@
t.0BRANCH CELL 0032 ( -> 6AD7 )
w6A26 w6A1C t.C@ LIT8 64 t.* LIT8 3D t./ t.0 t.<# t.#_268F
t.#_268F t.#> w6A73 LIT8 0E t.+ t.SWAP t.CMOVE w6A73 t.2+
LIT8 05 t.Y! w45A1
( label 6AD7 )
t.;S
AT 6AD9

( w6ADF | NFA 6AD9 CFA 6ADF )
( Unknown erased name; CFA identifier )
AT 6AD9
( Header: flags, saved name and link )
BYTES 830000C2966A
DOCOL
w5CEC t.@ t.>R t.0 w5D00 t.! t.R t.0=_12DE
t.0BRANCH CELL 0006 ( -> 6AF9 )
w65C9 w676A
( label 6AF9 )
t.R t.1 t.=
t.0BRANCH CELL 000A ( -> 6B0B )
w69EC w6642 w6A9D w66F6
( label 6B0B )
t.R t.1 t.>
t.0BRANCH CELL 000C ( -> 6B1F )
t.DROP t.R LIT16 0008 t.+
( label 6B1F )
t.R> t.DROP t.0 w5CEC t.! t.;S
AT 6B2B

( w6B31 | NFA 6B2B CFA 6B31 )
( Unknown erased name; CFA identifier )
AT 6B2B
( Header: flags, saved name and link )
BYTES 830000CBD96A
DOCOL
t.1 w5D00 t.! w5D2E w5298 t.DUP LIT8 05 t.= t.0=_12DE t.*
w5166 t.C@ t.0=_12DE
t.0BRANCH CELL 0007 ( -> 6B57 )
LIT8 1F t.AND
( label 6B57 )
t.0 w5D00 t.! t.;S
AT 6B5F

( w6B64 | NFA 6B5F CFA 6B64 )
( Unknown erased name; CFA identifier )
AT 6B5F
( Header: flags, saved name and link )
BYTES 8200C22B6B
DODOES
( DOES> thread at 51DC )
BYTES DC514E6E576E676E4271D971E671F8710A726273C87334744A746174
BYTES 6174617461746F748D744175617541766476BA76037713774B775F77
BYTES 6F7741767E799E79677FE177F677847A227B4D7B0A782A783E785A78
BYTES 9F78C8780F79687A2579AC79DE79F6790C7A467AE07AC07BDC7B2E7C
BYTES 627C4176707C847E9D7EB57ECE7E0D7F337F4D7B927F6B807D80D580
BYTES 4D803381B781FE8131824D8241768A82B3824176B3820F834350C25A
AT 6C0E

( w6C14 | NFA 6C0E CFA 6C14 )
( Unknown erased name; CFA identifier )
AT 6C0E
( Header: flags, saved name and link )
BYTES 830000C25F6B
DOVAR
BYTES 000005
AT 6C19

( w6C1F | NFA 6C19 CFA 6C1F )
( Unknown erased name; CFA identifier )
AT 6C19
( Header: flags, saved name and link )
BYTES 830000C20E6C
DOCOL
w6B64 t.@ t.-DUP t.0=_12DE
t.0BRANCH CELL 0008 ( -> 6C33 )
t.0 w6B64 t.@
( label 6C33 )
t.CFA t.EXECUTE t.;S
AT 6C39

( w6C41 | NFA 6C39 CFA 6C41 )
( Unknown erased name; CFA identifier )
AT 6C39
( Header: flags, saved name and link )
BYTES 8500000000C5196C
DOCOL
t.2DROP t.2DROP t.DROP t.;S
AT 6C4B

( w6C52 | NFA 6C4B CFA 6C52 )
( Unknown erased name; CFA identifier )
AT 6C4B
( Header: flags, saved name and link )
BYTES 84000000C3396C
DOCOL
t.>R w466E w4AA7 t.R> w59F0 t.1 w593A t.2+ w3F74 w3F5F t.2DUP
w42E2 t.SWAP t.CMOVE w6C14 t.SWAP t.CMOVE t.2 w593A t.2+ w3F74
w3F5F t.3 t.>
t.0BRANCH CELL 0008 ( -> 6C8E )
w45A1
t.BRANCH CELL 0004 ( -> 6C90 )
( label 6C8E )
t.DROP
( label 6C90 )
w4A95 w550D t.@ t.1 t.-
t.0BRANCH CELL 0006 ( -> 6CA2 )
t.1 w6A4E
( label 6CA2 )
t.;S
AT 6CA4

( w6CA9 | NFA 6CA4 CFA 6CA9 )
( Unknown erased name; CFA identifier )
AT 6CA4
( Header: flags, saved name and link )
BYTES 8200D44B6C
DOCOL
t.;S
AT 6CAD

( w6CB3 | NFA 6CAD CFA 6CB3 )
( Unknown erased name; CFA identifier )
AT 6CAD
( Header: flags, saved name and link )
BYTES 830000DAA46C
DOVAR
CELL 0000
AT 6CB7

( GAME-MAIN-LOOP | NFA 6CB7 CFA 6CBD )
( Inferred descriptive name, not recovered original: )
( Initializes the game display and enters the persistent )
( input, update and action loops called after the title. )
AT 6CB7
( Header: flags, saved name and link )
BYTES 830000C1AD6C
DOCOL
t.INITIALIZE-GAME-DISPLAY t.0 w6CB3 t.!
( label 6CC7 )
t.1 w5CEC t.! t.0 w5C7C t.! w466E t.1 w6ADF w6C1F
t.LAST-DISK-STATUS t.@ t.0=_12DE
t.0BRANCH CELL FFE4 ( -> 6CC7 )
t.INSTALL-GAME-VBI
( label 6CE7 )
t.0 w5CEC t.! w6B31 w466E w6ADF w466E w6C1F t.0
t.0BRANCH CELL FFEC ( -> 6CE7 )
t.;S
AT 6CFF

( w6D05 | NFA 6CFF CFA 6D05 )
( Unknown erased name; CFA identifier )
AT 6CFF
( Header: flags, saved name and link )
BYTES 830000D7B76C
DOCOL
w6C14 w42E2 LIT8 03 t.CMOVE t.;S
AT 6D12

( w6D18 | NFA 6D12 CFA 6D18 )
( Unknown erased name; CFA identifier )
AT 6D12
( Header: flags, saved name and link )
BYTES 830000C7FF6C
DOCOL
t.0 w42E2 t.! t.2 w42E2 t.2+ t.C! t.;S
AT 6D2A

( w6D31 | NFA 6D2A CFA 6D31 )
( Unknown erased name; CFA identifier )
AT 6D2A
( Header: flags, saved name and link )
BYTES 84000000C0126D
DOCOL
w5802 t.@ t.;S
AT 6D39

( w6D40 | NFA 6D39 CFA 6D40 )
( Unknown erased name; CFA identifier )
AT 6D39
( Header: flags, saved name and link )
BYTES 84000000A12A6D
DOCOL
w5802 t.! t.;S
AT 6D48

( w6D4E | NFA 6D48 CFA 6D4E )
( Unknown erased name; CFA identifier )
AT 6D48
( Header: flags, saved name and link )
BYTES 830000D4396D
DOCOL
w6CA9 w4DB2 t.DUP t.0 w4D9F t.! w4DB2 t.C@ w4C90 LIT16 0004
t.0 w4CE1 t.DROP w4DB2 t.2+ t.OVER w52B3 w3AC3 t.! w541A w4C90
w5441 t.;S
AT 6D80

( w6D85 | NFA 6D80 CFA 6D85 )
( Unknown erased name; CFA identifier )
AT 6D80
( Header: flags, saved name and link )
BYTES 8200CF486D
DOCOL
t.SWAP w5958 t.DROP w5916 w5958
t.0BRANCH CELL 0004 ( -> 6D97 )
w5928
( label 6D97 )
t.;S
AT 6D99

( w6DA0 | NFA 6D99 CFA 6DA0 )
( Unknown erased name; CFA identifier )
AT 6D99
( Header: flags, saved name and link )
BYTES 84000000C2806D
DOCOL
w6D85 w6D4E t.;S
AT 6DA8

( w6DAF | NFA 6DA8 CFA 6DAF )
( Unknown erased name; CFA identifier )
AT 6DA8
( Header: flags, saved name and link )
BYTES 84000000C2996D
DOCOL
t.>R w6D85 t.R> w5958
t.0BRANCH CELL 0004 ( -> 6DBF )
w5928
( label 6DBF )
w6D4E t.;S
AT 6DC3

( WAIT-KEY-OR-FIRE | NFA 6DC3 CFA 6DC9 )
( Inferred descriptive name, not recovered original: Clears )
( CH $02FC to $FF and waits until a keycode appears or )
( joystick trigger zero is pressed. )
AT 6DC3
( Header: flags, saved name and link )
BYTES 830000D3A86D
DOCOL
LIT8 FF LIT16 02FC t.!
( label 6DD4 )
t.0 t.JOYSTICK-TRIGGER t.0=_12DE LIT16 02FC t.C@ LIT8 FF t.=
t.0=_12DE t.+
t.0BRANCH CELL FFE9 ( -> 6DD4 )
t.;S
AT 6DEF

( w6DF4 | NFA 6DEF CFA 6DF4 )
( Unknown erased name; CFA identifier )
AT 6DEF
( Header: flags, saved name and link )
BYTES 8200D4C36D
DOVAR
BYTES 05000103434F3F
AT 6DFD

( w6E04 | NFA 6DFD CFA 6E04 )
( Unknown erased name; CFA identifier )
AT 6DFD
( Header: flags, saved name and link )
BYTES 84000000D4EF6D
DOCOL
LIT8 1E t./MOD t.2 w54F2 t.2+ w3F74 t.2+ w3F74 t.2+ w45A1 t.;S
AT 6E1D

( w6E23 | NFA 6E1D CFA 6E23 )
( Unknown erased name; CFA identifier )
AT 6E1D
( Header: flags, saved name and link )
BYTES 830000D8FD6D
DOCOL
w466E w610E w6E04 t.;S
AT 6E2D

( w6E34 | NFA 6E2D CFA 6E34 )
( Unknown erased name; CFA identifier )
AT 6E2D
( Header: flags, saved name and link )
BYTES 84000000CD1D6E
DOCOL
w485C w466E t.0 w482A LIT8 04 t.+ w45A1 t.;S
AT 6E47

( w6E4C | NFA 6E47 CFA 6E4C )
( Unknown erased name; CFA identifier )
AT 6E47
( Header: flags, saved name and link )
BYTES 8200B02D6E
DOCOL
t.;S
AT 6E50

( w6E55 | NFA 6E50 CFA 6E55 )
( Unknown erased name; CFA identifier )
AT 6E50
( Header: flags, saved name and link )
BYTES 8200B1476E
DOCOL
LIT8 09 w5F9C w5BD4 t.;S
AT 6E60

( w6E65 | NFA 6E60 CFA 6E65 )
( Unknown erased name; CFA identifier )
AT 6E60
( Header: flags, saved name and link )
BYTES 8200B2506E
DOCOL
t.;S
AT 6E69

( w6E6E | NFA 6E69 CFA 6E6E )
( Unknown erased name; CFA identifier )
AT 6E69
( Header: flags, saved name and link )
BYTES 8200DA606E
DOVAR
BYTES 1F19821C6B1C07196B17
AT 6E7A

( FLASH-BACKGROUND | NFA 6E7A CFA 6E80 )
( Inferred descriptive name, not recovered original: Saves )
( COLOR4 $02C8, writes color $0E for three frames, then )
( restores the previous value. )
AT 6E7A
( Header: flags, saved name and link )
BYTES 830000D9696E
DOCOL
LIT16 02C8 t.DUP t.C@ t.SWAP LIT8 0E t.OVER t.C! t.3
t.WAIT-FRAMES t.C! t.;S
AT 6E9B

( w6EA0 | NFA 6E9B CFA 6EA0 )
( Unknown erased name; CFA identifier )
AT 6E9B
( Header: flags, saved name and link )
BYTES 8200D47A6E
DOCOL
t.0 LIT16 0004 t.0 t.(DO)
( label 6EAC )
LIT8 CA t.I t.+ LIT8 19 t.I t.+ t.1 w611D
t.0BRANCH CELL 0006 ( -> 6EC6 )
t.DROP t.1+
( label 6EC6 )
t.(LOOP) CELL FFE4 ( -> 6EAC )
t.;S
AT 6ECC

( w6ED1 | NFA 6ECC CFA 6ED1 )
( Unknown erased name; CFA identifier )
AT 6ECC
( Header: flags, saved name and link )
BYTES 8200D79B6E
DOCOL
LIT8 0D w5802 t.;S
AT 6EDA

( w6EE0 | NFA 6EDA CFA 6EE0 )
( Unknown erased name; CFA identifier )
AT 6EDA
( Header: flags, saved name and link )
BYTES 830000DACC6E
DOCOL
LIT8 18 w550D t.@ LIT8 1D t.<=< w6ED1 t.@ t.0=_12DE t.*
t.0BRANCH CELL 0089 ( -> 6F81 )
w6EA0 LIT8 04 t.=
t.0BRANCH CELL 007E ( -> 6F81 )
LIT8 0A t.0 t.(DO)
( label 6F0C )
w6E6E t.I t.+ t.DUP t.C@ t.SWAP t.1+ t.C@ t.0 w67CE t.DROP t.2
t.(+LOOP) CELL FFE6 ( -> 6F0C )
LIT8 0B w5F9C LIT8 08 w6A4E LIT8 10 w6A4E t.FLASH-BACKGROUND
w5BD4 LIT8 31 w6E34 w550D t.@ LIT8 1C t.=
t.0BRANCH CELL 0010 ( -> 6F5B )
LIT8 82 t.0 w6DA0 LIT8 6B t.0 w6DA0
( label 6F5B )
w550D t.@ LIT8 19 t.=
t.0BRANCH CELL 0010 ( -> 6F76 )
LIT8 1F t.0 w6DA0 LIT8 07 t.0 w6DA0
( label 6F76 )
t.1 w6ED1 t.! LIT8 05 w5F9C
( label 6F81 )
t.;S
AT 6F83

( w6F89 | NFA 6F83 CFA 6F89 )
( Unknown erased name; CFA identifier )
AT 6F83
( Header: flags, saved name and link )
BYTES 830000CDDA6E
DOCOL
LIT8 64 t./MOD t.2 t.* t.;S
AT 6F96

( w6F9B | NFA 6F96 CFA 6F9B )
( Unknown erased name; CFA identifier )
AT 6F96
( Header: flags, saved name and link )
BYTES 8200D3836F
DOVAR
CELL 0000
AT 6F9F

( w6FA5 | NFA 6F9F CFA 6FA5 )
( Unknown erased name; CFA identifier )
AT 6F9F
( Header: flags, saved name and link )
BYTES 830000B1966F
DOVAR
CELL 0000
AT 6FA9

( w6FAF | NFA 6FA9 CFA 6FAF )
( Unknown erased name; CFA identifier )
AT 6FA9
( Header: flags, saved name and link )
BYTES 830000B29F6F
DOVAR
CELL 0000
AT 6FB3

( w6FB8 | NFA 6FB3 CFA 6FB8 )
( Unknown erased name; CFA identifier )
AT 6FB3
( Header: flags, saved name and link )
BYTES 8200B1A96F
DOCOL
LIT8 09 t.0 t.(DO)
( label 6FC1 )
t.1 t.WAIT-FRAMES t.0 t.JOYSTICK-TRIGGER t.0=_12DE
t.0BRANCH CELL 000C ( -> 6FD9 )
t.1 w6F9B t.! w466E t.LEAVE
( label 6FD9 )
t.(LOOP) CELL FFE6 ( -> 6FC1 )
t.;S
AT 6FDF

( w6FE5 | NFA 6FDF CFA 6FE5 )
( Unknown erased name; CFA identifier )
AT 6FDF
( Header: flags, saved name and link )
BYTES 830000D7B36F
DOCOL
w6F89 w6FAF t.1+ t.C! w6FAF t.C! w6F89 w6FA5 t.1+ t.C! w6FA5
t.C! t.0 w6F9B t.! w5D09
( label 7007 )
LIT8 07 w5F9C w6FAF t.C@ w485C w6FAF t.1+ t.C@ w4D31 w6FB8
w6FA5 t.C@ w485C w6FA5 t.1+ t.C@ w4D31 w6FB8 w6F9B t.@
t.0BRANCH CELL FFD5 ( -> 7007 )
w5D09 t.;S
AT 7038

( w703E | NFA 7038 CFA 703E )
( Unknown erased name; CFA identifier )
AT 7038
( Header: flags, saved name and link )
BYTES 830000CFDF6F
DOCOL
t.C@ LIT8 D3 t.SWAP LIT8 D8 t.<=< t.;S
AT 704E

( w7054 | NFA 704E CFA 7054 )
( Unknown erased name; CFA identifier )
AT 704E
( Header: flags, saved name and link )
BYTES 830000C73870
DOCOL
t.0 LIT8 03 t.0 t.(DO)
( label 705F )
LIT8 17 t.1 w59DC t.3 t.+ t.I t.+ w703E t.+
t.(LOOP) CELL FFEB ( -> 705F )
t.1 t.= t.;S
AT 707C

( w7082 | NFA 707C CFA 7082 )
( Unknown erased name; CFA identifier )
AT 707C
( Header: flags, saved name and link )
BYTES 830000C34E70
DOCOL
t.0 LIT8 05 t.2 t.(DO)
( label 708D )
LIT8 17 t.I w59DC LIT8 03 t.+ w703E t.+
t.(LOOP) CELL FFEE ( -> 708D )
LIT8 03 t.= t.;S
AT 70A8

( w70AF | NFA 70A8 CFA 70AF )
( Unknown erased name; CFA identifier )
AT 70A8
( Header: flags, saved name and link )
BYTES 84000000C37C70
DOCOL
w550D t.@ LIT8 17 t.=
t.0BRANCH CELL 006B ( -> 7127 )
w7054 w7082 t.*
t.0BRANCH CELL 0061 ( -> 7127 )
w5BD4 LIT8 0C LIT16 02C8 t.C! LIT8 87 t.0 w6DA0 t.0 LIT16 02C8
t.C! LIT8 05 w5F9C LIT8 32 t.WAIT-FRAMES LIT8 2E w6E04 LIT8 87
LIT8 24 w6FE5 LIT8 0E w5F9C LIT8 3D w6E04 t.1
t.SELECT-AUDIO-SEQUENCE
( label 7107 )
LIT8 2C w485C t.0 w4D31 LIT8 1C t.WAIT-FRAMES LIT8 2D w485C
t.0 w4D31 LIT8 18 t.WAIT-FRAMES
t.BRANCH CELL FFE2 ( -> 7107 )
( label 7127 )
t.;S
AT 7129

( w7130 | NFA 7129 CFA 7130 )
( Unknown erased name; CFA identifier )
AT 7129
( Header: flags, saved name and link )
BYTES 84000000D8A870
DOCOL
LIT8 CA t.- w55B4 t.;S
AT 713B

( w7140 | NFA 713B CFA 7140 )
( Unknown erased name; CFA identifier )
AT 713B
( Header: flags, saved name and link )
BYTES 8200B32971
DOCOL
w6DF4 t.2+ w45A1 w699C t.-DUP
t.0BRANCH CELL 003E ( -> 718C )
t.>R LIT8 C9 w466E w6934 t.R w7130 t.1+ t.C! t.R w7130 t.C!
t.R w68C3 t.1 w6833 t.R w6808 w5BC1 LIT8 0C w5F9C t.R> LIT8 DA
t.=
t.0BRANCH CELL 0009 ( -> 718C )
t.0 LIT8 09 w6D40
( label 718C )
w6EE0 w70AF t.;S
AT 7192

( w7197 | NFA 7192 CFA 7197 )
( Unknown erased name; CFA identifier )
AT 7192
( Header: flags, saved name and link )
BYTES 8200B43B71
DOCOL
w6535 t.@ t.DUP w6863
t.0BRANCH CELL 0027 ( -> 71CA )
t.DUP LIT8 DA t.=
t.0BRANCH CELL 0009 ( -> 71B7 )
t.1 LIT8 09 w6D40
( label 71B7 )
w6833 t.1 w6808 w5BC1 LIT8 11 w5F9C t.1
t.BRANCH CELL 0008 ( -> 71D0 )
( label 71CA )
w610E t.DROP t.0
( label 71D0 )
t.;S
AT 71D2

( w71D7 | NFA 71D2 CFA 71D7 )
( Unknown erased name; CFA identifier )
AT 71D2
( Header: flags, saved name and link )
BYTES 8200B49271
DOCOL
w7197 t.DROP t.;S
AT 71DF

( w71E4 | NFA 71DF CFA 71E4 )
( Unknown erased name; CFA identifier )
AT 71DF
( Header: flags, saved name and link )
BYTES 8200B5D271
DOCOL
w67B0 w5BB0 LIT8 09 w5F9C t.;S
AT 71F1

( w71F6 | NFA 71F1 CFA 71F6 )
( Unknown erased name; CFA identifier )
AT 71F1
( Header: flags, saved name and link )
BYTES 8200B6DF71
DOCOL
LIT8 16 w5F9C w68D2 w6E04 t.;S
AT 7203

( w7208 | NFA 7203 CFA 7208 )
( Unknown erased name; CFA identifier )
AT 7203
( Header: flags, saved name and link )
BYTES 8200B7F171
DOCOL
w466E t.1 w5C7C t.! t.2 w5631 t.! LIT16 0004 w5C88 t.0
t.SELECT-AUDIO-SEQUENCE t.1 w6C52 t.;S
AT 7228

( w722D | NFA 7228 CFA 722D )
( Unknown erased name; CFA identifier )
AT 7228
( Header: flags, saved name and link )
BYTES 8200A30372
DOVAR
BYTES 1C00011A1D221D1F2D3417212C1B3D17252F2A2F2417292C33212328
BYTES 1B6C
AT 724D

( w7253 | NFA 724D CFA 7253 )
( Unknown erased name; CFA identifier )
AT 724D
( Header: flags, saved name and link )
BYTES 830000AB2872
DOCOL
w722D LIT8 04 t.+ t.DUP LIT8 19 t.+ t.SWAP t.(DO)
( label 7267 )
LIT8 26 t.I w4C79
t.(LOOP) CELL FFF7 ( -> 7267 )
t.;S
AT 7274

( w7279 | NFA 7274 CFA 7279 )
( Unknown erased name; CFA identifier )
AT 7274
( Header: flags, saved name and link )
BYTES 8200C14D72
DOCOL
t.FIRST LIT16 01F5 LIT16 0196 t.+ t.;S
AT 7289

( w728E | NFA 7289 CFA 728E )
( Unknown erased name; CFA identifier )
AT 7289
( Header: flags, saved name and link )
BYTES 8200D37472
DOVAR
CELL 0000
AT 7292

( w7298 | NFA 7292 CFA 7298 )
( Unknown erased name; CFA identifier )
AT 7292
( Header: flags, saved name and link )
BYTES 830000C38972
DOCOL
w7279 t.1 t.1 t.-DISK t.0=_12DE t.0=_12DE w7279 t.1+ t.1 t.1
t.-DISK t.0=_12DE t.+ t.2 t.= t.0=_12DE w728E t.@ LIT8 21 t.=
t.0=_12DE t.* t.;S
AT 72C9

( w72D0 | NFA 72C9 CFA 72D0 )
( Unknown erased name; CFA identifier )
AT 72C9
( Header: flags, saved name and link )
BYTES 84000000D09272
DOCOL
w5876 t.2+ w5500 t.- t.;S
AT 72DC

( w72E2 | NFA 72DC CFA 72E2 )
( Unknown erased name; CFA identifier )
AT 72DC
( Header: flags, saved name and link )
BYTES 830000CBC972
DOCOL
w72D0 LIT16 0080 t./ t.1+ t.;S
AT 72F0

( w72F7 | NFA 72F0 CFA 72F7 )
( Unknown erased name; CFA identifier )
AT 72F0
( Header: flags, saved name and link )
BYTES 84000000D0DC72
DOCOL
t.1 w463A t.! t.1 w3FC5 t.! t.0 LIT8 14 LIT8 08 w46BE t.DROP
t.2DROP t.0 w3FC5 t.! t.;S
AT 731B

( w7320 | NFA 731B CFA 7320 )
( Unknown erased name; CFA identifier )
AT 731B
( Header: flags, saved name and link )
BYTES 8200D5F072
DOCOL
w5EEA t.C@ t.0=_12DE
t.0BRANCH CELL 0006 ( -> 7330 )
t.0 t.SELECT-AUDIO-SEQUENCE
( label 7330 )
t.;S
AT 7332

( w7338 | NFA 7332 CFA 7338 )
( Unknown erased name; CFA identifier )
AT 7332
( Header: flags, saved name and link )
BYTES 830000D41B73
DOCOL
LIT8 06 t.=
t.0BRANCH CELL 0018 ( -> 7359 )
w7298
t.0BRANCH CELL 0012 ( -> 7359 )
w466E w610E w7253 w722D t.2+ w45A1
( label 7355 )
t.BRANCH CELL FFFE ( -> 7355 )
( label 7359 )
t.;S
AT 735B

( w7360 | NFA 735B CFA 7360 )
( Unknown erased name; CFA identifier )
AT 735B
( Header: flags, saved name and link )
BYTES 8200B83273
DOCOL
w466E t.STOP-AUDIO w72F7 t.LAST-DISK-STATUS t.@ t.0=_12DE
t.0BRANCH CELL 004F ( -> 73BF )
w5500 t.0 w72D0 w3DAC t.1 w5C7C t.! t.0 w5EEA t.! w5631 t.@
t.2+ t.DUP t.>R w5C88 t.R> w7338 w7320 w550D t.@ w6C52 LIT8 11
w5802 t.@ LIT8 0F w5802 t.@ t.0=_12DE t.*
t.0BRANCH CELL 000D ( -> 73BF )
w42E2 w6C14 LIT8 03 t.CMOVE w6D18
( label 73BF )
t.;S
AT 73C1

( w73C6 | NFA 73C1 CFA 73C6 )
( Unknown erased name; CFA identifier )
AT 73C1
( Header: flags, saved name and link )
BYTES 8200B95B73
DOCOL
w466E w5500 w72E2 LIT8 08 t.STOP-AUDIO t.RESTORE-OS-VBI w4728
t.INSTALL-GAME-VBI w7320 t.;S
AT 73DD

( w73E4 | NFA 73DD CFA 73E4 )
( Unknown erased name; CFA identifier )
AT 73DD
( Header: flags, saved name and link )
BYTES 84000000DAC173
DOCOL
w466E t.1 w5C7C t.! LIT8 04 w5631 t.! t.STOP-AUDIO
t.RESTORE-OS-VBI LIT16 0006 w5C88 LIT8 06 w7338
t.INSTALL-GAME-VBI w7320 t.0 w55F8 t.0 w55B4 LIT8 2E t.CMOVE
LIT8 10 w6C52 t.;S
AT 741C

( w7423 | NFA 741C CFA 7423 )
( Unknown erased name; CFA identifier )
AT 741C
( Header: flags, saved name and link )
BYTES 84000000DADD73
DOCOL
LIT8 0E w5F9C t.;S
AT 742C

( w7432 | NFA 742C CFA 7432 )
( Unknown erased name; CFA identifier )
AT 742C
( Header: flags, saved name and link )
BYTES 830000B01C74
DOCOL
t.1 w5F9C w466E w603C t.WAIT-KEY-OR-FIRE w466E t.;S
AT 7442

( w7448 | NFA 7442 CFA 7448 )
( Unknown erased name; CFA identifier )
AT 7442
( Header: flags, saved name and link )
BYTES 830000B12C74
DOCOL
w466E w5BFC LIT8 10 w5F9C t.WAIT-KEY-OR-FIRE w5C3A t.;S
AT 7459

( w745F | NFA 7459 CFA 745F )
( Unknown erased name; CFA identifier )
AT 7459
( Header: flags, saved name and link )
BYTES 830000B54274
DOCOL
w67A3 w6C52 t.;S
AT 7467

( w746D | NFA 7467 CFA 746D )
( Unknown erased name; CFA identifier )
AT 7467
( Header: flags, saved name and link )
BYTES 830000B65974
DOCOL
w67A3 w6833 w68DF w6833 w68EC w6808 w68D2 w68EC w6DA0 w7423
t.;S
AT 7485

( w748B | NFA 7485 CFA 748B )
( Unknown erased name; CFA identifier )
AT 7485
( Header: flags, saved name and link )
BYTES 830000B76774
DOCOL
w68DF w6833 w68EC w6808 w67A3 w6808 w68D2 w68EC w67A3 w6DAF
w7423 t.;S
AT 74A5

( w74AD | NFA 74A5 CFA 74AD )
( Unknown erased name; CFA identifier )
AT 74A5
( Header: flags, saved name and link )
BYTES 8500000000A18574
DOCOL
t.1+ w6294 LIT8 C8 w6288 t.2+ t.@ LIT16 0004 t.- t.2DUP w4C79
t.1+ w4C79 w466E w603C w6288 t.@ t.C@ t.0 t.(DO)
( label 74D8 )
t.2 t.WAIT-FRAMES LIT8 12 w5F9C w6288 t.@ t.1+ t.I t.+ t.C@
w6288 t.2+ t.@ t.I t.+ t.C! w603C
t.(LOOP) CELL FFDB ( -> 74D8 )
t.WAIT-KEY-OR-FIRE w466E LIT8 40 w6A4E t.DROP t.;S
AT 750C

( w7511 | NFA 750C CFA 7511 )
( Unknown erased name; CFA identifier )
AT 750C
( Header: flags, saved name and link )
BYTES 8200C3A574
DOVAR
BYTES 0F00010D55574F4C4E496C45733D4D4F43
AT 7524

( w752B | NFA 7524 CFA 752B )
( Unknown erased name; CFA identifier )
AT 7524
( Header: flags, saved name and link )
BYTES 84000000C30C75
DOCOL
w7511 t.2+ t.2 w5F9C w45A1 t.;S
AT 7539

( w753F | NFA 7539 CFA 753F )
( Unknown erased name; CFA identifier )
AT 7539
( Header: flags, saved name and link )
BYTES 830000B82475
DOCOL
w6535 t.@ w6833 w5BC1 t.1 w6777 w752B t.WAIT-KEY-OR-FIRE t.1
w6777 w74AD t.;S
AT 7559

( w755F | NFA 7559 CFA 755F )
( Unknown erased name; CFA identifier )
AT 7559
( Header: flags, saved name and link )
BYTES 830000B93975
DOCOL
w68D2 w6808 w68D2 t.0 w6DA0 t.1 w6777 w752B t.WAIT-KEY-OR-FIRE
t.1 w6777 w74AD t.;S
AT 757B

( w7580 | NFA 757B CFA 7580 )
( Unknown erased name; CFA identifier )
AT 757B
( Header: flags, saved name and link )
BYTES 8200CE5975
DOVAR
BYTES 1000020754594D3D4E4945064D4F7A45535A20202020
AT 7598

( w759D | NFA 7598 CFA 759D )
( Unknown erased name; CFA identifier )
AT 7598
( Header: flags, saved name and link )
BYTES 8200D97B75
DOVAR
BYTES 07000105435A594D3F20
AT 75A9

( w75AE | NFA 75A9 CFA 75AE )
( Unknown erased name; CFA identifier )
AT 75A9
( Header: flags, saved name and link )
BYTES 8200D29875
DOVAR
CELL 0000
AT 75B2

( w75B8 | NFA 75B2 CFA 75B8 )
( Unknown erased name; CFA identifier )
AT 75B2
( Header: flags, saved name and link )
BYTES 830000DAA975
DOCOL
t.DUP LIT8 C8 t.+ t.>R
t.0BRANCH CELL 0032 ( -> 75F7 )
w466E w759D t.2+ w45A1 w699C t.DUP w75AE t.! t.DUP
t.0BRANCH CELL 0018 ( -> 75F3 )
t.R t.= t.DUP t.0=_12DE
t.0BRANCH CELL 000C ( -> 75F3 )
w466E w610E w7580 t.2+ w45A1
( label 75F3 )
t.BRANCH CELL 0004 ( -> 75F9 )
( label 75F7 )
t.1
( label 75F9 )
t.R> t.DROP t.;S
AT 75FF

( w7605 | NFA 75FF CFA 7605 )
( Unknown erased name; CFA identifier )
AT 75FF
( Header: flags, saved name and link )
BYTES 830000D7B275
DOVAR
CELL 0000
AT 7609

( w760F | NFA 7609 CFA 760F )
( Unknown erased name; CFA identifier )
AT 7609
( Header: flags, saved name and link )
BYTES 830000A1FF75
DOCOL
w7605 t.! t.;S
AT 7617

( w761D | NFA 7617 CFA 761D )
( Unknown erased name; CFA identifier )
AT 7617
( Header: flags, saved name and link )
BYTES 830000D40976
DOCOL
t.0BRANCH CELL 0016 ( -> 7637 )
w466E w68D2 w6808 w68D2 t.2 w6A4E w7605 t.@ w6DA0 w7423
( label 7637 )
t.;S
AT 7639

( w763F | NFA 7639 CFA 763F )
( Unknown erased name; CFA identifier )
AT 7639
( Header: flags, saved name and link )
BYTES 830000B01776
DOCOL
t.0 w760F w67B0 w75B8 w761D t.;S
AT 764D

( w7653 | NFA 764D CFA 7653 )
( Unknown erased name; CFA identifier )
AT 764D
( Header: flags, saved name and link )
BYTES 830000D23976
DOCOL
LIT8 08 w6A4E t.;S
AT 765C

( w7662 | NFA 765C CFA 7662 )
( Unknown erased name; CFA identifier )
AT 765C
( Header: flags, saved name and link )
BYTES 830000B14D76
DOCOL
t.0 w760F w67A3 w61F2 w761D t.;S
AT 7670

( w7677 | NFA 7670 CFA 7677 )
( Unknown erased name; CFA identifier )
AT 7670
( Header: flags, saved name and link )
BYTES 84000000D45C76
DOCOL
t.0BRANCH CELL 0019 ( -> 7694 )
w466E w68D2 w7605 t.@ t.DUP w6808 w6DA0 w68DF w6833 LIT8 04
w6A4E
( label 7694 )
t.;S
AT 7696

( w769C | NFA 7696 CFA 769C )
( Unknown erased name; CFA identifier )
AT 7696
( Header: flags, saved name and link )
BYTES 830000B27076
DOCOL
t.DUP w7677
t.0BRANCH CELL 000C ( -> 76B0 )
t.1 w67BF w6D40 t.2 w5F9C
( label 76B0 )
t.;S
AT 76B2

( w76B8 | NFA 76B2 CFA 76B8 )
( Unknown erased name; CFA identifier )
AT 76B2
( Header: flags, saved name and link )
BYTES 830000B29676
DOCOL
t.0 w760F w67B0 w75B8 w769C t.;S
AT 76C6

( w76CC | NFA 76C6 CFA 76CC )
( Unknown erased name; CFA identifier )
AT 76C6
( Header: flags, saved name and link )
BYTES 830000B3B276
DOCOL
w67B0 w6D31 t.DUP LIT16 0004 t.= w7677 t.DUP LIT8 04 t.=
t.0BRANCH CELL 000A ( -> 76EF )
t.DROP w7423
t.BRANCH CELL 000C ( -> 76F9 )
( label 76EF )
w6796 t.+ t.2+ t.C@ w6E23
( label 76F9 )
t.;S
AT 76FB

( w7701 | NFA 76FB CFA 7701 )
( Unknown erased name; CFA identifier )
AT 76FB
( Header: flags, saved name and link )
BYTES 830000B3C676
DOCOL
t.0 w760F w76CC t.;S
AT 770B

( w7711 | NFA 770B CFA 7711 )
( Unknown erased name; CFA identifier )
AT 770B
( Header: flags, saved name and link )
BYTES 830000B4FB76
DOCOL
w68D2 t.DUP w6808 w68EC w6D31 t.1 w6916 w6D40
t.0BRANCH CELL 000C ( -> 7731 )
t.0 w6DA0 w7423
t.BRANCH CELL 0012 ( -> 7741 )
( label 7731 )
w68FA t.DUP w6808 w6DA0 w6D18 w7423 w6908 w6E04
( label 7741 )
t.;S
AT 7743

( w7749 | NFA 7743 CFA 7749 )
( Unknown erased name; CFA identifier )
AT 7743
( Header: flags, saved name and link )
BYTES 830000B50B77
DOCOL
w746D w6D05 t.0 w68FA w6D40 t.;S
AT 7757

( w775D | NFA 7757 CFA 775D )
( Unknown erased name; CFA identifier )
AT 7757
( Header: flags, saved name and link )
BYTES 830000B64377
DOCOL
w68EC w760F w76CC t.;S
AT 7767

( w776D | NFA 7767 CFA 776D )
( Unknown erased name; CFA identifier )
AT 7767
( Header: flags, saved name and link )
BYTES 830000B75777
DOCOL
LIT8 08 w6789 w75B8
t.0BRANCH CELL 0036 ( -> 77AE )
w68D2 w550D t.@ w68DF t.<=< w68EC w550D t.@ t.= t.+
t.0BRANCH CELL 001A ( -> 77AA )
w6535 t.@ w6833 w5BC1 w7423 w6908 w6E04 w6916 w6924 w6D40
t.BRANCH CELL 0006 ( -> 77AE )
( label 77AA )
w68FA w6E23
( label 77AE )
t.;S
AT 77B0

( w77B6 | NFA 77B0 CFA 77B6 )
( Unknown erased name; CFA identifier )
AT 77B0
( Header: flags, saved name and link )
BYTES 830000B26777
DOCOL
w68EC w6863 t.DUP
t.0BRANCH CELL 0017 ( -> 77D7 )
w68DF w6833 w68D2 t.0 w6DA0 LIT8 20 w6A4E w68FA w6908 w6D40
( label 77D7 )
t.;S
AT 77D9

( w77DF | NFA 77D9 CFA 77DF )
( Unknown erased name; CFA identifier )
AT 77D9
( Header: flags, saved name and link )
BYTES 830000B2B077
DOCOL
w77B6
t.0BRANCH CELL 0007 ( -> 77EC )
LIT8 11 w5F9C
( label 77EC )
t.;S
AT 77EE

( w77F4 | NFA 77EE CFA 77F4 )
( Unknown erased name; CFA identifier )
AT 77EE
( Header: flags, saved name and link )
BYTES 830000B3D977
DOCOL
w77B6
t.0BRANCH CELL 0006 ( -> 7800 )
t.2 w5F9C
( label 7800 )
t.;S
AT 7802

( w7808 | NFA 7802 CFA 7808 )
( Unknown erased name; CFA identifier )
AT 7802
( Header: flags, saved name and link )
BYTES 830000B7EE77
DOCOL
w68D2 w6833 w5BC1 w466E t.1 w5F9C w68DF w6E04 w68EC w68FA
w6D40 t.;S
AT 7822

( w7828 | NFA 7822 CFA 7828 )
( Unknown erased name; CFA identifier )
AT 7822
( Header: flags, saved name and link )
BYTES 830000B80278
DOCOL
w67B0 w760F w67A3 w61F2 w769C t.;S
AT 7836

( w783C | NFA 7836 CFA 783C )
( Unknown erased name; CFA identifier )
AT 7836
( Header: flags, saved name and link )
BYTES 830000B92278
DOCOL
w7197
t.0BRANCH CELL 000E ( -> 7850 )
w68D2 w68DF w6D40 w68EC w68FA w6D40
( label 7850 )
t.;S
AT 7852

( w7858 | NFA 7852 CFA 7858 )
( Unknown erased name; CFA identifier )
AT 7852
( Header: flags, saved name and link )
BYTES 830000B03678
DOCOL
w68D2 w75B8
t.0BRANCH CELL 0035 ( -> 7895 )
w466E w6908 w6D31 w68FA t.<
t.0BRANCH CELL 0020 ( -> 788E )
w68DF w550D t.@ w68EC w67CE t.DROP w68FA w6908 w6D40 w7423
w6916 w6E04 w7653
t.BRANCH CELL 0009 ( -> 7895 )
( label 788E )
LIT8 07 w6789 w6E04
( label 7895 )
t.;S
AT 7897

( w789D | NFA 7897 CFA 789D )
( Unknown erased name; CFA identifier )
AT 7897
( Header: flags, saved name and link )
BYTES 830000B15278
DOCOL
t.0 w760F w67B0 w75B8 t.DUP w761D
t.0BRANCH CELL 0011 ( -> 78BE )
w67B0 LIT8 C8 t.+ w68C3 w68DF w6E04 w7423
( label 78BE )
t.;S
AT 78C0

( w78C6 | NFA 78C0 CFA 78C6 )
( Unknown erased name; CFA identifier )
AT 78C0
( Header: flags, saved name and link )
BYTES 830000B29778
DOCOL
w67B0 w75B8
t.0BRANCH CELL 0010 ( -> 78DE )
w68D2 w6808 w67BF w6808 w466E w5BC1 w7423
( label 78DE )
t.;S
AT 78E0

( w78E6 | NFA 78E0 CFA 78E6 )
( Unknown erased name; CFA identifier )
AT 78E0
( Header: flags, saved name and link )
BYTES 830000CDC078
DOCOL
w6535 t.@ t.DUP w6833 w7130 t.@ w68DF w7130 t.! w68DF w6808
w5BC1 LIT8 05 w5F9C t.;S
AT 7907

( w790D | NFA 7907 CFA 790D )
( Unknown erased name; CFA identifier )
AT 7907
( Header: flags, saved name and link )
BYTES 830000B3E078
DOCOL
w68D2 w61F2
t.0BRANCH CELL 0006 ( -> 791B )
w466E w78E6
( label 791B )
t.;S
AT 791D

( w7923 | NFA 791D CFA 7923 )
( Unknown erased name; CFA identifier )
AT 791D
( Header: flags, saved name and link )
BYTES 830000B50779
DOCOL
w68D2 w75B8
t.0BRANCH CELL 0049 ( -> 7974 )
w6924 w6D31
t.0BRANCH CELL 003D ( -> 7970 )
w466E w78E6 w550D t.@ w68FA t.=
t.0BRANCH CELL 0029 ( -> 796C )
w6908 w6916 w6D40 LIT8 11 w6D31
t.0BRANCH CELL 0018 ( -> 796A )
t.P t.>R w5BD4 LIT8 9E t.0 w6DA0 LIT8 3C w6833 t.R> w5BB0
( label 796A )
w6D05
( label 796C )
t.BRANCH CELL 0006 ( -> 7974 )
( label 7970 )
w68EC w6E23
( label 7974 )
t.;S
AT 7976

( w797C | NFA 7976 CFA 797C )
( Unknown erased name; CFA identifier )
AT 7976
( Header: flags, saved name and link )
BYTES 830000B91D79
DOCOL
w78E6 w68D2 w68EC w6D40 w68FA w6D31
t.0BRANCH CELL 0008 ( -> 7994 )
w6D18 w6908 w6E04
( label 7994 )
t.;S
AT 7996

( w799C | NFA 7996 CFA 799C )
( Unknown erased name; CFA identifier )
AT 7996
( Header: flags, saved name and link )
BYTES 830000B07679
DOCOL
w68D2 w6E23 t.;S
AT 79A4

( w79AA | NFA 79A4 CFA 79AA )
( Unknown erased name; CFA identifier )
AT 79A4
( Header: flags, saved name and link )
BYTES 830000B69679
DOCOL
LIT8 16 w5F9C w67A3 w6E04 t.;S
AT 79B7

( w79BD | NFA 79B7 CFA 79BD )
( Unknown erased name; CFA identifier )
AT 79B7
( Header: flags, saved name and link )
BYTES 830000B7A479
DOCOL
w6D31 t.DUP t.0=_12DE
t.0BRANCH CELL 0008 ( -> 79CF )
w610E
t.BRANCH CELL 0007 ( -> 79D4 )
( label 79CF )
LIT8 16 w5F9C
( label 79D4 )
t.;S
AT 79D6

( w79DC | NFA 79D6 CFA 79DC )
( Unknown erased name; CFA identifier )
AT 79D6
( Header: flags, saved name and link )
BYTES 830000B7B779
DOCOL
w67A3 w79BD w6796 t.+ t.1+ t.C@ w6E04 t.;S
AT 79EE

( w79F4 | NFA 79EE CFA 79F4 )
( Unknown erased name; CFA identifier )
AT 79EE
( Header: flags, saved name and link )
BYTES 830000B8D679
DOCOL
w68D2 w79BD t.2 t.+ w6789 w6E04 t.;S
AT 7A04

( w7A0A | NFA 7A04 CFA 7A0A )
( Unknown erased name; CFA identifier )
AT 7A04
( Header: flags, saved name and link )
BYTES 830000B9EE79
DOCOL
w68D2 w61F2
t.0BRANCH CELL 0008 ( -> 7A1A )
w67A3 w6C52 w7653
( label 7A1A )
t.;S
AT 7A1C

( w7A22 | NFA 7A1C CFA 7A22 )
( Unknown erased name; CFA identifier )
AT 7A1C
( Header: flags, saved name and link )
BYTES 830000CF047A
DOCOL
w466E w68EC w6D31 t.0=_12DE
t.0BRANCH CELL 0006 ( -> 7A34 )
t.DROP w68FA
( label 7A34 )
w6E04 w6908 w6916 w6FE5 t.;S
AT 7A3E

( w7A44 | NFA 7A3E CFA 7A44 )
( Unknown erased name; CFA identifier )
AT 7A3E
( Header: flags, saved name and link )
BYTES 830000B01C7A
DOCOL
w68D2 w6D31 t.1 t.>
t.0BRANCH CELL 000A ( -> 7A5A )
w67A3 w6C52
t.BRANCH CELL 0006 ( -> 7A5E )
( label 7A5A )
w68DF w7A22
( label 7A5E )
t.;S
AT 7A60

( w7A66 | NFA 7A60 CFA 7A66 )
( Unknown erased name; CFA identifier )
AT 7A60
( Header: flags, saved name and link )
BYTES 830000B43E7A
DOCOL
w68D2 w6D31
t.0BRANCH CELL 0008 ( -> 7A76 )
w6924
t.BRANCH CELL 0004 ( -> 7A78 )
( label 7A76 )
w68DF
( label 7A78 )
w7A22 t.;S
AT 7A7C

( w7A82 | NFA 7A7C CFA 7A82 )
( Unknown erased name; CFA identifier )
AT 7A7C
( Header: flags, saved name and link )
BYTES 830000B4607A
DOCOL
w68D2 w6D31
t.0BRANCH CELL 0029 ( -> 7AB3 )
LIT16 0008 w6789 w6863
t.0BRANCH CELL 0017 ( -> 7AAD )
w7653 w6924 t.DUP w6808 t.0 w6DA0 LIT8 11 w5F9C
t.BRANCH CELL 0004 ( -> 7AAF )
( label 7AAD )
w610E
( label 7AAF )
t.BRANCH CELL 0006 ( -> 7AB7 )
( label 7AB3 )
w68DF w7A22
( label 7AB7 )
t.;S
AT 7AB9

( w7ABF | NFA 7AB9 CFA 7ABF )
( Unknown erased name; CFA identifier )
AT 7AB9
( Header: flags, saved name and link )
BYTES 830000DA7C7A
DOCOL
w67B0 LIT8 C8 t.+ w75AE t.@ t.=
t.0BRANCH CELL 0006 ( -> 7AD6 )
w68DF w7A22
( label 7AD6 )
t.;S
AT 7AD8

( w7ADE | NFA 7AD8 CFA 7ADE )
( Unknown erased name; CFA identifier )
AT 7AD8
( Header: flags, saved name and link )
BYTES 830000B1B97A
DOCOL
w67A3 w75B8
t.0BRANCH CELL 0030 ( -> 7B16 )
w466E w67A3 LIT8 C8 t.+ w68C3 w67BF LIT8 C8 t.+ w6863 t.DROP
LIT8 10 w6A4E w68D2 w6808 w68D2 t.0 w6DA0 LIT8 11 w5F9C
t.BRANCH CELL 0004 ( -> 7B18 )
( label 7B16 )
w7ABF
( label 7B18 )
t.;S
AT 7B1A

( w7B20 | NFA 7B1A CFA 7B20 )
( Unknown erased name; CFA identifier )
AT 7B1A
( Header: flags, saved name and link )
BYTES 830000B5D87A
DOCOL
w67A3 w75B8
t.0BRANCH CELL 0019 ( -> 7B41 )
w6924 w7A22 w68D2 w67BF w6D40 w67A3 LIT8 C8 t.+ w68C3
t.BRANCH CELL 0004 ( -> 7B43 )
( label 7B41 )
w7ABF
( label 7B43 )
t.;S
AT 7B45

( w7B4B | NFA 7B45 CFA 7B4B )
( Unknown erased name; CFA identifier )
AT 7B45
( Header: flags, saved name and link )
BYTES 830000B61A7B
DOCOL
w68D2 w75B8
t.0BRANCH CELL 0013 ( -> 7B66 )
w68EC w68FA w6D40 LIT8 0C w5F9C w466E w68DF w6E04
( label 7B66 )
t.;S
AT 7B68

( w7B6E | NFA 7B68 CFA 7B6E )
( Unknown erased name; CFA identifier )
AT 7B68
( Header: flags, saved name and link )
BYTES 830000D0457B
DOCOL
t.0 t.0 t.1 w59DC t.3 t.+ t.DUP LIT8 05 t.+ t.SWAP t.(DO)
( label 7B87 )
t.I t.C@ t.+
t.(LOOP) CELL FFF8 ( -> 7B87 )
t.;S
AT 7B93

( w7B98 | NFA 7B93 CFA 7B98 )
( Unknown erased name; CFA identifier )
AT 7B93
( Header: flags, saved name and link )
BYTES 8200D0687B
DOCOL
w7B6E LIT8 FF t.< t.;S
AT 7BA3

( w7BA8 | NFA 7BA3 CFA 7BA8 )
( Unknown erased name; CFA identifier )
AT 7BA3
( Header: flags, saved name and link )
BYTES 8200CD937B
DOVAR
BYTES 0C00010A4A557A3D557A596C4573
AT 7BB8

( w7BBE | NFA 7BB8 CFA 7BBE )
( Unknown erased name; CFA identifier )
AT 7BB8
( Header: flags, saved name and link )
BYTES 830000B2A37B
DOCOL
w67B0 w6D31
t.0BRANCH CELL 0008 ( -> 7BCE )
w71F6
t.BRANCH CELL 0006 ( -> 7BD2 )
( label 7BCE )
w67BF w6E23
( label 7BD2 )
t.;S
AT 7BD4

( w7BDA | NFA 7BD4 CFA 7BDA )
( Unknown erased name; CFA identifier )
AT 7BD4
( Header: flags, saved name and link )
BYTES 830000B3B87B
DOCOL
w67B0 w6D31 t.DUP t.1 t.=
t.0BRANCH CELL 002A ( -> 7C12 )
t.DROP w466E t.2 w6A4E w68DF w68EC w6DA0 w7423 w68D2 w6E04
w7653 w68DF w6808 w68EC w6808 t.2 w67B0 w6D40
t.BRANCH CELL 0014 ( -> 7C24 )
( label 7C12 )
w610E t.0=_12DE
t.0BRANCH CELL 0008 ( -> 7C20 )
w67BF
t.BRANCH CELL 0004 ( -> 7C22 )
( label 7C20 )
w68FA
( label 7C22 )
w6E04
( label 7C24 )
t.;S
AT 7C26

( w7C2C | NFA 7C26 CFA 7C2C )
( Unknown erased name; CFA identifier )
AT 7C26
( Header: flags, saved name and link )
BYTES 830000B4D47B
DOCOL
w67B0 w6D31 t.0=_12DE
t.0BRANCH CELL 0018 ( -> 7C4E )
w67A3 w61F2
t.0BRANCH CELL 000C ( -> 7C4A )
w68DF w67B0 w6D40 w466E w71F6
( label 7C4A )
t.BRANCH CELL 000C ( -> 7C58 )
( label 7C4E )
w610E w466E w7BA8 t.2+ w45A1
( label 7C58 )
t.;S
AT 7C5A

( w7C60 | NFA 7C5A CFA 7C60 )
( Unknown erased name; CFA identifier )
AT 7C5A
( Header: flags, saved name and link )
BYTES 830000B5267C
DOCOL
w68D2 w6E23 t.;S
AT 7C68

( w7C6E | NFA 7C68 CFA 7C6E )
( Unknown erased name; CFA identifier )
AT 7C68
( Header: flags, saved name and link )
BYTES 830000B75A7C
DOCOL
LIT8 16 w5F9C t.1 w6777 w45A1 t.;S
AT 7C7D

( w7C83 | NFA 7C7D CFA 7C83 )
( Unknown erased name; CFA identifier )
AT 7C7D
( Header: flags, saved name and link )
BYTES 830000B1687C
DODOES
( DOES> thread at 51DC )
BYTES DC51A400A3784000
AT 7C8D

( w7C93 | NFA 7C8D CFA 7C93 )
( Unknown erased name; CFA identifier )
AT 7C8D
( Header: flags, saved name and link )
BYTES 830000CD7D7C
DOCOL
w5846 t.@ LIT8 1E w583D t.@ t.- t.+ LIT8 03 t.MOD t.>R t.R
w7C83 t.C@ t.R> w7C83 t.1+ t.C@ t.;S
AT 7CBB

( w7CC2 | NFA 7CBB CFA 7CC2 )
( Unknown erased name; CFA identifier )
AT 7CBB
( Header: flags, saved name and link )
BYTES 84000000D08D7C
DOCOL
t.DUP w550D t.! w7C93 w6833 w6833 w6C52 w7C93 w6808 w6808 t.;S
AT 7CDA

( w7CDF | NFA 7CDA CFA 7CDF )
( Unknown erased name; CFA identifier )
AT 7CDA
( Header: flags, saved name and link )
BYTES 8200CEBB7C
DOVAR
CELL 0000
AT 7CE3

( w7CEA | NFA 7CE3 CFA 7CEA )
( Unknown erased name; CFA identifier )
AT 7CE3
( Header: flags, saved name and link )
BYTES 84000000D2DA7C
DOCOL
LIT8 05 w5865 t.! t.2 w5865 t.2+ t.! t.0 w5865 LIT8 04 t.+ t.!
LIT8 03 w5865 LIT8 06 t.+ t.! LIT8 0C w584F t.! t.1 w585A t.!
t.0 w583D t.! t.0 w5846 t.! t.0 w7CDF t.! t.;S
AT 7D33

( w7D3B | NFA 7D33 CFA 7D3B )
( Unknown erased name; CFA identifier )
AT 7D33
( Header: flags, saved name and link )
BYTES 8500000000D3E37C
DOCOL
t.0 LIT8 04 t.0 t.(DO)
( label 7D46 )
w5865 t.2 t.I t.* t.+ t.@ t.0=_12DE t.+
t.(LOOP) CELL FFEE ( -> 7D46 )
LIT8 04 t.= t.;S
AT 7D61

( w7D69 | NFA 7D61 CFA 7D69 )
( Unknown erased name; CFA identifier )
AT 7D61
( Header: flags, saved name and link )
BYTES 8500000000C3337D
DOCOL
w7CDF t.@ w585A t.@ t.1 t.= t.*
t.0BRANCH CELL 000B ( -> 7D86 )
LIT8 0F w6C52
t.BRANCH CELL 0058 ( -> 7DDC )
( label 7D86 )
w7D3B
t.0BRANCH CELL 0011 ( -> 7D9B )
t.1 w7CDF t.! LIT8 0E w7CC2
t.BRANCH CELL 0043 ( -> 7DDC )
( label 7D9B )
w5846 t.@ t.-1 t.= w583D t.@ t.0=_12DE t.*
t.0BRANCH CELL 000D ( -> 7DBA )
w7CEA LIT8 0C w6C52
t.BRANCH CELL 0024 ( -> 7DDC )
( label 7DBA )
w5846 t.@ t.0=_12DE w583D t.@ t.0=_12DE t.0=_12DE t.*
t.0BRANCH CELL 000B ( -> 7DD7 )
LIT8 0D w7CC2
t.BRANCH CELL 0007 ( -> 7DDC )
( label 7DD7 )
LIT8 0E w7CC2
( label 7DDC )
w584F t.@ t.0=_12DE
t.0BRANCH CELL 002C ( -> 7E10 )
w610E LIT8 2E w6E04 t.WAIT-KEY-OR-FIRE LIT8 0A w6C52 w610E
LIT8 2C w6E04 w7CEA LIT8 1E LIT8 07 t.0 w681C t.0 LIT8 12
w5802 t.!
( label 7E10 )
t.;S
AT 7E12

( w7E17 | NFA 7E12 CFA 7E17 )
( Unknown erased name; CFA identifier )
AT 7E12
( Header: flags, saved name and link )
BYTES 8200A6617D
DOCOL
t.1 t.- t.2 t.* w5865 t.+ t.;S
AT 7E27

( w7E2F | NFA 7E27 CFA 7E2F )
( Unknown erased name; CFA identifier )
AT 7E27
( Header: flags, saved name and link )
BYTES 8500000000D2127E
DOCOL
t.>R w585A t.@ t.R t.=
t.0BRANCH CELL 0010 ( -> 7E4D )
t.-1 t.R w7E17 t.+! t.DROP
t.BRANCH CELL 0023 ( -> 7E6E )
( label 7E4D )
w585A t.@ t.= t.0=_12DE
t.0BRANCH CELL 000F ( -> 7E66 )
LIT8 64 t.R w7E17 t.!
t.BRANCH CELL 000A ( -> 7E6E )
( label 7E66 )
t.-1 t.R w7E17 t.+!
( label 7E6E )
t.R> w585A t.! t.-1 w584F t.+! t.;S
AT 7E7C

( w7E82 | NFA 7E7C CFA 7E82 )
( Unknown erased name; CFA identifier )
AT 7E7C
( Header: flags, saved name and link )
BYTES 830000B8277E
DOCOL
LIT8 04 t.1 w7E2F t.1 w5846 t.+! w7D69 t.;S
AT 7E95

( w7E9B | NFA 7E95 CFA 7E9B )
( Unknown erased name; CFA identifier )
AT 7E95
( Header: flags, saved name and link )
BYTES 830000B97C7E
DOCOL
t.1 t.2 w7E2F t.1 w583D t.+! w7D69 t.;S
AT 7EAD

( w7EB3 | NFA 7EAD CFA 7EB3 )
( Unknown erased name; CFA identifier )
AT 7EAD
( Header: flags, saved name and link )
BYTES 830000B0957E
DOCOL
LIT8 05 t.3 w7E2F t.-1 w5846 t.+! w7D69 t.;S
AT 7EC6

( w7ECC | NFA 7EC6 CFA 7ECC )
( Unknown erased name; CFA identifier )
AT 7EC6
( Header: flags, saved name and link )
BYTES 830000B1AD7E
DOCOL
LIT8 01 LIT8 04 w7E2F t.-1 w583D t.+! w7D69 t.;S
AT 7EE0

( w7EE6 | NFA 7EE0 CFA 7EE6 )
( Unknown erased name; CFA identifier )
AT 7EE0
( Header: flags, saved name and link )
BYTES 830000B2C67E
DOCOL
w466E w68D2 w6808 t.3 w6A4E t.1 w68EC w6D40 w68D2 t.0 w6DA0
LIT8 05 w5F9C t.;S
AT 7F05

( w7F0B | NFA 7F05 CFA 7F0B )
( Unknown erased name; CFA identifier )
AT 7F05
( Header: flags, saved name and link )
BYTES 830000B2E07E
DOCOL
w68DF w61F2
t.0BRANCH CELL 0016 ( -> 7F29 )
w68EC w6D31 t.0=_12DE
t.0BRANCH CELL 0008 ( -> 7F25 )
w7EE6
t.BRANCH CELL 0006 ( -> 7F29 )
( label 7F25 )
w68FA w6E23
( label 7F29 )
t.;S
AT 7F2B

( w7F31 | NFA 7F2B CFA 7F31 )
( Unknown erased name; CFA identifier )
AT 7F2B
( Header: flags, saved name and link )
BYTES 830000B3057F
DOCOL
w68D2 w6D31
t.0BRANCH CELL 0020 ( -> 7F59 )
w68EC t.0 t.1 w611D
t.0BRANCH CELL 000C ( -> 7F51 )
t.DROP w67A3 w7CC2
t.BRANCH CELL 0006 ( -> 7F55 )
( label 7F51 )
w68DF w6E23
( label 7F55 )
t.BRANCH CELL 0006 ( -> 7F5D )
( label 7F59 )
w68DF w6E23
( label 7F5D )
t.;S
AT 7F5F

( w7F65 | NFA 7F5F CFA 7F65 )
( Unknown erased name; CFA identifier )
AT 7F5F
( Header: flags, saved name and link )
BYTES 830000B12B7F
DOCOL
LIT8 A2 w6833 w763F t.;S
AT 7F70

( w7F76 | NFA 7F70 CFA 7F76 )
( Unknown erased name; CFA identifier )
AT 7F70
( Header: flags, saved name and link )
BYTES 830000DA5F7F
DOCOL
t.0 t.1 w59DC LIT8 03 t.+ LIT8 05 t.ERASE t.;S
AT 7F8A

( w7F90 | NFA 7F8A CFA 7F90 )
( Unknown erased name; CFA identifier )
AT 7F8A
( Header: flags, saved name and link )
BYTES 830000B5707F
DOCOL
w4AA7 w73E4 w7F76 t.0 w6E23 t.;S
AT 7F9E

( w7FA4 | NFA 7F9E CFA 7FA4 )
( Unknown erased name; CFA identifier )
AT 7F9E
( Header: flags, saved name and link )
BYTES 830000CF8A7F
DOVAR
CELL 0000
AT 7FA8

( w7FAE | NFA 7FA8 CFA 7FAE )
( Unknown erased name; CFA identifier )
AT 7FA8
( Header: flags, saved name and link )
BYTES 830000DA9E7F
DOCOL
t.0 LIT8 04 t.1 t.(DO)
( label 7FB9 )
t.OVER w7FA4 t.@ t.I w611D
t.0BRANCH CELL 0006 ( -> 7FCB )
t.SWAP t.DROP
( label 7FCB )
t.(LOOP) CELL FFEC ( -> 7FB9 )
t.SWAP t.DROP t.;S
AT 7FD5

( w7FDB | NFA 7FD5 CFA 7FDB )
( Unknown erased name; CFA identifier )
AT 7FD5
( Header: flags, saved name and link )
BYTES 830000D9A87F
DOCOL
w7FA4 t.! t.>R t.R w7FAE
t.0BRANCH CELL 0029 ( -> 8012 )
t.R t.1+ w7FAE t.-DUP
t.0BRANCH CELL 001D ( -> 8012 )
t.2 t.SWAP w4C79 t.R LIT8 C9 t.- t.DUP w55B4 t.@ t.SWAP t.2+
w55B4 t.!
( label 8012 )
t.R> t.DROP t.;S
AT 8018

( w801F | NFA 8018 CFA 801F )
( Unknown erased name; CFA identifier )
AT 8018
( Header: flags, saved name and link )
BYTES 84000000DAD57F
DOCOL
w6D31
t.0BRANCH CELL 001E ( -> 8043 )
LIT8 CF LIT8 D0 t.2DUP LIT8 10 w7FDB LIT8 10 w7FDB LIT8 12
w7FDB LIT8 12 w7FDB
( label 8043 )
t.;S
AT 8045

( w804B | NFA 8045 CFA 804B )
( Unknown erased name; CFA identifier )
AT 8045
( Header: flags, saved name and link )
BYTES 830000B91880
DOCOL
w68DF w61F2
t.0BRANCH CELL 000E ( -> 8061 )
w7EE6 w68EC w6E04 w68FA w6908 w6D40
( label 8061 )
t.;S
AT 8063

( w8069 | NFA 8063 CFA 8069 )
( Unknown erased name; CFA identifier )
AT 8063
( Header: flags, saved name and link )
BYTES 830000B64580
DOCOL
w67A3 w6C52 w68D2 w801F t.;S
AT 8075

( w807B | NFA 8075 CFA 807B )
( Unknown erased name; CFA identifier )
AT 8075
( Header: flags, saved name and link )
BYTES 830000B76380
DOCOL
w7B98
t.0BRANCH CELL 0010 ( -> 8091 )
w68DF w801F w67A3 w6C52 w7653
t.BRANCH CELL 0006 ( -> 8095 )
( label 8091 )
w68D2 w6E23
( label 8095 )
t.;S
AT 8097

( w809D | NFA 8097 CFA 809D )
( Unknown erased name; CFA identifier )
AT 8097
( Header: flags, saved name and link )
BYTES 830000D97580
DOVAR
BYTES 0A480A480A48
AT 80A5

( w80AB | NFA 80A5 CFA 80AB )
( Unknown erased name; CFA identifier )
AT 80A5
( Header: flags, saved name and link )
BYTES 830000B19780
DOVAR
BYTES 02006ECF02006ED002006ED1
AT 80B9

( w80BF | NFA 80B9 CFA 80BF )
( Unknown erased name; CFA identifier )
AT 80B9
( Header: flags, saved name and link )
BYTES 830000B2A580
DOVAR
BYTES 020077000200770002007700
AT 80CD

( w80D3 | NFA 80CD CFA 80D3 )
( Unknown erased name; CFA identifier )
AT 80CD
( Header: flags, saved name and link )
BYTES 830000B8B980
DOCOL
w7F76 LIT8 76 LIT8 12 t.0 w681C w80AB LIT8 10 t.1 w59DC
LIT8 0C t.CMOVE w80BF LIT8 12 t.1 w59DC LIT8 0C t.CMOVE w809D
LIT8 05 w55B4 LIT8 06 t.CMOVE t.0 LIT8 13 w6D40 w68D2 t.0
w6DA0 LIT8 05 w5F9C w68DF w6E04 w68EC t.0 w6DA0 w68FA w6833
t.;S
AT 812B

( w8131 | NFA 812B CFA 8131 )
( Unknown erased name; CFA identifier )
AT 812B
( Header: flags, saved name and link )
BYTES 830000B0CD80
DOCOL
w7B6E LIT16 01C2 t.>
t.0BRANCH CELL 0038 ( -> 8175 )
w7653 w7F76 LIT8 72 LIT8 12 t.0 w681C LIT8 0E LIT8 11 t.0
w681C LIT8 33 LIT8 11 t.0 w67CE t.DROP LIT8 09 LIT8 10 t.0
w67CE t.DROP w755F
t.BRANCH CELL 001F ( -> 8192 )
( label 8175 )
w7B6E LIT8 C8 t.<
t.0BRANCH CELL 0008 ( -> 8186 )
w67B0
t.BRANCH CELL 0004 ( -> 8188 )
( label 8186 )
w67BF
( label 8188 )
w6E04 LIT8 17 LIT8 18 w6FE5
( label 8192 )
t.;S
AT 8194

( w819A | NFA 8194 CFA 819A )
( Unknown erased name; CFA identifier )
AT 8194
( Header: flags, saved name and link )
BYTES 830000C12B81
DOCOL
LIT8 14 w6D31 LIT8 15 w6D31 t.+ LIT8 04 t.= t.;S
AT 81AF

( w81B5 | NFA 81AF CFA 81B5 )
( Unknown erased name; CFA identifier )
AT 81AF
( Header: flags, saved name and link )
BYTES 830000B19481
DOCOL
w68D2 w61F2
t.0BRANCH CELL 0037 ( -> 81F4 )
w68DF w6D31
t.0BRANCH CELL 001A ( -> 81DF )
t.2 w68DF w6D40 w466E w68FA w6E04 w6908 w6916 w6FE5 w7653
t.BRANCH CELL 0006 ( -> 81E3 )
( label 81DF )
w68EC w6E23
( label 81E3 )
w819A
t.0BRANCH CELL 000D ( -> 81F4 )
w466E LIT8 05 w5F9C w6924 w6E04
( label 81F4 )
t.;S
AT 81F6

( w81FC | NFA 81F6 CFA 81FC )
( Unknown erased name; CFA identifier )
AT 81F6
( Header: flags, saved name and link )
BYTES 830000B2AF81
DOCOL
w68DF w6D31
t.0BRANCH CELL 000A ( -> 820E )
w68FA w6E23
t.BRANCH CELL 001B ( -> 8227 )
( label 820E )
w68D2 w75B8
t.0BRANCH CELL 0013 ( -> 8227 )
t.1 w68DF w6D40 w466E LIT8 05 w5F9C w68EC w6E04
( label 8227 )
t.;S
AT 8229

( w822F | NFA 8229 CFA 822F )
( Unknown erased name; CFA identifier )
AT 8229
( Header: flags, saved name and link )
BYTES 830000B3F681
DOCOL
w819A
t.0BRANCH CELL 000A ( -> 823F )
w745F w7653
t.BRANCH CELL 0006 ( -> 8243 )
( label 823F )
w68D2 w6E23
( label 8243 )
t.;S
AT 8245

( w824B | NFA 8245 CFA 824B )
( Unknown erased name; CFA identifier )
AT 8245
( Header: flags, saved name and link )
BYTES 830000B42982
DOCOL
w6DF4 t.2+ w45A1 w699C t.-DUP
t.0BRANCH CELL 0027 ( -> 8280 )
w68DF t.=
t.0BRANCH CELL 001B ( -> 827C )
w68DF w68C3 w68D2 w6808 w68D2 t.0 w6DA0 LIT8 0C w5F9C w466E
t.BRANCH CELL 0006 ( -> 8280 )
( label 827C )
w68EC w6E23
( label 8280 )
t.;S
AT 8282

( w8288 | NFA 8282 CFA 8288 )
( Unknown erased name; CFA identifier )
AT 8282
( Header: flags, saved name and link )
BYTES 830000B64582
DOCOL
t.0 w760F w67A3 w75B8 t.DUP
t.0BRANCH CELL 0011 ( -> 82A7 )
w68DF w68EC w6D40 w67A3 LIT8 C8 t.+ w68C3
( label 82A7 )
w761D t.;S
AT 82AB

( w82B1 | NFA 82AB CFA 82B1 )
( Unknown erased name; CFA identifier )
AT 82AB
( Header: flags, saved name and link )
BYTES 830000B78282
DOCOL
w550D t.@ w68D2 t.= t.P w68DF t.= t.*
t.0BRANCH CELL 0020 ( -> 82E5 )
w6535 t.@ w6833 w5BC1 LIT8 04 w6777 w752B t.WAIT-KEY-OR-FIRE
LIT8 04 w6777 w74AD w7653
t.BRANCH CELL 0006 ( -> 82E9 )
( label 82E5 )
w68EC w6E23
( label 82E9 )
t.;S
AT 82EB

( SAVED-DICTIONARY-STATE | NFA 82EB CFA 82F0 )
( Inferred descriptive name, not recovered original: Two )
( cells hold the dictionary end and latest header restored )
( by RESTORE-DICTIONARY-LIMITS. )
AT 82EB
( Header: flags, saved name and link )
BYTES 8200C8AB82
DOVAR
BYTES 0D83F682
AT 82F6

( w82FB | NFA 82F6 CFA 82FB )
( Unknown erased name; CFA identifier )
AT 82F6
( Header: flags, saved name and link )
BYTES 8200C8EB82
DOCOL
t.HERE t.SAVED-DICTIONARY-STATE t.! t.LATEST
t.SAVED-DICTIONARY-STATE t.2+ t.! t.;S
AT 830D

( RESTORE-DICTIONARY-LIMITS | NFA 830D CFA 8312 )
( Inferred descriptive name, not recovered original: )
( Restores DP and cold-start origin fields 28, 30 and 12 )
( from SAVED-DICTIONARY-STATE. )
AT 830D
( Header: flags, saved name and link )
BYTES 8200BEF682
DOCOL
t.SAVED-DICTIONARY-STATE t.@ t.DP t.! t.SAVED-DICTIONARY-STATE
t.@ t.DUP LIT16 001C t.+ORIGIN t.! LIT16 001E t.+ORIGIN t.!
t.SAVED-DICTIONARY-STATE t.2+ t.@ LIT16 000C t.+ORIGIN t.!
t.;S
AT 8342

( w8348 | NFA 8342 CFA 8348 )
( Unknown erased name; CFA identifier )
AT 8342
( Header: flags, saved name and link )
BYTES 830000CC0D83
DOVAR
BYTES 0424648DA2044F
AT 8351

( w8357 | NFA 8351 CFA 8357 )
( Unknown erased name; CFA identifier )
AT 8351
( Header: flags, saved name and link )
BYTES 830000C44283
DOCON
CELL A7E6
AT 835B

( w8362 | NFA 835B CFA 8362 )
( Unknown erased name; CFA identifier )
AT 835B
( Header: flags, saved name and link )
BYTES 84000000D05183
DOCON
CELL A0D5
AT 8366

( w836D | NFA 8366 CFA 836D )
( Unknown erased name; CFA identifier )
AT 8366
( Header: flags, saved name and link )
BYTES 84000000D05B83
DOCON
CELL A28D
AT 8371

( w8378 | NFA 8371 CFA 8378 )
( Unknown erased name; CFA identifier )
AT 8371
( Header: flags, saved name and link )
BYTES 84000000CC6683
DOVAR
CELL 0000
AT 837C

( TITLE-SKIP-FLAG | NFA 837C CFA 8382 )
( Inferred descriptive name, not recovered original: )
( Initially zero; title input sets it on trigger press and )
( title animation loops test it to exit. )
AT 837C
( Header: flags, saved name and link )
BYTES 830000C77183
DOVAR
CELL 0000
AT 8386

( POLL-TITLE-FIRE | NFA 8386 CFA 838C )
( Inferred descriptive name, not recovered original: Clears )
( attract mode at $4D, checks joystick fire, sets the title )
( skip flag, and stops audio. )
AT 8386
( Header: flags, saved name and link )
BYTES 830000C77C83
DOCOL
t.0 LIT8 4D t.C! t.0 t.JOYSTICK-TRIGGER t.0=_12DE
t.TITLE-SKIP-FLAG t.@ t.0=_12DE t.*
t.0BRANCH CELL 000A ( -> 83AF )
t.1 t.TITLE-SKIP-FLAG t.! t.STOP-AUDIO
( label 83AF )
t.;S
AT 83B1

( WAIT-TITLE-FRAMES | NFA 83B1 CFA 83B7 )
( Inferred descriptive name, not recovered original: Waits )
( frame-by-frame while polling title fire and exits early )
( when TITLE-SKIP-FLAG is set. )
AT 83B1
( Header: flags, saved name and link )
BYTES 830000D58683
DOCOL
t.0 t.(DO)
( label 83BD )
t.POLL-TITLE-FIRE t.1 t.WAIT-FRAMES t.TITLE-SKIP-FLAG t.@
t.0BRANCH CELL 0004 ( -> 83CD )
t.LEAVE
( label 83CD )
t.(LOOP) CELL FFEE ( -> 83BD )
t.;S
AT 83D3

( w83DA | NFA 83D3 CFA 83DA )
( Unknown erased name; CFA identifier )
AT 83D3
( Header: flags, saved name and link )
BYTES 84000000D3B183
DOCOL
w8362 w8357 t.! t.;S
AT 83E4

( w83EB | NFA 83E4 CFA 83EB )
( Unknown erased name; CFA identifier )
AT 83E4
( Header: flags, saved name and link )
BYTES 84000000B2D383
DOCOL
w8348 w8357 t.2 t.+ w8378 t.@ t.+ LIT16 0006 t.CMOVE t.;S
AT 8403

( w8409 | NFA 8403 CFA 8409 )
( Unknown erased name; CFA identifier )
AT 8403
( Header: flags, saved name and link )
BYTES 830000D4E483
DOVAR
BYTES 000005414C4C4F5420202020202020
AT 841A

( w8420 | NFA 841A CFA 8420 )
( Unknown erased name; CFA identifier )
AT 841A
( Header: flags, saved name and link )
BYTES 830000CC0384
DOCOL
w8357 t.2+ w8409 LIT8 0D t.CMOVE w8409 w8357 LIT16 0004 t.+
LIT8 0D t.CMOVE w83DA w8362 LIT16 02BC t.ERASE t.;S
AT 8448

( w844F | NFA 8448 CFA 844F )
( Unknown erased name; CFA identifier )
AT 8448
( Header: flags, saved name and link )
BYTES 84000000C21A84
DOCOL
w485C t.0 w4D31 t.;S
AT 8459

( LOAD-TITLE-ASSETS | NFA 8459 CFA 8460 )
( Inferred descriptive name, not recovered original: )
( Performs title disk loading with an error branch, )
( installs picture resources, and selects the title font. )
AT 8459
( Header: flags, saved name and link )
BYTES 84000000D44884
DOCOL
t.0 w5C7C t.! t.1 w3FC5 t.! t.DISPLAY-OFF t.1 w3FD1 t.! t.0
LIT8 A0 t.3 w4228 t.LAST-DISK-STATUS t.@
t.0BRANCH CELL 0012 ( -> 8497 )
t.RESTORE-DISPLAY t.CR
( ATASCII text: ERROR )
t.(.")
BYTES 054552524F52
( label 8493 )
t.BRANCH CELL FFFE ( -> 8493 )
( label 8497 )
w4C38 w5DEB w8420 t.2 w485C t.1 w4D31 LIT8 04 w485C t.1 w4D31
t.3 w844F LIT8 04 w844F LIT8 05 w844F t.0 t.1 t.POS
( ATASCII text:   )
t.(.")
BYTES 0120
LIT16 0008 LIT16 BC00 w4838 LIT16 00BC LIT16 02F4 t.C! w5E2F
w5E3A t.! LIT16 000D w5E3A t.@ LIT8 06 t.- w4838 t.;S
AT 84F1

( w84F6 | NFA 84F1 CFA 84F6 )
( Unknown erased name; CFA identifier )
AT 84F1
( Header: flags, saved name and link )
BYTES 8200D35984
DOCON
CELL D405
AT 84FA

( PRINT-CENTERED-TITLE-TEXT | NFA 84FA CFA 8500 )
( Inferred descriptive name, not recovered original: )
( Centers a counted text object around column 20, sets )
( cursor position, and prints it with STYPE. )
AT 84FA
( Header: flags, saved name and link )
BYTES 830000D4F184
DOCOL
t.DUP t.>R t.@ t.2 t./ LIT16 0014 t.SWAP t.- t.SWAP t.POS t.R>
w3F5F t.STYPE t.;S
AT 8520

( w8526 | NFA 8520 CFA 8526 )
( Unknown erased name; CFA identifier )
AT 8520
( Header: flags, saved name and link )
BYTES 830000BEFA84
DOCOL
LIT16 0008 t.0 t.(DO)
( label 8530 )
t.I w84F6 t.C! t.1 t.WAIT-TITLE-FRAMES t.2
t.(+LOOP) CELL FFF2 ( -> 8530 )
t.;S
AT 8542

( w8548 | NFA 8542 CFA 8548 )
( Unknown erased name; CFA identifier )
AT 8542
( Header: flags, saved name and link )
BYTES 830000BC2085
DOCOL
LIT16 FFFE LIT16 0006 t.(DO)
( label 8554 )
t.I w84F6 t.C! t.1 t.WAIT-TITLE-FRAMES LIT16 FFFE
t.(+LOOP) CELL FFF0 ( -> 8554 )
t.;S
AT 8568

( w856F | NFA 8568 CFA 856F )
( Unknown erased name; CFA identifier )
AT 8568
( Header: flags, saved name and link )
BYTES 84000000B04285
DOCOL
w8348 t.1+ w8357 t.2+ LIT8 05 t.CMOVE t.0 w84F6 t.C! t.;S
AT 8586

( TITLE-ROW-OFFSET | NFA 8586 CFA 858C )
( Inferred descriptive name, not recovered original: Row )
( offset added while laying out title text lines; )
( initialized and adjusted by title page animation. )
AT 8586
( Header: flags, saved name and link )
BYTES 830000AB6885
DOVAR
CELL 0000
AT 8590

( TITLE-PAGE-LINE-COUNT | NFA 8590 CFA 8596 )
( Inferred descriptive name, not recovered original: )
( Receives the current title page text count and controls )
( the forward and reverse line-animation loops. )
AT 8590
( Header: flags, saved name and link )
BYTES 830000CC8685
DOVAR
CELL 0000
AT 859A

( w85A0 | NFA 859A CFA 85A0 )
( Unknown erased name; CFA identifier )
AT 859A
( Header: flags, saved name and link )
BYTES 830000C79085
DOCOL
t.0 w482A t.2+ t.C@ t.0 t.(DO)
( label 85AE )
t.I t.TITLE-ROW-OFFSET t.@ t.+ t.I t.1+ w482A
t.PRINT-CENTERED-TITLE-TEXT
t.(LOOP) CELL FFEE ( -> 85AE )
t.;S
AT 85C4

( w85CA | NFA 85C4 CFA 85CA )
( Unknown erased name; CFA identifier )
AT 85C4
( Header: flags, saved name and link )
BYTES 830000D89A85
DOCOL
LIT16 0009 w47F9 t.@ w4849 w85A0 t.;S
AT 85DA

( w85E1 | NFA 85DA CFA 85E1 )
( Unknown erased name; CFA identifier )
AT 85DA
( Header: flags, saved name and link )
BYTES 84000000D5C485
DOCOL
t.0 t.(DO)
( label 85E7 )
LIT8 06 w844F LIT8 07 t.WAIT-TITLE-FRAMES LIT8 05 w844F
LIT8 0C t.WAIT-TITLE-FRAMES t.TITLE-SKIP-FLAG t.@
t.0BRANCH CELL 0004 ( -> 8605 )
t.LEAVE
( label 8605 )
t.(LOOP) CELL FFE0 ( -> 85E7 )
t.;S
AT 860B

( SETUP-TITLE-TEXT | NFA 860B CFA 8612 )
( Inferred descriptive name, not recovered original: Sets )
( SAVMSC relative to title-text storage, resets the title )
( row offset, and prints cursor controls. )
AT 860B
( Header: flags, saved name and link )
BYTES 84000000CCDA85
DOCOL
w836D LIT16 0050 t.- LIT16 0058 t.! t.0 t.TITLE-ROW-OFFSET t.!
LIT16 0007 w85CA
( ATASCII text: .. )
t.(.")
BYTES 021E1E
t.;S
AT 8635

( w863B | NFA 8635 CFA 863B )
( Unknown erased name; CFA identifier )
AT 8635
( Header: flags, saved name and link )
BYTES 830000D80B86
DOCOL
t.2 t.TITLE-ROW-OFFSET t.! t.0 w85CA t.0 t.TITLE-ROW-OFFSET
t.! LIT8 08 w85CA w856F t.SETUP-TITLE-TEXT t.;S
AT 8658

( w865E | NFA 8658 CFA 865E )
( Unknown erased name; CFA identifier )
AT 8658
( Header: flags, saved name and link )
BYTES 830000D83586
DOCOL
t.>R t.R w8362 LIT16 0078 t.+ LIT16 0118 t.ERASE w856F w8362
LIT16 0058 t.! t.2 t.TITLE-ROW-OFFSET t.! w85CA t.0 w482A t.2+
t.C@ t.TITLE-PAGE-LINE-COUNT t.! t.TITLE-PAGE-LINE-COUNT t.@
t.TITLE-ROW-OFFSET t.+! LIT8 07 w85CA t.TITLE-PAGE-LINE-COUNT
t.@ t.1+ t.0 t.2 w844F t.(DO)
( label 86AB )
t.I w8378 t.! w83EB w8548
t.(LOOP) CELL FFF4 ( -> 86AB )
LIT8 04 w844F LIT8 04 t.R> t.0=_12DE LIT8 05 t.* t.+ w85E1
t.-1 t.TITLE-PAGE-LINE-COUNT t.@ t.(DO)
( label 86D6 )
t.I w8378 t.! w83EB w8526 t.-1
t.(+LOOP) CELL FFF2 ( -> 86D6 )
t.;S
AT 86E8

( RUN-TITLE-PAGES | NFA 86E8 CFA 86EE )
( Inferred descriptive name, not recovered original: Cycles )
( seven animated title text pages until TITLE-SKIP-FLAG is )
( set. )
AT 86E8
( Header: flags, saved name and link )
BYTES 830000D85886
DOCOL
t.SETUP-TITLE-TEXT
( label 86F2 )
LIT8 07 t.0 t.(DO)
( label 86F9 )
t.I w865E t.TITLE-SKIP-FLAG t.@
t.0BRANCH CELL 0004 ( -> 8707 )
t.LEAVE
( label 8707 )
t.(LOOP) CELL FFF0 ( -> 86F9 )
t.TITLE-SKIP-FLAG t.@
t.0BRANCH CELL FFE1 ( -> 86F2 )
t.;S
AT 8715

( BOOT-TITLE-AND-GAME | NFA 8715 CFA 871D )
( Inferred descriptive name, not recovered original: Boot )
( entry loads title resources, runs title pages, restores )
( dictionary limits and enters GAME-MAIN-LOOP. )
AT 8715
( Header: flags, saved name and link )
BYTES 8500000000CCE886
DOCOL
t.1 LIT16 0244 t.C! t.LOAD-TITLE-ASSETS t.CR w8362 LIT16 0058
t.! w863B t.RESTORE-DISPLAY t.INITIALIZE-AUDIO t.0
t.SELECT-AUDIO-SEQUENCE t.INSTALL-GAME-VBI t.RUN-TITLE-PAGES
t.SAVED-DICTIONARY-STATE t.@ t.DP t.!
t.RESTORE-DICTIONARY-LIMITS t.STOP-AUDIO LIT8 03 t.WAIT-FRAMES
t.RESTORE-OS-VBI t.GAME-MAIN-LOOP t.;S
AT 8758
( Final saved boot-sector padding: retired N>N / SAVE-RUN )
BYTES 834E3ECE1587411466173417E413771288534156452D5255CE588741
BYTES 14A5242D0F1F87D5146216A5
AT 8780
