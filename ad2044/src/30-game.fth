( AD 2044 30-game.fth: target 7B4F..9246 )
( Hexadecimal. BYTES emits hex bytes; CELL emits a 16-bit )
( cell. )
( LIT8/LIT16 compile literals; branch cells are signed )
( offsets. )
( 6502 mnemonics use 06-assembler.fth; operands follow )
( words. )

( ACTION-BYTE-ADDR | NFA 7B4F CFA 7B54 )
( Inferred descriptive name, not recovered original: Adds )
( the supplied byte offset and 2 to SELECTED-ACTION-RECORD )
( [$7594]; the first two bytes are the record length. Used )
( by inline action text and parameter accessors. )
( Stack: offset -- addr )
AT 7B4F
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D9EA7A
DOCOL
t.SELECTED-ACTION-RECORD t.@ t.+ t.2+ t.;S
AT 7B60

( ACTION-BYTE@ | NFA 7B60 CFA 7B66 )
( Inferred descriptive name, not recovered original: Calls )
( $7B54 then C@; offsets 1 through 6 are wrapped by the six )
( argument words below. )
( Stack: offset -- byte )
AT 7B60
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C04F7B
DOCOL
t.ACTION-BYTE-ADDR t.C@ t.;S
AT 7B6E

( DISK-GATE-LATCH | NFA 7B6E CFA 7B73 )
( Inferred descriptive name, not recovered original: )
( Compared with the constant $0021 in $7CF6, and set to )
( $0021 after the two-sector check succeeds. Its saved )
( initial cell $7CC7 is not a room number. )
( Stack: -- addr )
AT 7B6E
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D3607B
DOVAR
CELL 7CC7
AT 7B77

( DISK-GATE-TAG | NFA 7B77 CFA 7B7C )
( Inferred descriptive name, not recovered original: )
( Constant $0021, compared with the latch $7B73 and )
( appended to the result by $7CF6; $7F76 checks the )
( returned tag. )
( Stack: -- tag )
AT 7B77
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CC6E7B
DOCON
CELL 0021
AT 7B80

( FIND-INVENTORY-SLOT | NFA 7B80 CFA 7B87 )
( Inferred descriptive name, not recovered original: Scans )
( four three-byte inventory records via $773C, comparing )
( each first byte with the supplied item ID. Returns the )
( matching slot address or zero; callers search ID zero for )
( an empty slot. )
( Stack: item -- slot-or-zero )
AT 7B80
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C5777B
DOCOL
t.0 t.SWAP t.4 t.0 t.(DO)
( label 7B93 )
t.DUP t.I t.INVENTORY-SLOT-ADDR t.C@ t.=
t.0BRANCH CELL 000E ( -> 7BAD )
t.SWAP t.DROP t.I t.INVENTORY-SLOT-ADDR t.SWAP t.LEAVE
( label 7BAD )
t.(LOOP) CELL FFE4 ( -> 7B93 )
t.DROP t.;S
AT 7BB5

( MSG-CANNOT-CARRY | NFA 7BB5 CFA 7BBB )
( Inferred descriptive name, not recovered original: The )
( bounded message at $7BBD contains NIE UNIESIESZ. $7FCD )
( displays it when no empty inventory slot exists. )
( Stack: -- addr )
( Decoded text: Message lines )
( line 1 $7BC1: NIE UNIESIESZ )
AT 7BB5
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CD807B
DOVAR
BYTES 0F00010D4E49453D554E4945534945535A20
AT 7BCF

( OPEN-ROOM-EXIT | NFA 7BCF CFA 7BD6 )
( Inferred descriptive name, not recovered original: For )
( direction <4, ORs 1<<direction into the byte returned by )
( ROOM-EXIT-MASKS [$4678] for the supplied room. )
( Stack: direction room -- )
AT 7BCF
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A1B57B
DOCOL
t.OVER t.4 t.<
t.0BRANCH CELL 0018 ( -> 7BF8 )
t.ROOM-EXIT-MASKS t.DUP t.>R t.C@ t.SWAP t.C2^ t.OR t.R> t.C!
t.BRANCH CELL 0004 ( -> 7BFA )
( label 7BF8 )
t.2DROP
( label 7BFA )
t.;S
AT 7BFC

( CLOSE-ROOM-EXIT | NFA 7BFC CFA 7C04 )
( Inferred descriptive name, not recovered original: For )
( direction <4, ANDs the room exit mask with the complement )
( of 1<<direction. This is the inverse of $7BD6. )
( Stack: direction room -- )
AT 7BFC
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A1CF7B
DOCOL
t.OVER t.4 t.<
t.0BRANCH CELL 001D ( -> 7C2B )
t.ROOM-EXIT-MASKS t.DUP t.>R t.C@ t.SWAP t.C2^ LIT8 FF t.XOR
t.AND t.R> t.C!
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

( CHECK-DISK-GATE-SECTORS | NFA 7C6A CFA 7C70 )
( Inferred descriptive name, not recovered original: Reads )
( into resource zero using sector offsets $0196/$0197 plus )
( base $01F5, i.e. sectors 907 and 908 on drive 1. )
( GAME-LOOP patches $76A7 to -DISK 0= ;S. The first )
( normalized result is inverted and added to the second; )
( the expected gate result is 2. )
( Stack: -- result )
AT 7C6A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C32F7C
DOCOL
t.0 t.RESOURCE-ADDR t.DISK-CHECK-SECTOR-OFFSETS t.@
t.DISK-CHECK-SECTOR-BASE t.+ t.1 t.1 t.DISK-CHECK-IO t.0=_12DE
t.0 t.RESOURCE-ADDR t.DISK-CHECK-SECTOR-OFFSETS t.2+ t.@
t.DISK-CHECK-SECTOR-BASE t.+ t.1 t.1 t.DISK-CHECK-IO t.+ t.;S
AT 7C9E

( ACTION-ARG1@ | NFA 7C9E CFA 7CA3 )
( Inferred descriptive name, not recovered original: Passes )
( byte offset 1 to ACTION-BYTE@ [$7B66]; these bytes follow )
( the action opcode in the selected u16-length record. )
( Stack: -- byte )
AT 7C9E
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D76A7C
DOCOL
t.1 t.ACTION-BYTE@ t.;S
AT 7CAB

( ACTION-ARG2@ | NFA 7CAB CFA 7CB0 )
( Inferred descriptive name, not recovered original: Passes )
( byte offset 2 to ACTION-BYTE@ [$7B66]; these bytes follow )
( the action opcode in the selected u16-length record. )
( Stack: -- byte )
AT 7CAB
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D79E7C
DOCOL
t.2 t.ACTION-BYTE@ t.;S
AT 7CB8

( ACTION-ARG3@ | NFA 7CB8 CFA 7CBD )
( Inferred descriptive name, not recovered original: Passes )
( byte offset 3 to ACTION-BYTE@ [$7B66]; these bytes follow )
( the action opcode in the selected u16-length record. )
( Stack: -- byte )
AT 7CB8
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D7AB7C
DOCOL
t.3 t.ACTION-BYTE@ t.;S
AT 7CC5

( ACTION-ARG4@ | NFA 7CC5 CFA 7CCA )
( Inferred descriptive name, not recovered original: Passes )
( byte offset 4 to ACTION-BYTE@ [$7B66]; these bytes follow )
( the action opcode in the selected u16-length record. )
( Stack: -- byte )
AT 7CC5
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D7B87C
DOCOL
t.4 t.ACTION-BYTE@ t.;S
AT 7CD2

( ACTION-ARG5@ | NFA 7CD2 CFA 7CD7 )
( Inferred descriptive name, not recovered original: Passes )
( byte offset 5 to ACTION-BYTE@ [$7B66]; these bytes follow )
( the action opcode in the selected u16-length record. )
( Stack: -- byte )
AT 7CD2
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D7C57C
DOCOL
LIT16 0005 t.ACTION-BYTE@ t.;S
AT 7CE1

( ACTION-ARG6@ | NFA 7CE1 CFA 7CE6 )
( Inferred descriptive name, not recovered original: Passes )
( byte offset 6 to ACTION-BYTE@ [$7B66]; these bytes follow )
( the action opcode in the selected u16-length record. )
( Stack: -- byte )
AT 7CE1
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D7D27C
DOCOL
LIT16 0006 t.ACTION-BYTE@ t.;S
AT 7CF0

( CHECK-DISK-GATED-ROOM | NFA 7CF0 CFA 7CF6 )
( Inferred descriptive name, not recovered original: Only )
( for destination room $0E while REQUIRED-DISK-SIDE [$4A6F] )
( is 2: checks the $0021 latch and expects $7C70 to return )
( 2. Success latches $0021; failure replaces the )
( destination with $24 and clears $715A. Appends the tag )
( $0021. )
( Stack: room -- checked-room tag )
AT 7CF0
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A9E17C
DOCOL
t.DUP LIT8 0E t.=
t.0BRANCH CELL 003F ( -> 7D40 )
t.REQUIRED-DISK-SIDE t.@ t.2 t.=
t.0BRANCH CELL 0033 ( -> 7D40 )
t.DISK-GATE-LATCH t.@ t.DISK-GATE-TAG t.=
t.0BRANCH CELL 0006 ( -> 7D1F )
t.BRANCH CELL 0023 ( -> 7D40 )
( label 7D1F )
t.CHECK-DISK-GATE-SECTORS t.2 t.=
t.0BRANCH CELL 000D ( -> 7D34 )
LIT8 21 t.DISK-GATE-LATCH t.!
t.BRANCH CELL 000E ( -> 7D40 )
( label 7D34 )
t.DROP LIT16 0024 t.0 t.ALLOW-GAME-MENU-KEY t.!
( label 7D40 )
t.DISK-GATE-TAG t.;S
AT 7D44

( PRESERVE-MESSAGE-TEXT | NFA 7D44 CFA 7D4A )
( Inferred descriptive name, not recovered original: Stores )
( zero in TEXT-CLEAR-ENABLED [$47A4]; used after action )
( error or explanatory messages so subsequent redraw does )
( not immediately erase them. )
( Stack: -- )
AT 7D44
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A1F07C
DOCOL
t.0 t.TEXT-CLEAR-ENABLED t.! t.;S
AT 7D54

( ACT-CANCEL | NFA 7D54 CFA 7D59 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $00 NIC to this CFA. Restores )
( the pointer through $5390, refreshes through $59C3 and )
( returns 1. )
AT 7D54
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B0447D
DOCOL
t.USE-SCENE-RESOURCES t.REDRAW-CURRENT-VIEW t.1 t.;S
AT 7D63

( ACT-BACK | NFA 7D63 CFA 7D68 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $01 WROC to this CFA. Restores )
( the pointer, sends sound command 1 and calls LEAVE-VIEW )
( [$59A3] to pop the view stack, draw the previous view and )
( restore its cursor, then returns 1. )
AT 7D63
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B1547D
DOCOL
t.USE-SCENE-RESOURCES t.1 t.SOUND-COMMAND! t.LEAVE-VIEW t.1
t.;S
AT 7D76

( ACT-SHOW-CLOSEUP | NFA 7D76 CFA 7D7B )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $02 ZBLIZENIE, $12 OTWORZ, $13 )
( ODEGNIJ to this CFA. Sends sound command 2 and passes )
( argument 1 to ENTER-VIEW [$598D], which pushes and draws )
( that view and centers its cursor, then returns 1. Shared )
( by closeup and two open/bend actions. )
AT 7D76
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B2637D
DOCOL
t.2 t.SOUND-COMMAND! t.ACTION-ARG1@ t.ENTER-VIEW t.1 t.;S
AT 7D89

