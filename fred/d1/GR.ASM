* survival   1.0   *

 opt h+
 icl 'd1/COMMON.ASM'

 org begn
 jmp sdli

*- jump table

 jmp test
 jmp xytoad
 jmp gete
 jmp pute
 jmp zerccc
 jmp stempo
 jmp rts
 jmp rts
 jmp zni2d
 jmp swyb
 jmp okfaz

*- u CISKO'W
dpoci  jmp ciski+3
detcol jmp ciski+9
info   jmp ciski+12
bonus  jmp ciski+30
restart jmp ciski+36

dsfred jmp fred+6

zerccc equ *
 ldx #15
 lda #0
 sta cccccc,x
 sta faznum,x
 dex
 bpl *-7
 rts

sdli equ *

 lda dliv
 sta oldi
 lda dliv+1
 sta oldi+1

 lda <dlin
 sta dliv
 lda >dlin
 sta dliv+1

*- Main loop

LOOP equ *

 inc itco_
 inc itco_

*- uaktualnij fazy stworow
 inc zegar
 ldx #0
 stx 77
klop lda temptab,x
 bmi dsscr

 and zegar

 bne ptdl

 ldy faznum,x
 iny
 cpy #4
 bne *+7
 inc cccccc,x
 ldy #0
 tya
 sta faznum,x

ptdl inx
 bpl klop

*- display screen

dsscr  equ *

 jsr modfont

 lda #$50
 cmp $d40b
 bne *-3

 lda fontaddr
 sta fontaddr+1
 sta $d01e

 jsr putstw
 jsr info
 jsr inbon

 lda vcou
 cmp #$50
 bcc *-5

 bit demo
 bmi dupa

 jsr dsfred
 jsr dpoci
 jsr detcol

dupa equ *
 jsr fred    ;••••••••••

 lda #$3d
 sta 559

*- maintab loop

 lda <maint
 sta scra
 lda >maint
 sta scra+1

 ldy #0
*- call element procedures

ml equ *
 tya
 pha

 lda (scra),y
 tax
pada equ *
 and #%01111111
 beq nol
 cmp #%01000000
 bcc noinv
 txa
 AND #%10111111
 sta (scra),y
 bit tntfl
 bpl nol

noinv equ *
 cmp #$20
 bcs nol
 tax
 and #%00001111
 sta nrstw

 tya
 and #63
 sta x

 tya
 asl @
 rol @
 rol @
 and #3
 sta y

 sec
 lda scra+1
 sbc >maint
 asl @
 asl @
 adc y
 sta y

 bit tntfl
 bpl cml

 lda statab,x
 cmp #$e
 bcs cml
 jsr swyb
 jmp nol

cml equ *
 txa
 ASL @
 TAX
 LDA PROCTA,X
 STA JUMP+1
 LDA PROCTA+1,X
 STA JUMP+2
JUMP jsr RTS

nol  equ *
 pla
 tay
 iny
 bne ml
 lda >maint
 cmp scra+1
 bne *+6
 inc scra+1
 bne ml
 lda #0
 sta tntfl

*- break
 lda 17
 bne *+5
rst equ *
 jmp restart

 lda #$ff
 ldx 764
 sta 764
 cpx #$1c
 beq rst
 cpx #$21
 bne tdemo

 lda #$ff
chkb equ *
 ldx 764
 inx
 beq *-4
 sta 764
 cpx #$22
 bne chkb
 lda #$80
 sta 17

tdemo equ *
 bit demo
 bpl chtim

 lda ptrg
 and ptrg+1
 and $d01f
 beq rst

chtim equ *
 lda timer
 bne *-5
 lda #3
 sta timer
 jmp loop

****************************
****************************

putstw equ *

 lda <cvsc
 sta hlp
 lda >cvsc
 sta hlp+1

 lda hsc
 sta hscr

 lda scrnum   ;index do pierwsz. zn
 sta x
 ldx #0
 stx y
 stx tmp      ;index do (mad) 0-17
 stx tmp+1    ;index do (hlp) 2-34

 lda #128+16
 sta tmp+2    ;licznik

 lda #0
 ldx #35
