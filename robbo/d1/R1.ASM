********************
*                  *
*    R O B B O     *
*                  *
********************
*                  *
*  89.04.30 -      *
*      - 89.08.08  *
*                  *
*   Janusz Pelc    *
*                  *
********************

     OPT h+

* strona zerowa ----

Z0   EQU $80
ADDR EQU Z0+00 ;+01
SCRA EQU Z0+02 ;+03
CHAD EQU Z0+04 ;+05
FADR EQU Z0+06 ;+07

X    EQU Z0+18
Y    EQU Z0+19
X1   EQU Z0+20
Y1   EQU Z0+21
FX   EQU Z0+22
FY   EQU Z0+23
LM   EQU Z0+24
VSF  EQU Z0+25
VSC  EQU Z0+26
TELE EQU Z0+27
FAC  EQU Z0+28
CNUM EQU Z0+29

KEYS EQU Z0+30
LIVS EQU Z0+31
ZEBR EQU Z0+32
LSTE EQU Z0+33
NABO EQU Z0+34
DEMO EQU Z0+35

SCOR EQU Z0+36 ;37 38

HLP  EQU Z0+39
RUCH EQU Z0+40
*    EQU Z0+41
TOLE EQU Z0+42


* system -----------

JOY  EQU $278
TRIG EQU $284
TMR  EQU $21C

RND  EQU $D20A
VSCR EQU $D405

SETV EQU $E45C
VBEX EQU $E462

* program ----------

COLB   EQU 707

LOADER EQU $500
CAVE   EQU $C00
MFNT   EQU $E00
SFNT   EQU $1000
FONT   EQU $1400
IFNT   EQU $1800
PLAY   EQU $1c00
TTPG   EQU $3800
CAVS   EQU $4800
SCRN   EQU $b800

CAPA   EQU CAVE+496
CONG   EQU TTPG+3

********************

     ORG PLAY
     jmp pipa
     jmp sound_
     jmp soundv

CVDL DTA B($40)
     DTA B($70)
     DTA B($F0) ;-INT

     DTA B($64)
DLSA DTA A(SCRN)
     DTA D'DDDDDDDD'
  DTA D'DDDDDDDDDDD'
     DTA B($84) ;-INT

     DTA B($30)
     DTA B($70)
     DTA B($42)
DLLA DTA A(INFO)
     DTA B($02)
     DTA B($00)

     DTA B($41)
     DTA A(CVDL)

INFO EQU *
 DTA D'  ++++++  '
 DTA B($4D)
 DTA B($4E)
 DTA D'++  	'
 DTA B($4A)
 DTA D'++  ',B(85),B(86),D'++  ',B(81),B(82),D'++  ',B(69),B(70),D'++  '
 DTA D'  !!!!!!  ',B(79),B(80),D'!!  ',B(75),B(76),D'!!  ',B(87),B(88),D'!!  ',B(83),B(84),D'!!  ',B(71),B(72),D'!!  '
 DTA D'Wci{ni\cie strza]u przerywa demonstracj\'
REWT EQU *
 DTA D'   Przewi^ ta{m\ na pocz@tek strony B   '
 DTA D'          i uruchom magnetofon          '

********************

pipa LDA #0
     STA 559
     STA VSF
     STA SCOR
     STA SCOR+1
     STA SCOR+2

     jsr itsttab
     JSR HALT
     JSR CHNMON

     LDA #15
     STA X
     LDA #31
     STA Y
     LDA #''
     JSR PUT_
     DEC Y
     BPL *-7
     DEC X
     BPL *-15

     STX LSTE

* setup

SETU JSR HALT

     LDA >FONT
     STA 756

     LDA <CVDL
     STA 560
     LDA >CVDL
     STA 561

     LDA VSF
     BNE *-2
     LDY <CVBL
     LDX >CVBL
     LDA #7
     JSR SETV

     LDA <SCRN
     STA DLSA
     STA FADR
     LDA >SCRN
     STA DLSA+1
     STA FADR+1


     LDA <DLI
     STA $200
     LDA >DLI
     STA $201
     LDA #$C0
     STA $D40E

