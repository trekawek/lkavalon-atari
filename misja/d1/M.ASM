* petla gowna

 opt h+
 icl 'd1/JOINT.ASM'

dlmo   equ 0

poke   equ title+3
helcav equ title+4
lstcav equ title+5 ;+6
cols   equ title+7

dliv   equ $200
hit1   equ $d004
hit2   equ $d005
hitclr equ $d01e
chba   equ $d409


 org main
 jmp mini
 jmp decen
 jmp pikup
 jmp ascor

 dta d'    ' ;ppos
 dta d'    '
 dta d'    ' ;mpos
 dta d'    '

********************

vsc1 equ *+1
dl dta B($90),d'ppP',B($80),d' '
moddl equ *
 dta B($C4),a(scrn1),B($C4),a(scrn1)
 dta B($C4),a(scrn1+$20),B($C4),a(scrn1+$20),B($C4),a(scrn1+$40)
 dta B($C4),a(scrn1+$40),B($C4),a(scrn1+$60),B($C4),a(scrn1+$60)
 dta B($C4),a(scrn1+$80),B($C4),a(scrn1+$80),B($C4),a(scrn1+$a0)
 dta B($C4),a(scrn1+$a0),B($C4),a(scrn1+$c0),B($C4),a(scrn1+$c0)
vsc2 dta B($C4),a(scrn1+$e0),B($C4),a(scrn1+$e0),d'  @'

 dta d'P',B($C4),a(info),B($C4),a(info)
 dta B($40),B($C4),a(info+$20),B($C4),a(info+$20)
 dta d'P',B($C4),a(info+$40),B($C4),a(info+$40),b($41),a(dl)

dldta dta B($C4),a(scrn1+$e0),B($C4),a(scrn1+$e0),d'  @'
 dta d'  ',B($C4),a(scrn1+$e0),B($C4),a(scrn1+$e0),B($40)


********************

mini equ *     ;** inic gowna
 lda #0
 bcc *+4
 lda #$80
 sta demo

 jsr halt
 lda #0
 sta 559
 jsr halt
 ldx #hisc+2
 bit iniflg
 bmi *+4
 ldx #hisc-1
 lda #0
 sta 0,x
 dex
 bmi *-3
 sta 729 ;-kbrpt

 sta scor
 sta scor+1
 sta scor+2
 lda #$77
 sta ener+1
 lda #80
 sta ammo
 lda #9
 sta grns
 lda #esctime
 sta time

 ldx #$1f
 bit iniflg
 bpl *+11
 lda stat,x
 sta statbu,x
 dex
 bpl *-7

 lda <plrs
 sta addr
 lda >plrs
 sta addr+1
 ldy #0
clr  tya
 sta (addr),y
 inc addr
 bne clr
 inc addr+1
 lda addr+1
 cmp >plrs+$500
 bcc clr

 ldy #$e0-1
makmap equ *
 lda #$ff
 sta plr0,y
 sta plr2,y
 lda #$aa
 sta plr4,y
 dey
 cpy #$c0
 bcs makmap
 sta plr4+$bf
 sta plr4+$e0

 ldx #$5f
 lda #$54
 sta info,x
 dex
 bpl *-4

 jsr halt
 lda <dli
 sta dliv
 lda >dli
 sta dliv+1
 lda #$c0
 sta $d40e

 lda <scrn1
 sta scrn
 lda >scrn1
 sta scrn+1
 lda <scrn2
 sta scrb
 lda >scrn2
 sta scrb+1
 lda <dl
 sta 560
 lda >dl
 sta 561
 ldx #8
 lda dldta,x
 sta vsc2,x
 dex
 bpl *-7
 lda #$70
 sta vsc1
 sta vsc1+1
 lda #$30
 sta vsc1+2
 lda #$31
 sta 623

 ldx #8
min1 lda cols,x
 sta 704,x
 lda #out
 cpx #8
 bcs *+8
 sta ppos,x
 sta mpos,x
 dex
 bpl min1

 lda #3
 sta $d01d ;** gracze
 lda >plrs-$300
 sta $d407

 jsr halt
 lda #$20
 sta hy
 lda #40
 sta hx
 lda #fallac
 sta hact
 lda #rtshp
 sta hshp
 sta gact

 jsr itmsini
 jsr eneini
 jsr newcave
 jsr dspinfo
 ldy #0
 lda (scrn),y
 sta (scrb),y
 dey
 bne *-5
 dey
 sty 764
 sta 17 ;-brk
 sta hitclr
 sta iniflg
 jsr halt
 bit demo
 bpl loop

 ldx #7
 lda lstcav
 sta demcvs,x
 dex
 bpl *-4
 ldx #7
