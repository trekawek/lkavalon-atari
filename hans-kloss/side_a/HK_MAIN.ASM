;◢▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀◣
;|   "Hans Kloss"   |
;| ---------------- |
;|                  |
;| 19 th March 1992 |
;|      19:34       |
;◥▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄◤

 opt h+
 org $1000

adr1     equ $b0
adr2     equ $b2
adr3     equ $b4
adca     equ $b6
admin    equ $b8
dlptr    equ $0230
chbase   equ $d409
dliv     equ $0200
jstick0  equ $0278
strig0   equ $0284
random   equ $d20a

init     equ *

 lda #$3c
 sta $d303
 lda <start
 sta 12
 lda >start
 sta 13
 lda #1
 sta 9
 jmp $e474

start    equ *

 lda #$ff
 sta $d301
 lda <reset
 sta adr1
 lda >reset
 sta adr1+1

starlop  equ *

 ldy #0
 lda (adr1),y
 eor #17
 sta (adr1),y
 inc adr1
 bne *+4
 inc adr1+1
 lda adr1+1
 cmp >prgend
 bcc starlop
 lda adr1
 cmp <prgend
 bcc starlop

 lda #1
 sta 580
 jmp reset

 dta d'Written by:D.Zolna'

reset    equ *

 tsx
 stx stos
 ldx <muz
 ldy >muz
 lda #$70
 jsr amp_
 ldx #$00
 lda #$00
 jsr amp_
 lda #255
 sta music

begin    equ *

 ldx stos
 txs

 ldy #0
 tya

bgn0     equ *

 sta ekran,y
 sta mapekr,y
 sta mapekr+256,y
 sta mapekr+480,y
 dey
 bne bgn0
 lda <titdl
 sta dlptr
 lda >titdl
 sta dlptr+1
 ldy #8
 lda #0
 sta 704,y
 dey
 bpl *-4
 lda #64
 sta 54286
 lda <titdlint
 sta dliv
 lda >titdlint
 sta dliv+1
 lda #192
 sta 54286
 lda <vbint
 sta 548
 lda >vbint
 sta 549

 lda >pmb
 sta 54279
 lda #33
 sta 623
 lda #61
 sta 559
 lda #3
 sta $d20f
 ldy #11
 lda #0
 sta 53248,y
 dey
 bpl *-4
 ldy #0

sk1      equ *

 sta pmb+$300,y
 sta pmb+$400,y
 sta pmb+$500,y
 sta pmb+$600,y
 sta pmb+$700,y
 iny
 bne sk1
 lda #3
 sta 53277

 ldy <kaslen
 lda #0
 sta char,y
 dey
 bpl *-4
 lda #9
 sta food
 sta food+1
 sta drink
 sta drink+1
 lda #120
 sta xplr
 lda #50
 sta yplr
 lda #255
 sta zezw
 sta zebrane
 sta otwarte
 lda <zebrane
 sta nrprz
 lda >zebrane
 sta nrprz+1
 lda <otwarte
 sta nrdrz
 lda >otwarte
 sta nrdrz+1
 lda #15
 sta xcav
 sta ycav
 jsr showcav
 lda #0
 ldy #3
 sta 53248,y
 dey
 bpl *-4
 lda #$a4
 sta 708
 lda #$f8
 sta 709
 lda #$0a
 sta 710
 lda #$a2
 sta 711

 lda strig0
 beq *-3

titloop  equ *

 lda <title
 sta adtit
 lda >title
 sta adtit+1

 lda >tit
 sta zestaw

 ldx #4

wtl0     equ *

 txa
 pha

 ldy #0

wtl2     equ *

 tya
 pha
 sty kolor
 lda #4
 jsr waitfstr
 pla
 tay
 iny
 iny
 cpy #15
 bcc wtl2

 pla
 pha
 cmp #4
 bcc wtl3
 lda #255
 jsr waitfstr
 lda #150
 jsr waitfstr

wtl3     equ *

 lda #100
 jsr waitfstr

 ldy #14

