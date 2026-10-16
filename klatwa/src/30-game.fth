( Klatwa v1 30-game.fth: target 6018..882B )
( Hexadecimal. BYTES emits bytes; CELL emits 16-bit cells. )
( LIT8/LIT16 compile literals; branches retain signed )
( offsets. )
( 6502 mnemonics use 06-assembler.fth; operands follow )
( words. )

( SET-GAME-MUSIC-BASE | NFA 6018 CFA 601F )
( Inferred descriptive name, not recovered original: Stores )
( $5E93-$069A in music-load pointer $5E9E; $6035 then loads )
( gameplay resource12 there. )
( Stack: -- )
AT 6018
( Header: flags, saved name and link )
BYTES 84000000A1FA5F
DOCOL
t.TITLE-MUSIC-OR-SPRITES LIT16 069A t.- t.CMC-MODULE-ADDRESS
t.! t.;S
AT 602F

( INIT-GAME-DISPLAY-AUDIO | NFA 602F CFA 6035 )
( Inferred descriptive name, not recovered original: )
( Disables DMA, loads resource12 music, initializes )
( CMC/song0, installs gameplay display and font resource7 )
( at $BC00, loads player frames resource10 at $8D52, then )
( restores DMA. )
( Stack: -- )
AT 602F
( Header: flags, saved name and link )
BYTES 830000CC1860
DOCOL
t.1 LIT16 02F0 t.C! t.DISABLE-DISPLAY-DMA
t.SET-GAME-MUSIC-BASE LIT8 0C t.CMC-MODULE-ADDRESS t.@
LIT16 0006 t.- t.FETCH-RESOURCE-TO t.INIT-CMC-MODULE t.0
t.PLAY-MUSIC t.INIT-GAME-SCREEN t.RESET-GAME-COLORS t.0 t.1
t.POS
( ATASCII text:       )
t.(.")
BYTES 052020202020
LIT16 0007 LIT16 BC00 t.FETCH-RESOURCE-TO LIT16 00BC
LIT16 02F4 t.C! LIT8 0A t.TITLE-MUSIC-OR-SPRITES
t.FETCH-RESOURCE-TO t.RESTORE-DISPLAY-DMA t.;S
AT 6089

( PRINT-SPELLBOOK-SEPARATOR | NFA 6089 CFA 608E )
( Inferred descriptive name, not recovered original: Prints )
( the inline decorative separator reused for the upper and )
( lower spellbook rules. )
( Stack: -- )
AT 6089
( Header: flags, saved name and link )
BYTES 8200A32F60
DOCOL
( Game text: [A4] [2A][2A][2A][2A][2A][2A][2A][2A][2A] )
( [23][24] [2A][2A][2A][2A][2A][2A][2A][2A][2A] [A3] )
t.(S")
BYTES 1AA43D2A2A2A2A2A2A2A2A2A3D23243D2A2A2A2A2A2A2A2A2A3DA3
t.;S
AT 60AF

( DRAW-SPELLBOOK | NFA 60AF CFA 60B5 )
( Inferred descriptive name, not recovered original: Prints )
( KSIEGA CZAROW, then five rows of two 13-character entries )
( from $5577 and their decorative frame. )
( Stack: -- )
AT 60AF
( Header: flags, saved name and link )
BYTES 830000D38960
DOCOL
LIT8 07 t.1 t.POS LIT8 A2 t.EMIT
( Game text:    KSIEGA  [21] )
t.(S")
BYTES 0C3D3D3D4B53496547413D3D21
LIT8 22 t.EMIT
( Game text:   CZAROW   [A1] )
t.(S")
BYTES 0C3D3D435A41526F573D3D3DA1
LIT8 07 t.2 t.POS t.PRINT-SPELLBOOK-SEPARATOR LIT8 05 t.0
t.(DO)
( label 60F6 )
t.I t.3 t.+ t.Y! LIT8 07 t.X! t.I t.2 t.* t.SPELLBOOK-RECORDS
LIT16 0005 t.+ LIT8 0D t.STYPE LIT8 14 t.X! t.I t.2 t.* t.1+
t.SPELLBOOK-RECORDS LIT16 0005 t.+ LIT8 0D t.STYPE
t.(LOOP) CELL FFC4 ( -> 60F6 )
LIT8 07 LIT8 08 t.POS t.PRINT-SPELLBOOK-SEPARATOR LIT8 07
LIT8 09 t.POS
( Game text: )
( [AB][DC][DC][DC][DC][DC][DC][DC][DC][DC][DC][DC][A5][A6][D )
( C][DC][DC][DC][DC][DC][DC][DC][DC][DC][DC][AD] )
t.(S")
BYTES 1AABDCDCDCDCDCDCDCDCDCDCDCA5A6DCDCDCDCDCDCDCDCDCDCDCAD
t.;S
AT 6165

( PLAY-FAILURE-SOUND | NFA 6165 CFA 616C )
( Inferred descriptive name, not recovered original: Plays )
( effect19 via $6000; spell/item failure paths call this )
( helper. )
( Stack: -- )
AT 6165
( Header: flags, saved name and link )
BYTES 84000000DAAF60
DOCOL
LIT8 13 t.PLAY-SOUND-EFFECT t.;S
AT 6175

( FIND-ROOM-VIEW-OBJECT | NFA 6175 CFA 617B )
( Inferred descriptive name, not recovered original: Uses )
( room/view lookup $5A35 and INSTR over the counted byte )
( list. Returns the matching mutable byte address and1, or0 )
( when absent. )
( Stack: object room view -- address 1 | 0 )
AT 6175
( Header: flags, saved name and link )
BYTES 830000C26561
DOCOL
t.ROOM-VIEW-OBJECTS t.DUP t.>R t.WORD-COUNT t.FIND-BYTE-FIRST
t.DUP
t.0BRANCH CELL 000A ( -> 6195 )
t.R t.+ t.1+ t.1
( label 6195 )
t.R> t.DROP t.;S
AT 619B

( SPELL-ERROR-MESSAGES | NFA 619B CFA 61A0 )
( Inferred descriptive name, not recovered original: )
( Counted message vector used by $6256 for the wrong spell )
( and missing ingredient outcomes. )
( Stack: index -- record )
( Decoded text: Spell messages )
( item 0 line 1 $61AA: TEN CZAR NIE )
( item 0 line 2 $61B7: ZADZIALA )
( item 1 $61C1: [incomplete message placeholder; retained )
( raw] )
( item 2 line 1 $61C6: BRAK CI JEDNEGO )
( item 2 line 2 $61D6: PRZEDMIOTU )
AT 619B
( Header: flags, saved name and link )
BYTES 8200C37561
DODOES
( DOES> thread at 3F47 )
BYTES 473F40001700020C54454E3D435A41523D4E4945085A41445A49416C
BYTES 410100011C00020F4252414B3D43493D4A45444E45474F0A50525A45
BYTES 444D494F54555A45444D8242
AT 61E6

( NO-MAGIC-MESSAGE | NFA 61E6 CFA 61EB )
( Inferred descriptive name, not recovered original: )
( Multiline message states that magical power is absent and )
( one of the stones will restore it; displayed by $6256 and )
( $7E02. )
( Stack: -- record )
( Decoded text: Message lines )
( line 1 $61F1: NIE MASZ JUZ )
( line 2 $61FE: MAGICZNEJ MOCY, )
( line 3 $620E: JEDEN Z KAMIENI )
( line 4 $621E: JA PRZYWROCI )
AT 61E6
( Header: flags, saved name and link )
BYTES 8200C39B61
DOVAR
BYTES 3B00040C4E49453D4D41535A3D4A557A0F4D414749435A4E454A3D4D
BYTES 4F43592C0F4A4544454E3D5A3D4B414D49454E490C4A613D50525A59
BYTES 57526F4349528341
AT 622D

( HAVE-SPELL-INGREDIENT | NFA 622D CFA 6233 )
( Inferred descriptive name, not recovered original: )
( Fetches an ingredient ID at the supplied address, accepts )
( zero as no requirement, otherwise checks object )
( membership in room0/view1 [inventory]. )
( Stack: address -- flag )
AT 622D
( Header: flags, saved name and link )
BYTES 830000DAE661
DOCOL
t.C@ t.DUP t.0 t.1 t.FIND-ROOM-VIEW-OBJECT
t.0BRANCH CELL 000A ( -> 624B )
t.2DROP t.1
t.BRANCH CELL 0004 ( -> 624D )
( label 624B )
t.0=_12DE
( label 624D )
t.;S
AT 624F

( CHOOSE-REQUIRED-SPELL | NFA 624F CFA 6256 )
( Inferred descriptive name, not recovered original: )
( Rejects when puzzle-state cell2 disables magic. Otherwise )
( displays the 2x5 spellbook, compares chosen spell ID to )
( the argument and verifies its two ingredient IDs; returns )
( success/failure. )
( Stack: spell -- flag )
AT 624F
( Header: flags, saved name and link )
BYTES 84000000C12D62
DOCOL
t.2 t.PUZZLE-STATE-CELLS t.@ t.0=_12DE
t.0BRANCH CELL 0093 ( -> 62F5 )
t.>R t.SAVE-VIEW-CURSOR LIT8 0C LIT8 92 t.CURSOR-ORIGIN! t.2
LIT16 0005 t.CURSOR-LIMITS! LIT8 34 LIT16 0008 t.CURSOR-STEPS!
t.0 t.CURSOR-AXIS t.! t.0 t.CURSOR-GRID-POS t.!
t.CLEAR-TEXT-AREA t.DRAW-SPELLBOOK t.1 t.PLAY-SOUND-EFFECT
t.WAIT-GAME-INPUT t.2 t.* t.+ t.SPELLBOOK-RECORDS t.2+ t.DUP
t.C@ t.R> t.=
t.0BRANCH CELL 0032 ( -> 62DD )
t.1+ t.DUP t.HAVE-SPELL-INGREDIENT t.SWAP t.1+
t.HAVE-SPELL-INGREDIENT t.2DUP t.*
t.0BRANCH CELL 000A ( -> 62C9 )
t.2DROP t.1
t.BRANCH CELL 0012 ( -> 62D9 )
( label 62C9 )
t.CLEAR-TEXT-AREA t.PLAY-FAILURE-SOUND t.+ t.1+
t.SPELL-ERROR-MESSAGES t.2+ t.SHOW-MESSAGE t.0
( label 62D9 )
t.BRANCH CELL 0012 ( -> 62ED )
( label 62DD )
t.DROP t.PLAY-FAILURE-SOUND t.CLEAR-TEXT-AREA t.0
t.SPELL-ERROR-MESSAGES t.2+ t.SHOW-MESSAGE t.0
( label 62ED )
t.CONFIGURE-VIEW-CURSOR t.RESTORE-VIEW-CURSOR
t.BRANCH CELL 0010 ( -> 6303 )
( label 62F5 )
t.DROP t.CLEAR-TEXT-AREA t.PLAY-FAILURE-SOUND
t.NO-MAGIC-MESSAGE t.2+ t.SHOW-MESSAGE t.0
( label 6303 )
t.;S
AT 6305

( SPELL-LEARNING-POINTERS | NFA 6305 CFA 630A )
( Inferred descriptive name, not recovered original: Two )
( cells assigned by $6316 to the source counted spell name )
( and destination spellbook characters; $7AF0 reveals the )
( text using these pointers. )
( Stack: -- address )
AT 6305
( Header: flags, saved name and link )
BYTES 8200C34F62
DOVAR
BYTES 00000541
AT 6310

( PREPARE-LEARNED-SPELL | NFA 6310 CFA 6316 )
( Inferred descriptive name, not recovered original: )
( Searches ten spellbook entries for the same spell ID or )
( an empty slot, copies three metadata bytes, then )
( initializes source/destination pointers at $630A. )
( Stack: spell-record -- )
AT 6310
( Header: flags, saved name and link )
BYTES 830000A10563
DOCOL
LIT8 0A t.0 t.(DO)
( label 631F )
t.I t.SPELLBOOK-RECORDS t.2+ t.C@ t.>R t.R t.OVER t.C@ t.=
t.R> t.0=_12DE t.+
t.0BRANCH CELL 000A ( -> 6343 )
t.I t.SPELLBOOK-RECORDS t.2+ t.LEAVE
( label 6343 )
t.(LOOP) CELL FFDA ( -> 631F )
t.2DUP t.3 t.CMOVE LIT8 05 t.+ t.SPELL-LEARNING-POINTERS t.2+
t.! t.3 t.+ t.SPELL-LEARNING-POINTERS t.! t.;S
AT 6362

( ACTION-LABELS | NFA 6362 CFA 6369 )
( Inferred descriptive name, not recovered original: )
( Counted action-label vector used by $6593: NIC, ZOSTAW, )
( WEZ, ZOBACZ and spell/puzzle verbs. One-byte entries )
( reference another zero-based entry. )
( Stack: index -- record )
( Decoded text: Action labels )
( item 0 $6371: NIC )
( item 1 $6376: NIE PATRZ )
( item 2 $6381 -> item 94: [reference outside this table; )
( retained raw] )
( item 3 $6384: ZOSTAW )
( item 4 $638C: WEZ )
( item 5 $6391: ZOBACZ )
( item 6 $6399: CO TO )
( item 7 $63A0: POCZATEK )
( item 8 $63AA: ODCZYT )
( item 9 $63B2: ZAPIS )
( item 10 $63B9 -> item 80: [reference outside this table; )
( retained raw] )
( item 11 $63BC -> item 75: [reference outside this table; )
( retained raw] )
( item 12 $63BF -> item 82: [reference outside this table; )
( retained raw] )
( item 13 $63C2: OTWORZ )
( item 14 $63CA: ZAMKNIJ )
( item 15 $63D3: IDZ )
( item 16 $63D8 -> item 13: OTWORZ )
( item 17 $63DB -> item 14: ZAMKNIJ )
( item 18 $63DE: PRZEPISZ )
( item 19 $63E8 -> item 6: CO TO )
( item 20 $63EB: OTWORZ )
( item 21 $63F3: ZAKLECIE )
( item 22 $63FD: ZNISZCZ )
( item 23 $6406: PODNIES )
( item 24 $640F: DOTKNIJ )
( item 25 $6418 -> item 6: CO TO )
( item 26 $641B -> item 13: OTWORZ )
( item 27 $641E: ZBADAJ )
( item 28 $6426 -> item 13: OTWORZ )
( item 29 $6429 -> item 21: ZAKLECIE )
( item 30 $642C -> item 13: OTWORZ )
( item 31 $642F -> item 14: ZAMKNIJ )
( item 32 $6432 -> item 21: ZAKLECIE )
( item 33 $6435: WEZ )
( item 34 $643A: ZAGRAJ )
( item 35 $6442 -> item 14: ZAMKNIJ )
( item 36 $6445: ZAPLAC )
( item 37 $644D: ZDEJMIJ )
( item 38 $6456 -> item 21: ZAKLECIE )
( item 39 $6459: ZLAP )
( item 40 $645F -> item 21: ZAKLECIE )
( item 41 $6462: PODNIES )
( item 42 $646B -> item 18: PRZEPISZ )
( item 43 $646E: IDZ )
( item 44 $6473: PRZECZYTAJ )
( item 45 $647F: NACISNIJ )
( item 46 $6489: ZBADAJ )
( item 47 $6491 -> item 5: ZOBACZ )
( item 48 $6494 -> item 22: ZNISZCZ )
( item 49 $6497 -> item 13: OTWORZ )
( item 50 $649A: SLUCHAJ )
( item 51 $64A3 -> item 36: ZAPLAC )
( item 52 $64A6 -> item 21: ZAKLECIE )
( item 53 $64A9 -> item 21: ZAKLECIE )
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

( OBJECT-ACTION-BUFFER | NFA 64B9 CFA 64BE )
( Inferred descriptive name, not recovered original: )
( Constant $97CA, destination of the selected scene-object )
( action-record load at $64E5. )
( Stack: -- address )
AT 64B9
( Header: flags, saved name and link )
BYTES 8200D46263
DOCON
CELL 97CA
AT 64C2

( SCENE-OBJECT-DATA-PTR | NFA 64C2 CFA 64C8 )
( Inferred descriptive name, not recovered original: Set by )
( $64E5 to the metadata following a matched scene-object )
( selector; accessed by $673C and descriptor-byte helpers. )
( Stack: -- address )
AT 64C2
( Header: flags, saved name and link )
BYTES 830000CBB964
DOVAR
CELL 0000
AT 64CC

( OBJECT-ACTIONS-PTR | NFA 64CC CFA 64D2 )
( Inferred descriptive name, not recovered original: Points )
( at the currently selected object action-list record, )
( assigned by scene/inventory selection and consumed by the )
( action menu. )
( Stack: -- address )
AT 64CC
( Header: flags, saved name and link )
BYTES 830000C5C264
DOVAR
CELL 0000
AT 64D6

( SELECTED-OBJECT | NFA 64D6 CFA 64DB )
( Inferred descriptive name, not recovered original: )
( Assigned by $656F and read by the action-menu builder and )
( take-object action. )
( Stack: -- address )
AT 64D6
( Header: flags, saved name and link )
BYTES 8200C5CC64
DOVAR
CELL 0000
AT 64DF

( SELECT-SCENE-OBJECT | NFA 64DF CFA 64E5 )
( Inferred descriptive name, not recovered original: Looks )
( for objectID+200 in the current room descriptor; saves )
( its following metadata pointer, selects the referenced )
( resource record, and loads its action list at $97CA. )
( Stack: object -- )
AT 64DF
( Header: flags, saved name and link )
BYTES 830000CBD664
DOCOL
LIT8 C8 t.+ t.1 t.ROOM-RECORD-BUFFER t.LENGTH-RECORD-ADDR
t.WORD-COUNT t.OVER t.>R t.FIND-BYTE-FIRST t.-DUP
t.0BRANCH CELL 001A ( -> 6518 )
t.1 t.- t.R t.+ t.DUP t.2+ t.SCENE-OBJECT-DATA-PTR t.! t.1+
t.C@
t.BRANCH CELL 0004 ( -> 651A )
( label 6518 )
t.1
( label 651A )
t.0 t.OBJECT-ACTION-BUFFER t.FETCH-NESTED-RESOURCE
t.OBJECT-ACTION-BUFFER t.OBJECT-ACTIONS-PTR t.! t.R> t.DROP
t.;S
AT 652C

( SELECT-INVENTORY-OBJECT | NFA 652C CFA 6532 )
( Inferred descriptive name, not recovered original: For a )
( nonzero inventory ID, scans records1..99 in resource1 of )
( the inventory group for the matching ID byte and installs )
( the record pointer at $64D2. )
( Stack: object -- )
AT 652C
( Header: flags, saved name and link )
BYTES 830000D2DF64
DOCOL
t.-DUP
t.0BRANCH CELL 002F ( -> 6567 )
LIT8 64 t.1 t.(DO)
( label 6541 )
t.I t.1 t.ITEM-RESOURCE-ADDR t.2+ t.LENGTH-RECORD-ADDR t.2+
t.DUP t.OBJECT-ACTIONS-PTR t.! t.2+ t.C@ t.OVER t.=
t.0BRANCH CELL 0004 ( -> 6561 )
t.LEAVE
( label 6561 )
t.(LOOP) CELL FFDE ( -> 6541 )
t.DROP
( label 6567 )
t.;S
AT 6569

( SELECT-OBJECT-ACTIONS | NFA 6569 CFA 656F )
( Inferred descriptive name, not recovered original: Stores )
( SELECTED-OBJECT, dispatching IDs above200 to )
( inventory-record search and other IDs to current scene )
( metadata. )
( Stack: object -- )
AT 6569
( Header: flags, saved name and link )
BYTES 830000D72C65
DOCOL
t.DUP t.SELECTED-OBJECT t.! t.DUP LIT8 C8 t.>
t.0BRANCH CELL 0008 ( -> 6588 )
t.SELECT-INVENTORY-OBJECT
t.BRANCH CELL 0004 ( -> 658A )
( label 6588 )
t.SELECT-SCENE-OBJECT
( label 658A )
t.;S
AT 658C

( APPEND-ACTION-LABEL | NFA 658C CFA 6593 )
( Inferred descriptive name, not recovered original: )
( Resolves a one-byte action-label alias once, converts the )
( word-counted label to a byte-counted string in the )
( destination, and returns the next output address. )
( Stack: destination action -- next-destination )
AT 658C
( Header: flags, saved name and link )
BYTES 84000000D26965
DOCOL
t.SWAP t.>R t.ACTION-LABELS t.DUP t.C@ t.2 t.<
t.0BRANCH CELL 0008 ( -> 65AD )
t.2+ t.C@ t.ACTION-LABELS
( label 65AD )
t.WORD-COUNT t.DUP t.R t.C! t.R t.1+ t.SWAP t.CMOVE t.R>
t.COUNT t.+ t.;S
AT 65C5

( MENU-ACTION-IDS | NFA 65C5 CFA 65CA )
( Inferred descriptive name, not recovered original: Cell )
( array populated by $65E8 with the action ID represented )
( by each visible menu row; $669C indexes it after )
( selection. )
( Stack: row -- address )
AT 65C5
( Header: flags, saved name and link )
BYTES 8200C58C65
DODOES
( DOES> thread at 51CD )
BYTES CD512020202020202020202020202020202020202020
AT 65E2

( DRAW-ACTION-MENU | NFA 65E2 CFA 65E8 )
( Inferred descriptive name, not recovered original: Builds )
( counted label strings in the picture staging buffer, )
( records menu-row action IDs, optionally adds )
( NIC/return-from-view, and displays the message list. )
( Stack: -- )
AT 65E2
( Header: flags, saved name and link )
BYTES 830000D9C565
DOCOL
t.PICTURE-STAGING@ LIT8 4C t.ERASE t.PICTURE-STAGING@ t.1+
t.LOAD-ITEM-ART-ENABLED t.@
t.0BRANCH CELL 0014 ( -> 660F )
t.0 t.APPEND-ACTION-LABEL t.0 t.0 t.MENU-ACTION-IDS t.! t.1
t.PICTURE-STAGING@ t.BYTE+!
( label 660F )
t.SELECTED-OBJECT t.@
t.0BRANCH CELL 0047 ( -> 665C )
LIT8 0B t.1 t.(DO)
( label 661E )
t.I t.OBJECT-ACTIONS-PTR t.@ t.LENGTH-RECORD-ADDR t.DUP t.C@
t.0BRANCH CELL 001E ( -> 664A )
t.2+ t.C@ t.DUP t.I t.1 t.- t.PICTURE-STAGING@ t.C@ t.+
t.MENU-ACTION-IDS t.! t.APPEND-ACTION-LABEL
t.BRANCH CELL 0010 ( -> 6658 )
( label 664A )
t.DROP t.I t.1 t.- t.PICTURE-STAGING@ t.BYTE+! t.LEAVE
( label 6658 )
t.(LOOP) CELL FFC4 ( -> 661E )
( label 665C )
t.LOAD-ITEM-ART-ENABLED t.@ t.VIEW-STACK t.C@ t.*
t.0BRANCH CELL 001C ( -> 6684 )
t.1 t.DUP t.PICTURE-STAGING@ t.C@ t.MENU-ACTION-IDS t.!
t.APPEND-ACTION-LABEL t.DROP t.1 t.PICTURE-STAGING@ t.BYTE+!
t.BRANCH CELL 0004 ( -> 6686 )
( label 6684 )
t.DROP
( label 6686 )
t.PICTURE-STAGING@ t.SHOW-MESSAGE t.;S
AT 668C

( SELECTED-ACTION-PTR | NFA 668C CFA 6692 )
( Inferred descriptive name, not recovered original: )
( Current counted action record, assigned by $669C; all )
( action parameters are fetched relative to this pointer. )
( Stack: -- address )
AT 668C
( Header: flags, saved name and link )
BYTES 830000D7E265
DOVAR
CELL 0000
AT 6696

( CHOOSE-ACTION-MENU-ROW | NFA 6696 CFA 669C )
( Inferred descriptive name, not recovered original: Saves )
( cursor position, sizes/positions the menu cursor, waits )
( for selection, stores the selected action-record pointer )
( and returns the corresponding action ID. )
( Stack: -- action )
AT 6696
( Header: flags, saved name and link )
BYTES 830000D28C66
DOCOL
t.SAVE-VIEW-CURSOR LIT8 15 t.MESSAGE-FRAME-WIDTH t.@ t.2 t./
t.- LIT8 89 t.CURSOR-ORIGIN! t.MESSAGE-FRAME-WIDTH t.@ t.2 t.-
t.PICTURE-STAGING@ t.C@ t.CURSOR-LIMITS! LIT8 04 LIT8 08
t.CURSOR-STEPS! t.0 t.CURSOR-GRID-POS t.1+ t.C!
t.MESSAGE-FRAME-WIDTH t.@ t.2 t./ t.MESSAGE-FIRST-LINE-WIDTH
t.@ t.2 t./MOD t.+ t.+ t.3 t.- t.CURSOR-GRID-POS t.C!
t.WAIT-GAME-INPUT t.SWAP t.DROP t.DUP t.OBJECT-ACTIONS-PTR t.@
t.LENGTH-RECORD-ADDR t.SELECTED-ACTION-PTR t.!
t.MENU-ACTION-IDS t.@ t.CONFIGURE-VIEW-CURSOR
t.RESTORE-VIEW-CURSOR t.;S
AT 6708

( CHOOSE-OBJECT-ACTION | NFA 6708 CFA 6710 )
( Inferred descriptive name, not recovered original: Draws )
( the action menu with $65E8 and returns the selection from )
( $669C. )
( Stack: -- action )
AT 6708
( Header: flags, saved name and link )
BYTES 8500000000C29666
DOCOL
t.DRAW-ACTION-MENU t.CHOOSE-ACTION-MENU-ROW t.;S
AT 6718

( ACTION-PARAM-ADDR | NFA 6718 CFA 671D )
( Inferred descriptive name, not recovered original: Adds )
( the given offset and two-byte count prefix to the record )
( pointer held at $6692. )
( Stack: offset -- address )
AT 6718
( Header: flags, saved name and link )
BYTES 8200D90867
DOCOL
t.SELECTED-ACTION-PTR t.@ t.+ t.2+ t.;S
AT 6729

( ACTION-PARAM-BYTE | NFA 6729 CFA 672F )
( Inferred descriptive name, not recovered original: )
( Fetches the byte at ACTION-PARAM-ADDR. )
( Stack: offset -- byte )
AT 6729
( Header: flags, saved name and link )
BYTES 830000C01867
DOCOL
t.ACTION-PARAM-ADDR t.C@ t.;S
AT 6737

( SCENE-OBJECT-DATA | NFA 6737 CFA 673C )
( Inferred descriptive name, not recovered original: )
( Fetches the current object metadata pointer held at $64C8. )
( Stack: -- address )
AT 6737
( Header: flags, saved name and link )
BYTES 8200CB2967
DOCOL
t.SCENE-OBJECT-DATA-PTR t.@ t.;S
AT 6744

( OBJECT-DATA-0 | NFA 6744 CFA 6749 )
( Inferred descriptive name, not recovered original: )
( Fetches byte0 of the metadata pointer returned by $673C; )
( the interpretation varies by action handler. )
( Stack: -- byte )
AT 6744
( Header: flags, saved name and link )
BYTES 8200CB3767
DOCOL
t.SCENE-OBJECT-DATA t.C@ t.;S
AT 6751

( OBJECT-DATA-1 | NFA 6751 CFA 6756 )
( Inferred descriptive name, not recovered original: )
( Fetches byte1 of the metadata pointer returned by $673C; )
( the interpretation varies by action handler. )
( Stack: -- byte )
AT 6751
( Header: flags, saved name and link )
BYTES 8200CB4467
DOCOL
t.SCENE-OBJECT-DATA t.1+ t.C@ t.;S
AT 6760

( OBJECT-DATA-2 | NFA 6760 CFA 6765 )
( Inferred descriptive name, not recovered original: )
( Fetches byte2 of the metadata pointer returned by $673C; )
( the interpretation varies by action handler. )
( Stack: -- byte )
AT 6760
( Header: flags, saved name and link )
BYTES 8200CB5167
DOCOL
t.SCENE-OBJECT-DATA t.2+ t.C@ t.;S
AT 676F

( ADD-ROOM-VIEW-OBJECT | NFA 676F CFA 6774 )
( Inferred descriptive name, not recovered original: )
( Returns success if the object is already in the mutable )
( room/view list; otherwise replaces its first zero slot. )
( Returns0 if no empty slot exists. )
( Stack: object room view -- flag )
AT 676F
( Header: flags, saved name and link )
BYTES 8200C26067
DOCOL
t.>R t.2DUP t.R t.FIND-ROOM-VIEW-OBJECT
t.0BRANCH CELL 000E ( -> 678E )
t.2DROP t.R> t.2DROP t.1
t.BRANCH CELL 001A ( -> 67A6 )
( label 678E )
t.0 t.SWAP t.R> t.FIND-ROOM-VIEW-OBJECT
t.0BRANCH CELL 000A ( -> 67A2 )
t.C! t.1
t.BRANCH CELL 0006 ( -> 67A6 )
( label 67A2 )
t.DROP t.0
( label 67A6 )
t.;S
AT 67A8

( ADD-CURRENT-VIEW-OBJECT | NFA 67A8 CFA 67AE )
( Inferred descriptive name, not recovered original: Adds )
( the object to CURRENT-ROOM and current view P through )
( $6774, discarding the capacity result. )
( Stack: object -- )
AT 67A8
( Header: flags, saved name and link )
BYTES 830000A16F67
DOCOL
t.CURRENT-ROOM t.@ t.P t.ADD-ROOM-VIEW-OBJECT t.DROP t.;S
AT 67BC

( REMOVE-ROOM-VIEW-OBJECT | NFA 67BC CFA 67C2 )
( Inferred descriptive name, not recovered original: Finds )
( the object in the specified mutable room/view list and )
( replaces its byte with zero; does nothing if absent. )
( Stack: object room view -- )
AT 67BC
( Header: flags, saved name and link )
BYTES 830000C2A867
DOCOL
t.FIND-ROOM-VIEW-OBJECT
t.0BRANCH CELL 0008 ( -> 67D0 )
t.0 t.SWAP t.C!
( label 67D0 )
t.;S
AT 67D2

( REMOVE-CURRENT-VIEW-OBJECT | NFA 67D2 CFA 67D9 )
( Inferred descriptive name, not recovered original: )
( Removes the object from CURRENT-ROOM and current view P. )
( Stack: object -- )
AT 67D2
( Header: flags, saved name and link )
BYTES 84000000A1BC67
DOCOL
t.CURRENT-ROOM t.@ t.P t.REMOVE-ROOM-VIEW-OBJECT t.;S
AT 67E5

( INVENTORY-FULL-MESSAGE | NFA 67E5 CFA 67EA )
( Inferred descriptive name, not recovered original: )
( Counted message NIE UNIESIESZ TYLE, displayed when $6809 )
( cannot add an inventory item. )
( Stack: -- record )
( Decoded text: Message lines )
( line 1 $67F0: NIE UNIESIESZ )
( line 2 $67FE: TYLE )
AT 67E5
( Header: flags, saved name and link )
BYTES 8200D2D267
DOVAR
BYTES 1400020D4E49453D554E4945534945535A0454594C4520
AT 6803

( ADD-INVENTORY-ITEM | NFA 6803 CFA 6809 )
( Inferred descriptive name, not recovered original: Adds )
( an item to room0/view1. On success computes its displayed )
( inventory coordinates from slot number, writes )
( $5638[item-202], and returns1; otherwise displays )
( capacity error and returns0. )
( Stack: item -- flag )
AT 6803
( Header: flags, saved name and link )
BYTES 830000A1E567
DOCOL
t.>R t.R t.0 t.1 t.ADD-ROOM-VIEW-OBJECT
t.0BRANCH CELL 003B ( -> 6852 )
t.R LIT8 CA t.- t.R t.0 t.1 t.ROOM-VIEW-OBJECTS t.WORD-COUNT
t.FIND-BYTE-FIRST t.2 t.- LIT16 0004 t.* LIT8 0B t.+ t.OVER
t.ITEM-POSITIONS t.C! LIT8 4E t.SWAP t.ITEM-POSITIONS t.1+
t.C! t.1
t.BRANCH CELL 000C ( -> 685C )
( label 6852 )
t.PLAY-FAILURE-SOUND t.INVENTORY-FULL-MESSAGE t.2+
t.SHOW-MESSAGE t.0
( label 685C )
t.R> t.DROP t.;S
AT 6862

( REMOVE-INVENTORY-ITEM | NFA 6862 CFA 6869 )
( Inferred descriptive name, not recovered original: )
( Removes an item from the inventory object list at )
( room0/view1. )
( Stack: item -- )
AT 6862
( Header: flags, saved name and link )
BYTES 84000000A10368
DOCOL
t.0 t.1 t.REMOVE-ROOM-VIEW-OBJECT t.;S
AT 6873

( ACTION-PARAM-1 | NFA 6873 CFA 6878 )
( Inferred descriptive name, not recovered original: )
( Fetches selected action payload byte1 through $672F. )
( Stack: -- byte )
AT 6873
( Header: flags, saved name and link )
BYTES 8200D76268
DOCOL
t.1 t.ACTION-PARAM-BYTE t.;S
AT 6880

( ACTION-PARAM-2 | NFA 6880 CFA 6885 )
( Inferred descriptive name, not recovered original: )
( Fetches selected action payload byte2 through $672F. )
( Stack: -- byte )
AT 6880
( Header: flags, saved name and link )
BYTES 8200D77368
DOCOL
t.2 t.ACTION-PARAM-BYTE t.;S
AT 688D

( ACTION-PARAM-3 | NFA 688D CFA 6892 )
( Inferred descriptive name, not recovered original: )
( Fetches selected action payload byte3 through $672F. )
( Stack: -- byte )
AT 688D
( Header: flags, saved name and link )
BYTES 8200D78068
DOCOL
t.3 t.ACTION-PARAM-BYTE t.;S
AT 689A

( ACTION-PARAM-4 | NFA 689A CFA 689F )
( Inferred descriptive name, not recovered original: )
( Fetches selected action payload byte4 through $672F. )
( Stack: -- byte )
AT 689A
( Header: flags, saved name and link )
BYTES 8200D78D68
DOCOL
LIT16 0004 t.ACTION-PARAM-BYTE t.;S
AT 68A9

( ACTION-PARAM-5 | NFA 68A9 CFA 68AE )
( Inferred descriptive name, not recovered original: )
( Fetches selected action payload byte5 through $672F. )
( Stack: -- byte )
AT 68A9
( Header: flags, saved name and link )
BYTES 8200D79A68
DOCOL
LIT16 0005 t.ACTION-PARAM-BYTE t.;S
AT 68B8

( ACTION-PARAM-6 | NFA 68B8 CFA 68BD )
( Inferred descriptive name, not recovered original: )
( Fetches selected action payload byte6 through $672F. )
( Stack: -- byte )
AT 68B8
( Header: flags, saved name and link )
BYTES 8200D7A968
DOCOL
LIT16 0006 t.ACTION-PARAM-BYTE t.;S
AT 68C7

( OBJECT-HIT-MAP-XY | NFA 68C7 CFA 68CE )
( Inferred descriptive name, not recovered original: )
( Searches the hit-map byte grid for an object ID, converts )
( its linear index into x and 6-row y units, then adds the )
( current view origin. Caller $7783 uses it to place )
( dropped items. )
( Stack: object -- x y )
AT 68C7
( Header: flags, saved name and link )
BYTES 84000000CBB868
DOCOL
t.HIT-MAP@ t.DUP t.>R t.2+ t.R t.BYTE-PAIR@ t.*
t.FIND-BYTE-FIRST t.1 t.- t.R> t.C@ t./MOD LIT8 06 t.*
t.VIEW-STACK t.C@
t.0BRANCH CELL 000A ( -> 68FF )
t.SCENE-PICTURE-BUFFER t.BYTE-PAIR@
t.BRANCH CELL 0008 ( -> 6905 )
( label 68FF )
LIT16 0004 t.0
( label 6905 )
t.ROT t.+ t.>R t.+ t.R> t.;S
AT 6911

( NO-ITEM-CHOSEN-MESSAGE | NFA 6911 CFA 6916 )
( Inferred descriptive name, not recovered original: )
( Counted message NIE POKAZALES RZECZY, used when inventory )
( selection returns object zero. )
( Stack: -- record )
( Decoded text: Message lines )
( line 1 $691C: NIE POKAZALES )
( line 2 $692A: RZECZY )
AT 6911
( Header: flags, saved name and link )
BYTES 8200D2C768
DOVAR
BYTES 1600020D4E49453D504F4B415A416C457306525A45435A59
AT 6930

( CHOOSE-INVENTORY-ITEM | NFA 6930 CFA 6936 )
( Inferred descriptive name, not recovered original: Opens )
( inventory, waits for cursor selection, reads its hit-map )
( object ID, displays an error for zero, restores the prior )
( view, and returns the item ID. )
( Stack: -- item )
AT 6930
( Header: flags, saved name and link )
BYTES 830000BF1169
DOCOL
t.ENTER-INVENTORY-VIEW LIT8 10 t.PLAY-SOUND-EFFECT
t.WAIT-GAME-INPUT t.HIT-MAP-CELL t.DUP t.0=_12DE
t.0BRANCH CELL 000C ( -> 6955 )
t.PLAY-FAILURE-SOUND t.CLEAR-TEXT-AREA
t.NO-ITEM-CHOSEN-MESSAGE t.2+ t.SHOW-MESSAGE
( label 6955 )
t.LEAVE-INVENTORY-VIEW t.;S
AT 6959

( START-MENU-RECORDS | NFA 6959 CFA 695F )
( Inferred descriptive name, not recovered original: Data )
( carried under DOCOL, not executed as threaded code: )
( counted records for actions7 and8 [new game/load]. $6986 )
( assigns this PFA directly when gameplay is inactive. )
AT 6959
( Header: flags, saved name and link )
BYTES 830000B03069
DOCOL
( Trailing code/data at 6961; retained exactly )
BYTES 01000101000701000800007712
AT 696E

( GAME-MENU-RECORDS | NFA 696E CFA 6974 )
( Inferred descriptive name, not recovered original: Data )
( carried under DOCOL, not executed as threaded code: )
( counted record for action9 [save]. $6986 uses this PFA )
( while gameplay is active. )
AT 696E
( Header: flags, saved name and link )
BYTES 830000B15969
DOCOL
( Trailing code/data at 6976; retained exactly )
BYTES 01000101000900007712
AT 6980

( SELECT-SYSTEM-MENU | NFA 6980 CFA 6986 )
( Inferred descriptive name, not recovered original: Drops )
( the prior object ID, picks startup/in-game menu-record )
( data according to $5CE1, sets selected object1, and )
( clears the keyboard selection code. )
( Stack: object -- )
AT 6980
( Header: flags, saved name and link )
BYTES 830000D36E69
DOCOL
t.DROP t.LOAD-ITEM-ART-ENABLED t.@
t.0BRANCH CELL 000A ( -> 699A )
LIT16 6976
t.BRANCH CELL 0006 ( -> 699E )
( label 699A )
LIT16 6961
( label 699E )
t.OBJECT-ACTIONS-PTR t.! t.1 t.SELECTED-OBJECT t.! t.0
t.KEYBOARD-SELECTION t.! t.;S
AT 69B0

( ACHIEVEMENT-BIT-COUNT | NFA 69B0 CFA 69B6 )
( Inferred descriptive name, not recovered original: Cell )
( whose low byte is written by native $69C0 with the )
( population count of all31 room-achievement bytes. )
( Stack: -- address )
AT 69B0
( Header: flags, saved name and link )
BYTES 830000C38069
DOVAR
CELL 0000
AT 69BA

( COUNT-ACHIEVEMENT-BITS | NFA 69BA CFA 69C0 )
( Inferred descriptive name, not recovered original: 6502 )
( loops over31 bytes at $587E and shifts each eight times, )
( incrementing byte $69B8 for each set bit. )
( Stack: -- )
AT 69BA
( Header: flags, saved name and link )
BYTES 830000D2B069
CELL 69C2 ( native entry point )
STX.ZP D1            ( 69C2 )
LDY.# 00             ( 69C4 )
STY.ABS 69B8         ( 69C6 )
LDX.# 08             ( 69C9 )
LDA.ABSY 587E        ( 69CB )
CLC                  ( 69CE )
LSR.A                ( 69CF )
BCC 69D5             ( 69D0 )
INC.ABS 69B8         ( 69D2 )
DEX                  ( 69D5 )
BNE 69CE             ( 69D6 )
INY                  ( 69D8 )
CPY.# 1F             ( 69D9 )
BNE 69C9             ( 69DB )
LDX.ZP D1            ( 69DD )
JMP.ABS 0F47         ( 69DF )
AT 69E2

( SET-ROOM-ACHIEVEMENT | NFA 69E2 CFA 69E8 )
( Inferred descriptive name, not recovered original: )
( Indexes byte array $587C by CURRENT-ROOM; adds the )
( supplied mask only when its AND with the existing byte is )
( zero. Callers supply single-bit masks. )
( Stack: mask -- )
AT 69E2
( Header: flags, saved name and link )
BYTES 830000A1BA69
DOCOL
t.CURRENT-ROOM t.@ t.ROOM-ACHIEVEMENT-BITS t.+ t.2DUP t.C@
t.AND t.0=_12DE
t.0BRANCH CELL 0008 ( -> 6A04 )
t.BYTE+!
t.BRANCH CELL 0004 ( -> 6A06 )
( label 6A04 )
t.2DROP
( label 6A06 )
t.;S
AT 6A08

( MISSION-PERCENT-MESSAGE | NFA 6A08 CFA 6A0D )
( Inferred descriptive name, not recovered original: )
( Counted WYKONALES ... PROCENT MISJI message buffer; $6A37 )
( replaces two characters with the computed percentage. )
( Stack: -- record )
( Decoded text: Message lines )
( line 1 $6A13: WYKONALES    PROCENT MISJI )
AT 6A08
( Header: flags, saved name and link )
BYTES 8200C4E269
DOVAR
BYTES 1C00011A57594B4F4E416C45733D3D3D3D50524F43454E543D4D4953
BYTES 4A49202020
AT 6A30

( SHOW-MISSION-PERCENT | NFA 6A30 CFA 6A37 )
( Inferred descriptive name, not recovered original: While )
( gameplay is active, counts achievement bits and formats )
( count*100/65 as two decimal digits in $6A0D before )
( displaying it. )
( Stack: -- )
AT 6A30
( Header: flags, saved name and link )
BYTES 84000000C3086A
DOCOL
t.LOAD-ITEM-ART-ENABLED t.@
t.0BRANCH CELL 0032 ( -> 6A71 )
t.COUNT-ACHIEVEMENT-BITS t.ACHIEVEMENT-BIT-COUNT t.C@ LIT8 64
t.* LIT8 41 t./ t.0 t.<# t.#_268F t.#_268F t.#>
t.MISSION-PERCENT-MESSAGE LIT8 0E t.+ t.SWAP t.CMOVE
t.MISSION-PERCENT-MESSAGE t.2+ LIT8 05 t.Y! t.SHOW-MESSAGE
( label 6A71 )
t.;S
AT 6A73

( RESOLVE-INPUT-ACTION | NFA 6A73 CFA 6A79 )
( Inferred descriptive name, not recovered original: )
( Interprets keyboard selection code0 as the selected )
( object menu,1 as system menu plus mission progress, and )
( values above1 as direct action codes+8; clears the code. )
( Stack: object -- action )
AT 6A73
( Header: flags, saved name and link )
BYTES 830000C2306A
DOCOL
t.KEYBOARD-SELECTION t.@ t.>R t.0 t.BASE-VIEW-KEYS-ENABLED t.!
t.R t.0=_12DE
t.0BRANCH CELL 0006 ( -> 6A93 )
t.SELECT-OBJECT-ACTIONS t.CHOOSE-OBJECT-ACTION
( label 6A93 )
t.R t.1 t.=
t.0BRANCH CELL 000A ( -> 6AA5 )
t.SELECT-SYSTEM-MENU t.DRAW-ACTION-MENU t.SHOW-MISSION-PERCENT
t.CHOOSE-ACTION-MENU-ROW
( label 6AA5 )
t.R t.1 t.>
t.0BRANCH CELL 000C ( -> 6AB9 )
t.DROP t.R LIT16 0008 t.+
( label 6AB9 )
t.R> t.DROP t.0 t.KEYBOARD-SELECTION t.! t.;S
AT 6AC5

( GET-GAME-INPUT | NFA 6AC5 CFA 6ACB )
( Inferred descriptive name, not recovered original: Sets )
( an input-mode flag, invokes input/pointer polling, )
( normalizes the result, clears the flag and returns it. )
AT 6AC5
( Header: flags, saved name and link )
BYTES 830000CB736A
DOCOL
t.1 t.BASE-VIEW-KEYS-ENABLED t.! t.WAIT-GAME-INPUT
t.HIT-MAP-CELL t.DUP LIT8 05 t.= t.0=_12DE t.* t.VIEW-STACK
t.C@ t.0=_12DE
t.0BRANCH CELL 0007 ( -> 6AF1 )
LIT8 1F t.AND
( label 6AF1 )
t.0 t.BASE-VIEW-KEYS-ENABLED t.! t.;S
AT 6AF9

( ACTION-HANDLERS | NFA 6AF9 CFA 6AFE )
( Inferred descriptive name, not recovered original: Cell )
( table of handler PFAs indexed by action ID; )
( EXECUTE-GAME-ACTION fetches one, falls back to entry0 )
( when zero, converts PFA to CFA and executes it. )
( Stack: action -- address )
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
t.ACTION-HANDLERS t.@ t.-DUP t.0=_12DE
t.0BRANCH CELL 0008 ( -> 6B88 )
t.0 t.ACTION-HANDLERS t.@
( label 6B88 )
t.CFA t.EXECUTE t.;S
AT 6B8E

( SAVE-PLAYER-BG-PARAMS | NFA 6B8E CFA 6B94 )
( Inferred descriptive name, not recovered original: )
( Ten-byte native blit parameter block patched by $6D79 to )
( copy the screen rectangle into player background storage. )
( Stack: -- address )
AT 6B8E
( Header: flags, saved name and link )
BYTES 830000D46E6B
DOVAR
BYTES 940B00004C4C28053605
AT 6BA0

( DRAW-PLAYER-PARAMS | NFA 6BA0 CFA 6BA6 )
( Inferred descriptive name, not recovered original: )
( Ten-byte native blit parameter block whose destination )
( follows the player; $6F5F installs it for the deferred )
( VBI draw. )
( Stack: -- address )
AT 6BA0
( Header: flags, saved name and link )
BYTES 830000C58E6B
DOVAR
BYTES E0AB040A4C4C05053628
AT 6BB2

( PLAYER-OVERLAP-PARAMS | NFA 6BB2 CFA 6BB7 )
( Inferred descriptive name, not recovered original: )
( Ten-byte rectangle-intersection blit block cached by )
( $6C85 and reused for subsequent movement in the same )
( direction by $6DBE. )
( Stack: -- address )
AT 6BB2
( Header: flags, saved name and link )
BYTES 8200D0A06B
DOVAR
BYTES 000005414C4C4F542020
AT 6BC3

( PLAYER-BLIT-PENDING | NFA 6BC3 CFA 6BC8 )
( Inferred descriptive name, not recovered original: )
( Deferred sprite draw flag: $6F5F writes2, native VBI )
( routine $6F2F performs the blit then clears it, and $6BD2 )
( waits for zero. )
( Stack: -- address )
AT 6BC3
( Header: flags, saved name and link )
BYTES 8200C2B26B
DOVAR
CELL 0000
AT 6BCC

( WAIT-PLAYER-BLIT | NFA 6BCC CFA 6BD2 )
( Inferred descriptive name, not recovered original: Native )
( loop waits for byte $6BCA to become zero before returning )
( through NEXT. )
( Stack: -- )
AT 6BCC
( Header: flags, saved name and link )
BYTES 830000CFC36B
CELL 6BD4 ( native entry point )
LDA.ABS 6BCA         ( 6BD4 )
BNE 6BD4             ( 6BD7 )
JMP.ABS 0F47         ( 6BD9 )
AT 6BDC

( OVERLAP-RECT-PTRS | NFA 6BDC CFA 6BE1 )
( Inferred descriptive name, not recovered original: )
( Two-cell scratch array containing the rectangle pointers )
( used by intersection/copy helpers $6BEE..$6C85. )
( Stack: index -- address )
AT 6BDC
( Header: flags, saved name and link )
BYTES 8200C6CC6B
DODOES
( DOES> thread at 51CD )
BYTES CD5120202020
AT 6BE9

( RECTANGLE-BYTE-PAIR | NFA 6BE9 CFA 6BEE )
( Inferred descriptive name, not recovered original: )
( Fetches the same header offset from each rectangle )
( referenced by the two $6BE1 cells. )
( Stack: offset -- first-byte second-byte )
AT 6BE9
( Header: flags, saved name and link )
BYTES 8200AADC6B
DOCOL
t.0 t.OVERLAP-RECT-PTRS t.@ t.OVER t.+ t.C@ t.SWAP t.1
t.OVERLAP-RECT-PTRS t.@ t.+ t.C@ t.;S
AT 6C0A

( POSITIVE-RECT-OFFSET | NFA 6C0A CFA 6C10 )
( Inferred descriptive name, not recovered original: )
( Subtracts the two rectangle header bytes selected by )
( offset and clamps a negative result to zero. )
( Stack: offset -- nonnegative-difference )
AT 6C0A
( Header: flags, saved name and link )
BYTES 830000D9E96B
DOCOL
t.RECTANGLE-BYTE-PAIR t.- t.DUP t.0<_12F3 t.0=_12DE t.* t.;S
AT 6C20

( RECT-INTERSECTION-EXTENT | NFA 6C20 CFA 6C26 )
( Inferred descriptive name, not recovered original: For )
( axis offset0/1 computes )
( min[start0+size0,start1+size1]-max[start0,start1], )
( returning the signed extent and whether it is positive. )
( Stack: axis -- extent positive )
AT 6C20
( Header: flags, saved name and link )
BYTES 830000D90A6C
DOCOL
t.>R t.R t.RECTANGLE-BYTE-PAIR t.R t.2+ t.RECTANGLE-BYTE-PAIR
t.ROT t.+ t.>R t.+ t.R> t.MIN t.R> t.RECTANGLE-BYTE-PAIR t.MAX
t.- t.DUP t.0 t.> t.;S
AT 6C50

( RECT-INTERSECTION-ADDR | NFA 6C50 CFA 6C55 )
( Inferred descriptive name, not recovered original: Uses )
( rectangle1 width and nonnegative x/y origin differences )
( to return its row stride and first overlapping pixel )
( address. )
( Stack: -- stride address )
AT 6C50
( Header: flags, saved name and link )
BYTES 8200AA206C
DOCOL
t.1 t.OVERLAP-RECT-PTRS t.@ t.2+ t.C@ t.DUP t.1
t.POSITIVE-RECT-OFFSET t.* t.0 t.POSITIVE-RECT-OFFSET t.+ t.1
t.OVERLAP-RECT-PTRS t.@ LIT16 0004 t.+ t.+ t.;S
AT 6C7F

( COPY-RECT-INTERSECTION | NFA 6C7F CFA 6C85 )
( Inferred descriptive name, not recovered original: Stores )
( the two rectangle pointers, requires positive x/y )
( overlap, computes source/destination pixel )
( addresses/strides and invokes the native blitter; caches )
( the ten-byte parameters and returns success. Original )
( 6502 execution with two overlapping 2x1 rectangles copied )
( the source bytes into the destination and returned1. )
( Stack: source destination -- flag )
AT 6C7F
( Header: flags, saved name and link )
BYTES 830000C2506C
DOCOL
t.2DUP t.0 t.OVERLAP-RECT-PTRS t.! t.1 t.OVERLAP-RECT-PTRS t.!
t.0 t.RECT-INTERSECTION-EXTENT t.>R t.GRAPHICS-COLUMN-COUNT
t.C! t.1 t.RECT-INTERSECTION-EXTENT t.R> t.* t.SWAP
t.GRAPHICS-ROW-COUNT t.C!
t.0BRANCH CELL 0033 ( -> 6CE2 )
t.RECT-INTERSECTION-ADDR t.GRAPHICS-DEST-PTR t.!
t.GRAPHICS-ROW-STRIDE t.C! t.1 t.OVERLAP-RECT-PTRS t.! t.0
t.OVERLAP-RECT-PTRS t.! t.RECT-INTERSECTION-ADDR
t.GRAPHICS-SOURCE-PTR t.! t.GRAPHICS-ROW-COUNTER t.C!
t.GRAPHICS-SOURCE-PTR t.PLAYER-OVERLAP-PARAMS LIT8 0A t.CMOVE
t.BLIT-PICTURE t.1
t.BRANCH CELL 0006 ( -> 6CE6 )
( label 6CE2 )
t.2DROP t.0
( label 6CE6 )
t.;S
AT 6CE8

( OLD-PLAYER-RECT | NFA 6CE8 CFA 6CED )
( Inferred descriptive name, not recovered original: )
( Constant $0A00, snapshot of the prior player rectangle )
( and its pixels used by movement and overlap restoration. )
( Stack: -- address )
AT 6CE8
( Header: flags, saved name and link )
BYTES 8200D07F6C
DOCON
CELL 0A00
AT 6CF1

( PLAYER-DIRECTION | NFA 6CF1 CFA 6CF6 )
( Inferred descriptive name, not recovered original: )
( Direction cell used for sprite frame lookup, movement )
( deltas and pathfinding; values0..3 select cardinal )
( directions. )
( Stack: -- address )
AT 6CF1
( Header: flags, saved name and link )
BYTES 8200CAE86C
DOVAR
CELL 0000
AT 6CFA

( PLAYER-X-STEPS | NFA 6CFA CFA 6D00 )
( Inferred descriptive name, not recovered original: Cell )
( table [0,1,0,-1,0], indexed by current player direction )
( in $6D29. )
( Stack: direction -- address )
AT 6CFA
( Header: flags, saved name and link )
BYTES 830000CAF16C
DODOES
( DOES> thread at 51CD )
BYTES CD51000001000000FFFF0000
AT 6D0E

( PLAYER-Y-STEPS | NFA 6D0E CFA 6D14 )
( Inferred descriptive name, not recovered original: Cell )
( table [-6,0,6,0,0], indexed by current player direction )
( in $6D3C. )
( Stack: direction -- address )
AT 6D0E
( Header: flags, saved name and link )
BYTES 830000CAFA6C
DODOES
( DOES> thread at 51CD )
BYTES CD51FAFF0000060000000000
AT 6D22

( PLAYER-DX | NFA 6D22 CFA 6D29 )
( Inferred descriptive name, not recovered original: )
( Fetches horizontal step from $6D00 at the current player )
( direction. )
( Stack: -- dx )
AT 6D22
( Header: flags, saved name and link )
BYTES 84000000C00E6D
DOCOL
t.PLAYER-DIRECTION t.@ t.PLAYER-X-STEPS t.@ t.;S
AT 6D35

( PLAYER-DY | NFA 6D35 CFA 6D3C )
( Inferred descriptive name, not recovered original: )
( Fetches vertical pixel-row step from $6D14 at the current )
( player direction. )
( Stack: -- dy )
AT 6D35
( Header: flags, saved name and link )
BYTES 84000000C0226D
DOCOL
t.PLAYER-DIRECTION t.@ t.PLAYER-Y-STEPS t.@ t.;S
AT 6D48

( PLAYER-SCREEN-ADDR | NFA 6D48 CFA 6D4E )
( Inferred descriptive name, not recovered original: Reads )
( player rectangle x/y, computes bitmapbase+x+y*40, and )
( returns that packed-screen byte address. )
( Stack: -- address )
AT 6D48
( Header: flags, saved name and link )
BYTES 830000CA356D
DOCOL
t.BITMAP-BASE t.@ t.SCENE-BACKUP-BYTES t.BYTE-PAIR@ LIT8 28
t.* t.+ t.+ t.;S
AT 6D63

( INSTALL-BLIT-PARAMS | NFA 6D63 CFA 6D69 )
( Inferred descriptive name, not recovered original: Copies )
( ten bytes from the given parameter block into native )
( blitter parameters at $3AC3. )
( Stack: address -- )
AT 6D63
( Header: flags, saved name and link )
BYTES 830000BC486D
DOCOL
t.GRAPHICS-SOURCE-PTR LIT8 0A t.CMOVE t.;S
AT 6D74

( SAVE-BG-AT-PLAYER-XY | NFA 6D74 CFA 6D79 )
( Inferred descriptive name, not recovered original: Stores )
( player rectangle x/y, patches save/draw screen addresses, )
( installs background-save parameters and performs the )
( native copy. )
( Stack: x y -- )
AT 6D74
( Header: flags, saved name and link )
BYTES 8200D4636D
DOCOL
t.SCENE-BACKUP-BYTES t.1+ t.C! t.SCENE-BACKUP-BYTES t.C!
t.PLAYER-SCREEN-ADDR t.DUP t.SAVE-PLAYER-BG-PARAMS t.2+ t.!
t.DRAW-PLAYER-PARAMS t.! t.SAVE-PLAYER-BG-PARAMS
t.INSTALL-BLIT-PARAMS t.BLIT-PICTURE t.;S
AT 6D9B

( SAVE-PLAYER-RECT-HEADER | NFA 6D9B CFA 6DA0 )
( Inferred descriptive name, not recovered original: Copies )
( four bytes of the current player rectangle to the )
( old-rectangle buffer $0A00. )
( Stack: -- )
AT 6D9B
( Header: flags, saved name and link )
BYTES 8200CA746D
DOCOL
t.SCENE-BACKUP-BYTES t.OLD-PLAYER-RECT LIT16 0004 t.CMOVE t.;S
AT 6DAE

( PREVIOUS-PLAYER-DIRECTION | NFA 6DAE CFA 6DB4 )
( Inferred descriptive name, not recovered original: )
( Compared with PLAYER-DIRECTION during movement to reuse )
( cached overlap parameters; updated after the step and )
( invalidated with4 by $73B1. )
( Stack: -- address )
AT 6DAE
( Header: flags, saved name and link )
BYTES 830000B09B6D
DOVAR
CELL 0006
AT 6DB8

( STEP-PLAYER-BACKGROUND | NFA 6DB8 CFA 6DBE )
( Inferred descriptive name, not recovered original: Waits )
( for pending draw, saves the old rectangle, advances )
( player x/y by direction deltas and saves the new )
( background, restores overlapping pixels using cached/new )
( intersection parameters. )
( Stack: -- )
AT 6DB8
( Header: flags, saved name and link )
BYTES 830000D4AE6D
DOCOL
t.WAIT-PLAYER-BLIT t.SCENE-BACKUP-BYTES t.OLD-PLAYER-RECT
LIT16 0112 t.CMOVE t.SCENE-BACKUP-BYTES t.BYTE-PAIR@
t.PLAYER-DY t.+ t.>R t.PLAYER-DX t.+ t.R>
t.SAVE-BG-AT-PLAYER-XY t.PLAYER-DIRECTION t.@
t.PREVIOUS-PLAYER-DIRECTION t.@ t.=
t.0BRANCH CELL 000C ( -> 6DF6 )
t.PLAYER-OVERLAP-PARAMS t.INSTALL-BLIT-PARAMS t.BLIT-PICTURE
t.BRANCH CELL 0012 ( -> 6E06 )
( label 6DF6 )
t.OLD-PLAYER-RECT t.SCENE-BACKUP-BYTES
t.COPY-RECT-INTERSECTION t.DROP t.PLAYER-DIRECTION t.@
t.PREVIOUS-PLAYER-DIRECTION t.!
( label 6E06 )
t.SAVE-PLAYER-RECT-HEADER t.;S
AT 6E0A

( PLAYER-FRAME-ADDR | NFA 6E0A CFA 6E0F )
( Inferred descriptive name, not recovered original: )
( Performs two nested counted-record lookups in the sprite )
( bank at $8D52 and skips each length field, selecting a )
( direction group then its frame payload. )
( Stack: frame direction -- address )
AT 6E0A
( Header: flags, saved name and link )
BYTES 8200CAB86D
DOCOL
t.TITLE-MUSIC-OR-SPRITES t.LENGTH-RECORD-ADDR t.2+
t.LENGTH-RECORD-ADDR t.2+ t.;S
AT 6E1D

( PLAYER-HIT-MAP-XY | NFA 6E1D CFA 6E22 )
( Inferred descriptive name, not recovered original: Two )
( byte grid-coordinate scratch fields filled by native )
( $6E62 and used by $6EC6 to locate the player hit-map row. )
( Stack: -- address )
AT 6E1D
( Header: flags, saved name and link )
BYTES 8200D70A6E
DOVAR
BYTES 000005
AT 6E27

( PLAYER-OFFSET-XY | NFA 6E27 CFA 6E2D )
( Inferred descriptive name, not recovered original: Two )
( byte sprite-frame offsets written by $6EC6; also reused )
( as next-candidate x/y scratch by the pathfinding native )
( helper $712C. )
( Stack: -- address )
AT 6E27
( Header: flags, saved name and link )
BYTES 830000D91D6E
DOVAR
CELL 0000
AT 6E31

( SPLIT-PLAYER-ROW-SUB | NFA 6E31 CFA 6E36 )
( Inferred descriptive name, not recovered original: 6502 )
( RTS subroutine transforms the y byte at $6E24 into a )
( six-row quotient/remainder pair at $6E25/$6E24 for $6E62; )
( it is not independently Forth-callable. )
AT 6E31
( Header: flags, saved name and link )
BYTES 8200B6276E
CELL 6E38 ( native entry point )
INC.ABS 6E24         ( 6E38 )
LDY.# FF             ( 6E3B )
LDA.# 00             ( 6E3D )
CLC                  ( 6E3F )
ADC.# 06             ( 6E40 )
INY                  ( 6E42 )
CMP.ABS 6E24         ( 6E43 )
BCC 6E3F             ( 6E46 )
SEC                  ( 6E48 )
SBC.ABS 6E24         ( 6E49 )
STA.ABS 6E24         ( 6E4C )
LDA.# 05             ( 6E4F )
SEC                  ( 6E51 )
SBC.ABS 6E24         ( 6E52 )
STY.ABS 6E25         ( 6E55 )
STA.ABS 6E24         ( 6E58 )
RTS                  ( 6E5B )
AT 6E5C

( PREPARE-PLAYER-HIT-MAP | NFA 6E5C CFA 6E62 )
( Inferred descriptive name, not recovered original: 6502 )
( computes depth-mask/clipping state and six-row hit-map )
( coordinates from old-player rectangle $0A00 and frame )
( offsets $6E2D. )
( Stack: -- )
AT 6E5C
( Header: flags, saved name and link )
BYTES 830000B0316E
CELL 6E64 ( native entry point )
LDA.ABS 0A01         ( 6E64 )
STA.ABS 53D3         ( 6E67 )
STA.ABS 6E24         ( 6E6A )
JSR.ABS 6E38         ( 6E6D )
LDA.ABS 6E25         ( 6E70 )
SEC                  ( 6E73 )
SBC.# 03             ( 6E74 )
CMP.# 08             ( 6E76 )
BCC 6E7C             ( 6E78 )
LDA.# 07             ( 6E7A )
LDY.# 05             ( 6E7C )
ASL.A                ( 6E7E )
DEY                  ( 6E7F )
BNE 6E7E             ( 6E80 )
STA.ABS 533A         ( 6E82 )
LDA.ABS 0A01         ( 6E85 )
CLC                  ( 6E88 )
ADC.ABS 6E30         ( 6E89 )
STA.ABS 6E24         ( 6E8C )
JSR.ABS 6E38         ( 6E8F )
LDA.# 06             ( 6E92 )
SEC                  ( 6E94 )
SBC.ABS 6E24         ( 6E95 )
STA.ZP FB            ( 6E98 )
LDA.ABS 0A00         ( 6E9A )
CLC                  ( 6E9D )
ADC.ABS 6E2F         ( 6E9E )
SEC                  ( 6EA1 )
SBC.# 02             ( 6EA2 )
STA.ABS 6E24         ( 6EA4 )
JMP.ABS 0F47         ( 6EA7 )
AT 6EAA

( ENABLE-PLAYER-MASK-BLIT | NFA 6EAA CFA 6EB0 )
( Inferred descriptive name, not recovered original: Sets )
( native masked-copy flag $538C to1 and copies depth-bypass )
( mode from $5346 into $5345 before player-frame )
( compositing. )
( Stack: -- )
AT 6EAA
( Header: flags, saved name and link )
BYTES 830000B15C6E
CELL 6EB2 ( native entry point )
LDA.# 01             ( 6EB2 )
STA.ABS 538C         ( 6EB4 )
LDA.ABS 5346         ( 6EB7 )
STA.ABS 5345         ( 6EBA )
JMP.ABS 0F47         ( 6EBD )
AT 6EC0

( COMPOSE-PLAYER-FRAME | NFA 6EC0 CFA 6EC6 )
( Inferred descriptive name, not recovered original: Waits )
( for the previous blit, snapshots the player background, )
( reads frame offsets, prepares hit/depth coordinates and )
( native blitter pointers, then composites frame pixels and )
( restores mask flags. )
( Stack: frame-address -- )
AT 6EC0
( Header: flags, saved name and link )
BYTES 830000C2AA6E
DOCOL
t.WAIT-PLAYER-BLIT t.SCENE-BACKUP-BYTES t.OLD-PLAYER-RECT
LIT16 0112 t.CMOVE t.OLD-PLAYER-RECT t.2+ t.C@ t.>R t.DUP t.@
t.PLAYER-OFFSET-XY t.! t.PREPARE-PLAYER-HIT-MAP
t.PLAYER-HIT-MAP-XY t.BYTE-PAIR@ LIT8 20 t.* t.+ t.HIT-MAP@
t.+ t.RECORD-POINTER t.! t.DUP t.BYTE-PAIR@ t.R t.* t.+
t.OLD-PLAYER-RECT LIT16 0004 t.+ t.+ t.GRAPHICS-SOURCE-PTR t.!
t.ENABLE-PLAYER-MASK-BLIT t.2+ t.DUP t.R> t.BLIT-PARAMETERS
t.1 t.BLIT-IGNORE-HIT t.C! t.0 t.BLIT-MASKED t.C! t.;S
AT 6F29

( PLAYER-BLIT-VBI-SUB | NFA 6F29 CFA 6F2F )
( Inferred descriptive name, not recovered original: 6502 )
( RTS VBI subroutine: if pending flag equals2, disables row )
( clipping, invokes the blitter at $53E6, restores clipping )
( and clears pending flag. )
AT 6F29
( Header: flags, saved name and link )
BYTES 830000D0C06E
CELL 6F31 ( native entry point )
LDA.# 02             ( 6F31 )
CMP.ABS 6BCA         ( 6F33 )
BNE 6F48             ( 6F36 )
LDA.# 00             ( 6F38 )
STA.ABS 53DC         ( 6F3A )
JSR.ABS 53E6         ( 6F3D )
INC.ABS 53DC         ( 6F40 )
LDA.# 00             ( 6F43 )
STA.ABS 6BCA         ( 6F45 )
RTS                  ( 6F48 )
AT 6F49

( PLAYER-IDLE-Y-OFFSETS | NFA 6F49 CFA 6F4E )
( Inferred descriptive name, not recovered original: )
( Direction-indexed byte values7,10,6,3 used to temporarily )
( alter sprite-frame y offsets for idle frame5 in $6F72. )
( Stack: direction -- address )
AT 6F49
( Header: flags, saved name and link )
BYTES 8200CA296F
DODOES
( DOES> thread at 51CD )
BYTES CD5107200A2006200320
AT 6F5A

( QUEUE-PLAYER-BLIT | NFA 6F5A CFA 6F5F )
( Inferred descriptive name, not recovered original: )
( Installs $6BA6 draw parameters and sets )
( PLAYER-BLIT-PENDING to2 for the VBI routine. )
( Stack: -- )
AT 6F5A
( Header: flags, saved name and link )
BYTES 8200CA496F
DOCOL
t.DRAW-PLAYER-PARAMS t.INSTALL-BLIT-PARAMS t.2
t.PLAYER-BLIT-PENDING t.C! t.;S
AT 6F6D

( DRAW-PLAYER-FRAME | NFA 6F6D CFA 6F72 )
( Inferred descriptive name, not recovered original: Draws )
( the indexed frame for the supplied direction. Special )
( frame5 reuses frame2 and adjusts vertical offsets for )
( even directions before restoring the sprite data. )
( Stack: direction frame -- )
AT 6F6D
( Header: flags, saved name and link )
BYTES 8200C25A6F
DOCOL
t.DUP LIT8 05 t.=
t.0BRANCH CELL 0042 ( -> 6FBF )
t.DROP t.2 t.OVER t.2 t.MOD t.0=_12DE
t.0BRANCH CELL 0028 ( -> 6FB5 )
t.OVER t.PLAYER-FRAME-ADDR t.OVER t.PLAYER-IDLE-Y-OFFSETS t.C@
t.OVER t.1+ t.C! t.DUP t.COMPOSE-PLAYER-FRAME t.OVER t.1+
t.PLAYER-IDLE-Y-OFFSETS t.C@ t.SWAP t.1+ t.C!
t.BRANCH CELL 0008 ( -> 6FBB )
( label 6FB5 )
t.OVER t.PLAYER-FRAME-ADDR t.COMPOSE-PLAYER-FRAME
( label 6FBB )
t.BRANCH CELL 0008 ( -> 6FC5 )
( label 6FBF )
t.OVER t.PLAYER-FRAME-ADDR t.COMPOSE-PLAYER-FRAME
( label 6FC5 )
t.DROP t.;S
AT 6FC9

( DRAW-AND-QUEUE-PLAYER | NFA 6FC9 CFA 6FCF )
( Inferred descriptive name, not recovered original: Calls )
( $6F72 to compose the selected frame and $6F5F to schedule )
( its screen copy. )
( Stack: direction frame -- )
AT 6FC9
( Header: flags, saved name and link )
BYTES 830000C26D6F
DOCOL
t.DRAW-PLAYER-FRAME t.QUEUE-PLAYER-BLIT t.;S
AT 6FD7

( PLAYER-FOOT-Y-OFFSET | NFA 6FD7 CFA 6FDD )
( Inferred descriptive name, not recovered original: )
( Constant43 subtracted from gridY*6 when positioning the )
( player and added back when recovering the player )
( foot-grid coordinate. )
( Stack: -- pixels )
AT 6FD7
( Header: flags, saved name and link )
BYTES 830000D0C96F
DOCON
CELL 002B
AT 6FE1

( ANIMATE-PLAYER-STEP | NFA 6FE1 CFA 6FE7 )
( Inferred descriptive name, not recovered original: Sets )
( movement direction, advances background one step, )
( animates the supplied frame interval and plays footstep )
( effect3 at frames0/3, then draws the boundary frame. )
( Stack: direction end-frame start-frame -- )
AT 6FE1
( Header: flags, saved name and link )
BYTES 830000AAD76F
DOCOL
t.>R t.OVER t.R> t.SWAP t.PLAYER-DIRECTION t.!
t.STEP-PLAYER-BACKGROUND t.OVER t.>R t.(DO)
( label 6FFD )
t.DUP t.I t.DRAW-AND-QUEUE-PLAYER t.I t.0=_12DE t.I t.3 t.=
t.+
t.0BRANCH CELL 0006 ( -> 7017 )
t.3 t.PLAY-SOUND-EFFECT
( label 7017 )
t.(LOOP) CELL FFE4 ( -> 6FFD )
t.R> t.DRAW-AND-QUEUE-PLAYER t.;S
AT 7021

( WALK-PLAYER-STEPS | NFA 7021 CFA 7028 )
( Inferred descriptive name, not recovered original: For )
( each requested grid step chooses the direction-dependent )
( alternating frame cycle, invokes $6FE7 and waits for the )
( final VBI draw. )
( Stack: direction steps -- )
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
t.ANIMATE-PLAYER-STEP
t.(LOOP) CELL FFCF ( -> 7034 )
( label 7067 )
t.DROP t.WAIT-PLAYER-BLIT t.;S
AT 706D

( POSITION-PLAYER | NFA 706D CFA 7073 )
( Inferred descriptive name, not recovered original: )
( Converts grid coordinates to rectangle x+2,y*6-43, sets )
( dimensions5x54, saves background, enables VBI and renders )
( idle frame5. )
( Stack: grid-x grid-y -- )
AT 706D
( Header: flags, saved name and link )
BYTES 830000CA2170
DOCOL
LIT8 06 t.* t.PLAYER-FOOT-Y-OFFSET t.- t.SWAP t.2+ t.SWAP
LIT8 05 t.SCENE-BACKUP-BYTES t.2+ t.C! LIT8 36
t.SCENE-BACKUP-BYTES t.3 t.+ t.C! t.SAVE-BG-AT-PLAYER-XY
t.SAVE-PLAYER-RECT-HEADER t.RUN-VBI1 t.PLAYER-DIRECTION t.@
LIT8 05 t.DRAW-AND-QUEUE-PLAYER t.WAIT-PLAYER-BLIT t.;S
AT 70AB

( PLAYER-ROUTE-COUNT | NFA 70AB CFA 70B1 )
( Inferred descriptive name, not recovered original: Number )
( of stored route segments; $7244/$732B append segments and )
( $70DA consumes them in reverse order. )
( Stack: -- address )
AT 70AB
( Header: flags, saved name and link )
BYTES 830000D26D70
DOVAR
CELL 0004
AT 70B5

( PLAYER-ROUTE-SEGMENTS | NFA 70B5 CFA 70BB )
( Inferred descriptive name, not recovered original: Cell )
( array of byte pairs [direction,step count], populated by )
( route planning and consumed by $70DA. )
( Stack: index -- address )
AT 70B5
( Header: flags, saved name and link )
BYTES 830000D2AB70
DODOES
( DOES> thread at 51CD )
BYTES CD510203011000030310000020202020202020202020
AT 70D3

( WALK-PLANNED-ROUTE | NFA 70D3 CFA 70DA )
( Inferred descriptive name, not recovered original: )
( Decrements the segment count, reads its direction/count )
( pair and walks that segment until the count reaches zero. )
( Stack: -- )
AT 70D3
( Header: flags, saved name and link )
BYTES 84000000DAB570
DOCOL
( label 70DC )
t.-1 t.PLAYER-ROUTE-COUNT t.+! t.PLAYER-ROUTE-COUNT t.@
t.PLAYER-ROUTE-SEGMENTS t.DUP t.C@ t.SWAP t.1+ t.C@
t.WALK-PLAYER-STEPS t.PLAYER-ROUTE-COUNT t.@ t.0=_12DE
t.0BRANCH CELL FFE0 ( -> 70DC )
t.;S
AT 7100

( ROUTE-SEARCH-XY | NFA 7100 CFA 7106 )
( Inferred descriptive name, not recovered original: Search )
( point initialized from the requested destination by $73B1 )
( and advanced by the reverse route builder $7244. )
( Stack: -- address )
AT 7100
( Header: flags, saved name and link )
BYTES 830000CAD370
DOVAR
CELL 0000
AT 710A

( ROUTE-TARGET-XY | NFA 710A CFA 7110 )
( Inferred descriptive name, not recovered original: )
( Reverse-search target initialized from the current player )
( foot-grid position by $73B1; $7302 adjusts it for a )
( staged terminal segment. )
( Stack: -- address )
AT 710A
( Header: flags, saved name and link )
BYTES 830000CB0071
DOVAR
CELL 0000
AT 7114

( ROUTE-DIRECTION-VECTORS | NFA 7114 CFA 711A )
( Inferred descriptive name, not recovered original: Packed )
( byte-pair table [[1,0],[2,1],[1,2],[0,1]]; path helpers )
( subtract1 from each component to obtain cardinal unit )
( steps. )
( Stack: direction -- address )
AT 7114
( Header: flags, saved name and link )
BYTES 830000D90A71
DODOES
( DOES> thread at 51CD )
BYTES CD510100020101020001
AT 7126

( SET-NEXT-ROUTE-XY | NFA 7126 CFA 712C )
( Inferred descriptive name, not recovered original: 6502 )
( adds the selected cardinal vector minus1 to )
( ROUTE-SEARCH-XY and writes candidate x/y bytes at )
( $6E2F/$6E30. )
( Stack: -- )
AT 7126
( Header: flags, saved name and link )
BYTES 830000C01471
CELL 712E ( native entry point )
LDA.ABS 6CF8         ( 712E )
ASL.A                ( 7131 )
TAY                  ( 7132 )
LDA.ABSY 711E        ( 7133 )
SEC                  ( 7136 )
SBC.# 01             ( 7137 )
CLC                  ( 7139 )
ADC.ABS 7108         ( 713A )
STA.ABS 6E2F         ( 713D )
INY                  ( 7140 )
LDA.ABSY 711E        ( 7141 )
SEC                  ( 7144 )
SBC.# 01             ( 7145 )
CLC                  ( 7147 )
ADC.ABS 7109         ( 7148 )
STA.ABS 6E30         ( 714B )
JMP.ABS 0F47         ( 714E )
AT 7151

( NEXT-ROUTE-XY | NFA 7151 CFA 7158 )
( Inferred descriptive name, not recovered original: )
( Computes candidate x/y through $712C and returns its two )
( unsigned bytes. Original 6502 execution from )
( coordinate10,10 produced [10,9],[11,10],[10,11],[9,10] )
( for directions0..3. )
( Stack: -- x y )
AT 7151
( Header: flags, saved name and link )
BYTES 84000000C02671
DOCOL
t.SET-NEXT-ROUTE-XY t.PLAYER-OFFSET-XY t.BYTE-PAIR@ t.;S
AT 7162

( ROTATE-DIRECTION-CW | NFA 7162 CFA 7168 )
( Inferred descriptive name, not recovered original: )
( Increments PLAYER-DIRECTION modulo4. )
( Stack: -- )
AT 7162
( Header: flags, saved name and link )
BYTES 830000AB5171
DOCOL
t.PLAYER-DIRECTION t.@ t.1+ LIT16 0004 t.MOD
t.PLAYER-DIRECTION t.! t.;S
AT 717C

( ROTATE-DIRECTION-CCW | NFA 717C CFA 7182 )
( Inferred descriptive name, not recovered original: )
( Decrements PLAYER-DIRECTION, adding4 if the result is )
( negative. )
( Stack: -- )
AT 717C
( Header: flags, saved name and link )
BYTES 830000AD6271
DOCOL
t.PLAYER-DIRECTION t.@ t.1 t.- t.DUP t.0<_12F3 LIT16 0004 t.*
t.+ t.PLAYER-DIRECTION t.! t.;S
AT 719E

( ABS-XY-DIFFERENCE | NFA 719E CFA 71A4 )
( Inferred descriptive name, not recovered original: )
( Computes absolute differences of two coordinate pairs, )
( with x difference below y difference. Original 6502 )
( execution on arguments10,30,3,40 returned7,10. )
( Stack: x1 y1 x2 y2 -- abs-dx abs-dy )
AT 719E
( Header: flags, saved name and link )
BYTES 830000AA7C71
DOCOL
t.ROT t.- t.ABS t.>R t.- t.ABS t.R> t.;S
AT 71B6

( ROUTE-STEP-APPROACHES | NFA 71B6 CFA 71BC )
( Inferred descriptive name, not recovered original: )
( Compares each axis distance from candidate/search )
( coordinates to ROUTE-TARGET-XY; true only when neither )
( candidate distance increases. )
( Stack: -- flag )
AT 71B6
( Header: flags, saved name and link )
BYTES 830000C99E71
DOCOL
t.NEXT-ROUTE-XY t.ROUTE-TARGET-XY t.BYTE-PAIR@
t.ABS-XY-DIFFERENCE t.ROUTE-SEARCH-XY t.BYTE-PAIR@
t.ROUTE-TARGET-XY t.BYTE-PAIR@ t.ABS-XY-DIFFERENCE t.ROT t.<
t.>R t.> t.R> t.+ t.0=_12DE t.;S
AT 71E0

( ROUTE-STEP-WALKABLE | NFA 71E0 CFA 71E6 )
( Inferred descriptive name, not recovered original: Reads )
( the candidate hit-map byte and accepts it when its low )
( five bits do not equal blocking marker5. )
( Stack: -- flag )
AT 71E0
( Header: flags, saved name and link )
BYTES 830000CCB671
DOCOL
t.NEXT-ROUTE-XY t.HIT-MAP-CELL LIT8 1F t.AND LIT8 05 t.=
t.0=_12DE t.;S
AT 71FA

( OPPOSITE-DIRECTION | NFA 71FA CFA 7200 )
( Inferred descriptive name, not recovered original: Maps )
( directions0,1 to2,3 by adding2 and directions2,3 to0,1 by )
( subtracting2. )
( Stack: direction -- opposite )
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

( SAVED-ROUTE-DIRECTION | NFA 7218 CFA 721E )
( Inferred descriptive name, not recovered original: Stores )
( the current search direction before evaluating )
( neighboring routes; restored by $7228. )
( Stack: -- address )
AT 7218
( Header: flags, saved name and link )
BYTES 830000D3FA71
DOVAR
CELL 0000
AT 7222

( SCORE-ROUTE-CANDIDATE | NFA 7222 CFA 7228 )
( Inferred descriptive name, not recovered original: )
( Returns 2*walkable+approaches-target for the candidate )
( direction, then restores the saved search direction. )
( Stack: -- score )
AT 7222
( Header: flags, saved name and link )
BYTES 830000AA1872
DOCOL
t.ROUTE-STEP-WALKABLE t.2 t.* t.ROUTE-STEP-APPROACHES t.+
t.SAVED-ROUTE-DIRECTION t.@ t.PLAYER-DIRECTION t.! t.;S
AT 723E

( APPEND-ROUTE-RUN | NFA 723E CFA 7244 )
( Inferred descriptive name, not recovered original: Walks )
( the reverse-search point toward its target, evaluates )
( left/right detours at obstacles and direction changes, )
( and appends the reversed direction/count pair to the )
( route table. )
AT 723E
( Header: flags, saved name and link )
BYTES 830000C42272
DOCOL
t.PLAYER-DIRECTION t.@ t.SAVED-ROUTE-DIRECTION t.! t.0
( label 7250 )
t.OVER
t.0BRANCH CELL 0010 ( -> 7264 )
t.NEXT-ROUTE-XY t.ROUTE-SEARCH-XY t.1+ t.C! t.ROUTE-SEARCH-XY
t.C! t.1+
( label 7264 )
t.2DUP t.> t.0=_12DE
t.0BRANCH CELL 0048 ( -> 72B4 )
t.ROUTE-STEP-APPROACHES t.ROUTE-STEP-WALKABLE t.* t.0=_12DE
t.0BRANCH CELL 003C ( -> 72B4 )
t.ROTATE-DIRECTION-CW t.SCORE-ROUTE-CANDIDATE
t.ROTATE-DIRECTION-CCW t.SCORE-ROUTE-CANDIDATE t.2DUP t.MAX
t.DUP t.>R t.3 t.= t.R> t.1 t.> t.ROUTE-STEP-WALKABLE
t.0=_12DE t.* t.+
t.0BRANCH CELL 0014 ( -> 72B2 )
t.<
t.0BRANCH CELL 0008 ( -> 72AC )
t.ROTATE-DIRECTION-CCW
t.BRANCH CELL 0004 ( -> 72AE )
( label 72AC )
t.ROTATE-DIRECTION-CW
( label 72AE )
t.BRANCH CELL 0004 ( -> 72B4 )
( label 72B2 )
t.2DROP
( label 72B4 )
t.OVER t.0=_12DE t.ROUTE-SEARCH-XY t.@ t.ROUTE-TARGET-XY t.@
t.= t.+ t.PLAYER-DIRECTION t.@ t.SAVED-ROUTE-DIRECTION t.@ t.=
t.0=_12DE t.+
t.0BRANCH CELL FF7C ( -> 7250 )
t.PLAYER-ROUTE-COUNT t.@ t.PLAYER-ROUTE-SEGMENTS
t.SAVED-ROUTE-DIRECTION t.@ t.OPPOSITE-DIRECTION t.OVER t.C!
t.1+ t.C! t.1 t.PLAYER-ROUTE-COUNT t.+! t.DROP t.;S
AT 72F4

( DEFERRED-ROUTE-SEGMENT | NFA 72F4 CFA 72F9 )
( Inferred descriptive name, not recovered original: Packed )
( direction/count pair used by $732B to reserve and later )
( append a final route segment. )
( Stack: -- address )
AT 72F4
( Header: flags, saved name and link )
BYTES 8200CB3E72
DOVAR
CELL 0000
AT 72FD

( ADJUST-ROUTE-TARGET-AXIS | NFA 72FD CFA 7302 )
( Inferred descriptive name, not recovered original: Uses )
( the deferred direction/count vector to adjust one byte )
( coordinate of ROUTE-TARGET-XY. )
( Stack: axis -- )
AT 72FD
( Header: flags, saved name and link )
BYTES 8200D8F472
DOCOL
t.>R t.DEFERRED-ROUTE-SEGMENT t.BYTE-PAIR@ t.SWAP
t.ROUTE-DIRECTION-VECTORS t.R t.+ t.C@ t.1 t.- t.*
t.ROUTE-TARGET-XY t.R> t.+ t.BYTE+! t.;S
AT 7324

( PLAN-PLAYER-ROUTE | NFA 7324 CFA 732B )
( Inferred descriptive name, not recovered original: Builds )
( the reverse route between search and target points using )
( $7244, preserving and appending a deferred terminal )
( segment. )
AT 7324
( Header: flags, saved name and link )
BYTES 84000000D3FD72
DOCOL
t.DEFERRED-ROUTE-SEGMENT t.@ t.>R t.0
t.ADJUST-ROUTE-TARGET-AXIS t.1 t.ADJUST-ROUTE-TARGET-AXIS
t.2DUP t.OPPOSITE-DIRECTION t.DEFERRED-ROUTE-SEGMENT t.C!
t.DEFERRED-ROUTE-SEGMENT t.1+ t.C! t.OPPOSITE-DIRECTION
t.PLAYER-DIRECTION t.! t.0 t.PLAYER-ROUTE-COUNT t.!
( label 7355 )
t.APPEND-ROUTE-RUN t.1 t.ROUTE-SEARCH-XY t.@ t.ROUTE-TARGET-XY
t.@ t.=
t.0BRANCH CELL FFF0 ( -> 7355 )
t.DROP t.R> t.-DUP
t.0BRANCH CELL 0010 ( -> 737F )
t.PLAYER-ROUTE-COUNT t.@ t.PLAYER-ROUTE-SEGMENTS t.! t.1
t.PLAYER-ROUTE-COUNT t.+!
( label 737F )
t.;S
AT 7381

( POSITION-PLAYER-AT-ENTRY | NFA 7381 CFA 7387 )
( Inferred descriptive name, not recovered original: )
( Selects the room exit opposite the facing direction, )
( installs its action record, clears deferred route state )
( and positions the player using its action bytes2/3. )
( Stack: -- )
AT 7381
( Header: flags, saved name and link )
BYTES 830000D02473
DOCOL
t.PLAYER-DIRECTION t.@ t.OPPOSITE-DIRECTION t.1+
t.SELECT-OBJECT-ACTIONS t.OBJECT-ACTIONS-PTR t.@
t.SELECTED-ACTION-PTR t.! t.0 t.DEFERRED-ROUTE-SEGMENT t.!
t.ACTION-PARAM-2 t.ACTION-PARAM-3 t.POSITION-PLAYER t.;S
AT 73A9

( MOVE-PLAYER-TO-POINT | NFA 73A9 CFA 73B1 )
( Inferred descriptive name, not recovered original: )
( Records player foot-grid position and requested )
( destination, builds and walks the route when positions )
( differ, optionally turns to a final direction below4, )
( then invalidates overlap-direction cache. )
AT 73A9
( Header: flags, saved name and link )
BYTES 8500000000C58173
DOCOL
t.>R t.SCENE-BACKUP-BYTES t.BYTE-PAIR@ t.PLAYER-FOOT-Y-OFFSET
t.+ LIT8 06 t./ t.ROUTE-TARGET-XY t.1+ t.C! t.2 t.-
t.ROUTE-TARGET-XY t.C! t.ROUTE-SEARCH-XY t.1+ t.C!
t.ROUTE-SEARCH-XY t.C! t.ROUTE-SEARCH-XY t.@ t.ROUTE-TARGET-XY
t.@ t.= t.0=_12DE
t.0BRANCH CELL 0024 ( -> 740C )
t.SWAP t.PLAN-PLAYER-ROUTE t.WALK-PLANNED-ROUTE t.R LIT8 04
t.<
t.0BRANCH CELL 000F ( -> 7408 )
t.R LIT8 05 t.DRAW-AND-QUEUE-PLAYER t.R t.PLAYER-DIRECTION t.!
( label 7408 )
t.BRANCH CELL 0004 ( -> 740E )
( label 740C )
t.2DROP
( label 740E )
t.R> t.DROP LIT16 0004 t.PREVIOUS-PLAYER-DIRECTION t.! t.;S
AT 741C

( ENTER-ROOM | NFA 741C CFA 7423 )
( Inferred descriptive name, not recovered original: )
( Loads/draws the room and mutable objects, installs )
( palette/message, positions the player at the entry, )
( restores display and runs the entry walk; stores entry )
( facing and awards the room-visited bit outside room1. )
( Stack: room -- )
AT 741C
( Header: flags, saved name and link )
BYTES 84000000C3A973
DOCOL
t.CLEAR-TEXT-AREA t.CLOSE-SCENE-TRANSITION t.DRAW-ROOM t.1
t.ROOM-RECORD-BUFFER t.2+ t.LENGTH-RECORD-ADDR t.WORD-COUNT
t.GAME-COLOR-TABLE t.SWAP t.CMOVE t.2 t.ROOM-RECORD-BUFFER
t.2+ t.LENGTH-RECORD-ADDR t.WORD-COUNT t.3 t.>
t.0BRANCH CELL 0008 ( -> 7453 )
t.SHOW-MESSAGE
t.BRANCH CELL 0004 ( -> 7455 )
( label 7453 )
t.DROP
( label 7455 )
t.POSITION-PLAYER-AT-ENTRY t.OPEN-SCENE-TRANSITION t.1
t.PLAYER-ROUTE-COUNT t.! t.0 t.ACTION-PARAM-BYTE
t.OPPOSITE-DIRECTION t.DUP t.LAST-DIRECTION t.! t.0
t.PLAYER-ROUTE-SEGMENTS t.C! t.CURRENT-ROOM t.@ t.1 t.-
t.0BRANCH CELL 0006 ( -> 7481 )
t.1 t.SET-ROOM-ACHIEVEMENT
( label 7481 )
t.ACTION-PARAM-1 t.ACTION-PARAM-5 t.0=_12DE t.0=_12DE t.+ t.0
t.PLAYER-ROUTE-SEGMENTS t.1+ t.C! t.WALK-PLANNED-ROUTE t.;S
AT 7497

( COMPOSE-PLAYER-OVERLAP | NFA 7497 CFA 749C )
( Inferred descriptive name, not recovered original: When )
( the picture rectangle intersects the player, composites )
( the idle player frame into the overlap and restores the )
( intersection, using the depth-mask bypass byte. )
( Stack: -- )
AT 7497
( Header: flags, saved name and link )
BYTES 8200D41C74
DOCOL
t.1 t.BLIT-IGNORE-HIT t.1+ t.C! t.SCENE-PICTURE-BUFFER
t.SCENE-BACKUP-BYTES t.COPY-RECT-INTERSECTION
t.0BRANCH CELL 0013 ( -> 74C1 )
t.PLAYER-DIRECTION t.@ LIT8 05 t.DRAW-PLAYER-FRAME
t.OLD-PLAYER-RECT t.SCENE-PICTURE-BUFFER
t.COPY-RECT-INTERSECTION t.DROP
( label 74C1 )
t.0 t.BLIT-IGNORE-HIT t.1+ t.C! t.;S
AT 74CB

( GAME-EXIT-FLAG | NFA 74CB CFA 74D1 )
( Inferred descriptive name, not recovered original: Set by )
( action2 at $765A and tested at the end of GAME-LOOP. )
( Stack: -- address )
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
t.INIT-GAME-DISPLAY-AUDIO t.0 t.GAME-EXIT-FLAG t.!
( label 74E5 )
t.1 t.KEYBOARD-SELECTION t.! t.0 t.LOAD-ITEM-ART-ENABLED t.!
t.CLEAR-TEXT-AREA t.1 t.RESOLVE-INPUT-ACTION
t.EXECUTE-GAME-ACTION t.GROUP-TRANSFER-ERROR t.@ t.0=_12DE
t.0BRANCH CELL FFE4 ( -> 74E5 )
( label 7503 )
t.0 t.KEYBOARD-SELECTION t.! t.GET-GAME-INPUT
t.CLEAR-TEXT-AREA t.RESOLVE-INPUT-ACTION t.CLEAR-TEXT-AREA
t.DUP t.2 t.= t.0=_12DE
t.0BRANCH CELL 0046 ( -> 7561 )
t.DUP LIT16 0005 t.> t.OVER LIT16 000D t.< t.* t.OVER
t.0=_12DE t.+ t.0=_12DE t.VIEW-STACK t.C@ t.0=_12DE t.*
t.0BRANCH CELL 0020 ( -> 7561 )
t.SELECTED-ACTION-PTR t.@ t.OBJECT-ACTIONS-PTR t.@
t.SELECTED-ACTION-PTR t.! t.0 t.ACTION-PARAM-BYTE
t.ACTION-PARAM-1 t.ACTION-PARAM-2 t.ACTION-PARAM-3
t.ACTION-PARAM-4 t.MOVE-PLAYER-TO-POINT t.SELECTED-ACTION-PTR
t.!
( label 7561 )
t.EXECUTE-GAME-ACTION t.GAME-EXIT-FLAG t.@
t.0BRANCH CELL FF9A ( -> 7503 )
t.;S
AT 756D

( REFRESH-CHANGED-PICTURE | NFA 756D CFA 7573 )
( Inferred descriptive name, not recovered original: )
( Recomposites overlapping player pixels, updates the main )
( hit map from the changed picture and copies the resulting )
( rectangle to the screen. )
( Stack: -- )
AT 756D
( Header: flags, saved name and link )
BYTES 830000D4D574
DOCOL
t.COMPOSE-PLAYER-OVERLAP t.HIT-MAP@ t.DUP t.0
t.HIT-MAP-SELECTOR t.! t.HIT-MAP@ t.C@ t.SCENE-PICTURE-BUFFER
LIT16 0004 t.0 t.SET-PICTURE-OFFSETS t.DROP t.HIT-MAP@ t.2+
t.OVER t.HIT-MAP-OFFSET t.GRAPHICS-SOURCE-PTR t.!
t.BLIT-PARAMETERS t.SCENE-PICTURE-BUFFER
t.DRAW-DECODED-PICTURE t.;S
AT 75A5

( COMPOSE-TWO-IMAGES | NFA 75A5 CFA 75AA )
( Inferred descriptive name, not recovered original: )
( Resolves two encoded image IDs, draws the first with its )
( hit mask and then overlays the second when valid. )
( Stack: image1 image2 -- )
AT 75A5
( Header: flags, saved name and link )
BYTES 8200CF6D75
DOCOL
t.SWAP t.CLASSIFY-OBJECT t.DROP t.DECODE-ZOOM-PICTURE
t.CLASSIFY-OBJECT
t.0BRANCH CELL 0004 ( -> 75BC )
t.COMPOSE-PICTURE-AND-MASK
( label 75BC )
t.;S
AT 75BE

( DRAW-TWO-IMAGES | NFA 75BE CFA 75C5 )
( Inferred descriptive name, not recovered original: )
( Composes two encoded images then refreshes player )
( overlap, hit-map and screen state. )
( Stack: image1 image2 -- )
AT 75BE
( Header: flags, saved name and link )
BYTES 84000000C2A575
DOCOL
t.COMPOSE-TWO-IMAGES t.REFRESH-CHANGED-PICTURE t.;S
AT 75CD

( DRAW-THREE-IMAGES | NFA 75CD CFA 75D4 )
( Inferred descriptive name, not recovered original: )
( Composes two encoded images, overlays a valid third )
( image, then refreshes player/hit-map/screen state. )
( Stack: image1 image2 image3 -- )
AT 75CD
( Header: flags, saved name and link )
BYTES 84000000C2BE75
DOCOL
t.>R t.COMPOSE-TWO-IMAGES t.R> t.CLASSIFY-OBJECT
t.0BRANCH CELL 0004 ( -> 75E4 )
t.COMPOSE-PICTURE-AND-MASK
( label 75E4 )
t.REFRESH-CHANGED-PICTURE t.;S
AT 75E8

( WAIT-KEY-OR-FIRE | NFA 75E8 CFA 75EE )
( Inferred descriptive name, not recovered original: Writes )
( the 16-bit value $00FF at $02FC [CH=$FF, adjacent )
( $02FD=0], then waits for a new keycode or joystick )
( trigger zero. Consumes the resulting key/trigger )
( indication. )
( Stack: -- )
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

( WHICH-ITEM-MESSAGE | NFA 7614 CFA 7619 )
( Inferred descriptive name, not recovered original: )
( Counted CO? prompt displayed before the drop-item action )
( asks for an inventory item. )
( Stack: -- record )
( Decoded text: Message lines )
( line 1 $761F: CO? )
AT 7614
( Header: flags, saved name and link )
BYTES 8200D4E875
DOVAR
BYTES 05000103434F3F
AT 7622

( SHOW-RESOURCE-MESSAGE | NFA 7622 CFA 7629 )
( Inferred descriptive name, not recovered original: )
( Selects the requested resource, clears text and displays )
( its child0 message payload after the nested count fields. )
( Stack: resource -- )
AT 7622
( Header: flags, saved name and link )
BYTES 84000000CD1476
DOCOL
t.FETCH-RESOURCE t.CLEAR-TEXT-AREA t.0 t.RESOURCE-ADDR LIT8 04
t.+ t.SHOW-MESSAGE t.;S
AT 763C

( ACTION-NOTHING | NFA 763C CFA 7641 )
( Inferred descriptive name, not recovered original: Empty )
( handler, action0 NIC and the fallback for missing handler )
( table entries. )
( Stack: -- )
AT 763C
( Header: flags, saved name and link )
BYTES 8200B02276
DOCOL
t.;S
AT 7645

( ACTION-LEAVE-VIEW | NFA 7645 CFA 764A )
( Inferred descriptive name, not recovered original: )
( Action1 NIE PATRZ plays effect9 and leaves the current )
( nested view. )
( Stack: -- )
AT 7645
( Header: flags, saved name and link )
BYTES 8200B13C76
DOCOL
LIT8 09 t.PLAY-SOUND-EFFECT t.LEAVE-VIEW t.;S
AT 7655

( ACTION-EXIT-GAME | NFA 7655 CFA 765A )
( Inferred descriptive name, not recovered original: )
( Action2 sets GAME-EXIT-FLAG to1. )
( Stack: -- )
AT 7655
( Header: flags, saved name and link )
BYTES 8200B24576
DOCOL
t.1 t.GAME-EXIT-FLAG t.! t.;S
AT 7664

( FOUR-ITEM-REWARD-OBJECTS | NFA 7664 CFA 7669 )
( Inferred descriptive name, not recovered original: Five )
( byte pairs [object,room] appended to base-view object )
( lists when $76DB detects the completed four-item )
( placement puzzle. )
( Stack: -- address )
AT 7664
( Header: flags, saved name and link )
BYTES 8200DA5576
DOVAR
BYTES 1F19821C6B1C07196B17
AT 7675

( FLASH-BACKGROUND | NFA 7675 CFA 767B )
( Inferred descriptive name, not recovered original: )
( Temporarily sets the COLOR4 shadow at $02C8 to14 for )
( three frames, then restores its original byte. )
( Stack: -- )
AT 7675
( Header: flags, saved name and link )
BYTES 830000D96476
DOCOL
LIT16 02C8 t.DUP t.C@ t.SWAP LIT8 0E t.OVER t.C! t.3 t.PAUSE
t.C! t.;S
AT 7696

( COUNT-PLACED-PUZZLE-ITEMS | NFA 7696 CFA 769B )
( Inferred descriptive name, not recovered original: Counts )
( items202..205 present respectively in rooms25..28/view1. )
( Stack: -- count )
AT 7696
( Header: flags, saved name and link )
BYTES 8200D47576
DOCOL
t.0 LIT16 0004 t.0 t.(DO)
( label 76A7 )
LIT8 CA t.I t.+ LIT8 19 t.I t.+ t.1 t.FIND-ROOM-VIEW-OBJECT
t.0BRANCH CELL 0006 ( -> 76C1 )
t.DROP t.1+
( label 76C1 )
t.(LOOP) CELL FFE4 ( -> 76A7 )
t.;S
AT 76C7

( FOUR-ITEM-PUZZLE-FLAG | NFA 76C7 CFA 76CC )
( Inferred descriptive name, not recovered original: )
( Returns the address of puzzle-state cell13, tested/set by )
( the four-item completion routine. )
( Stack: -- address )
AT 76C7
( Header: flags, saved name and link )
BYTES 8200D79676
DOCOL
LIT8 0D t.PUZZLE-STATE-CELLS t.;S
AT 76D5

( CHECK-FOUR-ITEM-PUZZLE | NFA 76D5 CFA 76DB )
( Inferred descriptive name, not recovered original: In )
( rooms25..28, if flag13 is clear and all four items are )
( correctly placed, adds the five reward objects, )
( flashes/plays effects, awards bits8/16, updates )
( pictures/message49 and sets flag13. Group6/resource49 )
( says the circle of the snake is broken and the player is )
( free. )
( Stack: -- )
AT 76D5
( Header: flags, saved name and link )
BYTES 830000DAC776
DOCOL
LIT8 18 t.CURRENT-ROOM t.@ LIT8 1D t.<=<
t.FOUR-ITEM-PUZZLE-FLAG t.@ t.0=_12DE t.*
t.0BRANCH CELL 0089 ( -> 777C )
t.COUNT-PLACED-PUZZLE-ITEMS LIT8 04 t.=
t.0BRANCH CELL 007E ( -> 777C )
LIT8 0A t.0 t.(DO)
( label 7707 )
t.FOUR-ITEM-REWARD-OBJECTS t.I t.+ t.DUP t.C@ t.SWAP t.1+ t.C@
t.0 t.ADD-ROOM-VIEW-OBJECT t.DROP t.2
t.(+LOOP) CELL FFE6 ( -> 7707 )
LIT8 0B t.PLAY-SOUND-EFFECT LIT8 08 t.SET-ROOM-ACHIEVEMENT
LIT8 10 t.SET-ROOM-ACHIEVEMENT t.FLASH-BACKGROUND t.LEAVE-VIEW
LIT8 31 t.SHOW-RESOURCE-MESSAGE t.CURRENT-ROOM t.@ LIT8 1C t.=
t.0BRANCH CELL 0010 ( -> 7756 )
LIT8 82 t.0 t.DRAW-TWO-IMAGES LIT8 6B t.0 t.DRAW-TWO-IMAGES
( label 7756 )
t.CURRENT-ROOM t.@ LIT8 19 t.=
t.0BRANCH CELL 0010 ( -> 7771 )
LIT8 1F t.0 t.DRAW-TWO-IMAGES LIT8 07 t.0 t.DRAW-TWO-IMAGES
( label 7771 )
t.1 t.FOUR-ITEM-PUZZLE-FLAG t.! LIT8 05 t.PLAY-SOUND-EFFECT
( label 777C )
t.;S
AT 777E

( ACTION-DROP-ITEM | NFA 777E CFA 7783 )
( Inferred descriptive name, not recovered original: )
( Action3 ZOSTAW chooses an inventory item, derives its )
( scene position from hit-map object201, removes it from )
( inventory, adds it to the current view and checks the )
( four-item puzzle. )
( Stack: -- )
AT 777E
( Header: flags, saved name and link )
BYTES 8200B3D576
DOCOL
t.WHICH-ITEM-MESSAGE t.2+ t.SHOW-MESSAGE
t.CHOOSE-INVENTORY-ITEM t.-DUP
t.0BRANCH CELL 0036 ( -> 77C7 )
t.>R LIT8 C9 t.CLEAR-TEXT-AREA t.OBJECT-HIT-MAP-XY t.R LIT8 CA
t.- t.ITEM-POSITIONS t.1+ t.C! t.R LIT8 CA t.-
t.ITEM-POSITIONS t.C! t.R t.REMOVE-INVENTORY-ITEM t.1
t.REMOVE-CURRENT-VIEW-OBJECT t.R> t.ADD-CURRENT-VIEW-OBJECT
t.REDRAW-CURRENT-VIEW LIT8 0C t.PLAY-SOUND-EFFECT
( label 77C7 )
t.CHECK-FOUR-ITEM-PUZZLE t.;S
AT 77CB

( ACTION-TAKE-ITEM | NFA 77CB CFA 77D0 )
( Inferred descriptive name, not recovered original: )
( Action4 WEZ adds SELECTED-OBJECT to inventory; on success )
( removes its scene entry, adds placeholder1 and redraws, )
( otherwise plays failure effect. )
( Stack: -- )
AT 77CB
( Header: flags, saved name and link )
BYTES 8200B47E77
DOCOL
t.SELECTED-OBJECT t.@ t.DUP t.ADD-INVENTORY-ITEM
t.0BRANCH CELL 0013 ( -> 77EF )
t.REMOVE-CURRENT-VIEW-OBJECT t.1 t.ADD-CURRENT-VIEW-OBJECT
t.REDRAW-CURRENT-VIEW LIT8 11 t.PLAY-SOUND-EFFECT
t.BRANCH CELL 0006 ( -> 77F3 )
( label 77EF )
t.PLAY-FAILURE-SOUND t.DROP
( label 77F3 )
t.;S
AT 77F5

( ACTION-ENTER-VIEW | NFA 77F5 CFA 77FA )
( Inferred descriptive name, not recovered original: )
( Action5 ZOBACZ enters the view specified by object )
( metadata byte1 and plays effect9. )
( Stack: -- )
AT 77F5
( Header: flags, saved name and link )
BYTES 8200B5CB77
DOCOL
t.OBJECT-DATA-1 t.ENTER-VIEW LIT8 09 t.PLAY-SOUND-EFFECT t.;S
AT 7807

( ACTION-DESCRIBE | NFA 7807 CFA 780C )
( Inferred descriptive name, not recovered original: )
( Action6 CO TO displays the counted message at selected )
( action payload+1 with effect22. )
( Stack: -- )
AT 7807
( Header: flags, saved name and link )
BYTES 8200B6F577
DOCOL
LIT8 16 t.PLAY-SOUND-EFFECT t.1 t.ACTION-PARAM-ADDR
t.SHOW-MESSAGE t.;S
AT 781B

( START-PART-ONE | NFA 781B CFA 7820 )
( Inferred descriptive name, not recovered original: )
( Action7 POCZATEK enables gameplay, stores part selector2, )
( loads group4, starts music0 and enters room1. )
( Stack: -- )
AT 781B
( Header: flags, saved name and link )
BYTES 8200B70778
DOCOL
t.CLEAR-TEXT-AREA t.1 t.LOAD-ITEM-ART-ENABLED t.! t.2
t.CURRENT-PART-GROUP t.! LIT16 0004 t.LOAD-PART-RESOURCES t.0
t.PLAY-MUSIC t.1 t.ENTER-ROOM t.;S
AT 7840

( PROTECTION-ERROR-MESSAGE | NFA 7840 CFA 7845 )
( Inferred descriptive name, not recovered original: )
( Encoded message decoded by adding$26 to25 bytes at $786B )
( and displayed when the part-two disk protection check )
( fails. )
( Stack: -- record )
( Decoded text: Message lines )
( Decoded by adding $26 to first 25 bytes )
( line 1 $784B: CHCESZ GRAC[2A]KUPUJ ORYGINAL )
AT 7840
( Header: flags, saved name and link )
BYTES 8200A31B78
DOVAR
BYTES 1C00011A1D221D1F2D3417212C1B3D04252F2A2F2417292C33212328
BYTES 1B6C
AT 7865

( DECODE-PROTECTION-MESSAGE | NFA 7865 CFA 786B )
( Inferred descriptive name, not recovered original: )
( Adds$26 to each of25 bytes beginning at protection )
( message+4. This is a destructive one-time transform )
( before the infinite failure loop. )
( Stack: -- )
AT 7865
( Header: flags, saved name and link )
BYTES 830000AB4078
DOCOL
t.PROTECTION-ERROR-MESSAGE LIT8 04 t.+ t.DUP LIT8 19 t.+
t.SWAP t.(DO)
( label 787F )
LIT8 26 t.I t.BYTE+!
t.(LOOP) CELL FFF7 ( -> 787F )
t.;S
AT 788C

( PROTECTION-SECTOR-ARGS | NFA 788C CFA 7891 )
( Inferred descriptive name, not recovered original: )
( Returns FIRST buffer and sector$01F5+$0196=$038B [907], )
( the arguments used by $78B0 for two disk-status probes. )
( Stack: -- buffer sector )
AT 788C
( Header: flags, saved name and link )
BYTES 8200C16578
DOCOL
t.FIRST LIT16 01F5 LIT16 0196 t.+ t.;S
AT 78A1

( PROTECTION-CHECK-CELL | NFA 78A1 CFA 78A6 )
( Inferred descriptive name, not recovered original: Cell )
( initialized$02D1; $78B0 includes a comparison with$21 in )
( its protection-failure expression. No independent writer )
( was found. )
( Stack: -- address )
AT 78A1
( Header: flags, saved name and link )
BYTES 8200D38C78
DOVAR
CELL 02D1
AT 78AA

( DISK-PROTECTION-FAILS | NFA 78AA CFA 78B0 )
( Inferred descriptive name, not recovered original: Reads )
( sectors907/908 through -DISK and compares the )
( zero/nonzero status pattern, combined with the )
( protection-check cell not equaling$21. Used only when )
( entering/loading group6. )
( Stack: -- flag )
AT 78AA
( Header: flags, saved name and link )
BYTES 830000C3A178
DOCOL
t.PROTECTION-SECTOR-ARGS t.1 t.1 t.-DISK t.0=_12DE t.0=_12DE
t.PROTECTION-SECTOR-ARGS t.1+ t.1 t.1 t.-DISK t.0=_12DE t.+
t.2 t.= t.0=_12DE t.PROTECTION-CHECK-CELL t.@ LIT8 21 t.=
t.0=_12DE t.* t.;S
AT 78E1

( SAVED-STATE-BYTES | NFA 78E1 CFA 78E8 )
( Inferred descriptive name, not recovered original: )
( Computes the state span from the PFA of $5560 through the )
( end of the direction cell at $58CF. )
( Stack: -- bytes )
AT 78E1
( Header: flags, saved name and link )
BYTES 84000000D0AA78
DOCOL
t.LAST-DIRECTION t.2+ t.SAVED-STATE-BASE t.- t.;S
AT 78F4

( SAVED-STATE-SECTORS | NFA 78F4 CFA 78FA )
( Inferred descriptive name, not recovered original: )
( Returns SAVED-STATE-BYTES/128+1 for writing state to )
( resource group8. )
( Stack: -- sectors )
AT 78F4
( Header: flags, saved name and link )
BYTES 830000CBE178
DOCOL
t.SAVED-STATE-BYTES LIT16 0080 t./ t.1+ t.;S
AT 7908

( READ-SAVED-STATE-GROUP | NFA 7908 CFA 790F )
( Inferred descriptive name, not recovered original: )
( Selects read/banked mode and reads group8 with $46C0 into )
( staging offset0; clears the bank mode afterward. )
( Stack: -- )
AT 7908
( Header: flags, saved name and link )
BYTES 84000000D0F478
DOCOL
t.1 t.TRANSFER-IS-LOAD t.! t.1 t.BANKED-TRANSFER t.! t.0
LIT8 14 LIT8 08 t.TRY-GROUP-TRANSFER t.DROP t.2DROP t.0
t.BANKED-TRANSFER t.! t.;S
AT 7933

( RESUME-GAME-MUSIC | NFA 7933 CFA 7938 )
( Inferred descriptive name, not recovered original: Starts )
( song0 only when the audio-state byte at $5F4E is zero. )
( Stack: -- )
AT 7933
( Header: flags, saved name and link )
BYTES 8200D50879
DOCOL
t.MUSIC-PAUSED t.C@ t.0=_12DE
t.0BRANCH CELL 0006 ( -> 7948 )
t.0 t.PLAY-MUSIC
( label 7948 )
t.;S
AT 794A

( CHECK-PART-TWO-DISK | NFA 794A CFA 7950 )
( Inferred descriptive name, not recovered original: For )
( group6 only, evaluates protection status; on failure )
( decodes/displays the protection message and loops forever. )
( Stack: group -- )
AT 794A
( Header: flags, saved name and link )
BYTES 830000D43379
DOCOL
LIT8 06 t.=
t.0BRANCH CELL 0018 ( -> 7971 )
t.DISK-PROTECTION-FAILS
t.0BRANCH CELL 0012 ( -> 7971 )
t.CLEAR-TEXT-AREA t.PLAY-FAILURE-SOUND
t.DECODE-PROTECTION-MESSAGE t.PROTECTION-ERROR-MESSAGE t.2+
t.SHOW-MESSAGE
( label 796D )
t.BRANCH CELL FFFE ( -> 796D )
( label 7971 )
t.;S
AT 7973

( LOAD-SAVED-GAME | NFA 7973 CFA 7978 )
( Inferred descriptive name, not recovered original: )
( Action8 ODCZYT reads group8, copies the saved state into )
( $5560, reloads the saved part resource group, checks )
( protection, restores music/facing and enters the saved )
( room. )
( Stack: -- )
AT 7973
( Header: flags, saved name and link )
BYTES 8200B84A79
DOCOL
t.CLEAR-TEXT-AREA t.STOP-MUSIC t.READ-SAVED-STATE-GROUP
t.GROUP-TRANSFER-ERROR t.@ t.0=_12DE
t.0BRANCH CELL 0036 ( -> 79BE )
t.SAVED-STATE-BASE t.0 t.SAVED-STATE-BYTES t.FETCH-BANK-RANGE
t.1 t.LOAD-ITEM-ART-ENABLED t.! t.0 t.MUSIC-PAUSED t.!
t.CURRENT-PART-GROUP t.@ t.2+ t.DUP t.>R t.LOAD-PART-RESOURCES
t.R> t.CHECK-PART-TWO-DISK t.RESUME-GAME-MUSIC
t.LAST-DIRECTION t.@ t.PLAYER-DIRECTION t.! t.CURRENT-ROOM t.@
t.ENTER-ROOM
( label 79BE )
t.;S
AT 79C0

( SAVE-GAME | NFA 79C0 CFA 79C5 )
( Inferred descriptive name, not recovered original: )
( Action9 ZAPIS stops music/VBI, writes the mutable state )
( span to group8, then restarts VBI/music. )
( Stack: -- )
AT 79C0
( Header: flags, saved name and link )
BYTES 8200B97379
DOCOL
t.CLEAR-TEXT-AREA t.SAVED-STATE-BASE t.SAVED-STATE-SECTORS
LIT8 08 t.STOP-MUSIC t.STOP-VBI1 t.WRITE-RESOURCE-GROUP
t.RUN-VBI1 t.RESUME-GAME-MUSIC t.;S
AT 79DC

( START-PART-TWO | NFA 79DC CFA 79E3 )
( Inferred descriptive name, not recovered original: Sets )
( part selector4, loads group6 and checks protection, )
( copies22 bytes of initial dropped-item positions to )
( $5638, resets direction and enters room23. )
( Stack: -- )
AT 79DC
( Header: flags, saved name and link )
BYTES 84000000DAC079
DOCOL
t.CLEAR-TEXT-AREA t.1 t.LOAD-ITEM-ART-ENABLED t.! LIT8 04
t.CURRENT-PART-GROUP t.! t.STOP-MUSIC LIT16 0006
t.LOAD-PART-RESOURCES LIT8 06 t.CHECK-PART-TWO-DISK
t.RESUME-GAME-MUSIC t.0 t.PART2-ITEM-POSITIONS t.0
t.ITEM-POSITIONS LIT8 16 t.CMOVE t.0 t.PLAYER-DIRECTION t.!
LIT8 17 t.ENTER-ROOM t.;S
AT 7A1D

( PLAY-SUCCESS-SOUND | NFA 7A1D CFA 7A24 )
( Inferred descriptive name, not recovered original: Plays )
( effect14 through $6000; reused by successful )
( object/puzzle actions. )
( Stack: -- )
AT 7A1D
( Header: flags, saved name and link )
BYTES 84000000DADC79
DOCOL
LIT8 0E t.PLAY-SOUND-EFFECT t.;S
AT 7A2D

( ACTION-SHOW-SPELLBOOK | NFA 7A2D CFA 7A33 )
( Inferred descriptive name, not recovered original: )
( Action10 draws the spellbook and waits for key/fire )
( dismissal, with effect1. )
( Stack: -- )
AT 7A2D
( Header: flags, saved name and link )
BYTES 830000B01D7A
DOCOL
t.1 t.PLAY-SOUND-EFFECT t.CLEAR-TEXT-AREA t.DRAW-SPELLBOOK
t.WAIT-KEY-OR-FIRE t.CLEAR-TEXT-AREA t.;S
AT 7A43

( ACTION-SHOW-INVENTORY | NFA 7A43 CFA 7A49 )
( Inferred descriptive name, not recovered original: )
( Action11 opens inventory, plays effect16, waits for )
( key/fire dismissal and restores the previous view. )
( Stack: -- )
AT 7A43
( Header: flags, saved name and link )
BYTES 830000B12D7A
DOCOL
t.CLEAR-TEXT-AREA t.ENTER-INVENTORY-VIEW LIT8 10
t.PLAY-SOUND-EFFECT t.WAIT-KEY-OR-FIRE t.LEAVE-INVENTORY-VIEW
t.;S
AT 7A5A

( ACTION-OPEN-PAIR | NFA 7A5A CFA 7A60 )
( Inferred descriptive name, not recovered original: )
( Action13 OTWORZ removes action byte1 and object byte0, )
( adds action bytes3/4 and draws their replacement pair. )
( Stack: -- )
AT 7A5A
( Header: flags, saved name and link )
BYTES 830000B3437A
DOCOL
t.ACTION-PARAM-1 t.REMOVE-CURRENT-VIEW-OBJECT t.OBJECT-DATA-0
t.REMOVE-CURRENT-VIEW-OBJECT t.ACTION-PARAM-3
t.ADD-CURRENT-VIEW-OBJECT t.ACTION-PARAM-4
t.ADD-CURRENT-VIEW-OBJECT t.ACTION-PARAM-3 t.ACTION-PARAM-4
t.DRAW-TWO-IMAGES t.PLAY-SUCCESS-SOUND t.;S
AT 7A7C

( ACTION-CLOSE-PAIR | NFA 7A7C CFA 7A82 )
( Inferred descriptive name, not recovered original: )
( Action14 ZAMKNIJ removes action bytes1/2, adds action )
( byte3 and object byte0, then draws that replacement pair. )
( Stack: -- )
AT 7A7C
( Header: flags, saved name and link )
BYTES 830000B45A7A
DOCOL
t.ACTION-PARAM-1 t.REMOVE-CURRENT-VIEW-OBJECT t.ACTION-PARAM-2
t.REMOVE-CURRENT-VIEW-OBJECT t.ACTION-PARAM-3
t.ADD-CURRENT-VIEW-OBJECT t.OBJECT-DATA-0
t.ADD-CURRENT-VIEW-OBJECT t.ACTION-PARAM-3 t.OBJECT-DATA-0
t.DRAW-TWO-IMAGES t.PLAY-SUCCESS-SOUND t.;S
AT 7A9E

( ACTION-ENTER-ROOM | NFA 7A9E CFA 7AA4 )
( Inferred descriptive name, not recovered original: )
( Action15 IDZ enters the room named by object metadata )
( byte0. )
( Stack: -- )
AT 7A9E
( Header: flags, saved name and link )
BYTES 830000B57C7A
DOCOL
t.OBJECT-DATA-0 t.ENTER-ROOM t.;S
AT 7AAC

( ACTION-OPEN-REPLACEMENT | NFA 7AAC CFA 7AB2 )
( Inferred descriptive name, not recovered original: )
( Actions16 OTWORZ and45 NACISNIJ remove object byte0 and )
( action byte2, add action byte3, draw action bytes1/3 and )
( play success effect. )
( Stack: -- )
AT 7AAC
( Header: flags, saved name and link )
BYTES 830000B69E7A
DOCOL
t.OBJECT-DATA-0 t.REMOVE-CURRENT-VIEW-OBJECT t.ACTION-PARAM-2
t.REMOVE-CURRENT-VIEW-OBJECT t.ACTION-PARAM-3
t.ADD-CURRENT-VIEW-OBJECT t.ACTION-PARAM-1 t.ACTION-PARAM-3
t.DRAW-TWO-IMAGES t.PLAY-SUCCESS-SOUND t.;S
AT 7ACA

( ACTION-CLOSE-REPLACEMENT | NFA 7ACA CFA 7AD0 )
( Inferred descriptive name, not recovered original: )
( Action17 ZAMKNIJ removes action byte2, adds action byte3 )
( and object byte0, then draws the action1/action3/object0 )
( triple. )
( Stack: -- )
AT 7ACA
( Header: flags, saved name and link )
BYTES 830000B7AC7A
DOCOL
t.ACTION-PARAM-2 t.REMOVE-CURRENT-VIEW-OBJECT t.ACTION-PARAM-3
t.ADD-CURRENT-VIEW-OBJECT t.OBJECT-DATA-0
t.ADD-CURRENT-VIEW-OBJECT t.ACTION-PARAM-1 t.ACTION-PARAM-3
t.OBJECT-DATA-0 t.DRAW-THREE-IMAGES t.PLAY-SUCCESS-SOUND t.;S
AT 7AEA

( LEARN-OBJECT-SPELL | NFA 7AEA CFA 7AF0 )
( Inferred descriptive name, not recovered original: )
( Finds/initializes a spellbook entry from object )
( metadata+1, adjusts its ingredient IDs by200, reveals its )
( text character by character with effect18, and awards )
( achievement bit64. )
( Stack: -- )
AT 7AEA
( Header: flags, saved name and link )
BYTES 830000B8CA7A
DOCOL
t.SCENE-OBJECT-DATA t.1+ t.PREPARE-LEARNED-SPELL LIT8 C8
t.SPELL-LEARNING-POINTERS t.2+ t.@ LIT16 0004 t.- t.2DUP
t.BYTE+! t.1+ t.BYTE+! t.CLEAR-TEXT-AREA t.DRAW-SPELLBOOK
t.SPELL-LEARNING-POINTERS t.@ t.C@ t.0 t.(DO)
( label 7B1D )
t.2 t.PAUSE LIT8 12 t.PLAY-SOUND-EFFECT
t.SPELL-LEARNING-POINTERS t.@ t.1+ t.I t.+ t.C@
t.SPELL-LEARNING-POINTERS t.2+ t.@ t.I t.+ t.C!
t.DRAW-SPELLBOOK
t.(LOOP) CELL FFDB ( -> 7B1D )
t.WAIT-KEY-OR-FIRE t.CLEAR-TEXT-AREA LIT8 40
t.SET-ROOM-ACHIEVEMENT t.;S
AT 7B4F

( ACTION-COPY-SPELL | NFA 7B4F CFA 7B55 )
( Inferred descriptive name, not recovered original: )
( Action18 PRZEPISZ removes object metadata byte0 from the )
( scene, redraws and learns the object spell. )
( Stack: -- )
AT 7B4F
( Header: flags, saved name and link )
BYTES 830000B8EA7A
DOCOL
t.OBJECT-DATA-0 t.REMOVE-CURRENT-VIEW-OBJECT
t.REDRAW-CURRENT-VIEW t.LEARN-OBJECT-SPELL t.;S
AT 7B61

( SPELL-NAME-MESSAGE | NFA 7B61 CFA 7B66 )
( Inferred descriptive name, not recovered original: )
( Mutable counted message beginning CZAR followed by space )
( for the spell name; filled/displayed by $7B82. )
( Stack: -- record )
( Decoded text: Message lines )
( line 1 $7B6C: CZAR  )
AT 7B61
( Header: flags, saved name and link )
BYTES 8200C34F7B
DOVAR
BYTES 07000105435A41523D2020202020202020202020
AT 7B7C

( ACTION-DESCRIBE-SPELL | NFA 7B7C CFA 7B82 )
( Inferred descriptive name, not recovered original: )
( Action19 CO TO builds CZAR plus the counted spell name at )
( object metadata+4 and displays it with effect22. )
( Stack: -- )
AT 7B7C
( Header: flags, saved name and link )
BYTES 830000B9617B
DOCOL
t.SCENE-OBJECT-DATA LIT16 0004 t.+ t.COUNT LIT16 0005
t.SPELL-NAME-MESSAGE t.3 t.+ t.C! t.DUP t.SPELL-NAME-MESSAGE
t.3 t.+ t.BYTE+! t.SPELL-NAME-MESSAGE LIT16 0009 t.+ t.SWAP
t.CMOVE t.SPELL-NAME-MESSAGE t.2+ LIT8 16 t.PLAY-SOUND-EFFECT
t.SHOW-MESSAGE t.;S
AT 7BBD

( WRONG-ITEM-MESSAGE | NFA 7BBD CFA 7BC2 )
( Inferred descriptive name, not recovered original: )
( Counted TYM NIE MOZESZ message shown by $7BFA for a )
( selected but incorrect item. )
( Stack: -- record )
( Decoded text: Message lines )
( line 1 $7BC8: TYM NIE )
( line 2 $7BD0: MOZESZ )
AT 7BBD
( Header: flags, saved name and link )
BYTES 8200CE7C7B
DOVAR
BYTES 1000020754594D3D4E4945064D4F7A45535A20202020
AT 7BDA

( WITH-WHAT-MESSAGE | NFA 7BDA CFA 7BDF )
( Inferred descriptive name, not recovered original: )
( Counted CZYM? prompt displayed before choosing an )
( inventory item for an action. )
( Stack: -- record )
( Decoded text: Message lines )
( line 1 $7BE5: CZYM? )
AT 7BDA
( Header: flags, saved name and link )
BYTES 8200D9BD7B
DOVAR
BYTES 07000105435A594D3F20
AT 7BEB

( LAST-CHOSEN-ITEM | NFA 7BEB CFA 7BF0 )
( Inferred descriptive name, not recovered original: Set by )
( $7BFA to the most recently chosen inventory item, )
( including an incorrect selection; several handlers test )
( alternate item IDs. )
( Stack: -- address )
AT 7BEB
( Header: flags, saved name and link )
BYTES 8200D2DA7B
DOVAR
CELL 0000
AT 7BF4

( CHOOSE-REQUIRED-ITEM | NFA 7BF4 CFA 7BFA )
( Inferred descriptive name, not recovered original: )
( Adds200 to the required local ID, prompts for inventory )
( selection, saves it at $7BF0 and compares it; if )
( requiredID+200 wraps to zero it accepts without prompting. )
( Stack: local-item -- flag )
AT 7BF4
( Header: flags, saved name and link )
BYTES 830000DAEB7B
DOCOL
LIT8 C8 t.+ t.>R t.R
t.0BRANCH CELL 0032 ( -> 7C39 )
t.CLEAR-TEXT-AREA t.WITH-WHAT-MESSAGE t.2+ t.SHOW-MESSAGE
t.CHOOSE-INVENTORY-ITEM t.DUP t.LAST-CHOSEN-ITEM t.! t.DUP
t.0BRANCH CELL 0018 ( -> 7C35 )
t.R t.= t.DUP t.0=_12DE
t.0BRANCH CELL 000C ( -> 7C35 )
t.CLEAR-TEXT-AREA t.PLAY-FAILURE-SOUND t.WRONG-ITEM-MESSAGE
t.2+ t.SHOW-MESSAGE
( label 7C35 )
t.BRANCH CELL 0004 ( -> 7C3B )
( label 7C39 )
t.1
( label 7C3B )
t.R> t.DROP t.;S
AT 7C41

( ACTION-REPLACEMENT-IMAGE | NFA 7C41 CFA 7C47 )
( Inferred descriptive name, not recovered original: )
( Optional replacement image/object value set by $7C51 and )
( consumed by conditional scene changes at $7C5F/$7CAA. )
( Stack: -- address )
AT 7C41
( Header: flags, saved name and link )
BYTES 830000D7F47B
DOVAR
CELL 0000
AT 7C4B

( SET-REPLACEMENT-IMAGE | NFA 7C4B CFA 7C51 )
( Inferred descriptive name, not recovered original: Stores )
( the value in $7C47. )
( Stack: image -- )
AT 7C4B
( Header: flags, saved name and link )
BYTES 830000A1417C
DOCOL
t.ACTION-REPLACEMENT-IMAGE t.! t.;S
AT 7C59

( OPEN-SCENE-IF-TRUE | NFA 7C59 CFA 7C5F )
( Inferred descriptive name, not recovered original: On a )
( true argument adds action byte1 to the current view, )
( draws it with the optional replacement image, awards bit2 )
( and plays success. )
( Stack: flag -- )
AT 7C59
( Header: flags, saved name and link )
BYTES 830000D44B7C
DOCOL
t.0BRANCH CELL 0016 ( -> 7C79 )
t.CLEAR-TEXT-AREA t.ACTION-PARAM-1 t.ADD-CURRENT-VIEW-OBJECT
t.ACTION-PARAM-1 t.2 t.SET-ROOM-ACHIEVEMENT
t.ACTION-REPLACEMENT-IMAGE t.@ t.DRAW-TWO-IMAGES
t.PLAY-SUCCESS-SOUND
( label 7C79 )
t.;S
AT 7C7B

( ACTION-OPEN-WITH-ITEM | NFA 7C7B CFA 7C81 )
( Inferred descriptive name, not recovered original: )
( Action20 OTWORZ sets replacement image0, requires the )
( item named by object byte1 and applies $7C5F. )
( Stack: -- )
AT 7C7B
( Header: flags, saved name and link )
BYTES 830000B0597C
DOCOL
t.0 t.SET-REPLACEMENT-IMAGE t.OBJECT-DATA-1
t.CHOOSE-REQUIRED-ITEM t.OPEN-SCENE-IF-TRUE t.;S
AT 7C8F

( ACTION-OPEN-WITH-SPELL | NFA 7C8F CFA 7C95 )
( Inferred descriptive name, not recovered original: )
( Action21 ZAKLECIE sets replacement image0, requires the )
( spell named by object byte0 and applies $7C5F. )
( Stack: -- )
AT 7C8F
( Header: flags, saved name and link )
BYTES 830000B17B7C
DOCOL
t.0 t.SET-REPLACEMENT-IMAGE t.OBJECT-DATA-0
t.CHOOSE-REQUIRED-SPELL t.OPEN-SCENE-IF-TRUE t.;S
AT 7CA3

( REPLACE-SCENE-IF-TRUE | NFA 7CA3 CFA 7CAA )
( Inferred descriptive name, not recovered original: On a )
( true argument draws action byte1 plus the replacement )
( object, adds that object, removes action byte2 and awards )
( achievement bit4. )
( Stack: flag -- )
AT 7CA3
( Header: flags, saved name and link )
BYTES 84000000D48F7C
DOCOL
t.0BRANCH CELL 0019 ( -> 7CC7 )
t.CLEAR-TEXT-AREA t.ACTION-PARAM-1 t.ACTION-REPLACEMENT-IMAGE
t.@ t.DUP t.ADD-CURRENT-VIEW-OBJECT t.DRAW-TWO-IMAGES
t.ACTION-PARAM-2 t.REMOVE-CURRENT-VIEW-OBJECT LIT8 04
t.SET-ROOM-ACHIEVEMENT
( label 7CC7 )
t.;S
AT 7CC9

( REPLACE-AND-SET-PUZZLE | NFA 7CC9 CFA 7CCF )
( Inferred descriptive name, not recovered original: )
( Applies the conditional replacement and, on success, sets )
( the puzzle-state cell indexed by object byte2 to1 and )
( plays effect2. )
( Stack: flag -- )
AT 7CC9
( Header: flags, saved name and link )
BYTES 830000B2A37C
DOCOL
t.DUP t.REPLACE-SCENE-IF-TRUE
t.0BRANCH CELL 000E ( -> 7CE5 )
t.1 t.OBJECT-DATA-2 t.PUZZLE-STATE-CELLS t.! t.2
t.PLAY-SOUND-EFFECT
( label 7CE5 )
t.;S
AT 7CE7

( ACTION-DESTROY-WITH-ITEM | NFA 7CE7 CFA 7CED )
( Inferred descriptive name, not recovered original: )
( Action22 ZNISZCZ uses replacement0, requires the item )
( named by object byte1, then replaces the scene and sets )
( its puzzle-state cell. )
( Stack: -- )
AT 7CE7
( Header: flags, saved name and link )
BYTES 830000B2C97C
DOCOL
t.0 t.SET-REPLACEMENT-IMAGE t.OBJECT-DATA-1
t.CHOOSE-REQUIRED-ITEM t.REPLACE-AND-SET-PUZZLE t.;S
AT 7CFB

( REPLACE-WHEN-PUZZLE-SET | NFA 7CFB CFA 7D01 )
( Inferred descriptive name, not recovered original: Tests )
( puzzle cell indexed by object byte1 and applies )
( conditional replacement; displays the object message at+2 )
( if false, otherwise plays success. )
( Stack: -- )
AT 7CFB
( Header: flags, saved name and link )
BYTES 830000B3E77C
DOCOL
t.OBJECT-DATA-1 t.PUZZLE-STATE-CELLS t.@ t.DUP
t.REPLACE-SCENE-IF-TRUE t.0=_12DE
t.0BRANCH CELL 0010 ( -> 7D21 )
t.PLAY-FAILURE-SOUND t.CLEAR-TEXT-AREA t.SCENE-OBJECT-DATA
t.2+ t.SHOW-MESSAGE
t.BRANCH CELL 0004 ( -> 7D23 )
( label 7D21 )
t.PLAY-SUCCESS-SOUND
( label 7D23 )
t.;S
AT 7D25

( ACTION-LIFT-IF-READY | NFA 7D25 CFA 7D2B )
( Inferred descriptive name, not recovered original: )
( Action23 PODNIES sets replacement0 and calls $7D01 to )
( require its puzzle-state condition. )
( Stack: -- )
AT 7D25
( Header: flags, saved name and link )
BYTES 830000B3FB7C
DOCOL
t.0 t.SET-REPLACEMENT-IMAGE t.REPLACE-WHEN-PUZZLE-SET t.;S
AT 7D35

( MAGIC-RESTORED-MESSAGE | NFA 7D35 CFA 7D3A )
( Inferred descriptive name, not recovered original: )
( Counted ODZYSKALES MAGICZNA MOC text displayed by the )
( matching magic-restoring stone action. )
( Stack: -- record )
( Decoded text: Message lines )
( line 1 $7D40: ODZYSKALES )
( line 2 $7D4B: MAGICZNA MOC )
AT 7D35
( Header: flags, saved name and link )
BYTES 8200CD257D
DOVAR
BYTES 1900020A4F445A59534B416C45730C4D414749435A4E613D4D4F4320
AT 7D58

( FLASH-TWO-IMAGES | NFA 7D58 CFA 7D5F )
( Inferred descriptive name, not recovered original: )
( Alternates the two encoded image IDs eight times with )
( delays of3 and6 frames. )
( Stack: image1 image2 -- )
AT 7D58
( Header: flags, saved name and link )
BYTES 84000000D3357D
DOCOL
LIT8 08 t.0 t.(DO)
( label 7D68 )
t.OVER t.CLASSIFY-OBJECT t.DROP t.DRAW-PICTURE-AND-MASK t.3
t.PAUSE t.DUP t.CLASSIFY-OBJECT t.DROP t.DRAW-PICTURE-AND-MASK
LIT8 06 t.PAUSE
t.(LOOP) CELL FFE5 ( -> 7D68 )
t.2DROP t.;S
AT 7D89

( ACTION-TOUCH-MAGIC-STONE | NFA 7D89 CFA 7D8F )
( Inferred descriptive name, not recovered original: )
( Action24 DOTKNIJ flashes object metadata images0/1; if )
( magic-disabled cell2 equals object byte2, displays )
( restoration text and clears the disabled state. )
( Stack: -- )
AT 7D89
( Header: flags, saved name and link )
BYTES 830000B4587D
DOCOL
LIT8 08 t.PLAY-SOUND-EFFECT t.OBJECT-DATA-0 t.OBJECT-DATA-1
t.FLASH-TWO-IMAGES t.2 t.PUZZLE-STATE-CELLS t.@
t.OBJECT-DATA-2 t.=
t.0BRANCH CELL 0015 ( -> 7DBD )
LIT8 05 t.PLAY-SOUND-EFFECT t.MAGIC-RESTORED-MESSAGE t.2+
t.SHOW-MESSAGE t.0 t.2 t.PUZZLE-STATE-CELLS t.!
( label 7DBD )
t.;S
AT 7DBF

( ACTION-DESCRIBE-OBJECT | NFA 7DBF CFA 7DC5 )
( Inferred descriptive name, not recovered original: )
( Action25 CO TO displays a message at object metadata+3 )
( with effect22. )
( Stack: -- )
AT 7DBF
( Header: flags, saved name and link )
BYTES 830000B5897D
DOCOL
LIT8 16 t.PLAY-SOUND-EFFECT t.SCENE-OBJECT-DATA t.3 t.+
t.SHOW-MESSAGE t.;S
AT 7DD6

( ACTION-OPEN-IF-READY | NFA 7DD6 CFA 7DDC )
( Inferred descriptive name, not recovered original: )
( Action26 OTWORZ sets replacement to action byte3 then )
( performs the puzzle-flag-gated replacement at $7D01. )
( Stack: -- )
AT 7DD6
( Header: flags, saved name and link )
BYTES 830000B6BF7D
DOCOL
t.ACTION-PARAM-3 t.SET-REPLACEMENT-IMAGE
t.REPLACE-WHEN-PUZZLE-SET t.;S
AT 7DE6

( ACTION-EXAMINE-OBJECT | NFA 7DE6 CFA 7DEC )
( Inferred descriptive name, not recovered original: )
( Action27 ZBADAJ displays the message at object metadata+2 )
( with effect22. )
( Stack: -- )
AT 7DE6
( Header: flags, saved name and link )
BYTES 830000B7D67D
DOCOL
LIT8 16 t.PLAY-SOUND-EFFECT t.SCENE-OBJECT-DATA t.2+
t.SHOW-MESSAGE t.;S
AT 7DFB

( DISABLE-MAGIC | NFA 7DFB CFA 7E02 )
( Inferred descriptive name, not recovered original: Stores )
( the supplied state in puzzle cell2, moves the text cursor )
( down four rows and displays the no-magic message. )
( Stack: state -- )
AT 7DFB
( Header: flags, saved name and link )
BYTES 84000000A1E67D
DOCOL
t.2 t.PUZZLE-STATE-CELLS t.! t.Y@ LIT8 04 t.+ t.Y!
t.NO-MAGIC-MESSAGE t.2+ t.SHOW-MESSAGE t.;S
AT 7E1B

( ACTION-OPEN-MAGIC-TRAP | NFA 7E1B CFA 7E21 )
( Inferred descriptive name, not recovered original: )
( Action28 OTWORZ attempts $7DDC; when its puzzle flag )
( remains clear, plays effect15 and disables magic using )
( object byte0. )
( Stack: -- )
AT 7E1B
( Header: flags, saved name and link )
BYTES 830000B8FB7D
DOCOL
t.ACTION-OPEN-IF-READY t.OBJECT-DATA-1 t.PUZZLE-STATE-CELLS
t.@ t.0=_12DE
t.0BRANCH CELL 000B ( -> 7E3A )
LIT8 0F t.PLAY-SOUND-EFFECT t.OBJECT-DATA-0 t.DISABLE-MAGIC
( label 7E3A )
t.;S
AT 7E3C

( ACTION-REPLACE-WITH-SPELL | NFA 7E3C CFA 7E42 )
( Inferred descriptive name, not recovered original: )
( Action29 ZAKLECIE requires the spell in object byte0 then )
( replaces the scene and sets its puzzle flag, with )
( replacement0. )
( Stack: -- )
AT 7E3C
( Header: flags, saved name and link )
BYTES 830000B91B7E
DOCOL
t.0 t.SET-REPLACEMENT-IMAGE t.OBJECT-DATA-0
t.CHOOSE-REQUIRED-SPELL t.REPLACE-AND-SET-PUZZLE t.;S
AT 7E50

( ACTION-ADD-SCENE-OBJECT | NFA 7E50 CFA 7E56 )
( Inferred descriptive name, not recovered original: )
( Action30 OTWORZ adds action byte1, redraws and awards )
( achievement bit32 with success sound. )
( Stack: -- )
AT 7E50
( Header: flags, saved name and link )
BYTES 830000B03C7E
DOCOL
t.ACTION-PARAM-1 t.ADD-CURRENT-VIEW-OBJECT
t.REDRAW-CURRENT-VIEW t.PLAY-SUCCESS-SOUND LIT8 20
t.SET-ROOM-ACHIEVEMENT t.;S
AT 7E67

( ACTION-REMOVE-SCENE-OBJECT | NFA 7E67 CFA 7E6D )
( Inferred descriptive name, not recovered original: )
( Action31 ZAMKNIJ removes action byte1, redraws and plays )
( success sound. )
( Stack: -- )
AT 7E67
( Header: flags, saved name and link )
BYTES 830000B1507E
DOCOL
t.ACTION-PARAM-1 t.REMOVE-CURRENT-VIEW-OBJECT
t.REDRAW-CURRENT-VIEW t.PLAY-SUCCESS-SOUND t.;S
AT 7E79

( ACTION-SPELL-REMOTE-VIEW | NFA 7E79 CFA 7E7F )
( Inferred descriptive name, not recovered original: )
( Action32 ZAKLECIE requires action-byte2 spell, checks )
( byte1 of the current-room view-list payload equals )
( action-byte3 object, then replaces that object with byte4 )
( in the selected view; otherwise displays the action+5 )
( error. )
( Stack: -- )
AT 7E79
( Header: flags, saved name and link )
BYTES 830000B2677E
DOCOL
t.ACTION-PARAM-2 t.CHOOSE-REQUIRED-SPELL
t.0BRANCH CELL 0054 ( -> 7EDB )
t.CLEAR-TEXT-AREA t.CURRENT-ROOM t.@ t.ACTION-PARAM-1
t.ROOM-VIEW-OBJECTS t.3 t.+ t.C@ t.ACTION-PARAM-3 t.=
t.0BRANCH CELL 0032 ( -> 7ED1 )
LIT8 08 t.SET-ROOM-ACHIEVEMENT LIT8 0B t.PLAY-SOUND-EFFECT
t.FLASH-BACKGROUND t.CURRENT-ROOM t.@ t.ACTION-PARAM-3 t.OVER
t.ACTION-PARAM-1 t.REMOVE-ROOM-VIEW-OBJECT LIT8 05 t.PAUSE
t.ACTION-PARAM-4 t.SWAP t.ACTION-PARAM-1
t.ADD-ROOM-VIEW-OBJECT t.DROP LIT8 01 t.PLAY-SOUND-EFFECT
t.BRANCH CELL 000C ( -> 7EDB )
( label 7ED1 )
t.PLAY-FAILURE-SOUND LIT16 0005 t.ACTION-PARAM-ADDR
t.SHOW-MESSAGE
( label 7EDB )
t.;S
AT 7EDD

( ACTION-TAKE-REWARD | NFA 7EDD CFA 7EE3 )
( Inferred descriptive name, not recovered original: )
( Action33 WEZ adds action-byte3 item to inventory; on )
( success removes action-byte2 scene object, updates the )
( picture, awards bit32 and clears puzzle cell indexed by )
( action byte4. )
( Stack: -- )
AT 7EDD
( Header: flags, saved name and link )
BYTES 830000B3797E
DOCOL
t.ACTION-PARAM-3 t.ADD-INVENTORY-ITEM
t.0BRANCH CELL 001E ( -> 7F09 )
t.ACTION-PARAM-2 t.REMOVE-CURRENT-VIEW-OBJECT t.ACTION-PARAM-1
t.0 t.DRAW-TWO-IMAGES LIT8 11 t.PLAY-SOUND-EFFECT LIT8 20
t.SET-ROOM-ACHIEVEMENT t.0 t.ACTION-PARAM-4
t.PUZZLE-STATE-CELLS t.!
( label 7F09 )
t.;S
AT 7F0B

( ACTION-CLOSE-PUZZLE-VIEW | NFA 7F0B CFA 7F11 )
( Inferred descriptive name, not recovered original: )
( Action35 ZAMKNIJ removes action byte2 and restores action )
( byte3 plus the object ID stored in the puzzle cell )
( indexed by action byte4, drawing all three layers. )
( Stack: -- )
AT 7F0B
( Header: flags, saved name and link )
BYTES 830000B5DD7E
DOCOL
t.ACTION-PARAM-2 t.REMOVE-CURRENT-VIEW-OBJECT t.ACTION-PARAM-3
t.ADD-CURRENT-VIEW-OBJECT t.ACTION-PARAM-4
t.PUZZLE-STATE-CELLS t.@ t.ADD-CURRENT-VIEW-OBJECT
t.ACTION-PARAM-1 t.ACTION-PARAM-3 t.ACTION-PARAM-4
t.PUZZLE-STATE-CELLS t.@ t.DRAW-THREE-IMAGES
t.PLAY-SUCCESS-SOUND t.;S
AT 7F33

( YOU-WON-MESSAGE | NFA 7F33 CFA 7F38 )
( Inferred descriptive name, not recovered original: )
( Counted WYGRALES [you won] text shown when $7F69 accepts )
( the game item. )
( Stack: -- record )
( Decoded text: Message lines )
( line 1 $7F3E: WYGRALES )
AT 7F33
( Header: flags, saved name and link )
BYTES 8200C70B7F
DOVAR
BYTES 0A00010857594752416C4573202020
AT 7F49

( NO-MORE-PLAY-MESSAGE | NFA 7F49 CFA 7F4E )
( Inferred descriptive name, not recovered original: )
( Counted JUZ NIE GRAM text shown when the one-time play )
( action has already succeeded. )
( Stack: -- record )
( Decoded text: Message lines )
( line 1 $7F54: JUZ NIE GRAM )
AT 7F49
( Header: flags, saved name and link )
BYTES 8200C7337F
DOVAR
BYTES 0E00010C4A557A3D4E49453D4752414D202020
AT 7F63

( ACTION-PLAY-FOR-PRIZE | NFA 7F63 CFA 7F69 )
( Inferred descriptive name, not recovered original: )
( Action34 ZAGRAJ requires an inventory item, inserts a )
( prize object into a view, opens that view and sets its )
( one-time puzzle flag; alternate/wrong selections display )
( separate messages. )
( Stack: -- )
AT 7F63
( Header: flags, saved name and link )
BYTES 830000B4497F
DOCOL
t.ACTION-PARAM-4 t.PUZZLE-STATE-CELLS t.@ t.0=_12DE
t.0BRANCH CELL 0061 ( -> 7FD6 )
t.ACTION-PARAM-2 LIT8 C8 t.- t.CHOOSE-REQUIRED-ITEM
t.0BRANCH CELL 0030 ( -> 7FB2 )
t.CLEAR-TEXT-AREA t.ACTION-PARAM-3 t.CURRENT-ROOM t.@
t.OBJECT-DATA-1 t.ADD-ROOM-VIEW-OBJECT t.DROP LIT8 0A
t.PLAY-SOUND-EFFECT t.YOU-WON-MESSAGE t.2+ t.SHOW-MESSAGE
t.OBJECT-DATA-1 t.ENTER-VIEW t.1 t.ACTION-PARAM-4
t.PUZZLE-STATE-CELLS t.! LIT8 08 t.SET-ROOM-ACHIEVEMENT
t.BRANCH CELL 0022 ( -> 7FD2 )
( label 7FB2 )
t.LAST-CHOSEN-ITEM t.@ t.ACTION-PARAM-1 t.=
t.0BRANCH CELL 0016 ( -> 7FD2 )
t.Y@ LIT16 0004 t.+ t.Y! t.PLAY-FAILURE-SOUND LIT16 0005
t.ACTION-PARAM-ADDR t.SHOW-MESSAGE
( label 7FD2 )
t.BRANCH CELL 000C ( -> 7FE0 )
( label 7FD6 )
t.CLEAR-TEXT-AREA t.PLAY-FAILURE-SOUND t.NO-MORE-PLAY-MESSAGE
t.2+ t.SHOW-MESSAGE
( label 7FE0 )
t.;S
AT 7FE2

( ACTION-PAY-OR-TRIGGER-TRAP | NFA 7FE2 CFA 7FE8 )
( Inferred descriptive name, not recovered original: )
( Action36 ZAPLAC accepts object-byte1 item, consumes it )
( and opens the replacement; selecting the alternate )
( object-byte2 item instead flashes images, displays a )
( message and disables magic. )
( Stack: -- )
AT 7FE2
( Header: flags, saved name and link )
BYTES 830000B6637F
DOCOL
t.OBJECT-DATA-1 t.CHOOSE-REQUIRED-ITEM
t.0BRANCH CELL 0018 ( -> 8008 )
t.ACTION-OPEN-REPLACEMENT t.CLEAR-TEXT-AREA t.OBJECT-DATA-1
LIT8 C8 t.+ t.REMOVE-INVENTORY-ITEM LIT8 08
t.SET-ROOM-ACHIEVEMENT
t.BRANCH CELL 0037 ( -> 803D )
( label 8008 )
t.OBJECT-DATA-2 LIT8 C8 t.+ t.LAST-CHOSEN-ITEM t.@ t.=
t.0BRANCH CELL 0026 ( -> 803D )
t.SCENE-OBJECT-DATA LIT8 04 t.+ t.BYTE-PAIR@
t.FLASH-TWO-IMAGES t.CLEAR-TEXT-AREA LIT8 0F
t.PLAY-SOUND-EFFECT LIT16 0004 t.ACTION-PARAM-ADDR
t.SHOW-MESSAGE t.SCENE-OBJECT-DATA t.3 t.+ t.C@
t.DISABLE-MAGIC
( label 803D )
t.;S
AT 803F

( ACTION-CANNOT-TAKE | NFA 803F CFA 8045 )
( Inferred descriptive name, not recovered original: )
( Actions37 ZDEJMIJ and41 PODNIES play failure sound and )
( display the message at action payload+1. )
( Stack: -- )
AT 803F
( Header: flags, saved name and link )
BYTES 830000B7E27F
DOCOL
t.PLAY-FAILURE-SOUND t.1 t.ACTION-PARAM-ADDR t.SHOW-MESSAGE
t.;S
AT 8051

( ACTION-SPELL-REPLACEMENT | NFA 8051 CFA 8057 )
( Inferred descriptive name, not recovered original: )
( Action38 ZAKLECIE uses object byte1 as replacement image, )
( requires the spell in byte0, and applies replacement plus )
( puzzle-state update. )
( Stack: -- )
AT 8051
( Header: flags, saved name and link )
BYTES 830000B83F80
DOCOL
t.OBJECT-DATA-1 t.SET-REPLACEMENT-IMAGE t.OBJECT-DATA-0
t.CHOOSE-REQUIRED-SPELL t.REPLACE-AND-SET-PUZZLE t.;S
AT 8065

( ACTION-CATCH-WITH-ITEM | NFA 8065 CFA 806B )
( Inferred descriptive name, not recovered original: )
( Action39 ZLAP requires the local item in action byte5 )
( before performing the reward-take action at $7EE3. )
( Stack: -- )
AT 8065
( Header: flags, saved name and link )
BYTES 830000B95180
DOCOL
t.ACTION-PARAM-5 t.CHOOSE-REQUIRED-ITEM
t.0BRANCH CELL 0004 ( -> 8077 )
t.ACTION-TAKE-REWARD
( label 8077 )
t.;S
AT 8079

( ACTION-SPELL-REMOVE-OBJECT | NFA 8079 CFA 807F )
( Inferred descriptive name, not recovered original: )
( Action40 ZAKLECIE requires action-byte2 spell, removes )
( action-byte1 object, redraws, awards bit8 and plays )
( effect1. )
( Stack: -- )
AT 8079
( Header: flags, saved name and link )
BYTES 830000B06580
DOCOL
t.ACTION-PARAM-2 t.CHOOSE-REQUIRED-SPELL
t.0BRANCH CELL 0013 ( -> 809A )
t.ACTION-PARAM-1 t.REMOVE-CURRENT-VIEW-OBJECT
t.REDRAW-CURRENT-VIEW LIT8 08 t.SET-ROOM-ACHIEVEMENT
t.CLEAR-TEXT-AREA t.1 t.PLAY-SOUND-EFFECT
( label 809A )
t.;S
AT 809C

( ACTION-COPY-HIDDEN-SPELL | NFA 809C CFA 80A2 )
( Inferred descriptive name, not recovered original: )
( Action42 PRZEPISZ changes the image, removes object )
( metadata byte0 and learns the object spell. )
( Stack: -- )
AT 809C
( Header: flags, saved name and link )
BYTES 830000B27980
DOCOL
t.ACTION-PARAM-1 t.0 t.DRAW-TWO-IMAGES t.OBJECT-DATA-0
t.REMOVE-CURRENT-VIEW-OBJECT t.LEARN-OBJECT-SPELL t.;S
AT 80B2

( ANTIMAGIC-WALL-MESSAGE | NFA 80B2 CFA 80B7 )
( Inferred descriptive name, not recovered original: )
( Counted message states that the player crossed a wall )
( with anti-magic; used by action43. )
( Stack: -- record )
( Decoded text: Message lines )
( line 1 $80BD: PRZESZEDLES SCIANE )
( line 2 $80D0: Z ANTYMAGIA )
AT 80B2
( Header: flags, saved name and link )
BYTES 8200CD9C80
DOVAR
BYTES 2000021250525A45535A45446C45733D734349414E650B5A3D414E54
BYTES 594D41474961
AT 80DB

( ACTION-CROSS-ANTIMAGIC-WALL | NFA 80DB CFA 80E1 )
( Inferred descriptive name, not recovered original: )
( Action43 IDZ preserves object metadata byte1, enters the )
( destination room from byte0, displays the anti-magic-wall )
( message and disables magic with the preserved state. )
( Stack: -- )
AT 80DB
( Header: flags, saved name and link )
BYTES 830000B3B280
DOCOL
t.OBJECT-DATA-1 t.ACTION-ENTER-ROOM LIT8 0F
t.PLAY-SOUND-EFFECT t.ANTIMAGIC-WALL-MESSAGE t.2+
t.SHOW-MESSAGE t.DISABLE-MAGIC t.;S
AT 80F6

( ACTION-READ-MESSAGE | NFA 80F6 CFA 80FC )
( Inferred descriptive name, not recovered original: )
( Action44 PRZECZYTAJ plays effect21 and displays the )
( message at action payload+1. )
( Stack: -- )
AT 80F6
( Header: flags, saved name and link )
BYTES 830000B4DB80
DOCOL
LIT8 15 t.PLAY-SOUND-EFFECT t.1 t.ACTION-PARAM-ADDR
t.SHOW-MESSAGE t.;S
AT 810B

( SHOW-WARLOCK-REFUSAL | NFA 810B CFA 8111 )
( Inferred descriptive name, not recovered original: Plays )
( failure sound and displays group6/resource46: NIC NIE )
( MOZESZ ZROBIC. CZARNOKSIEZNIK NIE POZWALA. Reused when )
( puzzle-state cell9 is false. )
( Stack: -- )
AT 810B
( Header: flags, saved name and link )
BYTES 830000C7F680
DOCOL
t.PLAY-FAILURE-SOUND LIT8 2E t.SHOW-RESOURCE-MESSAGE t.;S
AT 811C

( WARLOCK-REWARD-READY | NFA 811C CFA 8121 )
( Inferred descriptive name, not recovered original: )
( Fetches puzzle-state cell9, set by successful payment )
( $8316. False paths show the warlock-refusal text in )
( resource46; true $82DD shows resource47 thanking the )
( player for the hourglass and offering a jewel from the )
( chest. )
( Stack: -- flag )
AT 811C
( Header: flags, saved name and link )
BYTES 8200C30B81
DOCOL
LIT8 09 t.PUZZLE-STATE-CELLS t.@ t.;S
AT 812C

( ACTION-EXAMINE-IF-READY | NFA 812C CFA 8132 )
( Inferred descriptive name, not recovered original: )
( Actions46 ZBADAJ and49 OTWORZ display their action )
( message only if puzzle cell9 is true; otherwise show )
( resource46 failure. )
( Stack: -- )
AT 812C
( Header: flags, saved name and link )
BYTES 830000B61C81
DOCOL
t.WARLOCK-REWARD-READY
t.0BRANCH CELL 0011 ( -> 8149 )
LIT8 16 t.PLAY-SOUND-EFFECT t.1 t.ACTION-PARAM-ADDR
t.SHOW-MESSAGE
t.BRANCH CELL 0004 ( -> 814B )
( label 8149 )
t.SHOW-WARLOCK-REFUSAL
( label 814B )
t.;S
AT 814D

( ACTION-VIEW-IF-READY | NFA 814D CFA 8153 )
( Inferred descriptive name, not recovered original: )
( Action47 ZOBACZ enters the object view only if puzzle )
( cell9 is true; otherwise shows resource46 failure. )
( Stack: -- )
AT 814D
( Header: flags, saved name and link )
BYTES 830000B72C81
DOCOL
t.WARLOCK-REWARD-READY
t.0BRANCH CELL 0008 ( -> 8161 )
t.ACTION-ENTER-VIEW
t.BRANCH CELL 0004 ( -> 8163 )
( label 8161 )
t.SHOW-WARLOCK-REFUSAL
( label 8163 )
t.;S
AT 8165

( ANIMATION-FRAME-DELAY | NFA 8165 CFA 816A )
( Inferred descriptive name, not recovered original: Delay )
( cell assigned by $8174 and used between resource-frame )
( draws. )
( Stack: -- address )
AT 8165
( Header: flags, saved name and link )
BYTES 8200C14D81
DOVAR
CELL 0000
AT 816E

( PLAY-RESOURCE-SEQUENCE | NFA 816E CFA 8174 )
( Inferred descriptive name, not recovered original: For )
( each byte in the given sequence, selects that resource, )
( draws child0 and waits the supplied frame delay. )
( Stack: address count delay -- )
AT 816E
( Header: flags, saved name and link )
BYTES 830000C96581
DOCOL
t.ANIMATION-FRAME-DELAY t.! t.0 t.(DO)
( label 817E )
t.DUP t.I t.+ t.C@ t.FETCH-RESOURCE t.0
t.DRAW-RESOURCE-PICTURE t.ANIMATION-FRAME-DELAY t.@ t.PAUSE
t.(LOOP) CELL FFEA ( -> 817E )
t.DROP t.;S
AT 819A

( ENDING-OPENING-FRAMES | NFA 819A CFA 819F )
( Inferred descriptive name, not recovered original: Three )
( resource IDs41,42,43 played once by the successful final )
( destruction action. )
( Stack: -- address )
AT 819A
( Header: flags, saved name and link )
BYTES 8200D56E81
DOVAR
BYTES 292A2B
AT 81A4

( ENDING-LOOP-FRAMES | NFA 81A4 CFA 81A9 )
( Inferred descriptive name, not recovered original: Four )
( resource IDs34,36,35,37 played repeatedly after the final )
( scene and music transition. )
( Stack: -- address )
AT 81A4
( Header: flags, saved name and link )
BYTES 8200D29A81
DOVAR
BYTES 22242325
AT 81AF

( ACTION-FINAL-DESTRUCTION | NFA 81AF CFA 81B5 )
( Inferred descriptive name, not recovered original: )
( Action48 ZNISZCZ requires gate flag9 and the )
( item-mediated destruction action; if flag10 is set, )
( performs the ending image/player sequence, starts song1, )
( displays its message and loops the ending frames forever. )
( Stack: -- )
AT 81AF
( Header: flags, saved name and link )
BYTES 830000B8A481
DOCOL
t.WARLOCK-REWARD-READY
t.0BRANCH CELL 00AC ( -> 8267 )
t.ACTION-DESTROY-WITH-ITEM LIT8 0A t.PUZZLE-STATE-CELLS t.@
t.0BRANCH CELL 009B ( -> 8263 )
t.ENDING-OPENING-FRAMES t.3 LIT16 0004
t.PLAY-RESOURCE-SEQUENCE LIT8 19 t.FETCH-RESOURCE t.2
t.DRAW-RESOURCE-PICTURE LIT8 7C LIT8 26 LIT8 27
t.DRAW-THREE-IMAGES LIT8 0B t.PLAY-SOUND-EFFECT
t.FLASH-BACKGROUND LIT8 45 t.PAUSE LIT8 28 t.0
t.DRAW-TWO-IMAGES LIT8 7C LIT8 27 t.DRAW-TWO-IMAGES LIT8 7C
LIT8 1B t.DRAW-TWO-IMAGES t.PLAY-SUCCESS-SOUND LIT8 1E t.PAUSE
LIT8 7C t.0 t.DRAW-TWO-IMAGES LIT8 2C t.FETCH-RESOURCE t.0
t.DRAW-RESOURCE-PICTURE LIT8 2D t.FETCH-RESOURCE t.0
t.DRAW-RESOURCE-PICTURE t.1 t.1 LIT8 11 LIT8 0F t.2
t.MOVE-PLAYER-TO-POINT LIT8 32 t.PAUSE LIT8 1C
t.FETCH-RESOURCE t.2 t.DRAW-PICTURE-AND-MASK t.1 t.PLAY-MUSIC
t.CLEAR-TEXT-AREA t.3 t.ACTION-PARAM-ADDR t.SHOW-MESSAGE
( label 8253 )
t.ENDING-LOOP-FRAMES LIT16 0004 LIT16 0004
t.PLAY-RESOURCE-SEQUENCE
t.BRANCH CELL FFF2 ( -> 8253 )
( label 8263 )
t.BRANCH CELL 0004 ( -> 8269 )
( label 8267 )
t.SHOW-WARLOCK-REFUSAL
( label 8269 )
t.;S
AT 826B

( ANIMATION-STOP-FLAG | NFA 826B CFA 8270 )
( Inferred descriptive name, not recovered original: Set )
( when $8279 sees trigger0; $82A6 repeats its two-image )
( sequence until this flag becomes nonzero. )
( Stack: -- address )
AT 826B
( Header: flags, saved name and link )
BYTES 8200D3AF81
DOVAR
CELL 0000
AT 8274

( WAIT-ANIMATION-OR-FIRE | NFA 8274 CFA 8279 )
( Inferred descriptive name, not recovered original: Waits )
( up to nine single-frame delays, setting the animation )
( stop flag and clearing text if trigger0 is pressed. )
( Stack: -- )
AT 8274
( Header: flags, saved name and link )
BYTES 8200B16B82
DOCOL
LIT8 09 t.0 t.(DO)
( label 8282 )
t.1 t.PAUSE t.0 t.TRIGGER@ t.0=_12DE
t.0BRANCH CELL 000C ( -> 829A )
t.1 t.ANIMATION-STOP-FLAG t.! t.CLEAR-TEXT-AREA t.LEAVE
( label 829A )
t.(LOOP) CELL FFE6 ( -> 8282 )
t.;S
AT 82A0

( ANIMATE-LISTEN-SCENE | NFA 82A0 CFA 82A6 )
( Inferred descriptive name, not recovered original: )
( Alternates resource26 child0 and resource33 child2 with )
( nine-frame polling waits until joystick fire, playing )
( effect7. )
( Stack: -- )
AT 82A0
( Header: flags, saved name and link )
BYTES 830000D77482
DOCOL
t.0 t.ANIMATION-STOP-FLAG t.! t.WAIT-TRIGGER-RELEASE
( label 82B0 )
LIT8 07 t.PLAY-SOUND-EFFECT LIT8 1A t.FETCH-RESOURCE t.0
t.DRAW-RESOURCE-PICTURE t.WAIT-ANIMATION-OR-FIRE LIT8 21
t.FETCH-RESOURCE t.2 t.DRAW-RESOURCE-PICTURE
t.WAIT-ANIMATION-OR-FIRE t.ANIMATION-STOP-FLAG t.@
t.0BRANCH CELL FFDF ( -> 82B0 )
t.WAIT-TRIGGER-RELEASE t.;S
AT 82D7

( ACTION-LISTEN | NFA 82D7 CFA 82DD )
( Inferred descriptive name, not recovered original: )
( Action50 SLUCHAJ chooses message/picture setup based on )
( gate flag9, runs the fire-dismissed two-image animation, )
( then restores the scene. )
( Stack: -- )
AT 82D7
( Header: flags, saved name and link )
BYTES 830000B0A082
DOCOL
t.WARLOCK-REWARD-READY
t.0BRANCH CELL 001C ( -> 82FF )
LIT8 2F t.SHOW-RESOURCE-MESSAGE LIT8 7E t.0 t.DRAW-TWO-IMAGES
t.ANIMATE-LISTEN-SCENE LIT8 7C LIT8 19 t.DRAW-TWO-IMAGES
t.BRANCH CELL 0011 ( -> 830E )
( label 82FF )
t.1 t.ACTION-PARAM-ADDR t.SHOW-MESSAGE t.ANIMATE-LISTEN-SCENE
LIT8 19 t.0 t.DRAW-TWO-IMAGES
( label 830E )
t.;S
AT 8310

( ACTION-PAY-WARLOCK | NFA 8310 CFA 8316 )
( Inferred descriptive name, not recovered original: )
( Action51 ZAPLAC accepts object-byte0 item, sets puzzle )
( flag9, awards bit16, runs $82DD and consumes the item. )
( The resulting group6/resource47 message identifies the )
( payment as an hourglass and offers a jewel reward. An )
( alternate byte1 item displays a different message. )
( Stack: -- )
AT 8310
( Header: flags, saved name and link )
BYTES 830000B1D782
DOCOL
t.OBJECT-DATA-0 t.CHOOSE-REQUIRED-ITEM
t.0BRANCH CELL 0025 ( -> 8343 )
t.1 LIT16 0009 t.PUZZLE-STATE-CELLS t.! LIT8 05
t.PLAY-SOUND-EFFECT LIT8 10 t.SET-ROOM-ACHIEVEMENT
t.ACTION-LISTEN t.OBJECT-DATA-0 LIT8 C8 t.+
t.REMOVE-INVENTORY-ITEM
t.BRANCH CELL 001B ( -> 835C )
( label 8343 )
t.OBJECT-DATA-1 LIT8 C8 t.+ t.LAST-CHOSEN-ITEM t.@ t.=
t.0BRANCH CELL 000A ( -> 835C )
t.CLEAR-TEXT-AREA t.1 t.ACTION-PARAM-ADDR t.SHOW-MESSAGE
( label 835C )
t.;S
AT 835E

( TIME-TRAVEL-ITEMS-MESSAGE | NFA 835E CFA 8363 )
( Inferred descriptive name, not recovered original: )
( Counted message says inanimate matter cannot overcome )
( time; displayed when carried items prevent the part-two )
( transition. )
( Stack: -- record )
( Decoded text: Message lines )
( line 1 $8369: MATERIA NIEOZYWIONA )
( line 2 $837D: CZASU NIE POKONA )
AT 835E
( Header: flags, saved name and link )
BYTES 8200CE1083
DOVAR
BYTES 260002134D4154455249413D4E49454F7A5957494F4E4110435A4153
BYTES 553D4E49453D504F4B4F4E415A
AT 838E

( TIME-TRAVEL-INVENTORY-OK | NFA 838E CFA 8393 )
( Inferred descriptive name, not recovered original: Scans )
( the five inventory slots after the first list byte; )
( returns true only when every inspected slot is zero or )
( item216. )
( Stack: -- flag )
AT 838E
( Header: flags, saved name and link )
BYTES 8200D05E83
DOCOL
t.0 t.1 t.ROOM-VIEW-OBJECTS t.3 t.+ t.0 LIT8 05 t.0 t.(DO)
( label 83A8 )
t.OVER t.I t.+ t.C@ t.DUP t.0=_12DE t.SWAP LIT8 D8 t.= t.+
t.0=_12DE t.+
t.(LOOP) CELL FFE5 ( -> 83A8 )
t.0=_12DE t.SWAP t.DROP t.;S
AT 83CD

( ACTION-TRAVEL-THROUGH-TIME | NFA 83CD CFA 83D3 )
( Inferred descriptive name, not recovered original: )
( Action52 ZAKLECIE requires spell9 and the restricted )
( inventory check. On success flashes, awards bit16, starts )
( part2 and displays resource48; otherwise explains the )
( inanimate-item restriction. Group6/resource48 explicitly )
( identifies the destination as the reign of the Lord of )
( Darkness. )
( Stack: -- )
AT 83CD
( Header: flags, saved name and link )
BYTES 830000B28E83
DOCOL
LIT8 09 t.CHOOSE-REQUIRED-SPELL
t.0BRANCH CELL 0030 ( -> 840C )
t.TIME-TRAVEL-INVENTORY-OK
t.0BRANCH CELL 0020 ( -> 8402 )
LIT8 05 t.PLAY-SOUND-EFFECT t.FLASH-BACKGROUND LIT8 32 t.PAUSE
LIT8 10 t.SET-ROOM-ACHIEVEMENT t.CLOSE-SCENE-TRANSITION
t.START-PART-TWO LIT8 30 t.SHOW-RESOURCE-MESSAGE
t.BRANCH CELL 000C ( -> 840C )
( label 8402 )
t.PLAY-FAILURE-SOUND t.CLEAR-TEXT-AREA
t.TIME-TRAVEL-ITEMS-MESSAGE t.2+ t.SHOW-MESSAGE
( label 840C )
t.;S
AT 840E

( ACTION-SPELL-ADD-OBJECT | NFA 840E CFA 8414 )
( Inferred descriptive name, not recovered original: )
( Action53 ZAKLECIE requires the spell in object byte0, )
( then adds action byte1, redraws, awards bit16 and plays )
( success. )
( Stack: -- )
AT 840E
( Header: flags, saved name and link )
BYTES 830000B3CD83
DOCOL
t.OBJECT-DATA-0 t.CHOOSE-REQUIRED-SPELL
t.0BRANCH CELL 000F ( -> 842B )
t.ACTION-PARAM-1 t.ADD-CURRENT-VIEW-OBJECT
t.REDRAW-CURRENT-VIEW LIT8 10 t.SET-ROOM-ACHIEVEMENT
t.PLAY-SUCCESS-SOUND
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

( PRINT-CENTERED-TITLE-LINE | NFA 8484 CFA 848B )
( Inferred descriptive name, not recovered original: )
( Centers a selected word-counted text record in a40-column )
( line and prints it at row index+1. )
( Stack: records index -- records )
AT 8484
( Header: flags, saved name and link )
BYTES 84000000CE4F84
DOCOL
t.>R LIT16 0014 t.OVER t.R t.SWAP t.LENGTH-RECORD-ADDR t.@ t.2
t./ t.- t.R t.1+ t.POS t.R> t.OVER t.LENGTH-RECORD-ADDR
t.WORD-COUNT t.STYPE t.;S
AT 84B5

( ANIMATE-TITLE-IMAGE | NFA 84B5 CFA 84BC )
( Inferred descriptive name, not recovered original: )
( Selects resource6 and draws its twelve child pictures in )
( order, waiting four frames between frames. )
( Stack: -- )
AT 84B5
( Header: flags, saved name and link )
BYTES 84000000AB8484
DOCOL
LIT16 0006 t.FETCH-RESOURCE LIT16 000C t.0 t.(DO)
( label 84CC )
t.I t.DRAW-RESOURCE-PICTURE LIT16 0004 t.PAUSE
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
t.0 t.LOAD-ITEM-ART-ENABLED t.! t.1 t.BANKED-TRANSFER t.!
t.DISABLE-DISPLAY-DMA t.1 w3FCA t.! t.0 LIT8 A0 t.3
t.LOAD-GAM-GROUP t.GROUP-TRANSFER-ERROR t.@
t.0BRANCH CELL 0012 ( -> 8571 )
t.RESTORE-DISPLAY-DMA t.CR
( ATASCII text: ERROR )
t.(.")
BYTES 054552524F52
( label 856D )
t.BRANCH CELL FFFE ( -> 856D )
( label 8571 )
t.OPEN-GAME-SCREEN t.INSTALL-GAME-COLORS LIT8 06 t.2 t.(DO)
( label 857C )
t.I t.FETCH-RESOURCE t.0 t.DRAW-RESOURCE-PICTURE
t.(LOOP) CELL FFF6 ( -> 857C )
LIT8 06 t.FETCH-RESOURCE LIT16 0000 t.DRAW-RESOURCE-PICTURE
t.0 t.1 t.POS
( ATASCII text:   )
t.(.")
BYTES 0120
LIT16 0008 LIT16 BC00 t.FETCH-RESOURCE-TO LIT16 00BC
LIT16 02F4 t.C! t.TITLE-MUSIC-OR-SPRITES t.CMC-MODULE-ADDRESS
t.! LIT16 000D t.CMC-MODULE-ADDRESS t.@ LIT8 06 t.-
t.FETCH-RESOURCE-TO LIT8 58 t.@ LIT8 28 t.- LIT8 28 t.1 t.FILL
t.RESTORE-DISPLAY-DMA t.INIT-CMC-MODULE t.0 t.PLAY-MUSIC
t.RUN-VBI1 t.;S
AT 85E3

( TITLE-SCROLL-ROWS | NFA 85E3 CFA 85E9 )
( Inferred descriptive name, not recovered original: Packed )
( start/end row bytes initialized1,9, read and updated by )
( the vertical title-row scrolling code. )
( Stack: -- address )
AT 85E3
( Header: flags, saved name and link )
BYTES 830000CC3385
DOVAR
CELL 0901
AT 85ED

( ENABLE-ROW-VSCROLL | NFA 85ED CFA 85F3 )
( Inferred descriptive name, not recovered original: Sets )
( bit$20 in the ANTIC display-list instruction at the )
( supplied address. )
( Stack: display-list-address -- )
AT 85ED
( Header: flags, saved name and link )
BYTES 830000A1E385
DOCOL
t.DUP t.C@ LIT16 0020 t.OR t.SWAP t.C! t.;S
AT 8605

( DISABLE-ROW-VSCROLL | NFA 8605 CFA 860C )
( Inferred descriptive name, not recovered original: Clears )
( bit$20 in the ANTIC display-list instruction at the )
( supplied address. )
( Stack: display-list-address -- )
AT 8605
( Header: flags, saved name and link )
BYTES 84000000A1ED85
DOCOL
t.DUP t.C@ LIT16 00DF t.AND t.SWAP t.C! t.;S
AT 861E

( TITLE-DISPLAY-LIST | NFA 861E CFA 8624 )
( Inferred descriptive name, not recovered original: )
( Constant $A7E8 used as the title display-list base when )
( enabling/disabling vertical scroll on specific rows. )
( Stack: -- address )
AT 861E
( Header: flags, saved name and link )
BYTES 830000C40586
DOCON
CELL A7E8
AT 8628

( ANTIC-VSCROL | NFA 8628 CFA 862D )
( Inferred descriptive name, not recovered original: )
( Constant $D405, ANTIC vertical fine-scroll register, )
( written by title scroll routines. )
( Stack: -- address )
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
t.SCREEN-ROW-ADDR t.PICTURE-STAGING@ t.SWAP LIT16 0028 t.CMOVE
t.;S
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
t.PICTURE-STAGING@ LIT16 0028 t.ERASE LIT16 0058 t.@ t.>R
t.PICTURE-STAGING@ LIT16 0058 t.! t.0 t.SWAP
t.PRINT-CENTERED-TEXT t.R> LIT16 0058 t.! t.;S
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
t.I t.ANTIC-VSCROL t.C! t.1 t.PAUSE t.2
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
t.TITLE-SCROLL-ROWS t.BYTE-PAIR@ t.>R t.1+ t.DUP t.R> t.1+
t.(DO)
( label 8701 )
t.POLL-TITLE-SKIP t.0 t.ANTIC-VSCROL t.C! t.I t.COPY-TEXT-ROW
t.I t.TITLE-DISPLAY-LIST t.+ t.1 t.- t.ENABLE-ROW-VSCROLL
t.SCROLL-EIGHT-PIXELS t.DUP t.1+ t.I t.=
t.0BRANCH CELL 000E ( -> 8733 )
t.I t.1 t.- t.COPY-TEXT-ROW
t.BRANCH CELL 0006 ( -> 8737 )
( label 8733 )
t.I t.CLEAR-TEXT-ROW
( label 8737 )
t.-1
t.(+LOOP) CELL FFC6 ( -> 8701 )
t.TITLE-SCROLL-ROWS t.C@ t.1+ t.TITLE-SCROLL-ROWS t.C!
LIT16 0007 t.ANTIC-VSCROL t.C! t.DUP t.TITLE-DISPLAY-LIST t.+
t.DISABLE-ROW-VSCROLL t.1+ t.CLEAR-TEXT-ROW t.;S
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
t.I t.OVER t.LENGTH-RECORD-ADDR t.RENDER-CENTERED-ROW
t.SCROLL-TITLE-ROW
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
t.DUP t.2+ t.C@ t.1 t.TITLE-SCROLL-ROWS t.C!
t.SCROLL-TITLE-TEXT LIT8 96 t.WAIT-TITLE t.;S
AT 879A

( SHOW-TITLE-SEQUENCE | NFA 879A CFA 87A0 )
( Inferred descriptive name, not recovered original: Loops )
( over eight intro text pages until trigger zero is )
( pressed, then changes music and presents the final page. )
AT 879A
( Header: flags, saved name and link )
BYTES 830000D87D87
DOCOL
LIT16 0009 t.FETCH-RESOURCE
( label 87A8 )
LIT8 08 t.0 t.(DO)
( label 87AF )
t.I t.RESOURCE-ADDR t.2+ t.SHOW-TITLE-PAGE t.TITLE-SKIP-FLAG
t.@
t.0BRANCH CELL 0004 ( -> 87C1 )
t.LEAVE
( label 87C1 )
t.(LOOP) CELL FFEC ( -> 87AF )
t.TITLE-SKIP-FLAG t.@
t.0BRANCH CELL FFDD ( -> 87A8 )
t.1 t.PLAY-MUSIC t.0 t.RESOURCE-ADDR t.2+ t.SHOW-TITLE-PAGE
t.2 t.PLAY-MUSIC t.;S
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
t.RESTORE-DICTIONARY t.SHOW-TITLE-SEQUENCE LIT16 0006
t.FETCH-RESOURCE t.ANIMATE-TITLE-IMAGE t.3 t.PLAY-MUSIC
LIT8 14 t.PAUSE LIT16 A3E0 t.RESOURCE-BASE t.! t.STOP-MUSIC
t.3 t.PAUSE t.STOP-VBI1 t.GAME-LOOP t.;S
AT 882C
( Final saved boot-sector padding: retired N>N / SAVE-RUN )
BYTES 834E3ECEDF87411466173417E413771288534156452D5255CE2C8841
BYTES 14A5242D0FE987D5146216A5132D0FCE1E08145117A51309167313E4
BYTES 13670F1F0312CD146216A513C10F0800371AA20F040080273288A513
AT 8880
T-FINISH
