********************

NIES LDA RND
     AND #31
     TAX
     LDA NSPS,X
     BEQ *+5
     JMP PUT_

* super!

     LDA #'+'
     JSR PUT_

     LDA #30
     STA Y
     LDA #15
     STA X

SUP1 JSR TST_
     AND #$7F
     TAX

     LDA #' '*
     CPX #'('
     BEQ SUP2+2
     CPX #')'
     BEQ SUP2+2

     CPX #'|'
     BEQ SUP2
     CPX #$12
     BEQ SUP2
     CPX #'&'
     BEQ SUP2

     CPX #'A'
     BCC SUP2+5
     CPX #'L'+1
     BCS SUP2+5

SUP2 LDA #'a'*
     JSR PUT_

     DEC X
     BPL SUP1
     DEC Y
     BPL SUP1-4

     LDX #$05
     LDA #$00
     JSR ASCO

     LDA #$0D
     JMP SOUND_


NSPS EQU *
     DTA B(0),B(0),C'??!!!!'
     DTA C'===$$$$$'
     DTA C'&&@+++++'
     DTA C'cc',B($15),C',.-/#'


* dodaj punkty -----

ASCO SED
     CLC
     ADC SCOR+2
     STA SCOR+2

     TXA
     ADC SCOR+1
     STA SCOR+1

     LDA #0
     ADC SCOR
     STA SCOR
     CLD
     RTS

* bezw skrzynie ----

BEZL JSR LT_
     BCC BEZX
     JSR BEZS
     JMP PP1L

BEZR JSR RT_
     BCC BEZX
     JSR BEZS
     JMP PP1R

BEZU JSR UP_
     BCC BEZX
     JSR BEZS
     JMP PP1U

BEZD JSR DW_
     BCS *+7
BEZX LDA #8
     JMP SOUND_

     JSR BEZS
     JMP PP1D

BEZS LDA #''
     JMP PUT_

********************

* losowy powrot ----

RNDR LDA RND
     CMP #18
     BCC *+4
     PLA
     PLA
     RTS


* bomba ------------

BOMB EQU *

     LDA #$00
     JSR SOUND_

     DEC X
     DEC Y
     JSR TST_

     LDX #8
BOM1 LDA WBPO,X
     TAY
     LDA (ADDR),Y
     CMP #$A0
     BEQ BOM2
     AND #$7F
     TAY
     CPX #4
     BEQ BOM0
     LDA WHAT,Y
     AND #%10
     BEQ BOM2

BOM0 TYA
     PHA
     LDA WBPO,X
     TAY
     PLA
     CMP #'@'
     BNE *+6
     LDA #'`'*
     BNE *+5  ;-JMP
     LDA WBPO+9,X
     STA (ADDR),Y

BOM2 DEX
     BPL BOM1

     INC X
     INC Y
     JMP TST_


WYBO LDA #'`'
     JMP PUT_


WBPO EQU *
 DTA B(0),B(1),B(2)
 DTA B(16),B(17)
 DTA B(18),B(32)
 DTA B(33),B(34)

 DTA C'ababcbaba'


* put wyb|spc

PUTW TAX
     LDA #' '
     CPX #']'
     BEQ *+4
     CPX #'['
     BEQ *+4
     LDA #'f'
     JMP PUT_

********************

* magnes -----------

MGNL LDA FY
     CMP Y
     BEQ *+3
     RTS

     LDY #0
MGN1 INY
     LDA (ADDR),Y
     CMP #' '
     BEQ MGN1
     AND #$7F
     CMP #'*'
     BEQ *+3
     RTS

     LDA #$8B
     STA (ADDR),Y

     LDA #1
     STA FAC

     LDA #$0E
     JMP SOUND_


* przyciagania faca

MGFL LDA #1
     STA FAC
     JSR LT_
     BCS PRZY
     RTS


PRZY LDA #'v'
     JSR PUT_

     LDA #0
     STA FAC

     LDA #$0A
     JMP SOUND_


MGFR LDA #1
     STA FAC
     JSR RT_
     BCS PRZY
     RTS


