( Klatwa cross compiler for APX Extended fig-Forth 1.1 )
( HEX numbers. Target memory is emitted to 128 byte sectors. )
( Host compiler and target dictionary never overlap. )
HEX
A000 CONSTANT T-BUF
A100 CONSTANT T-DUP
A200 CONSTANT T-LAST
0 VARIABLE T-DRIVE
1 VARIABLE T-SECTOR
0 VARIABLE T-POS
0 VARIABLE T-LOC
0 VARIABLE T-GAME

: T-FLUSH
  T-BUF T-SECTOR @ T-DRIVE @ 0 -DISK
  IF CR ." TARGET DISK ERROR" ABORT THEN
  1 T-SECTOR +! 0 T-POS ! ;

: T-BYTE
  T-BUF T-POS @ + C!
  1 T-POS +!
  T-POS @ 80 = IF T-FLUSH THEN ;

: B, T-BYTE 1 T-LOC +! ;

: W, DUP FF AND B, 0 100 U/ SWAP DROP B, ;
: T-ROOM
  HERE 9F00 U< 0= IF ." HOST DICTIONARY FULL" ABORT THEN ;
: T: <BUILDS , T-ROOM DOES> @ W, ;
: H# BL WORD HERE NUMBER DROP ;
: TARGET H# T: ;
: #16 0F2D W, W, ;
: #8 0F67 W, B, ;
: T-DIGIT
  10 DIGIT 0= IF ." INVALID HEX DIGIT" ABORT THEN ;
: BYTES
  BL WORD HERE COUNT
  DUP 0= OVER 1 AND OR IF ." ODD HEX DATA" ABORT THEN
  0 DO
    DUP I + C@ T-DIGIT 10 *
    OVER I 1+ + C@ T-DIGIT + B,
  2 +LOOP DROP ;
: T-ORG T-LOC ! ;
: T-AT
  T-LOC @ - IF CR ." TARGET ADDRESS ERROR" ABORT THEN ;

: T-FINISH
  T-POS @ IF
    T-GAME @ IF
      T-LAST T-SECTOR @ T-DRIVE @ 1 -DISK
      IF CR ." TARGET READ ERROR" ABORT THEN
      T-LAST T-POS @ + T-BUF T-POS @ +
      80 T-POS @ - CMOVE
    ELSE
      T-BUF T-POS @ + 80 T-POS @ - 0 FILL
    THEN T-FLUSH
  THEN ;

: T-DISK
  T-FINISH T-DRIVE ! 1 T-SECTOR ! 0 T-LOC !
  0 T-GAME ! ;
: GAME-MODE 1 T-GAME ! ;
: RAW-MODE 0 T-GAME ! ;

( T-DISK selects physical Atari drive, e.g. 3 or 4. )
( T-ORG sets the target PC; T-AT checks it without seeking. )
( B, and W, emit target bytes and little endian cells. )
( address T: name defines an executable target CFA emitter. )
( value #16 and value #8 emit target literal instructions. )
( Target has no boot-loader overlap; disk tail is asset data. )
( Its D3 disk must already contain the original game assets. )