( ACT-LIFT-ENERGY-GATED | NFA 7D89 CFA 7D8E )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $04 PODNIES to this CFA. Only )
( shows the argument-1 view when argument 2 is strictly )
( less than ENERGY [$4377]. Otherwise sends failure sound )
( $13, shows text starting at argument byte 3, and returns )
( 0. )
AT 7D89
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B4767D
DOCOL
t.ACTION-ARG2@ t.ENERGY t.@ t.<
t.0BRANCH CELL 0012 ( -> 7DAC )
LIT16 001C t.SOUND-COMMAND! t.ACTION-ARG1@ t.ENTER-VIEW t.1
t.BRANCH CELL 0010 ( -> 7DBA )
( label 7DAC )
LIT16 0013 t.SOUND-COMMAND! t.3 t.ACTION-BYTE-ADDR
t.SHOW-MESSAGE t.0
( label 7DBA )
t.;S
AT 7DBC

( ACT-GOTO-ROOM | NFA 7DBC CFA 7DC1 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $06 IDZ to this CFA. Passes )
( argument 1 to ENTER-ROOM [$6E1F], then returns 1. )
AT 7DBC
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B6897D
DOCOL
t.ACTION-ARG1@ t.ENTER-ROOM t.1 t.;S
AT 7DCB

( ACT-EXAMINE | NFA 7DCB CFA 7DD0 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $07 ZBADAJ to this CFA. Sends )
( sound command 7, displays the counted-line message )
( beginning at argument byte 1 through $6D82, and returns 0. )
AT 7DCB
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B7BC7D
DOCOL
LIT8 07 t.SOUND-COMMAND! t.1 t.ACTION-BYTE-ADDR t.SHOW-MESSAGE
t.0 t.;S
AT 7DE1

( MAX-ENERGY | NFA 7DE1 CFA 7DE7 )
( Inferred descriptive name, not recovered original: )
( Constant $00A0 [160], used by $7E0F to cap ENERGY after )
( eating or drinking. )
( Stack: -- maximum )
AT 7DE1
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C5CB7D
DOCON
CELL 00A0
AT 7DEB

( MSG-GLUTTONY | NFA 7DEB CFA 7DF0 )
( Inferred descriptive name, not recovered original: )
( Bounded message OBZARSTWO TO GRZECH, displayed by $7E0F )
( when consumption reaches or exceeds MAX-ENERGY. )
( Stack: -- addr )
( Decoded text: Message lines )
( line 1 $7DF6: OBZARSTWO TO GRZECH )
AT 7DEB
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C5E17D
DOVAR
BYTES 150001134F427A41525354574F3D544F3D47525A45434820
AT 7E0A

( SHOW-CONSUMPTION-RESULT | NFA 7E0A CFA 7E0F )
( Inferred descriptive name, not recovered original: Clears )
( the text area. If ENERGY is below $A0, displays the )
( supplied message; otherwise discards it, displays )
( MSG-GLUTTONY and clamps ENERGY to $A0. )
( Stack: message -- )
AT 7E0A
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CDEB7D
DOCOL
t.CLEAR-TEXT-AREA t.ENERGY t.@ t.MAX-ENERGY t.<
t.0BRANCH CELL 0008 ( -> 7E25 )
t.SHOW-MESSAGE
t.BRANCH CELL 0010 ( -> 7E33 )
( label 7E25 )
t.DROP t.MSG-GLUTTONY t.2+ t.SHOW-MESSAGE t.MAX-ENERGY
t.ENERGY t.!
( label 7E33 )
t.;S
AT 7E35

( ACT-EAT | NFA 7E35 CFA 7E3A )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $08 ZJEDZ to this CFA. Removes )
( current-scene object argument 1, adds argument 2 to )
( ENERGY, sends sound 8, and displays the message beginning )
( at byte 3 through $7E0F. )
AT 7E35
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B80A7E
DOCOL
t.ACTION-ARG1@ t.REMOVE-CURRENT-OBJECT t.ACTION-ARG2@ t.ENERGY
t.+! t.3 t.ACTION-BYTE-ADDR t.USE-SCENE-RESOURCES t.8
t.SOUND-COMMAND! t.REDRAW-CURRENT-VIEW
t.SHOW-CONSUMPTION-RESULT t.PRESERVE-MESSAGE-TEXT t.1 t.;S
AT 7E5A

( VALIDATE-EXIT-DESTINATION | NFA 7E5A CFA 7E60 )
( Inferred descriptive name, not recovered original: A )
( one-call wrapper around CHECK-DISK-GATED-ROOM [$7CF6], )
( used by the relative-exit handler $7F76. )
( Stack: room -- checked-room tag )
AT 7E5A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C2357E
DOCOL
t.CHECK-DISK-GATED-ROOM t.;S
AT 7E66

( ACT-DRINK | NFA 7E66 CFA 7E6B )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $09 WYPIJ to this CFA. Removes )
( current-scene object argument 1, adds argument 2 to )
( ENERGY, sends sound 8, and displays the message beginning )
( at byte 4 through $7E0F. )
AT 7E66
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B95A7E
DOCOL
t.ACTION-ARG1@ t.REMOVE-CURRENT-OBJECT t.ACTION-ARG2@ t.ENERGY
t.+! t.4 t.ACTION-BYTE-ADDR t.USE-SCENE-RESOURCES t.8
t.SOUND-COMMAND! t.REDRAW-CURRENT-VIEW
t.SHOW-CONSUMPTION-RESULT t.PRESERVE-MESSAGE-TEXT t.1 t.;S
AT 7E8B

( ACT-BREAK-REVEAL | NFA 7E8B CFA 7E91 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $0A ROZBIJ to this CFA. Sends )
( sound $0A, adds current-scene object argument 1 using )
( $7134 and redraws; returns 1. )
AT 7E8B
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B0667E
DOCOL
LIT8 0A t.SOUND-COMMAND! t.ACTION-ARG1@ t.ADD-CURRENT-OBJECT
t.REDRAW-CURRENT-VIEW t.1 t.;S
AT 7EA2

( MSG-WITH-WHAT | NFA 7EA2 CFA 7EA8 )
( Inferred descriptive name, not recovered original: The )
( bounded message is CZYM?; used for inventory-item )
( selection in open, cut and apply-item handlers. )
( Stack: -- addr )
( Decoded text: Message lines )
( line 1 $7EAE: CZYM? )
AT 7EA2
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D48B7E
DOVAR
BYTES 07000105435A594D3F20
AT 7EB4

( ASK-INVENTORY-ITEM | NFA 7EB4 CFA 7EBD )
( Inferred descriptive name, not recovered original: )
( Displays the supplied u16-length message after 2+, )
( selects cursor context 2, waits for trigger release and )
( input, then converts the returned 2-D slot selection with )
( 2*+ and INVENTORY-SLOT-ADDR [$773C]. )
( Stack: message -- slot )
AT 7EB4
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000DAA27E
DOCOL
LIT8 15 t.SOUND-COMMAND! t.2+ t.SHOW-MESSAGE t.2
t.CURSOR-CONTEXT t.! t.4 t.PAUSE t.WAIT-TRIGGER-RELEASE
t.WAIT-GAME-INPUT t.0 t.CURSOR-CONTEXT t.! t.2 t.* t.+
t.INVENTORY-SLOT-ADDR t.;S
AT 7EE6

( OPEN-OBJECT-MODE | NFA 7EE6 CFA 7EEB )
( Inferred descriptive name, not recovered original: )
( Boolean mode used by $7EF5 to choose ADD-CURRENT-OBJECT )
( or REMOVE-CURRENT-OBJECT. $7F45 writes 1 and $8928 writes )
( 0. )
( Stack: -- addr )
AT 7EE6
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D4B47E
DOVAR
CELL 0000
AT 7EEF

( OPEN-WITH-SELECTED-ITEM | NFA 7EEF CFA 7EF5 )
( Inferred descriptive name, not recovered original: Asks )
( CZYM? and compares the selected inventory ID with )
( argument 2. Success adds/removes object argument 1 )
( according to $7EEB and opens exit argument 3 in the )
( current room; failure shows the message at byte 4. )
AT 7EEF
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B1E67E
DOCOL
t.MSG-WITH-WHAT t.ASK-INVENTORY-ITEM t.C@ t.ACTION-ARG2@ t.=
t.0BRANCH CELL 0027 ( -> 7F2A )
t.ACTION-ARG1@ t.OPEN-OBJECT-MODE t.@
t.0BRANCH CELL 0008 ( -> 7F15 )
t.ADD-CURRENT-OBJECT
t.BRANCH CELL 0004 ( -> 7F17 )
( label 7F15 )
t.REMOVE-CURRENT-OBJECT
( label 7F17 )
LIT8 0B t.SOUND-COMMAND! t.REDRAW-CURRENT-VIEW t.ACTION-ARG3@
t.CURRENT-ROOM t.@ t.OPEN-ROOM-EXIT
t.BRANCH CELL 0013 ( -> 7F3B )
( label 7F2A )
t.REDRAW-CURRENT-VIEW t.CLEAR-TEXT-AREA LIT8 13
t.SOUND-COMMAND! t.4 t.ACTION-BYTE-ADDR t.SHOW-MESSAGE
t.PRESERVE-MESSAGE-TEXT
( label 7F3B )
t.1 t.;S
AT 7F3F

( ACT-OPEN-WITH-ITEM | NFA 7F3F CFA 7F45 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $0B OTWORZ to this CFA. Sets )
( OPEN-OBJECT-MODE to 1 then calls $7EF5: matching )
( inventory item reveals the argument-1 object and opens an )
( exit. )
AT 7F3F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B1EF7E
DOCOL
t.1 t.OPEN-OBJECT-MODE t.! t.OPEN-WITH-SELECTED-ITEM t.;S
AT 7F51

( ACT-CLOSE-EXIT | NFA 7F51 CFA 7F57 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $0C ZAMKNIJ to this CFA. )
( Removes current-scene object argument 1, plays sound $0C )
( and clears current-room exit bit argument 2; returns 1. )
AT 7F51
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B23F7F
DOCOL
t.ACTION-ARG1@ t.REMOVE-CURRENT-OBJECT LIT8 0C
t.SOUND-COMMAND! t.REDRAW-CURRENT-VIEW t.ACTION-ARG2@
t.CURRENT-ROOM t.@ t.CLOSE-ROOM-EXIT t.1 t.;S
AT 7F70

( ENTER-RELATIVE-EXIT | NFA 7F70 CFA 7F76 )
( Inferred descriptive name, not recovered original: )
( Computes the destination with RELATIVE-EXIT-ROOM [$6EE6], )
( checks it through $7E60, verifies the returned $0021 tag, )
( and enters the checked destination or room $24. )
( Stack: relative-direction -- done? )
AT 7F70
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B3517F
DOCOL
t.RELATIVE-EXIT-ROOM t.VALIDATE-EXIT-DESTINATION
t.DISK-GATE-TAG t.=
t.0BRANCH CELL 0008 ( -> 7F8A )
t.ENTER-ROOM
t.BRANCH CELL 000F ( -> 7F97 )
( label 7F8A )
t.DROP LIT8 24 t.0 t.ALLOW-GAME-MENU-KEY t.! t.ENTER-ROOM
( label 7F97 )
t.1 t.;S
AT 7F9B