* dzialo ***********

* 1L

DZ1L JSR RNDR
     LDA #$01
     JSR SOUND_
     JMP PP1L

PO1L JSR LT_
     BCS *+3
     RTS

     JSR PUTW

PP1L JSR T_LT
     DEC X
     CPX #' '
     BEQ *+6
     CPX #']'
     BNE PPP1

     LDA #'O'
     JMP PUT_


PPP1 LSR @
     BCS *+7
     LDA #$02
     JMP SOUND_

     CPX #'@'
     BNE *+5
     JMP WYBO

     CPX #'?'
     BNE *+5
     JMP PUNIES

     LDA #$0A
     JSR SOUND_

     LDA #'a'
     JMP PUT_

* 1R

DZ1R JSR RNDR
     LDA #$01
     JSR SOUND_
     JMP PP1R

PO1R JSR RT_
     BCS *+3
     RTS

     JSR PUTW

PP1R JSR T_RT
     INC X
     CPX #' '
     BEQ *+6
     CPX #']'
     BNE PPP1

     LDA #'P'*
     JMP PUT_


* 1U

DZ1U JSR RNDR
     LDA #$01
     JSR SOUND_
     JMP PP1U

PO1U JSR UP_
     BCS *+3
     RTS

     JSR PUTW

PP1U JSR T_UP
     DEC Y
     CPX #' '
     BEQ *+6
     CPX #'['
     BNE PPP1

     LDA #'Q'
     JMP PUT_


* 1D

DZ1D JSR RNDR
     LDA #$01
     JSR SOUND_
     JMP PP1D

PO1D JSR DW_
     BCS *+3
     RTS

     JSR PUTW

PP1D JSR T_DW
     INC Y
     CPX #' '
     BEQ *+9
     CPX #'['
     BEQ *+5
     JMP PPP1

     LDA #'R'*
     JMP PUT_

* laser ************

DZ2L JSR RNDR
     JMP PP2L

PO2L JSR LT_
     BCS *+9
     INC X
     LDA #']'
     JMP PUT_

     LDA #'P'
     JSR PUT_

PP2L JSR T_LT
     DEC X
     CPX #' '
     BNE PPP2

     LDA #'S'
     JMP PUT_


PPP2 LSR @
     BCS *+7
     LDA #$02
     JMP SOUND_

     CPX #'@'
     BNE *+5
     JMP WYBO

     CPX #'?'
     BNE *+5
     JMP PUNIES

     LDA #$0A
     JSR SOUND_

     LDA #'a'
     JMP PUT_



DZ2R JSR RNDR
     JMP PP2R

PO2R JSR RT_
     BCS *+9
     DEC X
     LDA #']'
     JMP PUT_

     LDA #'O'
     JSR PUT_

PP2R JSR T_RT
     INC X
     CPX #' '
     BNE PPP2

     LDA #'T'*
     JMP PUT_



DZ2U JSR RNDR
     JMP PP2U

PO2U JSR UP_
     BCS *+9
     INC Y
     LDA #'['
     JMP PUT_

     LDA #'R'
     JSR PUT_

PP2U JSR T_UP
     DEC Y
     CPX #' '
     BNE PPP2

     LDA #'U'
     JMP PUT_



DZ2D JSR RNDR
     JMP PP2D

PO2D JSR DW_
     BCS *+9
     DEC Y
     LDA #'['
     JMP PUT_

     LDA #'Q'
     JSR PUT_

PP2D JSR T_DW
     INC Y
     CPX #' '
     BEQ *+5
     JMP PPP2

     LDA #'V'*
     JMP PUT_



* blaster **********

DZ3L JSR RNDR
     JMP PP3L

PO3L JSR LT_
     BCS *+12
     JSR D3TB
     INC X
     LDA #'b'
     JMP PUT_

     LDA #'b'
     JSR PUT_

PP3L JSR T_LT
     DEC X
     CPX #' '
     BEQ *+6
     LSR @
     BCS *+3
     RTS

     JSR D3TB
     LDA #'W'
     JMP PUT_