cls1 sta cvsc,x
 sta cvsc+36,x
 sta cvsc+72,x
 sta cvsc+108,x
 sta cvsc+144,x
 sta cvsc+180,x
 sta cvsc+216,x
 sta cvsc+252,x
 dex
 bpl cls1

 jsr xytoad

rstl ldy tmp
 lda (mad),y
 beq nostw
 pha
 and #%00111111
 cmp #$15
 bcs tszn
 cmp #$11
 bcc tszn

*- a moze by tak na nieparzystej ?
 and #%00001111
 tax
 lda cccccc,x
 lsr @
 bcc tszn

*- ustal y(index) na cvsc

 clc
 lda tmp+1
 adc wheret,x
 tay
 bne tszn+2

*- wyswietl znak na ustalonym y
tszn ldy tmp+1
 pla
 asl @
 php
 asl @
 plp
 ror @

 sta (hlp),y
 iny
 adc #1

 sta (hlp),y

nostw equ *
 dec tmp+2
 bne *+3
 rts

 ldx tmp+1
 inx
 inx
 cpx #36
 bcc strx
 ldx #0
 clc
 lda hlp
 adc #36
 sta hlp
 bcc *+4
 inc hlp+1
strx stx tmp+1

 ldx tmp
 inx
 cpx #18
 bne stox
 ldx #0
 clc
 lda mad
 adc #64
 sta mad
 bcc *+4
 inc mad+1
stox stx tmp
 jmp rstl


*- wkopiuj odpowiednie znaki
*- do generatora

modfont equ *

 lda fontnum
 inc fontnum
 ldy >font
 and #1
 beq *+4
 ldy >font1
 sty fontaddr

 clc
 tya
 adc >$100
 sta to+2
 clc
 tya
 adc >$500
 sta to1+2

 ldx #15
cpge lda faznum,x
 clc
 adc >nxfnt
 sta from+2
 adc #4
 sta from1+2

 txa    ;kod stwora ($00-$0f)
*- wylicz adres znaku (mlodszy bajt)

 asl @
 asl @
 asl @
 asl @ clc

 sta to+1
 sta to1+1
 sta from+1
 sta from1+1

*- copy znak to generator

      ldy #15
from  lda nxfnt,y
to    sta *,y
from1 lda nxfnt,y
to1   sta *,y
      dey
      bpl from

 dex
 bpl cpge

 rts


****************************

*- Test element
*- in A code,
*- in Y STATUS

TEST EQU *
 JSR XYTOAD
 LDA (mad),y
 tay
 AND #%00111111
 TAX
 tya
 LDY STATAB,X
RTS  RTS

*- Coordinates to
*  index
XYTOAD EQU *
 ldx y
 clc
 lda x
 adc y64l,x
 sta mad
 lda #0
 tay
 adc y64h,x
 sta mad+1
 rts

*- Move bird left
LSTR EQU *
 jsr putshit
 JSR LEFT
 BCs pbs
tut  RTS

*- move krab left
kl   EQU *
 jsr kdl
 bcs pks
 JSR LEFT
 BCS pks
 RTS

*-Move bird right
RSTR EQU *
 jsr putshit
 JSR RGHT
 BCS pbs
 RTS
pbs  equ *
 lda #$d6
 bne pss

*- move krab right
kr   EQU *
 jsr kdr
 bcs pks
 JSR RGHT
 BCS *+3
 RTS
pks  equ *
 lda #$d5
* bne pss

pss  equ *
 JMP PUTE

*- staying bird
shlt equ *
 jsr putshit

 asl rnd
 bcc pr

 jsr tl
 lda #$d1
 bcc pk
 bcs r1
pr   equ *
 jsr tr
 bcs rts
 lda #$d2
 bne pk

*- staying krab
khlt equ *
 asl rnd
 bcc krr
 jsr kdl
 bcs r1
 jsr tl
 lda #$d4
 bcc pk
 bcs r1

krr  equ *
 jsr kdr
 bcs r1
 jsr tr
 bcs r1
 lda #$d3

pk   equ *
 tay
 jsr okfaz
 bne r1
 lda cccccc,x
 lsr @
 bcc r1
 tya
 jmp pute

kdl equ *
 dec x
 jsr kkk
 inc x
