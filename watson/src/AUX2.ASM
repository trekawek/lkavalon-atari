     opt h+

*- zero page -------
*- JEFF's ----------

BYTN EQU $CF
SCRA EQU $D0
NBUF EQU $D2
NOLD EQU $D8
SECL EQU $ED
SECP EQU $EE
FILE EQU $EF
CCOL EQU $E5
CROW EQU $E6
KSTA EQU $D6
OUTW EQU $E9

*- my zero page ----

ZERO EQU $A0

*- A0..A9 ----------

TMP  EQU $A0
STRP EQU $A5
AUX1 EQU $A7
AUX2 EQU $A8
CHAR EQU $A9

*- F0..FF ----------

POSI EQU $F0
WHER EQU $F2
PATL EQU $F3
MAPP EQU $F4

ILEN EQU $F9
PATM EQU $FA
SP   EQU $FB
TXRG EQU $FD
MPOS EQU $FE
ESCF EQU $FF

*- system ----------

DRVN   EQU $301
CH     EQU $2FC
DCB    EQU $300
DISK   EQU $E453
KDEF   EQU $FB51
TIMER  EQU 542

*;;;;;;;;;;;;;;;;;;;

MEM  EQU $9C00
DIRA EQU $E450
HCON EQU $E450

*;;;;;;;;;;;;;;;;;;;

BUFF EQU $8000

VECT  EQU $8100

****  EQU VECT
CROF  EQU VECT+3
CRON  EQU VECT+6
GETS  EQU VECT+9
INPS  EQU VECT+12
INBU  EQU VECT+15
OUTS  EQU VECT+18
GETB  EQU VECT+21
ATIN  EQU VECT+24
DSPB  EQU VECT+27
DSPD  EQU VECT+30
NXLN  EQU VECT+33
RDOS  EQU VECT+36
XGET  EQU VECT+39
STAT  EQU VECT+42
****  EQU VECT+45
GETC  EQU VECT+48
BELL  EQU VECT+51
****  EQU VECT+54
REST  EQU VECT+57

*-------------------

GEM   EQU $9200

OPEN   EQU GEM+0
CLOSE  EQU GEM+3
PRINT  EQU GEM+6
SPOS   EQU GEM+9

*-------------------

     ORG $6C00

     JMP AUX
     JMP ERROR
     JMP INIT
     JMP GETKEY
     JMP XGET
     JMP DSPB
     JMP DSPD
     JMP SPOS

*- initalization ---

INIT LDX #0
     STX MPOS
     STX MENU
     STX PATM
     LDA #4
     STA PATL
     STA DENS
     LDA <MEM
     STA SP
     LDA >MEM
     STA SP+1
     RTS

FUNB EQU 10 ;;;;;;;;

* auxiliary funct --

AUX  EQU *

*- shft/cntr/ret ? -
     CMP #12+192
     BEQ SCRT
     LDX OUTW
     CPX #2
     BCC *+3
     RTS
     JMP ONEK
*- menu on screen ?
SCRT LDA MENU
     BEQ *+3
     RTS
*-------------------
     LDA #0
     STA ESCF
     INC MENU
     JSR OPEN
     DTA B(04)
     DTA B(02)
     DTA B(14)
     DTA B(10)
*- display menu ----
     LDX #6
     LDY #3
     JSR SPOS
     JSR PRINT
 DTA D'Directory',B($40)
 DTA D'Work mode',B($40)
 DTA D'Search',B($40)
 DTA D'Hex/dec',B($40)
 DTA D'Map disk',B($40)
 DTA D'New drive',B($40)
 DTA D'Fast '
 DTA D'forward',B($40)
 DTA D'Restore '
 DTA D'000',B($40)
 DTA D'Put sector',B($40)
 DTA D'Exit to DOS',B($5B)
*-------------------
MAIN LDX #6
     LDY #10
     JSR SPOS
     LDY #10
     LDA NOLD
     JSR DSPB
     LDA NOLD+1
     JSR DSPD
*-------------------
     JSR MCRO
*- menu kbd service
CRLP CLC
     LDA MPOS
     ADC #11
     JSR GETK
*-------------------
     AND #$3F
     CMP #28
     BNE CUP
*- exit AUX --------
EXIT LDA #0
     STA MENU
     JMP CLOSE
