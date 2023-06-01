* pociski i inne   *

 icl 'd1/COMMON.ASM'

 opt h+

 org ciski

 jmp spar
 jmp dpoci
 jmp fire
 jmp detcol
 jmp info
 jmp levbeg
 jmp putit
 jmp setmig
 jmp getit
 jmp tstit
 jmp bonus
 jmp inscor
 jmp quit

*- jump table

test   jmp begn+3
xytoad jmp begn+6
pute   jmp begn+12
zerccc jmp begn+15
stempo jmp begn+18
zni2d  jmp begn+27
swyb   jmp begn+30
okfaz  jmp begn+33

toxy    jmp fred+9
sa      jmp fred+12
get2cav jmp fred+15


dlist dta b($f0),d'pp'

 dta b(l),a(cvsc+000),b(l),a(cvsc+000)
 dta b(l),a(cvsc+036),b(l),a(cvsc+036)
 dta b(l),a(cvsc+072),b(l),a(cvsc+072)
 dta b(l),a(cvsc+108),b(l),a(cvsc+108)
 dta b(l),a(cvsc+144),b(l),a(cvsc+144)
 dta b(l),a(cvsc+180),b(l),a(cvsc+180)
 dta b(l),a(cvsc+216),b(l),a(cvsc+216)
 dta b(l),a(cvsc+252),b(l),a(cvsc+252)
codl equ *
 dta B($90),b($4d),a(posp),d'P'
 dta b($c4),a(qbu+0),b($c4),a(qbu+0),B($50)
 dta b($c4),a(qbu+32),b($c4),a(qbu+32)
 dta b($c4),a(qbu+64),b($c4),a(qbu+64)
 dta b($41),a(dlist)

levdl dta B($F0),d'pppppppppp'
 dta b(l),a(levscr),b(l),a(levscr)
 dta B($F0),d'p`ppp!',a(codl)

quit equ *
 ldx ostos
 txs
 ldx levnum
 bit demo
 bpl *+4
 ldx olev
 lda beta,x
 sta levnum
 ldy #1
 rts

*- Main

spar EQU *
 tsx
 stx ostos
 stx 17

 ldx #3
 lda codn,x
 sta colors,x
 dex
 bpl *-6

 php
 lda #0
 bne *+10
 inc *-3
 sta levnum
 nop ;^^^
 nop ;^^^
 nop ;^^^
 plp

 lda #0
 sta demo

 bcc nodemo
 lda #$80
 sta demo
 lda levnum
 sta olev
 lda #8
 sta levnum

nodemo equ *
 bit demo
 bmi always
 lda #0
 bne always
 inc *-3
 sta hisc
 sta hisc+1
 sta hisc+2
 sta levnum

always equ *
 lda ptrg
 and ptrg+1
 sta firdel

 lda <extra
 sta exlif+1
 lda >extra
 sta exlif+2
 lda #0
 sta 559
 sta exlif
 sta exlif
 sta score
 sta score+1
 sta score+2
 jsr halt

 ldx #3
 lda colf,x
 sta 704,x
 dex
 bpl *-7

 lda #$c0
 sta $d40e

 LDX #11
 LDA #0
 STA $D000,X
 DEX
 BPL *-4

 lda #%01010101
 sta $d00c

 ldx #3
 ldy #$41

 tya
 sta $d004,x
 iny
 dex
 bpl *-6

 lda #$31
 sta 623
 lda #3
 sta $d01d ;** gracze
 lda >plrdef
 sta $d407 ;pmbas

 ldx #0
clp  equ *
 lda #$00
 sta plrdef-$100,x
 sta plrdef,x
 sta plrdef+$100,x
 sta plrdef+$200,x
 sta plrdef+$300,x
 inx
 bne clp

 stx 730
 stx 729

 lda <maint
 sta scra
 lda >maint
 sta scra+1

 jsr halt

 LDA <DLIST
 STA DLSTV
 LDA >DLIST
 STA DLSTV+1

 lda #5
 sta zycia

 jsr setlevel
 jsr dajstwory
 jsr gc

 jmp begn