wtl1     equ *

 tya
 pha
 sty kolor
 lda #4
 jsr waitfstr
 pla
 tay
 dey
 dey
 bpl wtl1
 lda >got
 sta zestaw

 lda adtit
 clc
 adc #64
 sta adtit
 lda adtit+1
 adc #0
 sta adtit+1

 pla
 tax
 dex
 bpl wtl0
 jmp titloop

waitfstr equ *

 clc
 adc 20
 pha

pse1     equ *

 pla
 cmp 20
 bne *+3
 rts
 pha
 lda 20
 cmp 20
 beq *-2
 lda strig0
 beq pse2
 lda $d01f
 cmp #6
 beq pse2
 lda 764
 cmp #255
 beq pse1
 ldx pozx
 cmp haslo,x
 beq *+4
 ldx #255
 inx
 stx pozx
 lda #255
 sta 764
 cpx #11
 bcc pse1
 lda $6ff
 eor #255
 sta $6ff
 beq death
 ldy #3
 lda guns,y
 sta tytul,y
 lda guns+4,y
 sta tytul+32,y
 lda guns+8,y
 sta tytul+28,y
 lda guns+12,y
 sta tytul+60,y
 dey
 bpl *-25
 jmp life

death    equ *

 ldy #3
 lda #0
 sta tytul,y
 sta tytul+28,y
 sta tytul+32,y
 sta tytul+60,y
 dey
 bpl *-13

life     equ *

 lda #0
 sta pozx
 sta 20
 jmp pse1

pse2     equ *

 ldx stos
 txs

 lda #0
 sta zezw
 lda #4
 jsr zgaskol
 lda <newdl
 sta dlptr
 lda >newdl
 sta dlptr+1
 lda #64
 sta 54286
 lda <dlint
 sta dliv
 lda >dlint
 sta dliv+1
 lda #192
 sta 54286
 lda #0
 sta ycav
 lda #8
 sta xcav
 lda #$a8
 sta 706
 lda #$b4
 sta 707
 lda #$1a
 sta 704
 lda #$56
 sta 705
 jsr showcav
 lda #$92
 sta 708
 lda #$a4
 sta 709
 lda #$7a
 sta 710
 lda #$1e
 sta 711
 lda #0
 sta 712
 ldy #7
 lda 704,y
 sta zpcol,y
 dey
 bpl *-7

* glowna petla gry

loop     equ *

 lda #255
 sta 764
 sta $d01e
 lda jstick0
 and #15
 sta joy
 cmp #13
 beq lpo1
 cmp #14
 bne lpo2

lpo1     equ *

 lda #1
 jsr pause
 jmp norg

lpo2     equ *

 lda #2
 jsr pause
 lda 764
 cmp #33
 bne *+5
 jsr przerwa

 lda jstick0
 and #15
 sta joy
 lda yplr
 cmp lyplr
 bne move
 lda yplr
 sec
 sbc #32
 and #7
 bne move
 lda joy
 and #4
 bne right
 lda #9
 sta plfaz
 dec xplr

right    equ *

 lda joy
 and #8
 bne move
 lda #0
 sta plfaz
 inc xplr

move     equ *

 jsr fazy
 lda yplr
 sta lyplr
 lda joy
 eor #255
 and #12
 bne *+7
 lda #0
 sta faza

norg     equ *

 jsr obekr

 jsr sprawdz

testlift equ *

 lda joy
 cmp #14
 beq tsl1
 cmp #13
 beq tsl1
 jmp contloop

tsl1     equ *

 lda adr1
 pha
 lda adr1+1
 pha
 lda #0
 sta pom
 ldy #1
 jsr readstat
 cmp #$0c
 bcc ttl1
 cmp #$0f
 bcs ttl1
 lda #2
 sta pom

ttl1     equ *

 ldy #3
 jsr readstat
 cmp #$0c
 bcc ttl2
 cmp #$0f
 bcs ttl2
 lda pom
 ora #1
 sta pom

ttl2     equ *

 lda pom
 bne *+5
 jmp jazda
 ldx #0
 cmp #1
 beq ttl4
 ldx #9
 lda xplr
 and #7
 beq jazda

ttl4     equ *

 stx plfaz

