

*--- zero page -----

TMPR  EQU $CB
CURS  EQU $CC
APOS  EQU $CD
OLD   EQU $CE
SCUR  EQU $CF
NO    EQU $D0
UPL   EQU $D1
CURD  EQU $D2

SCRA EQU $A0
STRP EQU $A2
FREE EQU $A4
LINE EQU $A6
UPLI EQU $A8
SGNP EQU $AA
OLDC EQU $AC

*--- common --------

PATL  EQU $F0
PATT EQU $F1
PATN  EQU $F3
SPEED EQU $F4
PITCH EQU $F5

*--- system --------

*BELL  EQU $F556
KDEF  EQU $FB51
CIOV  EQU $E456
*CH    EQU $2FC
IOCB  EQU $350
*TIMER EQU 542

*-------------------

DATA EQU $9500

PATB EQU DATA
LENT EQU PATB+1600
SONG EQU LENT+100
DIRB EQU SONG+600

*-------------------

     ORG $2E0
     DTA A(DL)

*-------------------

     ORG $480

     JMP DL

*-------------------

     ORG $2200

BUFF EQU *

    DTA D'         '
    DTA D'         '

TREG DTA D'01234'

*-------------------

DL   EQU *
     LDA <NIET
     STA $2E0
     LDA >NIET
     STA $2E1
*-------------------
     LDX #4
     LDA SCRA,X
     STA TREG,X
     DEX
     BPL DL+12
*
     JSR TOTCLR
*
     JSR CLOSE
     LDA <374
     STA FREE
     LDA >374
     STA FREE+1
     LDA #6
     STA SPEED
     LDA #5
     STA PITCH
     LDA <DLIS
     STA 560
     LDA >DLIS
     STA 561
*    LDA #$8C
*    STA 756
     LDA #34
     STA 559
     LDA #8
     STA OLDC
     STA 709
     LDA #0
     STA 65
     STA APOS
     STA LINE
     STA LINE+1
     STA PATN
     STA OLD
     STA OLDC+1
     STA 710
     STA 712
     LDA 20
     CMP 20
     BEQ *-2
     JSR DSPT
     JSR DSPP
     JSR DSL
*-------------------
     LDA #75
     JSR WAIT
     LDA #0
     JSR MESS
     LDA #50
     JSR WAIT
*-------------------
     TSX
     STX SP
*-------------------
     LDA #16
     STA $2D9
     LDA #2
     STA $2DA
*-------------------
*    LDX #*-DL
*    STA DL,X
*    DEX
*    BNE *-4

     JSR NEWC

DLOO LDA #15
     JSR CLICK
     JSR AUXI
     LDA APOS
     CMP #6
     BNE DLOO

     LDA #12
*    STA 764

*--- main loop -----

MAIN EQU *

     LDA #0
     STA CURS
     JSR DSPP
*-------------------
LOOP LDA #1
     JSR MESS
     JSR DSPT
     JSR DSPC
     JSR GETK
     STA TMP
     CMP #33+192
     BEQ SCSP
     CMP #33+128
     BEQ CLU
     CMP #33+64
     BEQ CLD
     AND #$3F
*-------------------
     CMP #6
     BEQ LT
     CMP #7
     BEQ RT
     LDA TMP
     JSR AUXI
     LDA TMP
     AND #$3F
     JSR NUM
     LDA TMP
     JSR TEST
     JMP LOOP
*-------------------
LT   JSR CRLT
     JMP LOOP
RT   JSR CRRT
     JMP LOOP
*-------------------
CRLT LDA CURS
     BNE NLF
     LDX PATL
     DEX
     STX CURS
     RTS
NLF  DEC CURS
     RTS
*-------------------
CRRT LDX CURS
     INX
     CPX PATL
     BNE NRT
     LDA #0
     STA CURS
     RTS
NRT  INC CURS
COFN RTS
*-------------------
CLU  LDY CURS
     LDA (PATT),Y
     AND #$F0
     STA (PATT),Y
     JMP LOOP
*-------------------
CLD  LDY CURS
     LDA (PATT),Y
     AND #$0F
     STA (PATT),Y
     JMP LOOP
*-------------------
SCSP LDY CURS
     LDA #0
     STA (PATT),Y
     JMP LOOP

*-------------------

CNGC LDX #1
     LDY #12
     JSR POS
     LDA APOS
     JMP CALC
*-------------------
NEWC JSR CNGC
     LDA #16
     JMP DSSL

*--- auxiliary -----

AUXI EQU *

     LDX #9
SSC  CMP SCTA,X
     BEQ SCFN
     DEX
     BPL SSC
     AND #$3F
     CMP #12
     BEQ EXEC
     CMP #15
     BEQ CRDW
     CMP #14
     BEQ *+3
     RTS
*-------------------
     LDA APOS
     BNE *+3
     RTS
     JSR NEWC
     DEC APOS
     JMP NEWC
*-------------------
CRDW LDA APOS
     CMP #9
     BNE *+3
     RTS
     JSR NEWC
     INC APOS
     JMP NEWC
*-------------------
SCFN EQU *
     TXA
     PHA
     JSR NEWC
     PLA
     STA APOS
     JMP EXEC+3
*-------------------
EXEC EQU *
     JSR NEWC
     LDA #$3E
     JSR BIRD
     JSR DSPT
     LDA APOS
     ASL @
     TAX
     LDA VECT,X
     STA STRP
     INX
     LDA VECT,X
     STA STRP+1
     JSR CALL
     PHA
     LDA #0
     JSR BIRD
     PLA
     STA APOS
     JMP NEWC

*-------------------

SP   DTA B(0)

*-------------------

CALL JMP (STRP)

*-------------------

VECT EQU *

     DTA A(STK)
     DTA A(SPD)
     DTA A(PIC)
     DTA A(CPY)
     DTA A(PLAYP)
     DTA A(WRTS)
     DTA A(PLAYS)
     DTA A(FILE)
     DTA A(CLPT)
     DTA A(QUIT)