( ACT-USE-RELATIVE-EXIT | NFA 7F9B CFA 7FA1 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $0D IDZ to this CFA. Passes )
( action argument 1 to ENTER-RELATIVE-EXIT [$7F76]. )
AT 7F9B
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B3707F
DOCOL
t.ACTION-ARG1@ t.ENTER-RELATIVE-EXIT t.;S
AT 7FA9

( SELECTED-INVENTORY-ID | NFA 7FA9 CFA 7FB0 )
( Inferred descriptive name, not recovered original: )
( Computes 4*CURRENT-INVENTORY-BLOCK [$554E] + )
( SELECTED-OBJECT [$7243] + $64. $7FCD stores this ID in )
( the first byte of an inventory slot. )
( Stack: -- item )
AT 7FA9
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CE9B7F
DOCOL
t.CURRENT-INVENTORY-BLOCK t.@ t.4 t.* t.SELECTED-OBJECT t.@
t.+ LIT8 64 t.+ t.;S
AT 7FC7

( ACT-TAKE-ITEM | NFA 7FC7 CFA 7FCD )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $0E WEZ, $2F UBIERZ to this )
( CFA. Searches for an empty inventory slot, stores the ID )
( from $7FB0, removes the selected scene object, )
( copies/positions its picture and redraws the slot. If )
( full, displays MSG-CANNOT-CARRY. Also handles UBIERZ. )
AT 7FC7
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B4A97F
DOCOL
t.0 t.FIND-INVENTORY-SLOT t.DUP
t.0BRANCH CELL 0045 ( -> 801C )
t.CLEAR-TEXT-AREA LIT8 0E t.SOUND-COMMAND!
t.SELECTED-INVENTORY-ID t.OVER t.C! t.1+ t.@ t.SELECTED-OBJECT
t.@ t.2 t.- t.OBJECT-PICTURE-RESOURCE t.RESOURCE-ADDR t.2+
t.DUP t.>R t.! t.SELECTED-INVENTORY-ID t.REMOVE-CURRENT-OBJECT
t.USE-SCENE-RESOURCES t.R> t.2 t.- t.INVENTORY-PICTURE-BUFFER
t.<MOVE t.REDRAW-CURRENT-VIEW t.USE-INVENTORY-RESOURCES
t.INVENTORY-PICTURE-BUFFER t.?POBJ t.USE-SCENE-RESOURCES
t.BRANCH CELL 0013 ( -> 802D )
( label 801C )
t.REDRAW-CURRENT-VIEW LIT8 13 t.SOUND-COMMAND!
t.CLEAR-TEXT-AREA t.MSG-CANNOT-CARRY t.2+ t.SHOW-MESSAGE
t.PRESERVE-MESSAGE-TEXT
( label 802D )
t.1 t.;S
AT 8031

( MSG-SMOKING-HARMFUL | NFA 8031 CFA 8037 )
( Inferred descriptive name, not recovered original: The )
( bounded message is PALENIE SZKODZI, displayed after the )
( smoking handler $8053. )
( Stack: -- addr )
( Decoded text: Message lines )
( line 1 $803D: PALENIE SZKODZI )
AT 8031
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D0C77F
DOVAR
BYTES 1100010F50414C454E49453D535A4B4F445A4920
AT 804D

( ACT-SMOKE | NFA 804D CFA 8053 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $0F ZAPAL to this CFA. Action )
( ZAPAL: in room zero it updates scene objects and an exit, )
( then subtracts 30 from ENERGY, clamps it to at least 1, )
( and displays PALENIE SZKODZI. )
AT 804D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B53180
DOCOL
t.CURRENT-ROOM t.@ t.0=_12DE
t.0BRANCH CELL 001D ( -> 807A )
t.POP-VIEW t.DROP t.ACTION-ARG1@ t.ADD-CURRENT-OBJECT
t.ACTION-ARG2@ t.CURRENT-ROOM t.@ t.OPEN-ROOM-EXIT
t.USE-SCENE-RESOURCES LIT8 0F t.SOUND-COMMAND!
t.BRANCH CELL 0007 ( -> 807F )
( label 807A )
LIT8 13 t.SOUND-COMMAND!
( label 807F )
t.REDRAW-CURRENT-VIEW LIT16 FFE2 t.ENERGY t.+! t.ENERGY t.@
t.1 t.<
t.0BRANCH CELL 0008 ( -> 809B )
t.1 t.ENERGY t.!
( label 809B )
t.CLEAR-TEXT-AREA t.MSG-SMOKING-HARMFUL t.2+ t.SHOW-MESSAGE
t.PRESERVE-MESSAGE-TEXT t.1 t.;S
AT 80A9

( DROP-HIT-CELL-OK? | NFA 80A9 CFA 80B0 )
( Inferred descriptive name, not recovered original: Calls )
( hit-map lookup $5147 for a duplicated coordinate pair and )
( returns true only if the hit value is neither $64 nor )
( $65. Used as the scan predicate in $80D0. )
( Stack: x y -- x y flag )
AT 80A9
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A94D80
DOCOL
t.2DUP t.HIT-MAP-CELL@ t.DUP LIT8 64 t.= t.SWAP LIT8 65 t.=
t.+ t.0=_12DE t.;S
AT 80CA

( FIND-DROP-PICTURE-XY | NFA 80CA CFA 80D0 )
( Inferred descriptive name, not recovered original: Starts )
( from CURSOR-GRID-POS [$4D92], scans using $80B0, then )
( translates the chosen grid coordinate by the FIRST )
( picture origin and a vertical factor of 6. Used to )
( position dropped inventory graphics. )
( Stack: -- x y )
AT 80CA
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C0A980
DOCOL
t.0 t.CURSOR-CONTEXT t.! t.CURSOR-GRID-POS t.FETCH-BYTE-PAIR
( label 80DC )
t.1+ t.DROP-HIT-CELL-OK?
t.0BRANCH CELL FFFA ( -> 80DC )
t.4 t.-
( label 80E8 )
t.>R t.1 t.- t.R> t.DROP-HIT-CELL-OK?
t.0BRANCH CELL FFF4 ( -> 80E8 )
t.>R t.1+ t.R> LIT16 0006 t.* t.FIRST t.1+ t.C@ t.+ t.SWAP
t.FIRST t.C@ t.+ t.SWAP t.;S
AT 8116

( REMOVE-INVENTORY-SLOT | NFA 8116 CFA 811C )
( Inferred descriptive name, not recovered original: Writes )
( zero to the slot first byte and calls )
( CLEAR-INVENTORY-SLOT [$7840] to redraw its empty )
( background. )
( Stack: slot -- )
AT 8116
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C1CA80
DOCOL
t.DUP t.0 t.SWAP t.C! t.CLEAR-INVENTORY-SLOT t.;S
AT 812A

( ACT-DROP-INVENTORY-ITEM | NFA 812A CFA 8130 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $10 ZOSTAW RZECZ to this CFA. )
( Prompts with the message at action byte 1, selects one of )
( four inventory slots, and if occupied removes its )
( current-scene entry, finds a drop position, repositions )
( its resource picture and clears the inventory slot. )
AT 812A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B61681
DOCOL
LIT8 15 t.SOUND-COMMAND! t.1 t.ACTION-BYTE-ADDR t.SHOW-MESSAGE
t.4 t.PAUSE t.2 t.CURSOR-CONTEXT t.! t.WAIT-TRIGGER-RELEASE
t.WAIT-GAME-INPUT t.2 t.* t.+ t.INVENTORY-SLOT-ADDR t.DUP t.C@
t.0BRANCH CELL 0026 ( -> 817F )
t.DUP t.>R t.C@ t.DUP t.>R t.ADD-CURRENT-OBJECT
t.FIND-DROP-PICTURE-XY t.R> t.OBJECT-PICTURE-RESOURCE
t.RESOURCE-ADDR t.2+ t.STORE-BYTE-PAIR t.USE-SCENE-RESOURCES
t.R> t.REMOVE-INVENTORY-SLOT t.REDRAW-CURRENT-VIEW
t.BRANCH CELL 000C ( -> 8189 )
( label 817F )
t.DROP t.USE-SCENE-RESOURCES t.0 t.CURSOR-CONTEXT t.!
( label 8189 )
LIT8 10 t.SOUND-COMMAND! t.1 t.;S
AT 8192

( ACT-OPEN-EXIT | NFA 8192 CFA 8198 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $11 OTWORZ to this CFA. Adds )
( object argument 1, plays sound $0B and opens current-room )
( exit bit argument 2. )
AT 8192
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B72A81
DOCOL
t.ACTION-ARG1@ t.ADD-CURRENT-OBJECT LIT8 0B t.SOUND-COMMAND!
t.REDRAW-CURRENT-VIEW t.ACTION-ARG2@ t.CURRENT-ROOM t.@
t.OPEN-ROOM-EXIT t.1 t.;S
AT 81B1

( ACT-REVEAL-OBJECT | NFA 81B1 CFA 81B7 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $14 OTWORZ, $32 ZAMKNIJ, $3E )
( ZDEJMIJ to this CFA. Adds current-scene object argument 1 )
( and plays sound $0B. Shared by open, close and )
( remove-labelled actions; it does not itself change exit )
( bits. )
AT 81B1
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B09281
DOCOL
t.ACTION-ARG1@ t.ADD-CURRENT-OBJECT LIT8 0B t.SOUND-COMMAND!
t.REDRAW-CURRENT-VIEW t.1 t.;S
AT 81C8

( ACT-HIDE-OBJECT | NFA 81C8 CFA 81CE )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $15 ZAMKNIJ, $3F POWIES to this )
( CFA. Removes current-scene object argument 1 and plays )
( sound $0C. Shared by close and hang-labelled actions. )
AT 81C8
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B1B181
DOCOL
t.ACTION-ARG1@ t.REMOVE-CURRENT-OBJECT LIT8 0C
t.SOUND-COMMAND! t.REDRAW-CURRENT-VIEW t.1 t.;S
AT 81DF

( ACT-OFF-REMOVE-REMOTE | NFA 81DF CFA 81E5 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $16 WYLACZ to this CFA. Adds )
( local object argument 1, removes object argument 3 from )
( room argument 2, view zero, and opens exit bit argument 4 )
( for that room. )
AT 81DF
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B2C881
DOCOL
t.ACTION-ARG1@ t.ADD-CURRENT-OBJECT LIT8 16 t.SOUND-COMMAND!
t.REDRAW-CURRENT-VIEW t.ACTION-ARG3@ t.ACTION-ARG2@ t.0
t.REMOVE-SCENE-OBJECT t.ACTION-ARG4@ t.ACTION-ARG2@
t.OPEN-ROOM-EXIT t.1 t.;S
AT 8204

( ACT-ON-ADD-REMOTE | NFA 8204 CFA 820A )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $17 WLACZ to this CFA. Removes )
( local object argument 1, adds object argument 3 to room )
( argument 2, view zero, and closes exit bit argument 4 for )
( that room. )
AT 8204
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B3DF81
DOCOL
t.ACTION-ARG1@ t.REMOVE-CURRENT-OBJECT LIT8 16
t.SOUND-COMMAND! t.REDRAW-CURRENT-VIEW t.ACTION-ARG3@
t.ACTION-ARG2@ t.0 t.ADD-SCENE-OBJECT t.ACTION-ARG4@
t.ACTION-ARG2@ t.CLOSE-ROOM-EXIT t.1 t.;S
AT 8229