DZ3R JSR RNDR
     JMP PP3R

PO3R JSR RT_
     BCS *+12
     JSR D3TB
     DEC X
     LDA #'b'
     JMP PUT_

     LDA #'b'
     JSR PUT_

PP3R JSR T_RT
     INC X
     CPX #' '
     BEQ *+6
     LSR @
     BCS *+3
     RTS

     JSR D3TB
     LDA #'X'*
     JMP PUT_


DZ3U JSR RNDR
     JMP PP3U

PO3U JSR UP_
     BCS *+12
     JSR D3TB
     INC Y
     LDA #'b'
     JMP PUT_

     LDA #'b'
     JSR PUT_

PP3U JSR T_UP
     DEC Y
     CPX #' '
     BEQ *+6
     LSR @
     BCS *+3
     RTS

     JSR D3TB
     LDA #'Y'
     JMP PUT_


DZ3D JSR RNDR
     JMP PP3D

PO3D JSR DW_
     BCS *+12
     JSR D3TB
     DEC Y
     LDA #'b'
     JMP PUT_

     LDA #'b'
     JSR PUT_

PP3D JSR T_DW
     INC Y
     CPX #' '
     BEQ *+6
     LSR @
     BCS *+3
     RTS

     JSR D3TB
     LDA #'Z'*
     JMP PUT_

* dz3 test bomba ---

D3TB CPX #'?'
     BEQ PUNIES

     CPX #'@'
     BNE *+7
     PLA
     PLA
     JMP WYBO

     RTS


* put niespodzianka

PUNIES EQU *
     LDA #$0A
     JSR SOUND_
     LDA #'n'
     JMP PUT_


* ruch dzialo

DZRU LDA CNTR
     AND #3
     BNE RDZ1
     LDA RND
     AND #3
     BNE RDZ1

     JSR GET_

     LSR RND
     BCS RDZL
     ADC #1
     CMP #'/'+1
     BCC *+4
     LDA #','
     JMP PUT_

RDZL SBC #1
     CMP #','
     BCS *+4
     LDA #'/'
     JMP PUT_

RDZ1 LDA RND
     AND #7
     BEQ *+3
     RTS

     JSR TST_
     SEC
     SBC #','
     ASL @
     TAX
     LDA RDZP+1,X
     PHA
     LDA RDZP,X
     PHA
     RTS

RDZP DTA A(PP1R-1)
     DTA A(PP1D-1)
     DTA A(PP1L-1)
     DTA A(PP1U-1)



* mov dziala

MODL LDA CNTR
     LSR @
     BCC MOD1

     JSR LT_
     BCC MOD1

     LDA #$0D
     JSR PUT_
     JMP MOD1


MODR LDA CNTR
     LSR @
     BCC MOD1

     JSR RT_
     BCC MOD1

     LDA #''
     JSR PUT_

MOD1 JMP DZ1U


********************

* zapora


ZAPO JSR TST_
     LDY #1
     LDA (ADDR),Y
     CMP #''
     BEQ *+4
     LDA #' '
     PHA

     JSR TST_
MOZA INY
     INC X
     LDA (ADDR),Y
     CMP #''
     BNE MOZ1

     DEC X
     DEY
     BEQ MOZ2
     LDA #''
     STY HLP
     JSR PUT1
     LDY HLP

MOZ2 INY
     INC X
     LDA #' '
     STY HLP
     JSR PUT1
     LDY HLP

MOZ1 LDA (ADDR),Y
     CMP #$05
     BNE MOZA

     PLA
     DEY
     DEC X
     CMP #$0F
     BEQ *+3
     RTS

     STA (ADDR),Y
     JMP PUT1

********************

* stworki ----------

* leworecz

STWA JSR TFAC
     JSR LT_
     BCS *+10
     LDA #'D'
     JSR PUT_
     JMP TFAC

     JSR UP_
     BCS *+5
     JMP TFAC
     LDA #'C'
     JMP PUT_