setlevel equ *
 ldx levnum
 bit demo
 bpl *+4
 ldx #8
 ldy leva,x
 dey
 dey
 sty cave
 rts

levdli pha
 lda vcou
 cmp #8
 bcs dli1

 lda #0
 sta dlmo

 lda 20
 lsr @
 lsr @
 and #8
 bne *+4
 lda #$0c
 sta $d019

 lda colors+3
 sta $d012
 sta $d013
 sta $d014
 sta $d015

 lda #$21
 sta $d01b

 lda colors
 sta $d016
 lda colors+1
 sta $d017
 lda colors+2
 sta $d018

dli1 lda dlmo
 lsr @
 lda >dnfnt
 bcc *+4
 adc >$400-1
 sta $d409
 inc dlmo

 pla
 rti

halt lda 20
 cmp 20
 beq *-2
 rts

newlevel equ *

 inc levnum
 lda levnum
 tax
 cmp #10     ;koniec gry
 bcc noend
 lda #0
 sta levnum
 ldx ostos
 txs
 ldy #0
 rts

noend equ *
 clc
 adc #1
 ldx #130+11
 jsr dspd

 lda <levdl
 sta 560
 lda >levdl
 sta 561

 jsr halt

 lda $200
 pha
 lda $201
 pha
 lda <levdli
 sta $200
 lda >levdli
 sta $201

 ldy #21
roll equ *
 jsr halt

 ldx #0
 lda levscr+1,x
 sta levscr,x
 inx
 cpx #47
 bcc *-9
 dey
 bpl roll

 lda #$0c
 jsr sound

 ldx #50
 jsr halt
 dex
 bpl *-4

 ldy #21
rorr equ *
 jsr halt

 ldx #46
 lda levscr,x
 sta levscr+1,x
 dex
 bpl *-7
 dey
 bpl rorr

 ldx #20
 jsr halt
 dex
 bpl *-4

 jsr dajstwory
 jsr setlevel
 jsr setlpar

 ldx #0
 txa
 sta cvsc,x
 sta cvsc+32,x
 inx
 bne *-7

 jsr halt

 LDA <DLIST
 STA DLSTV
 LDA >DLIST
 STA DLSTV+1
 pla
 sta $201
 pla
 sta $200

 jmp zerccc

dajstwory equ *
 lda levnum
 asl @
 asl @
 ora #3
 tay
 ldx #3
 lda cols,y
 sta 708,x
 dey
 dex
 bpl *-8

 ldy #4
 lda levnum
 asl @
 tax
cpitem equ *
 lda rndtab,x
 sta ittab+5,y
 lda rndtab+1,x
 sta ittab,y
 dey
 bpl cpitem

 ldy levnum
 ldx tempot,y
 lda ptempo,y
 jsr stempo
 ldx stwort,y
 lda gdzie,x
 beq nocop
 pha
 ldy #3
 lda gdzie,y
 beq znal
 dey
 bpl *-6

znal equ *
 sta gdzie,x
 pla
 sta gdzie,y
 tax

 dex ;0,1,2
 clc
 lda <dnfnt
 adc incf,x
 sta hlp1
 lda #0
 adc >dnfnt
 sta hlp1+1

 clc
 lda <nxfnt
 adc #48
 sta hlp2
 lda #0
 adc >nxfnt
 sta hlp2+1

cophg equ *
 ldx #7
cop0 equ *
 ldy #47
cop1 equ *
 lda (hlp2),y
 pha
 lda (hlp1),y
 sta (hlp2),y
 pla
 sta (hlp1),y
 dey
 bpl cop1

 inc hlp1+1
 inc hlp2+1

 dex
 bpl cop0

nocop equ *
 rts

levbeg equ *
 jsr bonus
 bcs *+5
 jmp newlevel

 lda zycia
 bpl nodead

 jmp quit

nodead equ *
 jsr setlevel

gc equ *

 jsr setlpar

 lda #0
 sta spraco
 sta copkco
 sta unvico
 sta butco
 sta bron

 lda #9
 sta kamco

 ldx #pockln-1
 lda #$80
 sta migt,x
 sta pocket,x
 dex
 bpl *-7

 jmp zerccc