( PUZZLE-STATE@ | NFA 8229 CFA 8230 )
( Inferred descriptive name, not recovered original: )
( Indexes the cell array at $4642 then fetches the cell. )
( Used for puzzle flags and counters throughout the game. )
( Stack: index -- value )
AT 8229
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C00482
DOCOL
t.PUZZLE-STATE-CELLS t.@ t.;S
AT 8238

( PUZZLE-STATE! | NFA 8238 CFA 823F )
( Inferred descriptive name, not recovered original: )
( Indexes the cell array at $4642 then stores the supplied )
( value. )
( Stack: value index -- )
AT 8238
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A12982
DOCOL
t.PUZZLE-STATE-CELLS t.! t.;S
AT 8247

( ACT-ENABLE-IF-CLEAR | NFA 8247 CFA 824D )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $18 WLACZ to this CFA. Requires )
( state argument 3 to be zero, clears the current-room/view )
( list selected by argument 2, sets state argument 4 to 1, )
( and reveals object argument 1. Otherwise shows the byte-5 )
( message. )
AT 8247
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B43882
DOCOL
t.ACTION-ARG3@ t.PUZZLE-STATE@ t.0=_12DE
t.0BRANCH CELL 0025 ( -> 827C )
t.CURRENT-ROOM t.@ t.ACTION-ARG2@ t.ROOM-VIEW-OBJECTS t.OUNT
t.ERASE t.1 t.ACTION-ARG4@ t.PUZZLE-STATE! t.ACTION-ARG1@
t.ADD-CURRENT-OBJECT LIT8 16 t.SOUND-COMMAND!
t.REDRAW-CURRENT-VIEW t.1
t.BRANCH CELL 0011 ( -> 828B )
( label 827C )
LIT8 13 t.SOUND-COMMAND! LIT16 0005 t.ACTION-BYTE-ADDR
t.SHOW-MESSAGE t.0
( label 828B )
t.;S
AT 828D

( ACT-DISABLE-FLAG | NFA 828D CFA 8293 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $19 WYLACZ to this CFA. Stores )
( zero in puzzle-state cell argument 2, removes object )
( argument 1, plays sound $16 and redraws. )
AT 828D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B54782
DOCOL
t.0 t.ACTION-ARG2@ t.PUZZLE-STATE! t.ACTION-ARG1@
t.REMOVE-CURRENT-OBJECT LIT8 16 t.SOUND-COMMAND!
t.REDRAW-CURRENT-VIEW t.1 t.;S
AT 82AA

( ACT-OPEN-IF-COUNTER-CLEAR | NFA 82AA CFA 82B0 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $1A OTWORZ to this CFA. )
( Requires puzzle-state argument 2 to be zero; increments )
( cell argument 3 and reveals object argument 1. On failure )
( displays the message at byte 4. )
AT 82AA
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B68D82
DOCOL
t.ACTION-ARG2@ t.PUZZLE-STATE@ t.0=_12DE
t.0BRANCH CELL 001B ( -> 82D5 )
t.1 t.ACTION-ARG3@ t.PUZZLE-STATE-CELLS t.+! t.ACTION-ARG1@
t.ADD-CURRENT-OBJECT LIT8 0B t.SOUND-COMMAND!
t.REDRAW-CURRENT-VIEW t.1
t.BRANCH CELL 000F ( -> 82E2 )
( label 82D5 )
LIT8 13 t.SOUND-COMMAND! t.4 t.ACTION-BYTE-ADDR t.SHOW-MESSAGE
t.0
( label 82E2 )
t.;S
AT 82E4

( ACT-CLOSE-DECREMENT | NFA 82E4 CFA 82EA )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $1B ZAMKNIJ to this CFA. )
( Decrements puzzle-state cell argument 2, removes object )
( argument 1 and plays closing sound $0C. )
AT 82E4
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B7AA82
DOCOL
t.-1 t.ACTION-ARG2@ t.PUZZLE-STATE-CELLS t.+! t.ACTION-ARG1@
t.REMOVE-CURRENT-OBJECT LIT8 0C t.SOUND-COMMAND!
t.REDRAW-CURRENT-VIEW t.1 t.;S
AT 8303

( ACT-MOVE-REVEAL | NFA 8303 CFA 8309 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $1C PRZESUN, $2B ODSLON to this )
( CFA. Reveals current-scene object argument 1 and sends )
( sound $1C. Shared by move and uncover action labels. )
AT 8303
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B8E482
DOCOL
t.ACTION-ARG1@ t.ADD-CURRENT-OBJECT LIT8 1C t.SOUND-COMMAND!
t.REDRAW-CURRENT-VIEW t.1 t.;S
AT 831A

( ACT-MOVE-HIDE | NFA 831A CFA 8320 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $1D PRZESUN, $2C ZASLON to this )
( CFA. Hides current-scene object argument 1 and sends )
( sound $1C. Shared by move and cover action labels. )
AT 831A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B90383
DOCOL
t.ACTION-ARG1@ t.REMOVE-CURRENT-OBJECT LIT8 1C
t.SOUND-COMMAND! t.REDRAW-CURRENT-VIEW t.1 t.;S
AT 8331

( STRING-MATCH-COUNT | NFA 8331 CFA 8336 )
( Inferred descriptive name, not recovered original: )
( Scratch cell zeroed by $8340 and incremented for each )
( equal compared byte, including the counted-string length )
( byte. )
( Stack: -- addr )
AT 8331
( Saved dictionary header: flags, name bytes, link )
BYTES 8200AB1A83
DOVAR
CELL 0000
AT 833A

( COUNTED-STRINGS= | NFA 833A CFA 8340 )
( Inferred descriptive name, not recovered original: )
( Compares both counted strings byte by byte for the second )
( string length plus one, including their length bytes; )
( returns whether the match count equals that total. )
( Stack: addr1 addr2 -- flag )
AT 833A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D23183
DOCOL
t.0 t.STRING-MATCH-COUNT t.! t.DUP t.C@ t.1+ t.0 t.(DO)
( label 8352 )
t.OVER t.I t.+ t.C@ t.OVER t.I t.+ t.C@ t.=
t.0BRANCH CELL 0008 ( -> 836E )
t.1 t.STRING-MATCH-COUNT t.+!
( label 836E )
t.(LOOP) CELL FFE2 ( -> 8352 )
t.C@ t.1+ t.STRING-MATCH-COUNT t.@ t.= t.SWAP t.DROP t.;S
AT 8382

( READ-CHECKED-ANSWER | NFA 8382 CFA 8389 )
( Inferred descriptive name, not recovered original: Draws )
( a three-row box of the supplied width and =?= prompt, )
( sets cursor/key-repeat controls, reads a nonempty counted )
( answer at HERE+$10 through READ-COUNTED-INPUT [$57EE], )
( and compares the answer with the expected counted string )
( through $8340. )
( Stack: expected width -- flag )
AT 8382
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C43A83
DOCOL
t.SWAP t.>R t.DUP t.3 t.DRAW-CENTERED-TEXT-FRAME
( ATASCII text: =?= )
t.(.")
BYTES 033D3F3D
LIT16 0006 t.- t.HERE t.16 t.+ t.16 t.PAUSE t.0 LIT16 02B6
t.C! t.64 LIT16 02BE t.C! t.READ-COUNTED-INPUT t.HERE t.16 t.+
t.R> t.COUNTED-STRINGS= t.;S
AT 83C9

( READ-SHORT-ANSWER | NFA 83C9 CFA 83D0 )
( Inferred descriptive name, not recovered original: Calls )
( $8389 with box width $0C; the input limit is width minus )
( 6 in that routine. )
( Stack: expected -- flag )
AT 83C9
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000BD8283
DOCOL
LIT16 000C t.READ-CHECKED-ANSWER t.;S
AT 83DA

( CHECK-COUNTER-PUZZLE | NFA 83DA CFA 83E0 )
( Inferred descriptive name, not recovered original: When )
( state argument 3 equals argument 4, changes overlay )
( objects, reads the expected answer at byte 8, sets state )
( argument 7 after a match, then clears the current scene )
( object list and resets state argument 3. )
AT 83DA
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D3C983
DOCOL
t.ACTION-ARG3@ t.PUZZLE-STATE@ t.ACTION-ARG4@ t.=
t.0BRANCH CELL 005B ( -> 8447 )
t.ACTION-ARG5@ t.ADD-CURRENT-OBJECT t.REDRAW-CURRENT-VIEW
LIT8 19 t.PAUSE LIT8 12 t.SOUND-COMMAND! t.CLEAR-TEXT-AREA t.8
t.ACTION-BYTE-ADDR t.READ-SHORT-ANSWER
t.0BRANCH CELL 0028 ( -> 8430 )
t.ACTION-ARG5@ t.REMOVE-CURRENT-OBJECT LIT16 0006
t.ACTION-BYTE@ t.ADD-CURRENT-OBJECT t.REDRAW-CURRENT-VIEW
LIT8 14 t.SOUND-COMMAND! t.1 LIT16 0007 t.ACTION-BYTE@
t.PUZZLE-STATE! LIT8 64 t.PAUSE
t.BRANCH CELL 0007 ( -> 8435 )
( label 8430 )
LIT8 13 t.SOUND-COMMAND!
( label 8435 )
t.CURRENT-ROOM t.@ t.CURRENT-VIEW t.ROOM-VIEW-OBJECTS t.OUNT
t.ERASE t.0 t.ACTION-ARG3@ t.PUZZLE-STATE!
( label 8447 )
t.REDRAW-CURRENT-VIEW t.1 t.;S
AT 844D

( ACT-PRESS-ADD-COUNTER | NFA 844D CFA 8453 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $1E WCISNIJ to this CFA. )
( Reveals object argument 1, adds argument 2 to puzzle cell )
( argument 3, then calls CHECK-COUNTER-PUZZLE [$83E0]. )
AT 844D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B0DA83
DOCOL
LIT8 20 t.SOUND-COMMAND! t.ACTION-ARG1@ t.ADD-CURRENT-OBJECT
t.ACTION-ARG2@ t.ACTION-ARG3@ t.PUZZLE-STATE-CELLS t.+!
t.CHECK-COUNTER-PUZZLE t.;S
AT 846A

( ACT-RELEASE-SUB-COUNTER | NFA 846A CFA 8470 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $1F WYCISNIJ to this CFA. Hides )
( object argument 1, subtracts argument 2 from puzzle cell )
( argument 3, then calls CHECK-COUNTER-PUZZLE [$83E0]. )
AT 846A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B14D84
DOCOL
LIT8 1F t.SOUND-COMMAND! t.ACTION-ARG1@
t.REMOVE-CURRENT-OBJECT t.ACTION-ARG2@ t.MINUS t.ACTION-ARG3@
t.PUZZLE-STATE-CELLS t.+! t.CHECK-COUNTER-PUZZLE t.;S
AT 8489

( ACT-PRESS-IF-STATE-SET | NFA 8489 CFA 848F )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $20 WCISNIJ to this CFA. )
( Requires puzzle-state argument 3 to be nonzero; reveals )
( object argument 1 and opens current-room exit argument 2. )
( Otherwise shows the byte-4 message and returns 0. )
AT 8489
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B26A84
DOCOL
t.ACTION-ARG3@ t.PUZZLE-STATE@ LIT8 20 t.SOUND-COMMAND!
LIT16 0014 t.PAUSE
t.0BRANCH CELL 001B ( -> 84BD )
t.ACTION-ARG1@ t.ADD-CURRENT-OBJECT t.ACTION-ARG2@
t.CURRENT-ROOM t.@ t.OPEN-ROOM-EXIT t.REDRAW-CURRENT-VIEW
LIT8 0B t.SOUND-COMMAND! t.1
t.BRANCH CELL 000F ( -> 84CA )
( label 84BD )
t.4 t.ACTION-BYTE-ADDR t.SHOW-MESSAGE LIT8 13 t.SOUND-COMMAND!
t.0
( label 84CA )
t.;S
AT 84CC