PLA1 LDA #255
     JSR SOUND_

     LDA DEMO
     BEQ *+7
     LDA #5
     STA TMR+3

     LDA <INFO
     STA DLLA
     LDA >INFO
     STA DLLA+1
     LDA #$02
     LDX DEMO
     BEQ *+4
     ORA #$80 ;-INT
     STA DLLA+2
     LDA DEMO
     BEQ *+4
     LDA #$02
     STA DLLA+3

     LDA CNUM
     ASL @
     ADC >CAVS
     STA ADDR+1
     TAX
     INX
     STX SCRA+1
     LDA #0
     STA ADDR
     STA SCRA

     LDY #0
     LDA (ADDR),Y
     STA CAVE+000,Y
     LDA (SCRA),Y
     STA CAVE+256,Y
     DEY
     BNE *-11


* kolory,srubki...

     LDA CAPA+1
     STA ZEBR

     LDX #4
     LDA CAPA+2,X
     STA 708,X
     DEX
     BPL *-7

     LDA CAPA+7
     STA COLB


     LDA #$FF
     LDX #8
     STA $D008,X
     DEX
     BPL *-4


     LDA #$40
     STA $D000
     LDA #$60
     STA $D001
     LDA #$80
     STA $D002
     LDA #$A0
     STA $D003

     LDA #$04
     STA 623


     LDX #1
     STX TELE
     DEX
     STX KEYS
     STX NABO
     STX RUCH

     LDA #%1101
     STA LM

     LDA #33
     STA 559
     JSR HALT

********************

     JSR ENTCV

********************

* play loop

PCLO LDA #0
     STA FAC
     JSR CHNGCV

     LDA TELE
     BEQ *+4
     STA FAC

     LDA DEMO
     BEQ *+26
     LDA FAC
     BEQ ZYTY
     JSR TETR
     BNE *+10
     LDX #16
     JSR WAIT
     JMP TTPG ;------
     LDA TMR+3
     BNE PCLO
     BEQ NXCV

     LDA $D20F
     and #4
     BNE PL1
     LDA $D209
     CMP #$dc ;scESC
     BEQ NXCV
     CMP #$1C ;esc
     BEQ ZYTY

PL1  LDA FAC
     BMI NXCV
     BNE PCLO

* zabity

ZYTY LDA #0
     STA RUCH
     STA TMR+3

     JSR WYBC

     LDA DEMO
     BNE NXCV

     SED      ;O
     LDA LIVS ;O
     SEC      ;O
     SBC #1   ;O
     STA LIVS ;O
     CLD      ;O
     BCS *+7
     INC LIVS
     JMP TTPG ;------

     JMP PLA1

* nxtcv

NXCV EQU *

     LDA #15
     STA X

     LDA #0   ;(O)
     STA RUCH

     LDA #31
     STA Y
     LDA #''
     JSR PUT_
     DEC Y
     BPL *-7

     JSR CHNMON
     LDA X
     LSR @
     BCC *+5
     INC CNTR
     LDX #1
     JSR WAIT

     DEC X
     BPL NXCV+4 ;(O)


     LDA CNUM
     CMP #55
     BCC *+12
     LDX DEMO
     BEQ *+5
     JMP TTPG ;------
     JMP CONG ;------

     CMP #15
     BCC *+5
     JSR LOAD

     INC CNUM
     JMP PLA1


* wybu komnate

WYBC JSR WHIL

     LDA #0
     JSR SOUND_

     LDA #31
     STA Y

     LDA #15
     STA X
WBC2 JSR TST_
     AND #$7F
     beq wbc3
     CMP #' '
     BEQ WBC3
     CMP #''
     BEQ WBC3
     CMP #''
     BEQ WBC3
     CMP #''
     BEQ WBC3
     LDA RND
     AND #3
     ADC #'a'
     LDY #0
     STA (ADDR),Y
