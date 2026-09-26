* automat perkusyjny

; original assembler option

     opt h+
*--- zero page -----

Y    EQU $D0
A    EQU $D1
SAM1 EQU $D2   ; ┐
BEG1 EQU $D3   ; ┘
END1 EQU $D4
SAM2 EQU $D5   ; ┐
BEG2 EQU $D6   ; ┘
END2 EQU $D7
RATE EQU $D8

B3   EQU $D9
SON  EQU $DA
C5   EQU $DF

*-- system ---------

NMIEN  EQU $D40E
IRQEN  EQU $D20E
AUDC2  EQU $D203
AUDC4  EQU $D207
TIMER  EQU $D200
STIMER EQU $D209
IRQV   EQU $216

*-------------------

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
PATT  EQU $F1
PATN  EQU $F3
SPEED EQU $F4
PITCH EQU $F5
keyb  equ $f6
count equ $fe

*--- system --------

*BELL  EQU $F556
KDEF  EQU $FB51
CIOV  EQU $E456
*CH    EQU $2FC
IOCB  EQU $350
*TIMER EQU 542

font  equ $5c00

*-------------------

     ORG $2E0
     DTA A(DL)

*-------------------

     opt h+
     ORG $8000 ;

     opt h+
*-------------------

DL   EQU *
     LDA <niet
     STA $2E0
     LDA >niet
     STA $2E1
*-------------------
*;
*    JSR TOTCLR ;
*;
rent equ *
     JSR CLOSE
     lda <500
     sta free
     lda >500
     sta free+1
     lda <song
     sta sgnp
     lda >song
     sta sgnp+1
     ldx #0
clef equ *
     lda (sgnp,x)
     cmp #$ff
     beq fcld
     lda free
     bne *+4
     dec free+1
     dec free
     inc sgnp
     beq *+4
     inc sgnp+1
     jmp clef
fcld equ *
*-------------------
     LDA #12
     STA SPEED
     LDA #5
     STA PITCH
     LDA <DLIS
     STA 560
     LDA >DLIS
     STA 561
     LDA >font ;
     STA 756   ;
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
     LDA #180
     JSR WAIT
     LDA #0
     JSR MESS
     LDA #180
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

     JSR NEWC

DLOO LDA #15
     JSR CLICK
     JSR AUXI
     LDA APOS
     CMP #6
     BNE DLOO

     LDA #12
     STA 764 ;

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
     STA keyb
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
     LDA keyb
     JSR AUXI
     LDA keyb
     AND #$3F
     JSR NUM
     LDA keyb
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

     DTA B($a5)
     DTA B($ae)
     DTA B($95)
     DTA B($88)
     DTA B($ad)
     DTA B($85)
     DTA B($8b)
     DTA B($ba)
     DTA B($92)
     DTA B($ab)

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
     jsr _playp
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
     CMP #05
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
 DTA D'|linia|    |'
 DTA B($40)
 DTA D'|     |    |'
 DTA B($40)
 DTA B($41),B($52),B($52),B($52),B($52),B($52),B($44),D'    |'
 DTA B($40)
 DTA B($41),B($52),B($52),B($52),B($52),B($52),B($44),D'    |'
 DTA B($40)
 DTA D'|wolne|    |'
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
     JSR _plays
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

*-------------------
_PLAYS EQU *
*-------------------
     LDA SONG
     BPL *+3
     RTS
     LDA <SONG
     STA SON
     LDA >SONG
     STA SON+1
     JSR DI
*-------------------
SGLP LDX #0
     LDA (SON,X)
     BMI ENDS
     STA PATN
     JSR PLPT
     INC SON
     BNE *+4
     INC SON+1
     JMP SGLP
*-------------------
ENDS JSR HAM
     JMP EI

*-------------------

_PLAYP EQU *
     JSR DI
_LOOP JSR PLPT
     JMP _LOOP

*--- play pattern --