( ACT-THROW-RELOCATE-ROOM | NFA 84CC CFA 84D2 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $21 RZUC to this CFA. Asks )
( CZYM?; on the argument-2 inventory ID, copies )
( ROOM-MAP-DESCRIPTORS from room argument 1 to room )
( argument 3, clears the source descriptor, sets puzzle )
( state argument 4 and displays byte-5 text. The selected )
( inventory slot is consumed unconditionally after the )
( match test, including a wrong-item attempt. )
AT 84CC
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B38984
DOCOL
t.MSG-WITH-WHAT LIT8 15 t.SOUND-COMMAND! t.ASK-INVENTORY-ITEM
t.DUP t.>R t.C@ t.DUP
t.0BRANCH CELL 0007 ( -> 84EE )
LIT8 21 t.SOUND-COMMAND!
( label 84EE )
t.ACTION-ARG2@ t.=
t.0BRANCH CELL 0028 ( -> 851C )
t.ACTION-ARG1@ t.ROOM-MAP-DESCRIPTORS t.@ t.ACTION-ARG3@
t.ROOM-MAP-DESCRIPTORS t.! t.0 t.ACTION-ARG1@
t.ROOM-MAP-DESCRIPTORS t.! t.1 t.ACTION-ARG4@ t.PUZZLE-STATE!
t.CLEAR-TEXT-AREA LIT16 0005 t.ACTION-BYTE-ADDR t.SHOW-MESSAGE
t.PRESERVE-MESSAGE-TEXT
( label 851C )
t.R> t.REMOVE-INVENTORY-SLOT t.USE-SCENE-RESOURCES t.1 t.;S
AT 8526

( SKIP-MESSAGE-GROUPS | NFA 8526 CFA 852D )
( Inferred descriptive name, not recovered original: Skips )
( the requested number of consecutive groups encoded as a )
( line-count byte followed by byte-counted strings; nested )
( COUNT/+ loops retain the address following each group. )
( Stack: addr count -- next-addr )
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

( SHOW-SECOND-MESSAGE | NFA 854D CFA 8555 )
( Inferred descriptive name, not recovered original: Skips )
( one counted-line group through $852D and displays the )
( next group through SHOW-MESSAGE [$6D82]. )
( Stack: addr -- )
AT 854D
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D42685
DOCOL
t.1 t.SKIP-MESSAGE-GROUPS t.SHOW-MESSAGE t.;S
AT 855F

( ACT-EXAMINE-FLAG | NFA 855F CFA 8565 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $22 ZBADAJ to this CFA. Selects )
( the first or second inline message at byte 2 according to )
( whether puzzle-state cell argument 1 is nonzero; sends )
( examination sound 7 and returns 0. )
AT 855F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B44D85
DOCOL
t.ACTION-ARG1@ t.PUZZLE-STATE@ LIT8 07 t.SOUND-COMMAND!
t.0BRANCH CELL 000C ( -> 857E )
t.2 t.ACTION-BYTE-ADDR t.SHOW-MESSAGE
t.BRANCH CELL 0008 ( -> 8584 )
( label 857E )
t.2 t.ACTION-BYTE-ADDR t.SHOW-SECOND-MESSAGE
( label 8584 )
t.0 t.;S
AT 8588

( ANIMATION-CONTROL | NFA 8588 CFA 858D )
( Inferred descriptive name, not recovered original: Two )
( control bytes: low byte is the per-frame PAUSE used by )
( $8598; high byte chooses reverse [$85CD] instead of )
( forward [$85AC] traversal in $85F1. )
( Stack: -- addr )
AT 8588
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D45F85
DOVAR
CELL 0000
AT 8591

( DRAW-ANIMATION-FRAME | NFA 8591 CFA 8598 )
( Inferred descriptive name, not recovered original: )
( Fetches a resource with RESOURCE-ADDR, draws it through )
( ?PCOBJ, and waits the low byte of ANIMATION-CONTROL. )
( Stack: resource -- )
AT 8591
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A98885
DOCOL
t.RESOURCE-ADDR t.?PCOBJ t.ANIMATION-CONTROL t.C@ t.PAUSE t.;S
AT 85A6

( ANIMATE-FORWARD | NFA 85A6 CFA 85AC )
( Inferred descriptive name, not recovered original: Maps )
( the starting object through $56A7, then draws consecutive )
( resource IDs from the base through base+count-1. )
( Stack: object count -- )
AT 85A6
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C99185
DOCOL
t.SWAP t.OBJECT-PICTURE-RESOURCE t.DUP t.>R t.+ t.R> t.(DO)
( label 85BC )
t.I t.DRAW-ANIMATION-FRAME
t.(LOOP) CELL FFFA ( -> 85BC )
t.;S
AT 85C6

( ANIMATE-REVERSE | NFA 85C6 CFA 85CD )
( Inferred descriptive name, not recovered original: Maps )
( the starting object through $56A7 and traverses the same )
( number of resources in descending order with -1 +LOOP. )
( Stack: object count -- )
AT 85C6
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C9A685
DOCOL
t.SWAP t.OBJECT-PICTURE-RESOURCE t.1 t.- t.SWAP t.OVER t.+
t.(DO)
( label 85DF )
t.I t.DRAW-ANIMATION-FRAME t.-1
t.(+LOOP) CELL FFF8 ( -> 85DF )
t.;S
AT 85EB

( REPEAT-ANIMATION | NFA 85EB CFA 85F1 )
( Inferred descriptive name, not recovered original: )
( Repeats forward or reverse frame traversal according to )
( ANIMATION-CONTROL high byte; retains the object and frame )
( count for its callers. )
( Stack: object frames repeats -- object frames )
AT 85EB
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CEC685
DOCOL
t.0 t.(DO)
( label 85F7 )
t.2DUP t.ANIMATION-CONTROL t.1+ t.C@
t.0BRANCH CELL 0008 ( -> 8609 )
t.ANIMATE-REVERSE
t.BRANCH CELL 0004 ( -> 860B )
( label 8609 )
t.ANIMATE-FORWARD
( label 860B )
t.(LOOP) CELL FFEA ( -> 85F7 )
t.;S
AT 8611

( ANIMATE-RESTORE-FIRST | NFA 8611 CFA 8619 )
( Inferred descriptive name, not recovered original: Calls )
( $85F1, drops the frame count, and redraws the initial )
( object resource through $56A7/$8598. )
( Stack: object frames repeats -- )
AT 8611
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000ABEB85
DOCOL
t.REPEAT-ANIMATION t.DROP t.OBJECT-PICTURE-RESOURCE
t.DRAW-ANIMATION-FRAME t.;S
AT 8625

( PLAY-ANIMATION | NFA 8625 CFA 862D )
( Inferred descriptive name, not recovered original: Calls )
( $85F1 and drops the retained object/frame-count pair. )
( Stack: object frames repeats -- )
AT 8625
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D31186
DOCOL
t.REPEAT-ANIMATION t.2DROP t.;S
AT 8635

( ACT-SELECT-FLOOR | NFA 8635 CFA 863B )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $23 NACISNIJ to this CFA. )
( Compares current map floor $466D with argument 1 to )
( select animation direction, swaps floor indicator )
( objects, closes the room exit if needed, animates 25 )
( frames abs[old-new] times, stores the new floor and )
( redraws map components. )
AT 8635
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B52586
DOCOL
LIT8 1F t.SOUND-COMMAND! t.CURRENT-MAP-FLOOR t.@ t.DUP
t.ACTION-ARG1@ t.> t.ANIMATION-CONTROL t.1+ t.C!
t.ACTION-ARG2@ t.+ t.1 t.- t.REMOVE-CURRENT-OBJECT
t.ACTION-ARG1@ t.ACTION-ARG2@ t.+ t.1 t.- t.ADD-CURRENT-OBJECT
t.REDRAW-CURRENT-VIEW t.32 t.PAUSE t.POP-VIEW t.DROP
t.CURRENT-ROOM t.@ t.ROOM-EXIT-MASKS t.C@
t.0BRANCH CELL 0019 ( -> 8695 )
t.ACTION-ARG3@ t.REMOVE-CURRENT-OBJECT t.3 t.CURRENT-ROOM t.@
t.CLOSE-ROOM-EXIT LIT8 0C t.SOUND-COMMAND!
t.REDRAW-CURRENT-VIEW t.32 t.PAUSE
( label 8695 )
t.REDRAW-CURRENT-VIEW t.2 t.ANIMATION-CONTROL t.C! LIT8 23
t.SOUND-COMMAND! t.ACTION-ARG4@ LIT16 0019 t.CURRENT-MAP-FLOOR
t.@ t.ACTION-ARG1@ t.- t.ABS t.ANIMATE-RESTORE-FIRST
t.RESTART-SOUND LIT8 15 t.SOUND-COMMAND! t.ACTION-ARG1@
t.CURRENT-MAP-FLOOR t.! t.DRAW-MAP-FLOOR-NUMBER
t.CLEAR-MAP-PANEL t.DRAW-FLOOR-MAP t.CURRENT-ROOM t.@
t.MARK-CURRENT-MAP-ROOM t.1 t.;S
AT 86D1

( MSG-WHAT | NFA 86D1 CFA 86D7 )
( Inferred descriptive name, not recovered original: The )
( bounded message is CO?; used when choosing an inventory )
( item or typing an action answer. )
( Stack: -- addr )
( Decoded text: Message lines )
( line 1 $86DD: CO? )
AT 86D1
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CF3586
DOVAR
BYTES 05000103434F3F54
AT 86E1

( SHOW-QUESTION-SPACING | NFA 86E1 CFA 86E6 )
( Inferred descriptive name, not recovered original: )
( Preserves the value above the supplied message on the )
( return stack, sends sound $15, displays message+2 and )
( emits four line advances through $5D36. )
( Stack: message value -- value )
AT 86E1
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CBD186
DOCOL
t.>R LIT8 15 t.SOUND-COMMAND! t.2+ t.SHOW-MESSAGE
t.TEXT-NEXT-ROW t.TEXT-NEXT-ROW t.TEXT-NEXT-ROW
t.TEXT-NEXT-ROW t.R> t.;S
AT 86FF

( ASK-SHORT-QUESTION | NFA 86FF CFA 8706 )
( Inferred descriptive name, not recovered original: )
( Displays/spaces the supplied question through $86E6 then )
( checks the typed short answer through $83D0. )
( Stack: message expected -- flag )
AT 86FF
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C4E186
DOCOL
t.SHOW-QUESTION-SPACING t.READ-SHORT-ANSWER t.;S
AT 870E

( ASK-ACTION-ANSWER | NFA 870E CFA 8714 )
( Inferred descriptive name, not recovered original: Clears )
( text, asks CO? against the counted string at action byte )
( 3, adds argument 2 to the comparison result, and advances )
( the text line. )
( Stack: -- result )
AT 870E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000DAFF86
DOCOL
t.CLEAR-TEXT-AREA t.MSG-WHAT t.3 t.ACTION-BYTE-ADDR
t.ASK-SHORT-QUESTION t.ACTION-ARG2@ t.+ t.TEXT-NEXT-ROW t.;S
AT 8728