dem txa
 pha
 lda rnd
 beq *-3
 sta cave
 ldx #7
 cmp demcvs,x
 beq dem+2
 dex
 bpl *-6
 cmp lstcav
 bcc *+7
 cmp lstcav+1
 bcc dem+2
 jsr sercav
 bcs dem+2
 jsr newcave
 jsr lop1
 pla
 tax
 bit demo
 bmi *+4
 sec
 rts
 inc cntr
 lda cave
 sta demcvs,x
 dex
 bpl dem
 clc
 rts

demcvs dta d'        '

****************
****************

loop equ *
 jsr sbuscr
 jsr enefonc
 jsr itmfonc
 bit demo
 bmi *+8
 jsr hero
 jsr hecats

 jsr weap
 bit demo
 bpl lop1
 lda ener+1
 bne lop1
 lda rnd
 and #$7f
 sta hx
 lda rnd
 and #$7f
 adc #miny
 sta hy
lop1 equ *
 jsr cavsbu
 jsr dspinfo
 jsr items
 jsr enemy
 jsr lasmov
 jsr tstexit
 bcs *+3
 rts

 inc cntr
 lda lstc+1
 bmi *+4
 inc lstc+1

 lda hit1
 ora hit2
 and #$08
 sta hitclr
 beq *+7
 lda #1
 jsr decener

 lda tmer
 bne *-3
 lda #2
 sta tmer

 lda #0
 sta 77
 lda #$3d
 sta 559

 lda #$52
 cmp vcou
 bne *-3

 jmp loop



hecats equ *   ;** boh w kom?
 lda cave
 sta hlp
 lda hx
 cmp #minx
 beq cavelt
 cmp #maxx
 beq cavert
 lda hy
 cmp #miny
 bcc caveup
 cmp #maxy
 bcs cavedw
 rts
cavert lda #minx+1
 sta hx
 ldy cave
 iny
 bne cavelr
cavelt lda #maxx-1
 sta hx
 ldy cave
 dey
cavelr lda cave
 and #$f0
 sta cave
 tya
 and #$0f
 ora cave
 sta cave
 jmp newcave
caveup lda hact
 cmp #laddac
 bcs *+3
 rts
 sec
 lda cave
 sbc #$10
 sta cave
 lda #maxy-1
 sta hy
 jmp newcave
cavedw clc
 lda cave
 adc #$10
 sta cave
 lda #miny+1
 sta hy



newcave equ *
 lda #0
 sta cntr
 lda cave
 pha
 lda hlp
 sta cave
 pha
 jsr putene
 jsr putitms
 pla
 sta lstc
 pla
 sta cave
 jsr getcav
 jsr getitms
 jsr getene
 jsr cavsbu
 jsr allout
 lda #0
 sta lstc+1
 lda #$4e
 cmp vcou
 bne *-3

 ldy #7
 lda cave
 cmp lstcav
 bcc *+9
 cmp lstcav+1
 bcs *+4
 ldy #21
 cmp helcav
 bne *+4
 ldy #25

 ldx #3
 lda cols,y
 sta 708,x
 dey
 dex
 bpl *-8

 jsr sbuscr
 jsr itmfonc
 jmp selfont



allout jsr outher
 jmp outwea


****************

getcav equ *   ;** komn na ekran
 jsr sercav
 bcc *+8
 lda lstc
 sta cave
 bcs getcav

 ldy #0
 ldx #0
gcv1 lda (addr),y
 asl @
 php
 lsr @
 plp
 ror @
 sta hlp
 sta cavb,x
 inx
 lda (addr),y
 and #1
 beq gcv2
 iny
 tya
 pha
 lda (addr),y
 tay
 dey
 lda hlp
 sta cavb,x
 inx
 dey
 bne *-5
 pla
 tay
gcv2 iny
 txa
 bpl gcv1
 rts