setlpar equ *
 jsr get2cav
 jsr get2cav

 lda #0
 sta sylnum
 sta fmfl
 sta yin
 sta scrnum
 sta zegar
 sta itco_
 sta deadfl
 sta deadco
 sta $d01e
 sta tntfl

 lda #$39
 jsr sound

 lda #9
 sta x

tg0 equ *
 lda #3
 sta y

tg equ *
 jsr test
 cpy #$20
 beq puf
 inc y
 cpy #8
 bne tg

 inc x
 cpx #15
 bne tg0

 brk

puf equ *
 lda x
 asl @
 asl @
 asl @
 adc #8
 sta fpx
 sta fpxo
 lda y
 asl @
 asl @
 asl @
 asl @
 sta fpy
 sta fpyo
 lda #$80
 sta leci
 sta itm_
 sta bulfl
 lda #8
 sta hscr
 sta hsc
 lda #220
 sta $d002
 sta $d003
 sta kx
 lda #1
 sta wiew
 rts

dpoci equ *
 lda ptrg
 and ptrg+1
 beq *+7
 lda #$39
 jsr sound

 lda bron
 beq *+7
 lda #220
 sta kx
 rts

 lda leci
 bpl *+3
rts  rts

tarea equ *

 lda kx
 cmp #12
 bcc znik
 cmp #140
 bcs znik
 lda ky
 cmp #$a0
 bcs znik

 lda fpx
 pha
 lda fpy
 pha

 lda kx
 sta fpx
 lda ky
 sta fpy

 ldx #3
 ldy #24
 jsr toxy

 jsr test
 tax
 pla
 sta fpy
 pla
 sta fpx

 jsr kol23
 beq crt
 cpy #$1e  ;lina
 beq crt
 cpy #$80
 beq blolr
 cpy #$1d
 beq crt
 jsr znik
 cpy #$10
 bne *+5
 jsr litem
 cpy #$0e
 bcs crt

sbu  equ *
 jsr znik
sbi  equ *
 lda #5
 jsr inscor
 jsr swyb
 clc
 rts

znik equ *
 lda #220
 sta kx
 lda #$80
 sta leci
 tya
 pha
 txa
 pha
 lda #$0a
 jsr sound
 pla
 tax
 pla
 tay
 rts

crt  equ *
 clc
 lda kx
 adc kdir
 sta kx

 ldx leci
 lda kdy,x
 inx
 cmp #$80
 bne *+5
 dex
 lda #6
 stx leci
 tax
 adc ky
 sta ky
 lda #63
 jmp dkm

blolr equ *

 dec x
 jsr test
 tya
 and #%10111111
 beq brt
 cmp #5
 bcc sbu
brt  equ *
 inc x
 inc x
 jsr test
 tya
 and #%10111111
 beq crt
 cmp #5
 bcc sbu
 jmp crt

dkm  equ *
 pha

 ldx kyo
 ldy #15
 lda #0
clrk equ *
 sta plrdef+$200,x
 sta plrdef+$300,x
 inx
 dey
 bpl clrk

 pla
 jsr sa
 ldx ky

 ldy #0
cppk equ *
 lda (tmp),y
 sta plrdef+$200,x
 lda (hlp),y
 sta plrdef+$300,x
 inx
 iny
 cpy #16
 bne cppk
 lda kx
 sta kxo
 lda ky
 sta kyo
 rts

fire equ *
 ldx wiew
 cpx #3
 beq rrr
 ldx deadfl
 bne rrr
 ldx leci
 bmi *+3
rrr  rts

 lda bron
 bne spray

 ldx kamco
 beq rrr

 lda firdel
 beq rrr

 dec kamco
 bne setdir

 lda #rocka
 jsr getit
 bcs setdir

 lda #rockv
 sta kamco

setdir equ *
 ldx wiew
 beq rrr   ;rts
 cpx #3
 bcs rrr   ;rts
 inx
 cpx #2
 beq *+4
 ldx #$fe
 stx kdir

 jsr setpos

 lda #0
 sta leci

 lda #63
 jmp dkm