*-------------------

SCTA EQU *

     DTA B($B9)
     DTA B($AD)
     DTA B($8D)
     DTA B($92)
     DTA B($8A)
     DTA B($AE)
     DTA B($BE)
     DTA B($B8)
     DTA B($A5)
     DTA B($AF)

*--- set length ----

STK  EQU *

     LDA #16
     CMP LENT
     BNE *+4
     LDA #12
     LDX #99
SLEN STA LENT,X
     DEX
     BPL SLEN
     LDA #0
     STA CURS
*-------------------
DSL  LDX #9
     LDY #12
     JSR POS
     LDA LENT
     CMP #16
     BNE DS16
     JSR PRINT
     DTA B($7F)
     DTA B($42)
     DTA B($7E)
     DTA B($5B)
     LDA #4
     RTS
DS16 JSR PRINT
     DTA B($7E)
     DTA B($42)
     DTA B($7F)
     DTA B($5B)
     LDA #4
     RTS

*--- copy old ------

CPY  LDA OLD
     JSR SPAT
     LDY #15
TOBU LDA (PATT),Y
     STA BUFF,Y
     DEY
     BPL TOBU
*-------------------
     LDA PATN
     JSR SPAT
     LDY #15
FROB LDA BUFF,Y
     STA (PATT),Y
     DEY
     BPL FROB
*-------------------
     LDX OLD
     LDA LENT,X
     LDX PATN
     STA LENT,X
     LDA #0
     STA CURS
     LDA #4
     RTS

*--- play pattern --

PLAYP EQU *
     LDA #4
     JSR MESS
     JSR $5D00
     LDA #0
     STA CURS
     LDA 20
     CMP 20
     BEQ *-2
     LDA #255
     STA 764
     LDA #4
     RTS

*--- set speed -----

SPD  LDA #3
     JSR MESS
     JSR DSPP
     JSR GETK
     AND #$3F
     CMP #12
     BEQ XSPD
     CMP #28
     BEQ XSPD
     CMP #15
     BEQ SPDU
     CMP #14
     BEQ SPDD
     JMP SPD
*-------------------
XSPD LDA #4
     RTS
*-------------------
SPDU LDA SPEED
     CMP #34
     BEQ SPD
     INC SPEED
     JMP SPD
*-------------------
SPDD LDA SPEED
     CMP #04
     BEQ SPD
     DEC SPEED
     JMP SPD

*--- set pitch -----

PIC  LDA #3
     JSR MESS
     JSR GETK
     AND #$3F
     CMP #12
     BEQ XPIC
     CMP #28
     BEQ XPIC
     CMP #14
     BEQ PICU
     CMP #15
     BEQ PICD
     JMP PIC
*-------------------
XPIC LDA #4
     RTS
*-------------------
PICU LDA PITCH
     CMP #4
     BEQ PIC
     DEC PITCH
     JSR DSPP
     JMP PIC
*-------------------
PICD LDA PITCH
     CMP #6
     BEQ PIC
     INC PITCH
     JSR DSPP
     JMP PIC

*-- write song------

WRTS EQU *

     LDA #6
     JSR MESS
     LDA LINE
     STA UPLI
     LDA LINE+1
     STA UPLI+1
     LDA #0
     STA SCUR
     JSR CLRW
     JMP MART

*- clear window ----

CLRW LDA #13
     STA TMPR
CLWN LDX #19
     LDY TMPR
     CPY #23
     BNE *+3
     RTS
     JSR POS
     JSR PRINT
 DTA D'            '
 DTA D'       ',B($5B)
     INC TMPR
     JMP CLWN

*-------------------
MART LDX #23
     LDY #14
     JSR POS
     JSR PRINT
 DTA B($51),B($52),B($52),B($52),B($52),B($52),B($57),B($52),B($52),B($52),B($52),B($45)
 DTA B($40)
 DTA D'|line:|    |'
 DTA B($40)
 DTA D'|     |    |'
 DTA B($40)
 DTA B($41),B($52),B($52),B($52),B($52),B($52),B($44),D'    |'
 DTA B($40)
 DTA B($41),B($52),B($52),B($52),B($52),B($52),B($44),D'    |'
 DTA B($40)
 DTA D'|free:|    |'
 DTA B($40)
 DTA D'|     |    |'
 DTA B($40)
 DTA B($5A),B($52),B($52),B($52),B($52),B($52),B($58),B($52),B($52),B($52),B($52),B($43)
 DTA B($5B)
*-------------------
WRN  JSR DSPS
     JSR GETK
     AND #$3F
     CMP #28
     BEQ XIT
*-------------------
     CMP #12
     BNE *+8
     JSR ACP
     JMP WRN
*-------------------
     CMP #52
     BNE *+8
     JSR DEL
     JMP WRN
*-------------------
     CMP #14
     BNE *+8
     JSR CUP
     JMP WRN
*-------------------
     CMP #15
     BNE *+8
     JSR CDN
     JMP WRN
*-------------------
     JSR NUM
     JMP WRN
*-------------------
XIT  EQU *
     LDX #19
     LDY #13
     JSR POS
     JSR PRINT
     DTA D' ',B($40),D' ',B($40),D' ',B($40),D' ',B($40)
     DTA D' ',B($40),D' ',B($40),D' ',B($40),D' ',B($5B)
     LDX #20
     LDY #13
     JSR POS
     JSR PRINT
 DTA D'q  bass dru'
 DTA D'm     ',B($46),D' ',B($40)
 DTA D'w  snare dr'
 DTA D'um    ',B($47),D' ',B($40)
 DTA D'e  middle t'
 DTA D'om    ',B($48),D' ',B($40)
 DTA D'r  low tom '
 DTA D'      ',B($49),D' ',B($40)
 DTA D'a  rimshot '
 DTA D'      ',B($4A),D' ',B($40)
 DTA D's  hi-hat c'
 DTA D'losed ',B($4B),D' ',B($40)
 DTA D'd  hi-hat o'
 DTA D'pen   ',B($4C),D' ',B($40)
 DTA D'f  clap    '
 DTA D'      ',B($4D),D' ',B($40)
 DTA D'           '
 DTA D'        ',B($40)
 DTA D'           '
 DTA D'        ',B($5B)
     LDA #6
     RTS