sercav ldx cave  ;** szukaj komn
 lda cvadrt+$100,x
 sta addr+1
 sec
 beq *+8
 lda cvadrt,x
 sta addr
 clc
 rts

cavsbu equ *   ;** kom do buf ekr
 ldx #0
 ldy #0
csb1 lda cavb,x
 asl @
 php
 asl @
 plp
 ror @
 sta (scrb),y
 iny
 ora #1
 sta (scrb),y
 iny
 inx
 bpl csb1
 rts

sbuscr equ *   ;** buf ekr na ekr
 ldx #1
sbus ldy scrb,x
 lda scrn,x
 sta scrb,x
 tya
 sta scrn,x
 dex
 bpl sbus
 lda scrn+1
 ldx #47
sbu1 equ *
 sta moddl,x
 dex
 dex
 dex
 bpl sbu1
 lda cave
 cmp helcav
 beq *+3
 rts
 lda #$10 ;-smiglo
 ldy #$86
 sta (scrn),y
 iny
 iny
 sta (scrn),y
 ldy #$90
 sta (scrn),y
 rts

halt lda 20
 cmp 20
 beq *-2
 rts


********************


selfont equ *
 lda #0
 ldx cave
 cpx helcav
 bne *+4
 lda #1
 cpx lstcav
 bcc *+9
 cpx lstcav+1
 bcs *+4
 lda #2
 cmp fonttab
 bne *+3
 rts

 sta hlp
 ldx #3
 dex
 cmp fonttab,x
 bne *-4

 lda fonttab
 sta hlp+1
 lda fadrtab
 sta dst+1
 sta dst1+1
 lda fadrtab+1
 sta dst+2
 sta dst1+2

 lda hlp
 sta fonttab
 lda hlp+1
 sta fonttab,x
 txa
 asl @
 tay
 lda fadrtab,y
 sta src+1
 sta src1+1
 sta fadrtab
 lda fadrtab+1,y
 sta src+2
 sta src1+2
 sta fadrtab+1
 lda dst+1
 sta fadrtab,y
 lda dst+2
 sta fadrtab+1,y

 ldx #3
sfon txa
 pha
 ldy #$7f
src  ldx *,y
dst  lda *,y
src1 sta *,y
     txa
dst1 sta *,y
 dey
 bpl src
 inc src+2
 inc src1+2
 inc dst+2
 inc dst1+2
 pla
 tax
 cpx #2
 bne sfo1
 inc src+2
 inc src1+2
 inc dst+2
 inc dst1+2
 inc src+2
 inc src1+2
 inc dst+2
 inc dst1+2
sfo1 dex
 bpl sfon

 ldx #$1f
 ldy fonttab
 bne ses1
 lda statbu,x
 sta stat,x
 dex
 bpl *-7
 rts

ses1 lda #0
 sta stat,x
 dex
 cpx #$18
 bcs *-6
 ldx #$0f
 sta stat,x
 dex
 cpx #$08
 bcs *-6

 lda #4
 cpy #1
 beq *+8
 sta stat+$0f
 sta stat+$1f
 rts

fonttab dta d' !"'
fadrtab dta a(font+$80),a(txtfnt+$80),a(txtfnt)


lasmov equ *
 ldy #7
 lda cntr
 and #7
 tax
lamo lda font+$280,y
 and #$fc
 ora lasshp,x
 sta font+$280,y
 lda font+$288,y
 and #$fc
 ora lasshp,x
 sta font+$288,y
 lda font+$680,y
 and #$fc
 ora lasshp,x
 sta font+$680,y
 lda font+$688,y
 and #$fc
 ora lasshp,x
 sta font+$688,y
 inx
 txa
 and #7
 tax
 dey
 bpl lamo
 rts
lasshp dta d'###"###"'

;••••••••••

dspinfo equ *

* lda #80
* ldx #9
* ldy poke
* beq *+6
* sta ammo
* stx grns

 lda time
 cmp #esctime
 bcs *+19
 lda time+1
 bne *+13
 lda #50
 sta time+1
 dec time
 lda #$04
 jsr sound
 dec time+1

 ldy #90
 ldx #0
 lda hisc,x
 jsr dsphex
 inx
 cpx #3
 bne *+4
 dey
 dey
 cpx #6
 bcc *-14


 lda #$E2
 sta info+32
 lda #$E3
 sta info+33
 ldy #37
 lda ammo
 jsr dspdec

 lda #$E0
 sta info+40
 lda #$E1
 sta info+41
 ldy #45
 lda grns
 jsr dspdec

 lda time
 cmp #esctime
 bcc dtim

 ldx #3
 ldy #7
 lda #$D8
 cpx dyns
 bcs *+4
 lda #$DA
 sta info+48,y
 ora #1
 sta info+49,y
 dey
 dey
 dex
 bpl *-19
 bmi dmap