WBC3 DEC X
     BPL WBC2
     DEC Y
     BPL WBC2-4


WHIL LDA #48
     STA TMR+2
     JSR CHNGCV
     LDA TMR+2
     BNE *-6
     RTS



* Load 2'nd part ---

LOAD ldx loader
     bne *+3
     rts

     LDA DEMO
     BEQ *+5
     JMP TTPG ;------

     lda #2
     sta loader

lerr jsr halt
     LDA <CVDL
     STA 560
     LDA >CVDL
     STA 561

     LDA <REWT
     STA DLLA
     LDA >REWT
     STA DLLA+1

     LDA >FONT
     STA 756

     LDA #$FF
     STA $D20E ;-IRQ

     LDA #34
     STA 559

     LDA #0
     LDX #3
     STA $D000,X
     DEX
     BPL *-4

     JSR loader+6
     BCC *+8
     JSR $F556
     JMP lerr

     LDA #$00
     STA $D20E

     INC CNUM
     PLA
     PLA
     lda #0
     sta loader
     JMP SETU

********************
*                  *
*   chng cave      *
*                  *
********************

CNTR DTA B(0)
CHNGCV EQU *

     LDA TMR
     BNE CHNGCV
     LDA #7
     STA TMR
     INC CNTR

     LDY #0
     STY Y1

     LDX #0
     STX X1
CHC1 LDA X1
     STA X
     LDA Y1
     STA Y

     JSR TST_
     TAY
     ASL @
     BCS NOR_
     CPY #'a'
     BCS NXT_

     TAY
     LDA PROC+0,Y
     LDX PROC+1,Y
     BEQ CHCC
     STA CALL+1
     STX CALL+2

* niemiganie

     LDA $D40B
     CMP #93
     BCC *-5

CALL JSR *
     JMP CHCC

* normalny elem

NOR_ EQU *
     CPY #$A0
     BEQ CHCC
     TYA
     AND #$7F
     JSR PUT_
     JMP CHCC

* nastepny elem


NXT_ CPY #'z'+1
     BCS CHCC

     TYA
     CMP #'m'
     BNE NXXX
     LDY #0
     STY TELE
     INY
     STY FAC

NXXX SEC
     SBC #'a'
     TAX
     LDA NEXT,X
     JSR PUT_

* ---

CHCC INC X1
     LDA X1
     CMP #16
     BCS *+5
     JMP CHC1

     INC Y1
     LDA Y1
     CMP #31
     BCS *+5
     JMP CHC1-4

     JMP CHNMON


********************
*                  *
*     wejscie      *
*                  *
********************

ENTCV EQU *

* murki shp

     LDA CNUM
     ASL @
     ASL @
     AND #%11110000
     CLC
     ADC #15
     TAX
     LDY #15
     LDA MFNT,X
     STA FONT,Y
     LDA MFNT+$100,X
     STA FONT+$100,Y
     DEX
     DEY
     BPL *-14


* display


     LDX #15
     STX X
     LDY #31
     STY Y
     LDA #''
     JSR PUT_
     DEC X
     BPL *-7

     LDA #15
     STA X

     LDA #0
     STA Y
DSC1 EQU *
     JSR TST_
     tax
     bpl *+4
     lda #0

     CMP #'*'
     BNE *+7
     JSR MFX1
     LDA #27

     CMP #'+'
     BNE *+10
     LDX CNUM
     CPX LSTE
     BNE *+4
     LDA #'a'*

     JSR PUT_
     INC Y
     LDA Y
     CMP #31
     BCC DSC1
     JSR CHNMON
     LDA X
     LSR @
     BCC *+5
     INC CNTR
     LDX #1
     JSR WAIT

     DEC X
     BPL DSC1-4

     RTS


********************
*                  *
*    procedury     *
*                  *
********************


     DTA B(0) ;NOGA