spray equ *
 lda spraco
 bne decspr

gspr equ *
 lda #spra
 jsr getit
 bcs nospra
 lda #40
 sta spraco
 rts

nospra equ *
 lda #0
 sta bron
 lda #$29
 jmp sound

decspr equ *
 dec spraco

 lda spraco
 bne *+5
 jmp gspr

 lda #$19
 jsr sound
 jsr setpos

 ldx kyo
 ldy #15
 lda #0
clr  sta plrdef+$200,x
 sta plrdef+$300,x
 inx
 dey
 bpl clr

 clc
 lda wiew
 adc #60
 jsr sa
 ldx ky

 ldy #0
cpp  equ *
 lda (tmp),y
 and rnd
 and rnd
 and rnd
 sta plrdef+$200,x
 lda (hlp),y
 and rnd
 and rnd
 sta plrdef+$300,x
 inx
 iny
 cpy #16
 bne cpp
 lda kx
 sta kxo
 lda ky
 sta kyo

 jsr kol23
 bne *+3
 rts

 ldx wiew
 dex
 beq rtt
 inc x
 jsr wybua
 dec x
 jmp dali
rtt equ *
 dec x
 jsr wybua
 inc x
dali equ *
 jsr wybua
 dec y

wybua equ *
 jsr test
 cpy #$10
 beq litem
 cpy #$e
 bcs rx
 jmp sbi

litem equ *
 cpx #6
 beq *+3
rx rts
 ldx #0
 stx itco_
 pha
 tya
 pha

 lda #$f
 jsr sound

 lda rnd
 and #15
 tax
 lda ittab,x
 sta itm_
 tax
 inx
 txa

 ldx <dnfnt
 stx hlp1
 stx hlp2
 ldx >dnfnt
 stx hlp1+1
 inx
 inx
 inx
 inx
 stx hlp2+1

 cmp #5
 bcc cnor
 sbc #5
 inc hlp1+1
 inc hlp1+1
 inc hlp2+1
 inc hlp2+1

cnor equ *
 asl @
 asl @
 asl @
 asl @
 tay

 ldx #0
from equ *
 lda (hlp1),y
 sta font+112,x
 sta font1+112,x
 lda (hlp2),y
 sta font+$400+112,x
 sta font1+$400+112,x
 iny
 inx
 cpx #16
 bcc from

 lda #$47
 ldx itm_
 cpx #4
 bne *+4
 ora #$80
 jsr pute

 pla
 tay
 pla
 rts

setpos equ *
 lda wiew
 cmp #1
 beq srt
 cmp #2
 beq slt
 sec
 rts
slt  equ *
 ldx #1
 ldy #1
 jsr toxy
 dec x
 lda #$fc
 ldx bron
 beq *+4
 lda #$f9
 sta stak+1
 jmp stak-1
srt  equ *
 ldx #6
 ldy #1
 jsr toxy
 inc x
 lda #5
 ldx bron
 beq *+4
 lda #7
 sta stak+1
 clc
stak lda #0
 adc fpxo
 sta kx
 lda fpyo
 clc
 adc #10
 sta ky
 rts

kol23 equ *

 lda $d006
 ora $d007
 and #$0f
 rts

detcol equ *
 lda deadfl
 bne dfac

 ldx unvico
 beq dtc1
 inx
 stx unvico
 beq gunvi
 cpx #200
 bne dfac
*- mig unvi
 lda #unv
 jmp setmig
*- get unvi
gunvi equ *
 lda #unv
 jsr getit
 bcs dtc1
 lda #unv
 jsr tstit
 bcs dtc1
 lda #unvval
 sta unvico
 rts

dtc1 equ *
 lda $d004
 ora $d005
 and #%00001000
 sta deadfl
 beq dfac

 ldx copkco
 beq dfac
 dex
 stx copkco

 bne migco
 lda #cpka
 jsr getit
 bcc *+6
 inc deadfl
 bne dfac   ;jmp

 lda #cpka
 jsr tstit
 bcs dfac
 lda #cpkval
 sta copkco
 jmp excol

migco equ *
 cpx #5
 bne excol
 lda #cpka
 jsr setmig