*-------------------
CUP  EQU *
     LDA LINE
     ORA LINE+1
     BNE *+3
     RTS
     LDA SCUR
     BEQ SCRLD
     DEC SCUR
     JMP DECL
SCRLD EQU *
     JSR DECU
     JMP DECL
*-------------------
CDN  EQU *
     JSR SETS
     LDY #0
     LDA (SGNP),Y
     BPL *+3
     RTS
     LDA SCUR
     CMP #5
     BEQ SCRLU
     INC SCUR
     JMP INCL
SCRLU EQU *
     JSR INCL
     JMP INCU
*-------------------
DSPS CLC
     LDA LINE
     ADC #1
     STA TMP+3
     LDA LINE+1
     ADC #0
     STA TMP+4
     JSR BID2
     LDX #24
     LDY #16
     JSR POS
     LDY #3
     LDA TMP
     JSR DSPB
     LDA TMP+1
     JSR DSPD
*-------------------
     LDA FREE
     STA TMP+3
     LDA FREE+1
     STA TMP+4
     JSR BID2
     LDX #24
     LDY #20
     JSR POS
     LDY #3
     LDA TMP
     JSR DSPB
     LDA TMP+1
     JSR DSPD
*------------------
     LDX #30
     LDY #15
     JSR POS
     LDA #0
     STA TMPR
     CLC
     LDA UPLI
     ADC <SONG
     STA SGNP
     LDA UPLI+1
     ADC >SONG
     STA SGNP+1
     LDA 20
     CMP 20
     BEQ *-2
     JSR PRINT
     DTA D'    ',B($40)
     DTA D'    ',B($40)
     DTA D'    ',B($40)
     DTA D'    ',B($40)
     DTA D'    ',B($40)
     DTA D'    ',B($5B)
     LDX #30
     LDY #15
     JSR POS
SNGL LDY TMPR
     LDA (SGNP),Y
     BMI BRK
     JSR BIDC
     LDY #2
     LDA TMP
     JSR DSPB
     JSR NXLN
     INC TMPR
     LDA TMPR
     CMP #6
     BNE SNGL
     JMP CREA
BRK  JSR PRINT
     DTA D'stop',B($5B)
*-------------------
CREA EQU *
     LDX #30
     LDY #15
     JSR POS
     LDA SCUR
     JSR CALC
     LDA #3
     JMP DSSL
*-------------------
ACP  EQU *
     LDA FREE
     ORA FREE+1
     BNE *+3
     RTS
     JSR SETS
     LDY #0
     LDA (SGNP),Y
     BPL MIDL
     INY
     LDA #$FF
     STA (SGNP),Y
     BMI *+5
MIDL JSR DECO
     JSR SETS
     LDY #0
     LDA PATN
     STA (SGNP),Y
     JSR CDN
     JMP DECF
*-------------------
DEL  EQU *
     JSR SETS
     LDY #0
     LDA (SGNP),Y
     BPL *+3
     RTS
     JSR COMP
     JMP INCF
*-------------------
DECO EQU *
     SEC
     LDA <501
     SBC FREE
     STA STRP
     LDA >501
     SBC FREE+1
     STA STRP+1
*-------------------
     CLC
     LDA <SONG
     ADC STRP
     STA STRP
     LDA >SONG
     ADC STRP+1
     STA STRP+1
*-------------------
     JSR SETS
*-------------------
DCLP LDY #0
     LDA (STRP),Y
     INY
     STA (STRP),Y
     LDA STRP
     BNE *+4
     DEC STRP+1
     DEC STRP
*-------------------
     LDA STRP
     CMP SGNP
     LDA STRP+1
     SBC SGNP+1
     BCS DCLP
     RTS

*-------------------
COMP EQU *
     CLC
     LDA SGNP
     ADC #1
     STA STRP
     LDA SGNP+1
     ADC #0
     STA STRP+1
     LDY #0
CPLL LDA (STRP),Y
     BMI EDEK
     STA (SGNP),Y
     INC SGNP
     BNE *+4
     INC SGNP+1
     INC STRP
     BNE *+4
     INC STRP+1
     JMP CPLL
EDEK STA (SGNP),Y
     RTS

*-------------------
SETS CLC
     LDA LINE
     ADC <SONG
     STA SGNP
     LDA LINE+1
     ADC >SONG
     STA SGNP+1
     RTS
*-------------------
INCL INC LINE
     BNE *+4
     INC LINE+1
     RTS
*-------------------
DECL LDA LINE
     BNE *+4
     DEC LINE+1
     DEC LINE
     RTS
*-------------------
INCU INC UPLI
     BNE *+4
     INC UPLI+1
     RTS
*-------------------
DECU LDA UPLI
     BNE *+4
     DEC UPLI+1
     DEC UPLI
     RTS
*-------------------
INCF INC FREE
     BNE *+4
     INC FREE+1
     RTS
*-------------------
DECF LDA FREE
     BNE *+4
     DEC FREE+1
     DEC FREE
     RTS

*--- play song -----

PLAYS EQU *

     LDA #4
     JSR MESS
     JSR $5D03
     LDA #0
     STA CURS
     JSR DSPT
     JSR DSPP
     LDA 20
     CMP 20
     BEQ *-2
     LDA #255
     STA 764
     LDA #6
     RTS

*
*
*
*    ORG $5000
*
*
*

*--- file operations

FILE EQU *

     LDA #0
     STA CURS
     JSR CLRW
     LDX #19
     LDY #14
     JSR POS

     JSR PRINT

   DTA B($51),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
  DTA B($57),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($45),B($40)
   DTA D'|directory'
  DTA D'|        |',B($40)
   DTA D'|load file'
  DTA D'|        |',B($40)
   DTA D'|save file'
  DTA D'|        |',B($40)
   DTA B($41),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
  DTA B($44),D'        |',B($40)
   DTA D'|         '
  DTA D'|        |',B($40)
   DTA B($5A),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
  DTA B($58),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($43),B($5B)