STWB JSR TFAC
     JSR RT_
     BCS *+10
     LDA #'C'*
     JSR PUT_
     JMP TFAC

     JSR DW_
     BCS *+5
     JMP TFAC
     LDA #'D'
     JMP PUT_

STWC JSR TFAC
     JSR UP_
     BCS *+10
     LDA #'A'
     JSR PUT_
     JMP TFAC

     JSR RT_
     BCS *+5
     JMP TFAC
     LDA #'B'
     JMP PUT_

STWD JSR TFAC
     JSR DW_
     BCS *+10
     LDA #'B'*
     JSR PUT_
     JMP TFAC

     JSR LT_
     BCS *+5
     JMP TFAC
     LDA #'A'
     JMP PUT_

* praworeczne

STWE JSR TFAC
     JSR LT_
     BCS *+10
     LDA #'G'
     JSR PUT_
     JMP TFAC

     JSR DW_
     BCS *+5
     JMP TFAC
     LDA #'H'
     JMP PUT_


STWF JSR TFAC
     JSR RT_
     BCS *+10
     LDA #'H'*
     JSR PUT_
     JMP TFAC

     JSR UP_
     BCS *+5
     JMP TFAC
     LDA #'G'*
     JMP PUT_


STWG JSR TFAC
     JSR UP_
     BCS *+10
     LDA #'F'
     JSR PUT_
     JMP TFAC

     JSR LT_
     BCS *+5
     JMP TFAC
     LDA #'E'
     JMP PUT_


STWH JSR TFAC
     JSR DW_
     BCS *+10
     LDA #'E'*
     JSR PUT_
     JMP TFAC

     JSR RT_
     BCS *+5
     JMP TFAC
     LDA #'F'
     JMP PUT_

* lewo-prawo

STWI JSR TFAC
     JSR LT_
     BCS *+5
     JMP TFAC
     LDA #'J'*
     JMP PUT_

STWJ JSR TFAC
     JSR RT_
     BCS *+5
     JMP TFAC
     LDA #'I'*
     JMP PUT_

* gora-dol

STWK JSR TFAC
     JSR UP_
     BCS *+5
     JMP TFAC
     LDA #'L'*
     JMP PUT_

STWL JSR TFAC
     JSR DW_
     BCS *+5
     JMP TFAC
     LDA #'K'*
     JMP PUT_

* toperze pif-pafy

TOPL JSR TFAC
     JSR LT_
     BCC PIFF

     LDA #'N'
     JSR PUT_
     JMP PIFF

TOPR JSR TFAC
     JSR RT_
     BCC PIFF

     LDA #'M'
     JSR PUT_

PIFF JSR TFAC
     LDA RND
     AND #7
     BEQ *+3
     RTS

     JMP PP1D

* sledz ------------

LEDZ EQU *

     JSR TFAC
     LSR RND
     BCS SKAC

     LDA Y
     CMP FY
     BEQ LEX
     BCC *+8
     JSR UP_
     BCS LEX
     RTS

     JSR DW_
     BCS LEX
     RTS

LEX  LDA X
     CMP FX
     BNE LEX1

SKAC LDA RND
     AND #32
     BEQ *+3
     RTS

     LDA RND
     AND #3
     TAX
     LDA LM
     PHA
     LDA TMVS,X
     STA LM
     JSR FD_
     PLA
     STA LM
     RTS

LEX1 BCS *+5
     JMP RT_
     JMP LT_


* czy obok jest fac?

TFAC JSR T_LT
     CPX #'*'
     BNE *+7
     DEC X
     JMP ZABJ

     JSR T_RT
     CPX #'*'
     BNE *+7
     INC X
     JMP ZABJ

     JSR T_UP
     CPX #'*'
     BNE *+7
     DEC Y
     JMP ZABJ

     JSR T_DW
     CPX #'*'
     BEQ *+3
     RTS

     INC Y

ZABJ LDA #$0A
     JSR SOUND_

     LDA #'a'
     JSR PUT_
     LDA X1
     STA X
     LDA Y1
     STA Y
     RTS

* wyjscie ----------