( ACT-SHOUT-ANSWER | NFA 8728 CFA 872E )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $24 KRZYKNIJ to this CFA. Calls )
( ASK-ACTION-ANSWER; if the result is nonzero, reveals )
( object argument 1 and sends sound $1C; redraws and )
( returns 1. )
AT 8728
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B60E87
DOCOL
t.ASK-ACTION-ANSWER
t.0BRANCH CELL 000B ( -> 873F )
t.ACTION-ARG1@ t.ADD-CURRENT-OBJECT LIT8 1C t.SOUND-COMMAND!
( label 873F )
t.REDRAW-CURRENT-VIEW t.1 t.;S
AT 8745

( SHOW-ACTION-FAILURE | NFA 8745 CFA 874C )
( Inferred descriptive name, not recovered original: Clears )
( text, sends failure sound $13, displays the supplied )
( multiline message, disables immediate text clearing, )
( redraws and returns 1. )
( Stack: message -- done? )
AT 8745
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D42887
DOCOL
t.CLEAR-TEXT-AREA LIT8 13 t.SOUND-COMMAND! t.SHOW-MESSAGE t.0
t.TEXT-CLEAR-ENABLED t.! t.REDRAW-CURRENT-VIEW t.1 t.;S
AT 8763

( ANIMATE-ACTION-OBJECT | NFA 8763 CFA 8768 )
( Inferred descriptive name, not recovered original: When )
( argument 3 is nonzero, sets four-tick frame delay and )
( plays one sequence beginning at argument1+1 for argument3 )
( frames; otherwise only plays sound $0B. Direction is )
( already set by callers. )
( Stack: -- )
AT 8763
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C44587
DOCOL
LIT8 28 t.SOUND-COMMAND! t.ACTION-ARG3@
t.0BRANCH CELL 0021 ( -> 8794 )
LIT8 28 t.SOUND-COMMAND! t.8 t.PAUSE t.4 t.ANIMATION-CONTROL
t.C! t.ACTION-ARG1@ t.1+ t.ACTION-ARG3@ t.1 t.PLAY-ANIMATION
t.RESTART-SOUND
t.BRANCH CELL 0007 ( -> 8799 )
( label 8794 )
LIT8 0B t.SOUND-COMMAND!
( label 8799 )
t.2 t.PAUSE t.;S
AT 879F

( REQUIRE-ITEM-THEN-OPEN | NFA 879F CFA 87A4 )
( Inferred descriptive name, not recovered original: Asks )
( for an inventory item using the supplied prompt. Matching )
( argument 4 plays the forward action animation, reveals )
( object argument 1 and opens exit argument 2; failure )
( displays byte-5 text. )
( Stack: message -- done? )
AT 879F
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C16387
DOCOL
t.ASK-INVENTORY-ITEM t.C@ t.ACTION-ARG4@ t.=
t.0BRANCH CELL 0020 ( -> 87D0 )
t.0 t.ANIMATION-CONTROL t.1+ t.C! t.ANIMATE-ACTION-OBJECT
t.ACTION-ARG1@ t.ADD-CURRENT-OBJECT t.REDRAW-CURRENT-VIEW
t.ACTION-ARG2@ t.CURRENT-ROOM t.@ t.OPEN-ROOM-EXIT t.1
t.BRANCH CELL 000A ( -> 87D8 )
( label 87D0 )
LIT16 0005 t.ACTION-BYTE-ADDR t.SHOW-ACTION-FAILURE
( label 87D8 )
t.;S
AT 87DA

( ACT-SHOW-ITEM-OPEN | NFA 87DA CFA 87E0 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $25 POKAZ to this CFA. Calls )
( REQUIRE-ITEM-THEN-OPEN [$87A4] using CO? as the prompt. )
AT 87DA
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B79F87
DOCOL
t.MSG-WHAT t.REQUIRE-ITEM-THEN-OPEN t.;S
AT 87E8

( ACT-ANIMATE-OPEN | NFA 87E8 CFA 87EE )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $26 NACISNIJ to this CFA. Sets )
( forward animation direction, runs $8768, reveals object )
( argument 1 and opens current-room exit bit argument 2. )
AT 87E8
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B8DA87
DOCOL
t.0 t.ANIMATION-CONTROL t.1+ t.C! t.ANIMATE-ACTION-OBJECT
t.ACTION-ARG1@ t.ADD-CURRENT-OBJECT t.REDRAW-CURRENT-VIEW
t.ACTION-ARG2@ t.CURRENT-ROOM t.@ t.OPEN-ROOM-EXIT t.1 t.;S
AT 880C

( ACT-ANIMATE-CLOSE | NFA 880C CFA 8812 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $27 NACISNIJ, $49 ZASUN to this )
( CFA. Sets reverse animation direction, runs $8768, hides )
( object argument 1 and closes current-room exit bit )
( argument 2. Also handles ZASUN. )
AT 880C
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B9E887
DOCOL
t.1 t.ANIMATION-CONTROL t.1+ t.C! t.ANIMATE-ACTION-OBJECT
t.ACTION-ARG1@ t.REMOVE-CURRENT-OBJECT t.REDRAW-CURRENT-VIEW
t.ACTION-ARG2@ t.CURRENT-ROOM t.@ t.CLOSE-ROOM-EXIT t.1 t.;S
AT 8830

( MSG-ARE-YOU-ADULT | NFA 8830 CFA 8836 )
( Inferred descriptive name, not recovered original: The )
( bounded message is JESTES DOROSLY?; $8861 requires the )
( expected answer before entering a closeup. )
( Stack: -- addr )
( Decoded text: Message lines )
( line 1 $883C: JESTES DOROSLY? )
AT 8830
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CF0C88
DOVAR
BYTES 1100010F4A45535445733D444F524F536C593F20
AT 884C

( SHOW-AFTER-COUNTED-ANSWER | NFA 884C CFA 8851 )
( Inferred descriptive name, not recovered original: )
( Advances past one byte-counted string using COUNT + and )
( passes the following multiline message to )
( SHOW-ACTION-FAILURE [$874C]. )
( Stack: counted-answer -- done? )
AT 884C
( Saved dictionary header: flags, name bytes, link )
BYTES 8200DA3088
DOCOL
t.COUNT t.+ t.SHOW-ACTION-FAILURE t.;S
AT 885B

( ACT-ADULT-GATED-CLOSEUP | NFA 885B CFA 8861 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $28 ZBLIZENIE to this CFA. Asks )
( JESTES DOROSLY? against the counted answer at byte 2. )
( Match calls ACT-SHOW-CLOSEUP; mismatch displays the )
( message after the expected answer. )
AT 885B
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B04C88
DOCOL
t.CLEAR-TEXT-AREA t.MSG-ARE-YOU-ADULT t.2 t.ACTION-BYTE-ADDR
t.ASK-SHORT-QUESTION
t.0BRANCH CELL 0008 ( -> 8877 )
t.ACT-SHOW-CLOSEUP
t.BRANCH CELL 0008 ( -> 887D )
( label 8877 )
t.2 t.ACTION-BYTE-ADDR t.SHOW-AFTER-COUNTED-ANSWER
( label 887D )
t.;S
AT 887F

( ACT-REFUSE-CLOSEUP | NFA 887F CFA 8885 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $29 ZBLIZENIE to this CFA. )
( Restores/redraws the pointer and displays the byte-1 )
( message through SHOW-ACTION-FAILURE, without changing )
( scene. )
AT 887F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B15B88
DOCOL
t.USE-SCENE-RESOURCES t.REDRAW-CURRENT-VIEW t.1
t.ACTION-BYTE-ADDR t.SHOW-ACTION-FAILURE t.;S
AT 8893

( ACT-REFUSE-WITH-OVERLAY | NFA 8893 CFA 8899 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $2A WEZ, $36 UBIERZ, $37 CALUJ )
( to this CFA. Shared refusal handler for take, wear and )
( kiss actions: sends failure sound, reveals object )
( argument 1 only when below $C8, pauses and displays )
( byte-2 text. )
AT 8893
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B27F88
DOCOL
LIT8 13 t.SOUND-COMMAND! t.ACTION-ARG1@ LIT16 00C8 t.<
t.0BRANCH CELL 0006 ( -> 88B0 )
t.ACTION-ARG1@ t.ADD-CURRENT-OBJECT
( label 88B0 )
t.8 t.PAUSE t.REDRAW-CURRENT-VIEW t.2 t.ACTION-BYTE-ADDR
t.SHOW-ACTION-FAILURE t.;S
AT 88BE

( ACT-SWIM-REQUIRE-ITEM | NFA 88BE CFA 88C4 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $2D PODPLYN to this CFA. Looks )
( for inventory ID argument 2 through $7B87. If found, )
( calls ACT-SHOW-CLOSEUP; otherwise shows the byte-3 )
( message with failure sound. )
AT 88BE
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B59388
DOCOL
t.ACTION-ARG2@ t.FIND-INVENTORY-SLOT
t.0BRANCH CELL 0008 ( -> 88D4 )
t.ACT-SHOW-CLOSEUP
t.BRANCH CELL 0015 ( -> 88E7 )
( label 88D4 )
LIT8 13 t.SOUND-COMMAND! t.CLEAR-TEXT-AREA t.3
t.ACTION-BYTE-ADDR t.SHOW-MESSAGE t.PRESERVE-MESSAGE-TEXT
t.REDRAW-CURRENT-VIEW t.1
( label 88E7 )
t.;S
AT 88E9

( ACT-TAKE-PARAMETER-OBJECT | NFA 88E9 CFA 88EF )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $2E WEZ to this CFA. If a free )
( inventory slot exists, reveals object argument 1. )
( Replaces SELECTED-OBJECT with argument 2, normalizes )
( inventory IDs through $7684, then calls ACT-TAKE-ITEM. )
AT 88E9
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B6BE88
DOCOL
t.0 t.FIND-INVENTORY-SLOT
t.0BRANCH CELL 0006 ( -> 88FD )
t.ACTION-ARG1@ t.ADD-CURRENT-OBJECT
( label 88FD )
t.ACTION-ARG2@ t.SELECTED-OBJECT t.!
t.NORMALIZE-INVENTORY-OBJECT t.ACT-TAKE-ITEM t.;S
AT 8909

( ACT-DISCARD-OBJECT | NFA 8909 CFA 890F )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $30 WYRZUC to this CFA. Removes )
( current-scene object argument 1, restores the pointer, )
( sends sound $21 and redraws. )
AT 8909
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B8E988
DOCOL
t.ACTION-ARG1@ t.REMOVE-CURRENT-OBJECT t.USE-SCENE-RESOURCES
LIT8 21 t.SOUND-COMMAND! t.REDRAW-CURRENT-VIEW t.1 t.;S
AT 8922

( ACT-OPEN-REMOVE-WITH-ITEM | NFA 8922 CFA 8928 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $31 OTWORZ to this CFA. Sets )
( OPEN-OBJECT-MODE to zero, then calls $7EF5: a matching )
( inventory item removes object argument 1 and opens an )
( exit. )
AT 8922
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B90989
DOCOL
t.0 t.OPEN-OBJECT-MODE t.! t.OPEN-WITH-SELECTED-ITEM t.;S
AT 8934