*- cursor up -------
CUP  CMP #14
     BNE CDN
     LDA MPOS
     BEQ CRLP
     JSR COFF
     DEC MPOS
     JMP MAIN
*- cursor down -----
CDN  CMP #15
     BNE OTHR
     LDA MPOS
     CMP #FUNB-1
     BEQ CRLP
     JSR COFF
     INC MPOS
     JMP MAIN
*- other keys ------
OTHR EQU *
     JSR ONEK
     BCS CRLP
     LDA ESCF
     BNE EXIT
     JSR MCRO
     JMP MAIN ; JMP

MENU DTA B(0)

*- one key functions
ONEK EQU *

     AND #$3F
     TAX
     LDA KDEF,X
*-------------------
     TAY
     LDX #FUNB-1
KEYS CMP ONKC,X
     BEQ FUFN
     DEX
     BPL KEYS
     BMI EXEC ; JMP
*-------------------
FUFN EQU *
     LDA MENU
     BEQ BYON
*-------------------
     TXA
     PHA
     JSR COFF
     PLA
     STA MPOS
     JSR MCRO
     JMP BYON+2 ; !!!!
*-------------------
BYON STX MPOS ; ; !!!!
     LDY #$9B
*- execute aux -----
EXEC CPY #$9B
     BEQ *+4
     SEC
     RTS
*-------------------
     LDA MPOS
     ASL @
     TAX
     LDA ATAB,X
     STA CALL+1
     LDA ATAB+1,X
     STA CALL+2
*-------------------
CALL JSR CALL
*-------------------
     CLC
     RTS

*-------------------

ONKC DTA C'dwsh'
     DTA C'mnfr'
     DTA C'pe'

* calculate position

CPOS TAX
     BEQ CPCL
CALC JSR NXLN
     DEX
     BNE CALC
CPCL RTS

*- cursor position -

CRPO LDX #5
     LDY #3
     JSR SPOS
     LDA MPOS
     JMP CPOS

*- cursor on -------

MCRO EQU *

     JSR CRPO
     LDY #13
     LDA #$19+64
     STA (SCRA),Y
     DEY
IBLP LDA (SCRA),Y
     EOR #$80
     STA (SCRA),Y
     DEY
     BNE IBLP
     LDA #$19+192
     STA (SCRA),Y
     RTS

*- cursor off ------

COFF EQU *

     JSR CRPO
     LDY #13
     LDA #0
     STA (SCRA),Y
     TAY
     STA (SCRA),Y
     LDY #12
CRFL LDA (SCRA),Y
     EOR #$80
     STA (SCRA),Y
     DEY
     BNE CRFL
     RTS

********************

ATAB EQU *

     DTA A(DIR)
     DTA A(WMOD)
     DTA A(SERC)
     DTA A(CONV)
     DTA A(MAP)
     DTA A(NEWD)
     DTA A(FF)
     DTA A(RESS)
     DTA A(OUTS)
     DTA A(EDOS)

********************

*-------------------

RESS EQU *

     LDA #1
     STA ESCF
     JMP REST

* hex/dec conversion

CONV EQU *

     JSR OPEN
     DTA B(12)
     DTA B(07)
     DTA B(11)
     DTA B(01)
     JSR PRINT
 DTA D'$0000=00000',B($5B)

     JSR HCON
     JMP CLOSE

*- exit to DOS -----

EDOS LDA MENU
     BEQ *+5
     JSR CLOSE
     JMP RDOS

TSEC DTA A(0)

*- disk map --------
MAP  EQU *

     LDA NBUF
     STA TSEC
     LDA NBUF+1
     STA TSEC+1
*-------------------
     LDX #$7F
COTB LDA BUFF,X
     STA MAPA+1040,X
     DEX
     BPL COTB
*- test disk density
     JSR STAT
     BPL *+3
     RTS
     AND #$80
     CMP DENS
     STA DENS
     BEQ SDEN
     JSR CLAR
*-------------------
SDEN LDA DENS
     BMI DD
*- single density --
     LDA <$2D0
     STA MAXS
     LDA >$2D0
     STA MAXS+1
     LDA #18
     STA TLEN
     STA MAPW+5
     LDA #10
     STA MAPW+3
     BNE MAPW
