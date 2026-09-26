********************
*  new  fantastic  *
*    WATSON 5.0    *
********************

     opt h+
*--- zero page -----
*--- JEFF's --------

BYTN EQU $CF
DRVN EQU $CE
SCRA EQU $D0
NBUF EQU $D2
SECL EQU $ED
SECP EQU $EE
FILE EQU $EF

*--- my zero page --

SPOS EQU $A0
PATL EQU $A1
EPOS EQU $A2
POSI EQU $A3
WHER EQU $A5
LGTH EQU $A6

* RESERVE $AA-$AF
* FOR DISASSEMBLER

SHFL EQU $B0
INVF EQU $B1
FILN EQU $B3
CHAR EQU $F0
MPOS EQU $F1
ESCF EQU $F2
HLP1 EQU $F3
HLP2 EQU $F4
HLP3 EQU $F5
DENS EQU $F6

STRP EQU $F7
SMEM EQU $F9
TMP  EQU $FB

*--- system --------

CH     EQU $2FC
DCB    EQU $300
CLICK  EQU $F983
BELL   EQU $F556
DISK   EQU $E453
KDEF   EQU $FB51
TIMER  EQU 542

*-------------------

MEM  EQU $9800

*--- from JEFF -----

MBUF EQU $400
BUFF EQU $7E00
VECT EQU $7F80+3

*ROF  EQU VECT+3
*RON  EQU VECT+6
*TAT  EQU VECT+9
*SIO  EQU VECT+12
*TAT  EQU VECT+15
GETS  EQU VECT+18
INPS  EQU VECT+21
OUTS  EQU VECT+24
GETB  EQU VECT+27
CHMD  EQU VECT+30
DSPS  EQU VECT+33
ATIN  EQU VECT+36
DSPB  EQU VECT+39
DSPD  EQU VECT+42
*ELN  EQU VECT+45
*NLN  EQU VECT+48
RDOS  EQU VECT+51
XGET  EQU VECT+54
STAT  EQU VECT+57
*GETCH EQU VECT+60

     ORG VECT

     JMP AUX

*-------------------

     ORG $6C00

* auxiliary funct

AUX  EQU *

     LDA #0
     STA MPOS
     STA ESCF
     JSR OPENW
     LDX #5
     LDY #3
     JSR SETPOS
     JSR PRINT
 DTA D'directory',B($40)
 DTA D'file work',B($40)
 DTA D'disk search',B($40)
 DTA D'display mode'
 DTA B($40)
 DTA D'conversion',B($40)
 DTA D'char set',B($40)
 DTA D'disk map',B($40)
 DTA D'new drive',B($40)
 DTA D'fast forward'
 DTA B($40)
 DTA D'put sector',B($40)
 DTA D'exit to DOS',B($5B)
     JSR DSMOD
MMEN LDX #5
     LDY #3
     JSR SETPOS
     LDA MPOS
     JSR CALC
     LDA #11
     JSR DSSL
WFPK JSR GETK
     AND #$3F
     CMP #28
     BEQ EXIT
     CMP #12
     BEQ EXEC
     CMP #14
     BEQ UP
     CMP #15
     BEQ DOWN
     JMP WFPK
UP   LDA MPOS
     BNE *+5
     JMP WFPK
     JSR COLD
     DEC MPOS
     JMP MMEN
DOWN LDA MPOS
     CMP #10
     BNE *+5
     JMP WFPK
     JSR COLD
     INC MPOS
     JMP MMEN
*- execute function
EXEC LDA MPOS
     ASL @
     TAX
     LDA AVECT,X
     STA STRP
     INX
     LDA AVECT,X
     STA STRP+1
     JSR CALL
     JSR COLD
     LDA ESCF
     BNE EXIT
     JMP MMEN
*- call function ---
CALL JMP (STRP)
*- exit AUX --------
EXIT LDA #0
     JSR CLOSEW
     LDA #$FF
     STA CH
     RTS ; !!! BYE !!!
*- clear old select.
COLD LDX #5
     LDY #3
     JSR SETPOS
     LDA MPOS
     JSR CALC
     LDA #11
     JMP DSSL