CHNMON EQU *

     JSR HALT

     LDA #0
     STA ADDR
     LDA CNTR
     CLC
     AND #2
     ADC >SFNT
     STA ADDR+1

     LDY #255
CM1  LDA (ADDR),Y
     STA FONT,Y
     INC ADDR+1
     LDA (ADDR),Y
     STA FONT+256,Y
     DEC ADDR+1
     DEY
     CPY #255-32
     BNE CM1

     LDX #175
CM2  LDA (ADDR),Y
     STA FONT,X
     INC ADDR+1
     LDA (ADDR),Y
     STA FONT+256,X
     DEC ADDR+1
     DEY
     DEX
     CPX #175-96
     BNE CM2

* FACET

     LDA CHNMON-1
     CLC
     AND #1
     ASL @
     ADC >SFNT
     STA ADDR+1

     LDX RUCH
     BEQ FA1
     LDX FAC
     BEQ FA1
     INC CHNMON-1

     LDX #80
     LDA PLAY,X
     STA $D01F ;-tup-
     DEX
     BPL *-7

FA1  LDA LM
     LDY #4
     DEY
     LSR @
     BCS *-2

     TYA
     ASL @
     ASL @
     ASL @
     ASL @
     ADC #79
     TAY

     LDX #15
CM3  LDA (ADDR),Y
     STA FONT+$2F0,X
     INC ADDR+1
     LDA (ADDR),Y
     DEC ADDR+1
     STA FONT+$3F0,X
     DEY
     DEX
     BPL CM3

     RTS


********************

RT_  EQU *

     INC X
     JSR TST_
     BEQ *+6
     DEC X
     SEC
     RTS

     DEC X
     JSR GET_
     INC X
     ORA #$80
     JSR PUT_
     CLC
     RTS

LT_  EQU *

     DEC X
     JSR TST_
     BEQ *+6
     INC X
     SEC
     RTS

     INC X
     JSR GET_
     DEC X
     JSR PUT_
     CLC
     RTS

DW_  EQU *

     INC Y
     JSR TST_
     BEQ *+6
     DEC Y
     SEC
     RTS

     DEC Y
     JSR GET_
     INC Y
     ORA #$80
     JSR PUT_
     CLC
     RTS

UP_  EQU *

     DEC Y
     JSR TST_
     BEQ *+6
     INC Y
     SEC
     RTS

     INC Y
     JSR GET_
     DEC Y
     JSR PUT_
     CLC
     RTS

FD_  LDA LM

     LDX #255
     INX
     LSR @
     BCS *-2

     LDA LMVT,X
     STA JMP1+1
     LDA LMVT+4,X
     STA JMP1+2
JMP1 JMP *

LMVT DTA L(UP_)
     DTA L(DW_)
     DTA L(LT_)
     DTA L(RT_)

     DTA H(UP_)
     DTA H(DW_)
     DTA H(LT_)
     DTA H(RT_)

T_LT DEC X
     JSR TST_
     INC X
     JMP T_EX

T_RT INC X
     JSR TST_
     DEC X
     JMP T_EX

T_UP DEC Y
     JSR TST_
     INC Y
     JMP T_EX

T_DW INC Y
     JSR TST_
     DEC Y

T_EX EQU *
     CMP #' '*
     BNE *+4
     LDA #0
     AND #$7F
     TAX
     LDA WHAT,X
     RTS


********************


TETR LDA $D20F
     LSR @
     LSR @
     LSR @
     AND TRIG
     AND TRIG+1
     RTS


* pojawiaj ---------

WFAC LDA VSF
     BEQ *+3
     RTS

     JSR HALT
     LDA VSF
     BEQ *+3
     RTS

     LDA #$0B
     JSR SOUND_

     LDA #'j'
     JMP PUT_


* ruch -------------

MFAC EQU *

     LDA TELE
     CMP #1
     BNE *+4
     DEC TELE

     LDA #1
     STA FAC


     DEC STRC
     BPL *+5
     INC STRC

     LDA DEMO
     BEQ *+9
     LDA RND
     AND #15
     BEQ *+10

     JSR TETR
     BEQ *+5
     JMP MFC1