*- double density --
DD   LDA <$410
     STA MAXS
     LDA >$410
     STA MAXS+1
     LDA #26
     STA TLEN
     STA MAPW+5
     LDA #6
     STA MAPW+3
*-------------------
MAPW JSR OPEN
     DTA B(05) ; +3
     DTA B(05)
     DTA B(00) ; +5
     DTA B(12)
MAP2 LDX #11
     LDY #17
     JSR SPOS
     JSR PRINT
     DTA D'sector=0'
     DTA D'00 file='
     DTA D'00',B($5B)
MLOP JSR INFL
     JSR DSPM
     JSR SETP
     LDA #10
     JSR GETKEY
*-------------------
     AND #$3F
     LDX #7
MLO1 CMP MTAB,X
     BEQ PERF
     DEX
     BPL MLO1
     BMI MLOP ; JMP
*-------------------
PERF TXA
     ASL @
     TAX
     LDA MPRC,X
     STA MCLL+1
     LDA MPRC+1,X
     STA MCLL+2
*-------------------
MCLL JSR MCLL
     JMP MLOP

*- cursor right ----

MRHT EQU *

     LDX XPOS
     INX
     CPX TLEN
     BEQ MRT1
     STX XPOS
     RTS
*-------------------
MRT1 CLC
     LDA YPOS
     ADC BOTL
     CMP #39
     BNE *+3
     RTS
     LDA #0
     STA XPOS
     JMP MDWN

*- cursor left -----

MLFT EQU *

     LDA XPOS
     BEQ MLF1
     DEC XPOS
     RTS
*-------------------
MLF1 LDA YPOS
     BNE MLF2
     LDA BOTL
     BNE *+3
     RTS
*-------------------
MLF2 LDX TLEN
     DEX
     STX XPOS
     JMP MUP

*- cursor down -----

MDWN EQU *

     LDA YPOS
     CMP #9
     BEQ MDW1
*-------------------
     INC YPOS
     RTS
*-------------------
MDW1 LDA BOTL
     CMP #30
     BEQ *+5
*-------------------
     INC BOTL
     JMP DSPM

*- cursor up -------

MUP  EQU *

     LDA YPOS
     BEQ MUP1
     DEC YPOS
     RTS
*-------------------
MUP1 LDA BOTL
     BEQ *+5
     DEC BOTL
     RTS

*- page up ---------

PGUP EQU *

     SEC
     LDA BOTL
     SBC #10
     BMI PGU1
     STA BOTL
     RTS
*-------------------
PGU1 LDA #0
     STA BOTL
     RTS

*- page down -------

PGDN EQU *

     CLC
     LDA BOTL
     ADC #10
     CMP #40
     BCS PGD1
     STA BOTL
     RTS
*-------------------
PGD1 LDA #30
     STA BOTL
     RTS


*- exit map --------

EMAP PLA
     PLA
*-------------------
     LDX #$7F
COFB LDA MAPA+1040,X
     STA BUFF,X
     DEX
     BPL COFB
     LDA TSEC
     STA NBUF
     LDA TSEC+1
     STA NBUF+1
     JMP CLOSE

*-------------------

MTAB EQU *

     DTA B(12) ; ret
     DTA B(28) ; esc
     DTA B(14) ; up
     DTA B(15) ; dwn
     DTA B(06) ; lft
     DTA B(07) ; rgt
     DTA B(54) ; <
     DTA B(55) ; >

*-------------------

MPRC EQU *

     DTA A(RMAP)
     DTA A(EMAP)
     DTA A(MUP)
     DTA A(MDWN)
     DTA A(MLFT)
     DTA A(MRHT)
     DTA A(PGUP)
     DTA A(PGDN)

*- display map -----

DSPM EQU *

     LDX MAPW+3
     INX
     LDY #6
     JSR SPOS
*-------------------
     LDA <MAPA
     STA MAPP
     LDA >MAPA
     STA MAPP+1
*-------------------
     JSR MULB
*- display 10 tracks
DSM  LDX #10
*- display track ---
DSPL LDY TLEN
     DEY
DSL1 LDA (MAPP),Y
     JSR SETS
     STA (SCRA),Y
     DEY
     BPL DSL1
*-------------------
     JSR ADTL
     JSR NXLN
     DEX
     BNE DSPL
     RTS