TUTU LDA #2
     JSR MESS
     JSR DISF
*- select file oper.
     LDX #20
     LDY #15
     JSR POS
     LDA FILC
     JSR CALC
     LDA #8
     JSR DSSL
FOLP JSR GETK
     AND #$3F
     CMP #28
     BEQ FESC
     CMP #12
     BEQ FRET
     CMP #14
     BEQ FUP
     CMP #15
     BEQ FDW
     BNE FOLP
*-------------------
FESC JSR DSL
     JMP XIT
*-------------------
FUP  LDA FILC
     BEQ FOLP
     DEC FILC
     JMP IJSF
*-------------------
FDW  LDA FILC
     CMP #2
     BEQ FOLP
     INC FILC
IJSF LDA #8
     JSR DSSL
     JMP TUTU
*-------------------
FRET LDA #8
     JSR DSSL
     LDA FILC
     BNE STST
     JSR DIR
     LDX #30
     LDY #15
     JSR POS
     JSR PRINT
    DTA D'        ',B($40)
    DTA D'        ',B($40)
    DTA D'        ',B($40)
    DTA D'        ',B($40)
    DTA D'        ',B($5B)
     JMP TUTU
STST CMP #1
     BNE *+8
     JSR LOAD
     JMP TUTU
     JSR SAVE
     JMP TUTU

FILC DTA B(0)

*-------------------

DISF EQU *

     LDX #20
     LDY #19
     JSR POS
     LDA #0
     LDY #8
CLRF STA (SCRA),Y
     DEY
     BPL CLRF
     INY
DFLP LDA FNAM,Y
     CMP #'.'
     BNE *+3
     RTS
     JSR CONV
     JSR ATIN
     STA (SCRA),Y
     INY
     JMP DFLP

*-------------------

EDIF EQU *

     LDA #13
     JSR MESS
     JSR DISF
     LDA #$80
     STA (SCRA),Y
     JSR GETK
     AND #$3F
     CMP #28
     BEQ EFAB
     CMP #12
     BEQ EFDO
     CMP #52
     BEQ EFDE
*-------------------
     TAX
     LDA KDEF,X
     CMP #'0'
     BCC EDIF
     CMP #'9'
     BCC GENT
     SBC #32
     CMP #'A'
     BCC EDIF
     CMP #'Z'
     BCS EDIF
GENT CPY #8
     BEQ EDIF
     STA FNAM,Y
     INY
     BNE ADDC
*-------------------
EFDE CPY #0
     BEQ EDIF
     DEY
ADDC LDA #'.'
     STA FNAM,Y
     BNE EDIF
*-------------------
EFDO INY
     LDX #3
ADEX LDA EXT,X
     STA FNAM,Y
     INY
     DEX
     BPL ADEX
     JSR DISF
     CLC
     RTS
EFAB JSR DISF
     SEC
     RTS

*-------------------

EXT  EQU *

     DTA B($9B)
     DTA C'MRD'

*-------------------

CONV CMP #'A'
     BCC OTHR
     CMP #'Z'
     BCS OTHR
     ADC #32
OTHR RTS

*-------------------

DIRF EQU *

     DTA C'D:*.DRM'
     DTA B($9B)

DENT EQU *

     DTA C'* FILENA'
     DTA C'ME '

*-------------------

DIR  EQU *

     LDA #3
     STA IOCB+2
     LDA <DIRF
     STA IOCB+4
     LDA >DIRF
     STA IOCB+5
     LDA #6
     STA IOCB+10
     LDA #0
     STA IOCB+11
     LDX #$10
     JSR CIOV
     BPL *+5
     JMP OPER
*-------------------
     LDA <DIRB
     STA STRP
     LDA >DIRB
     STA STRP+1
     LDA #0
     STA TMPR
*-------------------
GETD LDA #5
     STA IOCB+2
     LDA <DENT
     STA IOCB+4
     LDA >DENT
     STA IOCB+5
     LDA <11
     STA IOCB+8
     LDA >11
     STA IOCB+9
     LDX #$10
     JSR CIOV
     CPY #137
     BNE ENDC
*-------------------
     INC TMPR
     LDY #7
     LDX #9
COEN LDA DENT,X
     STA (STRP),Y
     DEX
     DEY
     BPL COEN
     CLC
     LDA STRP
     ADC #8
     STA STRP
     BCC *+4
     INC STRP+1
     JMP GETD
*-------------------
ENDC CPY #136
     BEQ *+5
     JMP OPER
*-------------------
     LDA #12
     STA IOCB+2
     LDX #$10
     JSR CIOV
*-------------------
     DEC TMPR

*- disp. directory -

DSDR EQU *
     LDA TMPR
     BNE *+3
     RTS
     STA NO
     LDA #3
     JSR MESS
     LDA #0
     STA UPL
     STA CURD
     STA TMPR
LPPP JSR DSPE
     JSR DURS
     JSR GETK
     AND #$3F
     CMP #28
     BEQ BRKK
     CMP #12
     BEQ RET
     CMP #14
     BEQ UP
     CMP #15
     BEQ DOWN
     JMP LPPP
*- cursor up -------
UP   LDA CURD
     BNE EXIT-2
     LDA UPL
     BEQ EXIT
     DEC UPL
     JMP LPPP
     DEC CURD
EXIT JMP LPPP
*- cursor down -----
DOWN LDX CURD
     INX
     CPX NO
     BEQ EXIT
     LDA CURD
     CMP #4
     BNE INCC
     CLC
     LDA UPL
     ADC #5
     CMP NO
     BEQ EXIT
     INC UPL
     JMP LPPP
INCC INC CURD
     JMP LPPP
*- esc -------------
BRKK EQU *
     JSR DURS
     SEC
     RTS