* strzelaj ---------

     LDA #0
     STA RUCH

     LDA STRC
     BEQ *+3
     RTS

     LDA DEMO
     BEQ *+6
     LDA LM
     BPL *+11

     JSR KEJO
     AND JOY
     AND JOY+1
     CMP #$0F
     BNE *+3
     RTS

     STA LM

     LDX NABO
     BNE *+6
     INC CHNMON-1 ;NG
     RTS

     PHA
     SED      ;O
     SEC      ;O
     LDA NABO ;O
     SBC #1   ;O
     STA NABO ;O
     CLD      ;O
     PLA

     LDX #5
     STX STRC

     LDX #255
KIES INX
     LSR @
     BCS KIES
     CPX #4
     BCC *+3
     RTS

     TXA
     ASL @
     TAX
     LDA KIET,X
     STA SJMP+1
     LDA KIET+1,X
     STA SJMP+2

SJMP JSR *
     LDA #$01
     JMP SOUND_


KIET DTA A(PP1U)
     DTA A(PP1D)
     DTA A(PP1L)
     DTA A(PP1R)
STRC DTA B(0)

* key to joy

KEJO LDA $D209
     AND #$3F
     TAX

     LDA $D20F
     LSR @
     LSR @
     LSR @
     LDA #$0F
     BCC *+3
     RTS

     CPX #$0E
     BNE *+4
     LDA #%1110
     CPX #$0F
     BNE *+4
     LDA #%1101
     CPX #$06
     BNE *+4
     LDA #%1011
     CPX #$07
     BNE *+4
     LDA #%0111
     CLC
     RTS

********************

MFC1 LDX DEMO
     BEQ M1

     LDA RUCH
     BEQ *+9

     LDA RND
     AND #15
     BNE *+13

     LDA RND
     AND #3
     TAX
     LDA TMVS,X
     BPL M2  ;-JMP

     LDA LM
     BPL M2  ;-JMP


M1   JSR KEJO
     AND JOY
     AND JOY+1

M2   CMP #$0F
     BEQ *+4
     STA LM

     LDX #1
     STX RUCH

     LSR @
     BCC MFUP
     LSR @
     BCC MFDW
     LSR @
     BCC MFLT
     LSR @
     BCC MFRT

     BCS MFX1 ;-JMP

MFLT EQU *
     JSR LT_
     BCC MFEX
     DEC X
     JMP PHAJ

MFRT EQU *
     JSR RT_
     BCC MFEX
     INC X
     BCS PHAJ

MFUP EQU *
     JSR UP_
     BCC MFEX
     DEC Y
     BCS PHAJ

MFDW EQU *
     JSR DW_
     BCC MFEX
     INC Y
     BCS PHAJ

********************

MFX1 LDA #0
     STA RUCH

MFEX JSR TST_
     JSR PUT_
     LDA SCRA
     STA FADR
     LDA SCRA+1
     STA FADR+1

     LDA X
     STA FX
     LDA Y
     STA FY

     LDX TELE
     DEX
     BNE *+26

* stworek?

     JSR T_UP
     JSR TSTW
     JSR T_DW
     JSR TSTW
     JSR T_LT
     JSR TSTW
     JSR T_RT
     JSR TSTW

* tst mgnes

     JSR TST_

     LDY #0
     INY
     LDA (ADDR),Y
     CMP #$20
     BEQ *-5


     CMP #')'
     BEQ *+3
     RTS

     LDA #1
     STA FAC

     LDA #''*
     JSR PUT_

     LDA #$0E
     JMP SOUND_

* tst stworek

TSTW CPX #'A'
     BCC *+6
     CPX #'N'+1
     BCC *+3
     RTS

     PLA
     PLA

     LDA #$0A
     JSR SOUND_

     LDA #'a'
     JMP PUT_

* pchaj?