*- info line -------

INFL LDX #11
     LDY #17
     JSR SPOS
     JSR SECN
     LDY #9
     LDA MAPP
     JSR DSPB
     LDA MAPP+1
     JSR DSPD
*-------------------
     CLC
     LDA MAPP
     ADC <MAPA-1
     STA MAPP
     LDA MAPP+1
     ADC >MAPA-1
     STA MAPP+1
     LDY #17
     LDX #0
     LDA (MAPP,X)
*-------------------
     BMI QUES
     BEQ QUES
     AND #%00111111
     STA CFIL
     JMP DSPB
QUES LDA #'?'-32
     STA (SCRA),Y
     DEY
     STA (SCRA),Y
     LDA #255
     STA CFIL
     RTS

*- set map cursor --

SETP EQU *

     SEC
     LDA XPOS
     ADC MAPW+3
     STA CCOL
     CLC
     LDA YPOS
     ADC #6
     STA CROW
RTSA RTS

* calculate sector#

SECN EQU *

     LDA #0
     STA MAPP
     STA MAPP+1
*-------------------
     CLC
     LDA BOTL
     ADC YPOS
     TAX
     JSR MULS
*-------------------
     SEC ; +1
     LDA MAPP
     ADC XPOS
     STA MAPP
     BCC *+4
     INC MAPP+1
     RTS

*-------------------
MULB EQU *
     LDX BOTL
MULS BEQ MUL2
MUL1 JSR ADTL
     DEX
     BNE MUL1
MUL2 RTS
*-------------------
ADTL CLC
     LDA MAPP
     ADC TLEN
     STA MAPP
     BCC *+4
     INC MAPP+1
     RTS

*- clear map area --

CLAR EQU *

     LDA #%11000000
     LDX #0
CLR1 STA MAPA,X
     STA MAPA+256,X
     STA MAPA+512,X
     STA MAPA+768,X
     DEX
     BNE CLR1
*-------------------
     LDX #15
CLR2 STA MAPA+1024,X
     DEX
     BPL CLR2
     INX
     STX XPOS
     STX YPOS
     RTS

*- read map --------

RMAP EQU *

     JSR CLAR
     JSR DSPM
     LDX #11
     LDY #17
     JSR SPOS
     JSR PRINT
     DTA D'Press ES'
     DTA D'C to sto'
     DTA D'p.',B($5B)
     LDA #255
     STA CH
     STA STPE
     STA CFIL
*-------------------
     JSR SECN
     CLC
     LDA MAPP
     STA NBUF
     ADC <MAPA-1
     STA STRP
     LDA MAPP+1
     STA NBUF+1
     ADC >MAPA-1
     STA STRP+1
*- read sector -----
REDL JSR INBU
     LDA DCB+3
     BPL CHKC
     CMP #$80
     BEQ RABR
*- bad sector ------
     LDA #$80
     BMI RMA1
* empty  %00000000
* bad    %10000000
* full   %01??????
*- check contens ---
CHKC LDY #$7E
TSTL LDA BUFF,Y
     BNE FULL
     DEY
     BPL TSTL
*- empty sector ----
     LDA #0
     BEQ RMA1
*- full sector -----
FULL LDA BUFF+125
     LSR @
     LSR @
     ORA #%01000000
*-------------------
RMA1 LDY #0
     STA (STRP),Y
     STA AUX1
     INC STRP
     BNE *+4
     INC STRP+1
*- last sector ? ---
     LDA NBUF
     CMP MAXS
     BNE INCN
     LDA NBUF+1
     CMP MAXS+1
     BNE INCN
*-------------------
RABR LDX #255
     STX CH
     INX
     STX STPE
     PLA
     PLA
     JMP MAP2
*- inc sector# -----
INCN INC NBUF
     BNE *+4
     INC NBUF+1
*-------------------
     LDA CH
     CMP #28
     BEQ RABR
*-------------------
     JSR SECR
     LDA AUX1
     JSR SETS
     LDY #0
     STA (SCRA),Y
*-------------------
     JSR MRHT
     JSR SECR
     LDY #0
     LDA (SCRA),Y
     EOR #$80
     STA (SCRA),Y
     JMP REDL