ttl3     equ *

 lda #2
 jsr pause
 jsr fazy
 dec xplr
 lda pom
 cmp #1
 bne *+8
 inc xplr
 inc xplr
 jsr showplr
 lda xplr
 and #7
 beq jazda
 jmp ttl3

* jazda winda

jazda    equ *

 pla
 sta adr1+1
 pla
 sta adr1
 lda joy
 cmp #13
 beq wdol
 ldy #1
 jsr readstat
 cmp #$0c
 bne *+5
 jmp uplift
 cmp #$0e
 bne *+5
 jmp uplift
 ldy #3
 jsr readstat
 cmp #$0c
 bne *+5
 jmp uplift
 cmp #$0e
 bne *+5
 jmp uplift
 jmp contloop

wdol     equ *

 lda joy
 and #1
 beq contloop
 ldy #1
 jsr readstat
 cmp #$0d
 bne *+5
 jmp dwlift
 cmp #$0e
 bne *+5
 jmp dwlift
 ldy #3
 jsr readstat
 cmp #$0d
 bne *+5
 jmp dwlift
 cmp #$0e
 bne *+5
 jmp dwlift

contloop equ *

 jsr skok
 jsr showplr

 lda 764
 cmp #28
 bne *+5
 jmp brkgame

 jmp loop


obekr    equ *

 lda xplr
 sec
 sbc #64
 lsr @
 lsr @
 sta adr1
 lda yplr
 sec
 sbc #32
 lsr @
 lsr @
 lsr @
 lsr @
 tay
 beq zeroy

zer1     equ *

 lda adr1
 clc
 adc #32
 sta adr1
 lda adr1+1
 adc #0
 sta adr1+1
 dey
 bne zer1

zeroy    equ *

 lda adr1
 clc
 adc <ekran-1
 sta adr1
 lda #0
 adc >ekran-1
 sta adr1+1
 rts

sprawdz  equ *

 lda joy
 and #4
 bne *+5
 jmp testleft
 lda joy
 and #8
 bne *+5
 jmp testrght
 jmp testdown

* zderzenia z prawej strony

testrght equ *

 ldy #35
 jsr readstat
 ldy #3
 cmp #$02
 bne *+5
 jsr opendoor

 ldy #35
 jsr readstat
 cmp #$01
 bne nrd2
 lda xplr
 and #%11111000
 sta xplr
 lda #0
 sta faza

nrd2     equ *

 jmp testdown

* zderzenia z lewej strony

testleft equ *

 ldy #33
 jsr readstat
 ldy #0
 cmp #$02
 bne *+5
 jsr opendoor

 ldy #33
 jsr readstat
 cmp #$01
 bne testdown
 lda xplr
 and #%11111000
 clc
 adc #8
 sta xplr
 lda #0
 sta faza

* testowanie posrodku

testdown equ *

 lda strig0
 bne nosw
 ldy #1
 jsr readstat
 sta pom
 ldy #2
 jsr readstat
 cmp pom
 bne tdn1
 ldy #1
 jsr testuj
 jmp ttd1

tdn1     equ *

 cmp #$03
 bcc ttd1
 cmp #$0a
 bcs ttd1
 ldy #2
 jsr testuj

ttd1     equ *

 ldy #2
 lda (adr1),y
 cmp #79
 bne noswitch
 lda #255
 sta timer
 jsr zgas

noswitch  equ *

 ldy #1
 lda (adr1),y
 cmp #78
 bne nosw
 lda #255
 sta timer
 jsr zgas

nosw     equ *

 jsr foto

 lda lot
 beq *+3
 rts
 ldy #66
 jsr readstat
 cmp #$01
 bne *+3
 rts
 cmp #$10
 bne *+3
 rts
 jmp spadaj

skok     equ *

 lda joy
 and #1
 beq *+3
 rts

 ldy #66
 jsr readstat
 cmp #$01
 beq skk0
 cmp #$10
 beq skk0
 rts

skk0     equ *

 lda #1
 sta lot
 sta goradol
 lda yplr
 sta zpy
 ldy #64
 lda plfaz
 beq *+4
 ldy #72
 sty plfaz
 lda #0
 sta faza

 ldy #5