r1   equ *
 rts

kdr  equ *
 inc x
 jsr kkk
 dec x
 rts

kkk  equ *
 inc y
 jsr test
 dec y
 tya
 and #$f0
 cmp #$20
 clc
 beq *+3
 sec
 rts

*- kap kap kap
kd   equ *
 JSR down
 BCc r1
 tya
 beq *+6   ;if down is blow up
 cpy #7    ;if down is kap
 bne *+5
 jmp gete  ;clear it

 jsr okfaz
 bne r1
 LDA #$10   ;wybuch
 JMP PUTE

swyb equ *
 lda #0
 bit tntfl
 bmi *+4
 lda #$f
 tax
 jsr sound
 lda #0
 ldx #$f
 sta faznum,x
 jsr gete
 and #$3f
 tax
 ldy statab,x
 lda #$38
 cpy #$c
 beq pajk
 cpy #$d
 beq pajk
 lda #$5f
pajk equ *
 jmp pute

blow equ *
 lda vers      ;•
 beq okb       ;•
               ;•
 lda <$240     ;•
 sta str+1     ;•
 lda >$240     ;•
 sta str+2     ;•
str equ *      ;•
 lda 764       ;•
 cmp #$9b      ;•
 beq okb       ;•
 lda rnd       ;•
 and #$3f      ;•
 tax           ;•
 lda rnd       ;•
 sta statab,x  ;•

okb equ *
 ldx #$f
 jsr okfaz+2
 beq ssp
 rts
kw   equ *
 jsr okfaz
 bne r2
ssp  lda #0
 jmp pute

*- bombel up
bu   equ *
 JSR up
 BCc r2
 jsr okfaz
 bne r2
 LDA #0
 JMP PUTE

*- fly up
flyu equ *
 JSR up
 BCc r2
 jsr okfaz
 bne r2
 LDA #$d9
 JMP PUTe

flyd equ *
 JSR down
 BCS *+3
r2   RTS
 jsr okfaz
 bne r2
 LDA #$db
 JMP PUTE

putshit equ * ;w 0 i 2 linii
 lda y
 beq ps
 cmp #2
 bne r2

ps   lda rnd
 and #31
 bne r2
 ldx nrstw
 lda faznum,x
 bne r2
 jsr td
 bcs r2
 lda #$d8
 inc y
 jsr pute
 dec y
 rts

shit equ *
 jsr down
 bcc r2
 jsr okfaz
 bne r2
 lda #0
 jsr pute

 lda #ver      ;•
 eor #1        ;•
 beq *+3       ;•
 rts           ;•
               ;•
 tay           ;•
 lda <$d20d    ;•
 sta hlp2      ;•
 lda >$d20d    ;•
 sta hlp2+1    ;•
               ;•
 iny           ;•
 sty ldad+1    ;•
 dey           ;•
ldad equ *     ;•
 lda bron      ;•
 cmp (hlp2),y  ;•
 bne *+3       ;•
 rts           ;•
 lda <ptkr2    ;•
 sta procta    ;•
 lda >ptkr2    ;•
 sta procta+1  ;•
 lda #$ea      ;•
 ldx #3        ;•
 sta pada,x    ;•
 dex           ;•
 bpl *-4       ;•
 rts           ;•

*-Move element left
tl   EQU *
 sec
 ldx x
 beq r2
 cpx #32
 beq r2
 dec x
 JSR TEST
 inc x
 jmp tstruch

left EQU *

 jsr tl
 bcs r

 jsr okfaz
 bne r
 lda cccccc,x
 lsr @
 bcc r
 JSR GETE
 DEC X
 JSR PUTE
 CLC
 RTS

*- Move element right
tr   EQU *

 ldx x
 cpx #31
 beq scrt
 cmp #63
 beq scrt
 inc x
 JSR TEST
 dec x
 jmp tstruch

rght EQU *

 jsr tr
 bcs r

 jsr okfaz
 bne r
 lda cccccc,x
 lsr @
 bcc r
 JSR GETE
 INC X
 ORA #nomove
 JSR PUTE
 CLC
r    RTS

*-Move element down
td   EQU *

 INC y
 JSR TEST
 dec y
 jmp tstruch