*-------------------
SECR SEC
     LDA XPOS
     ADC MAPW+3
     TAX
     CLC
     LDA YPOS
     ADC #6
     TAY
     JMP SPOS

*- choose map symbol

SETS BNE *+5
     LDA #'.'-32
     RTS
     BPL NBAD
     AND #%01000000
     BNE *+5
     LDA #'!'-32
     RTS
     LDA #'?'-32
     RTS
NBAD AND #%00111111
     CMP CFIL
     BNE *+5
     LDA #'o'
     RTS
     LDA #$14+64
     RTS

*-------------------

MAXS DTA A(0)
DENS DTA B(0)
TLEN DTA B(0)
CFIL DTA B(0)
BOTL DTA B(0)
XPOS DTA B(0)
YPOS DTA B(0)

*- search ----------

PATT DTA C'Chaos   '

SERC EQU *

     JSR OPEN
     DTA B(08)
     DTA B(06)
     DTA B(25)
     DTA B(03)
     JSR PRINT
    DTA D'    hex:',B($40)
    DTA D'atASCII:',B($40)
    DTA D' intern:',B($5B)
*-------------------
GTPT LDA PATL
     STA ILEN
*-------------------
     LDX #7
COPP LDA PATT,X
     STA IBUF,X
     DEX
     BPL COPP
*- enter pattern ---
LOOP JSR DSPT
     JSR SETCUR
GETP LDA #7
     JSR GETKEY
*-------------------
     CMP #52+64
     BNE *+5
     JMP DELL
*-------------------
     CMP #14+128
     BNE *+5
     JMP U
*-------------------
     CMP #15+128
     BNE *+5
     JMP D
*-------------------
     AND #$3F
     CMP #28
     BNE *+5
     JMP CLOSE
*-------------------
     CMP #12
     BNE *+5
     JMP GO
*-------------------
     CMP #52
     BNE *+5
     JMP DEL
*-------------------
     LDA CHAR
     LDX PATM
     BEQ HEX
     CPX #1
     BEQ *+5
     JSR ATIN
*-------------------
     LDY CCOL
     CPY #17+8
     BEQ GETP
     TAX
     SEC
     LDA CCOL
     SBC #17
     TAY
     TXA
     STA IBUF,Y
     INC ILEN
     JMP LOOP
*-------------------
HEX  AND #$7F
     JSR XGET
     BCS GETP
     TAX
     LDY CCOL
     CPY #17+16
     BNE *+5
     JMP GETP
*-------------------
     SEC
     TYA
     SBC #17
     BEQ WFND
     LSR @
     BCC WFND
*-------------------
     TXA
     ASL AUX2
     ASL AUX2
     ASL AUX2
     ASL AUX2
     ORA AUX2
     INC ILEN
     LDY ILEN
     STA IBUF,Y
     JMP LOOP
*-------------------
WFND STX AUX2
     LDX #0
     LDY #7
     JSR SPOS
     LDA AUX2
     LDY CCOL
     JSR DSPD
     INC CCOL
     JMP GETP

*- cursor down -----

D    EQU *

     LDA PATM
     CMP #2
     BEQ *+4
     INC PATM
     JMP LOOP

*- del whole line --

DELL EQU *

     LDA #$FF
     STA ILEN
     JMP LOOP


*- cursor up -------

U    EQU *

     LDA PATM
     BEQ *+4
     DEC PATM
     JMP LOOP

*- delete char -----

DEL  EQU *

     LDA PATM
     BEQ HDEL
     LDA ILEN
     BMI *+4
     DEC ILEN
LZR  JMP LOOP
HDEL LDA CCOL
     CMP #17
     BEQ LZR
     SEC
     SBC #17
     LSR @
     BCC QPKA
     DEC CCOL
     JSR LOOP
QPKA DEC ILEN
     JMP LOOP
*-------------------
GO   EQU *
     LDA PATM
     BNE ATAE
*-------------------
     SEC
     LDA CCOL
     SBC #$11
     BNE *+5
     JMP GETP
*-------------------
     LSR @
     BCC ATAE
     JMP GETP
*-------------------
ATAE LDX ILEN
     BPL *+5
     JMP LOOP
     STX PATL
CIBU LDA IBUF,X
     STA PATT,X
     DEX
     BPL CIBU

********************
*   search loop    *
********************