skk1     equ *

 tya
 pha
 lda joy
 cmp #14
 beq nomsk
 and #4
 bne skwp
 lda xplr
 sec
 sbc xsktb,y
 sta xplr
 jmp nomsk

skwp     equ *

 lda xplr
 clc
 adc xsktb,y
 sta xplr

nomsk    equ *

 lda zpy
 sec
 sbc ysktb,y
 sta yplr
 jsr obekr
 jsr sprawdz
 jsr showplr
 lda #5
 jsr pause
 pla
 tay
 and #1
 beq *+5
 inc faza
 dey
 bpl skk1
 lda joy
 cmp #14
 bne spadaj
 jsr obekr
 jsr sprawdz
 ldy #66
 jsr readstat
 cmp #$01
 beq *+6
 cmp #$10
 bne *+5
 jmp spend

 ldy #5

skk2     equ *

 tya
 pha
 lda yplr
 clc
 adc #2
 sta yplr
 jsr showplr
 lda #4
 jsr pause
 pla
 tay
 and #1
 beq *+5
 inc faza
 dey
 bpl skk2
 lda yplr
 clc
 adc #4
 sta yplr
 jmp spe2

spadaj   equ *

 lda #1
 sta lot
 ldy #72
 lda joy
 and #4
 beq *+4
 ldy #64
 sty plfaz
 lda #4
 sta faza

sploop   equ *

 lda lot
 and #1
 bne *+5
 inc faza
 lda faza
 cmp #6
 bcc *+4
 lda #5
 sta faza
 jsr obekr
 ldy #66
 jsr readstat
 cmp #$01
 beq spend
 cmp #$10
 beq spend
 ldy lot
 lda joy
 and #4
 bne spwp
 lda xplr
 sec
 sbc spdxtb-1,y
 sta xplr
 jmp nsppl

spwp     equ *

 lda xplr
 clc
 adc spdxtb-1,y
 sta xplr

nsppl    equ *

 lda yplr
 clc
 adc spdytb-1,y
 sta yplr
 iny
 cpy #14
 bcc *+4
 ldy #13
 sty lot
 jsr obekr
 jsr sprawdz
 jsr showplr
 lda #4
 jsr pause
 jmp sploop

spend    equ *

 lda yplr
 and #%11110000
 sta yplr
 lda music
 bne *+7
 lda #100
 sta $d206
 lda #5
 sta faza
 ldy #1

spe1     equ *

 tya
 pha
 clc
 adc #1
 asl @
 ldy music
 bne *+5
 sta $d207
 inc faza

spe3     equ *

 jsr showplr
 lda #4
 jsr pause
 pla
 tay
 dey
 bpl spe1

spe2     equ *

 ldy #0
 lda plfaz
 cmp #64
 beq *+4
 ldy #9
 sty plfaz
 lda #0
 sta faza
 sta lot
 sta goradol
 ldy music
 bne *+8
 sta $d206
 sta $d207
 sta goradol
 jmp showplr

testuj   equ *

 pha
 cmp #$03
 bne nokey
 lda point
 clc
 adc #30
 sta point
 ldx #0
 jsr zwieksz
 ldx #8
 jsr clrpos

nokey    equ *

 pla
 pha
 cmp #$07
 beq *+5
 jmp nofood
 lda point
 clc
 adc #95
 sta point
 ldx #8
 jsr clrpos
 lda food
 cmp #6
 bcs tomufo
 lda $6fe
 beq *+5
 jmp nofood
 lda #9
 sta food
 sta food+1
 jmp nofood

tomufo   equ *

 ldy #80
 lda plfaz
 beq *+4
 ldy #86
 sty plfaz
 lda #0
 sta faza
 lda #50
 jsr pause
 ldy #5

rzygaj   equ *

 tya
 pha
 cmp #3
 bcs rzg1
 lda music
 bne *+8
 sta $d206
 sta $d207
 jmp rzg0

rzg1     equ *

 lda #%11001010
 ldy music
 bne *+5
 sta $d207
 lda faza
 asl @
 asl @
 asl @
 asl @
 adc #155
 ldy music
 bne *+5
 sta $d206