PLPT EQU *
     LDY #0
     STY B3
*--- play loop -----
PPLP equ *

     JSR _SPAT
     JSR SETI
     jsr info
     JSR TEMPO
*--- key testing ---
     LDA $D20F
     AND #$04
     BEQ _BRK
CONT INY
     CPY PATL
     BNE PPLP
     RTS
*--- force break ---
_BRK EQU *
     LDA $D209
     CMP #12
     BEQ CONT
     JSR HAM
     PLA
     PLA
     JMP EI

* info during play

info equ *

     tya
     pha
     sta tmpr
     lda <scrn+44
     sta scra
     lda >scrn+44
     sta scra+1
     lda patn
     jsr bidc
     lda tmp
     ldy #6
     jsr dspb
     lda <scrn+58
     sta scra
     lda >scrn+58
     sta scra+1
     ldy #0
ipl  cpy tmpr
     beq ntb
     lda #$1b ;
     bne dipp
ntb  lda #$1e ; >
dipp sta (scra),y
     iny
     cpy patl
     beq cend
     bne ipl
cend cpy #16
     beq idne
     lda #0
     sta (scra),y
     iny
     bne cend
idne pla
     tay
     rts

*--- count tempo ---

TEMPO EQU *

*     ldx speed
*     lda #0
*     sta count+1
*     sta count
*wloop equ *
*     cpx count+1
*     bne wloop
*     rts

     LDX SPEED
LPP  JSR _WAIT
     DEX
     BNE LPP
     RTS
*-------------------
_WAIT LDA $D20F
     AND #8
     BEQ DAL1
     LDA #0
     STA C5
DAL1 LDA B3
     INC B3
     AND #1
     BEQ DAL2
     LDA $D40B
     BNE *-3
     RTS
DAL2 LDA $D40B
     CMP #$47
     BCC DAL2
     RTS

*-------------------
HAM  EQU *
     LDA $D40B
     BNE *-3
     CMP $D40B
     BEQ *-3
     RTS

*--- set patt adr --

_SPAT EQU *
     LDA #0
     STA PATT+1
     LDA PATN
     STA PATT
*-------------------
     ASL PATT
     ROL PATT+1
     ASL PATT
     ROL PATT+1
     ASL PATT
     ROL PATT+1
     ASL PATT
     ROL PATT+1
     CLC
     LDA PATT
     ADC <PATB
     STA PATT
     LDA PATT+1
     ADC >PATB
     STA PATT+1
     LDX PATN
     LDA LENT,X
     STA PATL
     RTS

* calc pattern addr

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

*--- set drums -----

SETI EQU *

*-------------------

     LDA (PATT),Y
     BNE *+3
     RTS

*- drum #1 ---------
     LDA (PATT),Y
     AND #$0F
     BEQ NXI
     ASL @
     TAX
     LDA SAD,X
     STA BEG2
     LDA SAD+1,X
     STA END2
     LDA #0
     STA SAM2
     STA CDE2
*- drum #2 ---------
NXI  LDA (PATT),Y
     AND #$F0
     LSR @
     LSR @
     LSR @
     LSR @
     BEQ NOTT
     ASL @
     TAX
     LDA SAD,X
     STA BEG1
     LDA SAD+1,X
     STA END1
     LDA #0
     STA SAM1
     STA CDE1
*- start interr ----
NOTT LDA PITCH
     STA TIMER
     STA STIMER
     RTS

*--- sampl addresses

SAD  EQU *

     DTA A($6464)
     DTA A($6460)
     DTA A($6864)
     DTA A($6C68)
     DTA A($706C)
     DTA A($7470)
     DTA A($7874)
     DTA A($7C78)
     DTA A($807C)

*--- disable interr