*- return ----------
RET  EQU *
     CLC
     LDA CURD
     ADC UPL
     JSR CDEN
*-------------------
     LDY #0
SLSL LDA (STRP),Y
     CMP #' '
     BEQ CFBR
     CPY #8
     BEQ CFBR
     STA FNAM,Y
     INY
     BNE SLSL
CFBR LDA #'.'
     STA FNAM,Y
     JSR DISF
     JSR DURS
     CLC
     RTS

*-------------------

DURS LDX #30
     LDY #15
     JSR POS
     LDA CURD
     JSR CALC
     LDA #7
     JMP DSSL

*-------------------

DSPE EQU *
     LDX #30
     LDY #15
     JSR POS
     LDA UPL
     STA TMPR
     LDA NO
     CMP #5
     BCS DUPA-2
     LDX NO
     BNE DUPA
     LDX #5
DUPA JSR DSOE
     DEX
     BNE DUPA
     RTS
DSOE LDA TMPR
     JSR CDEN
     LDY #7
CTSC LDA (STRP),Y
     JSR CONV
     JSR ATIN
     STA (SCRA),Y
     DEY
     BPL CTSC
     INC TMPR
     JMP NXLN

*-------------------

CDEN PHA
     LDA <DIRB
     STA STRP
     LDA >DIRB
     STA STRP+1
     PLA
     TAY
CDEA BNE *+3
     RTS
     CLC
     LDA STRP
     ADC #8
     STA STRP
     BCC *+4
     INC STRP+1
     DEY
     JMP CDEA


*-------------------

FILS DTA C'D:'

FNAM EQU *

     DTA C'.       '
     DTA C'.   '
     DTA B(155)

*-------------------
LOAD EQU *

     JSR EDIF
     BCC *+3
     RTS
     LDA #9
     JSR MESS
     LDA #$FF
     STA $11
     JSR CLOSE
     LDA #4
     JSR OPEN
     BPL *+5
     JMP OPER
*- load header -----
     LDA <HBUF
     STA IOCB+4
     LDA >HBUF
     STA IOCB+5
     LDA <4
     STA IOCB+8
     LDA >4
     STA IOCB+9
     LDA #7
     JSR BUF
     BPL *+5
     JMP OPER
*- check header ----
     LDX #3
CHHL LDA HBUF,X
     CMP HEAD,X
     BNE BADF
     DEX
     BPL CHHL
     BMI CORF
*- bad file --------
BADF LDA #12
     JSR MESS
     JSR $F556
     LDA #250
     JSR WAIT
     JMP CLOSE
*-------------------
CORF LDA <SPEED
     STA IOCB+4
     LDA >SPEED
     STA IOCB+5
     LDA <2
     STA IOCB+8
     LDA >9
     STA IOCB+9
     LDA #7
     JSR BUF
     BPL *+5
     JMP ERROR
*-------------------
     LDA <PATB
     STA IOCB+4
     LDA >PATB
     STA IOCB+5
     LDA <1700
     STA IOCB+8
     LDA >1700
     STA IOCB+9
     LDA #7
     JSR BUF
     BPL *+5
     JMP ERROR
*-------------------
     LDA <FREE
     STA IOCB+4
     LDA >FREE
     STA IOCB+5
     LDA <2
     STA IOCB+8
     LDA >2
     STA IOCB+9
     LDA #7
     JSR BUF
     BPL *+5
     JMP ERROR
*-------------------
     SEC
     LDA <501
     SBC FREE
     STA IOCB+8
     LDA >501
     SBC FREE+1
     STA IOCB+9
     LDA <SONG
     STA IOCB+4
     LDA >SONG
     STA IOCB+5
     LDA #7
     JSR BUF
     BPL *+5
     JMP ERROR
*-------------------
     JSR CLOSE
     LDA #0
     STA LINE
     STA LINE+1
     JSR DSPT
     JSR DSPP
     LDA #28
     STA 764
     RTS

*-------------------

HEAD EQU *

     DTA B($00)
     DTA B($00)
     DTA B($FF)
     DTA B($FF)

HBUF EQU *

     DTA D'1234'

*-------------------
SAVE EQU *

     JSR EDIF
     BCC *+3
     RTS
     LDA #8
     JSR MESS
     LDA #$FF
     STA $11
     JSR CLOSE
     LDA #8
     JSR OPEN
     BPL *+5
     JMP OPER
*- save header -----
     LDA <HEAD
     STA IOCB+4
     LDA >HEAD
     STA IOCB+5
     LDA <4
     STA IOCB+8
     LDA >4
     STA IOCB+9
     LDA #11
     JSR BUF
     BPL *+5
     JMP OPER
*-------------------
     LDA <SPEED
     STA IOCB+4
     LDA >SPEED
     STA IOCB+5
     LDA <2
     STA IOCB+8
     LDA >2
     STA IOCB+9
     LDA #11
     JSR BUF
     BPL *+5
     JMP OPER
*-------------------
     LDA <PATB
     STA IOCB+4
     LDA >PATB
     STA IOCB+5
     LDA <1700
     STA IOCB+8
     LDA >1700
     STA IOCB+9
     LDA #11
     JSR BUF
     BPL *+5
     JMP OPER
*-------------------
     LDA <FREE
     STA IOCB+4
     LDA >FREE
     STA IOCB+5
     LDA <2
     STA IOCB+8
     LDA >2
     STA IOCB+9
     LDA #11
     JSR BUF
     BPL *+5
     JMP OPER
*-------------------
     SEC
     LDA <501
     SBC FREE
     STA IOCB+8
     LDA >501
     SBC FREE+1
     STA IOCB+9
     LDA <SONG
     STA IOCB+4
     LDA >SONG
     STA IOCB+5
     LDA #11
     JSR BUF
     BPL *+5
     JMP OPER
*-------------------
     JSR CLOSE
     LDA #0
     STA LINE
     STA LINE+1
     LDA #28
     STA 764
     RTS
*-------------------
BUF  STA IOCB+2
     LDX #$10
     JMP CIOV