rzg0     equ *

 jsr niepokaz
 lda #6
 jsr pause
 inc faza
 pla
 tay
 dey
 bpl rzygaj

 lda #50
 jsr pause

 ldy #0
 lda plfaz
 cmp #80
 beq *+4
 ldy #9
 sty plfaz
 lda #0
 sta faza
 pla
 rts

nofood   equ *

 pla
 pha
 cmp #$08
 bne nodrink
 lda $6fe
 bne niepij
 lda drink
 clc
 adc #5
 sta drink
 lda drink
 cmp #10
 bcc *+7
 lda #9
 sta drink

niepij   equ *

 lda point
 clc
 adc #80
 sta point
 ldx #8
 jsr clrpos

nodrink  equ *

 pla
 pha
 cmp #$05
 bne nomap
 lda point
 clc
 adc #110
 sta point
 ldx #8
 jsr zwieksz
 ldx #8
 jsr clrpos
 ldx #0
 jsr zabierz

nomap    equ *

 pla
 pha
 cmp #$06
 bne nofilm
 lda point
 clc
 adc #105
 sta point
 ldx #6
 jsr zwieksz
 ldx #8
 jsr clrpos
 ldx #255
 jsr zabierz

nofilm   equ *

 pla
 cmp #$0f
 beq *+5
 jmp nfl1
 lda map
 cmp maxmap
 bcc nfl1
 lda map+1
 cmp maxmap+1
 bcc nfl1
 lda film
 cmp maxfilm
 bcc nfl1
 lda film+1
 cmp maxfilm+1
 bcc nfl1
 lda #4
 jsr zgaskol
 lda <enddl
 sta dlptr
 lda >enddl
 sta dlptr+1
 lda #64
 sta 54286
 lda <endlint
 sta 512
 lda >endlint
 sta 513
 lda #192
 sta 54286
 lda #14
 sta xcav
 lda #15
 sta ycav
 jsr showcav
 lda #255
 sta zezw
 lda #0
 ldy #7
 sta 53248,y
 dey
 bpl *-4
 lda #$a4
 sta 708
 lda #$f8
 sta 709
 lda #$0a
 sta 710
 lda #$a2
 sta 711
 lda strig0
 beq *-3
 lda strig0
 bne *-3
 jmp begin

nfl1     equ *

 rts

zwieksz  equ *

 inc keys+1,x
 lda keys+1,x
 cmp #10
 bcc zwz1
 lda #0
 sta keys+1,x
 inc keys,x

zwz1     equ *

 rts

zmniejsz equ *

 dec keys+1,x
 bpl zmz1
 lda #9
 sta keys+1,x
 dec keys,x

zmz1     equ *

 rts

opendoor equ *

 lda xplr
 ora #7
 cpy #0
 beq *+4
 and #%11111000
 sta xplr
 lda keys
 bne opr1
 lda keys+1
 bne opr1
 rts

opr1     equ *

 ldx #0
 jsr zmniejsz
 ldx #12
 lda goradol
 beq opr2
 tya
 clc
 adc #32
 tay

opr2     equ *

 jmp clrpos

* wyswietlenie Hansa

showplr  equ *

 lda food
 bne ctl1
 lda food+1
 bne ctl1
 jmp gmeovr

ctl1     equ *

 lda drink
 bne ctl2
 lda drink+1
 bne ctl2
 jmp gmeovr

ctl2     equ *

 lda 764
 cmp #255
 beq niepokaz
 cmp #33
 beq niepokaz
 cmp #28
 beq niepokaz
 ldx #1
 jsr zabierz
 lda #255
 sta 764

niepokaz equ *

 lda xplr
 sta 53250
 sta 53251
 lda #0
 ldy #180
 sta pmb+$600,y
 sta pmb+$700,y
 dey
 bne *-7
 lda #0
 sta adr1+1
 lda faza
 clc
 adc plfaz
 asl @
 rol adr1+1
 asl @
 rol adr1+1
 asl @
 rol adr1+1
 asl @
 rol adr1+1
 asl @
 rol adr1+1
 sta adr1
 lda adr1+1
 adc >plr1
 sta adr1+1
 lda yplr
 sta adr2
 lda >pmb
 clc
 adc #6
 sta adr2+1
 ldy #31
 lda (adr1),y
 sta (adr2),y
 dey
 bpl *-5
 lda adr1+1
 clc
 adc #4
 sta adr1+1
 inc adr2+1
 ldy #31
 lda (adr1),y
 sta (adr2),y
 dey
 bpl *-5

 lda yplr
 cmp #128
 bcc ctl3
 inc ycav
 lda #33
 sta yplr
 jsr showcav