SCON EQU *
     LDA BYTN
     STA AUX2
*-------------------
     JSR INBU
     BPL *+5
     JMP SERR
*-------------------
     LDA AUX2
     STA SECP
SRCO LDA #$FF
     STA CH
*-------------------
SRLP LDA CH
     CMP #28
     BEQ SECA
*-------------------
     JSR GETB
     BPL *+5
SECA JMP SERR
     CMP PATT
     BNE SRLP
*-------------------
FFND LDA NBUF
     STA POSI
     LDA NBUF+1
     STA POSI+1
     LDA SECP
     STA WHER
     LDX PATL
     BEQ FOUN
*-------------------
     LDX #1
     STX AUX2
NXLP JSR GETB
     BPL *+5
     JMP SERR
     LDX AUX2
     CMP PATT,X
     BNE OBSK
     INC AUX2
     LDA PATL
     CMP AUX2
     BMI FOUN
     BPL NXLP
*-------------------
OBSK JSR CMP
     BPL *+5
     JMP SERR
*-------------------
GOON LDX WHER
     STX SECP
     JMP SRLP
*-------------------
FOUN EQU *
     LDA #0
     STA AUX2
     JSR OPEN
     DTA B(15)
     DTA B(10)
     DTA B(13)
     DTA B(03)
     JSR PRINT
     DTA D'pattern '
     DTA D'found',B($5B)
*-------------------
     JSR NXLN
     JSR NXLN
*EDI LDX #16
*    LDY #13
*    JSR SPOS
PEDI JSR PRINT
     DTA B($D9),D'edit'*
     DTA B($59),D' '
     DTA D' cont ',B($5B)
ASCO LDA #8
     JSR GETK
     AND #$3F
     CMP #28
     BNE OTEC
     JSR CLOSE
     JMP SERR
*-------------------
OTEC CMP #6
     BEQ EDIT
     CMP #7
     BEQ CONT
     CMP #42 ; E
     BEQ GOED
     CMP #18 ; C
     BEQ GOCO
     CMP #12
     BNE ASCO
*-------------------
     LDA AUX2
     AND #1
     BEQ GOED
*- cont searching --
GOCO EQU *
     JSR CMP
     BPL *+5
     JMP SERR
*-------------------
     LDA WHER
     STA SECP
     JSR CLOSE
     JMP SRCO
*-------------------
EDIT LDA AUX2
     AND #1
     BEQ ASCO
     INC AUX2
     JMP PEDI
*-------------------
CONT LDA AUX2
     AND #1
     BNE ASCO
     INC AUX2
     JSR PRINT
     DTA D' edit  '
     DTA B($D9),D'cont'*
     DTA B($59),B($5B)
     JMP ASCO
*- go to editor ----
GOED EQU *
     JSR CMP
     BPL *+5
     JMP SERR
*-------------------
     LDX WHER
     STX SECP
     DEX
     STX BYTN
     LDA #1
     STA ESCF
     JSR CLOSE
SERR JMP CLOSE
*-------------------
CMP  EQU *
     LDA POSI
     CMP NBUF
     BNE SCR
     LDA POSI+1
     CMP NBUF+1
     BNE SCR
     LDA #1
     RTS
SCR  LDA POSI
     STA NBUF
     LDA POSI+1
     STA NBUF+1
     JMP INBU

*- set patt cursor -

SETCUR EQU *

     LDA #17
     STA CCOL
     LDA #7
     STA CROW
     LDA PATM
     BEQ LFBS
     CMP #1
     BEQ *+4
     INC CROW
     INC CROW
*-------------------
LFBS LDA ILEN
     BPL CHRM
     RTS
*-------------------
CHRM LDA PATM
     BEQ HSET
     SEC ; +1
     LDA ILEN
     ADC CCOL
     STA CCOL
     RTS
*-------------------
HSET LDA ILEN
     ASL @
     SEC ; +1
     ADC CCOL
     TAX
     INX
     STX CCOL
     RTS

*- display patt ----

DSPT EQU *

     LDX #17
     LDY #7
     JSR SPOS
     LDA 20
     CMP 20
     BEQ *-2
     LDX #3
CPTB LDA #0
     LDY #15
     STA (SCRA),Y
     DEY
     BPL *-3
     JSR NXLN
     DEX
     BNE CPTB