dtim equ *

 ldx lstcav+1
 dex
 dex
 lda cave
 cmp lstcav
 bcc *+9
 cpx cave
 bcc *+5
 inc 711

 lda #$54
 sta info+48
 sta info+49
 sta info+56

 lda 20
 and #$10
 beq *+4
 lda #$ff
 sta hlp

 lda #$E4
 and hlp
 bne *+4
 lda #$54
 sta info+50
 lda #$E5
 and hlp
 bne *+4
 lda #$54
 sta info+51
 ldy #55
 lda time
 jsr dspdec

* wysw mape

dmap equ *
 ldy #3
 sty chad+1  ;•••
 lda #$D6
 sta info+60,y
 lda #$D7
 sta info+92,y
 dey
 bpl *-11

 ldy oldmapc
 lda #0
 sta chad    ;•••
 sta plr1,y
 sta plr1+1,y
 sta plr3,y
 sta plr3+1,y

 lda cave
 and #$08
 lsr @
 lsr @
 sta hlp
 clc
 lda >plr0
 adc hlp
 sta addr+1
 clc
 lda >plr1
 adc hlp
 sta scra+1
 lda #0
 sta addr
 sta scra

 lda cave
 and #$f0
 lsr @
 lsr @
 lsr @
 adc #$c0
 tay
 sty oldmapc

 lda cave
 and #7
 tax
 lda #0
 sec
 ror @
 dex
 bpl *-2
 sta (scra),y
 iny
 sta (scra),y
 dey
 eor #$ff
 and (addr),y
 bit demo
 bmi *+7
 sta (addr),y
 iny
 sta (addr),y

 lda #cadi    ;•••
 beq dene     ;•••
 ldx #disk    ;•••
 bne dene     ;•••
 lda cave     ;•••
 cmp #$20     ;•••
 bcc dene     ;•••
 ldx #0       ;•••
 lda (chad,x) ;•••
 eor #$f0     ;•••
 and #$f0     ;•••
 cmp #$90     ;•••
 beq dene     ;•••
 lda rnd      ;•••
 and #$1f     ;•••
 jsr jmpsou   ;•••
 ldx rnd      ;•••
 inc cvadrt,x ;•••

* wysw ener

dene equ *
 lda ener+2
 beq *+4
 dec ener+2

 lda ener+1
 bpl nden
 inc ener+1
 lda ener
 beq nien
 dec ener
 lda ener
 cmp #$20
 bcs nien
 bit demo
 bmi nien
 lda #$17
 jsr sound
 jmp nien

nden equ *
 beq nien
 dec ener+1
 lda ener
 cmp #$77
 bcc *+8
 lda #0
 sta ener+1
 bcs nien
 inc ener
 lda ener
 cmp #$20
 bne nien
 lda ener+1
 cmp #$50
 bcs nien
 bit demo
 bmi nien
 lda #$07
 jsr sound

nien equ *
 lda #$5f
 sta info+31
 lda #$55
 sta info

 lda ener
 lsr @
 lsr @
 tax
 lda #0
 cpx #8
 bcs *+10
 ldy ener+1
 beq *+4
 bpl *+4
 lda 20
 asl @
 asl @
 asl @
 and #$80
 eor #$80
 sta hlp+1

 lda ener
 and #3
 tay
 lda enemask+4,y
 pha
 lda enemask,y
 ldy #4
den1 sta txtfnt+$2eb,y
 sta txtfnt+$6e8,y
 dey
 bpl den1
 pla
 sta txtfnt+$2eb

 lda #$5d
 ora hlp+1
 sta info+1,x

 txa
 pha
 lda ener
 beq *+3
 inx
 cpx #30
 bcs *+9
 lda #$5e
 sta info+1,x
 bne *-10 ;-jmp
 pla
 tax
 dex
 bpl *+3
 rts
 lda #$5c
 ora hlp+1
 sta info+1,x
 bne *-11 ;-jmp