ctl3     equ *

 lda xplr
 cmp #182
 bcc ctl5
 lda #66
 sta xplr
 inc xcav
 jsr showcav

ctl5     equ *

 lda xplr
 cmp #65
 bcs ctl6
 lda #181
 sta xplr
 dec xcav
 jsr showcav

ctl6     equ *

 rts

przerwa  equ *

 lda #255
 sta zezw
 ldx #18
 lda plfaz
 pha
 beq *+4
 ldx #25
 stx plfaz
 lda #0
 sta faza
 lda #1
 jsr moment
 jsr ctl2

przloop  equ *

 lda #0
 sta faza
 jsr ctl2
 lda $d20a
 and #15
 asl @
 asl @
 ora #128
 jsr moment
 inc faza
 jsr ctl2
 lda $d20a
 and #3
 asl @
 asl @
 ora #16
 jsr moment
 inc faza
 jsr ctl2
 lda $d20a
 and #7
 asl @
 asl @
 ora #96
 jsr moment
 inc faza
 jsr ctl2
 lda $d20a
 and #3
 asl @
 ora #8
 jsr moment
 ldy #2

prz1     equ *

 tya
 pha
 inc faza
 jsr ctl2
 lda $d20a
 and #3
 asl @
 ora #6
 jsr moment
 pla
 tay
 dey
 bpl prz1
 lda ext
 beq przloop

 lda #0
 sta zezw
 sta faza
 pla
 sta plfaz
 lda #255
 sta 764
 jmp ctl2

moment   equ *

 clc
 adc 20
 tax
 lda #0
 sta ext

mom1     equ *

 lda jstick0
 cmp #15
 beq *+8
 lda #255
 sta ext
 rts
 cpx 20
 bne mom1
 rts

* zasloniecie fotokomorki

foto     equ *

 lda $d00e
 ora $d00f
 and #3
 beq fot0
 lda #0
 sta zmfo
 lda #1
 sta zmdr

fot0     equ *

 lda timer
 beq *+5
 jmp exfoto

 lda $d006
 and #8
 bne zabij
 lda $d007
 and #8
 bne *+6
 sta $d01e
 rts

zabij    equ *

 lda adr1
 sec
 sbc <ekran
 ldy #0
 cmp #128
 bcc *+4
 ldy #128

 ldy #0
 tya
 pha
 jsr showplr
 pla
 tay

fot1     equ *

 lda ekran,y
 cmp #84
 beq fot2
 cmp #116
 beq fot5
 iny
 bne fot1

fot5     equ *

 tya
 sec
 sbc #2
 tay
 lda #120
 sta char
 jmp fot4

fot2     equ *

 tya
 clc
 adc #4
 tay
 lda #88
 sta char

fot4     equ *

 lda music
 bne *+7
 lda #100
 sta $d200
 ldx #92
 lda plfaz
 beq *+4
 ldx #94
 stx plfaz

 ldx #4

fot3     equ *

 txa
 pha

 tya
 pha

 lda #0
 sta faza
 jsr ctl2

 pla
 tay

 lda char
 sta ekran,y
 ora #1
 sta ekran+1,y

 ldx #15

ogn1     equ *

 lda music
 bne *+5
 stx $d201

 cpx #7
 bcs ogn2

 lda #0
 sta ekran,y
 lda #1
 sta ekran+1,y
 txa
 pha
 tya
 pha
 lda #1
 sta faza
 jsr ctl2
 pla
 tay
 pla
 tax

ogn2     equ *

 lda #1
 jsr pause
 dex
 dex
 dex
 bpl ogn1

 pla
 tax
 dex
 bpl fot3