* calculate select.
CALC TAX
     BEQ CLEN
     JSR NXLN
     DEX
     JMP CALC+1
CLEN RTS
* display selection
DSSL TAY
     LDA (SCRA),Y
     EOR #$80
     STA (SCRA),Y
     DEY
     BPL DSSL+1
     RTS

*--- vectors -------
AVECT EQU *

     DTA A(DIR) ; 1
     DTA A(CHSM) ; 2
     DTA A(SER) ; 2
     DTA A(DMOD) ; 3
     DTA A(CONV) ; 4
     DTA A(CHSET) ; 5
     DTA A(DMAP) ; 6
     DTA A(NEWD) ; 7
     DTA A(SKIP) ; 8
     DTA A(PUTS) ; 8
     DTA A(RDOS) ; 9
*- fast forward ---

SKIP EQU *

     LDA #7
     STA HLP1
     LDA #0
     STA HLP2
     STA HLP2+1
     LDA #13
     JSR OPENW
     LDX #11
     LDY #13
     JSR SETPOS
     JSR PRINT
     DTA D'amount:'
     DTA D'0000',B($5B)
SLUP JSR DSPA
     LDY HLP1
     JSR GETKEY
     AND #$3F
     CMP #28
     BEQ QIT
     CMP #12
     BNE *+5
     JMP SKP
     CMP #33
     BEQ RTC
     CMP #6
     BEQ LFTC
     CMP #7
     BEQ RTC
     TAX
     LDA KDEF,X
     JSR XGET
     BCS SLUP
     PHA
     LDX #0
     LDA HLP1
     CMP #9
     BCS *+3
     INX
     LDA HLP1
     AND #$01
     BEQ EVE
     LDA HLP2,X
     AND #$0F
     STA HLP2,X
     PLA
     ASL @
     ASL @
     ASL @
     ASL @
     ORA HLP2,X
     STA HLP2,X
     JMP RTC
EVE  LDA HLP2,X
     AND #$F0
     STA HLP2,X
     PLA
     ORA HLP2,X
     STA HLP2,X
     JMP RTC
*-------------------
RTC  LDA HLP1
     CMP #10
     BEQ SLUP
     INC HLP1
     JMP SLUP
LFTC LDA HLP1
     CMP #7
     BEQ SLUP
     DEC HLP1
     JMP SLUP
ULU  LDA #$FF
     STA ESCF
QIT  LDA #13
     JSR CLOSEW
     RTS
*-------------------
SKP  EQU *
     LDA #$FF
     STA 764
     LDA BYTN
     STA SECP
SKLP LDA SECP
     CMP SECL
     BCC *+5
     JSR DSPA
     LDA HLP2
     ORA HLP3
     BEQ UIUU
*-------------------
     LDA HLP2
     BNE *+4
     DEC HLP3
     DEC HLP2
*-------------------
     JSR GETB
     BMI EROR
     LDA 764
     CMP #28
     BEQ QIT
     JMP SKLP
UIUU EQU *
     LDA SECP
     CMP SECL
     BCS TUR
     STA BYTN
     JMP ULU
TUR  JSR GETS
     BMI EROR
     LDA SECL
     BEQ TUR
     JMP ULU
*-------------------
DSPA EQU *
     LDX #11
     LDY #13
     JSR SETPOS
     LDY #10
     LDA HLP2
     JSR DSPB
     LDA HLP3
     JMP DSPB
*-------------------
EROR EQU *
     STY DCB+3
     LDX #11
     LDY #13
     JSR SETPOS
     LDY DCB+3
     CPY #136
     BEQ EOFF
     CPY #$80
     BEQ BRKF
     JSR PRINT
 DTA D'   error   ',B($5B)
TU   JSR TIME
     JMP QIT
EOFF EQU *
     LDX SECP
     DEX
     STX BYTN
     JSR PRINT
 DTA D'end of file',B($5B)
     JMP TU
BRKF JSR PRINT
 DTA D'break abort',B($5B)
     JMP TU