WYZA LDA ZEBR
     BEQ *+3
     RTS

     LDA #$0D
     JSR SOUND_

     LDA COLB
     PHA
     LDA #$0F
     STA COLB
     JSR HALT
     JSR HALT
     JSR HALT
     PLA
     STA COLB

     LDA #$15
     JMP PUT_


WYOT LDA CNTR
     AND #3
     BEQ *+3
     RTS

     JSR TST_
     EOR #$03
     JMP PUT_


********************

* czekaj na VBLK ---

WAIT EQU *
     JSR HALT
     DEX
     BNE WAIT

HALT LDA 20
     CMP 20
     BEQ *-2
     RTS



********************

itsttab equ *

     lda <cave
     sta addr
     lda >cave
     sta addr+1
     lda <scrn
     sta scra
     lda >scrn
     sta scra+1

     ldx #0
ittb lda addr
     sta tsttab,x
     lda addr+1
     sta tsttab+32,x
     lda scra
     sta scrtab,x
     lda scra+1
     sta scrtab+32,x

     clc
     lda addr
     adc #16
     sta addr
     bcc *+4
     inc addr+1

     clc
     lda scra
     adc #64
     sta scra
     bcc *+4
     inc scra+1

     inx
     cpx #32
     bcc ittb
     rts

* get element ------

GET_ equ *
     ldy y
     lda x
     asl @
     ora scrtab,y
     sta scra
     lda scrtab+32,y
     sta scra+1
     ldx #' '
     lda look,x
     ldy #0
     sta (scra),y
     iny
     sta (scra),y
     ldy #32
     sta (scra),y
     iny
     sta (scra),y

     lda x
     ldy Y
     ora tsttab,y
     sta addr
     lda tsttab+32,y
     sta addr+1

     ldy #0
     lda (addr),y
     PHA
     LDA #' '
     sta (addr),y
     PLA
     RTS


* put element ------

PUT_ equ *

     tax
     lda x
     cmp #16
     bcs tst_w
     ldy Y
     cpy #32
     bcs tst_w
     ora tsttab,y
     sta addr
     lda tsttab+32,y
     sta addr+1
     txa

     LDY #0
put1 STA (ADDR),Y

     and #$7f
     tax

     ldy y
     lda x
     asl @
     ora scrtab,y
     sta scra
     lda scrtab+32,y
     sta scra+1

     ldy #0
     LDA LOOK,X
     STA (SCRA),Y

     ora #1
     iny
     STA (SCRA),Y

     ora #$20
     LDY #33
     STA (SCRA),Y

     and #$fe
     dey
     STA (SCRA),Y
     RTS



* co jest w CV na XY

TST_ EQU *
     lda x
     cmp #16
     bcs tst_w
     ldy Y
     cpy #31
     bcs tst_w

     ora tsttab,y
     sta addr
     lda tsttab+32,y
     sta addr+1

     LDY #0
     LDA (ADDR),Y
     CMP #' '
     RTS

tst_w lda #$A0
     rts


tsttab org *+64
scrtab org *+64

********************

     DTA B(0)
DLI  PHA

     LDA DLI-1
     BEQ DLI1
     CMP #1
     BEQ DLI2

     LDA 20
     LSR @
     LSR @
     STA $D017

     PLA
     RTI


DLI2 LDA 712
     STA $D012
     STA $D013
     STA $D014
     STA $D015

     STA $D40A
     LDA >IFNT
     STA $D409

     LDA 712
     STA $D018
     LDA #$0A
     STA $D017

     LDA #34
     STA $D400

     INC DLI-1
     PLA
     RTI

DLI1 LDA COLB
     STA $D40A
     STA $D012
     STA $D013
     STA $D014
     STA $D015

     INC DLI-1
     PLA
     RTI


********************

*      VBLK

********************

BDEC DTA B(0)

CVBL EQU *

     JSR SOUNDV

* move ramka

     LDA IFNT+$307
     PHA
     LDX #6
     LDA IFNT+$300,X
     STA IFNT+$301,X
     DEX
     BPL *-7
     PLA
     STA IFNT+$300