( ACT-PRESS-IF-FLAG-SET | NFA 8934 CFA 893A )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $33 NACISNIJ to this CFA. )
( Requires puzzle-state argument 4 to be nonzero before )
( calling the animated-open handler; otherwise displays )
( byte-5 failure text. )
AT 8934
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B12289
DOCOL
t.ACTION-ARG4@ t.PUZZLE-STATE@
t.0BRANCH CELL 0008 ( -> 894A )
t.ACT-ANIMATE-OPEN
t.BRANCH CELL 0017 ( -> 895F )
( label 894A )
t.CLEAR-TEXT-AREA LIT8 13 t.SOUND-COMMAND! LIT16 0005
t.ACTION-BYTE-ADDR t.SHOW-MESSAGE t.PRESERVE-MESSAGE-TEXT
t.REDRAW-CURRENT-VIEW t.1
( label 895F )
t.;S
AT 8961

( MSG-ALL-RIGHT | NFA 8961 CFA 8967 )
( Inferred descriptive name, not recovered original: The )
( bounded message is W PORZADKU; shown when $897E accepts )
( the selected inventory item. )
( Stack: -- addr )
( Decoded text: Message lines )
( line 1 $896D: W PORZADKU )
AT 8961
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D03489
DOVAR
BYTES 0C00010A573D504F525A61444B5520
AT 8978

( ACT-SHOW-ITEM-SET-FLAG | NFA 8978 CFA 897E )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $34 POKAZ to this CFA. Asks CO? )
( for an inventory selection. Item argument 2 sets state )
( argument 4 to 1 and displays W PORZADKU; argument 3 )
( selects an alternative failure message. Afterwards hides )
( object argument 1 and redraws. )
AT 8978
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B26189
DOCOL
t.MSG-WHAT t.ASK-INVENTORY-ITEM t.C@ t.DUP t.>R
t.CLEAR-TEXT-AREA t.ACTION-ARG2@ t.=
t.0BRANCH CELL 0017 ( -> 89A9 )
LIT8 14 t.SOUND-COMMAND! t.1 t.ACTION-ARG4@ t.PUZZLE-STATE!
t.MSG-ALL-RIGHT t.2+ t.SHOW-MESSAGE
t.BRANCH CELL 001F ( -> 89C6 )
( label 89A9 )
LIT16 0005 t.ACTION-BYTE-ADDR LIT8 13 t.SOUND-COMMAND!
t.ACTION-ARG3@ t.R t.=
t.0BRANCH CELL 0008 ( -> 89C4 )
t.SHOW-SECOND-MESSAGE
t.BRANCH CELL 0004 ( -> 89C6 )
( label 89C4 )
t.SHOW-MESSAGE
( label 89C6 )
t.R> t.DROP t.PRESERVE-MESSAGE-TEXT t.ACTION-ARG1@
t.REMOVE-CURRENT-OBJECT t.64 t.PAUSE LIT8 0C t.SOUND-COMMAND!
t.REDRAW-CURRENT-VIEW t.1 t.;S
AT 89DF

( ACT-SHOUT-REVEAL-IF-CLEAR | NFA 89DF CFA 89E5 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $35 KRZYKNIJ to this CFA. )
( Collects an action answer but discards its result; )
( reveals object argument 1 only while puzzle-state )
( argument 4 is zero, then redraws. )
AT 89DF
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B37889
DOCOL
t.ASK-ACTION-ANSWER t.DROP t.ACTION-ARG4@ t.PUZZLE-STATE@
t.0=_12DE
t.0BRANCH CELL 000B ( -> 89FE )
t.ACTION-ARG1@ t.ADD-CURRENT-OBJECT LIT8 1C t.SOUND-COMMAND!
( label 89FE )
t.REDRAW-CURRENT-VIEW t.1 t.;S
AT 8A04

( MSG-ENTER-PASSWORD | NFA 8A04 CFA 8A0A )
( Inferred descriptive name, not recovered original: The )
( bounded message is PODAJ HASLO; used by $8A38 before an )
( animated opening action. )
( Stack: -- addr )
( Decoded text: Message lines )
( line 1 $8A10: PODAJ HASLO )
AT 8A04
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D3DF89
DOVAR
BYTES 0D00010B504F44414A3D4841536C4F202020
AT 8A1E

( ASK-CHECKED-QUESTION | NFA 8A1E CFA 8A26 )
( Inferred descriptive name, not recovered original: )
( Preserves the requested box width, displays/spaces the )
( supplied question via $86E6 and calls READ-CHECKED-ANSWER )
( [$8389]. )
( Stack: message expected width -- flag )
AT 8A1E
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C4048A
DOCOL
t.>R t.SHOW-QUESTION-SPACING t.R> t.READ-CHECKED-ANSWER t.;S
AT 8A32

( ACT-PASSWORD-PRESS | NFA 8A32 CFA 8A38 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $38 NACISNIJ to this CFA. Asks )
( PODAJ HASLO with box width $14 and the counted answer at )
( byte 4. Match calls ACT-ANIMATE-OPEN; failure displays )
( the message after that counted answer. )
AT 8A32
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B61E8A
DOCOL
t.CLEAR-TEXT-AREA t.MSG-ENTER-PASSWORD t.4 t.ACTION-BYTE-ADDR
LIT16 0014 t.ASK-CHECKED-QUESTION
t.0BRANCH CELL 0008 ( -> 8A52 )
t.ACT-ANIMATE-OPEN
t.BRANCH CELL 0008 ( -> 8A58 )
( label 8A52 )
t.4 t.ACTION-BYTE-ADDR t.SHOW-AFTER-COUNTED-ANSWER
( label 8A58 )
t.;S
AT 8A5A

( ACT-CUT-WITH-ITEM | NFA 8A5A CFA 8A60 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $39 PRZETNIJ to this CFA. Calls )
( REQUIRE-ITEM-THEN-OPEN [$87A4] using CZYM? as the prompt. )
AT 8A5A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B7328A
DOCOL
t.MSG-WITH-WHAT t.REQUIRE-ITEM-THEN-OPEN t.;S
AT 8A68

( ACT-INACTIVE-BUTTON | NFA 8A68 CFA 8A6E )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $3A NACISNIJ to this CFA. Only )
( sends sound $15, pauses $32 ticks and returns 0, keeping )
( action selection active. )
AT 8A68
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B85A8A
DOCOL
LIT8 15 t.SOUND-COMMAND! t.32 t.PAUSE t.0 t.;S
AT 8A7D

( ACT-TURN-SET-FLAG | NFA 8A7D CFA 8A83 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $3B PRZEKREC to this CFA. Sets )
( puzzle-state argument 4 to 1 and calls ACT-ANIMATE-OPEN. )
AT 8A7D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B9688A
DOCOL
t.1 t.ACTION-ARG4@ t.PUZZLE-STATE! t.ACT-ANIMATE-OPEN t.;S
AT 8A8F

( ACT-TURN-CLEAR-FLAG | NFA 8A8F CFA 8A95 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $3C PRZEKREC to this CFA. )
( Clears puzzle-state argument 4 and calls )
( ACT-ANIMATE-CLOSE. )
AT 8A8F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B07D8A
DOCOL
t.0 t.ACTION-ARG4@ t.PUZZLE-STATE! t.ACT-ANIMATE-CLOSE t.;S
AT 8AA1

( ACT-OPEN-IF-PUZZLE-SET | NFA 8AA1 CFA 8AA7 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $3D OTWORZ to this CFA. )
( Requires puzzle-state argument 3 to be nonzero, then )
( calls ACT-OPEN-EXIT [$8198]; otherwise displays byte-4 )
( failure text. )
AT 8AA1
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B18F8A
DOCOL
t.ACTION-ARG3@ t.PUZZLE-STATE@
t.0BRANCH CELL 0008 ( -> 8AB7 )
t.ACT-OPEN-EXIT
t.BRANCH CELL 0008 ( -> 8ABD )
( label 8AB7 )
t.4 t.ACTION-BYTE-ADDR t.SHOW-ACTION-FAILURE
( label 8ABD )
t.;S
AT 8ABF

( PUZZLE-STATE+! | NFA 8ABF CFA 8AC7 )
( Inferred descriptive name, not recovered original: )
( Fetches indexed state through $8230, adds the supplied )
( delta, then stores through $823F. )
( Stack: delta index -- )
AT 8ABF
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A1A18A
DOCOL
t.>R t.R t.PUZZLE-STATE@ t.+ t.R> t.PUZZLE-STATE! t.;S
AT 8AD7

( ACT-SCREW-IN-ITEM | NFA 8AD7 CFA 8ADD )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $40 WKREC to this CFA. Asks CO? )
( and requires inventory ID argument 2. Success removes )
( object argument 1, adds the low bit of puzzle-state )
( argument 3 to state argument 4, consumes the chosen )
( inventory slot and redraws. )
AT 8AD7
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B4BF8A
DOCOL
t.MSG-WHAT t.ASK-INVENTORY-ITEM t.DUP t.>R t.C@ t.ACTION-ARG2@
t.=
t.0BRANCH CELL 0022 ( -> 8B11 )
t.ACTION-ARG1@ t.REMOVE-CURRENT-OBJECT t.ACTION-ARG3@
t.PUZZLE-STATE@ t.1 t.AND t.ACTION-ARG4@ t.PUZZLE-STATE+! t.16
t.SOUND-COMMAND! t.R> t.REMOVE-INVENTORY-SLOT
t.REDRAW-CURRENT-VIEW t.1
t.BRANCH CELL 000E ( -> 8B1D )
( label 8B11 )
LIT16 0005 t.ACTION-BYTE-ADDR t.SHOW-ACTION-FAILURE t.R>
t.DROP
( label 8B1D )
t.;S
AT 8B1F

( ACT-EXAMINE-COUNTER | NFA 8B1F CFA 8B25 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $41 ZBADAJ to this CFA. Reads )
( puzzle-state argument 1, maps value 3 to message index 2, )
( skips that many groups from the byte-2 text and displays )
( the selected message; returns 0. )
AT 8B1F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B5D78A
DOCOL
LIT8 07 t.SOUND-COMMAND! t.ACTION-ARG1@ t.PUZZLE-STATE@ t.DUP
t.3 t.= t.- t.2 t.ACTION-BYTE-ADDR t.SWAP
t.SKIP-MESSAGE-GROUPS t.SHOW-MESSAGE t.0 t.;S
AT 8B46

( ACT-UNSCREW-ITEM | NFA 8B46 CFA 8B4C )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $42 WYKREC to this CFA. With a )
( free slot, subtracts the low bit of state argument 3 from )
( state argument 4 and removes object 3 from room $1C, view )
( zero; then calls ACT-TAKE-PARAMETER-OBJECT. )
AT 8B46
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B61F8B
DOCOL
t.0 t.FIND-INVENTORY-SLOT
t.0BRANCH CELL 001A ( -> 8B6E )
t.ACTION-ARG3@ t.PUZZLE-STATE@ t.1 t.AND t.MINUS
t.ACTION-ARG4@ t.PUZZLE-STATE+! t.3 LIT16 001C t.0
t.REMOVE-SCENE-OBJECT
( label 8B6E )
t.ACT-TAKE-PARAMETER-OBJECT t.;S
AT 8B72

( ACT-PRESS-IF-STATE-TWO | NFA 8B72 CFA 8B78 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $43 NACISNIJ to this CFA. )
( Requires puzzle-state argument 4 to equal 2 before )
( ACT-ANIMATE-OPEN; otherwise displays the byte-6 message. )
AT 8B72
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B7468B
DOCOL
t.ACTION-ARG4@ t.PUZZLE-STATE@ t.2 t.=
t.0BRANCH CELL 0008 ( -> 8B8C )
t.ACT-ANIMATE-OPEN
t.BRANCH CELL 000A ( -> 8B94 )
( label 8B8C )
LIT16 0006 t.ACTION-BYTE-ADDR t.SHOW-ACTION-FAILURE
( label 8B94 )
t.;S
AT 8B96