*-------------------
* new fantastic sear
NFSR EQU * ; ch
*-------------------
     LDA #$FF
     STA CH
     JSR CMP
     BCC SRLP
     JSR INPS
     BPL *+5
     JMP FAIL
SRLP LDA CH
     CMP #28
     BNE SER1
     PLA
     PLA
     JMP SEND
SER1 JSR GETB
     BPL *+5
     JMP FAIL
ALA  CMP PATT
     BEQ FFND
     JMP SRLP
*-------------------
FFND LDA NBUF
     STA POSI
     LDA NBUF+1
     STA POSI+1
     LDX SECP
     DEX
     STX WHER
     LDX PATL
     BEQ FOUN
*-------------------
     LDX #01
     STX LGTH
NXLP JSR GETB
     BPL *+5
     JMP FAIL
     LDX LGTH
     CMP PATT,X
     BNE OBSK
     INC LGTH
     LDA PATL
     CMP LGTH
     BMI FOUN
     JMP NXLP
OBSK EQU *
     JSR CMP
     BCC GOON
     LDA POSI
     STA NBUF
     LDA POSI+1
     STA NBUF+1
     JSR INPS
GOON LDX WHER
     INX
     STX SECP
     JMP SRLP
CMP  LDA POSI
     CMP NBUF
     BNE SCR
     LDA POSI+1
     CMP NBUF+1
     BNE SCR
     CLC
     RTS
SCR  SEC
     RTS
*-------------------
FOUN LDA #12
     JSR OPENW
     LDX #11
     LDY #9
     JSR SETPOS
     JSR PRINT
     DTA D'pattern '
     DTA D'found',B($5B)
     LDA #200
     JSR TIME
     LDA CH
     CMP #28
     BNE *+6
     LDA #$FF
     STA ESCF
     JSR CMP
     BCC NENG
     LDA POSI
     STA NBUF
     LDA POSI+1
     STA NBUF+1
     JSR INPS
NENG LDX WHER
     STX BYTN
     INX
     STX SECP
     JMP ENOU
*-------------------
FAIL STY DCB+3
     LDA #12
     JSR OPENW
     LDX #11
     LDY #9
     JSR SETPOS
     LDA DCB+3
     CMP #$88
     BEQ EOF
     CMP #$80
     BEQ BRK
     JSR PRINT
     DTA D'reading'
     DTA D' error',B($5B)
     JMP WIT
BRK  JSR PRINT
     DTA D' break '
     DTA D'abort',B($5B)
     JMP WIT
EOF  EQU *
     LDX SECP
     DEX
     STX BYTN
     JSR PRINT
     DTA D' end of '
     DTA D'file ',B($5B)
WIT  LDA #200
     JSR TIME
     LDA CH
     CMP #28
     BNE *+6
     LDA #$FF
     STA ESCF
ENOU LDA #12
     JSR CLOSEW
     RTS

*--- search menu ---

SER  EQU *

     LDA #0
     STA SPOS
     LDA #9
     JSR OPENW
     LDX #10
     LDY #7
     JSR SETPOS
     JSR PRINT
 DTA D'continue',B($40)
 DTA D'new pattern',B($5B)
SMEG LDX #10
     LDY #7
     JSR SETPOS
     LDA SPOS
     JSR CALC
     LDA #10
     JSR DSSL
SQLP JSR GETK
     AND #$3F
     CMP #28
     BEQ SEND
     CMP #12
     BEQ SSRC
     CMP #14
     BNE MDWN
     LDA SPOS
     BEQ SQLP
     JSR CLOL
     DEC SPOS
     JMP SMEG
MDWN CMP #15
     BNE SQLP
     LDA SPOS
     BNE SQLP
     JSR CLOL
     INC SPOS
     JMP SMEG
SSRC LDA SPOS
     BNE *+7
     LDA PTFG
     BNE SQLP
     LDA SPOS
     ASL @
     TAX
     LDA SVEC,X
     STA STRP
     INX
     LDA SVEC,X
     STA STRP+1
     JSR CALL
     JSR CLOL
     LDA ESCF
     BNE SEND
     JMP SMEG
SEND LDA #9
     JMP CLOSEW