* display info

     LDA CNUM
     INC CNUM
     PHA
     LDA #0
     STA BDEC
     LDX #7
     SED
     ASL CNUM
     ADC BDEC
     STA BDEC
     DEX
     BPL *-9
     CLD
     LDY #37
     JSR DSPB
     PLA
     STA CNUM

     LDY #31
     LDA NABO
     JSR DSPB
     LDY #25
     LDA KEYS
     JSR DSPB
     LDY #19
     LDA LIVS
     JSR DSPB
     LDY #13
     LDA ZEBR
     JSR DSPB
     LDX #2
     LDY #7
     LDA SCOR,X
     JSR DSPB
     DEX
     BPL *-6

* players!

     LDA 712
     STA $D012
     STA $D013
     STA $D014
     STA $D015
     LDA #0
     STA DLI-1
     STA 77 ;atrac


* przesunac ekran?

     LDA VSF
     BNE SCRL

     CLC
     LDA DLSA
     ADC <128
     TAX
     LDA DLSA+1
     ADC >128

     CPX FADR
     SBC FADR+1
     BCC CVB1

* set w gore

     LDA DLSA
     CMP <SCRN+1
     LDA DLSA+1
     SBC >SCRN+1
     BCC EXTV

     LDA #14
     STA VSC
     LDA #$82
     STA VSF
     JMP SCRL

CVB1 CLC
     LDA DLSA
     ADC <512
     TAX
     LDA DLSA+1
     ADC >512

     CPX FADR
     SBC FADR+1
     BCC CVB2




EXTV JMP VBEX




* set w dol

CVB2 LDA DLSA
     CMP <SCRN+1344
     LDA DLSA+1
     SBC >SCRN+1344
     BCS EXTV

     LDA #2
     STA VSC
     LDA #$42
     STA VSF

SCRL BIT VSF
     BPL SCDW

     LDA VSC
     BNE SCU1
     STA VSCR

     LDA #14
     STA VSC

     LDA VSF
     DEC VSF
     AND #$0F
     BNE *+4
     STA VSF
     JMP EXTV

SCU1 DEC VSC
     DEC VSC
     AND #7
     STA VSCR
     CMP #6
     BNE EXTV

     SEC
     LDA DLSA
     SBC #32
     STA DLSA
     BCS *+5
     DEC DLSA+1
     LDA #6
     STA VSCR
     LDA VSC
     BNE EXTV ;-JMP

SCDW LDA VSC
     INC VSC
     INC VSC
     AND #7
     STA VSCR
     BNE EXTV

LDW  CLC
     LDA DLSA
     ADC #32
     STA DLSA
     BCC *+5
     INC DLSA+1

     LDA VSC
     CMP #16
     BCC EXTV

     LDA VSF
     DEC VSF
     AND #$0F
     BNE *+4
     STA VSF

     LDA #2
     STA VSC
     JMP EXTV

* display byte

DSPB PHA
     JSR DSPD
     PLA
     LSR @
     LSR @
     LSR @
     LSR @

DSPD AND #$0F
     CLC
     ADC #'+'-$20
     STA INFO,Y
     SBC #9
     STA INFO+40,Y
     DEY
     RTS

********************