excol equ *
 lda #0
 sta deadfl
dfac equ *
 rts

*- in A itm_
putit equ *
 tay
 cmp #rocka
 bne coput
 lda poke
 bne rt

coput equ *
 lda #$80
 jsr tstit
 bcs rt
 sta migt,x
 tya
 sta pocket,x
rt equ *
  rts

*- in A itm_
setmig equ *
 jsr tstit
 bcs rt
 lda #0
 sta migt,x
 rts

*- in A itm_
getit equ *
 jsr tstit
 bcs rt
 lda #$80
 sta pocket,x
 sta migt,x
*- copy to left side
ctols equ *
 inx
 cpx #pockln+1
 bcc *+4
 clc
 rts
 lda pocket,x
 sta pocket-1,x
 lda migt,x
 sta migt-1,x
 jmp ctols

tstit equ *
 ldx #0
 cmp pocket,x
 bne *+4
 clc
 rts
 inx
 cpx #pockln
 bcc tstit+2
 rts

inscor equ *
 sta hlp2
 jsr bonus
 lda hlp2
 bcs norma
 asl @
 asl @     clc
 and #$77
norma equ *
 sta hlp2
 asl @
 asl @
 asl @
 asl @
 sed
 clc
 adc score
 sta score
 php
 lda hlp2
 lsr @
 lsr @
 lsr @
 lsr @
 plp
 adc score+1
 sta score+1
 lda score+2
 adc #0
 sta score+2
 cld

 lda score+2
 cmp exlif+2
 bcc exl
 beq *+4
 bcs cexl
 lda score+1
 cmp exlif+1
 bcc exl
 beq *+4
 bcs cexl
 lda score
 cmp exlif
 bcc exl

cexl equ *
 lda #$d
 jsr sound
 inc zycia

 sed
 clc
 lda exlif+1
 adc <extra
 sta exlif+1
 lda exlif+2
 adc >extra
 sta exlif+2
 cld

exl equ *
 rts

DSPB PHA
 lsr @
 lsr @
 lsr @
 lsr @
 JSR DSPD
 PLA
DSPD and #$0f
 ora #$10
 cmp #$15
 bcc *+4
 adc #$1a
 asl @
 STA qbu,x
 ora #1
 sta qbu+1,x
 inx
 inx
 RTS

info equ *

 jsr bonus
 bcs cltbs

dbonti equ *
 ldx #14
 lda timebo
 jsr dspb

 lda zegar
 and #4
 bne *+5
 jsr clt

 lda zegar
 and #31
 bne cltbs+3
 lda #$4
 jsr sound
 sed
 sec
 lda timebo
 sbc #1
 sta timebo
 cld
 bne cltbs+3

endbon equ *
 lda #1
 sta deadfl

cltbs equ *
 jsr clt

 ldx #31
 lda #0
 cpx #25
 bcs *+8
 cpx #6
 bcc *+4
 lda #$55
 sta posp,x
 dex
 bpl *-16
 lda #%01010110
 sta posp+25
 sec
 lda cave
 sbc #3
 lsr @
 tax
 and #3
 tay     ;bit #
 txa
 lsr @
 lsr @
 tax
 lda posp+6,x
 ora bmask,y
 sta posp+6,x

*- misile na sprayu
 lda bron
 lsr @
 lda #0
 ror @
 sta byte

 ldy #32+3
invb equ *
 lda qbu+32,y
 and #$7f
 ora byte
 sta qbu+32,y
 cpy #32
 bne *+4
 ldy #3
 dey
 bpl invb

 lda #0
 ldx #20
 sta plrdef-56,x
 dex
 bpl *-4
 sec
 lda #40
 sbc spraco
 lsr @
 tax
 lda #$fe
 sta plrdef-56,x
 inx
 cpx #20
 bcc *-6

*- kamienie

 lda poke
 beq *+6
 lda #9
 sta kamco

 lda byte
 eor #$80
 sta byte

 ldx #$ff
 ldy #$ff