CLOL LDX #10
     LDY #7
     JSR SETPOS
     LDA SPOS
     JSR CALC
     LDA #10
     JMP DSSL

SVEC EQU *
     DTA A(NFSR)
     DTA A(NEW)
     DTA A(CHSM)

*--- enter new patt.

NEW  LDA #0
     STA INVF
     STA SHFL
     STA EPOS
     LDA #11
     JSR OPENW
     LDX #12
     LDY #10
     JSR SETPOS
     JSR PRINT
    DTA D'    hex:',B($40)
    DTA D'atascii:',B($40)
    DTA D' intern:',B($5B)
     LDA PTFG
     BEQ FLA
     LDA #$FF
     STA ILEN
     JSR LOOP+3
     JMP *+6
FLA  JSR GTPT
     LDA #11
     JMP CLOSEW

*-------------------
GTPT LDA PATL
     STA ILEN
     LDX #7
QQ   LDA PATT,X
     STA IBUF,X
     DEX
     BPL QQ
LOOP JSR DSPT
     JSR SETCUR
GETP JSR GETKEY
     STA CHAR
     AND #$3F
     CMP #28
     BNE *+3
     RTS
     CMP #12
     BNE *+5
     JMP RTN
     CMP #52
     BNE *+5
     JMP DEL
     LDA CHAR
     CMP #14+128
     BNE *+5
     JMP U
     CMP #15+128
     BNE *+5
     JMP D
     TYA
     PHA
     JSR GETCH
     TAX
     PLA
     TAY
     TXA
     LDX KOS
     BEQ HEX
     CPX #1
     BEQ *+5
     JSR ATIN
     CPY #8
     BEQ GETP
     STA IBUF,Y
     INC ILEN
     JMP LOOP
HEX  AND #$7F
     JSR XGET
     BCS GETP
     PHA
     CPY #16
     BNE *+6
     PLA
     JMP GETP
     TYA
     BEQ WFND
     LSR @
     BCC WFND
     PLA
     ASL HLP2
     ASL HLP2
     ASL HLP2
     ASL HLP2
     ORA HLP2
     INC ILEN
     LDY ILEN
     STA IBUF,Y
     JMP LOOP
WFND PLA
     STA HLP2
     JSR DSPD
     INY
     INY
     JMP GETP
RTN  EQU *
     LDA KOS
     BEQ HRET
     LDA ILEN
     BPL *+5
     JMP LOOP
XIT  LDA ILEN
     STA PATL
     LDX #7
RCRC LDA IBUF,X
     STA PATT,X
     DEX
     BPL RCRC
     LDA PTFG
     BEQ *+5
     DEC PTFG
     RTS
HRET TYA
     BNE *+5
     JMP GETP
     CPY #1
     BNE *+5
     JMP GETP
     TYA
     LSR @
     BCC XIT
     JMP GETP

PTFG DTA D'!'

*--- delete Char ---

DEL  LDA KOS
     BEQ HDEL
     LDA ILEN
     BMI *+5
     DEC ILEN
LZR  JMP LOOP
HDEL TYA
     BEQ LZR
     LSR @
     BCC QUPKA
     DEY
     LDA #0
     STA (SCRA),Y
     JMP GETP
QUPKA DEC ILEN
     JMP LOOP

*--- cursor down ---

D    EQU *
     LDA KOS
     CMP #2
     BEQ *+5
     INC KOS
     JMP LOOP

*--- cursor up -----

U    EQU *
     LDA KOS
     BEQ *+5
     DEC KOS
     JMP LOOP

*--- get character -

GETCH LDX CH
     LDA KDEF,X
     LDX SHFL
     BNE NORM
     CMP #'a'
     BCC NORM
     CMP #'z'+1
     BCS NORM
     EOR #$20
NORM EQU *
     ORA INVF
     RTS

*--- set cursor ----

SETCUR EQU *

     LDX #20
     LDY #10
     JSR SETPOS
     LDA KOS
     BEQ LFBS
     CMP #1
     BEQ *+5
     JSR NXLN
     JSR NXLN