DI   LDA IRQV
     STA VMEM
     LDA IRQV+1
     STA VMEM+1
     LDA IRQEN
     STA MEM
     LDA NMIEN
     STA MEM+1
     LDA <DLIST
     STA $D402
     LDA >DLIST
     STA $D403
     LDA #3
     STA $D20F
     LDA <INTR
     STA IRQV
     LDA >INTR
     STA IRQV+1
     LDA #0
     STA NMIEN
     STA BEG1
     STA BEG2
     STA END1
     STA END2
     LDA #1
     STA IRQEN
     RTS

*--- enable interr -

EI   LDA #0
     STA IRQEN
     LDA VMEM
     STA IRQV
     LDA VMEM+1
     STA IRQV+1
     LDA MEM
     STA IRQEN
     LDA MEM+1
     STA NMIEN
     RTS

MEM  DTA D'  '
VMEM DTA D'  '

*--- interrupt -----

INTR EQU *

     STY Y
     STA A
*-------------------
     LDY #0
     LDA #0
     STA IRQEN
     LDA #1
     STA IRQEN
     STA STIMER
     LDA END1
     CMP BEG1
     BNE GEN1
     BEQ NEXT
GEN1 BNE *+2

CDE1 EQU *-1
*-------------------
     LDA (SAM1),Y
     LSR @
     LSR @
     LSR @
     LSR @
     ORA #$10
     STA AUDC2
     LDA #$12
     STA CDE1
     BNE NEXT
*-------------------
     LDA (SAM1),Y
     ORA #$10
     STA AUDC2
     INC SAM1
     BNE *+4
     INC SAM1+1
     LDA #0
     STA CDE1
*-------------------
NEXT LDA END2
     CMP BEG2
     BNE GEN2
     BEQ ENDG
GEN2 BNE *+2

CDE2 EQU *-1
*-------------------
     LDA (SAM2),Y
     LSR @
     LSR @
     LSR @
     LSR @
     ORA #$10
     STA AUDC4
     LDA #$12
     STA CDE2
     BNE ENDG
*-------------------
     LDA (SAM2),Y
     ORA #$10
     STA AUDC4
     INC SAM2
     BNE *+4
     INC SAM2+1
     LDA #0
     STA CDE2
*-------------------
ENDG equ *
*     inc count
*     bne nincc
*     inc count+1
*nincc equ *
     LDA A
     LDY Y
*-------------------
     RTI

DLIST EQU *

     DTA B($70)
     DTA B($70)
     DTA B($70)
     DTA B($70)
     DTA B($42)
     DTA A(scrn+40)
     DTA B($41)
     DTA A(DLIST)

     icl 'd2/AP2.ASM' ;

MESG EQU *

* 0
   DTA D'|@1991  la'
   DTA D'boratorium'
   DTA D' komputero'
   DTA D'we AVALON|'
* 1
   DTA D'| u]yj ',B($5E),D' ',B($5F)
   DTA D' ',B($5C),D' ',B($5D),D' q w e'
   DTA D' r a s d f'
   DTA D' RETURN  |'
* 2
   DTA D'|  u'
   DTA D']yj ',B($5C),B($5D),D' pot'
   DTA D'em RETURN.'
   DTA D' ESC wyj\c'
   DTA D'ie   |'
* 3
   DTA D'|    u]yj '
   DTA B($5C),B($5D),D' potem R'
   DTA D'ETURN lub '
   DTA D'ESC      |'
* 4
   DTA D'    takt:0'
   DTA D'0         '
   DTA D'          '
   DTA D'          '
* 5
   DTA D'|     u[yj'
   DTA B($5E),B($5F),D' potem R'
   DTA D'ETURN lub '
   DTA D'ESC      |'
* 6
   DTA D'|wprowa} n'
   DTA D'umer potem'
   DTA D' RETURN. E'
   DTA D'SC koniec|'
* 7
   DTA D'|        p'
   DTA D'otwierd} k'
   DTA D'lawiszem T'
   DTA D'         |'
* 8
   DTA D'|  trwa z'
   DTA D'apisywanie'
   DTA D' takt[w i '
   DTA D'utworu... |'
