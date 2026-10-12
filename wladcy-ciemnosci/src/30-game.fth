( Wladcy Ciemnosci v1 30-game.fth: target 6010..8757 )
( Hexadecimal. BYTES emits bytes; CELL emits 16-bit cells. )
( LIT8/LIT16 compile literals; branches retain signed )
( offsets. )
( 6502 mnemonics use 06-assembler.fth; operands follow )
( words. )

( POWER-LIST-SEPARATOR | NFA 6010 CFA 6015 )
( Inferred descriptive name, not recovered original: Prints )
( a 26-byte decorative divider with [S"]; $603C places the )
( same divider above and below the eight power names. )
( Stack: -- )
AT 6010
( Header: flags, saved name and link )
BYTES 8200A3CB5F
DOCOL
( Game text: [81] [76][76][76][76][76][76][76][76][76] )
( [62][ED] [76][76][76][76][76][76][76][76][76] [84] )
t.(S")
BYTES 1A813D7676767676767676763D62ED3D7676767676767676763D84
t.;S
AT 6036

( SHOW-POWER-LIST | NFA 6036 CFA 603C )
( Inferred descriptive name, not recovered original: Prints )
( SPIS MOCY [list of powers], then four rows containing the )
( eight $5517 records in two columns. Each name occupies 13 )
( bytes at record+5. )
( Stack: -- )
AT 6036
( Header: flags, saved name and link )
BYTES 830000D31060
DOCOL
LIT8 07 t.1 t.POS
( Game text: )
( [91][97][97][97][97][97][97][97][97][97][97][97][85][91][9 )
( 7][97][97][97][97][97][97][97][97][97][97][85] )
t.(S")
BYTES 1A9197979797979797979797978591979797979797979797979785
LIT8 07 t.2 t.POS
( Game text: [81]    SPIS   [62][ED]   MOCY    [84] )
t.(S")
BYTES 1A813D3D3D3D535049533D3D3D62ED3D3D3D4D4F43593D3D3D3D84
LIT8 07 t.3 t.POS t.POWER-LIST-SEPARATOR LIT8 04 t.0 t.(DO)
( label 6096 )
t.I LIT16 0004 t.+ t.Y! LIT8 07 t.X! t.I t.2 t.*
t.POWER-SLOT-RECORDS LIT16 0005 t.+ LIT8 0D t.STYPE LIT8 14
t.X! t.I t.2 t.* t.1+ t.POWER-SLOT-RECORDS LIT16 0005 t.+
LIT8 0D t.STYPE
t.(LOOP) CELL FFC2 ( -> 6096 )
LIT8 07 LIT8 08 t.POS t.POWER-LIST-SEPARATOR LIT8 07 LIT8 09
t.POS
( Game text: )
( [9A][98][98][98][98][98][98][98][98][98][98][98][83][9A][9 )
( 8][98][98][98][98][98][98][98][98][98][98][83] )
t.(S")
BYTES 1A9A9898989898989898989898839A989898989898989898989883
t.;S
AT 6107

( ERROR-SOUND | NFA 6107 CFA 610E )
( Inferred descriptive name, not recovered original: Calls )
( sound dispatcher $5F9C with command19; used for wrong )
( items, unavailable powers, forbidden actions and full )
( inventory. )
( Stack: -- )
AT 6107
( Header: flags, saved name and link )
BYTES 84000000DA3660
DOCOL
LIT8 13 t.PLAY-SOUND-EFFECT t.;S
AT 6117

( FIND-SCENE-OBJECT | NFA 6117 CFA 611D )
( Inferred descriptive name, not recovered original: Gets a )
( mutable room/view record through $59DC and searches its )
( payload through $3896. Returns 0 if absent, or its byte )
( address followed by 1 if present. )
( Stack: object room view -- 0 / addr 1 )
AT 6117
( Header: flags, saved name and link )
BYTES 830000C20761
DOCOL
t.ROOM-VIEW-OBJECTS t.DUP t.>R t.WORD-COUNT t.FIND-BYTE-FIRST
t.DUP
t.0BRANCH CELL 000A ( -> 6137 )
t.R t.+ t.1+ t.1
( label 6137 )
t.R> t.DROP t.;S
AT 613D

( POWER-ERROR-MESSAGES | NFA 613D CFA 6142 )
( Inferred descriptive name, not recovered original: )
( Length-record vector with unavailable-power and )
( missing-required-item messages, indexed by $61F2. The )
( middle entry is an incomplete retained placeholder. )
( Decoded text: Power messages )
( item 0 line 1 $614C: TA MOC NIE )
( item 0 line 2 $6157: ZADZIALA )
( item 1 $6161: [incomplete message placeholder; retained )
( raw] )
( item 2 line 1 $6166: BRAK CI JEDNEGO )
( item 2 line 2 $6176: PRZEDMIOTU )
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

( REQUIRED-ITEM-PRESENT? | NFA 61C9 CFA 61CF )
( Inferred descriptive name, not recovered original: Reads )
( a required item byte and searches room0/view1 inventory )
( via $611D. A zero requirement succeeds even when no )
( matching inventory byte is found. )
( Stack: addr -- flag )
AT 61C9
( Header: flags, saved name and link )
BYTES 830000DA8261
DOCOL
t.C@ t.DUP t.0 t.1 t.FIND-SCENE-OBJECT
t.0BRANCH CELL 000A ( -> 61E7 )
t.2DROP t.1
t.BRANCH CELL 0004 ( -> 61E9 )
( label 61E7 )
t.0=_12DE
( label 61E9 )
t.;S
AT 61EB

( SELECT-REQUIRED-POWER | NFA 61EB CFA 61F2 )
( Inferred descriptive name, not recovered original: )
( Displays the eight powers, reads the selected slot, )
( checks its first metadata byte against the supplied power )
( ID and its next two bytes with $61CF; displays $6142 )
( errors on failure. )
( Stack: power -- flag )
AT 61EB
( Header: flags, saved name and link )
BYTES 84000000C1C961
DOCOL
t.>R t.SAVE-VIEW-CURSOR LIT8 0C LIT8 9A t.CURSOR-ORIGIN! t.2
LIT16 0004 t.CURSOR-LIMITS! LIT8 34 LIT16 0008 t.CURSOR-STEPS!
t.0 t.CURSOR-AXIS t.! t.0 t.CURSOR-GRID-POS t.!
t.CLEAR-TEXT-AREA t.SHOW-POWER-LIST t.1 t.PLAY-SOUND-EFFECT
t.WAIT-GAME-INPUT t.2 t.* t.+ t.POWER-SLOT-RECORDS t.2+ t.DUP
t.C@ t.R> t.=
t.0BRANCH CELL 0032 ( -> 626D )
t.1+ t.DUP t.REQUIRED-ITEM-PRESENT? t.SWAP t.1+
t.REQUIRED-ITEM-PRESENT? t.2DUP t.*
t.0BRANCH CELL 000A ( -> 6259 )
t.2DROP t.1
t.BRANCH CELL 0012 ( -> 6269 )
( label 6259 )
t.CLEAR-TEXT-AREA t.ERROR-SOUND t.+ t.1+
t.POWER-ERROR-MESSAGES t.2+ t.SHOW-MESSAGE t.0
( label 6269 )
t.BRANCH CELL 0012 ( -> 627D )
( label 626D )
t.DROP t.ERROR-SOUND t.CLEAR-TEXT-AREA t.0
t.POWER-ERROR-MESSAGES t.2+ t.SHOW-MESSAGE t.0
( label 627D )
t.CONFIGURE-VIEW-CURSOR t.RESTORE-VIEW-CURSOR t.;S
AT 6283

( POWER-TEXT-POINTERS | NFA 6283 CFA 6288 )
( Inferred descriptive name, not recovered original: Two )
( writable cells used by $6294/$74AD for source counted )
( power name and destination display slot; the four-byte )
( body is not a single scalar state. )
AT 6283
( Header: flags, saved name and link )
BYTES 8200C3EB61
DOVAR
BYTES 00000541
AT 628E

( PREPARE-POWER-SLOT | NFA 628E CFA 6294 )
( Inferred descriptive name, not recovered original: )
( Searches eight $5517 records for the same power ID or an )
( empty slot, copies three metadata bytes, and stores )
( source/destination text pointers in $6288. The original )
( assumes a suitable slot exists. )
( Stack: record -- )
AT 628E
( Header: flags, saved name and link )
BYTES 830000A18362
DOCOL
LIT8 08 t.0 t.(DO)
( label 629D )
t.I t.POWER-SLOT-RECORDS t.2+ t.C@ t.>R t.R t.OVER t.C@ t.=
t.R> t.0=_12DE t.+
t.0BRANCH CELL 000A ( -> 62C1 )
t.I t.POWER-SLOT-RECORDS t.2+ t.LEAVE
( label 62C1 )
t.(LOOP) CELL FFDA ( -> 629D )
t.2DUP t.3 t.CMOVE LIT8 05 t.+ t.POWER-TEXT-POINTERS t.2+ t.!
t.3 t.+ t.POWER-TEXT-POINTERS t.! t.;S
AT 62E0

( ACTION-LABELS | NFA 62E0 CFA 62E7 )
( Inferred descriptive name, not recovered original: )
( Length-record vector used by $65ED; the 80 dispatch )
( indices include one-byte aliases dereferenced once, )
( including two targets outside the known label table. )
( Decoded text: Action labels )
( item 0 $62EF: NIC )
( item 1 $62F4: NIE PATRZ )
( item 2 $62FF -> item 94: [reference outside this table; )
( retained raw] )
( item 3 $6302: ZOSTAW )
( item 4 $630A: WEZ )
( item 5 $630F: ZOBACZ )
( item 6 $6317: CO TO )
( item 7 $631E: POCZATEK )
( item 8 $6328: ODCZYT )
( item 9 $6330: ZAPIS )
( item 10 $6337 -> item 75: ZNISZCZ )
( item 11 $633A -> item 82: [reference outside this table; )
( retained raw] )
( item 12 $633D: WEJDZ )
( item 13 $6344: IDZ W PRAWO )
( item 14 $6351: IDZ W TYL )
( item 15 $635C: IDZ W LEWO )
( item 16 $6368: OTWORZ )
( item 17 $6370: ZAMKNIJ )
( item 18 $6379: ROZBIJ )
( item 19 $6381: ZNISZCZ )
( item 20 $638A: OTWORZ )
( item 21 $6392: UZYJ MOCY )
( item 22 $639D -> item 19: ZNISZCZ )
( item 23 $63A0 -> item 16: OTWORZ )
( item 24 $63A3 -> item 17: ZAMKNIJ )
( item 25 $63A6 -> item 16: OTWORZ )
( item 26 $63A9 -> item 16: OTWORZ )
( item 27 $63AC: ZAKOP )
( item 28 $63B3 -> item 16: OTWORZ )
( item 29 $63B6: ZGAS )
( item 30 $63BC -> item 4: WEZ )
( item 31 $63BF: UDERZ )
( item 32 $63C6 -> item 4: WEZ )
( item 33 $63C9: ODLAM )
( item 34 $63D0 -> item 4: WEZ )
( item 35 $63D3: ROZWESEL )
( item 36 $63DD: NAPELNIJ )
( item 37 $63E7: UBIERZ )
( item 38 $63EF -> item 21: UZYJ MOCY )
( item 39 $63F2 -> item 4: WEZ )
( item 40 $63F5: POSMARUJ )
( item 41 $63FF: NAKARM PSY )
( item 42 $640B -> item 20: OTWORZ )
( item 43 $640E -> item 21: UZYJ MOCY )
( item 44 $6411: SLUCHAJ )
( item 45 $641A: ZAPAL )
( item 46 $6421: CO TO )
( item 47 $6428: PRZECZYTAJ )
( item 48 $6434 -> item 47: PRZECZYTAJ )
( item 49 $6437 -> item 21: UZYJ MOCY )
( item 50 $643A -> item 12: WEJDZ )
( item 51 $643D: KUP I ZAPLAC )
( item 52 $644B: POWIEDZ BAJKE )
( item 53 $645A: POWIEDZ PRAWDE )
( item 54 $646A -> item 21: UZYJ MOCY )
( item 55 $646D: PRZESKOCZ )
( item 56 $6478: PRZEBIJ )
( item 57 $6481 -> item 6: CO TO )
( item 58 $6484: IDZ PROSTO )
( item 59 $6490 -> item 13: IDZ W PRAWO )
( item 60 $6493 -> item 14: IDZ W TYL )
( item 61 $6496 -> item 15: IDZ W LEWO )
( item 62 $6499 -> item 21: UZYJ MOCY )
( item 63 $649C -> item 58: IDZ PROSTO )
( item 64 $649F: NABIERZ )
( item 65 $64A8: IDZ TAM )
( item 66 $64B1 -> item 65: IDZ TAM )
( item 67 $64B4: PLYN )
( item 68 $64BA: COFNIJ )
( item 69 $64C2 -> item 21: UZYJ MOCY )
( item 70 $64C5: DAJ )
( item 71 $64CA -> item 21: UZYJ MOCY )
( item 72 $64CD: WYTRENUJ )
( item 73 $64D7 -> item 12: WEJDZ )
( item 74 $64DA -> item 3: ZOSTAW )
( item 75 $64DD: ZNISZCZ )
( item 76 $64E6: ZALATAJ )
( item 77 $64EF: POTRZYJ )
( item 78 $64F8 -> item 18: ROZBIJ )
( item 79 $64FB: WLACZ )
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

( ACTION-RECORD-BUFFER | NFA 6513 CFA 6518 )
( Inferred descriptive name, not recovered original: )
( Constant $8D20, destination for copied scene action )
( collections through $653F. )
AT 6513
( Header: flags, saved name and link )
BYTES 8200D4E062
DOCON
CELL 8D20
AT 651C

( SELECTED-META-POINTER | NFA 651C CFA 6522 )
( Inferred descriptive name, not recovered original: Holds )
( the selected scene object's metadata pointer, read )
( through $6796. )
AT 651C
( Header: flags, saved name and link )
BYTES 830000CB1365
DOVAR
CELL 0000
AT 6526

( SELECTED-ACTION-LIST | NFA 6526 CFA 652C )
( Inferred descriptive name, not recovered original: Points )
( to the action collection selected by )
( object/inventory/system-menu helpers; $6642 iterates this )
( collection. )
AT 6526
( Header: flags, saved name and link )
BYTES 830000C51C65
DOVAR
CELL 0000
AT 6530

( SELECTED-OBJECT | NFA 6530 CFA 6535 )
( Inferred descriptive name, not recovered original: Holds )
( the hit/object ID chosen by $65C9 and used by menu and )
( take/remove handlers. )
AT 6530
( Header: flags, saved name and link )
BYTES 8200C52665
DOVAR
CELL 0000
AT 6539

( SELECT-SCENE-ACTIONS | NFA 6539 CFA 653F )
( Inferred descriptive name, not recovered original: Looks )
( up object+200 in current room metadata, saves metadata+2 )
( in $6522, then copies the selected action collection to )
( scratch $8D20 and points $652C there. Falls back to )
( collection1 when absent. )
( Stack: object -- )
AT 6539
( Header: flags, saved name and link )
BYTES 830000CB3065
DOCOL
LIT8 C8 t.+ t.1 t.ROOM-RECORD-BUFFER t.LENGTH-RECORD-ADDR
t.WORD-COUNT t.OVER t.>R t.FIND-BYTE-FIRST t.-DUP
t.0BRANCH CELL 001A ( -> 6572 )
t.1 t.- t.R t.+ t.DUP t.2+ t.SELECTED-META-POINTER t.! t.1+
t.C@
t.BRANCH CELL 0004 ( -> 6574 )
( label 6572 )
t.1
( label 6574 )
t.0 t.ACTION-RECORD-BUFFER t.FETCH-NESTED-RESOURCE
t.ACTION-RECORD-BUFFER t.SELECTED-ACTION-LIST t.! t.R> t.DROP
t.;S
AT 6586

( SELECT-INVENTORY-ACTIONS | NFA 6586 CFA 658C )
( Inferred descriptive name, not recovered original: For a )
( nonzero item ID, scans records1..99 in game resource1 for )
( a record whose byte+4 equals that ID, setting $652C to )
( the matching action list. )
( Stack: item -- )
AT 6586
( Header: flags, saved name and link )
BYTES 830000D23965
DOCOL
t.-DUP
t.0BRANCH CELL 002F ( -> 65C1 )
LIT8 64 t.1 t.(DO)
( label 659B )
t.I t.1 t.ITEM-RESOURCE-ADDR t.2+ t.LENGTH-RECORD-ADDR t.2+
t.DUP t.SELECTED-ACTION-LIST t.! t.2+ t.C@ t.OVER t.=
t.0BRANCH CELL 0004 ( -> 65BB )
t.LEAVE
( label 65BB )
t.(LOOP) CELL FFDE ( -> 659B )
t.DROP
( label 65C1 )
t.;S
AT 65C3

( SELECT-OBJECT-ACTIONS | NFA 65C3 CFA 65C9 )
( Inferred descriptive name, not recovered original: Stores )
( the object ID in $6535; IDs above200 use $658C inventory )
( lookup and lower IDs use $653F room metadata lookup. )
( Stack: object -- )
AT 65C3
( Header: flags, saved name and link )
BYTES 830000D78665
DOCOL
t.DUP t.SELECTED-OBJECT t.! t.DUP LIT8 C8 t.>
t.0BRANCH CELL 0008 ( -> 65E2 )
t.SELECT-INVENTORY-ACTIONS
t.BRANCH CELL 0004 ( -> 65E4 )
( label 65E2 )
t.SELECT-SCENE-ACTIONS
( label 65E4 )
t.;S
AT 65E6

( APPEND-ACTION-LABEL | NFA 65E6 CFA 65ED )
( Inferred descriptive name, not recovered original: Copies )
( an indexed $62E7 label to an 8-bit counted destination )
( and returns its next address. A one-byte label is )
( dereferenced once as an alias; chained/out-of-table )
( aliases are not normalized. )
( Stack: destination action -- next )
AT 65E6
( Header: flags, saved name and link )
BYTES 84000000D2C365
DOCOL
t.SWAP t.>R t.ACTION-LABELS t.DUP t.C@ t.2 t.<
t.0BRANCH CELL 0008 ( -> 6607 )
t.2+ t.C@ t.ACTION-LABELS
( label 6607 )
t.WORD-COUNT t.DUP t.R t.C! t.R t.1+ t.SWAP t.CMOVE t.R>
t.COUNT t.+ t.;S
AT 661F

( MENU-ACTION-INDICES | NFA 661F CFA 6624 )
( Inferred descriptive name, not recovered original: )
( Cell-indexed array filled by $6642 alongside menu lines )
( and read by $66F6 to map a selected row to the handler )
( table. )
AT 661F
( Header: flags, saved name and link )
BYTES 8200C5E665
DODOES
( DOES> thread at 51DC )
BYTES DC512020202020202020202020202020202020202020
AT 663C

( BUILD-ACTION-MENU | NFA 663C CFA 6642 )
( Inferred descriptive name, not recovered original: Builds )
( counted lines at $481B from the selected object's )
( up-to-ten action records; stores parallel dispatch )
( indices in $6624 and adds no-action/leave-view entries as )
( appropriate. )
( Stack: -- )
AT 663C
( Header: flags, saved name and link )
BYTES 830000D91F66
DOCOL
t.PICTURE-STAGING@ LIT8 4C t.ERASE t.PICTURE-STAGING@ t.1+
t.LOAD-ITEM-ART-ENABLED t.@
t.0BRANCH CELL 0014 ( -> 6669 )
t.0 t.APPEND-ACTION-LABEL t.0 t.0 t.MENU-ACTION-INDICES t.!
t.1 t.PICTURE-STAGING@ t.BYTE+!
( label 6669 )
t.SELECTED-OBJECT t.@
t.0BRANCH CELL 0047 ( -> 66B6 )
LIT8 0B t.1 t.(DO)
( label 6678 )
t.I t.SELECTED-ACTION-LIST t.@ t.LENGTH-RECORD-ADDR t.DUP t.C@
t.0BRANCH CELL 001E ( -> 66A4 )
t.2+ t.C@ t.DUP t.I t.1 t.- t.PICTURE-STAGING@ t.C@ t.+
t.MENU-ACTION-INDICES t.! t.APPEND-ACTION-LABEL
t.BRANCH CELL 0010 ( -> 66B2 )
( label 66A4 )
t.DROP t.I t.1 t.- t.PICTURE-STAGING@ t.BYTE+! t.LEAVE
( label 66B2 )
t.(LOOP) CELL FFC4 ( -> 6678 )
( label 66B6 )
t.LOAD-ITEM-ART-ENABLED t.@ t.VIEW-STACK t.C@ t.*
t.0BRANCH CELL 001C ( -> 66DE )
t.1 t.DUP t.PICTURE-STAGING@ t.C@ t.MENU-ACTION-INDICES t.!
t.APPEND-ACTION-LABEL t.DROP t.1 t.PICTURE-STAGING@ t.BYTE+!
t.BRANCH CELL 0004 ( -> 66E0 )
( label 66DE )
t.DROP
( label 66E0 )
t.PICTURE-STAGING@ t.SHOW-MESSAGE t.;S
AT 66E6

( SELECTED-ACTION-RECORD | NFA 66E6 CFA 66EC )
( Inferred descriptive name, not recovered original: )
( Pointer to the action record selected by $66F6; $6777 )
( addresses its payload after the two-byte length. )
AT 66E6
( Header: flags, saved name and link )
BYTES 830000D73C66
DOVAR
CELL 0000
AT 66F0

( CHOOSE-ACTION-MENU | NFA 66F0 CFA 66F6 )
( Inferred descriptive name, not recovered original: Sets )
( the cursor grid for the prepared menu, reads a row, )
( stores its action record in $66EC, and returns the )
( parallel $6624 dispatch index. )
( Stack: -- action )
AT 66F0
( Header: flags, saved name and link )
BYTES 830000D2E666
DOCOL
t.SAVE-VIEW-CURSOR LIT8 15 t.MESSAGE-FRAME-WIDTH t.@ t.2 t./
t.- LIT8 89 t.CURSOR-ORIGIN! t.MESSAGE-FRAME-WIDTH t.@ t.2 t.-
t.PICTURE-STAGING@ t.C@ t.CURSOR-LIMITS! LIT8 04 LIT8 08
t.CURSOR-STEPS! t.0 t.CURSOR-GRID-POS t.1+ t.C!
t.MESSAGE-FRAME-WIDTH t.@ t.2 t./ t.MESSAGE-FIRST-LINE-WIDTH
t.@ t.2 t./MOD t.+ t.+ t.3 t.- t.CURSOR-GRID-POS t.C!
t.WAIT-GAME-INPUT t.SWAP t.DROP t.DUP t.SELECTED-ACTION-LIST
t.@ t.LENGTH-RECORD-ADDR t.SELECTED-ACTION-RECORD t.!
t.MENU-ACTION-INDICES t.@ t.CONFIGURE-VIEW-CURSOR
t.RESTORE-VIEW-CURSOR t.;S
AT 6762

( CHOOSE-OBJECT-ACTION | NFA 6762 CFA 676A )
( Inferred descriptive name, not recovered original: Builds )
( the selected-object menu with $6642, then returns the )
( user's action selection through $66F6. )
( Stack: -- action )
AT 6762
( Header: flags, saved name and link )
BYTES 8500000000C2F066
DOCOL
t.BUILD-ACTION-MENU t.CHOOSE-ACTION-MENU t.;S
AT 6772

( ACTION-BYTE-ADDR | NFA 6772 CFA 6777 )
( Inferred descriptive name, not recovered original: Adds )
( the supplied byte offset and2 to the pointer stored at )
( $66EE; the first two bytes of each selected action record )
( hold its length. Verified by original-6502 probes. )
( Stack: offset -- addr )
AT 6772
( Header: flags, saved name and link )
BYTES 8200D96267
DOCOL
t.SELECTED-ACTION-RECORD t.@ t.+ t.2+ t.;S
AT 6783

( ACTION-BYTE@ | NFA 6783 CFA 6789 )
( Inferred descriptive name, not recovered original: Calls )
( $6777 then C@; reads a byte within the selected action )
( payload. Verified by original-6502 probes. )
( Stack: offset -- byte )
AT 6783
( Header: flags, saved name and link )
BYTES 830000C07267
DOCOL
t.ACTION-BYTE-ADDR t.C@ t.;S
AT 6791

( SELECTED-OBJECT-META | NFA 6791 CFA 6796 )
( Inferred descriptive name, not recovered original: )
( Fetches the metadata pointer stored in $6522 by )
( scene-object action selection. )
( Stack: -- addr )
AT 6791
( Header: flags, saved name and link )
BYTES 8200CB8367
DOCOL
t.SELECTED-META-POINTER t.@ t.;S
AT 679E

( OBJECT-META-0 | NFA 679E CFA 67A3 )
( Inferred descriptive name, not recovered original: )
( Fetches the first byte of metadata returned by $6796; its )
( interpretation depends on the dispatched action. )
( Stack: -- byte )
AT 679E
( Header: flags, saved name and link )
BYTES 8200CB9167
DOCOL
t.SELECTED-OBJECT-META t.C@ t.;S
AT 67AB

( OBJECT-META-1 | NFA 67AB CFA 67B0 )
( Inferred descriptive name, not recovered original: )
( Fetches metadata byte1 through $6796; different handlers )
( use it as a required item, room/view or state index. )
( Stack: -- byte )
AT 67AB
( Header: flags, saved name and link )
BYTES 8200CB9E67
DOCOL
t.SELECTED-OBJECT-META t.1+ t.C@ t.;S
AT 67BA

( OBJECT-META-2 | NFA 67BA CFA 67BF )
( Inferred descriptive name, not recovered original: )
( Fetches metadata byte2 through $6796; different handlers )
( use it as a state index, replacement object or message. )
( Stack: -- byte )
AT 67BA
( Header: flags, saved name and link )
BYTES 8200CBAB67
DOCOL
t.SELECTED-OBJECT-META t.2+ t.C@ t.;S
AT 67C9

( ADD-SCENE-OBJECT | NFA 67C9 CFA 67CE )
( Inferred descriptive name, not recovered original: Uses )
( $611D to avoid duplicates in a room/view list; otherwise )
( fills its first zero byte. Returns1 for present/inserted )
( and0 when no free position exists. )
( Stack: object room view -- flag )
AT 67C9
( Header: flags, saved name and link )
BYTES 8200C2BA67
DOCOL
t.>R t.2DUP t.R t.FIND-SCENE-OBJECT
t.0BRANCH CELL 000E ( -> 67E8 )
t.2DROP t.R> t.2DROP t.1
t.BRANCH CELL 001A ( -> 6800 )
( label 67E8 )
t.0 t.SWAP t.R> t.FIND-SCENE-OBJECT
t.0BRANCH CELL 000A ( -> 67FC )
t.C! t.1
t.BRANCH CELL 0006 ( -> 6800 )
( label 67FC )
t.DROP t.0
( label 6800 )
t.;S
AT 6802

( ADD-CURRENT-OBJECT | NFA 6802 CFA 6808 )
( Inferred descriptive name, not recovered original: Calls )
( $67CE with current room $550D and current view P, )
( discarding the success flag. )
( Stack: object -- )
AT 6802
( Header: flags, saved name and link )
BYTES 830000A1C967
DOCOL
t.CURRENT-ROOM t.@ t.P t.ADD-SCENE-OBJECT t.DROP t.;S
AT 6816

( REMOVE-SCENE-OBJECT | NFA 6816 CFA 681C )
( Inferred descriptive name, not recovered original: Finds )
( the object in a room/view list through $611D and clears )
( that byte if present. )
( Stack: object room view -- )
AT 6816
( Header: flags, saved name and link )
BYTES 830000C20268
DOCOL
t.FIND-SCENE-OBJECT
t.0BRANCH CELL 0008 ( -> 682A )
t.0 t.SWAP t.C!
( label 682A )
t.;S
AT 682C

( REMOVE-CURRENT-OBJECT | NFA 682C CFA 6833 )
( Inferred descriptive name, not recovered original: Calls )
( $681C with current room $550D and current view P. )
( Stack: object -- )
AT 682C
( Header: flags, saved name and link )
BYTES 84000000A11668
DOCOL
t.CURRENT-ROOM t.@ t.P t.REMOVE-SCENE-OBJECT t.;S
AT 683F

( MSG-INVENTORY-FULL | NFA 683F CFA 6844 )
( Inferred descriptive name, not recovered original: )
( Counted message NIE UNIESIESZ TYLE, displayed when $6863 )
( cannot insert an inventory item. )
( Decoded text: Message lines )
( line 1 $684A: NIE UNIESIESZ )
( line 2 $6858: TYLE )
AT 683F
( Header: flags, saved name and link )
BYTES 8200D22C68
DOVAR
BYTES 1400020D4E49453D554E4945534945535A0454594C4520
AT 685D

( ADD-INVENTORY-ITEM | NFA 685D CFA 6863 )
( Inferred descriptive name, not recovered original: Adds )
( an item to room0/view1, computes its occupied-slot X and )
( Y=$4E in $55B4, and returns success. On full inventory )
( displays NIE UNIESIESZ TYLE [you cannot carry this much]. )
( Stack: item -- flag )
AT 685D
( Header: flags, saved name and link )
BYTES 830000A13F68
DOCOL
t.>R t.R t.0 t.1 t.ADD-SCENE-OBJECT
t.0BRANCH CELL 003B ( -> 68AC )
t.R LIT8 CA t.- t.R t.0 t.1 t.ROOM-VIEW-OBJECTS t.WORD-COUNT
t.FIND-BYTE-FIRST t.2 t.- LIT16 0004 t.* LIT8 0B t.+ t.OVER
t.ITEM-POSITIONS t.C! LIT8 4E t.SWAP t.ITEM-POSITIONS t.1+
t.C! t.1
t.BRANCH CELL 000C ( -> 68B6 )
( label 68AC )
t.ERROR-SOUND t.MSG-INVENTORY-FULL t.2+ t.SHOW-MESSAGE t.0
( label 68B6 )
t.R> t.DROP t.;S
AT 68BC

( REMOVE-INVENTORY-ITEM | NFA 68BC CFA 68C3 )
( Inferred descriptive name, not recovered original: )
( Removes an item from room0/view1 through $681C. )
( Stack: item -- )
AT 68BC
( Header: flags, saved name and link )
BYTES 84000000A15D68
DOCOL
t.0 t.1 t.REMOVE-SCENE-OBJECT t.;S
AT 68CD

( ACTION-ARG1 | NFA 68CD CFA 68D2 )
( Inferred descriptive name, not recovered original: )
( Fetches selected action payload byte1 through $6789. )
( Stack: -- byte )
AT 68CD
( Header: flags, saved name and link )
BYTES 8200D7BC68
DOCOL
t.1 t.ACTION-BYTE@ t.;S
AT 68DA

( ACTION-ARG2 | NFA 68DA CFA 68DF )
( Inferred descriptive name, not recovered original: )
( Fetches selected action payload byte2 through $6789. )
( Stack: -- byte )
AT 68DA
( Header: flags, saved name and link )
BYTES 8200D7CD68
DOCOL
t.2 t.ACTION-BYTE@ t.;S
AT 68E7

( ACTION-ARG3 | NFA 68E7 CFA 68EC )
( Inferred descriptive name, not recovered original: )
( Fetches selected action payload byte3 through $6789. )
( Stack: -- byte )
AT 68E7
( Header: flags, saved name and link )
BYTES 8200D7DA68
DOCOL
LIT8 03 t.ACTION-BYTE@ t.;S
AT 68F5

( ACTION-ARG4 | NFA 68F5 CFA 68FA )
( Inferred descriptive name, not recovered original: )
( Fetches selected action payload byte4 through $6789. )
( Stack: -- byte )
AT 68F5
( Header: flags, saved name and link )
BYTES 8200D7E768
DOCOL
LIT8 04 t.ACTION-BYTE@ t.;S
AT 6903

( ACTION-ARG5 | NFA 6903 CFA 6908 )
( Inferred descriptive name, not recovered original: )
( Fetches selected action payload byte5 through $6789. )
( Stack: -- byte )
AT 6903
( Header: flags, saved name and link )
BYTES 8200D7F568
DOCOL
LIT8 05 t.ACTION-BYTE@ t.;S
AT 6911

( ACTION-ARG6 | NFA 6911 CFA 6916 )
( Inferred descriptive name, not recovered original: )
( Fetches selected action payload byte6 through $6789. )
( Stack: -- byte )
AT 6911
( Header: flags, saved name and link )
BYTES 8200D70369
DOCOL
LIT8 06 t.ACTION-BYTE@ t.;S
AT 691F

( ACTION-ARG7 | NFA 691F CFA 6924 )
( Inferred descriptive name, not recovered original: )
( Fetches selected action payload byte7 through $6789. )
( Stack: -- byte )
AT 691F
( Header: flags, saved name and link )
BYTES 8200D71169
DOCOL
LIT8 07 t.ACTION-BYTE@ t.;S
AT 692D

( HIT-ID>POSITION | NFA 692D CFA 6934 )
( Inferred descriptive name, not recovered original: )
( Searches the hit-map buffer $4DB2 for a hit ID, divides )
( the resulting offset by grid width, and converts it to )
( pixel/byte coordinates relative to the active view. )
( Caller $7140 uses hit201 for an inventory item's dropped )
( position. )
( Stack: hit -- x y )
AT 692D
( Header: flags, saved name and link )
BYTES 84000000CB1F69
DOCOL
t.HIT-MAP@ t.DUP t.>R t.2+ t.R t.BYTE-PAIR@ t.*
t.FIND-BYTE-FIRST t.1 t.- t.R> t.C@ t./MOD LIT8 06 t.*
t.VIEW-STACK t.C@
t.0BRANCH CELL 000A ( -> 6965 )
t.SCENE-PICTURE-BUFFER t.BYTE-PAIR@
t.BRANCH CELL 0008 ( -> 696B )
( label 6965 )
LIT16 0004 t.0
( label 696B )
t.ROT t.+ t.>R t.+ t.R> t.;S
AT 6977

( MSG-NO-ITEM-SELECTED | NFA 6977 CFA 697C )
( Inferred descriptive name, not recovered original: )
( Counted message NIE POKAZALES RZECZY, displayed after an )
( empty inventory choice. )
( Decoded text: Message lines )
( line 1 $6982: NIE POKAZALES )
( line 2 $6990: RZECZY )
AT 6977
( Header: flags, saved name and link )
BYTES 8200D22D69
DOVAR
BYTES 1600020D4E49453D504F4B415A416C457306525A45435A59
AT 6996

( CHOOSE-INVENTORY-ITEM | NFA 6996 CFA 699C )
( Inferred descriptive name, not recovered original: Shows )
( inventory, reads a cursor selection, converts it through )
( $5298, and restores the prior view. A zero selection )
( displays NIE POKAZALES RZECZY [you did not indicate an )
( item]. )
( Stack: -- item-or-zero )
AT 6996
( Header: flags, saved name and link )
BYTES 830000BF7769
DOCOL
t.ENTER-INVENTORY-VIEW LIT8 10 t.PLAY-SOUND-EFFECT
t.WAIT-GAME-INPUT t.HIT-MAP-CELL t.DUP t.0=_12DE
t.0BRANCH CELL 000C ( -> 69BB )
t.ERROR-SOUND t.CLEAR-TEXT-AREA t.MSG-NO-ITEM-SELECTED t.2+
t.SHOW-MESSAGE
( label 69BB )
t.LEAVE-INVENTORY-VIEW t.;S
AT 69BF

( INITIAL-MENU-RECORDS | NFA 69BF CFA 69C5 )
( Inferred descriptive name, not recovered original: )
( Although its code field is DOCOL, $69EC uses its PFA )
( $69C7 as length-record data: placeholder action1 and )
( new-game/load entries7/8. It is not executed as a colon )
( word. )
AT 69BF
( Header: flags, saved name and link )
BYTES 830000B09669
DOCOL
( Trailing code/data at 69C7; retained exactly )
BYTES 01000101000701000800007712
AT 69D4

( ACTIVE-MENU-RECORDS | NFA 69D4 CFA 69DA )
( Inferred descriptive name, not recovered original: )
( Although its code field is DOCOL, $69EC uses its PFA )
( $69DC as length-record data with placeholder action1 and )
( save entry9; no threaded execution is inferred. )
AT 69D4
( Header: flags, saved name and link )
BYTES 830000B1BF69
DOCOL
( Trailing code/data at 69DC; retained exactly )
BYTES 01000101000900007712
AT 69E6

( SELECT-SYSTEM-MENU | NFA 69E6 CFA 69EC )
( Inferred descriptive name, not recovered original: )
( Discards its incoming object, selects menu data $69DC )
( during play or $69C7 before play, sets selected object1, )
( and clears command state $5CEC. )
( Stack: object -- )
AT 69E6
( Header: flags, saved name and link )
BYTES 830000D3D469
DOCOL
t.DROP t.LOAD-ITEM-ART-ENABLED t.@
t.0BRANCH CELL 000A ( -> 6A00 )
LIT16 69DC
t.BRANCH CELL 0006 ( -> 6A04 )
( label 6A00 )
LIT16 69C7
( label 6A04 )
t.SELECTED-ACTION-LIST t.! t.1 t.SELECTED-OBJECT t.! t.0
t.KEYBOARD-SELECTION t.! t.;S
AT 6A16

( MISSION-BIT-COUNT | NFA 6A16 CFA 6A1C )
( Inferred descriptive name, not recovered original: Result )
( cell whose low byte is reset/incremented by native $6A26 )
( and used by percentage display $6A9D. )
AT 6A16
( Header: flags, saved name and link )
BYTES 830000C3E669
DOVAR
CELL 0000
AT 6A20

( COUNT-MISSION-BITS | NFA 6A20 CFA 6A26 )
( Inferred descriptive name, not recovered original: Native )
( loop counts all set bits in 25 bytes starting at $57E2 )
( and stores the result byte at $6A1E. )
( Stack: -- )
AT 6A20
( Header: flags, saved name and link )
BYTES 830000D2166A
CELL 6A28 ( native entry point )
STX.ZP D1            ( 6A28 )
LDY.# 00             ( 6A2A )
STY.ABS 6A1E         ( 6A2C )
LDX.# 08             ( 6A2F )
LDA.ABSY 57E2        ( 6A31 )
CLC                  ( 6A34 )
LSR.A                ( 6A35 )
BCC 6A3B             ( 6A36 )
INC.ABS 6A1E         ( 6A38 )
DEX                  ( 6A3B )
BNE 6A34             ( 6A3C )
INY                  ( 6A3E )
CPY.# 19             ( 6A3F )
BNE 6A2F             ( 6A41 )
LDX.ZP D1            ( 6A43 )
JMP.ABS 0F47         ( 6A45 )
AT 6A48

( MARK-ROOM-PROGRESS | NFA 6A48 CFA 6A4E )
( Inferred descriptive name, not recovered original: Uses )
( current room to address $57E2+room [the PFA of variable )
( $57E0]; adds the supplied bit mask only if none of its )
( bits are already set. Thus repeated single-bit awards are )
( idempotent. )
( Stack: mask -- )
AT 6A48
( Header: flags, saved name and link )
BYTES 830000A1206A
DOCOL
t.CURRENT-ROOM t.@ t.ROOM-ACHIEVEMENT-BITS t.+ t.2DUP t.C@
t.AND t.0=_12DE
t.0BRANCH CELL 0008 ( -> 6A6A )
t.BYTE+!
t.BRANCH CELL 0004 ( -> 6A6C )
( label 6A6A )
t.2DROP
( label 6A6C )
t.;S
AT 6A6E

( MSG-MISSION-PERCENT | NFA 6A6E CFA 6A73 )
( Inferred descriptive name, not recovered original: )
( Writable counted message WYKONALES ... PROCENT MISJI; )
( $6A9D patches its two percentage digits. )
( Decoded text: Message lines )
( line 1 $6A79: WYKONALES    PROCENT MISJI )
AT 6A6E
( Header: flags, saved name and link )
BYTES 8200C4486A
DOVAR
BYTES 1C00011A57594B4F4E416C45733D3D3D3D50524F43454E543D4D4953
BYTES 4A49202020
AT 6A96

( SHOW-MISSION-PERCENT | NFA 6A96 CFA 6A9D )
( Inferred descriptive name, not recovered original: While )
( a game is active, computes $6A1E*100/61 after counting )
( mission bits, writes two digits into $6A73 and displays )
( the progress message. )
( Stack: -- )
AT 6A96
( Header: flags, saved name and link )
BYTES 84000000C36E6A
DOCOL
t.LOAD-ITEM-ART-ENABLED t.@
t.0BRANCH CELL 0032 ( -> 6AD7 )
t.COUNT-MISSION-BITS t.MISSION-BIT-COUNT t.C@ LIT8 64 t.*
LIT8 3D t./ t.0 t.<# t.#_268F t.#_268F t.#>
t.MSG-MISSION-PERCENT LIT8 0E t.+ t.SWAP t.CMOVE
t.MSG-MISSION-PERCENT t.2+ LIT8 05 t.Y! t.SHOW-MESSAGE
( label 6AD7 )
t.;S
AT 6AD9

( SELECT-INPUT-ACTION | NFA 6AD9 CFA 6ADF )
( Inferred descriptive name, not recovered original: )
( Interprets command state $5CEC: zero selects object )
( actions, one selects the system menu/progress, larger )
( values map to dispatch index state+8. Clears the state )
( before returning. )
( Stack: object -- action )
AT 6AD9
( Header: flags, saved name and link )
BYTES 830000C2966A
DOCOL
t.KEYBOARD-SELECTION t.@ t.>R t.0 t.BASE-VIEW-KEYS-ENABLED t.!
t.R t.0=_12DE
t.0BRANCH CELL 0006 ( -> 6AF9 )
t.SELECT-OBJECT-ACTIONS t.CHOOSE-OBJECT-ACTION
( label 6AF9 )
t.R t.1 t.=
t.0BRANCH CELL 000A ( -> 6B0B )
t.SELECT-SYSTEM-MENU t.BUILD-ACTION-MENU
t.SHOW-MISSION-PERCENT t.CHOOSE-ACTION-MENU
( label 6B0B )
t.R t.1 t.>
t.0BRANCH CELL 000C ( -> 6B1F )
t.DROP t.R LIT16 0008 t.+
( label 6B1F )
t.R> t.DROP t.0 t.KEYBOARD-SELECTION t.! t.;S
AT 6B2B

( CHOOSE-SCENE-OBJECT | NFA 6B2B CFA 6B31 )
( Inferred descriptive name, not recovered original: )
( Enables scene hit-test mode, reads cursor input and $5298 )
( hit ID, excludes ID5, masks to five bits outside a )
( close-up, then disables hit-test mode. )
( Stack: -- object )
AT 6B2B
( Header: flags, saved name and link )
BYTES 830000CBD96A
DOCOL
t.1 t.BASE-VIEW-KEYS-ENABLED t.! t.WAIT-GAME-INPUT
t.HIT-MAP-CELL t.DUP LIT8 05 t.= t.0=_12DE t.* t.VIEW-STACK
t.C@ t.0=_12DE
t.0BRANCH CELL 0007 ( -> 6B57 )
LIT8 1F t.AND
( label 6B57 )
t.0 t.BASE-VIEW-KEYS-ENABLED t.! t.;S
AT 6B5F

( ACTION-HANDLER-PFAS | NFA 6B5F CFA 6B64 )
( Inferred descriptive name, not recovered original: The )
( first80 cells form the validated handler-PFA table used )
( by $6C1F, which converts each chosen PFA to CFA and )
( executes it. Six retained tail bytes are not validated )
( handler entries. )
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

( SAVED-ROOM-COLORS | NFA 6C0E CFA 6C14 )
( Inferred descriptive name, not recovered original: Three )
( bytes copied from each room palette by $6C52, restored to )
( $42E2 by $6D05 after temporary darkness. )
AT 6C0E
( Header: flags, saved name and link )
BYTES 830000C25F6B
DOVAR
BYTES 000005
AT 6C19

( EXECUTE-ACTION | NFA 6C19 CFA 6C1F )
( Inferred descriptive name, not recovered original: )
( Indexes $6B64 to obtain a handler PFA, falls back to )
( entry0 for a zero pointer, converts PFA to CFA, and )
( EXECUTEs. )
( Stack: action -- )
AT 6C19
( Header: flags, saved name and link )
BYTES 830000C20E6C
DOCOL
t.ACTION-HANDLER-PFAS t.@ t.-DUP t.0=_12DE
t.0BRANCH CELL 0008 ( -> 6C33 )
t.0 t.ACTION-HANDLER-PFAS t.@
( label 6C33 )
t.CFA t.EXECUTE t.;S
AT 6C39

( DROP5 | NFA 6C39 CFA 6C41 )
( Inferred descriptive name, not recovered original: )
( Exactly 2DROP 2DROP DROP; no application meaning beyond )
( discarding five cells is inferred. )
( Stack: a b c d e -- )
AT 6C39
( Header: flags, saved name and link )
BYTES 8500000000C5196C
DOCOL
t.2DROP t.2DROP t.DROP t.;S
AT 6C4B

( ENTER-ROOM | NFA 6C4B CFA 6C52 )
( Inferred descriptive name, not recovered original: Clears )
( text, hides graphics, loads/draws the requested room )
( through $59F0, copies room colors into live and saved )
( palettes, prints its optional description, restores )
( graphics and marks progress except in room1. )
( Stack: room -- )
AT 6C4B
( Header: flags, saved name and link )
BYTES 84000000C3396C
DOCOL
t.>R t.CLEAR-TEXT-AREA t.CLOSE-SCENE-TRANSITION t.R>
t.DRAW-ROOM t.1 t.ROOM-RECORD-BUFFER t.2+ t.LENGTH-RECORD-ADDR
t.WORD-COUNT t.2DUP t.GAME-COLOR-TABLE t.SWAP t.CMOVE
t.SAVED-ROOM-COLORS t.SWAP t.CMOVE t.2 t.ROOM-RECORD-BUFFER
t.2+ t.LENGTH-RECORD-ADDR t.WORD-COUNT t.3 t.>
t.0BRANCH CELL 0008 ( -> 6C8E )
t.SHOW-MESSAGE
t.BRANCH CELL 0004 ( -> 6C90 )
( label 6C8E )
t.DROP
( label 6C90 )
t.OPEN-SCENE-TRANSITION t.CURRENT-ROOM t.@ t.1 t.-
t.0BRANCH CELL 0006 ( -> 6CA2 )
t.1 t.MARK-ROOM-PROGRESS
( label 6CA2 )
t.;S
AT 6CA4

( REDRAW-HOOK | NFA 6CA4 CFA 6CA9 )
( Inferred descriptive name, not recovered original: An )
( empty colon definition called at the start of $6D4E. No )
( extra behavior is present in this disk version. )
( Stack: -- )
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
t.1 t.KEYBOARD-SELECTION t.! t.0 t.LOAD-ITEM-ART-ENABLED t.!
t.CLEAR-TEXT-AREA t.1 t.SELECT-INPUT-ACTION t.EXECUTE-ACTION
t.LAST-DISK-STATUS t.@ t.0=_12DE
t.0BRANCH CELL FFE4 ( -> 6CC7 )
t.INSTALL-GAME-VBI
( label 6CE7 )
t.0 t.KEYBOARD-SELECTION t.! t.CHOOSE-SCENE-OBJECT
t.CLEAR-TEXT-AREA t.SELECT-INPUT-ACTION t.CLEAR-TEXT-AREA
t.EXECUTE-ACTION t.0
t.0BRANCH CELL FFEC ( -> 6CE7 )
t.;S
AT 6CFF

( RESTORE-ROOM-COLORS | NFA 6CFF CFA 6D05 )
( Inferred descriptive name, not recovered original: Copies )
( three saved bytes from $6C14 to current room-color )
( storage $42E2. )
( Stack: -- )
AT 6CFF
( Header: flags, saved name and link )
BYTES 830000D7B76C
DOCOL
t.SAVED-ROOM-COLORS t.GAME-COLOR-TABLE LIT8 03 t.CMOVE t.;S
AT 6D12

( SET-DARK-ROOM-COLORS | NFA 6D12 CFA 6D18 )
( Inferred descriptive name, not recovered original: )
( Replaces $42E2's first three bytes with 0,0,2; paired )
( with restoration $6D05 by close/open and extinguish/light )
( handlers. )
( Stack: -- )
AT 6D12
( Header: flags, saved name and link )
BYTES 830000C7FF6C
DOCOL
t.0 t.GAME-COLOR-TABLE t.! t.2 t.GAME-COLOR-TABLE t.2+ t.C!
t.;S
AT 6D2A

( PUZZLE-STATE@ | NFA 6D2A CFA 6D31 )
( Inferred descriptive name, not recovered original: )
( Fetches indexed cell $5806+2*index through $5802; )
( game-specific handlers use these cells as flags and )
( counters. Verified by original-6502 probes. )
( Stack: index -- value )
AT 6D2A
( Header: flags, saved name and link )
BYTES 84000000C0126D
DOCOL
t.PUZZLE-STATE-CELLS t.@ t.;S
AT 6D39

( PUZZLE-STATE! | NFA 6D39 CFA 6D40 )
( Inferred descriptive name, not recovered original: Stores )
( through indexed cell array $5802 at $5806+2*index. )
( Verified by original-6502 probes. )
( Stack: value index -- )
AT 6D39
( Header: flags, saved name and link )
BYTES 84000000A12A6D
DOCOL
t.PUZZLE-STATE-CELLS t.! t.;S
AT 6D48

( REFRESH-SCENE-HIT-MAP | NFA 6D48 CFA 6D4E )
( Inferred descriptive name, not recovered original: )
( Invokes the redraw hook, resets the hit-map selector, )
( then copies picture/hit-map data via $541A and draws the )
( scene picture buffer via $5441 after object changes. This )
( does not establish a cursor-restoration operation. )
( Stack: -- )
AT 6D48
( Header: flags, saved name and link )
BYTES 830000D4396D
DOCOL
t.REDRAW-HOOK t.HIT-MAP@ t.DUP t.0 t.HIT-MAP-SELECTOR t.!
t.HIT-MAP@ t.C@ t.SCENE-PICTURE-BUFFER LIT16 0004 t.0
t.SET-PICTURE-OFFSETS t.DROP t.HIT-MAP@ t.2+ t.OVER
t.HIT-MAP-OFFSET t.GRAPHICS-SOURCE-PTR t.! t.BLIT-PARAMETERS
t.SCENE-PICTURE-BUFFER t.DRAW-DECODED-PICTURE t.;S
AT 6D80

( DRAW-BASE-AND-OVERLAY | NFA 6D80 CFA 6D85 )
( Inferred descriptive name, not recovered original: )
( Converts the lower object ID with $5958 and draws its )
( base through $5916; converts the upper ID and, when )
( nonzero, overlays it through $5928. )
( Stack: base overlay -- )
AT 6D80
( Header: flags, saved name and link )
BYTES 8200CF486D
DOCOL
t.SWAP t.CLASSIFY-OBJECT t.DROP t.DECODE-ZOOM-PICTURE
t.CLASSIFY-OBJECT
t.0BRANCH CELL 0004 ( -> 6D97 )
t.COMPOSE-PICTURE-AND-MASK
( label 6D97 )
t.;S
AT 6D99

( DRAW-OBJECT-CHANGE | NFA 6D99 CFA 6DA0 )
( Inferred descriptive name, not recovered original: Draws )
( base and optional overlay through $6D85, then refreshes )
( hit-test and cursor state with $6D4E. )
( Stack: base overlay -- )
AT 6D99
( Header: flags, saved name and link )
BYTES 84000000C2806D
DOCOL
t.DRAW-BASE-AND-OVERLAY t.REFRESH-SCENE-HIT-MAP t.;S
AT 6DA8

( DRAW-TWO-OVERLAYS | NFA 6DA8 CFA 6DAF )
( Inferred descriptive name, not recovered original: Saves )
( a third object ID, draws base/first overlay through )
( $6D85, optionally draws the second overlay through $5928, )
( then refreshes hit-test state. )
( Stack: base overlay1 overlay2 -- )
AT 6DA8
( Header: flags, saved name and link )
BYTES 84000000C2996D
DOCOL
t.>R t.DRAW-BASE-AND-OVERLAY t.R> t.CLASSIFY-OBJECT
t.0BRANCH CELL 0004 ( -> 6DBF )
t.COMPOSE-PICTURE-AND-MASK
( label 6DBF )
t.REFRESH-SCENE-HIT-MAP t.;S
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

( MSG-WHAT | NFA 6DEF CFA 6DF4 )
( Inferred descriptive name, not recovered original: )
( Counted prompt CO? [what?], shown before generic and )
( restricted drop-item actions. )
( Decoded text: Message lines )
( line 1 $6DFA: CO? )
AT 6DEF
( Header: flags, saved name and link )
BYTES 8200D4C36D
DOVAR
BYTES 05000103434F3F
AT 6DFD

( SHOW-GAME-MESSAGE | NFA 6DFD CFA 6E04 )
( Inferred descriptive name, not recovered original: )
( Divides message ID by30 to choose a bank and record in )
( game resource2, then displays the nested counted message )
( with $45A1. )
( Stack: message -- )
AT 6DFD
( Header: flags, saved name and link )
BYTES 84000000D4EF6D
DOCOL
LIT8 1E t./MOD t.2 t.ITEM-RESOURCE-ADDR t.2+
t.LENGTH-RECORD-ADDR t.2+ t.LENGTH-RECORD-ADDR t.2+
t.SHOW-MESSAGE t.;S
AT 6E1D

( SHOW-ACTION-ERROR | NFA 6E1D CFA 6E23 )
( Inferred descriptive name, not recovered original: Clears )
( text, plays the error sound, then displays the selected )
( game message through $6E04. )
( Stack: message -- )
AT 6E1D
( Header: flags, saved name and link )
BYTES 830000D8FD6D
DOCOL
t.CLEAR-TEXT-AREA t.ERROR-SOUND t.SHOW-GAME-MESSAGE t.;S
AT 6E2D

( SHOW-RESOURCE-MESSAGE | NFA 6E2D CFA 6E34 )
( Inferred descriptive name, not recovered original: )
( Selects a resource collection, clears text and displays )
( the counted message at its first record+4. )
( Stack: resource -- )
AT 6E2D
( Header: flags, saved name and link )
BYTES 84000000CD1D6E
DOCOL
t.FETCH-RESOURCE t.CLEAR-TEXT-AREA t.0 t.RESOURCE-ADDR LIT8 04
t.+ t.SHOW-MESSAGE t.;S
AT 6E47

( ACT-NOTHING | NFA 6E47 CFA 6E4C )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 00 correspond to NIC. Empty handler; )
( the dispatcher also falls back to this entry for a null )
( target. )
AT 6E47
( Header: flags, saved name and link )
BYTES 8200B02D6E
DOCOL
t.;S
AT 6E50

( ACT-LEAVE-VIEW | NFA 6E50 CFA 6E55 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 01 correspond to NIE PATRZ. Plays )
( sound9 and calls $5BD4 to leave the current close-up. )
AT 6E50
( Header: flags, saved name and link )
BYTES 8200B1476E
DOCOL
LIT8 09 t.PLAY-SOUND-EFFECT t.LEAVE-VIEW t.;S
AT 6E60

( ACT-UNUSED-NOOP | NFA 6E60 CFA 6E65 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 02 correspond to unresolved alias94. )
( Empty handler. The label's one-byte alias points outside )
( the retained 80-entry table, so no label meaning is )
( guessed. )
AT 6E60
( Header: flags, saved name and link )
BYTES 8200B2506E
DOCOL
t.;S
AT 6E69

( RETAINED-QUEST-OBJECT-PAIRS | NFA 6E69 CFA 6E6E )
( Inferred descriptive name, not recovered original: )
( Retained Klatwa-style five object/room byte pairs used by )
( $6EE0, whose required rooms25..28 are absent from Wladcy )
( initial room table: )
( [31,25],[130,28],[107,28],[7,25],[107,23]. )
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

( COUNT-LEGACY-PLACED-ITEMS | NFA 6E9B CFA 6EA0 )
( Inferred descriptive name, not recovered original: )
( Retained Klatwa-style logic counts items202,203,204,205 )
( in rooms25,26,27,28 respectively, always view1. The )
( initial Wladcy table has only rooms0..24, so no active )
( quest is established. )
( Stack: -- count )
AT 6E9B
( Header: flags, saved name and link )
BYTES 8200D47A6E
DOCOL
t.0 LIT16 0004 t.0 t.(DO)
( label 6EAC )
LIT8 CA t.I t.+ LIT8 19 t.I t.+ t.1 t.FIND-SCENE-OBJECT
t.0BRANCH CELL 0006 ( -> 6EC6 )
t.DROP t.1+
( label 6EC6 )
t.(LOOP) CELL FFE4 ( -> 6EAC )
t.;S
AT 6ECC

( LEGACY-FOUR-ITEM-FLAG | NFA 6ECC CFA 6ED1 )
( Inferred descriptive name, not recovered original: )
( Returns puzzle-state cell13, used as the latch by )
( retained four-item routine $6EE0; an active Wladcy quest )
( is not established. )
( Stack: -- addr )
AT 6ECC
( Header: flags, saved name and link )
BYTES 8200D79B6E
DOCOL
LIT8 0D t.PUZZLE-STATE-CELLS t.;S
AT 6EDA

( CHECK-LEGACY-FOUR-ITEM-QUEST | NFA 6EDA CFA 6EE0 )
( Inferred descriptive name, not recovered original: )
( Retained Klatwa-style code gates on rooms25..28, tests )
( four placed items, inserts $6E6E pairs, marks progress, )
( attempts to display resource49 as a message and sets )
( cell13. Wladcy initial room table ends at room24 and its )
( resource49 is picture data; this is not proven reachable )
( as a working quest. )
( Stack: -- )
AT 6EDA
( Header: flags, saved name and link )
BYTES 830000DACC6E
DOCOL
LIT8 18 t.CURRENT-ROOM t.@ LIT8 1D t.<=<
t.LEGACY-FOUR-ITEM-FLAG t.@ t.0=_12DE t.*
t.0BRANCH CELL 0089 ( -> 6F81 )
t.COUNT-LEGACY-PLACED-ITEMS LIT8 04 t.=
t.0BRANCH CELL 007E ( -> 6F81 )
LIT8 0A t.0 t.(DO)
( label 6F0C )
t.RETAINED-QUEST-OBJECT-PAIRS t.I t.+ t.DUP t.C@ t.SWAP t.1+
t.C@ t.0 t.ADD-SCENE-OBJECT t.DROP t.2
t.(+LOOP) CELL FFE6 ( -> 6F0C )
LIT8 0B t.PLAY-SOUND-EFFECT LIT8 08 t.MARK-ROOM-PROGRESS
LIT8 10 t.MARK-ROOM-PROGRESS t.FLASH-BACKGROUND t.LEAVE-VIEW
LIT8 31 t.SHOW-RESOURCE-MESSAGE t.CURRENT-ROOM t.@ LIT8 1C t.=
t.0BRANCH CELL 0010 ( -> 6F5B )
LIT8 82 t.0 t.DRAW-OBJECT-CHANGE LIT8 6B t.0
t.DRAW-OBJECT-CHANGE
( label 6F5B )
t.CURRENT-ROOM t.@ LIT8 19 t.=
t.0BRANCH CELL 0010 ( -> 6F76 )
LIT8 1F t.0 t.DRAW-OBJECT-CHANGE LIT8 07 t.0
t.DRAW-OBJECT-CHANGE
( label 6F76 )
t.1 t.LEGACY-FOUR-ITEM-FLAG t.! LIT8 05 t.PLAY-SOUND-EFFECT
( label 6F81 )
t.;S
AT 6F83

( OBJECT-FRAME-PARTS | NFA 6F83 CFA 6F89 )
( Inferred descriptive name, not recovered original: )
( Divides by100 and doubles the quotient: result is )
( remainder followed by 2*quotient. Used to split )
( decimal-encoded animation selectors; verified by )
( original-6502 boundary probes. )
( Stack: encoded -- object frame )
AT 6F83
( Header: flags, saved name and link )
BYTES 830000CDDA6E
DOCOL
LIT8 64 t./MOD t.2 t.* t.;S
AT 6F96

( ANIMATION-STOP-FLAG | NFA 6F96 CFA 6F9B )
( Inferred descriptive name, not recovered original: )
( Cleared by $6FE5, set by $6FB8 after joystick fire, and )
( tested to terminate the two-frame animation loop. )
AT 6F96
( Header: flags, saved name and link )
BYTES 8200D3836F
DOVAR
CELL 0000
AT 6F9F

( ANIMATION-FIRST-SELECTOR | NFA 6F9F CFA 6FA5 )
( Inferred descriptive name, not recovered original: Two )
( bytes storing the first selector's resource and doubled )
( frame quotient, written by $6FE5 after $6F89. )
AT 6F9F
( Header: flags, saved name and link )
BYTES 830000B1966F
DOVAR
CELL 0000
AT 6FA9

( ANIMATION-SECOND-SELECTOR | NFA 6FA9 CFA 6FAF )
( Inferred descriptive name, not recovered original: Two )
( bytes storing the second selector's resource and doubled )
( frame quotient, written by $6FE5 after $6F89. )
AT 6FA9
( Header: flags, saved name and link )
BYTES 830000B29F6F
DOVAR
CELL 0000
AT 6FB3

( WAIT-ANIMATION-OR-FIRE | NFA 6FB3 CFA 6FB8 )
( Inferred descriptive name, not recovered original: Waits )
( up to nine frames; a joystick press sets $6F9B, clears )
( text and exits the loop early. )
( Stack: -- )
AT 6FB3
( Header: flags, saved name and link )
BYTES 8200B1A96F
DOCOL
LIT8 09 t.0 t.(DO)
( label 6FC1 )
t.1 t.WAIT-FRAMES t.0 t.JOYSTICK-TRIGGER t.0=_12DE
t.0BRANCH CELL 000C ( -> 6FD9 )
t.1 t.ANIMATION-STOP-FLAG t.! t.CLEAR-TEXT-AREA t.LEAVE
( label 6FD9 )
t.(LOOP) CELL FFE6 ( -> 6FC1 )
t.;S
AT 6FDF

( ANIMATE-PAIR-UNTIL-FIRE | NFA 6FDF CFA 6FE5 )
( Inferred descriptive name, not recovered original: Splits )
( two selectors through $6F89 into $6FA5/$6FAF, alternates )
( their selected images with nine-frame waits and sound7, )
( and stops after joystick fire. )
( Stack: first second -- )
AT 6FDF
( Header: flags, saved name and link )
BYTES 830000D7B36F
DOCOL
t.OBJECT-FRAME-PARTS t.ANIMATION-SECOND-SELECTOR t.1+ t.C!
t.ANIMATION-SECOND-SELECTOR t.C! t.OBJECT-FRAME-PARTS
t.ANIMATION-FIRST-SELECTOR t.1+ t.C!
t.ANIMATION-FIRST-SELECTOR t.C! t.0 t.ANIMATION-STOP-FLAG t.!
t.WAIT-TRIGGER-RELEASE
( label 7007 )
LIT8 07 t.PLAY-SOUND-EFFECT t.ANIMATION-SECOND-SELECTOR t.C@
t.FETCH-RESOURCE t.ANIMATION-SECOND-SELECTOR t.1+ t.C@
t.DRAW-RESOURCE-PICTURE t.WAIT-ANIMATION-OR-FIRE
t.ANIMATION-FIRST-SELECTOR t.C@ t.FETCH-RESOURCE
t.ANIMATION-FIRST-SELECTOR t.1+ t.C@ t.DRAW-RESOURCE-PICTURE
t.WAIT-ANIMATION-OR-FIRE t.ANIMATION-STOP-FLAG t.@
t.0BRANCH CELL FFD5 ( -> 7007 )
t.WAIT-TRIGGER-RELEASE t.;S
AT 7038

( FINAL-ITEM-BYTE? | NFA 7038 CFA 703E )
( Inferred descriptive name, not recovered original: Reads )
( a byte and tests 211 < item <216 [IDs212..215] with <=<. )
( Used only by final room23 arrangement checks. )
( Stack: addr -- flag )
AT 7038
( Header: flags, saved name and link )
BYTES 830000CFDF6F
DOCOL
t.C@ LIT8 D3 t.SWAP LIT8 D8 t.<=< t.;S
AT 704E

( FINAL-CENTRAL-LIST-READY? | NFA 704E CFA 7054 )
( Inferred descriptive name, not recovered original: Counts )
( qualifying items in three bytes of room23/view1 and )
( succeeds only when exactly one is in the final-item range. )
( Stack: -- flag )
AT 704E
( Header: flags, saved name and link )
BYTES 830000C73870
DOCOL
t.0 LIT8 03 t.0 t.(DO)
( label 705F )
LIT8 17 t.1 t.ROOM-VIEW-OBJECTS t.3 t.+ t.I t.+
t.FINAL-ITEM-BYTE? t.+
t.(LOOP) CELL FFEB ( -> 705F )
t.1 t.= t.;S
AT 707C

( FINAL-SIDE-LISTS-READY? | NFA 707C CFA 7082 )
( Inferred descriptive name, not recovered original: Tests )
( the first object byte of room23/views2,3,4 and succeeds )
( when all three satisfy $703E. )
( Stack: -- flag )
AT 707C
( Header: flags, saved name and link )
BYTES 830000C34E70
DOCOL
t.0 LIT8 05 t.2 t.(DO)
( label 708D )
LIT8 17 t.I t.ROOM-VIEW-OBJECTS LIT8 03 t.+ t.FINAL-ITEM-BYTE?
t.+
t.(LOOP) CELL FFEE ( -> 708D )
LIT8 03 t.= t.;S
AT 70A8

( CHECK-FINAL-ARRANGEMENT | NFA 70A8 CFA 70AF )
( Inferred descriptive name, not recovered original: When )
( current room23 and both $7054/$7082 succeed, runs ending )
( messages and animation, starts audio sequence1 and loops )
( forever alternating resource images44/45. )
( Stack: -- )
AT 70A8
( Header: flags, saved name and link )
BYTES 84000000C37C70
DOCOL
t.CURRENT-ROOM t.@ LIT8 17 t.=
t.0BRANCH CELL 006B ( -> 7127 )
t.FINAL-CENTRAL-LIST-READY? t.FINAL-SIDE-LISTS-READY? t.*
t.0BRANCH CELL 0061 ( -> 7127 )
t.LEAVE-VIEW LIT8 0C LIT16 02C8 t.C! LIT8 87 t.0
t.DRAW-OBJECT-CHANGE t.0 LIT16 02C8 t.C! LIT8 05
t.PLAY-SOUND-EFFECT LIT8 32 t.WAIT-FRAMES LIT8 2E
t.SHOW-GAME-MESSAGE LIT8 87 LIT8 24 t.ANIMATE-PAIR-UNTIL-FIRE
LIT8 0E t.PLAY-SOUND-EFFECT LIT8 3D t.SHOW-GAME-MESSAGE t.1
t.SELECT-AUDIO-SEQUENCE
( label 7107 )
LIT8 2C t.FETCH-RESOURCE t.0 t.DRAW-RESOURCE-PICTURE LIT8 1C
t.WAIT-FRAMES LIT8 2D t.FETCH-RESOURCE t.0
t.DRAW-RESOURCE-PICTURE LIT8 18 t.WAIT-FRAMES
t.BRANCH CELL FFE2 ( -> 7107 )
( label 7127 )
t.;S
AT 7129

( INVENTORY-ITEM-XY | NFA 7129 CFA 7130 )
( Inferred descriptive name, not recovered original: )
( Subtracts202 from an inventory item ID and indexes its )
( mutable two-byte X/Y record through $55B4. )
( Stack: item -- addr )
AT 7129
( Header: flags, saved name and link )
BYTES 84000000D8A870
DOCOL
LIT8 CA t.- t.ITEM-POSITIONS t.;S
AT 713B

( ACT-DROP-ITEM | NFA 713B CFA 7140 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 03 correspond to ZOSTAW. Prompts for )
( an inventory item, moves its XY to the selected scene )
( position, removes it from inventory, adds it to the )
( current view, redraws, and checks both )
( delivery/final-arrangement puzzles. )
AT 713B
( Header: flags, saved name and link )
BYTES 8200B32971
DOCOL
t.MSG-WHAT t.2+ t.SHOW-MESSAGE t.CHOOSE-INVENTORY-ITEM t.-DUP
t.0BRANCH CELL 003E ( -> 718C )
t.>R LIT8 C9 t.CLEAR-TEXT-AREA t.HIT-ID>POSITION t.R
t.INVENTORY-ITEM-XY t.1+ t.C! t.R t.INVENTORY-ITEM-XY t.C! t.R
t.REMOVE-INVENTORY-ITEM t.1 t.REMOVE-CURRENT-OBJECT t.R
t.ADD-CURRENT-OBJECT t.REDRAW-CURRENT-VIEW LIT8 0C
t.PLAY-SOUND-EFFECT t.R> LIT8 DA t.=
t.0BRANCH CELL 0009 ( -> 718C )
t.0 LIT8 09 t.PUZZLE-STATE!
( label 718C )
t.CHECK-LEGACY-FOUR-ITEM-QUEST t.CHECK-FINAL-ARRANGEMENT t.;S
AT 7192

( TAKE-SELECTED-ITEM | NFA 7192 CFA 7197 )
( Inferred descriptive name, not recovered original: )
( Attempts to add $6535 to inventory; success removes it )
( from the scene, adds placeholder1, redraws and plays )
( sound17. Item218 also sets puzzle cell9; returns )
( success/failure. )
( Stack: -- flag )
AT 7192
( Header: flags, saved name and link )
BYTES 8200B43B71
DOCOL
t.SELECTED-OBJECT t.@ t.DUP t.ADD-INVENTORY-ITEM
t.0BRANCH CELL 0027 ( -> 71CA )
t.DUP LIT8 DA t.=
t.0BRANCH CELL 0009 ( -> 71B7 )
t.1 LIT8 09 t.PUZZLE-STATE!
( label 71B7 )
t.REMOVE-CURRENT-OBJECT t.1 t.ADD-CURRENT-OBJECT
t.REDRAW-CURRENT-VIEW LIT8 11 t.PLAY-SOUND-EFFECT t.1
t.BRANCH CELL 0008 ( -> 71D0 )
( label 71CA )
t.ERROR-SOUND t.DROP t.0
( label 71D0 )
t.;S
AT 71D2

( ACT-TAKE-ITEM | NFA 71D2 CFA 71D7 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 04 correspond to WEZ. Calls $7197 )
( and discards its success flag. )
AT 71D2
( Header: flags, saved name and link )
BYTES 8200B49271
DOCOL
t.TAKE-SELECTED-ITEM t.DROP t.;S
AT 71DF

( ACT-LOOK-CLOSER | NFA 71DF CFA 71E4 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 05 correspond to ZOBACZ. Enters the )
( view selected by object metadata byte1 and plays sound9. )
AT 71DF
( Header: flags, saved name and link )
BYTES 8200B5D271
DOCOL
t.OBJECT-META-1 t.ENTER-VIEW LIT8 09 t.PLAY-SOUND-EFFECT t.;S
AT 71F1

( ACT-DESCRIBE-ARG | NFA 71F1 CFA 71F6 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 06 correspond to CO TO. Plays )
( sound22 and displays message argument1. )
AT 71F1
( Header: flags, saved name and link )
BYTES 8200B6DF71
DOCOL
LIT8 16 t.PLAY-SOUND-EFFECT t.ACTION-ARG1 t.SHOW-GAME-MESSAGE
t.;S
AT 7203

( ACT-NEW-GAME | NFA 7203 CFA 7208 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 07 correspond to POCZATEK. Marks )
( play active, selects stage base2, loads initial resource )
( group4, starts audio0 and enters room1. )
AT 7203
( Header: flags, saved name and link )
BYTES 8200B7F171
DOCOL
t.CLEAR-TEXT-AREA t.1 t.LOAD-ITEM-ART-ENABLED t.! t.2
t.CURRENT-PART-GROUP t.! LIT16 0004 t.LOAD-PART-RESOURCES t.0
t.SELECT-AUDIO-SEQUENCE t.1 t.ENTER-ROOM t.;S
AT 7228

( MSG-ENCODED-DISK-GATE | NFA 7228 CFA 722D )
( Inferred descriptive name, not recovered original: )
( Counted purchase-original message; its first25 text bytes )
( are stored minus$26 and decoded by $7253 before the )
( copy-protection failure display. )
( Decoded text: Message lines )
( Decoded by adding $26 to first 25 bytes )
( line 1 $7233: CHCESZ GRAC KUPUJ ORYGINAL )
AT 7228
( Header: flags, saved name and link )
BYTES 8200A30372
DOVAR
BYTES 1C00011A1D221D1F2D3417212C1B3D17252F2A2F2417292C33212328
BYTES 1B6C
AT 724D

( DECODE-DISK-GATE-MESSAGE | NFA 724D CFA 7253 )
( Inferred descriptive name, not recovered original: Adds )
( $26 to each of the first25 bytes at $722D+4, decoding the )
( purchase-original message in place. )
( Stack: -- )
AT 724D
( Header: flags, saved name and link )
BYTES 830000AB2872
DOCOL
t.MSG-ENCODED-DISK-GATE LIT8 04 t.+ t.DUP LIT8 19 t.+ t.SWAP
t.(DO)
( label 7267 )
LIT8 26 t.I t.BYTE+!
t.(LOOP) CELL FFF7 ( -> 7267 )
t.;S
AT 7274

( DISK-CHECK-ARGS | NFA 7274 CFA 7279 )
( Inferred descriptive name, not recovered original: )
( Returns FIRST as the disk buffer and sector )
( $01F5+$0196=907. The caller also checks sector908. )
( Stack: -- buffer sector )
AT 7274
( Header: flags, saved name and link )
BYTES 8200C14D72
DOCOL
t.FIRST LIT16 01F5 LIT16 0196 t.+ t.;S
AT 7289

( DISK-GATE-LATCH | NFA 7289 CFA 728E )
( Inferred descriptive name, not recovered original: )
( Compared with33 by $7298 to suppress its failure flag. No )
( setter was found in the retained high-level dictionary; )
( no further use is inferred. )
AT 7289
( Header: flags, saved name and link )
BYTES 8200D37472
DOVAR
CELL 0000
AT 7292

( DISK-CHECK-FAILED? | NFA 7292 CFA 7298 )
( Inferred descriptive name, not recovered original: Reads )
( sectors907/908 with -DISK and combines their expected )
( differing status tests; suppresses the failure result )
( when $728E holds33. )
( Stack: -- flag )
AT 7292
( Header: flags, saved name and link )
BYTES 830000C38972
DOCOL
t.DISK-CHECK-ARGS t.1 t.1 t.-DISK t.0=_12DE t.0=_12DE
t.DISK-CHECK-ARGS t.1+ t.1 t.1 t.-DISK t.0=_12DE t.+ t.2 t.=
t.0=_12DE t.DISK-GATE-LATCH t.@ LIT8 21 t.= t.0=_12DE t.* t.;S
AT 72C9

( GAME-STATE-BYTES | NFA 72C9 CFA 72D0 )
( Inferred descriptive name, not recovered original: )
( Computes saved-state length as )
( address[$5876]+2-address[$5500]. )
( Stack: -- bytes )
AT 72C9
( Header: flags, saved name and link )
BYTES 84000000D09272
DOCOL
t.LAST-DIRECTION t.2+ t.SAVED-STATE-BASE t.- t.;S
AT 72DC

( GAME-STATE-SECTORS | NFA 72DC CFA 72E2 )
( Inferred descriptive name, not recovered original: )
( Returns GAME-STATE-BYTES/128+1 for save-game disk )
( transfers. )
( Stack: -- sectors )
AT 72DC
( Header: flags, saved name and link )
BYTES 830000CBC972
DOCOL
t.GAME-STATE-BYTES LIT16 0080 t./ t.1+ t.;S
AT 72F0

( READ-SAVE-GROUP | NFA 72F0 CFA 72F7 )
( Inferred descriptive name, not recovered original: )
( Selects load and banked-transfer modes, reads resource )
( group8 with logical destination0 and sector count20 via )
( $46BE, drops the preserved transfer arguments, then )
( clears banked-transfer mode. )
( Stack: -- )
AT 72F0
( Header: flags, saved name and link )
BYTES 84000000D0DC72
DOCOL
t.1 t.TRANSFER-IS-LOAD t.! t.1 t.BANKED-TRANSFER t.! t.0
LIT8 14 LIT8 08 t.TRY-GROUP-TRANSFER t.DROP t.2DROP t.0
t.BANKED-TRANSFER t.! t.;S
AT 731B

( RESUME-GAME-AUDIO | NFA 731B CFA 7320 )
( Inferred descriptive name, not recovered original: Starts )
( audio sequence0 only when sound state byte $5EEA is zero. )
( Stack: -- )
AT 731B
( Header: flags, saved name and link )
BYTES 8200D5F072
DOCOL
t.MUSIC-PAUSED t.C@ t.0=_12DE
t.0BRANCH CELL 0006 ( -> 7330 )
t.0 t.SELECT-AUDIO-SEQUENCE
( label 7330 )
t.;S
AT 7332

( CHECK-STAGE-DISK | NFA 7332 CFA 7338 )
( Inferred descriptive name, not recovered original: Only )
( for resource group6, invokes $7298; on failure )
( decodes/displays CHCESZ GRAC KUPUJ ORYGINAL and loops )
( forever. )
( Stack: group -- )
AT 7332
( Header: flags, saved name and link )
BYTES 830000D41B73
DOCOL
LIT8 06 t.=
t.0BRANCH CELL 0018 ( -> 7359 )
t.DISK-CHECK-FAILED?
t.0BRANCH CELL 0012 ( -> 7359 )
t.CLEAR-TEXT-AREA t.ERROR-SOUND t.DECODE-DISK-GATE-MESSAGE
t.MSG-ENCODED-DISK-GATE t.2+ t.SHOW-MESSAGE
( label 7355 )
t.BRANCH CELL FFFE ( -> 7355 )
( label 7359 )
t.;S
AT 735B

( ACT-LOAD-GAME | NFA 735B CFA 7360 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 08 correspond to ODCZYT. Stops )
( audio, reads save group8, restores the state block, )
( reloads the saved stage's resources, performs its disk )
( check, resumes audio and redraws the saved room; restores )
( darkness for the relevant state combination. )
AT 735B
( Header: flags, saved name and link )
BYTES 8200B83273
DOCOL
t.CLEAR-TEXT-AREA t.STOP-AUDIO t.READ-SAVE-GROUP
t.LAST-DISK-STATUS t.@ t.0=_12DE
t.0BRANCH CELL 004F ( -> 73BF )
t.SAVED-STATE-BASE t.0 t.GAME-STATE-BYTES t.FETCH-BANK-RANGE
t.1 t.LOAD-ITEM-ART-ENABLED t.! t.0 t.MUSIC-PAUSED t.!
t.CURRENT-PART-GROUP t.@ t.2+ t.DUP t.>R t.LOAD-PART-RESOURCES
t.R> t.CHECK-STAGE-DISK t.RESUME-GAME-AUDIO t.CURRENT-ROOM t.@
t.ENTER-ROOM LIT8 11 t.PUZZLE-STATE-CELLS t.@ LIT8 0F
t.PUZZLE-STATE-CELLS t.@ t.0=_12DE t.*
t.0BRANCH CELL 000D ( -> 73BF )
t.GAME-COLOR-TABLE t.SAVED-ROOM-COLORS LIT8 03 t.CMOVE
t.SET-DARK-ROOM-COLORS
( label 73BF )
t.;S
AT 73C1

( ACT-SAVE-GAME | NFA 73C1 CFA 73C6 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 09 correspond to ZAPIS. Writes the )
( game-state block with its computed sector count, )
( temporarily stopping audio/restoring the OS VBI, then )
( reinstalls game VBI/audio. )
AT 73C1
( Header: flags, saved name and link )
BYTES 8200B95B73
DOCOL
t.CLEAR-TEXT-AREA t.SAVED-STATE-BASE t.GAME-STATE-SECTORS
LIT8 08 t.STOP-AUDIO t.RESTORE-OS-VBI t.WRITE-RESOURCE-GROUP
t.INSTALL-GAME-VBI t.RESUME-GAME-AUDIO t.;S
AT 73DD

( START-SECOND-STAGE | NFA 73DD CFA 73E4 )
( Inferred descriptive name, not recovered original: Marks )
( game active, sets stage base4, loads resource group6 with )
( disk check, restores audio/VBI, resets46 bytes of item XY )
( data from $55F8 and enters room16. )
( Stack: -- )
AT 73DD
( Header: flags, saved name and link )
BYTES 84000000DAC173
DOCOL
t.CLEAR-TEXT-AREA t.1 t.LOAD-ITEM-ART-ENABLED t.! LIT8 04
t.CURRENT-PART-GROUP t.! t.STOP-AUDIO t.RESTORE-OS-VBI
LIT16 0006 t.LOAD-PART-RESOURCES LIT8 06 t.CHECK-STAGE-DISK
t.INSTALL-GAME-VBI t.RESUME-GAME-AUDIO t.0
t.PART2-ITEM-POSITIONS t.0 t.ITEM-POSITIONS LIT8 2E t.CMOVE
LIT8 10 t.ENTER-ROOM t.;S
AT 741C

( SUCCESS-SOUND | NFA 741C CFA 7423 )
( Inferred descriptive name, not recovered original: Calls )
( sound dispatcher $5F9C with command14; used after )
( successful object interactions. )
( Stack: -- )
AT 741C
( Header: flags, saved name and link )
BYTES 84000000DADD73
DOCOL
LIT8 0E t.PLAY-SOUND-EFFECT t.;S
AT 742C

( ACT-SHOW-POWERS | NFA 742C CFA 7432 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 0A correspond to alias75 ZNISZCZ. )
( Actual body displays $603C SPIS MOCY, waits for a )
( key/fire and clears the text. The misleading aliased )
( label is not used to infer its role. )
AT 742C
( Header: flags, saved name and link )
BYTES 830000B01C74
DOCOL
t.1 t.PLAY-SOUND-EFFECT t.CLEAR-TEXT-AREA t.SHOW-POWER-LIST
t.WAIT-KEY-OR-FIRE t.CLEAR-TEXT-AREA t.;S
AT 7442

( ACT-SHOW-INVENTORY | NFA 7442 CFA 7448 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 0B correspond to unresolved alias82. )
( Actual body displays inventory through $5BFC, waits for )
( key/fire and restores the prior view through $5C3A. )
AT 7442
( Header: flags, saved name and link )
BYTES 830000B12C74
DOCOL
t.CLEAR-TEXT-AREA t.ENTER-INVENTORY-VIEW LIT8 10
t.PLAY-SOUND-EFFECT t.WAIT-KEY-OR-FIRE t.LEAVE-INVENTORY-VIEW
t.;S
AT 7459

( ACT-ENTER-LINKED-ROOM | NFA 7459 CFA 745F )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 0C,0D,0E,0F correspond to WEJDZ; IDZ )
( W PRAWO; IDZ W TYL; IDZ W LEWO. Enters the room stored in )
( object metadata byte0. )
AT 7459
( Header: flags, saved name and link )
BYTES 830000B54274
DOCOL
t.OBJECT-META-0 t.ENTER-ROOM t.;S
AT 7467

( ACT-OPEN-SCENE-OBJECT | NFA 7467 CFA 746D )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 10 correspond to OTWORZ. Removes )
( metadata object0 and argument2, adds argument3, redraws )
( argument1 plus argument3 and plays success sound. )
AT 7467
( Header: flags, saved name and link )
BYTES 830000B65974
DOCOL
t.OBJECT-META-0 t.REMOVE-CURRENT-OBJECT t.ACTION-ARG2
t.REMOVE-CURRENT-OBJECT t.ACTION-ARG3 t.ADD-CURRENT-OBJECT
t.ACTION-ARG1 t.ACTION-ARG3 t.DRAW-OBJECT-CHANGE
t.SUCCESS-SOUND t.;S
AT 7485

( ACT-CLOSE-SCENE-OBJECT | NFA 7485 CFA 748B )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 11 correspond to ZAMKNIJ. Removes )
( argument2, adds argument3 and metadata object0, redraws )
( argument1 with both overlays and plays success sound. )
AT 7485
( Header: flags, saved name and link )
BYTES 830000B76774
DOCOL
t.ACTION-ARG2 t.REMOVE-CURRENT-OBJECT t.ACTION-ARG3
t.ADD-CURRENT-OBJECT t.OBJECT-META-0 t.ADD-CURRENT-OBJECT
t.ACTION-ARG1 t.ACTION-ARG3 t.OBJECT-META-0
t.DRAW-TWO-OVERLAYS t.SUCCESS-SOUND t.;S
AT 74A5

( LEARN-POWER | NFA 74A5 CFA 74AD )
( Inferred descriptive name, not recovered original: )
( Prepares a matching/free power slot through $6294, )
( adjusts its two requirement bytes by200, types the power )
( name into the list with sound18, waits for input, and )
( awards mission bit64. A retained extra caller cell is )
( dropped at the end. )
AT 74A5
( Header: flags, saved name and link )
BYTES 8500000000A18574
DOCOL
t.1+ t.PREPARE-POWER-SLOT LIT8 C8 t.POWER-TEXT-POINTERS t.2+
t.@ LIT16 0004 t.- t.2DUP t.BYTE+! t.1+ t.BYTE+!
t.CLEAR-TEXT-AREA t.SHOW-POWER-LIST t.POWER-TEXT-POINTERS t.@
t.C@ t.0 t.(DO)
( label 74D8 )
t.2 t.WAIT-FRAMES LIT8 12 t.PLAY-SOUND-EFFECT
t.POWER-TEXT-POINTERS t.@ t.1+ t.I t.+ t.C@
t.POWER-TEXT-POINTERS t.2+ t.@ t.I t.+ t.C! t.SHOW-POWER-LIST
t.(LOOP) CELL FFDB ( -> 74D8 )
t.WAIT-KEY-OR-FIRE t.CLEAR-TEXT-AREA LIT8 40
t.MARK-ROOM-PROGRESS t.DROP t.;S
AT 750C

( MSG-POWER-RELEASED | NFA 750C CFA 7511 )
( Inferred descriptive name, not recovered original: )
( Counted message UWOLNILES MOC, shown by $752B before )
( copying a newly released power into the power list. )
( Decoded text: Message lines )
( line 1 $7517: UWOLNILES MOC )
AT 750C
( Header: flags, saved name and link )
BYTES 8200C3A574
DOVAR
BYTES 0F00010D55574F4C4E496C45733D4D4F43
AT 7524

( SHOW-POWER-RELEASED | NFA 7524 CFA 752B )
( Inferred descriptive name, not recovered original: Plays )
( sound2 and displays UWOLNILES MOC [you released a power] )
( from $7511. )
( Stack: -- )
AT 7524
( Header: flags, saved name and link )
BYTES 84000000C30C75
DOCOL
t.MSG-POWER-RELEASED t.2+ t.2 t.PLAY-SOUND-EFFECT
t.SHOW-MESSAGE t.;S
AT 7539

( ACT-BREAK-RELEASE-POWER | NFA 7539 CFA 753F )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 12 correspond to ROZBIJ. Removes the )
( selected object, redraws, announces a released power and )
( learns its inline record beginning after action argument1. )
AT 7539
( Header: flags, saved name and link )
BYTES 830000B82475
DOCOL
t.SELECTED-OBJECT t.@ t.REMOVE-CURRENT-OBJECT
t.REDRAW-CURRENT-VIEW t.1 t.ACTION-BYTE-ADDR
t.SHOW-POWER-RELEASED t.WAIT-KEY-OR-FIRE t.1
t.ACTION-BYTE-ADDR t.LEARN-POWER t.;S
AT 7559

( ACT-REVEAL-RELEASE-POWER | NFA 7559 CFA 755F )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 13 correspond to ZNISZCZ. Adds/draws )
( argument1, announces a released power and learns its )
( inline record. )
AT 7559
( Header: flags, saved name and link )
BYTES 830000B93975
DOCOL
t.ACTION-ARG1 t.ADD-CURRENT-OBJECT t.ACTION-ARG1 t.0
t.DRAW-OBJECT-CHANGE t.1 t.ACTION-BYTE-ADDR
t.SHOW-POWER-RELEASED t.WAIT-KEY-OR-FIRE t.1
t.ACTION-BYTE-ADDR t.LEARN-POWER t.;S
AT 757B

( MSG-WRONG-ITEM | NFA 757B CFA 7580 )
( Inferred descriptive name, not recovered original: )
( Counted message TYM NIE MOZESZ, displayed by $75B8 for an )
( incorrect selected inventory item. )
( Decoded text: Message lines )
( line 1 $7586: TYM NIE )
( line 2 $758E: MOZESZ )
AT 757B
( Header: flags, saved name and link )
BYTES 8200CE5975
DOVAR
BYTES 1000020754594D3D4E4945064D4F7A45535A20202020
AT 7598

( MSG-WITH-WHAT | NFA 7598 CFA 759D )
( Inferred descriptive name, not recovered original: )
( Counted prompt CZYM? [with what?], displayed by $75B8 )
( before item selection. )
( Decoded text: Message lines )
( line 1 $75A3: CZYM? )
AT 7598
( Header: flags, saved name and link )
BYTES 8200D97B75
DOVAR
BYTES 07000105435A594D3F20
AT 75A9

( LAST-CHOSEN-ITEM | NFA 75A9 CFA 75AE )
( Inferred descriptive name, not recovered original: Stores )
( the inventory result chosen in $75B8; $7ABF checks it to )
( select an alternate interaction reply. )
AT 75A9
( Header: flags, saved name and link )
BYTES 8200D29875
DOVAR
CELL 0000
AT 75B2

( CHOOSE-REQUIRED-ITEM | NFA 75B2 CFA 75B8 )
( Inferred descriptive name, not recovered original: )
( Requirement0 succeeds immediately. Otherwise displays )
( CZYM?, asks for an inventory item, saves it at $75AE, and )
( compares it with requirement+200; wrong nonzero choices )
( display TYM NIE MOZESZ. )
( Stack: requirement -- flag )
AT 75B2
( Header: flags, saved name and link )
BYTES 830000DAA975
DOCOL
t.DUP LIT8 C8 t.+ t.>R
t.0BRANCH CELL 0032 ( -> 75F7 )
t.CLEAR-TEXT-AREA t.MSG-WITH-WHAT t.2+ t.SHOW-MESSAGE
t.CHOOSE-INVENTORY-ITEM t.DUP t.LAST-CHOSEN-ITEM t.! t.DUP
t.0BRANCH CELL 0018 ( -> 75F3 )
t.R t.= t.DUP t.0=_12DE
t.0BRANCH CELL 000C ( -> 75F3 )
t.CLEAR-TEXT-AREA t.ERROR-SOUND t.MSG-WRONG-ITEM t.2+
t.SHOW-MESSAGE
( label 75F3 )
t.BRANCH CELL 0004 ( -> 75F9 )
( label 75F7 )
t.1
( label 75F9 )
t.R> t.DROP t.;S
AT 75FF

( REPLACEMENT-OBJECT | NFA 75FF CFA 7605 )
( Inferred descriptive name, not recovered original: )
( Temporary object ID set by $760F and consumed by shared )
( open/replace action helpers. )
AT 75FF
( Header: flags, saved name and link )
BYTES 830000D7B275
DOVAR
CELL 0000
AT 7609

( REPLACEMENT-OBJECT! | NFA 7609 CFA 760F )
( Inferred descriptive name, not recovered original: Stores )
( the replacement/overlay object ID in temporary $7605 for )
( shared action helpers. )
( Stack: object -- )
AT 7609
( Header: flags, saved name and link )
BYTES 830000A1FF75
DOCOL
t.REPLACEMENT-OBJECT t.! t.;S
AT 7617

( APPLY-OPEN-RESULT | NFA 7617 CFA 761D )
( Inferred descriptive name, not recovered original: On )
( true, adds action argument1 to the scene, awards progress )
( bit2, redraws it with replacement $7605 and plays success )
( sound. )
( Stack: flag -- )
AT 7617
( Header: flags, saved name and link )
BYTES 830000D40976
DOCOL
t.0BRANCH CELL 0016 ( -> 7637 )
t.CLEAR-TEXT-AREA t.ACTION-ARG1 t.ADD-CURRENT-OBJECT
t.ACTION-ARG1 t.2 t.MARK-ROOM-PROGRESS t.REPLACEMENT-OBJECT
t.@ t.DRAW-OBJECT-CHANGE t.SUCCESS-SOUND
( label 7637 )
t.;S
AT 7639

( ACT-OPEN-WITH-ITEM | NFA 7639 CFA 763F )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 14,1C,38,4B,4E correspond to OTWORZ; )
( PRZEBIJ; ZNISZCZ; ROZBIJ. Clears replacement object, )
( requires object metadata byte1's inventory item, then )
( applies the shared open result $761D. )
AT 7639
( Header: flags, saved name and link )
BYTES 830000B01776
DOCOL
t.0 t.REPLACEMENT-OBJECT! t.OBJECT-META-1
t.CHOOSE-REQUIRED-ITEM t.APPLY-OPEN-RESULT t.;S
AT 764D

( MARK-PROGRESS-BIT8 | NFA 764D CFA 7653 )
( Inferred descriptive name, not recovered original: Awards )
( per-room mission mask8 through $6A4E. )
( Stack: -- )
AT 764D
( Header: flags, saved name and link )
BYTES 830000D23976
DOCOL
LIT8 08 t.MARK-ROOM-PROGRESS t.;S
AT 765C

( ACT-OPEN-WITH-POWER | NFA 765C CFA 7662 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 15 correspond to UZYJ MOCY. Clears )
( replacement object, selects the power in object metadata )
( byte0 and applies $761D if successful. )
AT 765C
( Header: flags, saved name and link )
BYTES 830000B14D76
DOCOL
t.0 t.REPLACEMENT-OBJECT! t.OBJECT-META-0
t.SELECT-REQUIRED-POWER t.APPLY-OPEN-RESULT t.;S
AT 7670

( APPLY-REPLACE-RESULT | NFA 7670 CFA 7677 )
( Inferred descriptive name, not recovered original: On )
( true, adds replacement $7605, redraws argument1 with it, )
( removes argument2, and awards progress bit4. )
( Stack: flag -- )
AT 7670
( Header: flags, saved name and link )
BYTES 84000000D45C76
DOCOL
t.0BRANCH CELL 0019 ( -> 7694 )
t.CLEAR-TEXT-AREA t.ACTION-ARG1 t.REPLACEMENT-OBJECT t.@ t.DUP
t.ADD-CURRENT-OBJECT t.DRAW-OBJECT-CHANGE t.ACTION-ARG2
t.REMOVE-CURRENT-OBJECT LIT8 04 t.MARK-ROOM-PROGRESS
( label 7694 )
t.;S
AT 7696

( APPLY-STATEFUL-REPLACE | NFA 7696 CFA 769C )
( Inferred descriptive name, not recovered original: Runs )
( $7677 and, on success, writes1 to the puzzle-state cell )
( selected by object metadata byte2 and plays sound2. )
( Stack: flag -- )
AT 7696
( Header: flags, saved name and link )
BYTES 830000B27076
DOCOL
t.DUP t.APPLY-REPLACE-RESULT
t.0BRANCH CELL 000C ( -> 76B0 )
t.1 t.OBJECT-META-2 t.PUZZLE-STATE! t.2 t.PLAY-SOUND-EFFECT
( label 76B0 )
t.;S
AT 76B2

( ACT-DESTROY-WITH-ITEM | NFA 76B2 CFA 76B8 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 16 correspond to ZNISZCZ. Requires )
( metadata byte1's item and calls $769C, replacing scene )
( graphics and setting the state selected by metadata byte2. )
AT 76B2
( Header: flags, saved name and link )
BYTES 830000B29676
DOCOL
t.0 t.REPLACEMENT-OBJECT! t.OBJECT-META-1
t.CHOOSE-REQUIRED-ITEM t.APPLY-STATEFUL-REPLACE t.;S
AT 76C6

( OPEN-WHEN-STATE4 | NFA 76C6 CFA 76CC )
( Inferred descriptive name, not recovered original: Reads )
( the state selected by object metadata byte1. Only value4 )
( applies $7677 and a success sound; other values choose an )
( error-message byte relative to object metadata. )
( Stack: -- )
AT 76C6
( Header: flags, saved name and link )
BYTES 830000B3B276
DOCOL
t.OBJECT-META-1 t.PUZZLE-STATE@ t.DUP LIT16 0004 t.=
t.APPLY-REPLACE-RESULT t.DUP LIT8 04 t.=
t.0BRANCH CELL 000A ( -> 76EF )
t.DROP t.SUCCESS-SOUND
t.BRANCH CELL 000C ( -> 76F9 )
( label 76EF )
t.SELECTED-OBJECT-META t.+ t.2+ t.C@ t.SHOW-ACTION-ERROR
( label 76F9 )
t.;S
AT 76FB

( ACT-OPEN-AT-STATE4 | NFA 76FB CFA 7701 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 17 correspond to OTWORZ. Clears )
( replacement object and runs $76CC, which opens only when )
( the selected puzzle state equals4. )
AT 76FB
( Header: flags, saved name and link )
BYTES 830000B3C676
DOCOL
t.0 t.REPLACEMENT-OBJECT! t.OPEN-WHEN-STATE4 t.;S
AT 770B

( ACT-CLOSE-AND-DARKEN | NFA 770B CFA 7711 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 18 correspond to ZAMKNIJ. Adds )
( argument1 and sets state argument6=1; if state argument3 )
( is zero, also adds argument4, installs dark colors and )
( displays argument5's message. )
AT 770B
( Header: flags, saved name and link )
BYTES 830000B4FB76
DOCOL
t.ACTION-ARG1 t.DUP t.ADD-CURRENT-OBJECT t.ACTION-ARG3
t.PUZZLE-STATE@ t.1 t.ACTION-ARG6 t.PUZZLE-STATE!
t.0BRANCH CELL 000C ( -> 7731 )
t.0 t.DRAW-OBJECT-CHANGE t.SUCCESS-SOUND
t.BRANCH CELL 0012 ( -> 7741 )
( label 7731 )
t.ACTION-ARG4 t.DUP t.ADD-CURRENT-OBJECT t.DRAW-OBJECT-CHANGE
t.SET-DARK-ROOM-COLORS t.SUCCESS-SOUND t.ACTION-ARG5
t.SHOW-GAME-MESSAGE
( label 7741 )
t.;S
AT 7743

( ACT-OPEN-RESTORE-LIGHT | NFA 7743 CFA 7749 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 19 correspond to OTWORZ. Runs the )
( ordinary open-object handler, restores room colors and )
( clears state argument4. )
AT 7743
( Header: flags, saved name and link )
BYTES 830000B50B77
DOCOL
t.ACT-OPEN-SCENE-OBJECT t.RESTORE-ROOM-COLORS t.0
t.ACTION-ARG4 t.PUZZLE-STATE! t.;S
AT 7757

( ACT-OPEN-STATE4-OVERLAY | NFA 7757 CFA 775D )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 1A correspond to OTWORZ. Sets )
( replacement object from argument3, then runs the state4 )
( gate $76CC. )
AT 7757
( Header: flags, saved name and link )
BYTES 830000B64377
DOCOL
t.ACTION-ARG3 t.REPLACEMENT-OBJECT! t.OPEN-WHEN-STATE4 t.;S
AT 7767

( ACT-BURY-IN-ROOM-RANGE | NFA 7767 CFA 776D )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 1B correspond to ZAKOP. Requires )
( action byte8's inventory item; allows the selected object )
( to be buried only in the strict argument1 < room < )
( argument2 interval or exact room argument3, then removes )
( it and sets the prescribed state. )
AT 7767
( Header: flags, saved name and link )
BYTES 830000B75777
DOCOL
LIT8 08 t.ACTION-BYTE@ t.CHOOSE-REQUIRED-ITEM
t.0BRANCH CELL 0036 ( -> 77AE )
t.ACTION-ARG1 t.CURRENT-ROOM t.@ t.ACTION-ARG2 t.<=<
t.ACTION-ARG3 t.CURRENT-ROOM t.@ t.= t.+
t.0BRANCH CELL 001A ( -> 77AA )
t.SELECTED-OBJECT t.@ t.REMOVE-CURRENT-OBJECT
t.REDRAW-CURRENT-VIEW t.SUCCESS-SOUND t.ACTION-ARG5
t.SHOW-GAME-MESSAGE t.ACTION-ARG6 t.ACTION-ARG7
t.PUZZLE-STATE!
t.BRANCH CELL 0006 ( -> 77AE )
( label 77AA )
t.ACTION-ARG4 t.SHOW-ACTION-ERROR
( label 77AE )
t.;S
AT 77B0

( TAKE-ACTION-ITEM | NFA 77B0 CFA 77B6 )
( Inferred descriptive name, not recovered original: Adds )
( action argument3 to inventory; on success removes )
( argument2, draws argument1, awards progress bit32 and )
( stores argument4 into puzzle-state argument5. )
( Stack: -- flag )
AT 77B0
( Header: flags, saved name and link )
BYTES 830000B26777
DOCOL
t.ACTION-ARG3 t.ADD-INVENTORY-ITEM t.DUP
t.0BRANCH CELL 0017 ( -> 77D7 )
t.ACTION-ARG2 t.REMOVE-CURRENT-OBJECT t.ACTION-ARG1 t.0
t.DRAW-OBJECT-CHANGE LIT8 20 t.MARK-ROOM-PROGRESS
t.ACTION-ARG4 t.ACTION-ARG5 t.PUZZLE-STATE!
( label 77D7 )
t.;S
AT 77D9

( ACT-TAKE-SET-STATE | NFA 77D9 CFA 77DF )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 20 correspond to WEZ. Runs $77B6 to )
( take argument3 and update state, then plays sound17 on )
( success. )
AT 77D9
( Header: flags, saved name and link )
BYTES 830000B2B077
DOCOL
t.TAKE-ACTION-ITEM
t.0BRANCH CELL 0007 ( -> 77EC )
LIT8 11 t.PLAY-SOUND-EFFECT
( label 77EC )
t.;S
AT 77EE

( ACT-BREAK-OFF-ITEM | NFA 77EE CFA 77F4 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 21 correspond to ODLAM. Runs the )
( same take/state helper $77B6, playing sound2 on success. )
AT 77EE
( Header: flags, saved name and link )
BYTES 830000B3D977
DOCOL
t.TAKE-ACTION-ITEM
t.0BRANCH CELL 0006 ( -> 7800 )
t.2 t.PLAY-SOUND-EFFECT
( label 7800 )
t.;S
AT 7802

( ACT-WEAR-SET-STATE | NFA 7802 CFA 7808 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 25 correspond to UBIERZ. Removes )
( argument1 from the scene, redraws, plays sound1, displays )
( argument2 and stores argument3 into state argument4. )
AT 7802
( Header: flags, saved name and link )
BYTES 830000B7EE77
DOCOL
t.ACTION-ARG1 t.REMOVE-CURRENT-OBJECT t.REDRAW-CURRENT-VIEW
t.CLEAR-TEXT-AREA t.1 t.PLAY-SOUND-EFFECT t.ACTION-ARG2
t.SHOW-GAME-MESSAGE t.ACTION-ARG3 t.ACTION-ARG4
t.PUZZLE-STATE! t.;S
AT 7822

( ACT-REPLACE-WITH-POWER | NFA 7822 CFA 7828 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 26 correspond to UZYJ MOCY. Sets )
( replacement object from metadata byte1, selects metadata )
( byte0's power and applies the stateful replacement helper )
( $769C. )
AT 7822
( Header: flags, saved name and link )
BYTES 830000B80278
DOCOL
t.OBJECT-META-1 t.REPLACEMENT-OBJECT! t.OBJECT-META-0
t.SELECT-REQUIRED-POWER t.APPLY-STATEFUL-REPLACE t.;S
AT 7836

( ACT-TAKE-SET-TWO-STATES | NFA 7836 CFA 783C )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 27 correspond to WEZ. After )
( successful ordinary take, stores arguments1 and3 into )
( state cells selected by arguments2 and4. )
AT 7836
( Header: flags, saved name and link )
BYTES 830000B92278
DOCOL
t.TAKE-SELECTED-ITEM
t.0BRANCH CELL 000E ( -> 7850 )
t.ACTION-ARG1 t.ACTION-ARG2 t.PUZZLE-STATE! t.ACTION-ARG3
t.ACTION-ARG4 t.PUZZLE-STATE!
( label 7850 )
t.;S
AT 7852

( ACT-SMEAR-WITH-ITEM | NFA 7852 CFA 7858 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 28 correspond to POSMARUJ. Requires )
( argument1's item; if state argument5 is below argument4, )
( inserts argument2 in current room/view argument3 and )
( raises the state; otherwise displays argument7's message. )
AT 7852
( Header: flags, saved name and link )
BYTES 830000B03678
DOCOL
t.ACTION-ARG1 t.CHOOSE-REQUIRED-ITEM
t.0BRANCH CELL 0035 ( -> 7895 )
t.CLEAR-TEXT-AREA t.ACTION-ARG5 t.PUZZLE-STATE@ t.ACTION-ARG4
t.<
t.0BRANCH CELL 0020 ( -> 788E )
t.ACTION-ARG2 t.CURRENT-ROOM t.@ t.ACTION-ARG3
t.ADD-SCENE-OBJECT t.DROP t.ACTION-ARG4 t.ACTION-ARG5
t.PUZZLE-STATE! t.SUCCESS-SOUND t.ACTION-ARG6
t.SHOW-GAME-MESSAGE t.MARK-PROGRESS-BIT8
t.BRANCH CELL 0009 ( -> 7895 )
( label 788E )
LIT8 07 t.ACTION-BYTE@ t.SHOW-GAME-MESSAGE
( label 7895 )
t.;S
AT 7897

( ACT-FEED-DOGS | NFA 7897 CFA 789D )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 29 correspond to NAKARM PSY. )
( Requires metadata byte1's item, applies the open result, )
( consumes that inventory item and displays argument2 with )
( success sound. )
AT 7897
( Header: flags, saved name and link )
BYTES 830000B15278
DOCOL
t.0 t.REPLACEMENT-OBJECT! t.OBJECT-META-1
t.CHOOSE-REQUIRED-ITEM t.DUP t.APPLY-OPEN-RESULT
t.0BRANCH CELL 0011 ( -> 78BE )
t.OBJECT-META-1 LIT8 C8 t.+ t.REMOVE-INVENTORY-ITEM
t.ACTION-ARG2 t.SHOW-GAME-MESSAGE t.SUCCESS-SOUND
( label 78BE )
t.;S
AT 78C0

( ACT-OPEN-TWO-OBJECTS | NFA 78C0 CFA 78C6 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 2A correspond to OTWORZ. Requires )
( metadata byte1's item, inserts argument1 and metadata )
( byte2, redraws the view and plays success sound. )
AT 78C0
( Header: flags, saved name and link )
BYTES 830000B29778
DOCOL
t.OBJECT-META-1 t.CHOOSE-REQUIRED-ITEM
t.0BRANCH CELL 0010 ( -> 78DE )
t.ACTION-ARG1 t.ADD-CURRENT-OBJECT t.OBJECT-META-2
t.ADD-CURRENT-OBJECT t.CLEAR-TEXT-AREA t.REDRAW-CURRENT-VIEW
t.SUCCESS-SOUND
( label 78DE )
t.;S
AT 78E0

( REPLACE-SELECTED-ITEM | NFA 78E0 CFA 78E6 )
( Inferred descriptive name, not recovered original: )
( Removes the selected scene object, copies its XY record )
( to argument2, inserts argument2, redraws the view and )
( plays sound5. )
( Stack: -- )
AT 78E0
( Header: flags, saved name and link )
BYTES 830000CDC078
DOCOL
t.SELECTED-OBJECT t.@ t.DUP t.REMOVE-CURRENT-OBJECT
t.INVENTORY-ITEM-XY t.@ t.ACTION-ARG2 t.INVENTORY-ITEM-XY t.!
t.ACTION-ARG2 t.ADD-CURRENT-OBJECT t.REDRAW-CURRENT-VIEW
LIT8 05 t.PLAY-SOUND-EFFECT t.;S
AT 7907

( ACT-TRANSFORM-WITH-POWER | NFA 7907 CFA 790D )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 2B correspond to UZYJ MOCY. Requires )
( power argument1 and, on success, replaces the selected )
( item with argument2 while preserving its XY. )
AT 7907
( Header: flags, saved name and link )
BYTES 830000B3E078
DOCOL
t.ACTION-ARG1 t.SELECT-REQUIRED-POWER
t.0BRANCH CELL 0006 ( -> 791B )
t.CLEAR-TEXT-AREA t.REPLACE-SELECTED-ITEM
( label 791B )
t.;S
AT 791D

( ACT-LIGHT-WITH-ITEM | NFA 791D CFA 7923 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 2D correspond to ZAPAL. Requires )
( argument1's item and state argument7; replaces the )
( selected item and may update room-specific state, remove )
( darkness-related objects and restore room colors. )
AT 791D
( Header: flags, saved name and link )
BYTES 830000B50779
DOCOL
t.ACTION-ARG1 t.CHOOSE-REQUIRED-ITEM
t.0BRANCH CELL 0049 ( -> 7974 )
t.ACTION-ARG7 t.PUZZLE-STATE@
t.0BRANCH CELL 003D ( -> 7970 )
t.CLEAR-TEXT-AREA t.REPLACE-SELECTED-ITEM t.CURRENT-ROOM t.@
t.ACTION-ARG4 t.=
t.0BRANCH CELL 0029 ( -> 796C )
t.ACTION-ARG5 t.ACTION-ARG6 t.PUZZLE-STATE! LIT8 11
t.PUZZLE-STATE@
t.0BRANCH CELL 0018 ( -> 796A )
t.P t.>R t.LEAVE-VIEW LIT8 9E t.0 t.DRAW-OBJECT-CHANGE LIT8 3C
t.REMOVE-CURRENT-OBJECT t.R> t.ENTER-VIEW
( label 796A )
t.RESTORE-ROOM-COLORS
( label 796C )
t.BRANCH CELL 0006 ( -> 7974 )
( label 7970 )
t.ACTION-ARG3 t.SHOW-ACTION-ERROR
( label 7974 )
t.;S
AT 7976

( ACT-EXTINGUISH | NFA 7976 CFA 797C )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 1D correspond to ZGAS. Replaces the )
( selected item through $78E6, updates state argument3 and, )
( when state argument4 is set, installs dark colors and )
( displays argument5. )
AT 7976
( Header: flags, saved name and link )
BYTES 830000B91D79
DOCOL
t.REPLACE-SELECTED-ITEM t.ACTION-ARG1 t.ACTION-ARG3
t.PUZZLE-STATE! t.ACTION-ARG4 t.PUZZLE-STATE@
t.0BRANCH CELL 0008 ( -> 7994 )
t.SET-DARK-ROOM-COLORS t.ACTION-ARG5 t.SHOW-GAME-MESSAGE
( label 7994 )
t.;S
AT 7996

( ACT-REFUSE-TAKE | NFA 7996 CFA 799C )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 1E correspond to WEZ. Shows action )
( argument1 as an error message without taking anything. )
AT 7996
( Header: flags, saved name and link )
BYTES 830000B07679
DOCOL
t.ACTION-ARG1 t.SHOW-ACTION-ERROR t.;S
AT 79A4

( ACT-DESCRIBE-METADATA | NFA 79A4 CFA 79AA )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 2E correspond to CO TO. Plays )
( sound22 and displays the message stored in object )
( metadata byte0. )
AT 79A4
( Header: flags, saved name and link )
BYTES 830000B69679
DOCOL
LIT8 16 t.PLAY-SOUND-EFFECT t.OBJECT-META-0
t.SHOW-GAME-MESSAGE t.;S
AT 79B7

( STATE-WITH-READ-SOUND | NFA 79B7 CFA 79BD )
( Inferred descriptive name, not recovered original: )
( Fetches a puzzle-state cell, plays error sound for zero )
( or sound22 for nonzero, and leaves the value for message )
( selection. )
( Stack: state-index -- value )
AT 79B7
( Header: flags, saved name and link )
BYTES 830000B7A479
DOCOL
t.PUZZLE-STATE@ t.DUP t.0=_12DE
t.0BRANCH CELL 0008 ( -> 79CF )
t.ERROR-SOUND
t.BRANCH CELL 0007 ( -> 79D4 )
( label 79CF )
LIT8 16 t.PLAY-SOUND-EFFECT
( label 79D4 )
t.;S
AT 79D6

( ACT-READ-METADATA-STATE | NFA 79D6 CFA 79DC )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 2F correspond to PRZECZYTAJ. Reads )
( state selected by metadata byte0, plays the )
( state-dependent read sound and chooses a message at )
( metadata+state+1. )
AT 79D6
( Header: flags, saved name and link )
BYTES 830000B7B779
DOCOL
t.OBJECT-META-0 t.STATE-WITH-READ-SOUND t.SELECTED-OBJECT-META
t.+ t.1+ t.C@ t.SHOW-GAME-MESSAGE t.;S
AT 79EE

( ACT-READ-ACTION-STATE | NFA 79EE CFA 79F4 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 30 correspond to PRZECZYTAJ. Reads )
( state selected by argument1 and chooses the message byte )
( at action payload state+2. )
AT 79EE
( Header: flags, saved name and link )
BYTES 830000B8D679
DOCOL
t.ACTION-ARG1 t.STATE-WITH-READ-SOUND t.2 t.+ t.ACTION-BYTE@
t.SHOW-GAME-MESSAGE t.;S
AT 7A04

( ACT-ENTER-WITH-POWER | NFA 7A04 CFA 7A0A )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 31 correspond to UZYJ MOCY. Requires )
( power argument1, enters metadata byte0's room and marks )
( progress bit8. )
AT 7A04
( Header: flags, saved name and link )
BYTES 830000B9EE79
DOCOL
t.ACTION-ARG1 t.SELECT-REQUIRED-POWER
t.0BRANCH CELL 0008 ( -> 7A1A )
t.OBJECT-META-0 t.ENTER-ROOM t.MARK-PROGRESS-BIT8
( label 7A1A )
t.;S
AT 7A1C

( SHOW-ANIMATED-REPLY | NFA 7A1C CFA 7A22 )
( Inferred descriptive name, not recovered original: Clears )
( text, replaces the supplied message with argument4 when )
( state argument3 is zero, displays it, then alternates )
( selectors argument5/6 until fire. )
( Stack: message -- )
AT 7A1C
( Header: flags, saved name and link )
BYTES 830000CF047A
DOCOL
t.CLEAR-TEXT-AREA t.ACTION-ARG3 t.PUZZLE-STATE@ t.0=_12DE
t.0BRANCH CELL 0006 ( -> 7A34 )
t.DROP t.ACTION-ARG4
( label 7A34 )
t.SHOW-GAME-MESSAGE t.ACTION-ARG5 t.ACTION-ARG6
t.ANIMATE-PAIR-UNTIL-FIRE t.;S
AT 7A3E

( ACT-ENTER-AFTER-STATE | NFA 7A3E CFA 7A44 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 32 correspond to WEJDZ. Enters )
( metadata byte0's room only when state argument1 exceeds1; )
( otherwise displays an animated reply. )
AT 7A3E
( Header: flags, saved name and link )
BYTES 830000B01C7A
DOCOL
t.ACTION-ARG1 t.PUZZLE-STATE@ t.1 t.>
t.0BRANCH CELL 000A ( -> 7A5A )
t.OBJECT-META-0 t.ENTER-ROOM
t.BRANCH CELL 0006 ( -> 7A5E )
( label 7A5A )
t.ACTION-ARG2 t.SHOW-ANIMATED-REPLY
( label 7A5E )
t.;S
AT 7A60

( ACT-LISTEN-STATE-REPLY | NFA 7A60 CFA 7A66 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 2C correspond to SLUCHAJ. Selects )
( argument7 or argument2 by state argument1 and passes that )
( message to the animated-reply helper. )
AT 7A60
( Header: flags, saved name and link )
BYTES 830000B43E7A
DOCOL
t.ACTION-ARG1 t.PUZZLE-STATE@
t.0BRANCH CELL 0008 ( -> 7A76 )
t.ACTION-ARG7
t.BRANCH CELL 0004 ( -> 7A78 )
( label 7A76 )
t.ACTION-ARG2
( label 7A78 )
t.SHOW-ANIMATED-REPLY t.;S
AT 7A7C

( ACT-TAKE-AFTER-STATE | NFA 7A7C CFA 7A82 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 22 correspond to WEZ. Requires state )
( argument1; then takes inventory item from action byte8, )
( marks progress and reveals argument7, otherwise shows an )
( animated reply. )
AT 7A7C
( Header: flags, saved name and link )
BYTES 830000B4607A
DOCOL
t.ACTION-ARG1 t.PUZZLE-STATE@
t.0BRANCH CELL 0029 ( -> 7AB3 )
LIT16 0008 t.ACTION-BYTE@ t.ADD-INVENTORY-ITEM
t.0BRANCH CELL 0017 ( -> 7AAD )
t.MARK-PROGRESS-BIT8 t.ACTION-ARG7 t.DUP t.ADD-CURRENT-OBJECT
t.0 t.DRAW-OBJECT-CHANGE LIT8 11 t.PLAY-SOUND-EFFECT
t.BRANCH CELL 0004 ( -> 7AAF )
( label 7AAD )
t.ERROR-SOUND
( label 7AAF )
t.BRANCH CELL 0006 ( -> 7AB7 )
( label 7AB3 )
t.ACTION-ARG2 t.SHOW-ANIMATED-REPLY
( label 7AB7 )
t.;S
AT 7AB9

( SHOW-ALTERNATE-ITEM-REPLY | NFA 7AB9 CFA 7ABF )
( Inferred descriptive name, not recovered original: If the )
( last chosen inventory item equals object metadata )
( byte1+200, displays argument2 through the animated-reply )
( helper. )
( Stack: -- )
AT 7AB9
( Header: flags, saved name and link )
BYTES 830000DA7C7A
DOCOL
t.OBJECT-META-1 LIT8 C8 t.+ t.LAST-CHOSEN-ITEM t.@ t.=
t.0BRANCH CELL 0006 ( -> 7AD6 )
t.ACTION-ARG2 t.SHOW-ANIMATED-REPLY
( label 7AD6 )
t.;S
AT 7AD8

( ACT-BUY-WITH-ITEM | NFA 7AD8 CFA 7ADE )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 33 correspond to KUP I ZAPLAC. )
( Requires metadata byte0's payment item, removes it, )
( attempts to add metadata byte2's item, marks progress and )
( reveals argument1; a different selected item may trigger )
( an alternate reply. )
AT 7AD8
( Header: flags, saved name and link )
BYTES 830000B1B97A
DOCOL
t.OBJECT-META-0 t.CHOOSE-REQUIRED-ITEM
t.0BRANCH CELL 0030 ( -> 7B16 )
t.CLEAR-TEXT-AREA t.OBJECT-META-0 LIT8 C8 t.+
t.REMOVE-INVENTORY-ITEM t.OBJECT-META-2 LIT8 C8 t.+
t.ADD-INVENTORY-ITEM t.DROP LIT8 10 t.MARK-ROOM-PROGRESS
t.ACTION-ARG1 t.ADD-CURRENT-OBJECT t.ACTION-ARG1 t.0
t.DRAW-OBJECT-CHANGE LIT8 11 t.PLAY-SOUND-EFFECT
t.BRANCH CELL 0004 ( -> 7B18 )
( label 7B16 )
t.SHOW-ALTERNATE-ITEM-REPLY
( label 7B18 )
t.;S
AT 7B1A

( ACT-CHEER-WITH-ITEM | NFA 7B1A CFA 7B20 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 23 correspond to ROZWESEL. Requires )
( metadata byte0's item, shows an animated reply, sets )
( state metadata byte2 to argument1 and consumes the )
( required item; alternate item selection can produce )
( $7ABF's reply. )
AT 7B1A
( Header: flags, saved name and link )
BYTES 830000B5D87A
DOCOL
t.OBJECT-META-0 t.CHOOSE-REQUIRED-ITEM
t.0BRANCH CELL 0019 ( -> 7B41 )
t.ACTION-ARG7 t.SHOW-ANIMATED-REPLY t.ACTION-ARG1
t.OBJECT-META-2 t.PUZZLE-STATE! t.OBJECT-META-0 LIT8 C8 t.+
t.REMOVE-INVENTORY-ITEM
t.BRANCH CELL 0004 ( -> 7B43 )
( label 7B41 )
t.SHOW-ALTERNATE-ITEM-REPLY
( label 7B43 )
t.;S
AT 7B45

( ACT-FILL-WITH-ITEM | NFA 7B45 CFA 7B4B )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 24,40 correspond to NAPELNIJ; )
( NABIERZ. Requires argument1's item, writes argument3 into )
( state argument4, plays sound12 and displays message )
( argument2. )
AT 7B45
( Header: flags, saved name and link )
BYTES 830000B61A7B
DOCOL
t.ACTION-ARG1 t.CHOOSE-REQUIRED-ITEM
t.0BRANCH CELL 0013 ( -> 7B66 )
t.ACTION-ARG3 t.ACTION-ARG4 t.PUZZLE-STATE! LIT8 0C
t.PLAY-SOUND-EFFECT t.CLEAR-TEXT-AREA t.ACTION-ARG2
t.SHOW-GAME-MESSAGE
( label 7B66 )
t.;S
AT 7B68

( SUM-INVENTORY-IDS | NFA 7B68 CFA 7B6E )
( Inferred descriptive name, not recovered original: Sums )
( the five inventory bytes at room0/view1 record+3. This is )
( a game-specific puzzle test, not a general item-count )
( operation. )
( Stack: -- sum )
AT 7B68
( Header: flags, saved name and link )
BYTES 830000D0457B
DOCOL
t.0 t.0 t.1 t.ROOM-VIEW-OBJECTS t.3 t.+ t.DUP LIT8 05 t.+
t.SWAP t.(DO)
( label 7B87 )
t.I t.C@ t.+
t.(LOOP) CELL FFF8 ( -> 7B87 )
t.;S
AT 7B93

( LIGHT-INVENTORY? | NFA 7B93 CFA 7B98 )
( Inferred descriptive name, not recovered original: Tests )
( whether the five inventory IDs sum to less than255; swim )
( handler $807B uses it as its carrying restriction. )
( Stack: -- flag )
AT 7B93
( Header: flags, saved name and link )
BYTES 8200D0687B
DOCOL
t.SUM-INVENTORY-IDS LIT8 FF t.< t.;S
AT 7BA3

( MSG-POWER-ALREADY-USED | NFA 7BA3 CFA 7BA8 )
( Inferred descriptive name, not recovered original: )
( Counted message JUZ UZYLES, used by $7C2C when its )
( one-time power state is already set. )
( Decoded text: Message lines )
( line 1 $7BAE: JUZ UZYLES )
AT 7BA3
( Header: flags, saved name and link )
BYTES 8200CD937B
DOVAR
BYTES 0C00010A4A557A3D557A596C4573
AT 7BB8

( ACT-TELL-STORY | NFA 7BB8 CFA 7BBE )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 34 correspond to POWIEDZ BAJKE. If )
( state metadata byte1 is nonzero, displays the ordinary )
( argument description; otherwise displays metadata byte2 )
( as an error. )
AT 7BB8
( Header: flags, saved name and link )
BYTES 830000B2A37B
DOCOL
t.OBJECT-META-1 t.PUZZLE-STATE@
t.0BRANCH CELL 0008 ( -> 7BCE )
t.ACT-DESCRIBE-ARG
t.BRANCH CELL 0006 ( -> 7BD2 )
( label 7BCE )
t.OBJECT-META-2 t.SHOW-ACTION-ERROR
( label 7BD2 )
t.;S
AT 7BD4

( ACT-TELL-TRUTH | NFA 7BD4 CFA 7BDA )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 35 correspond to POWIEDZ PRAWDE. )
( Only state metadata byte1==1 reveals/draws arguments2/3 )
( and advances that state to2; other values select )
( different error replies. )
AT 7BD4
( Header: flags, saved name and link )
BYTES 830000B3B87B
DOCOL
t.OBJECT-META-1 t.PUZZLE-STATE@ t.DUP t.1 t.=
t.0BRANCH CELL 002A ( -> 7C12 )
t.DROP t.CLEAR-TEXT-AREA t.2 t.MARK-ROOM-PROGRESS
t.ACTION-ARG2 t.ACTION-ARG3 t.DRAW-OBJECT-CHANGE
t.SUCCESS-SOUND t.ACTION-ARG1 t.SHOW-GAME-MESSAGE
t.MARK-PROGRESS-BIT8 t.ACTION-ARG2 t.ADD-CURRENT-OBJECT
t.ACTION-ARG3 t.ADD-CURRENT-OBJECT t.2 t.OBJECT-META-1
t.PUZZLE-STATE!
t.BRANCH CELL 0014 ( -> 7C24 )
( label 7C12 )
t.ERROR-SOUND t.0=_12DE
t.0BRANCH CELL 0008 ( -> 7C20 )
t.OBJECT-META-2
t.BRANCH CELL 0004 ( -> 7C22 )
( label 7C20 )
t.ACTION-ARG4
( label 7C22 )
t.SHOW-GAME-MESSAGE
( label 7C24 )
t.;S
AT 7C26

( ACT-USE-POWER-ONCE | NFA 7C26 CFA 7C2C )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 36 correspond to UZYJ MOCY. If state )
( metadata byte1 is zero, requires metadata byte0's power )
( and sets that state from argument2; otherwise reports JUZ )
( UZYLES. )
AT 7C26
( Header: flags, saved name and link )
BYTES 830000B4D47B
DOCOL
t.OBJECT-META-1 t.PUZZLE-STATE@ t.0=_12DE
t.0BRANCH CELL 0018 ( -> 7C4E )
t.OBJECT-META-0 t.SELECT-REQUIRED-POWER
t.0BRANCH CELL 000C ( -> 7C4A )
t.ACTION-ARG2 t.OBJECT-META-1 t.PUZZLE-STATE!
t.CLEAR-TEXT-AREA t.ACT-DESCRIBE-ARG
( label 7C4A )
t.BRANCH CELL 000C ( -> 7C58 )
( label 7C4E )
t.ERROR-SOUND t.CLEAR-TEXT-AREA t.MSG-POWER-ALREADY-USED t.2+
t.SHOW-MESSAGE
( label 7C58 )
t.;S
AT 7C5A

( ACT-REFUSE-JUMP | NFA 7C5A CFA 7C60 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 37 correspond to PRZESKOCZ. Displays )
( argument1 as an error message; no movement occurs in this )
( handler. )
AT 7C5A
( Header: flags, saved name and link )
BYTES 830000B5267C
DOCOL
t.ACTION-ARG1 t.SHOW-ACTION-ERROR t.;S
AT 7C68

( ACT-DESCRIBE-INLINE | NFA 7C68 CFA 7C6E )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 39 correspond to CO TO. Plays )
( sound22 and displays a counted message beginning at )
( action payload byte1. )
AT 7C68
( Header: flags, saved name and link )
BYTES 830000B75A7C
DOCOL
LIT8 16 t.PLAY-SOUND-EFFECT t.1 t.ACTION-BYTE-ADDR
t.SHOW-MESSAGE t.;S
AT 7C7D

( PATH-PHASE-OBJECT-PAIRS | NFA 7C7D CFA 7C83 )
( Inferred descriptive name, not recovered original: Three )
( two-byte object pairs [164,0],[163,120],[64,0], selected )
( by path coordinates in $7C93. )
AT 7C7D
( Header: flags, saved name and link )
BYTES 830000B1687C
DODOES
( DOES> thread at 51DC )
BYTES DC51A400A3784000
AT 7C8D

( PATH-SCENE-OBJECTS | NFA 7C8D CFA 7C93 )
( Inferred descriptive name, not recovered original: )
( Computes [path-y+30-path-x] MOD3 and fetches the two )
( object bytes from $7C83 for that phase. )
( Stack: -- object1 object2 )
AT 7C8D
( Header: flags, saved name and link )
BYTES 830000CD7D7C
DOCOL
t.PATH-Y t.@ LIT8 1E t.PATH-X t.@ t.- t.+ LIT8 03 t.MOD t.>R
t.R t.PATH-PHASE-OBJECT-PAIRS t.C@ t.R>
t.PATH-PHASE-OBJECT-PAIRS t.1+ t.C@ t.;S
AT 7CBB

( ENTER-PATH-ROOM | NFA 7CBB CFA 7CC2 )
( Inferred descriptive name, not recovered original: Sets )
( current room, temporarily removes the two phase objects )
( selected by $7C93, enters/draws that room, then adds the )
( two objects back to its mutable list. )
( Stack: room -- )
AT 7CBB
( Header: flags, saved name and link )
BYTES 84000000D08D7C
DOCOL
t.DUP t.CURRENT-ROOM t.! t.PATH-SCENE-OBJECTS
t.REMOVE-CURRENT-OBJECT t.REMOVE-CURRENT-OBJECT t.ENTER-ROOM
t.PATH-SCENE-OBJECTS t.ADD-CURRENT-OBJECT t.ADD-CURRENT-OBJECT
t.;S
AT 7CDA

( PATH-COMPLETED-FLAG | NFA 7CDA CFA 7CDF )
( Inferred descriptive name, not recovered original: Reset )
( by $7CEA, set when all four direction counters reach )
( zero, and used with previous direction1 by $7D69 to allow )
( room15. )
AT 7CDA
( Header: flags, saved name and link )
BYTES 8200CEBB7C
DOVAR
CELL 0000
AT 7CE3

( RESET-PATH-PUZZLE | NFA 7CE3 CFA 7CEA )
( Inferred descriptive name, not recovered original: )
( Initializes direction counters at $5865 to5,2,0,3; move )
( budget12, previous direction1, coordinates0,0 and )
( completion flag $7CDF=0. )
( Stack: -- )
AT 7CE3
( Header: flags, saved name and link )
BYTES 84000000D2DA7C
DOCOL
LIT8 05 t.PATH-DIRECTION-COUNTS t.! t.2
t.PATH-DIRECTION-COUNTS t.2+ t.! t.0 t.PATH-DIRECTION-COUNTS
LIT8 04 t.+ t.! LIT8 03 t.PATH-DIRECTION-COUNTS LIT8 06 t.+
t.! LIT8 0C t.PATH-MOVES-LEFT t.! t.1 t.PATH-LAST-DIRECTION
t.! t.0 t.PATH-X t.! t.0 t.PATH-Y t.! t.0
t.PATH-COMPLETED-FLAG t.! t.;S
AT 7D33

( PATH-COUNTERS-ZERO? | NFA 7D33 CFA 7D3B )
( Inferred descriptive name, not recovered original: Checks )
( all four cells at $5865 and returns true only when every )
( counter is zero. )
( Stack: -- flag )
AT 7D33
( Header: flags, saved name and link )
BYTES 8500000000D3E37C
DOCOL
t.0 LIT8 04 t.0 t.(DO)
( label 7D46 )
t.PATH-DIRECTION-COUNTS t.2 t.I t.* t.+ t.@ t.0=_12DE t.+
t.(LOOP) CELL FFEE ( -> 7D46 )
LIT8 04 t.= t.;S
AT 7D61

( UPDATE-PATH-ROOM | NFA 7D61 CFA 7D69 )
( Inferred descriptive name, not recovered original: )
( Chooses rooms12..15 from coordinates, previous direction )
( and completion flag; all four zero counters set )
( completion. A depleted move budget displays failure, )
( returns to room10, resets the puzzle and clears related )
( room/state entries. )
( Stack: -- )
AT 7D61
( Header: flags, saved name and link )
BYTES 8500000000C3337D
DOCOL
t.PATH-COMPLETED-FLAG t.@ t.PATH-LAST-DIRECTION t.@ t.1 t.=
t.*
t.0BRANCH CELL 000B ( -> 7D86 )
LIT8 0F t.ENTER-ROOM
t.BRANCH CELL 0058 ( -> 7DDC )
( label 7D86 )
t.PATH-COUNTERS-ZERO?
t.0BRANCH CELL 0011 ( -> 7D9B )
t.1 t.PATH-COMPLETED-FLAG t.! LIT8 0E t.ENTER-PATH-ROOM
t.BRANCH CELL 0043 ( -> 7DDC )
( label 7D9B )
t.PATH-Y t.@ t.-1 t.= t.PATH-X t.@ t.0=_12DE t.*
t.0BRANCH CELL 000D ( -> 7DBA )
t.RESET-PATH-PUZZLE LIT8 0C t.ENTER-ROOM
t.BRANCH CELL 0024 ( -> 7DDC )
( label 7DBA )
t.PATH-Y t.@ t.0=_12DE t.PATH-X t.@ t.0=_12DE t.0=_12DE t.*
t.0BRANCH CELL 000B ( -> 7DD7 )
LIT8 0D t.ENTER-PATH-ROOM
t.BRANCH CELL 0007 ( -> 7DDC )
( label 7DD7 )
LIT8 0E t.ENTER-PATH-ROOM
( label 7DDC )
t.PATH-MOVES-LEFT t.@ t.0=_12DE
t.0BRANCH CELL 002C ( -> 7E10 )
t.ERROR-SOUND LIT8 2E t.SHOW-GAME-MESSAGE t.WAIT-KEY-OR-FIRE
LIT8 0A t.ENTER-ROOM t.ERROR-SOUND LIT8 2C t.SHOW-GAME-MESSAGE
t.RESET-PATH-PUZZLE LIT8 1E LIT8 07 t.0 t.REMOVE-SCENE-OBJECT
t.0 LIT8 12 t.PUZZLE-STATE-CELLS t.!
( label 7E10 )
t.;S
AT 7E12

( PATH-DIRECTION-COUNTER | NFA 7E12 CFA 7E17 )
( Inferred descriptive name, not recovered original: )
( Returns $5865+2*[direction-1], addressing a one-based )
( direction counter. )
( Stack: direction -- addr )
AT 7E12
( Header: flags, saved name and link )
BYTES 8200A6617D
DOCOL
t.1 t.- t.2 t.* t.PATH-DIRECTION-COUNTS t.+ t.;S
AT 7E27

( RECORD-PATH-STEP | NFA 7E27 CFA 7E2F )
( Inferred descriptive name, not recovered original: )
( Decrements the new direction counter for a repeated )
( direction or the accepted predecessor; otherwise )
( writes100. Stores the new direction and decrements move )
( budget. )
( Stack: accepted-previous direction -- )
AT 7E27
( Header: flags, saved name and link )
BYTES 8500000000D2127E
DOCOL
t.>R t.PATH-LAST-DIRECTION t.@ t.R t.=
t.0BRANCH CELL 0010 ( -> 7E4D )
t.-1 t.R t.PATH-DIRECTION-COUNTER t.+! t.DROP
t.BRANCH CELL 0023 ( -> 7E6E )
( label 7E4D )
t.PATH-LAST-DIRECTION t.@ t.= t.0=_12DE
t.0BRANCH CELL 000F ( -> 7E66 )
LIT8 64 t.R t.PATH-DIRECTION-COUNTER t.!
t.BRANCH CELL 000A ( -> 7E6E )
( label 7E66 )
t.-1 t.R t.PATH-DIRECTION-COUNTER t.+!
( label 7E6E )
t.R> t.PATH-LAST-DIRECTION t.! t.-1 t.PATH-MOVES-LEFT t.+!
t.;S
AT 7E7C

( ACT-PATH-FORWARD | NFA 7E7C CFA 7E82 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 3A correspond to IDZ PROSTO. Records )
( direction1 with accepted predecessor4, increments path Y, )
( then updates the displayed path room. )
AT 7E7C
( Header: flags, saved name and link )
BYTES 830000B8277E
DOCOL
LIT8 04 t.1 t.RECORD-PATH-STEP t.1 t.PATH-Y t.+!
t.UPDATE-PATH-ROOM t.;S
AT 7E95

( ACT-PATH-RIGHT | NFA 7E95 CFA 7E9B )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 3B correspond to IDZ W PRAWO. )
( Records direction2 with accepted predecessor1, increments )
( path X, then updates the displayed path room. )
AT 7E95
( Header: flags, saved name and link )
BYTES 830000B97C7E
DOCOL
t.1 t.2 t.RECORD-PATH-STEP t.1 t.PATH-X t.+!
t.UPDATE-PATH-ROOM t.;S
AT 7EAD

( ACT-PATH-BACK | NFA 7EAD CFA 7EB3 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 3C correspond to IDZ W TYL. Records )
( direction3 with accepted predecessor5, decrements path Y, )
( then updates the displayed path room. The literal5 is )
( retained as observed, not corrected to an assumed )
( direction. )
AT 7EAD
( Header: flags, saved name and link )
BYTES 830000B0957E
DOCOL
LIT8 05 t.3 t.RECORD-PATH-STEP t.-1 t.PATH-Y t.+!
t.UPDATE-PATH-ROOM t.;S
AT 7EC6

( ACT-PATH-LEFT | NFA 7EC6 CFA 7ECC )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 3D correspond to IDZ W LEWO. Records )
( direction4 with accepted predecessor1, decrements path X, )
( then updates the displayed path room. )
AT 7EC6
( Header: flags, saved name and link )
BYTES 830000B1AD7E
DOCOL
LIT8 01 LIT8 04 t.RECORD-PATH-STEP t.-1 t.PATH-X t.+!
t.UPDATE-PATH-ROOM t.;S
AT 7EE0

( REVEAL-POWER-RESULT | NFA 7EE0 CFA 7EE6 )
( Inferred descriptive name, not recovered original: Adds )
( argument1 to the current scene, marks mission mask3, sets )
( state argument3 to1, redraws argument1 and plays sound5. )
( Stack: -- )
AT 7EE0
( Header: flags, saved name and link )
BYTES 830000B2C67E
DOCOL
t.CLEAR-TEXT-AREA t.ACTION-ARG1 t.ADD-CURRENT-OBJECT t.3
t.MARK-ROOM-PROGRESS t.1 t.ACTION-ARG3 t.PUZZLE-STATE!
t.ACTION-ARG1 t.0 t.DRAW-OBJECT-CHANGE LIT8 05
t.PLAY-SOUND-EFFECT t.;S
AT 7F05

( ACT-REVEAL-WITH-POWER | NFA 7F05 CFA 7F0B )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 3E correspond to UZYJ MOCY. Requires )
( power argument2, permits $7EE6's reveal only when state )
( argument3 is zero and otherwise displays argument4 as an )
( error. )
AT 7F05
( Header: flags, saved name and link )
BYTES 830000B2E07E
DOCOL
t.ACTION-ARG2 t.SELECT-REQUIRED-POWER
t.0BRANCH CELL 0016 ( -> 7F29 )
t.ACTION-ARG3 t.PUZZLE-STATE@ t.0=_12DE
t.0BRANCH CELL 0008 ( -> 7F25 )
t.REVEAL-POWER-RESULT
t.BRANCH CELL 0006 ( -> 7F29 )
( label 7F25 )
t.ACTION-ARG4 t.SHOW-ACTION-ERROR
( label 7F29 )
t.;S
AT 7F2B

( ACT-PATH-ENTER-WITH-ITEM | NFA 7F2B CFA 7F31 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 3F correspond to IDZ PROSTO. )
( Requires state argument1 and inventory item argument3, )
( then enters metadata byte0's room through the )
( path-specific entry helper; failure displays argument2. )
AT 7F2B
( Header: flags, saved name and link )
BYTES 830000B3057F
DOCOL
t.ACTION-ARG1 t.PUZZLE-STATE@
t.0BRANCH CELL 0020 ( -> 7F59 )
t.ACTION-ARG3 t.0 t.1 t.FIND-SCENE-OBJECT
t.0BRANCH CELL 000C ( -> 7F51 )
t.DROP t.OBJECT-META-0 t.ENTER-PATH-ROOM
t.BRANCH CELL 0006 ( -> 7F55 )
( label 7F51 )
t.ACTION-ARG2 t.SHOW-ACTION-ERROR
( label 7F55 )
t.BRANCH CELL 0006 ( -> 7F5D )
( label 7F59 )
t.ACTION-ARG2 t.SHOW-ACTION-ERROR
( label 7F5D )
t.;S
AT 7F5F

( ACT-STRIKE-WITH-ITEM | NFA 7F5F CFA 7F65 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 1F correspond to UDERZ. Removes )
( scene object162, then runs the shared item-gated open )
( handler $763F. )
AT 7F5F
( Header: flags, saved name and link )
BYTES 830000B12B7F
DOCOL
LIT8 A2 t.REMOVE-CURRENT-OBJECT t.ACT-OPEN-WITH-ITEM t.;S
AT 7F70

( CLEAR-INVENTORY | NFA 7F70 CFA 7F76 )
( Inferred descriptive name, not recovered original: Erases )
( five item positions beginning at room0/view1 record+3. )
( Stack: -- )
AT 7F70
( Header: flags, saved name and link )
BYTES 830000DA5F7F
DOCOL
t.0 t.1 t.ROOM-VIEW-OBJECTS LIT8 03 t.+ LIT8 05 t.ERASE t.;S
AT 7F8A

( ACT-ENTER-SECOND-STAGE | NFA 7F8A CFA 7F90 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 41 correspond to IDZ TAM. Hides the )
( scene, starts the second stage, clears five inventory )
( slots and displays message0 as an error-styled notice. )
AT 7F8A
( Header: flags, saved name and link )
BYTES 830000B5707F
DOCOL
t.CLOSE-SCENE-TRANSITION t.START-SECOND-STAGE
t.CLEAR-INVENTORY t.0 t.SHOW-ACTION-ERROR t.;S
AT 7F9E

( PAIR-SEARCH-ROOM | NFA 7F9E CFA 7FA4 )
( Inferred descriptive name, not recovered original: )
( Temporary room ID set by $7FDB and read by $7FAE while )
( searching views1..3. )
AT 7F9E
( Header: flags, saved name and link )
BYTES 830000CF8A7F
DOVAR
CELL 0000
AT 7FA8

( FIND-ITEM-IN-THREE-VIEWS | NFA 7FA8 CFA 7FAE )
( Inferred descriptive name, not recovered original: )
( Searches an item in views1..3 of room stored at $7FA4; )
( retains the last matching byte address, or0 when absent. )
( Stack: item -- addr-or-zero )
AT 7FA8
( Header: flags, saved name and link )
BYTES 830000DA9E7F
DOCOL
t.0 LIT8 04 t.1 t.(DO)
( label 7FB9 )
t.OVER t.PAIR-SEARCH-ROOM t.@ t.I t.FIND-SCENE-OBJECT
t.0BRANCH CELL 0006 ( -> 7FCB )
t.SWAP t.DROP
( label 7FCB )
t.(LOOP) CELL FFEC ( -> 7FB9 )
t.SWAP t.DROP t.;S
AT 7FD5

( ADVANCE-ITEM-PAIR | NFA 7FD5 CFA 7FDB )
( Inferred descriptive name, not recovered original: In the )
( supplied room, when item and item+1 both occur in )
( views1..3, increments the latter byte by2 and copies its )
( item XY record to the new item ID. )
( Stack: item room -- )
AT 7FD5
( Header: flags, saved name and link )
BYTES 830000D9A87F
DOCOL
t.PAIR-SEARCH-ROOM t.! t.>R t.R t.FIND-ITEM-IN-THREE-VIEWS
t.0BRANCH CELL 0029 ( -> 8012 )
t.R t.1+ t.FIND-ITEM-IN-THREE-VIEWS t.-DUP
t.0BRANCH CELL 001D ( -> 8012 )
t.2 t.SWAP t.BYTE+! t.R LIT8 C9 t.- t.DUP t.ITEM-POSITIONS t.@
t.SWAP t.2+ t.ITEM-POSITIONS t.!
( label 8012 )
t.R> t.DROP t.;S
AT 8018

( UPDATE-PAIRED-ROOM-ITEMS | NFA 8018 CFA 801F )
( Inferred descriptive name, not recovered original: When )
( the indexed puzzle state is nonzero, calls $7FDB with )
( starting IDs208 then207 in room16, followed by208 then207 )
( in room18. )
( Stack: state-index -- )
AT 8018
( Header: flags, saved name and link )
BYTES 84000000DAD57F
DOCOL
t.PUZZLE-STATE@
t.0BRANCH CELL 001E ( -> 8043 )
LIT8 CF LIT8 D0 t.2DUP LIT8 10 t.ADVANCE-ITEM-PAIR LIT8 10
t.ADVANCE-ITEM-PAIR LIT8 12 t.ADVANCE-ITEM-PAIR LIT8 12
t.ADVANCE-ITEM-PAIR
( label 8043 )
t.;S
AT 8045

( ACT-REVEAL-SET-POWER-STATE | NFA 8045 CFA 804B )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 45 correspond to UZYJ MOCY. Requires )
( power argument2, invokes $7EE6, displays argument3 and )
( stores argument4 into state argument5. )
AT 8045
( Header: flags, saved name and link )
BYTES 830000B91880
DOCOL
t.ACTION-ARG2 t.SELECT-REQUIRED-POWER
t.0BRANCH CELL 000E ( -> 8061 )
t.REVEAL-POWER-RESULT t.ACTION-ARG3 t.SHOW-GAME-MESSAGE
t.ACTION-ARG4 t.ACTION-ARG5 t.PUZZLE-STATE!
( label 8061 )
t.;S
AT 8063

( ACT-ENTER-UPDATE-PAIRS | NFA 8063 CFA 8069 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 42 correspond to IDZ TAM. Enters )
( metadata byte0's room and conditionally advances the )
( paired items using state argument1. )
AT 8063
( Header: flags, saved name and link )
BYTES 830000B64580
DOCOL
t.OBJECT-META-0 t.ENTER-ROOM t.ACTION-ARG1
t.UPDATE-PAIRED-ROOM-ITEMS t.;S
AT 8075

( ACT-SWIM-WITH-LIGHT-LOAD | NFA 8075 CFA 807B )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 43 correspond to PLYN. Allows )
( movement only if inventory ID sum is below255; updates )
( paired-room items, enters metadata byte0's room and marks )
( progress. Otherwise displays argument1 as an error. )
AT 8075
( Header: flags, saved name and link )
BYTES 830000B76380
DOCOL
t.LIGHT-INVENTORY?
t.0BRANCH CELL 0010 ( -> 8091 )
t.ACTION-ARG2 t.UPDATE-PAIRED-ROOM-ITEMS t.OBJECT-META-0
t.ENTER-ROOM t.MARK-PROGRESS-BIT8
t.BRANCH CELL 0006 ( -> 8095 )
( label 8091 )
t.ACTION-ARG1 t.SHOW-ACTION-ERROR
( label 8095 )
t.;S
AT 8097

( RESET-ITEM-POSITIONS | NFA 8097 CFA 809D )
( Inferred descriptive name, not recovered original: Three )
( X/Y pairs [10,72], copied to item-coordinate slots5..7 by )
( reset handler $80D3. )
AT 8097
( Header: flags, saved name and link )
BYTES 830000D97580
DOVAR
BYTES 0A480A480A48
AT 80A5

( RESET-ROOM16-OBJECTS | NFA 80A5 CFA 80AB )
( Inferred descriptive name, not recovered original: Three )
( four-byte length-records containing [110,207], [110,208], )
( [110,209], copied to room16/views1..3 by $80D3. )
AT 80A5
( Header: flags, saved name and link )
BYTES 830000B19780
DOVAR
BYTES 02006ECF02006ED002006ED1
AT 80B9

( RESET-ROOM18-OBJECTS | NFA 80B9 CFA 80BF )
( Inferred descriptive name, not recovered original: Three )
( four-byte length-records each containing [119,0], copied )
( to room18/views1..3 by $80D3. )
AT 80B9
( Header: flags, saved name and link )
BYTES 830000B2A580
DOVAR
BYTES 020077000200770002007700
AT 80CD

( ACT-RESET-PAIRED-ITEMS | NFA 80CD CFA 80D3 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 44 correspond to COFNIJ. Clears )
( inventory, restores room16/18 view records and three item )
( positions, clears state19, redraws prescribed objects and )
( displays argument2. )
AT 80CD
( Header: flags, saved name and link )
BYTES 830000B8B980
DOCOL
t.CLEAR-INVENTORY LIT8 76 LIT8 12 t.0 t.REMOVE-SCENE-OBJECT
t.RESET-ROOM16-OBJECTS LIT8 10 t.1 t.ROOM-VIEW-OBJECTS LIT8 0C
t.CMOVE t.RESET-ROOM18-OBJECTS LIT8 12 t.1 t.ROOM-VIEW-OBJECTS
LIT8 0C t.CMOVE t.RESET-ITEM-POSITIONS LIT8 05
t.ITEM-POSITIONS LIT8 06 t.CMOVE t.0 LIT8 13 t.PUZZLE-STATE!
t.ACTION-ARG1 t.0 t.DRAW-OBJECT-CHANGE LIT8 05
t.PLAY-SOUND-EFFECT t.ACTION-ARG2 t.SHOW-GAME-MESSAGE
t.ACTION-ARG3 t.0 t.DRAW-OBJECT-CHANGE t.ACTION-ARG4
t.REMOVE-CURRENT-OBJECT t.;S
AT 812B

( ACT-GIVE-INVENTORY | NFA 812B CFA 8131 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 46 correspond to DAJ. Tests whether )
( the inventory ID sum is greater than 450; on success )
( clears inventory, changes several room objects and )
( releases a power through $755F. Otherwise selects a reply )
( by sum<200 and plays an interaction animation. )
AT 812B
( Header: flags, saved name and link )
BYTES 830000B0CD80
DOCOL
t.SUM-INVENTORY-IDS LIT16 01C2 t.>
t.0BRANCH CELL 0038 ( -> 8175 )
t.MARK-PROGRESS-BIT8 t.CLEAR-INVENTORY LIT8 72 LIT8 12 t.0
t.REMOVE-SCENE-OBJECT LIT8 0E LIT8 11 t.0
t.REMOVE-SCENE-OBJECT LIT8 33 LIT8 11 t.0 t.ADD-SCENE-OBJECT
t.DROP LIT8 09 LIT8 10 t.0 t.ADD-SCENE-OBJECT t.DROP
t.ACT-REVEAL-RELEASE-POWER
t.BRANCH CELL 001F ( -> 8192 )
( label 8175 )
t.SUM-INVENTORY-IDS LIT8 C8 t.<
t.0BRANCH CELL 0008 ( -> 8186 )
t.OBJECT-META-1
t.BRANCH CELL 0004 ( -> 8188 )
( label 8186 )
t.OBJECT-META-2
( label 8188 )
t.SHOW-GAME-MESSAGE LIT8 17 LIT8 18 t.ANIMATE-PAIR-UNTIL-FIRE
( label 8192 )
t.;S
AT 8194

( TRAINING-STATES-READY? | NFA 8194 CFA 819A )
( Inferred descriptive name, not recovered original: Tests )
( whether puzzle-state cells20 and21 sum to4; $81B5 can )
( promote each trained state from1 to2 before this gate )
( opens. )
( Stack: -- flag )
AT 8194
( Header: flags, saved name and link )
BYTES 830000C12B81
DOCOL
LIT8 14 t.PUZZLE-STATE@ LIT8 15 t.PUZZLE-STATE@ t.+ LIT8 04
t.= t.;S
AT 81AF

( ACT-EMPOWER-TRAINED-STATE | NFA 81AF CFA 81B5 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 47 correspond to UZYJ MOCY. Requires )
( power argument1 and an already nonzero state argument2, )
( promotes it to2 with a message/animation and progress; )
( when states20/21 total4, displays the completion reply. )
AT 81AF
( Header: flags, saved name and link )
BYTES 830000B19481
DOCOL
t.ACTION-ARG1 t.SELECT-REQUIRED-POWER
t.0BRANCH CELL 0037 ( -> 81F4 )
t.ACTION-ARG2 t.PUZZLE-STATE@
t.0BRANCH CELL 001A ( -> 81DF )
t.2 t.ACTION-ARG2 t.PUZZLE-STATE! t.CLEAR-TEXT-AREA
t.ACTION-ARG4 t.SHOW-GAME-MESSAGE t.ACTION-ARG5 t.ACTION-ARG6
t.ANIMATE-PAIR-UNTIL-FIRE t.MARK-PROGRESS-BIT8
t.BRANCH CELL 0006 ( -> 81E3 )
( label 81DF )
t.ACTION-ARG3 t.SHOW-ACTION-ERROR
( label 81E3 )
t.TRAINING-STATES-READY?
t.0BRANCH CELL 000D ( -> 81F4 )
t.CLEAR-TEXT-AREA LIT8 05 t.PLAY-SOUND-EFFECT t.ACTION-ARG7
t.SHOW-GAME-MESSAGE
( label 81F4 )
t.;S
AT 81F6

( ACT-TRAIN-WITH-ITEM | NFA 81F6 CFA 81FC )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 48 correspond to WYTRENUJ. If state )
( argument2 is zero, requires item argument1 and sets the )
( state to1, otherwise displays argument4's error. )
AT 81F6
( Header: flags, saved name and link )
BYTES 830000B2AF81
DOCOL
t.ACTION-ARG2 t.PUZZLE-STATE@
t.0BRANCH CELL 000A ( -> 820E )
t.ACTION-ARG4 t.SHOW-ACTION-ERROR
t.BRANCH CELL 001B ( -> 8227 )
( label 820E )
t.ACTION-ARG1 t.CHOOSE-REQUIRED-ITEM
t.0BRANCH CELL 0013 ( -> 8227 )
t.1 t.ACTION-ARG2 t.PUZZLE-STATE! t.CLEAR-TEXT-AREA LIT8 05
t.PLAY-SOUND-EFFECT t.ACTION-ARG3 t.SHOW-GAME-MESSAGE
( label 8227 )
t.;S
AT 8229

( ACT-ENTER-AFTER-TRAINING | NFA 8229 CFA 822F )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 49 correspond to WEJDZ. Enters the )
( linked room and marks progress only when puzzle states20 )
( and21 sum to4; otherwise displays argument1's error. )
AT 8229
( Header: flags, saved name and link )
BYTES 830000B3F681
DOCOL
t.TRAINING-STATES-READY?
t.0BRANCH CELL 000A ( -> 823F )
t.ACT-ENTER-LINKED-ROOM t.MARK-PROGRESS-BIT8
t.BRANCH CELL 0006 ( -> 8243 )
( label 823F )
t.ACTION-ARG1 t.SHOW-ACTION-ERROR
( label 8243 )
t.;S
AT 8245

( ACT-DROP-REQUIRED-ITEM | NFA 8245 CFA 824B )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 4A correspond to ZOSTAW. Asks for an )
( inventory item and accepts only exact ID argument2; )
( consumes it, reveals argument1 and redraws, or displays )
( argument3 for a wrong choice. )
AT 8245
( Header: flags, saved name and link )
BYTES 830000B42982
DOCOL
t.MSG-WHAT t.2+ t.SHOW-MESSAGE t.CHOOSE-INVENTORY-ITEM t.-DUP
t.0BRANCH CELL 0027 ( -> 8280 )
t.ACTION-ARG2 t.=
t.0BRANCH CELL 001B ( -> 827C )
t.ACTION-ARG2 t.REMOVE-INVENTORY-ITEM t.ACTION-ARG1
t.ADD-CURRENT-OBJECT t.ACTION-ARG1 t.0 t.DRAW-OBJECT-CHANGE
LIT8 0C t.PLAY-SOUND-EFFECT t.CLEAR-TEXT-AREA
t.BRANCH CELL 0006 ( -> 8280 )
( label 827C )
t.ACTION-ARG3 t.SHOW-ACTION-ERROR
( label 8280 )
t.;S
AT 8282

( ACT-PATCH-WITH-ITEM | NFA 8282 CFA 8288 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 4C correspond to ZALATAJ. Requires )
( metadata byte0's item, stores argument2 into state )
( argument3, consumes that item and applies the shared open )
( result. )
AT 8282
( Header: flags, saved name and link )
BYTES 830000B64582
DOCOL
t.0 t.REPLACEMENT-OBJECT! t.OBJECT-META-0
t.CHOOSE-REQUIRED-ITEM t.DUP
t.0BRANCH CELL 0011 ( -> 82A7 )
t.ACTION-ARG2 t.ACTION-ARG3 t.PUZZLE-STATE! t.OBJECT-META-0
LIT8 C8 t.+ t.REMOVE-INVENTORY-ITEM
( label 82A7 )
t.APPLY-OPEN-RESULT t.;S
AT 82AB

( ACT-RELEASE-POWER-IN-VIEW | NFA 82AB CFA 82B1 )
( Inferred descriptive name, not recovered original: )
( Dispatch $6B64 slots 4D,4F correspond to POTRZYJ; WLACZ. )
( Only in room argument1 and view argument2, removes the )
( selected object and learns its inline power record )
( beginning after action byte4; other locations display )
( argument3's error. )
AT 82AB
( Header: flags, saved name and link )
BYTES 830000B78282
DOCOL
t.CURRENT-ROOM t.@ t.ACTION-ARG1 t.= t.P t.ACTION-ARG2 t.= t.*
t.0BRANCH CELL 0020 ( -> 82E5 )
t.SELECTED-OBJECT t.@ t.REMOVE-CURRENT-OBJECT
t.REDRAW-CURRENT-VIEW LIT8 04 t.ACTION-BYTE-ADDR
t.SHOW-POWER-RELEASED t.WAIT-KEY-OR-FIRE LIT8 04
t.ACTION-BYTE-ADDR t.LEARN-POWER t.MARK-PROGRESS-BIT8
t.BRANCH CELL 0006 ( -> 82E9 )
( label 82E5 )
t.ACTION-ARG3 t.SHOW-ACTION-ERROR
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

( SAVE-DICTIONARY-LIMITS | NFA 82F6 CFA 82FB )
( Inferred descriptive name, not recovered original: Saves )
( HERE and LATEST into the two cells of )
( SAVED-DICTIONARY-STATE, paired with existing )
( RESTORE-DICTIONARY-LIMITS. )
( Stack: -- )
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

( TITLE-DISPLAY-LIST-TEMPLATE | NFA 8342 CFA 8348 )
( Inferred descriptive name, not recovered original: Seven )
( ANTIC display-list bytes used by $83EB/$856F to )
( insert/reset the scrolling title text rows. )
AT 8342
( Header: flags, saved name and link )
BYTES 830000CC0D83
DOVAR
BYTES 0424648DA2044F
AT 8351

( TITLE-LMS-ADDRESS | NFA 8351 CFA 8357 )
( Inferred descriptive name, not recovered original: )
( Constant $A7E6; points at the title text display-list )
( address field and is the base for row editing. )
AT 8351
( Header: flags, saved name and link )
BYTES 830000C44283
DOCON
CELL A7E6
AT 835B

( TITLE-TEXT-SCREEN | NFA 835B CFA 8362 )
( Inferred descriptive name, not recovered original: )
( Constant $A0D5, installed as the title text screen by )
( $83DA and used for page clearing/printing. )
AT 835B
( Header: flags, saved name and link )
BYTES 84000000D05183
DOCON
CELL A0D5
AT 8366

( TITLE-FOOTER-SCREEN | NFA 8366 CFA 836D )
( Inferred descriptive name, not recovered original: )
( Constant $A28D; SETUP-TITLE-TEXT writes this address )
( minus80 to SAVMSC before drawing footer text. )
AT 8366
( Header: flags, saved name and link )
BYTES 84000000D05B83
DOCON
CELL A28D
AT 8371

( TITLE-DISPLAY-ROW | NFA 8371 CFA 8378 )
( Inferred descriptive name, not recovered original: Loop )
( row index used by $83EB to place the six-byte )
( display-list scroll template. )
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

( SET-TITLE-SCREEN-POINTER | NFA 83D3 CFA 83DA )
( Inferred descriptive name, not recovered original: Writes )
( title text-screen address $A0D5 into the display-list )
( pointer at $A7E6. )
( Stack: -- )
AT 83D3
( Header: flags, saved name and link )
BYTES 84000000D3B183
DOCOL
t.TITLE-TEXT-SCREEN t.TITLE-LMS-ADDRESS t.! t.;S
AT 83E4

( INSERT-TITLE-SCROLL-ROW | NFA 83E4 CFA 83EB )
( Inferred descriptive name, not recovered original: Copies )
( six template bytes from $8348 into title display list )
( $A7E6+2+$8378. )
( Stack: -- )
AT 83E4
( Header: flags, saved name and link )
BYTES 84000000B2D383
DOCOL
t.TITLE-DISPLAY-LIST-TEMPLATE t.TITLE-LMS-ADDRESS t.2 t.+
t.TITLE-DISPLAY-ROW t.@ t.+ LIT16 0006 t.CMOVE t.;S
AT 8403

( TITLE-DISPLAY-LIST-SCRATCH | NFA 8403 CFA 8409 )
( Inferred descriptive name, not recovered original: )
( Thirteen-byte temporary copy used by $8420 while shifting )
( the title display list by two bytes; residual ALLOT text )
( has no inferred runtime meaning. )
AT 8403
( Header: flags, saved name and link )
BYTES 830000D4E483
DOVAR
BYTES 000005414C4C4F5420202020202020
AT 841A

( PREPARE-TITLE-DISPLAY | NFA 841A CFA 8420 )
( Inferred descriptive name, not recovered original: )
( Saves13 display-list bytes in $8409, reinserts them two )
( bytes later, installs the title screen pointer and )
( clears700 text-screen bytes. )
( Stack: -- )
AT 841A
( Header: flags, saved name and link )
BYTES 830000CC0384
DOCOL
t.TITLE-LMS-ADDRESS t.2+ t.TITLE-DISPLAY-LIST-SCRATCH LIT8 0D
t.CMOVE t.TITLE-DISPLAY-LIST-SCRATCH t.TITLE-LMS-ADDRESS
LIT16 0004 t.+ LIT8 0D t.CMOVE t.SET-TITLE-SCREEN-POINTER
t.TITLE-TEXT-SCREEN LIT16 02BC t.ERASE t.;S
AT 8448

( DRAW-TITLE-FRAME | NFA 8448 CFA 844F )
( Inferred descriptive name, not recovered original: )
( Selects the supplied resource collection through $485C, )
( then draws its image0 through $4D31. )
( Stack: resource -- )
AT 8448
( Header: flags, saved name and link )
BYTES 84000000C21A84
DOCOL
t.FETCH-RESOURCE t.0 t.DRAW-RESOURCE-PICTURE t.;S
AT 8459

( LOAD-TITLE-ASSETS | NFA 8459 CFA 8460 )
( Inferred descriptive name, not recovered original: )
( Performs title disk loading with an error branch, )
( installs picture resources, and selects the title font. )
AT 8459
( Header: flags, saved name and link )
BYTES 84000000D44884
DOCOL
t.0 t.LOAD-ITEM-ART-ENABLED t.! t.1 t.BANKED-TRANSFER t.!
t.DISPLAY-OFF t.1 w3FD1 t.! t.0 LIT8 A0 t.3 t.LOAD-GAM-GROUP
t.LAST-DISK-STATUS t.@
t.0BRANCH CELL 0012 ( -> 8497 )
t.RESTORE-DISPLAY t.CR
( ATASCII text: ERROR )
t.(.")
BYTES 054552524F52
( label 8493 )
t.BRANCH CELL FFFE ( -> 8493 )
( label 8497 )
t.OPEN-GAME-SCREEN t.INSTALL-GAME-COLORS
t.PREPARE-TITLE-DISPLAY t.2 t.FETCH-RESOURCE t.1
t.DRAW-RESOURCE-PICTURE LIT8 04 t.FETCH-RESOURCE t.1
t.DRAW-RESOURCE-PICTURE t.3 t.DRAW-TITLE-FRAME LIT8 04
t.DRAW-TITLE-FRAME LIT8 05 t.DRAW-TITLE-FRAME t.0 t.1 t.POS
( ATASCII text:   )
t.(.")
BYTES 0120
LIT16 0008 LIT16 BC00 t.FETCH-RESOURCE-TO LIT16 00BC
LIT16 02F4 t.C! t.AUDIO-RESOURCE-ANCHOR t.CMC-MODULE-ADDRESS
t.! LIT16 000D t.CMC-MODULE-ADDRESS t.@ LIT8 06 t.-
t.FETCH-RESOURCE-TO t.;S
AT 84F1

( VSCROL | NFA 84F1 CFA 84F6 )
( Inferred descriptive name, not recovered original: )
( Constant $D405, the ANTIC vertical-scroll hardware )
( register written by the title reveal/hide routines. )
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
t.WORD-COUNT t.STYPE t.;S
AT 8520

( TITLE-VSCROLL-UP | NFA 8520 CFA 8526 )
( Inferred descriptive name, not recovered original: )
( Writes0,2,4,6 to ANTIC VSCROL $D405 with one title-aware )
( frame wait after each value. )
( Stack: -- )
AT 8520
( Header: flags, saved name and link )
BYTES 830000BEFA84
DOCOL
LIT16 0008 t.0 t.(DO)
( label 8530 )
t.I t.VSCROL t.C! t.1 t.WAIT-TITLE-FRAMES t.2
t.(+LOOP) CELL FFF2 ( -> 8530 )
t.;S
AT 8542

( TITLE-VSCROLL-DOWN | NFA 8542 CFA 8548 )
( Inferred descriptive name, not recovered original: )
( Writes6,4,2,0 to ANTIC VSCROL $D405 with one title-aware )
( frame wait after each value. )
( Stack: -- )
AT 8542
( Header: flags, saved name and link )
BYTES 830000BC2085
DOCOL
LIT16 FFFE LIT16 0006 t.(DO)
( label 8554 )
t.I t.VSCROL t.C! t.1 t.WAIT-TITLE-FRAMES LIT16 FFFE
t.(+LOOP) CELL FFF0 ( -> 8554 )
t.;S
AT 8568

( RESET-TITLE-SCROLL | NFA 8568 CFA 856F )
( Inferred descriptive name, not recovered original: )
( Restores five template bytes at display-list $A7E6+2 and )
( clears ANTIC VSCROL. )
( Stack: -- )
AT 8568
( Header: flags, saved name and link )
BYTES 84000000B04285
DOCOL
t.TITLE-DISPLAY-LIST-TEMPLATE t.1+ t.TITLE-LMS-ADDRESS t.2+
LIT8 05 t.CMOVE t.0 t.VSCROL t.C! t.;S
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

( PRINT-TITLE-PAGE | NFA 859A CFA 85A0 )
( Inferred descriptive name, not recovered original: Loops )
( over counted text lines in the active resource, placing )
( each at line index+TITLE-ROW-OFFSET through )
( PRINT-CENTERED-TITLE-TEXT. )
( Stack: -- )
AT 859A
( Header: flags, saved name and link )
BYTES 830000C79085
DOCOL
t.0 t.RESOURCE-ADDR t.2+ t.C@ t.0 t.(DO)
( label 85AE )
t.I t.TITLE-ROW-OFFSET t.@ t.+ t.I t.1+ t.RESOURCE-ADDR
t.PRINT-CENTERED-TITLE-TEXT
t.(LOOP) CELL FFEE ( -> 85AE )
t.;S
AT 85C4

( SHOW-TITLE-TEXT-RECORD | NFA 85C4 CFA 85CA )
( Inferred descriptive name, not recovered original: Loads )
( an indexed text record from resource collection9 through )
( $4849, then prints it with $85A0. )
( Stack: record -- )
AT 85C4
( Header: flags, saved name and link )
BYTES 830000D89A85
DOCOL
LIT16 0009 t.RESOURCE-BASE t.@ t.FETCH-NESTED-RESOURCE
t.PRINT-TITLE-PAGE t.;S
AT 85DA

( ANIMATE-TITLE-PAIR | NFA 85DA CFA 85E1 )
( Inferred descriptive name, not recovered original: )
( Repeats resource6/image0 for7 frames and resource5/image0 )
( for12 frames, aborting when TITLE-SKIP-FLAG is set. )
( Stack: repetitions -- )
AT 85DA
( Header: flags, saved name and link )
BYTES 84000000D5C485
DOCOL
t.0 t.(DO)
( label 85E7 )
LIT8 06 t.DRAW-TITLE-FRAME LIT8 07 t.WAIT-TITLE-FRAMES LIT8 05
t.DRAW-TITLE-FRAME LIT8 0C t.WAIT-TITLE-FRAMES
t.TITLE-SKIP-FLAG t.@
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
t.TITLE-FOOTER-SCREEN LIT16 0050 t.- LIT16 0058 t.! t.0
t.TITLE-ROW-OFFSET t.! LIT16 0007 t.SHOW-TITLE-TEXT-RECORD
( ATASCII text: [1E][1E] )
t.(.")
BYTES 021E1E
t.;S
AT 8635

( SHOW-INITIAL-TITLE-TEXT | NFA 8635 CFA 863B )
( Inferred descriptive name, not recovered original: )
( Displays text records0 and8 with their prescribed row )
( offsets, resets scrolling and calls SETUP-TITLE-TEXT. )
( Stack: -- )
AT 8635
( Header: flags, saved name and link )
BYTES 830000D80B86
DOCOL
t.2 t.TITLE-ROW-OFFSET t.! t.0 t.SHOW-TITLE-TEXT-RECORD t.0
t.TITLE-ROW-OFFSET t.! LIT8 08 t.SHOW-TITLE-TEXT-RECORD
t.RESET-TITLE-SCROLL t.SETUP-TITLE-TEXT t.;S
AT 8658

( SCROLL-TITLE-PAGE | NFA 8658 CFA 865E )
( Inferred descriptive name, not recovered original: Loads )
( an indexed title page, records its line count, reveals )
( rows using display-list/VSCROL changes, runs the title )
( animation, and scrolls rows away again. )
( Stack: record -- )
AT 8658
( Header: flags, saved name and link )
BYTES 830000D83586
DOCOL
t.>R t.R t.TITLE-TEXT-SCREEN LIT16 0078 t.+ LIT16 0118 t.ERASE
t.RESET-TITLE-SCROLL t.TITLE-TEXT-SCREEN LIT16 0058 t.! t.2
t.TITLE-ROW-OFFSET t.! t.SHOW-TITLE-TEXT-RECORD t.0
t.RESOURCE-ADDR t.2+ t.C@ t.TITLE-PAGE-LINE-COUNT t.!
t.TITLE-PAGE-LINE-COUNT t.@ t.TITLE-ROW-OFFSET t.+! LIT8 07
t.SHOW-TITLE-TEXT-RECORD t.TITLE-PAGE-LINE-COUNT t.@ t.1+ t.0
t.2 t.DRAW-TITLE-FRAME t.(DO)
( label 86AB )
t.I t.TITLE-DISPLAY-ROW t.! t.INSERT-TITLE-SCROLL-ROW
t.TITLE-VSCROLL-DOWN
t.(LOOP) CELL FFF4 ( -> 86AB )
LIT8 04 t.DRAW-TITLE-FRAME LIT8 04 t.R> t.0=_12DE LIT8 05 t.*
t.+ t.ANIMATE-TITLE-PAIR t.-1 t.TITLE-PAGE-LINE-COUNT t.@
t.(DO)
( label 86D6 )
t.I t.TITLE-DISPLAY-ROW t.! t.INSERT-TITLE-SCROLL-ROW
t.TITLE-VSCROLL-UP t.-1
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
t.I t.SCROLL-TITLE-PAGE t.TITLE-SKIP-FLAG t.@
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
t.1 LIT16 0244 t.C! t.LOAD-TITLE-ASSETS t.CR
t.TITLE-TEXT-SCREEN LIT16 0058 t.! t.SHOW-INITIAL-TITLE-TEXT
t.RESTORE-DISPLAY t.INITIALIZE-AUDIO t.0
t.SELECT-AUDIO-SEQUENCE t.INSTALL-GAME-VBI t.RUN-TITLE-PAGES
t.SAVED-DICTIONARY-STATE t.@ t.DP t.!
t.RESTORE-DICTIONARY-LIMITS t.STOP-AUDIO LIT8 03 t.WAIT-FRAMES
t.RESTORE-OS-VBI t.GAME-MAIN-LOOP t.;S
AT 8758
( Final saved boot-sector padding: retired N>N / SAVE-RUN )
BYTES 834E3ECE1587411466173417E413771288534156452D5255CE588741
BYTES 14A5242D0F1F87D5146216A5
AT 8780