LOOK EQU *
 DTA B($80) ;0 murek
 DTA B($46) ;dzia ├
 DTA B($0)
 DTA B($0)
 DTA B($48) ;dzia ┤
 DTA B($80) ;end zapo
 DTA B($4E) ; -------
 DTA B($4E) ;  bezwla
 DTA B($4E) ;* dna sk
 DTA B($4E) ;  rzynia
 DTA B($4E) ; -------
 DTA B($5E) ;magnfacl
 DTA B($5E) ;magnfacr
 DTA B($CA) ;mov dzR
 DTA B($CA) ;mov dzL
 DTA B($9E) ;zapppp
 DTA B($0) ;1
 DTA B($80) ;pocz zap
 DTA B($C4) ;drzwi ─
 DTA B($42) ;czarne!
 DTA B($1A) ;wyjscie
 DTA B($1A) ; miga
 DTA B($9A) ; jace
 DTA B($4C) ;dzia ┬
 DTA B($4A) ;* ia ┴
 DTA B($0)
 DTA B($0)
 DTA B($1A) ;waitnfac
 DTA B($4A) ;dzia up
 DTA B($4C) ;dzia dw
 DTA B($48) ;dzia ←
 DTA B($46) ;dzia →
 DTA B($40) ;2
 DTA B($56) ;naboje
 DTA B($4c) ;dzialo "
 DTA B($CE) ;skrzynia
 DTA B($5A) ;skarby
 DTA B($50) ;trawa
 DTA B($14) ;sledzie
 DTA B($0)
 DTA B($16) ;* widzi(
 DTA B($18) ; widzia)
 DTA B($5E) ;facet
 DTA B($54) ;ext.life
 DTA B($46) ;ruch --
 DTA B($4C) ;  ome--
 DTA B($48) ;dzia --
 DTA B($4A) ;   lo--
 DTA B($9C) ;3 ---- 0
 DTA B($9C) ;  ---- 1
 DTA B($9C) ;  ---- 2
 DTA B($9C) ;  tele 3
 DTA B($9C) ;  port 4
 DTA B($9C) ;  acje 5
 DTA B($9C) ;  ---- 6
 DTA B($9C) ;  ---- 7
 DTA B($9C) ;* ---- 8
 DTA B($9C) ;  ---- 9
 DTA B($40) ;niespo!!
 DTA B($0)
 DTA B($48) ;dzialo <
 DTA B($5C) ;klucz
 DTA B($46) ;dzialo >
 DTA B($52) ;niesp
 DTA B($58) ;4 bomba
 DTA B($0E) ;--------
 DTA B($0E) ;stworki
 DTA B($0E) ;leworecz
 DTA B($0E) ;--------
 DTA B($10) ;  ------
 DTA B($10) ;  stwor
 DTA B($10) ;  prawor
 DTA B($10) ;* ------
 DTA B($12) ;toperze
 DTA B($12) ;lew-praw
 DTA B($12) ;toperze
 DTA B($12) ;gor-dol
 DTA B($92) ;toperze
 DTA B($92) ;pif-pafy
 DTA B($0C) ;pocis 1l
 DTA B($0C) ;5     1r
 DTA B($0A) ;      1u
 DTA B($0A) ;      1d
 DTA B($0C) ;      2l
 DTA B($0C) ;      2r
 DTA B($0A) ;      2u
 DTA B($0A) ;      2d
 DTA B($02) ;      3l
 DTA B($02) ;*     3r
 DTA B($02) ;      3u
 DTA B($02) ;      3d
 DTA B($0A) ;pocnier|
 DTA B($0)
 DTA B($0C) ;pocnier─
 DTA B($4A) ;dzialo ^
 DTA B($0)
 DTA B($58) ;6 wybom
 DTA B($02) ;  wyb1
 DTA B($04) ;  wyb2
 DTA B($06) ;  wyb3
 DTA B($08) ;  wyb4
 DTA B($06) ;  wyb3
 DTA B($04) ;  wyb2
 DTA B($02) ;  wyb1
 DTA B($0)  ;*
 DTA B($40) ;burn
 DTA B($02) ;   fac
 DTA B($04)
 DTA B($06)
 DTA B($08)
 DTA B($40) ;burn
 DTA B($02) ;  niesp
 DTA B($04) ;7
 DTA B($06)
 DTA B($08)
 DTA B($06)
 DTA B($04)
 DTA B($02)
 DTA B($5E) ;przyc
 DTA B($5E) ;   fac
 DTA B($0) ;*
 DTA B($0)
 DTA B($C4)
 DTA B($0)
 DTA B($C4) ;drzwi |
 DTA B($0)
 DTA B($0)
 DTA B($0)

********************