PHAJ CMP #''
     BEQ PHA1
     CMP #$0D
     BEQ PHA1

     CMP #'?'
     BEQ PHA1
     CMP #'#'
     BEQ PHA1
     CMP #''
     BEQ PHA1
     CMP #'@'
     BNE TTPO

PHA1 JSR FD_
     LDX #0
     BCS *+9
     LDA #$08
     JSR SOUND_
     LDX #1

     STX RUCH
     LDA X1
     STA X
     LDA Y1
     STA Y
     JSR FD_

     JMP MFEX


* czy tele?

TTPO CMP #'0'
     BCS *+5
     JMP TKEY
     CMP #'9'+1
     BCS TKEY

     STA TELE
     ORA #$80
     JSR PUT_
     LDA X1
     STA X
     LDA Y1
     STA Y

     LDA #$03
     JSR SOUND_

     LDA #0
     STA RUCH

     LDA #'d'
     JMP PUT_

* wyj z telepor


TELP JSR TST_
     CMP TELE
     BEQ *+3
     RTS

     LDA #'i'
     JSR PUT_
     JSR FD_
     BCC WYSE

     LDA LM
     PHA
     LDY #0
     INY
     LSR @
     BCS *-2
     TYA
     ASL @
     ASL @
     TAY
     DEY

WYCP TYA
     PHA
     LDA TMVS,Y
     STA LM
     JSR FD_
     PLA
     TAY
     BCC WYSE-3
     DEY
     BPL WYCP

     PLA
     STA LM
     LDA TELE
     JMP PUT_


     PLA
     STA LM
WYSE JSR MFX1
     LDA X1
     STA X
     LDA Y1
     STA Y
     LDA TELE
     LDX #1
     STX TELE
     JMP PUT_

TMVS DTA B($D),B($B)
     DTA B($7),B($E)
     DTA B($E),B($7)
     DTA B($B),B($D)
     DTA B($7),B($E)
     DTA B($D),B($B)
     DTA B($B),B($D)
     DTA B($E),B($7)


* klucz?

TKEY CMP #'='
     BNE TDOR

     SED      ;O
     CLC      ;O
     LDA KEYS ;O
     ADC #1   ;O
     STA KEYS ;O
     CLD      ;O

     LDX #$00
     LDA #$75
     JSR ASCO

     LDA #$09
     JSR SOUND_

FGET JSR GET_
     LDA X1
     STA X
     LDA Y1
     STA Y
     JSR FD_
     JMP MFEX

* drzwi?

TDOR LDX KEYS
     BEQ TSKA

     CMP #'|'
     BEQ *+6
     CMP #''
     BNE TSKA

     SED      ;O
     SEC      ;O
     LDA KEYS ;O
     SBC #1   ;O
     STA KEYS ;O
     CLD      ;O

     LDX #$01
     LDA #$00
     JSR ASCO

     LDA #$06
     JSR SOUND_

     LDA #'z'
     JMP PUT_

* skarb?

TSKA CMP #'$'
     BNE TWYJ

     LDA $D01F
     BNE *+10
     LDA #$0D
     JSR SOUND_
     JMP NXCV

     LDA ZEBR
     BNE *+8
     LDX #$02
     LDA #$50
     BNE *+15 ;--\

     SED      ;O
     SEC      ;O
     LDA ZEBR ;O
     SBC #1   ;O
     STA ZEBR ;O
     CLD      ;O

     LDX #$01
     LDA #$00
     JSR ASCO ;--/

     LDA #$04
     JSR SOUND_

     JMP FGET

* wyjscie?

TWYJ CMP #''
     BEQ *+6
     CMP #''
     BNE TNAB

     LDA X1
     STA X
     LDA Y1
     STA Y
     LDA #' '
     JSR PUT_

     LDX #$10
     LDA #$00
     JSR ASCO

     LDA #$0C
     JSR SOUND_

     LDA #$80 ;wyszed
     STA FAC
     RTS


* naboje?