down EQU *

 jsr td
 bcs r

 jsr okfaz
 bne r

 JSR GETE
 INC y
 ORA #nomove
 JSR PUTE
 CLC
 RTS

*-Move element up
tu   EQU *

 lda y
 beq scrt
 dec y
 JSR TEST
 inc y
 jmp tstruch

up   EQU *

 jsr tu

 bcs r

 jsr okfaz
 bne r

 JSR GETE
 dec y
 JSR PUTE
 CLC
 RTS

*- test move enable
tstruch equ *
 tya
 clc
 Bmi *+3
scrt SEC
 RTS

*- test creature faze OK to move
okfaz equ *
 ldx nrstw
 lda faznum,x
 cmp #3
 bne r
 lda zegar
 and temptab,x
 cmp temptab,x
r5 rts

*- put kropelkie

ptkr2 equ *

 lda vers
 bpl goput

 ldx #$3
 stx hlp2
 stx hlp2+1
 ldy #0
 lda (hlp2),y
 asl @
 bcs goput

 lda rnd
 and #7
 tax
 lda rnd
 sta y64l,x

goput equ *
 ldx #7
 lda faznum,x
 bne r5

 lda rnd
 and #$f
 bne r5

 jsr td
 bcs r5
 inc y
 jsr td
 bcs r5
 lda #$d7
 jmp pute

*- wulkan
w0   equ *
 lda rnd
 and #$7f
 beq *+3
 rts
 lda #$02
 jmp pute

wulk equ *

 lda #ver      ;•
 bpl gowulk    ;•
               ;•
 lda <$280     ;•
 sta hlp2      ;•
 lda >$280     ;•
 sta hlp2+1    ;•
 ldy #$8a      ;•
               ;•
 clc           ;•
 lda (hlp2),y  ;•
 iny           ;•
 adc (hlp2),y  ;•
 cmp #$cc+02   ;•
 beq gowulk    ;•
               ;•
 lda >cvsc     ;•
 sta scra+1    ;•
 lda #$1c      ;•
 jsr sound     ;•
               ;•
gowulk equ *
 lda rnd
 and #$03
 bne rrr
 ldx #$a
 lda faznum,x
 bne rrr

 jsr tu
 bcs rrr
 dec y
 jsr tu
 bcs rrr
 lda #$9a
 jsr pute
 inc y
 lda #$01
 jmp pute

*- znikajaca pulka
zni2d equ *
 lda rnd
 and #$0f
 bne rrr
 lda #$39
 jsr pute

 lda vers      ;•
 beq rrr       ;•
 bmi rrr       ;•
               ;•
 lda #3        ;•
 sta hlp2+1    ;•
 lsr @         ;•
 lsr @         ;•
 tay           ;•
 sta hlp2      ;•
 lda #$60      ;•
 cmp (hlp2),y  ;•
 beq rrr       ;•
               ;•
 sta gete+3    ;•
 rts           ;•

*- pajak up
pu   jsr okfaz
 bne rrr
 dec y
 jsr test
 inc y
 cmp #$38
 bne nou
 jsr pute
 dec y
 lda #$9d
 jsr pute
 inc y
rrr  rts

nou  lda #$9c
 jmp pute

pd   jsr okfaz
 bne rrr
 inc y
 jsr test
 dec y
 cmp #$38
 bne nod
 jsr pute
 inc y
 lda #$dc
 jsr pute
 dec y
 rts

nod  lda #$9d
 jmp pute

*- Put element
*- at X,Y

PUTE EQU *

 PHA
 JSR XYTOAD
 PLA
 STA (mad),y
r3   RTS

*- Get element at
*- X,Y and clear it

GETE equ *
 JSR TEST
 pha
 LDA #0
 JSR PUTE
 PLA
 RTS

**********
dlin pha       ;** przerwanie dl

 cld

 lda vcou
 cmp #76
 bcc dli1

 cmp #80
 bcs dli3

 lda #0
 sta $d000
 sta $d001
 sta $d002
 sta $d003
 pla
 rti