LFBS LDA ILEN
     BPL *+5
     LDY #0
     RTS
     LDA KOS
     BEQ HSET
     LDY ILEN
     INY
     RTS
HSET LDA ILEN
     ASL @
     TAY
     INY
     INY
     RTS

KOS DTA D' '

*--- disp. pattern -

DSPT EQU *
     LDA SCRA
     PHA
     LDA SCRA+1
     PHA
     TYA
     PHA
     LDX #20
     LDY #10
     JSR SETPOS
     LDA 20
     CMP 20
     BEQ *-2
     JSR PRINT
     DTA D'        '
     DTA D'        '
     DTA B($40),D'       '
     DTA D'       ',B($40)
     DTA D'        '
     DTA D'       ',B($5B)
     LDX #20
     LDY #10
     JSR SETPOS
     LDA ILEN
     BMI EDS
*--- hex -----------
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
*--- atascii -------
     LDY ILEN
     LDX ILEN
ATLP LDA IBUF,X
     JSR ATIN
     STA (SCRA),Y
     DEY
     DEX
     BPL ATLP
     JSR NXLN
*--- internal ------
     LDY ILEN
     LDX ILEN
INLP LDA IBUF,X
     STA (SCRA),Y
     DEY
     DEX
     BPL INLP
EDS  PLA
     TAY
     PLA
     STA SCRA+1
     PLA
     STA SCRA
     RTS

*--- chng.sear.mode

CHSM LDA FILE
     EOR #$FF
     STA FILE
     JSR DSMOD
     JMP INPS

*--- disp.sear.mode

DSMOD EQU *

     LDX #5
     LDY #4
     JSR SETPOS
     LDA FILE
     BEQ DOS
     JSR PRINT
     DTA D'disk',B($5B)
     LDX #21
     LDY #3
     JSR SETPOS
     JSR PRINT
     DTA D'FILE',B($5B)
     JMP TST
DOS  JSR PRINT
     DTA D'file',B($5B)
     LDX #21
     LDY #3
     JSR SETPOS
     JSR PRINT
     DTA D'DISK',B($5B)
TST  LDA MPOS
     CMP #1
     BEQ *+3
     RTS
     LDX #5
     LDY #4
     JSR SETPOS
     LDA #3
     JMP DSSL

*--- pattern buff --

PATT DTA D' chaos  '
IBUF DTA D' chaos  '
ILEN DTA D'!'

*--- put sector ----

PUTS LDA #11
     JSR DSSL
     JSR OUTS
     LDX #5
     LDY #3
     JSR SETPOS
     LDA MPOS
     JSR CALC
     LDA #11
     JMP DSSL

*--- display mode --

DMOD EQU *
     LDA #$FF
     STA ESCF
     JMP CHMD

*--- disk map ------

DMAP EQU *

     LDA BUFF+125
     LSR @
     LSR @
     STA FILN
*-------------------
     JSR SDCB
     LDA NBUF
     PHA
     LDA NBUF+1
     PHA
     JSR STAT
     BPL *+5
     JMP TIMO
     AND #$80
     STA DENS
     JSR RDCB
     LDA <BUFF
     STA DCB+4
     LDA >BUFF
     STA DCB+5
     LDA DENS
     BPL TUTM
     LDA #28
     STA DUPA
     LDA #4
     BNE OPDM
TUTM LDA #20
     STA DUPA
     LDA #5
OPDM JSR OPENW
     LDA #$FF
     STA CH
     LDA #1
     STA NBUF
     LDA #0
     STA NBUF+1
     LDA #4
     STA HLP1
TENT LDA #10
     STA HLP2
     LDA DENS
     BPL *+6
     LDX #3
     BNE *+4
     LDX #7
     LDY #11
     JSR SETPOS
FTLP LDA #4
     STA HLP3
     LDY #2
     LDA NBUF
     JSR DSPB
     LDA NBUF+1
     JSR DSPD
TRKL LDA SCRA
     PHA
     LDA SCRA+1
     PHA