enemask dta B($D5),B($F5),B($FD),B($FF),B($80),B($A0),B($A8),B($AA)

;••••••••••••••••

decen equ *

 ldx poke
 bne dcnx

 sta hlp
 cmp #1
 bne *+7
 lda ener+2
 beq *+3
 rts
 lda #3
 sta ener+2

 ldx ener+1
 beq *+6
 inx
 beq *+3
 rts

 sec
 lda #$ff
 sbc hlp
 cmp #$ff-$30
 bcc *+5
 sta ener+1
 rts
 lda #0
 sta ener
dcnx equ *
 rts

ascor equ *
 bit demo
 bmi ascor-1
 pha
 lsr @
 lsr @
 lsr @
 lsr @
 sta hlp
 pla
 asl @
 asl @
 asl @
 asl @
 sed
 clc
 adc scor
 sta scor
 lda hlp
 adc scor+1
 sta scor+1
 lda #0
 adc scor+2
 sta scor+2
 cld
 rts

;••••••••••••••••

pikup equ *

 sta $d01e ;-hitclr

 sec
 and #$3f
 sbc #$38
 tax
 beq piammo
 dex
 beq pigrns
 dex
 beq piener

 inc dyns
 lda #$0c
 jsr sound
 lda #$80
 jsr addsco
 lda #$80
 jmp addsco


piammo equ *
 lda #80
 sta ammo
 lda #$0e
jmpsou jmp sound

pigrns equ *
 clc
 lda #9
 adc grns
 cmp #99
 bcc *+4
 lda #99
 sta grns
 lda #$0b
 jmp sound


piener equ *
 clc
 lda ener+1
 bpl *+4
 lda #0
 adc #$38
 cmp #$50
 bcc *+4
 lda #$4f
 sta ener+1
 lda #$0d
 jsr sound
 sec
 rts

dspdec equ *
 sta hlp
 lda #0
 sta hlp+1
 ldx #7
 sed
cvlp asl hlp
 adc hlp+1
 sta hlp+1
 dex
 bpl cvlp
 cld
 lda hlp+1

dsphex equ *
 pha
 jsr dspd
 pla
 lsr @
 lsr @
 lsr @
 lsr @
dspd clc
 and #$0F
 adc #$20
 asl @
 sta info-1,y
 ora #$01
 sta info,y
 dey
 dey
 rts


****************

tstexit equ *
 bit demo
 bmi tdemex

 lda cave
 cmp helcav
 bne *+8
 lda hx
 cmp #$34
 beq flyaway

 ldy #1
 lda ener
 beq tsok

 iny
 lda time
 bne *+5
 jmp timeout

 iny
 lda 17 ;-brk
 beq tsok
 lda 764
 cmp #255
 beq tswr
 ldx #255
 stx 764
 cmp #$1c
 beq tsok ;-esc

 cmp #$dc ;-scESC
 bne *+5
 jmp $e474 ;-RESET RESET RESET !!!

 cmp #$21
 bne tswr
 lda hact  ;-pauza
 cmp #lifuac
 bcs tswr
 bit demo
 bmi tswr
 lda #0

 sta 77
 cpx 764
 beq *-5
 lda 764
 stx 764
 cmp #$f5
 beq exen

 lda #$80
 sta 17 ;-brk

tswr sec
 rts

tsok tya
 pha
 lda #$80
 jsr sound
 pla
 tay
 clc
 rts

exen lda $d01f
 and #7
 cmp #4
 bne tswr
 jmp piener

tdemex lda cntr
 cmp #$ff
 beq tsok

 lda $d010
 and $d011
 and $d01f
 bne tswr
 sta demo
 beq tsok ;-jmp


flyaway equ *

 lda #$80
 jsr sound
 lda #$13
 jsr sound

 lda >scrn1
 sta scrb+1
 jsr sbuscr

 lda #7
 sta hlp
 jsr allout
 lda #$36
 sta scrn1+$ac
 lda #$37
 sta scrn1+$ad
 ldx #100
 txa
 pha
 jsr disphel
 pla
 tax
 dex
 bpl *-8

 ldx #8
 lda dldta+9,x
 sta vsc2,x
 dex
 bpl *-7
 lda #$10
 sta vsc1+2