( ACT-PRESS-FLASH-ADVANCE | NFA 8B96 CFA 8B9C )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $44 NACISNIJ to this CFA. )
( Requires state argument 4 equal to 2; removes object 3, )
( animates opening, flashes the first palette byte, sets )
( state argument 5, decrements state argument 4, clears )
( state cell $0A and displays the second byte-6 message. )
AT 8B96
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B8728B
DOCOL
t.ACTION-ARG4@ t.PUZZLE-STATE@ t.2 t.=
t.0BRANCH CELL 0042 ( -> 8BEA )
t.3 t.REMOVE-CURRENT-OBJECT t.ACT-ANIMATE-OPEN
t.GAME-COLOR-TABLE t.C@ t.8 t.GAME-COLOR-TABLE t.C! t.3
t.PAUSE t.GAME-COLOR-TABLE t.C! t.1 t.ACTION-ARG5@
t.PUZZLE-STATE! t.-1 t.ACTION-ARG4@ t.PUZZLE-STATE+! t.0
LIT16 000A t.PUZZLE-STATE! t.16 t.PAUSE LIT16 0006
t.ACTION-BYTE-ADDR t.1 t.SKIP-MESSAGE-GROUPS
t.SHOW-ACTION-FAILURE
t.BRANCH CELL 000A ( -> 8BF2 )
( label 8BEA )
LIT16 0006 t.ACTION-BYTE-ADDR t.SHOW-ACTION-FAILURE
( label 8BF2 )
t.;S
AT 8BF4

( ACT-APPLY-ITEM-SET-THREE | NFA 8BF4 CFA 8BFA )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $46 PODWATUJ to this CFA. Asks )
( CZYM? and requires inventory ID argument 1. When state )
( argument 2 is clear, stores 3 there and consumes the )
( selected slot. Other cases select alternate messages )
( following byte 3. )
AT 8BF4
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B0968B
DOCOL
t.MSG-WITH-WHAT t.ASK-INVENTORY-ITEM t.DUP t.>R t.C@
t.ACTION-ARG1@ t.= t.USE-SCENE-RESOURCES
t.0BRANCH CELL 003A ( -> 8C48 )
t.ACTION-ARG2@ t.PUZZLE-STATE@
t.0BRANCH CELL 0010 ( -> 8C26 )
t.3 t.ACTION-BYTE-ADDR t.1 t.SKIP-MESSAGE-GROUPS
t.SHOW-ACTION-FAILURE
t.BRANCH CELL 0020 ( -> 8C44 )
( label 8C26 )
t.3 t.ACTION-ARG2@ t.PUZZLE-STATE! LIT16 0014 t.SOUND-COMMAND!
t.R t.REMOVE-INVENTORY-SLOT t.REDRAW-CURRENT-VIEW
t.CLEAR-TEXT-AREA t.3 t.ACTION-BYTE-ADDR t.SHOW-MESSAGE
t.PRESERVE-MESSAGE-TEXT t.1
( label 8C44 )
t.BRANCH CELL 000C ( -> 8C52 )
( label 8C48 )
t.3 t.ACTION-BYTE-ADDR t.2 t.SKIP-MESSAGE-GROUPS
t.SHOW-ACTION-FAILURE
( label 8C52 )
t.R> t.DROP t.REDRAW-CURRENT-VIEW t.;S
AT 8C5A

( ACT-ON-INCREMENT | NFA 8C5A CFA 8C60 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $47 WLACZ to this CFA. Reveals )
( object argument 1 and increments puzzle-state cell )
( argument 2, with sound $16 and redraw. )
AT 8C5A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B1F48B
DOCOL
LIT8 16 t.SOUND-COMMAND! t.ACTION-ARG1@ t.ADD-CURRENT-OBJECT
t.1 t.ACTION-ARG2@ t.PUZZLE-STATE+! t.REDRAW-CURRENT-VIEW t.1
t.;S
AT 8C77

( ACT-OFF-DECREMENT | NFA 8C77 CFA 8C7D )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $48 WYLACZ to this CFA. Hides )
( object argument 1, decrements puzzle-state cell argument )
( 2, and removes object 3 from room $1C, view zero. )
AT 8C77
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B25A8C
DOCOL
LIT8 16 t.SOUND-COMMAND! t.ACTION-ARG1@
t.REMOVE-CURRENT-OBJECT t.-1 t.ACTION-ARG2@ t.PUZZLE-STATE+!
t.3 LIT16 001C t.0 t.REMOVE-SCENE-OBJECT t.REDRAW-CURRENT-VIEW
t.1 t.;S
AT 8C9E

( ACT-PRESS-TWO-AND-FLAG | NFA 8C9E CFA 8CA4 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $45 NACISNIJ to this CFA. )
( Requires puzzle-state argument 4 equal to 2 and )
( puzzle-state argument 5 nonzero before redrawing and )
( ACT-ANIMATE-OPEN. The two failure cases select )
( first/second messages at byte 6. )
AT 8C9E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B9778C
DOCOL
t.ACTION-ARG4@ t.PUZZLE-STATE@ t.2 t.=
t.0BRANCH CELL 0026 ( -> 8CD6 )
t.ACTION-ARG5@ t.PUZZLE-STATE@
t.0BRANCH CELL 000E ( -> 8CC6 )
t.POP-VIEW t.DROP t.REDRAW-CURRENT-VIEW t.ACT-ANIMATE-OPEN
t.BRANCH CELL 000E ( -> 8CD2 )
( label 8CC6 )
LIT16 0006 t.ACTION-BYTE-ADDR t.1 t.SKIP-MESSAGE-GROUPS
t.SHOW-ACTION-FAILURE
( label 8CD2 )
t.BRANCH CELL 000A ( -> 8CDE )
( label 8CD6 )
LIT16 0006 t.ACTION-BYTE-ADDR t.SHOW-ACTION-FAILURE
( label 8CDE )
t.;S
AT 8CE0

( ACT-INSERT-EITHER-ITEM | NFA 8CE0 CFA 8CE6 )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $4B WLOZ to this CFA. Asks CO? )
( and accepts either inventory ID argument 4 or argument 5. )
( Hides object argument 6, consumes the slot, performs )
( animated opening, waits, then animated closing; failure )
( displays byte-7 text. )
AT 8CE0
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B59E8C
DOCOL
t.MSG-WHAT t.ASK-INVENTORY-ITEM t.DUP t.>R t.C@ t.DUP
t.ACTION-ARG4@ t.= t.SWAP t.ACTION-ARG5@ t.= t.+
t.0BRANCH CELL 0022 ( -> 8D24 )
t.ACTION-ARG6@ t.REMOVE-CURRENT-OBJECT t.16 t.SOUND-COMMAND!
t.R> t.REMOVE-INVENTORY-SLOT t.REDRAW-CURRENT-VIEW t.32
t.PAUSE t.ACT-ANIMATE-OPEN t.DROP t.8 t.PAUSE
t.ACT-ANIMATE-CLOSE
t.BRANCH CELL 000D ( -> 8D2F )
( label 8D24 )
LIT8 07 t.ACTION-BYTE-ADDR t.SHOW-ACTION-FAILURE t.R> t.DROP
( label 8D2F )
t.;S
AT 8D31

( MSG-WHICH | NFA 8D31 CFA 8D37 )
( Inferred descriptive name, not recovered original: The )
( bounded message is JAKIE; used by the final chromosome )
( action to request a typed answer. )
( Stack: -- addr )
( Decoded text: Message lines )
( line 1 $8D3D: JAKIE )
AT 8D31
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C1E08C
DOVAR
BYTES 070001054A414B49452020
AT 8D44

( ACT-CHROMOSOME-ENDING | NFA 8D44 CFA 8D4A )
( Inferred descriptive name, not recovered original: Action )
( dispatch table $75BA maps $4A WPROWADZ CHROMOSOMY to this )
( CFA. Asks JAKIE against the counted answer at byte 1. )
( Match selects disk side 2, loads resource group $16 [22], )
( displays its ending bitmap/text, sends title tune command )
( $50 and runs its animation until a key, then reloads )
( initial state. Failure displays the message after the )
( expected answer. )
AT 8D44
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B4318D
DOCOL
t.CLEAR-TEXT-AREA t.MSG-WHICH t.1 t.ACTION-BYTE-ADDR t.8
t.ASK-CHECKED-QUESTION
t.0BRANCH CELL 0094 ( -> 8DEE )
t.CLEAR-TEXT-AREA t.PAUSE-COLOR-DLI LIT8 21 t.SOUND-COMMAND!
t.64 t.PAUSE LIT8 14 t.SOUND-COMMAND! LIT8 32 t.PAUSE t.8
t.INPUT-STATE t.! t.2 t.REQUIRED-DISK-SIDE t.! LIT8 16
t.LOAD-RESOURCE-GROUP t.0 t.RESOURCE-ADDR t.ADGR t.@ LIT8 50
t.SOUND-COMMAND! t.<MOVE t.RESUME-COLOR-DLI t.1
t.RESOURCE-ADDR LIT16 0006 t.+ t.SHOW-MESSAGE LIT8 FF
LIT16 02FC t.C! t.1 t.ANIMATION-CONTROL t.C! t.0 LIT8 E2 t.C!
( label 8DB7 )
LIT8 E2 t.C@
t.0BRANCH CELL 000F ( -> 8DCD )
t.0 t.16 t.ANIMATE-FORWARD t.0 LIT8 E2 t.C!
( label 8DCD )
LIT16 02FC t.C@ LIT8 FF t.= t.0=_12DE
t.0BRANCH CELL FFDB ( -> 8DB7 )
t.RESTART-SOUND t.1 t.REQUIRED-DISK-SIDE t.!
t.LOAD-INITIAL-STATE t.1
t.BRANCH CELL 000C ( -> 8DF8 )
( label 8DEE )
t.1 t.ACTION-BYTE-ADDR t.COUNT t.+ t.SHOW-ACTION-FAILURE
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
t.TITLE-DISPLAY-DATA t.DLI-COLOR-POINTER t.!
t.GAME-DISPLAY-LIST t.1+ t.ENABLE-DLI-AT LIT16 000D LIT16 0000
t.(DO)
( label 8EB9 )
t.GAME-DISPLAY-LIST LIT16 0030 t.+ t.I t.4 t.* t.+
t.ENABLE-DLI-AT
t.(LOOP) CELL FFEC ( -> 8EB9 )
t.GAME-DISPLAY-LIST LIT16 006D t.+ t.ENABLE-DLI-AT LIT16 403C
t.INSTALL-COLOR-DLI t.;S
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
t.2 t.TITLE-COLORS t.I t.+ t.BYTE+!
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
LIT16 FFFE t.TITLE-COLORS t.I t.+ t.BYTE+!
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
t.2 t.RESOURCE-ADDR t.4 t.+ t.LENGTH-RECORD-ADDR t.;S
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
LIT16 96C8 t.RESOURCE-BASE t.! t.3 t.GAME-UI-MODE t.!
t.INIT-TITLE-DISPLAY t.2 t.PAUSE t.RESTART-SOUND LIT8 50
t.SOUND-COMMAND! t.SHOW-TITLE-PAGES t.RESTORE-DICTIONARY
LIT16 9150 t.RESOURCE-BASE t.! LIT16 7AF2 t.CFA LIT16 1ECE t.!
t.RESTART-SOUND t.0 t.TITLE-LEVELS t.TITLE-COLORS t.3 t.CMOVE
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