*-------------------
OPEN STA IOCB+10
     LDA #3
     STA IOCB+2
     LDA <FILS
     STA IOCB+4
     LDA >FILS
     STA IOCB+5
     LDA #0
     STA IOCB+11
     LDX #$10
     JMP CIOV
*-------------------
CLOSE EQU *
     LDA #12
     STA IOCB+2
     LDX #$10
     JSR CIOV
     LDX #7
     LDA #0
SILE STA $D200,X
     DEX
     BPL SILE
     LDA #3
     STA $D20F
     LDA #0
     STA $D208
     RTS
*-------------------
ERROR EQU *

     JSR TOTCLR
OPER LDA IOCB+3
     CMP #$80
     BEQ UBRK
     STA TMPR
     JSR CLOSE
     LDA <ER
     STA SCRA
     LDA >ER
     STA SCRA+1
     LDA TMPR
     JSR BIDC
     LDY #22
     LDA TMP
     JSR DSPB
     LDA TMP+1
     JSR DSPD
     LDA #10
     JSR MESS
     JSR $F556
     JSR DSPT
     LDA #250
     JMP WAIT
*-------------------
UBRK LDA #11
     JSR MESS
     JSR CLOSE
     LDA #$FF
     STA 764
     LDA #200
     JMP WAIT

*--- sure ? --------

SURE LDA #7
     JSR MESS
     JSR GETK
     AND #$3F
     TAX
     LDA KDEF,X
     CMP #'y'
     BEQ NIET
     SEC
     RTS
NIET CLC
     RTS

*- clear all -------

CLPT EQU *
     JSR SURE
     BCC *+5
     LDA #4
     RTS
     JSR TOTCLR
     JSR DSPP
     LDA #4
     RTS


*- quit program ----

QUIT JSR SURE
     BCC *+5
     LDA #4
     RTS
     LDA TREG
     STA 560
     LDA TREG+1
     STA 561
     LDA TREG+2
     STA 756
     LDA TREG+3
     STA 709
     LDA TREG+4
     STA 710
     LDX SP
     TXS
     LDA #3
     STA 65
     LDA #20
     STA $2D9
     LDA #3
     STA $2DA
     LDA 20
     CMP 20
     BEQ *-2
     RTS

*-------------------

MESS PHA
     LDX #0
     LDY #1
     JSR POS
     LDA <MESG
     STA STRP
     LDA >MESG
     STA STRP+1
     PLA
     TAX
MSLP BEQ PRMS
     CLC
     LDA STRP
     ADC #40
     STA STRP
     BCC *+4
     INC STRP+1
     DEX
     JMP MSLP
PRMS LDY #39
     LDA (STRP),Y
     STA (SCRA),Y
     DEY
     BPL PRMS+2
     RTS

*-------------------
CLICK EQU *
     PHA
     STA $D200
     LDA #$A1
     STA $D201
     LDA #2
     JSR WAIT
     LDA #0
     STA $D201
     PLA
     RTS

*-------------------


MESG EQU *

* 0
   DTA D'|  coded i'
   DTA D'n1989 by C'
   DTA D'HAOS from '
   DTA D'poland   |'
* 1
   DTA D'|  use ',B($5E),D' ',B($5F)
   DTA D' ',B($5C),D' ',B($5D),D' q w e'
   DTA D' r a s d f'
   DTA D' RETURN  |'
* 2
   DTA D'|     '
   DTA D'use ',B($5C),B($5D),D' the'
   DTA D'n RETURN. '
   DTA D'ESC exit  '
   DTA D'   |'
* 3
   DTA D'|      use'
   DTA D' ',B($5C),B($5D),D' then R'
   DTA D'ETURN or E'
   DTA D'SC       |'
* 4
   DTA D'   press a'
   DTA D'ny key to '
   DTA D'terminate '
   DTA D'playing   '
* 5
   DTA D'|      use'
   DTA D' ',B($5E),B($5F),D' then R'
   DTA D'ETURN or E'
   DTA D'SC       |'
* 6
   DTA D'|  enter n'
   DTA D'umber then'
   DTA D' RETURN. E'
   DTA D'SC exit  |'
* 7
   DTA D'|         '
   DTA D' press Y t'
   DTA D'o confirm '
   DTA D'         |'
* 8
   DTA D'|       sa'
   DTA D'ving patte'
   DTA D'rns and so'
   DTA D'ng...    |'
* 9
   DTA D'|      loa'
   DTA D'ding patte'
   DTA D'rns and so'
   DTA D'ng...    |'
*10
ER DTA D'|         '
   DTA D'   error "'
   DTA D'...       '
   DTA D'         |'
*11
   DTA D'|         '
   DTA D'    break '
   DTA D'abort     '
   DTA D'         |'
*12
   DTA D'|         '
   DTA D'      bad '
   DTA D'file      '
   DTA D'         |'
*13
   DTA D'|         '
   DTA D'   enter f'
   DTA D'ilename   '
   DTA D'         |'

********************

CALC TAX
     BNE *+3
     RTS
     JSR NXLN
     DEX
     JMP CALC+1
     RTS

*-------------------

WAIT STA 542
     LDA 542
     BNE *+3
     RTS
     LDX #$FF
     CPX 764
     BEQ WAIT+3
     STX 764
     RTS

*-------------------

DSSL TAY
     LDA (SCRA),Y
     EOR #$80
     STA (SCRA),Y
     DEY
     BPL DSSL+1
     RTS

*--- ptok ----------

BIRD EQU *

     PHA
     LDX #17
     LDY #12
     JSR POS
     LDX APOS
BRLP BEQ *+9
     JSR NXLN
     DEX
     JMP BRLP
     LDY #0
     PLA
     STA (SCRA),Y
     RTS

*--- disp cursor ---

DSPC EQU *

     LDX #6
     LDY CURS
     BEQ PLOT
     INX
     INX
     DEY
     JMP *-5
*-------------------
PLOT LDY #4
     JSR POS
     JSR CUR
     JMP CONT