TNAB CMP #'!'
     BNE TEXL

     SED        ;O
     CLC        ;O
     LDA #9     ;O
     ADC NABO   ;O
     BCC *+4    ;O
     LDA #$99   ;O
     STA NABO   ;O
     CLD        ;O

     LDX #$00
     LDA #$50
     JSR ASCO

     LDA #$07
     JSR SOUND_

     JMP FGET


* extra life?

TEXL CMP #'+'
     BNE TBEZ

     LDA CNUM
     STA LSTE

     SED      ;O
     CLC      ;O
     LDA #1   ;O
     ADC LIVS ;O
     STA LIVS ;O
     CLD      ;O

     LDX #$02
     LDA #$00
     JSR ASCO

     LDA #$05
     JSR SOUND_

     JMP FGET


* bezw skrzynia?

     DTA C'	'
     DTA B($8A)
     DTA B(7)
     DTA B($88)

TBEZ CMP #6
     BNE ENDT

     JSR FD_
     BCS ENDT

     LDX #255
     LDA LM
     INX
     LSR @
     BCS *-2

     LDA TBEZ-4,X
     JSR PUT_

     LDA #$08
     JSR SOUND_

     JMP FGET+3


* ------------------

ENDT LDA FX
     STA X
     LDA FY
     STA Y
     JMP MFX1

********************

     icl 'R2.ASM'

********************

*    89.06.24
*    89.08.08

*-------------------

_Z0   EQU $F0
_PNTR EQU _Z0+00 ;+03
_ADDR EQU _Z0+04 ;+11
_SCRA EQU _Z0+12 ;+13
_HLP  EQU _Z0+14 ;+15

VOIC EQU $D200

*-------------------

SOUND_ EQU *

     TAX
     BMI PSST

     LDA #0
     STA _SCRA+1
     TXA
     ASL @
     ASL @
     ASL @
     ROL _SCRA+1
     ASL @
     ROL _SCRA+1
     ASL @
     ROL _SCRA+1
     ADC <TABS
     STA _SCRA
     LDA _SCRA+1
     ADC >TABS
     STA _SCRA+1

     CPX #3
     BCC *+4
     LDX #3

     LDA #$10
     STA _PNTR,X

     TXA
     ASL @
     TAX
     LDA _SCRA
     STA _ADDR,X
     LDA _SCRA+1
     STA _ADDR+1,X
     RTS


PSST LDA #3
     STA $D20F

     LDA #0
     LDX #8
RESE STA _PNTR,X
     STA VOIC,X
     DEX
     BPL RESE
     RTS


* Play -------------


SOUNDV EQU *

     LDA 20
     AND #3
     BEQ *+3
     RTS

     LDX #3
     LDY #6
SO1  LDA _PNTR,X
     BEQ SO2
     JSR SOPL
     JMP SO3

SO2  STA VOIC,Y
     STA VOIC+1,Y

SO3  DEY
     DEY
     DEX
     BPL SO1
     RTS

* ------------------

SOPL EQU *

     TYA
     PHA

     LDA _ADDR,Y
     STA _SCRA
     LDA _ADDR+1,Y
     STA _SCRA+1

     LDY _PNTR,X
     DEY
     STY _PNTR,X
     TYA
     ASL @
     TAY
     LDA (_SCRA),Y
     STA _HLP
     INY
     LDA (_SCRA),Y
     STA _HLP+1

     PLA
     TAY
     LDA _HLP+1
     STA VOIC,Y
     LDA _HLP
     STA VOIC+1,Y
     RTS


* ------------------

TABS EQU *

* wybuch -----------

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($2281)
 DTA A($2281)
 DTA A($2282)
 DTA A($2283)
 DTA A($2283)
 DTA A($2284)
 DTA A($2285)
 DTA A($2285)
 DTA A($2286)
 DTA A($2287)
 DTA A($2288)
 DTA A($2286)

* strzal -----------

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0381)
 DTA A($0282)
 DTA A($0183)

* stuk -------------

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0181)