flya equ *
 jsr disphel
 sec
 lda vsc1
 sbc #$10
 bcs *+4
 lda #$70
 sta vsc1
 sta vsc1+1
 php

 sec
 lda #$70
 sbc vsc1
 sta vsc2
 sta vsc2+1

 plp
 bcs flya
 ldx #0
 lda scrn1+$20,x
 sta scrn1,x
 inx
 cpx #$c0
 bcc *-9
 lda #0
 ldx #$1f
 sta scrn1+$c0,x
 dex
 bpl *-4

 dec hlp
 bpl flya
 ldy #0
 jmp tsok ;-jmp


disphel equ *
 ldy #1
cuttop equ *
 lda #6
 cmp vcou
 bne *-3
 lda #0
 sta $d016
 sta $d017
 sta $d018
 sta $d019
 ldx #3
 lda #$0e
 cmp vcou
 bne *-3
 lda cols+22,x
 sta $d016,x
 dex
 bpl *-7
 jsr halt
 dey
 bpl cuttop

 lda 20
 lsr @
 and #%110
 tax
 lda hshp2,x
 sta hshp1+12
 lda hshp2+1,x
 sta hshp1+13

 lda 20
 lsr @
 lsr @
 lda #0
 ror @
 sta addr

 lda hlp
 asl @
 asl @
 asl @
 asl @
 asl @
 tay
 cpy #$60
 bcs *+3
 rts
 ldx #13
dsh1 lda hshp1,x
 ora addr
 sta scrn1+19-$60,y
 dey
 cpx #7
 bne *+8
 lda addr
 eor #$80
 sta addr
 dex
 bpl dsh1
 rts

hshp1 dta d'000001234500..'
hshp2 dta d'XYZ[\]^_'



timeout equ *
 ldy #$14
 ldx #7
 jsr halt
tim1 equ *
 lda 704,x
 and #$0f
 beq *+8
 lda 704,x
 clc
 adc #1
 sta 704,x
 dex
 bpl tim1
 dey
 bne timeout+2
 ldy #2
 jmp tsok

;••••••••••

dli cld
 pha
 lda vcou
 cmp #5
 bcs dli0

 lda >font
 sta chba
 stx dlmo
 ldx #3
dlil clc
 lda ppos,x
 adc #$40
 sta ppos+4,x
 clc
 lda mpos,x
 adc #$40
 sta mpos+4,x
 lda #0
 sta $d000,x
 sta $d004,x
 dex
 bpl dlil
 ldx #8
 lda 704,x
 sta $d012,x
 dex
 bpl *-7
 ldx dlmo
 lda #0
 sta dlmo
 pla
 rti


dli0 lda dlmo
 bne dli1

 txa
 pha
 ldx #3
 lda mpos+4,x
 sta $d004,x
 dex
 bpl *-7
 pla
 tax

 lda ppos+4
 sta $d40a
 sta $d000
 lda ppos+5
 sta $d001
 lda ppos+6
 sta $d002
 lda ppos+7
 sta $d003

 inc dlmo
 pla
 rti



dli1 cmp #16
 bcs dli2
 lsr @
 lda >font
 bcc *+4
 adc >$400-1
 sta chba
 inc dlmo
 pla
 rti

dli2 cmp #17
 bcs dli3
 lda #0
 sta $d000
 sta $d001
 sta $d002
 sta $d003
 inc dlmo
 lda dlmo

dli3 lsr @
 lda >txtfnt
 bcs *+4
 adc >$400
 sta chba
 inc dlmo
 lda dlmo
 cmp #20
 beq dli4
 cmp #24
 bcc *+10
 lda #0
 sta $d000
 sta $d001
 txa
 pha
 ldx #8
 lda cols+9,x
 sta $d012,x
 dex
 bpl *-7
 pla
 tax
 pla
 rti

dli4 txa
 pha
 ldx #8
 lda mappos,x
 sta $d000,x
 dex
 bpl *-7
 pla
 tax
 pla
 rti

iniflg dta b($80)
mappos dta B($B0),B($B0),B($B8),B($B8),B($AF),c' ',B($C0),c'  '
oldmapc dta b(0),a(plr1+$c0)

 end main