*-------------------
CUR  JSR PLTC
     JSR NXLN
     LDY #0
     LDA #$60
     STA (SCRA),Y
     INY
     LDA #$80
     STA (SCRA),Y
     INY
     LDA #$7B
     STA (SCRA),Y
     JSR NXLN
*-------------------
PLTC LDY #0
     LDA #$55
     STA (SCRA),Y
     INY
     LDA (SCRA),Y
     EOR #$80
     STA (SCRA),Y
     INY
     LDA #$54
     STA (SCRA),Y
     RTS
*-------------------
CONT JSR DELN
     JSR DELN
     LDA CURS
     BNE *+5
     JSR BEGP
     LDX CURS
     INX
     CPX PATL
     BNE *+5
     JSR ENDP
     RTS
*-------------------
BEGP LDY #0
     LDA #$56
     STA (SCRA),Y
     JSR NXLN
     JSR NXLN
     LDA #$56
     STA (SCRA),Y
     JSR DELN
     JSR DELN
     RTS
*-------------------
ENDP LDY #2
     LDA #$59
     STA (SCRA),Y
     JSR NXLN
     JSR NXLN
     LDA #$59
     STA (SCRA),Y
     RTS

*--- key testing ---

TEST EQU *

     TAX
     LDA KDEF,X
     LDX #8
SRLP CMP KTAB,X
     BEQ RYKY
     DEX
     BPL SRLP
     RTS
*-------------------
RYKY TXA
     BEQ CLRR
*-------------------
     STA TMP
     LDY CURS
     LDA (PATT),Y
     AND #$0F
     CMP TMP
     BEQ ALRE
     ASL TMP
     ASL TMP
     ASL TMP
     ASL TMP
     LDA (PATT),Y
     AND #$F0
     CMP TMP
     BEQ ALRE
     TXA
*-------------------
     CMP #5
     BPL HIHA
*-------------------
     LDY CURS
     LDA (PATT),Y
     AND #$0F
     BEQ NBAS
     ASL @
     ASL @
     ASL @
     ASL @
     STA (PATT),Y
*-------------------
NBAS LDA (PATT),Y
     AND #$F0
     STA (PATT),Y
     TXA
     ORA (PATT),Y
     STA (PATT),Y
     RTS
*-------------------
HIHA LDY CURS
     LDA (PATT),Y
     AND #$F0
     BEQ NHIH
     LSR @
     LSR @
     LSR @
     LSR @
     STA (PATT),Y
*-------------------
NHIH LDA (PATT),Y
     AND #$0F
     STA (PATT),Y
     TXA
     ASL @
     ASL @
     ASL @
     ASL @
     ORA (PATT),Y
     STA (PATT),Y
ALRE RTS
*-------------------
CLRR LDY CURS
     LDA #0
     STA (PATT),Y
     JMP CRRT

*-------------------

NUM  EQU *

     PHA
     LDA SCRA
     STA STRP
     LDA SCRA+1
     STA STRP+1
     PLA
     JSR NTST
     BCC *+3
     RTS
     PHA
     LDA PATN
     STA SGNP
     PLA
     ASL @
     STA TMPR
     ASL @
     ASL @
     CLC
     ADC TMPR
     STA PATN
     LDX #0
     LDY #9
     JSR POS
     JSR DSPN
     INY
     INY
     LDA #$1F
     STA (SCRA),Y
WFNL JSR GETK
     AND #$3F
     CMP #28
     BEQ ESCP
     JSR NTST
     BCS WFNL
     ADC PATN
     STA PATN
     LDA #0
     STA CURS
     LDA SGNP
     STA OLD
EXN  JSR DSPP
     JSR DSPT
     LDA STRP
     STA SCRA
     LDA STRP+1
     STA SCRA+1
     RTS
ESCP LDA SGNP
     STA PATN
     JMP EXN
*-------------------
NTST TAX
     LDA KDEF,X
     CMP #'0'
     BPL *+4
     SEC
     RTS
     CMP #'9'
     BMI *+4
     SEC
     RTS
     SEC
     SBC #'0'
     CLC
     RTS

*--- disp pattern --

DSPT EQU *

     LDA PATN
     JSR SPAT
     LDA 20
     CMP 20
     BEQ *-2
     JSR CLR
     LDX #6
     LDY #4
     JSR POS
     JSR FRAM
     JSR NXLN
     JSR NXLN
     JSR FRAM
     LDX #7
     LDY #4
     JSR POS
     JSR COPY
     JSR UPLN
     JSR NXLN
     JSR NXLN
     JMP BTLN

*-------------------

UPLN LDX #0
     LDY #0
     LDA BUFF,X
     AND #$0F
     JSR DSP
     BNE UPLN+4
     RTS
*-------------------
BTLN LDX #0
     LDY #0
BTLL LDA BUFF,X
     LSR @
     LSR @
     LSR @
     LSR @
     JSR DSP
     BNE BTLN+4
     RTS
*-------------------
DSP  BNE *+6
     LDA #0
     BEQ ZER
     CLC
     ADC #$45
ZER  STA (SCRA),Y
     INY
     INY
     INX
     CPX PATL
     RTS

*--- copy to buffer

COPY LDY PATL
     DEY
CPLP LDA (PATT),Y
     STA BUFF,Y
     DEY
     BPL CPLP
     RTS

*- frame -----------

FRAM LDY #0
     LDA #$4E
     STA (SCRA),Y
     INY
     LDX PATL
     LDA #0
     STA (SCRA),Y
     INY
     INY
     DEX
     BNE *-5
     LDY #2
     LDX PATL
     DEX
FRLP BEQ *+12
     LDA #$50
     STA (SCRA),Y
     INY
     INY
     DEX
     JMP FRLP
     LDA #$4F
     STA (SCRA),Y
     RTS

*--- disp parameters

DSPP EQU *

     LDX #0
     LDY #9
     JSR POS