dklop equ *
 inx
 cpx kamco
 bcc *+6
 lda #$ba
 bne *+5
 txa
 and #1
 clc
 adc #$46
 iny
 cpy #10
 bcs dzycia
 ora byte
 sta qbu+36,y
 jmp dklop

dzycia equ *
 ldy #13
 ldx zycia
 beq claz
zlp equ *
 lda #$48
 sta qbu+64-15,y
 ora #1
 sta qbu+64-14,y
 dey
 dey
 bmi dpokt
 dex
 bne zlp
claz equ *
 lda #0
 sta qbu+64-14,y
 dey
 bpl *-4

dpokt equ *
 ldx #0
 ldy #73
dplp equ *
 lda migt,x
 bmi nomig
 php
 bne *+4
 lda #2
 lsr @
 sta migt,x
 plp
 beq dsi

nomig equ *
 lda pocket,x
 bpl *+4
 lda #$ff
 clc
 adc #1
 asl @
dsi equ *

 cmp #$a
 bcc *+4
 adc #$35

 sta qbu,y
 ora #1
 sta qbu+1,y
nodi equ *
 iny
 iny
 inx
 cpx #pockln
 bcc dplp

dscr equ *
 ldx #0
 lda score+2
 jsr dspb
 lda score+1
 jsr dspb
 lda score
 jsr dspb

 lda score+2
 cmp hisc+2
 bcc ex
 beq *+4
 bcs cex
 lda score+1
 cmp hisc+1
 bcc ex
 beq *+4
 bcs cex
 lda score
 cmp hisc
 bcc ex

cex equ *
 ldx #2
 lda score,x
 sta hisc,x
 dex
 bpl *-5

ex equ *
 ldx #20
 lda hisc+2
 jsr dspb
 lda hisc+1
 jsr dspb
 lda hisc
 jsr dspb

 rts

clt equ *
 ldx #3
 lda #0
 sta qbu+14,x
 dex
 bpl *-4
 rts

bonus equ *
 ldx #0
 lda leva,x
 cmp #$ff
 beq notend
 cmp cave
 beq lend
 inx
 bne bonus+2
notend equ *
 sec
 rts
lend equ *
 lda scrnum
 and #$0f
 cmp #$0f
 bne notend
 clc
 rts

bmask equ *
 dta b(%11000000),b(%00110000),b(%00001100),b(%00000011)

kdy dta B($FE),B($FE),B($FF),B($FF),d'  !!""##$$%%''''',B($80)

ittab dta d'          %$#"! '

pocket dta B($80),B($80),B($80),B($80),B($80),B($80),B($80),B($80),B($80),B($80)

migt   dta B($80),B($80),B($80),B($80),B($80),B($80),B($80),B($80),B($80),B($80) ;' ' lub ! miga

leva   dta d'!1AQ',B($41),B($51),d'aq',B($81),B($91),B($FF)
beta   dta d'   ###&&&& '

incf dta b(112),b(160),b(208)

gdzie equ *
 dta d' ' ;zaba
 dta d'!' ;scorpio
 dta d'"' ;krab
 dta d'#' ;kacka

stwort dta d'"# !!#" #"'

tempot dta d'##!# !#!!!'

ptempo dta d'###!!!!#!!'

rndtab dta d' !!&%&!" #"&!%!$!&!"'

codn dta c'2',B($96),B($1A),c'^'
colf dta c'4',B($E2),B($92),c'8'
cols dta B($C2),B($B4),B($0E),c'6',B($12),B($14),B($0E),B($C6),c'2',B($04),B($0E),B($C6),B($02),B($94),B($0C),B($C6),B($12),B($04),B($0E),c'V'
     dta B($E2),B($A4),B($0E),c'V',B($B2),B($E4),B($0E),B($96),B($12),B($C4),B($0A),B($0E),c'2',B($04),B($98),B($0E),B($E2),B($A4),B($98),B($0E)

 opt h+

 org qbu

 dta d'                                '
 dta d'+,                              '
 dta d'KL                              '

levscr equ *
 dta d'                                  ',B($4A),B($4B),B($4C),B($4D),d'lm',B($4C),B($4D),B($4A),B($4B),d'    '

posp org *+32

 end