*-------------------
     LDA ILEN
     BPL *+3
     RTS
     LDX #17
     LDY #7
     JSR SPOS
*- hex -------------
     LDA ILEN
     ASL @
     TAY
     INY
     LDX ILEN
HXLP LDA IBUF,X
     JSR DSPB
     DEX
     BPL HXLP
     JSR NXLN
*- atascii ---------
     LDY ILEN
ATLP LDA IBUF,Y
     JSR ATIN
     STA (SCRA),Y
     DEY
     BPL ATLP
     JSR NXLN
*- internal --------
     LDY ILEN
INLP LDA IBUF,Y
     STA (SCRA),Y
     DEY
     BPL INLP
     RTS

IBUF DTA D'        '

*- directory -------

DIR  EQU *

     JSR OPEN
     DTA B(05)
     DTA B(03)
     DTA B(27)
     DTA B(16)
     JSR DIRA
     JMP CLOSE

*- new drive -------

NEWD EQU *

     JSR OPEN
     DTA B(11)
     DTA B(09)
     DTA B(05)
     DTA B(06)
     LDX DRVN
     DEX
     STX AUX1
     JSR PRINT
     DTA D'drive',B($40)
     DTA D'     ',B($40)
     DTA D'  1',B($40)
     DTA D'  2',B($40)
     DTA D'  3',B($40)
     DTA D'  4',B($5B)
DCDN LDX #12
     LDY #12
     JSR SPOS
     LDA AUX1
     JSR CPOS
     JSR DCDR
*-------------------
GDRN LDA #22
     JSR GETK
     AND #$3F
     CMP #28
     BNE NEND
     JMP CLOSE
*-------------------
NEND CMP #12
     BNE DCMO
OKDN LDX AUX1
     INX
     STX DRVN
     JMP CLOSE
*-------------------
DCMO CMP #14
     BNE DRDW
     LDA AUX1
     BEQ GDRN
     JSR DCDR
     DEC AUX1
     JMP DCDN
*-------------------
DRDW CMP #15
     BNE ONET
     LDA AUX1
     CMP #3
     BEQ GDRN
     JSR DCDR
     INC AUX1
     BNE DCDN ; JMP
*-------------------
DCDR LDY #4
     LDA (SCRA),Y
     EOR #$80
     STA (SCRA),Y
     DEY
     BPL DCDR+2
     RTS
*-------------------
ONET SEC
     LDA CHAR
     SBC #'1'
     CMP #4
     BCS GDRN
     STA AUX1
     JMP OKDN

*- work mode -------

WMOD EQU *

     LDA FILE
     EOR #$FF
     STA FILE
*-------------------
     JMP INBU

*- fast forward ----

FF   EQU *

     JSR OPEN
     DTA B(11)
     DTA B(10)
     DTA B(11)
     DTA B(01)
     JSR PRINT
     DTA D'amount=',B($5B)
*-------------------
     LDA #8+11
     STA CCOL
     LDA #0
     STA AUX1
     STA AUX2
     LDA #11
     STA CROW
*- get amount ------
GAML JSR DSPA
     LDA #9
     JSR GETKEY
     AND #$3F
*-------------------
     CMP #33
     BEQ MCRT
     CMP #7
     BEQ MCRT
*-------------------
     CMP #28
     BNE *+5
*-------------------
     JMP FFER
*-------------------
     CMP #12
     BEQ FFEX
*-------------------
     CMP #6
     BEQ FFBS
     CMP #52
     BNE FFGH
*- FF backspace ----
FFBS LDA CCOL
     CMP #8+11
     BNE *+6
     LDA #12+11
     STA CCOL
     DEC CCOL
     BNE GAML ; JMP
*- FF get digit ----
FFGH TAX
     LDA KDEF,X
     JSR XGET
     BCS GAML
     PHA
     LDX #0
     LDA CCOL
     CMP #10+11
     BCS *+3
     INX
     AND #$01
     BEQ EVE
*-------------------
     LDA AUX1,X
     AND #$0F
     STA AUX1,X
     PLA
     ASL @
     ASL @
     ASL @
     ASL @
     ORA AUX1,X
     STA AUX1,X
     JMP MCRT