*-------------------
     LDY #8
     LDA PITCH
     CMP #5
     BEQ ZERO
     BCS SIX
     LDA #$0B
     STA (SCRA),Y
     JSR ONE
     JMP SPE
SIX  LDA #$0D
     STA (SCRA),Y
     JSR ONE
     JMP SPE
ZERO LDA #0
     STA (SCRA),Y
     INY
     LDA #$10
     STA (SCRA),Y
*-------------------
SPE  LDY #19
     SEC
     LDA #35
     SBC SPEED
     STA TMP
     ASL @
     ADC TMP
*-------------------
     TAX
SPS  DEX
     LDA TTAB,X
     STA (SCRA),Y
     DEY
     CPY #16
     BNE SPS
*-------------------
     LDY #38
     LDA OLD
     JSR BIDC
     LDA TMP
     JSR DSPB
*-------------------
DSPN LDY #30
     LDA PATN
     JSR BIDC
     LDA TMP
     JMP DSPB
*-------------------
ONE  INY
     LDA #$11
     STA (SCRA),Y
     RTS

*--- clear board ---

CLR  LDX #6
     LDY #4
     JSR POS
     JSR DPU
     JSR NXLN
     JSR DPU
     JSR NXLN
DPU  LDY #32
     LDA #0
     STA (SCRA),Y
     DEY
     BPL *-3
     RTS

*--- pattern addr --

SPAT EQU *

     PHA
     STA PATT
     LDA #0
     STA PATT+1
*-------------------
     ASL PATT
     ROL PATT+1
     ASL PATT
     ROL PATT+1
     ASL PATT
     ROL PATT+1
     ASL PATT
     ROL PATT+1
*-------------------
     CLC
     LDA <PATB
     ADC PATT
     STA PATT
     LDA >PATB
     ADC PATT+1
     STA PATT+1
*-------------------
     PLA
     TAX
     LDA LENT,X
     STA PATL
     RTS

*--- total clearing

TOTCLR EQU *

     LDX #0
     TXA
WSLP STA PATB,X
     STA PATB+$100,X
     STA PATB+$200,X
     STA PATB+$300,X
     STA PATB+$400,X
     STA PATB+$500,X
     STA PATB+$600,X
     STA SONG,X
     STA SONG+$100,X
     DEX
     BNE WSLP
*-------------------
     LDA #16
     LDX #99
     STA LENT,X
     DEX
     BPL *-4
*-------------------
     LDA #0
     STA PATN
     STA LINE
     STA LINE+1
     LDA <500
     STA FREE
     LDA >500
     STA FREE+1
     LDA #$FF
     STA SONG
     RTS

*--- print ---------

PRINT EQU *

     PLA
     STA STRP
     PLA
     STA STRP+1
     JSR NXCH
     LDX #0
     LDY #0
PRLP LDA (STRP,X)
     CMP #$40
     BEQ LFD
     CMP #$5B
     BEQ PEND
     STA (SCRA),Y
     INY
     JSR NXCH
     JMP PRLP
LFD  JSR NXLN
     JSR NXCH
     LDY #0
     JMP PRLP
PEND JSR NXCH
     JMP (STRP)
NXCH INC STRP
     BNE *+4
     INC STRP+1
     RTS

*--- position ------

POS  EQU *

     LDA <SCRN
     STA SCRA
     LDA >SCRN
     STA SCRA+1
     TYA
SPLP BEQ YDNE
     JSR NXLN
     DEY
     JMP SPLP
YDNE CLC
     TXA
     ADC SCRA
     STA SCRA
     BCC *+4
JOKE INC SCRA+1
     RTS

*--- next line -----

NXLN CLC
     LDA SCRA
     ADC #40
     STA SCRA
     BCS JOKE
     RTS

DELN SEC
     LDA SCRA
     SBC #40
     STA SCRA
     BCS *+4
     DEC SCRA+1
     RTS

*--- get key -------

GETK LDX #$FF
     CPX 764
     BEQ *-3
     LDA 764
     STX 764
     CMP #39
     BEQ INVE
     JMP CLICK

*-------------------
INVE LDX 710
     LDA 709
     STX 709
     STX 709
     STX OLDC+1
     STA 710
     STA OLDC
     JSR CLICK
     JMP GETK
*-------------------

ATIN AND #$FF
     PHP
     AND #$7F
     CMP #96
     BPL DONE
     SBC #31
     BPL DONE
     ADC #96
DONE PLP
     BPL *+4
     ORA #$80
     RTS

*-------------------

DSPB EQU *

     PHA
     AND #$0F
     JSR DSPD
     PLA
     LSR @
     LSR @
     LSR @
     LSR @
DSPD ORA #$10
     CMP #26
     BCC *+4
     ADC #6
     STA (SCRA),Y
     DEY
     RTS

*-------------------

BIDC STA TMP+3
     LDA #0
     STA TMP+4
BID2 LDA #0
     STA TMP
     STA TMP+1
     STA TMP+2
     LDX #15
     SED
     ASL TMP+3
     ROL TMP+4
     LDA TMP
     ADC TMP
     STA TMP
     LDA TMP+1
     ADC TMP+1
     STA TMP+1
     ROL TMP+2
     DEX
     BPL *-28
     CLD
     RTS

TMP  DTA D'01234'


********************
********************


*-------------------

     ORG $9000

SCRN EQU *

*

     ICL 'ADMSCR.ASM'

*

     ORG $9000+960

DLIS DTA B($70)
     DTA B($70)
     DTA B($70)
     DTA B($42)
     DTA A(SCRN)
 DTA D'""""""""""""'
 DTA D'"""""""""""'
     DTA B($41)
     DTA A(DLIS)

KTAB DTA C' '
     DTA C'q'
     DTA C'w'
     DTA C'e'
     DTA C'r'
     DTA C'a'
     DTA C's'
     DTA C'd'
     DTA C'f'

TTAB EQU *

*

     DTA D' 40'
     DTA D' 44'
     DTA D' 48'
     DTA D' 52'


     ICL 'ADMTAB.ASM'

*


     END