gmeovr   equ *

 lda #255
 sta zezw
 lda #3
 sta czas
 jsr zgaskol
 lda #34
 sta 559
 lda #0
 sta 53248
 sta 53249
 sta 53250
 sta 53251
 lda <zabijdl
 sta 560
 lda >zabijdl
 sta 561
 lda >got+512
 sta 756
 ldy #0

gov1     equ *

 tya
 ora #$20
 sta 709
 lda #5
 jsr pause
 iny
 iny
 cpy #16
 bcc gov1
 lda strig0
 beq *-3
 ldx #150

gov2     equ *

 lda #1
 jsr pause
 lda strig0
 beq *+5
 dex
 bne gov2

 lda #5
 sta czas
 jsr zgaskol
 jmp begin

exfoto   equ *

 sta $d01e
 rts

brkgame  equ *

 lda #255
 sta zezw
 lda #3
 sta czas
 jsr zgaskol
 jmp begin

zgaskol  equ *

 ldy #14

zmc2     equ *

 tya
 sta pom
 ldx #8

zmc1     equ *

 lda 704,x
 and #15
 cmp pom
 bcc nozmcol
 lda 704,x
 and #%11110000
 ora pom
 sta 704,x

nozmcol  equ *

 dex
 bpl zmc1
 lda czas
 jsr pause
 dey
 dey
 bpl zmc2
 ldy #7
 lda 712
 sta 704,y
 dey
 bpl *-4
 rts

* zapalenie fotokomorek

zapal    equ *

 ldy #0

cnl1     equ *

 lda ekran,y
 cmp #110
 bne cnl2
 lda #78
 sta ekran,y
 lda #79
 sta ekran+1,y

cnl2     equ *

 cmp #96
 bne cnl3
 lda #208
 sta ekran,y
 lda #209
 sta ekran+1,y

cnl3     equ *

 dey
 bne cnl1
 rts

* jazda winda w dol

dwlift   equ *

 lda #34
 sta 623
 lda #0
 sta faza

 ldy #63

dwl1     equ *

 lda #2
 jsr pause
 tya
 pha
 jsr showplr
 lda #255
 sta pom
 jsr podest
 inc yplr
 lda yplr
 cmp #124
 bcc dwl2
 inc ycav
 lda #32
 sta yplr
 jsr showcav
 pla
 lda #16
 pha

dwl2     equ *

 pla
 tay
 dey
 bpl dwl1
 lda #0
 sta pom
 jsr podest
 lda #33
 sta 623
 jmp loop

uplift   equ *

 lda #34
 sta 623
 lda #0
 sta faza
 ldy #63

upl1     equ *

 lda #2
 jsr pause
 tya
 pha
 jsr showplr
 lda #255
 sta pom
 jsr podest
 dec yplr
 lda yplr
 cmp #32
 bcs upl2
 dec ycav
 lda #123
 sta yplr
 jsr showcav
 pla
 lda #11
 pha

upl2     equ *

 pla
 tay
 dey
 bpl upl1
 lda #0
 sta pom
 jsr podest
 lda #33
 sta 623
 jmp loop


* wyswietlenie podestu windy

podest   equ *

 ldy #35
 ldx #2
 lda #127
 and pom
 sta (adr2),y
 dey
 dex
 bpl *-4
 dec adr2+1
 ldy #35
 ldx #3
 lda #128
 and pom
 sta (adr2),y
 dey
 dex
 bpl *-4
 ldy #32
 lda #255
 and pom
 sta (adr2),y
 inc adr2+1
 rts


pause    equ *

 clc
 adc 20
 cmp 20
 bne *-2
 rts


fazy     equ *

 lda kupa
 eor #1
 sta kupa
 bne *+3
 rts
 inc faza
 lda faza
 cmp #9
 bcc *+4
 lda #1
 sta faza
 rts


* odczytanie statusu znaku

readstat equ *

 lda (adr1),y
 and #127
 lsr @
 tax
 lda stat,x
 rts

 icl 'side_a/HK_PLAY.ASM'
 icl 'side_a/HK_PROC.ASM'

guns     equ *

 dta d'IJKL'
 dta d'MNOP'

 dta d'ABCD'
 dta d'EFGH'

 org $02e0
 dta a(init)