AGAI JSR INPS
     LDA DCB+3
     CMP #$80
     BEQ *+6
     CMP #138
     BNE *+7
     PLA
     PLA
     JMP OOPS
     PLA
     STA SCRA+1
     PLA
     STA SCRA
     LDA CH
     AND #$3F
     CMP #28
     BEQ OOPS
     JSR INCS
     JSR TEST
     LDY HLP3
     STA (SCRA),Y
     INC HLP3
     CPY DUPA
     BNE TRKL
     LDA SCRA
     PHA
     LDA SCRA+1
     PHA
REP  JSR INPS
     LDA DCB+3
     CMP #$80
     BEQ *+6
     CMP #138
     BNE *+7
     PLA
     PLA
     JMP OOPS
     PLA
     STA SCRA+1
     PLA
     STA SCRA
     JSR TEST
     LDY DUPA
     INY
     STA (SCRA),Y
     INY
     INY
     INY
     INY
     LDA NBUF
     JSR DSPB
     LDA NBUF+1
     JSR DSPD
     JSR INCS
     JSR NXLN
     DEC HLP2
     BEQ *+5
     JMP FTLP
     JSR GETK
     CMP #28
     BEQ OOPS
     LDA DENS
     BPL *+6
     LDA #6
     BNE *+4
     LDA #7
     JSR OPENW
     DEC HLP1
     BEQ *+5
     JMP TENT
OOPS LDA DENS
     BPL *+6
     LDA #4
     BNE *+4
     LDA #5
     JSR CLOSEW
TIMO PLA
     STA NBUF+1
     PLA
     STA NBUF
     JMP RDCB
*--- store DCB -----
SDCB LDX #15
     LDA DCB,X
     STA $680,X
     DEX
     BPL SDCB+2
     LDX #$7F
SBLP LDA BUFF,X
     STA MBUF,X
     DEX
     BPL SBLP
     RTS
*--- restore DCB ---
RDCB LDX #15
     LDA $680,X
     STA DCB,X
     DEX
     BPL RDCB+2
     LDX #$7F
RBLP LDA MBUF,X
     STA BUFF,X
     DEX
     BPL RBLP
     RTS
*--- inc sect# -----
INCS INC NBUF
     BNE *+4
     INC NBUF+1
     RTS
*--- full or empty -
TEST LDA DCB+3
     BPL *+5
     LDA #$1F
     RTS
     LDX #$7F
TLP  LDA BUFF,X
     BNE FULL
     DEX
     BPL TLP
     LDA #$0E
     RTS
FULL LDA #$54
*-------------------
     LDX FILE
     BNE *+3
     RTS
* current file sec ?
     TAX
     LDA BUFF+125
     LSR @
     LSR @
     CMP FILN
     BNE *+4
     LDX #$D4 ; 60
     TXA
     RTS

*-------------------

DUPA DTA D' '

*--- directory -----

DIR  EQU *
     LDA #8
     JSR OPENW

     JSR $5000

     LDA #8
     JMP CLOSEW

*--- new drive -----

NEWD EQU *
     LDA DRVN
     STA HLP1
     DEC HLP1
     LDA #1
     JSR OPENW
     LDX #10
     LDY #12
     JSR SETPOS
     JSR PRINT
   DTA D'drive is',B($40)
   DTA D'   1',B($40)
   DTA D'   2',B($40)
   DTA D'   3',B($40)
   DTA D'   4',B($5B)
CLDR LDX #10
     LDY #13
     JSR SETPOS
     LDA HLP1
     JSR CALC
DSD  LDA #7
     JSR DSSL
GETN JSR GETK
     AND #$3F
     CMP #28
     BEQ DESC
     CMP #12
     BEQ DEND
     CMP #15
     BNE DEDR
     LDA HLP1
     CMP #3
     BEQ GETN
     LDA #7
     JSR DSSL
     INC HLP1
     JMP CLDR
DEDR CMP #14
     BNE GETN
     LDA HLP1
     BEQ GETN
     LDA #7
     JSR DSSL
     DEC HLP1
     JMP CLDR
DEND LDA HLP1
     STA DRVN
     INC DRVN
DESC LDA #1
     JSR CLOSEW
     RTS