NEXT EQU *
 DTA B('b') ;a
 DTA B('c') ;b
 DTA B('d') ;c
 DTA B('e') ;d
 DTA B('f') ;e
 DTA B('g') ;f
 DTA B(' ') ;g
 DTA B($00) ;h
 DTA B('j') ;i
 DTA B('k') ;j
 DTA B('l') ;k
 DTA B('m') ;l
 DTA B('*') ;m fac
 DTA B('o') ;n
 DTA B('p') ;o
 DTA B('q') ;p
 DTA B('r') ;q
 DTA B('s') ;r
 DTA B('t') ;s
 DTA B('u') ;t
 DTA B(':') ;u nies
 DTA B('w') ;v
 DTA B('a') ;w mgfac
 DTA B($00) ;x
 DTA B($00) ;y
 DTA B(' ') ;z

********************

PROC EQU *

 DTA A(0000) ;0
 DTA A(DZ3R)
 DTA D'    '
 DTA A(DZ3L)
 DTA D'    '
 DTA A(BEZL)
 DTA A(BEZR) ;*
 DTA A(BEZU)
 DTA A(BEZD)
 DTA A(MGFL)
 DTA A(MGFR)
 DTA A(MODR)
 DTA A(MODL)
 DTA A(0000)
 DTA A(0000) ;1
 DTA A(ZAPO)
 DTA D'    '
 DTA A(WYZA)
 DTA A(WYOT)
 DTA A(WYOT)
 DTA A(DZ3D)
 DTA A(DZ3U) ;*
 DTA D'    '
 DTA A(WFAC)
 DTA A(DZ1U)
 DTA A(DZ1D)
 DTA A(DZ1L)
 DTA A(DZ1R)
 DTA A(0000) ;2
 dta a(0000)
 dta a(dz2d)
 DTA D'    '
 DTA A(0)
 DTA A(LEDZ)
 DTA A(0)
 DTA A(MGNL) ;*
 DTA A(0000)
 DTA A(MFAC)
 DTA A(0000)
 DTA A(DZRU)
 DTA A(DZRU)
 DTA A(DZRU)
 DTA A(DZRU)
 DTA A(TELP) ;3
 DTA A(TELP)
 DTA A(TELP)
 DTA A(TELP)
 DTA A(TELP)
 DTA A(TELP)
 DTA A(TELP)
 DTA A(TELP)
 DTA A(TELP) ;*
 DTA A(TELP)
 DTA A(NIES)
 DTA A(0000)
 DTA A(DZ2L)
 DTA A(0000)
 DTA A(DZ2R)
 DTA A(0000)
 DTA A(0000) ;4
 DTA A(STWA)
 DTA A(STWB)
 DTA A(STWC)
 DTA A(STWD)
 DTA A(STWE)
 DTA A(STWF)
 DTA A(STWG)
 DTA A(STWH) ;*
 DTA A(STWI)
 DTA A(STWJ)
 DTA A(STWK)
 DTA A(STWL)
 DTA A(TOPL)
 DTA A(TOPR)
 DTA A(PO1L)
 DTA A(PO1R) ;5
 DTA A(PO1U)
 DTA A(PO1D)
 DTA A(PO2L)
 DTA A(PO2R)
 DTA A(PO2U)
 DTA A(PO2D)
 DTA A(PO3L)
 DTA A(PO3R) ;*
 DTA A(PO3U)
 DTA A(PO3D)
 DTA D'     ';'
 DTA B(0)
 DTA A(DZ2U)
 DTA A(0000)
 DTA A(BOMB) ;6

* !zas "wyb #itoito

WHAT EQU *
 DTA D' "  " ""' ;0
 DTA D'"""  ""#'
 DTA D'  "    "' ;1
 DTA D'"   """"'
 DTA D'##"""## ' ;2
 DTA D'  ##""""'
 DTA D'""""""""' ;3
 DTA D'""" """#'
 DTA D'########' ;4
 DTA D'####### '
 DTA D'        ' ;5
 DTA D'      " '
 DTA D' """""""' ;6
 DTA D'""""""""'
 DTA D'""""""  ' ;7
 DTA D'    "   '

********************