* 9
   DTA D'|  trwa wcz'
   DTA D'ytywanie t'
   DTA D'akt[w i ut'
   DTA D'woru... |'
*10
ER DTA D'|         '
   DTA D'  b,(d nr '
   DTA D'...       '
   DTA D'         |'
*11
   DTA D'|         '
   DTA D' operacja '
   DTA D'przerwana '
   DTA D'         |'
*12
   DTA D'|  to nie '
   DTA D'jest plik '
   DTA D'z tego pro'
   DTA D'gramu!   |'
*13
   DTA D'|         '
   DTA D'   wprowad'
   DTA D'} nazw*   '
   DTA D'         |'
*14
   DTA D'|  wprowad}'
   DTA D' drug( cyf'
   DTA D'r* numeru '
   DTA D'taktu   |'

**********************

SCRN EQU *

   DTA B($51),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($45)

   DTA D'|    '
   DTA D'AUTOMAT PE'
   DTA D'RKUSYJNY w'
   DTA D'ersja 4.10'
   DTA D'    |'

   DTA B($41),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($44)

   DTA D'|         '
   DTA D'          '
   DTA D'          '
   DTA D'         |'

   DTA D'|#$%&1    '
   DTA D'          '
   DTA D'          '
   DTA D'         |'

   DTA D'|         '
   DTA D'          '
   DTA D'          '
   DTA D'         |'

   DTA D'|#$%&2    '
   DTA D'          '
   DTA D'          '
   DTA D'         |'

   DTA D'|         '
   DTA D'          '
   DTA D'          '
   DTA D'         |'

   DTA B($41),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($57),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($57),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($57),B($52)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($44)

   DTA D'|barwa:  0'
   DTA D'|tempo:000'
   DTA D'|takt:00|o'
   DTA D'statni:00|'

   DTA B($41),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($58),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($57),B($52)
   DTA B($58),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($58),B($52)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($44)

   DTA D'|         '
   DTA D'        | '
   DTA D'          '
   DTA D'         |'

   DTA D'| Metrum  '
   DTA D'        | '
   DTA D'          '
   DTA D'         |'

   DTA D'| ustaW te'
   DTA D'mpo     | '
   DTA D'q  bass dr'
   DTA D'um     ',B($46),D' |'

   DTA D'| zmie/ Ba'
   DTA D'rw*     | '
   DTA D'w  snare d'
   DTA D'rum    ',B($47),D' |'

   DTA D'| kopiuj O'
   DTA D'statni  | '
   DTA D'e  middle '
   DTA D'tom    ',B($48),D' |'

   DTA D'| zagraj T'
   DTA D'akt     | '
   DTA D'r  low tom'
   DTA D'       ',B($49),D' |'

   DTA D'| Komponuj'
   DTA D' utw[r  | '
   DTA D'a  rimshot'
   DTA D'       ',B($4A),D' |'

   DTA D'| zagraj U'
   DTA D'tw[r    | '
   DTA D's  hi-hat '
   DTA D'closed ',B($4B),D' |'

   DTA D'| Dysk    '
   DTA D'        | '
   DTA D'd  hi-hat '
   DTA D'open   ',B($4C),D' |'

   DTA D'| Czy\) pa'
   DTA D'mi*)    | '
   DTA D'f  clap   '
   DTA D'       ',B($4D),D' |'

   DTA D'| koniec p'
   DTA D'racY    | '
   DTA D'          '
   DTA D'         |'

   DTA D'|         '
   DTA D'        | '
   DTA D'          '
   DTA D'         |'

   DTA B($5A),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($58),B($52)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($43)

*--- buffers -------

BUFF EQU *

    DTA D'         '
    DTA D'         '

TREG DTA D'01234'

     opt h+
*--- bufor patternow

     org $5000

     opt h+
PATB EQU *

LENT EQU PATB+1600

SONG EQU LENT+100

DIRB EQU SONG+600

     end