*--- char set ------

CHSET EQU *
     LDA #2
     JSR OPENW
     LDX #3
     LDY #10
     JSR SETPOS
     LDA #0
     STA HLP1
     STA HLP2
     LDX #7
SMLP LDY #0
SLLP LDA HLP1
     JSR ATIN
     STA (SCRA),Y
     INC HLP1
     INY
     CPY #32
     BNE SLLP
     JSR NXLN
     DEX
     BPL SMLP
     LDX #5
     LDY #19
     JSR SETPOS
     JSR PRINT
 DTA D'atascii: 00'
 DTA D'     '
 DTA D'internal: 00'
 DTA B($5B)
DSPC LDX #5
     LDY #19
     JSR SETPOS
     LDY #10
     LDA HLP2
     JSR DSPB
     LDY #27
     LDA HLP2
     JSR ATIN
     JSR DSPB
     LDX #3
     LDY #10
     JSR SETPOS
     LDA HLP2
     LSR @
     LSR @
     LSR @
     LSR @
     LSR @
     JSR CALC
CLY  LDA HLP2
     AND #$E0
     STA CHAR
     SEC
     LDA HLP2
     SBC CHAR
     TAY
     JSR GETKEY
     AND #$3F
     CMP #12
     BEQ CLCS
     CMP #28
     BEQ CLCS
     CMP #6
     BNE *+7
     DEC HLP2
     JMP DSPC
     CMP #7
     BNE *+7
     INC HLP2
     JMP DSPC
     CMP #14
     BNE *+12
     SEC
     LDA HLP2
     SBC #32
     STA HLP2
     JMP DSPC
     CMP #15
     BEQ *+5
     JMP DSPC
     CLC
     LDA HLP2
     ADC #$20
     STA HLP2
     JMP DSPC
CLCS LDA #2
     JMP CLOSEW

*--- conversion ----

     ICL 'src/DEC.ASM'

*--- windows def ---

WNBAS EQU *

     DTA B(04) ; 0
     DTA B(02)
     DTA A(MEM)
     DTA B(14)
     DTA B(13)
     DTA B(09) ; 1
     DTA B(11)
     DTA A(MEM+200)
     DTA B(10)
     DTA B(07)
     DTA B(02) ; 2
     DTA B(09)
     DTA A(MEM+200)
     DTA B(34)
     DTA B(12)
     DTA B(09) ; 3
     DTA B(08)
     DTA A(MEM+200)
     DTA B(13)
     DTA B(03)
     DTA B(02) ; 4
     DTA B(10)
     DTA A(MEM+200)
     DTA B(36)
     DTA B(12)
     DTA B(06) ; 5
     DTA B(10)
     DTA A(MEM+200)
     DTA B(28)
     DTA B(12)
     DTA B(02) ; 6
     DTA B(10)
     DTA A($D800)
     DTA B(36)
     DTA B(12)
     DTA B(06) ; 7
     DTA B(10)
     DTA A($D800)
     DTA B(28)
     DTA B(12)
     DTA B(05) ; 8
     DTA B(04)
     DTA A(MEM+200)
     DTA B(30)
     DTA B(19)
     DTA B(09) ; 9
     DTA B(06)
     DTA A(MEM+250)
     DTA B(13)
     DTA B(04)
     DTA B(16) ; 10
     DTA B(09)
     DTA A(MEM+200)
     DTA B(08)
     DTA B(03)
     DTA B(11) ; 11
     DTA B(09)
     DTA A(MEM+350)
     DTA B(27)
     DTA B(05)
     DTA B(10) ; 12
     DTA B(08)
     DTA A(MEM+350)
     DTA B(15)
     DTA B(03)
     DTA B(10) ; 13
     DTA B(12)
     DTA A(MEM+200)
     DTA B(13)
     DTA B(3)

*-------------------

     ICL 'src/NEW2.ASM'

*--- wait a while --

TIME EQU *
     LDX #$FF
     STX CH
     STA TIMER
TIML LDX CH
     INX
     BNE RTS
     LDA TIMER
     BNE TIML
RTS  RTS

*-------------------

     END