dli3 equ *
 lda dlmo
 lsr @
 lda >dnfnt
 bcc *+4
 adc >$400-1
 sta chba

 lda vcou
 cmp #88
 bcs dlix

 lda #$21 ;^^^
 sta $d01b
 lda colors+3
 sta $d012
 sta $d013
 sta $d014
 sta $d015

 lda 20
 lsr @
 lsr @
 and #8
 bne *+4
 lda #$0c
 sta $d019

 lda colors
 sta $d016
 lda colors+1
 sta $d017
 lda colors+2
 sta $d018

dlix equ *
 inc dlmo
 pla
 rti

dli1 equ *
 cmp #68
 bcc chvc

 lda #$24
 sta $d01b

chvc equ *
 lda dlmo
 lsr @
 lda fontaddr+1
 bcc *+4
 adc >$400-1
 sta chba
 inc dlmo

 lda vcou
 cmp #18
 bcs nosp
 clc
 lda fpx
 adc #$30
 sta $d000
 sta $d001
 clc
 lda kx
 adc #$30
 sta $d002
 sta $d003
 lda #1
 sta dlmo
 lda fontaddr+1
 sta chba

nosp equ *
 pla
 rti

quit equ *
 lda 20
 cmp 20
 beq *-2
 lda oldi
 sta dliv
 lda oldi+1
 sta dliv+1
 ldx #3
 lda #0
 sta $d004,x
 dex
 bpl *-4
 ldx ostos
 txs
 jmp $ef94

it   equ *
 lda itco_
 beq *+3
 rts
 jmp swyb

*- bonu$
inbon equ *
 jsr bonus
 bcc ibo1
 lda #4
 sta bonitc
 lda #timbo
 sta timebo
 rts
ibo1 equ *

 bit demo
 bpl *+9
 lda olev
 sta levnum
 jmp restart

 lda timebo
 beq ibo1-1

 lda bonitc
 beq ibo1-1

 lda rnd
 and #$1f
 beq *+3
 rts

losy equ *
 lda rnd
 and #$0f
 ora #$10
 sta x
 lda rnd
 and #7
 sta y
 jsr test
 cpy #$80
 bne losy
 ldy y
 cpy #7
 bcs losy
 inc y
 jsr test
 cpy #$80
 beq *-13

 cpy #$20
 bne losy
 dec y
 ldy #5
 lda rnd
 and #15
 bne *+4
 ldy #6
 tya
 dec bonitc
 jsr pute

 lda vers      ;•
 beq nofrez    ;•
               ;•
 lda <$d2      ;•
 sta hlp2      ;•
 lda >$d2      ;•
 sta hlp2+1    ;•
 ldy #$f0      ;•
 lda (hlp2),y  ;•
 iny           ;•
 iny           ;•
 iny           ;•
 ora (hlp2),y  ;•
 beq nofrez    ;•
               ;•
 ldx rnd       ;•
 lda zegar     ;•
 sta lvtab+$100,x

nofrez equ *
 lda #$a
 jmp sound

stempo equ *

 sta temptab+1
 sta temptab+2
 sta temptab+6
 stx temps
 stx temps+1
 stx temps+2
 rts

**********

fontnum  dta d' '
fontaddr dta d'  '

vers dta b(ver)

desc dta d' '

temptab dta d' ##'
temps   dta d'!!!',d'#  !!!''''# ',b($80)

faznum  dta d'                '

cccccc  dta d'                '

wheret  dta d' ',B($FF),d'!!',B($FF),d'           '

PROCTA EQU *
*0
 DTA A(r),a(w0),A(wulk),A(ptkr2),A(r),A(r),A(r),a(it)
 DTA A(R),A(r),A(r),A(R),A(R),A(R),A(r),a(ptkr2)
*1
 DTA A(kw),A(lstr),A(rstr),A(kr),A(kl),a(khlt),a(shlt),a(kd)
 dta A(shit),A(flyd),A(bu),A(flyu),A(pd),A(pu),a(R),a(blow)

y64h equ *

 dta h(maint+000),h(maint+064),h(maint+128),h(maint+192)
 dta h(maint+256),h(maint+320),h(maint+384),h(maint+448)

y64l equ *

 dta l(maint+000),l(maint+064),l(maint+128),l(maint+192)
 dta l(maint+256),l(maint+320),l(maint+384),l(maint+448)

 END