* teleport ---------

 DTA A($0000)
 DTA A($60A1)
 DTA A($40A1)
 DTA A($20A1)
 DTA A($61A2)
 DTA A($42A2)
 DTA A($23A2)
 DTA A($64A2)
 DTA A($45A3)
 DTA A($26A3)
 DTA A($67A3)
 DTA A($48A3)
 DTA A($29A4)
 DTA A($6AA4)
 DTA A($4BA4)
 DTA A($2CA4)

* srubka -----------

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($2BA1)
 DTA A($2AA2)
 DTA A($2BA3)
 DTA A($2AA4)

* extra life -------

 DTA A($45A1)
 DTA A($44A2)
 DTA A($45A3)
 DTA A($44A6)
 DTA A($51A3)
 DTA A($50A6)
 DTA A($45A1)
 DTA A($44A2)
 DTA A($45A3)
 DTA A($44A6)
 DTA A($8AA3)
 DTA A($88A6)
 DTA A($8AA3)
 DTA A($88A6)
 DTA A($8AA3)
 DTA A($88A6)

* drzwi ------------

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($8801)
 DTA A($94C1)
 DTA A($A903)
 DTA A($92C4)
 DTA A($B0C5)
 DTA A($ADC6)
 DTA A($BEC7)
 DTA A($CEC8)
 DTA A($D4C8)
 DTA A($E8C7)
 DTA A($F808)

* naboje -----------

 DTA A($0000)
 DTA A($01C1)
 DTA A($0000)
 DTA A($01C1)
 DTA A($0000)
 DTA A($01C2)
 DTA A($0000)
 DTA A($01C3)
 DTA A($0000)
 DTA A($01C4)
 DTA A($0000)
 DTA A($01C3)
 DTA A($0000)
 DTA A($01C2)
 DTA A($0000)
 DTA A($01C1)

* skrzynia ---------

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($8201)
 DTA A($8002)
 DTA A($8101)

* klucz ------------

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($11A1)
 DTA A($12A2)
 DTA A($13A3)
 DTA A($14A4)
 DTA A($15A5)
 DTA A($16A6)

* wybuszek ---------

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0581)
 DTA A($0582)
 DTA A($0583)
 DTA A($0584)
 DTA A($0684)
 DTA A($0683)
 DTA A($0682)

* wejscie

 DTA A($0AA1)
 DTA A($0AA2)
 DTA A($0AA4)
 DTA A($0AA6)
 DTA A($0AA8)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0887)
 DTA A($1086)
 DTA A($2085)
 DTA A($3084)
 DTA A($4083)
 DTA A($5082)
 DTA A($6081)

*

 DTA A($0000)
 DTA A($10A1)
 DTA A($10A1)
 DTA A($10A2)
 DTA A($10A3)
 DTA A($10A4)
 DTA A($10A1)
 DTA A($10A2)
 DTA A($10A3)
 DTA A($10A4)
 DTA A($10A5)
 DTA A($10A2)
 DTA A($10A3)
 DTA A($10A5)
 DTA A($10A7)
 DTA A($10A8)

* otwarcie wyjscia

 DTA A($1801)
 DTA A($0801)
 DTA A($1802)
 DTA A($0802)
 DTA A($1803)
 DTA A($0803)
 DTA A($1804)
 DTA A($0804)
 DTA A($1805)
 DTA A($0805)
 DTA A($1806)
 DTA A($0806)
 DTA A($1808)
 DTA A($0808)
 DTA A($180A)
 DTA A($080A)

* przyciaganie

 DTA A($1008)
 DTA A($0008)
 DTA A($0007)
 DTA A($0007)
 DTA A($1006)
 DTA A($0006)
 DTA A($0005)
 DTA A($0005)
 DTA A($1004)
 DTA A($0004)
 DTA A($0003)
 DTA A($0003)
 DTA A($1002)
 DTA A($0002)
 DTA A($0001)
 DTA A($0001)

********************

     end robbo