*-------------------
EVE  LDA AUX1,X
     AND #$F0
     STA AUX1,X
     PLA
     ORA AUX1,X
     STA AUX1,X
MCRT LDA CCOL
     CMP #11+11
     BNE *+6
     LDA #7+11
     STA CCOL
     INC CCOL
     BNE GAML ; JMP
*- perform FF ------
FFEX EQU *
     LDA BYTN
     STA SECP
     LDA #$FF
     STA CH
*- FF loop ---------
SKLP LDA SECP
     CMP SECL
     BCC *+5
     JSR DSPA
*- FF end ? --------
     LDA AUX1
     ORA AUX2
     BEQ SKED
*-------------------
     JSR GETB
     BMI FFER
*-------------------
     LDA AUX1
     BNE *+4
     DEC AUX2
     DEC AUX1
*-------------------
     LDA CH
     CMP #28
     BEQ FFER
     BNE SKLP ; JMP
*-------------------
SKED LDX SECP
     CPX SECL
     BCC NSBO
*-------------------
EEOS JSR GETB
     BMI FFER
     LDX SECP
     DEX
NSBO STX SECP
     STX BYTN
FFQT LDA #1
     STA ESCF
FFER JMP CLOSE
*- display amount --
DSPA EQU *
     LDX #11
     LDY #11
     JSR SPOS
     LDY #11
     LDA AUX1
     JSR DSPB
     LDA AUX2
     JMP DSPB

STPE DTA B(0)

*- error window ----

ERROR EQU *

     LDA STPE
     BEQ *+3
     RTS
     STY DCB+3
     JSR OPEN
     DTA B(15)
     DTA B(13)
     DTA B(15)
     DTA B(03)
*-------------------
     LDA DCB+3
     CMP #$80
     BNE *+5
     JMP UBRK
     CMP #$88
     BNE *+5
     JMP EOF
*-------------------
     JSR PRINT
     DTA D' disk '
     DTA D'error',B($5B)
     LDA DCB+3
     LDY #13
     JSR DSPB
     JSR NXLN
     JSR NXLN
     JSR BELL
*-------------------
     LDX #0
     STX AUX1
     DEX
     STX CH
DAB  JSR PRINT
     DTA B($42)
     DTA D'Abort'*
     DTA B($56),D' '
     DTA D' Retry ',B($5B)
NCKE LDA #4
     JSR GETK
     AND #$3F
     CMP #28 ; ESC
     BEQ QQQQ
     CMP #63 ; A
     BNE *+5
QQQQ JMP ABRT
     CMP #40 ; R
     BEQ RETR
     CMP #12 ; RET
     BEQ WHIH
     CMP #6 ; ←
     BEQ ALF
     CMP #7 ; →
     BNE NCKE
*-------------------
     LDA AUX1
     AND #$01
     BNE NCKE
     INC AUX1
*-------------------
     JSR PRINT
    DTA D' Abort  ',B($42)
     DTA D'Retry'*
     DTA B($56),B($5B)
     JMP NCKE
*-------------------
ALF  LDA AUX1
     AND #$01
     BEQ NCKE
     INC AUX1
     BNE DAB
*-------------------
WHIH LDA AUX1
     AND #1
     BEQ ABRT
*-------------------
RETR JSR CLOSE
     CLC
     RTS
*-------------------
EOF  LDX SECP
     DEX
     STX BYTN
     JSR PRINT
     DTA D'  end of'
     DTA D' file',B($5B)
     JMP OK
*-------------------
UBRK JSR PRINT
     DTA D'  break '
     DTA D'abort',B($5B)
OK   JSR NXLN
     JSR NXLN
     JSR PRINT
     DTA D'      '
     DTA B($D9),D'ok'*
     DTA B($59),B($5B)
     JSR BELL
WKE  LDA #5
     JSR GETK
     AND #$3F
     CMP #8
     BEQ ABRT
     CMP #28
     BEQ ABRT
     CMP #12
     BNE WKE
ABRT JSR CLOSE
     SEC
     RTS

*- get key ---------

GETK EQU *

     JSR GETC
GK   STA CHAR
     TXA
     RTS

GETKEY EQU *

     PHA
     JSR CRON
     PLA
     JSR GETC
     JSR GK
     PHA
     JSR CROF
     PLA
     RTS

*-------------------

MAPA EQU *

     END
