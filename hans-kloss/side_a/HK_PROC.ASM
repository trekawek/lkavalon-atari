;◢▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀◣
;|  Druga czesc gry  |
;|    "Hans Kloss"   |
;| ----------------- |
;|                   |
;| 19 th March 1992  |
;|     09:57 pm      |
;◥▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄◤

* kasowanie drzwi lub przedmiotu

clrpos   equ *

 tya
 pha
 txa
 sta (adr1),y
 iny
 ora #1
 sta (adr1),y
 pla
 clc
 adc #32
 tay
 txa
 clc
 adc #32
 sta (adr1),y
 iny
 ora #1
 sta (adr1),y
 lda adr1
 sec
 sbc <ekran
 sta pom
 tya
 clc
 adc pom
 sec
 sbc #33
 sta pom
 txa
 cmp #12
 bne niedrzwi
 lda #15
 sta sou1
 lda nrdrz
 sta adr3
 lda nrdrz+1
 sta adr3+1
 ldy #0
 lda cave
 sta (adr3),y
 iny
 lda pom
 sta (adr3),y
 iny
 lda #255
 sta (adr3),y
 lda adr3
 clc
 adc #2
 sta nrdrz
 lda adr3+1
 adc #0
 sta nrdrz+1
 rts

niedrzwi equ *

 lda #140
 sta sound

 lda nrprz
 sta adr3
 lda nrprz+1
 sta adr3+1
 ldy #0
 lda cave
 sta (adr3),y
 iny
 lda pom
 sta (adr3),y
 iny
 lda #255
 sta (adr3),y
 lda adr3
 clc
 adc #2
 sta nrprz
 lda adr3+1
 adc #0
 sta nrprz+1
 rts

zabierz  equ *

 tya
 pha
 lda music
 pha
 txa
 pha

 lda #255
 sta zezw
 lda #4
 sta czas
 jsr zgaskol
 ldy #7
 lda #0
 sta $d000,y
 dey
 bpl *-4

 lda >roc
 sta 756
 lda #64
 sta 54286

 lda <mapdlint
 sta 512
 lda >mapdlint
 sta 513
 lda <newmapdl
 sta 560
 lda >newmapdl
 sta 561
 lda #192
 sta 54286

 ldy #0
 sty 709

zab1     equ *

 sty 710
 lda #4
 jsr pause
 iny
 iny
 cpy #11
 bcc zab1

 pla
 beq zabsch
 bmi *+5
 jmp zebrkon
 jmp zbplan

zabsch   equ *

 lda cave
 ldy #8
 cmp nrschem,y
 beq znsch
 dey
 bpl *-6
 jmp zebrkon

znsch    equ *

 tya
 asl @
 asl @
 tay
 lda schtab,y
 sta adr2
 lda schtab+1,y
 sta adr2+1
 lda schtab+2,y
 sta adr3
 lda schtab+3,y
 sta adr3+1

 ldx #2

scm1     equ *

 ldy #6
 lda (adr2),y
 sta (adr3),y
 dey
 bpl *-5
 lda adr2
 clc
 adc #21
 sta adr2
 lda adr2+1
 adc #0
 sta adr2+1
 lda adr3
 clc
 adc #32
 sta adr3
 lda adr3+1
 adc #0
 sta adr3+1
 dex
 bpl scm1
 jmp zebrkon

zbplan   equ *

 lda cave
 ldy #11
 cmp nrtekst,y
 beq znpla
 dey
 bpl *-6
 jmp zebrkon

znpla    equ *

 tya
 asl @
 asl @
 tay
 lda tektab,y
 sta adr2
 lda tektab+1,y
 sta adr2+1
 lda tektab+2,y
 sta adr3
 lda tektab+3,y
 sta adr3+1

 ldx #3

scp1     equ *

 ldy #7
 lda (adr2),y
 sta (adr3),y
 dey
 bpl *-5
 lda adr2
 clc
 adc #32
 sta adr2
 lda adr2+1
 adc #0
 sta adr2+1
 lda adr3
 clc
 adc #32
 sta adr3
 lda adr3+1
 adc #0
 sta adr3+1
 dex
 bpl scp1
 jmp zebrkon

mapdlint equ *

 pha
 lda >got
 sta $d40a
 sta $d409
 pla
 rti

zebrkon  equ *

 lda strig0
 beq *-3
 lda strig0
 bne *-3
 ldy #10

zbk1     equ *

 sty 710
 lda #4
 jsr pause
 dey
 dey
 bpl zbk1

 lda #64
 sta 54286
 lda <dlint
 sta 512
 lda >dlint
 sta 513
 ldy #7
 lda zpcol,y
 sta 704,y
 dey
 bpl *-7
 lda <newdl
 sta dlptr
 lda >newdl
 sta dlptr+1
 lda #192
 sta 54286
 lda #0
 sta zezw
 pla
 beq zbk2

zbk2     equ *

 pla
 tay
 rts

showcav equ *

 ldy #8
 lda 704,y
 sta zpcol,y
 lda #0
 sta 704,y
 dey
 bpl *-12
 lda #250
 sta xmine
 lda #1
 sta lsnxtmin
 lda #1
 jsr pause
 lda #0
 sta 53248
 sta 53249
 sta 53250
 sta 53251
 jsr lookfor
 lda <ekran
 sta adr2
 lda >ekran
 sta adr2+1
 ldy #1

sho1     equ *

 iny
 cpy cavelen
 bcs ony1
 tya
 pha
 lda (adca),y
 and #1
 beq onlyone
 lda (adca),y
 and #254
 sta char
 iny
 lda (adca),y
 asl @
 sta linelen
 tax
 ldy #0

non1     equ *

 lda char
 sta (adr2),y
 iny
 ora #1
 sta (adr2),y
 iny
 dex
 dex
 bpl non1
 lda adr2
 clc
 adc linelen
 sta adr2
 lda adr2+1
 adc #0
 sta adr2+1
 pla
 tay
 iny
 cpy cavelen
 bcc sho1
 jmp ony1

onlyone  equ *

 lda (adca),y
 ldy #0
 sta (adr2),y
 iny
 ora #1
 sta (adr2),y
 lda adr2
 clc
 adc #2
 sta adr2
 lda adr2+1
 adc #0
 sta adr2+1
 pla
 tay
 cpy cavelen
 bcc sho1

ony1     equ *

 lda <otwarte
 sta adr3
 lda >otwarte
 sta adr3+1

ony2     equ *

 ldy #0
 lda (adr3),y
 cmp #255
 beq ony5
 cmp cave
 bne ony3
 iny
 lda (adr3),y
 tax
 lda #12
 sta ekran,x
 inx
 lda #13
 sta ekran,x
 txa
 clc
 adc #31
 tax
 lda #44
 sta ekran,x
 inx
 lda #45
 sta ekran,x

ony3     equ *

 lda adr3
 clc
 adc #2
 sta adr3
 lda adr3+1
 adc #0
 sta adr3+1
 jmp ony2

ony5     equ *

 lda <zebrane
 sta adr3
 lda >zebrane
 sta adr3+1

ony6     equ *

 ldy #0
 lda (adr3),y
 cmp #255
 beq ony9
 cmp cave
 bne ony7
 iny
 lda (adr3),y
 tax
 lda #8
 sta ekran,x
 inx
 lda #9
 sta ekran,x
 txa
 clc
 adc #31
 tax
 lda #40
 sta ekran,x
 inx
 lda #41
 sta ekran,x

ony7     equ *

 lda adr3
 clc
 adc #2
 sta adr3
 lda adr3+1
 adc #0
 sta adr3+1
 jmp ony6

ony9     equ *

 lda timer
 beq *+5
 jsr zgas

 ldx #79
 lda random
 and #1
 beq *+4
 ldx #143
 stx ymine
 lda random
 and #127
 cmp #100
 bcs *-7
 adc #74
 sta xmine
 lda #1
 sta zxmin
 jsr obmin
 jsr lfmintst
 lda xmine
 cmp #200
 bcc okshcami
 lda #255
 sta zxmin
 jsr rgmintst
 lda xmine
 cmp #200
 bcc okshcami

badshcam equ *

 lda #250
 sta xmine
 lda #0
 sta lsnxtmin
 sta 53248
 sta 53249
 jmp exshcami

okshcami equ *

 ldy #1
 jsr readmine
 cmp #$01
 beq badshcam
 cmp #$02
 beq badshcam
 cmp #$0c
 beq badshcam
 cmp #$0d
 beq badshcam
 cmp #$0e
 beq badshcam

 ldy #2
 jsr readmine
 cmp #$01
 beq badshcam
 cmp #$02
 beq badshcam
 cmp #$0c
 beq badshcam
 cmp #$0d
 beq badshcam
 cmp #$0e
 beq badshcam

 ldy #3
 jsr readmine
 cmp #$01
 beq badshcam
 cmp #$02
 beq badshcam
 cmp #$0c
 beq badshcam
 cmp #$0d
 beq badshcam
 cmp #$0e
 beq badshcam

exshcami equ *

 ldx #8
 lda zpcol,x
 sta 704,x
 dex
 bpl *-7
 rts

lookfor  equ *

 lda <dane
 sta adr1
 lda >dane
 sta adr1+1
 lda ycav
 asl @
 asl @
 asl @
 asl @
 adc xcav
 sta cave

loopfor equ *

 lda adr1
 sta lad
 lda adr1+1
 sta lad+1
 ldy #0
 lda (adr1),y
 cmp cave
 beq found
 iny
 lda (adr1),y
 clc
 adc adr1
 sta adr1
 lda adr1+1
 adc #0
 sta adr1+1
 cmp lad+1
 bne loopfor
 lda adr1
 cmp lad
 bne loopfor
 lda #184
 sta xplr
 lda lc
 sta cave
 lda lx
 sta xcav
 lda ly
 sta ycav
 rts

found    equ *

 iny
 lda (adr1),y
 sta cavelen
 lda adr1
 sta adca
 lda adr1+1
 sta adca+1
 lda xcav
 sta lx
 lda ycav
 sta ly
 lda cave
 sta lc
 rts

zgas     equ *

 ldy #0

spt1     equ *

 lda ekran,y
 cmp #78
 bne spt2
 lda #110
 sta ekran,y
 lda #111
 sta ekran+1,y

spt2     equ *

 cmp #208
 bne spt3
 lda #96
 sta ekran,y
 lda #97
 sta ekran+1,y

spt3     equ *

 dey
 bne spt1
 rts


titdlint equ *

 pha
 tya
 pha
 lda $d40b
 cmp #79
 bcs tdl1
 ldy >ftl2
 and #4
 beq *+4
 ldy >ftl1
 sta $d40a
 sty chbase
 pla
 tay
 pla
 rti

tdl1     equ *

 lda #0
 sta $d018
 lda >tit
 sta chbase
 ldy #2
 sta $d40a
 ldy #4

tdl2     equ *

 sty $d017
 sta $d40a
 iny
 cpy #15
 bcc tdl2
 ldy #5
 sta $d40a
 dey
 bpl *-4
 lda #14
 sta $d017
 ldy #18
 sta $d40a
 dey
 bpl *-4
 lda kolor
 sta $d017
 lda zestaw
 sta chbase
 pla
 tay
 pla
 rti

endlint  equ *

 pha
 tya
 pha
 lda $d40b
 cmp #79
 bcs edl1
 ldy >fnd2
 and #4
 beq *+4
 ldy >fnd1
 sta $d40a
 sty chbase
 pla
 tay
 pla
 rti

edl1     equ *

 lda #0
 sta $d018
 lda #14
 sta $d017
 lda >got
 sta chbase
 pla
 tay
 pla
 rti

dlint    equ *

 pha
 tya
 pha
 lda $d40b
 cmp #79
 bcs dli1
 ldy >fnt2
 and #4
 beq *+4
 ldy >fnt1
 sta $d40a
 sty chbase
 pla
 tay
 pla
 rti

dli1     equ *

 ldy #3
 lda zpcol+4,y
 sta $d016,y
 dey
 bpl *-7
 lda >got
 sta $d40a
 sta chbase
 ldy #5
 sta $d40a
 dey
 bpl *-4
 lda >fnt2
 sta chbase
 ldy #10
 sta $d40a
 dey
 bpl *-4
 lda >fnt1
 sta chbase
 ldy #7
 sta $d40a
 dey
 bpl *-4
 lda >got
 ldy #0
 sta chbase
 sty $d018

 ldy #8
 sty $d017
 sta $d40a
 sta $d40a
 iny
 iny

dli2     equ *

 sty $d017
 sty $d40a
 iny
 iny
 cpy #15
 bcc dli2
 ldy #12
 sty $d017
 sty $d40a
 ldy #10
 sty $d017
 sty $d40a

 pla
 tay
 pla
 rti

vbint    equ *

 lda #0
 sta 77
 lda $d01f
 cmp #5
 bne nosel
 lda music
 bne nosel
 lda #255
 sta music
 lda #3
 sta $d208
 lda #$60
 jsr amp_

nosel    equ *

 lda $d01f
 cmp #3
 bne noopt
 lda music
 beq noopt
 lda #0
 sta music
 lda #$50
 jsr amp_
 lda #$40
 jsr amp_
 lda #32
 sta $d208

noopt    equ *

 lda music
 beq *+5
 jsr amplay_
 lda zezw
 beq vbi1
 lda music
 beq *+5
 jmp $e462
 ldy #7
 lda #0
 sta $d200,y
 dey
 bpl *-4
 jmp $e462

vbi1     equ *

 lda plfaz
 cmp #10
 bcs vbi2
 ldy #0
 lda faza
 cmp #1
 bne *+4
 ldy #20
 cmp #5
 bne *+4
 ldy #20
 lda music
 bne *+5
 sty $d207

vbi2     equ *

 lda timer
 beq noso2
 dec tim
 bpl noso1
 lda #2
 sta tim
 dec timer
 bne noso1
 lda music
 bne *+8
 sta $d200
 sta $d201
 jmp noso2

noso1    equ *

 ldx #230
 lda timer
 lsr @
 lsr @
 lsr @
 lsr @
 clc
 adc #15
 tay
 lda timer
 and #7
 cmp #7
 beq noso3
 ldx #0
 ldy #0

noso3    equ *

 lda music
 bne *+8
 stx $d201
 sty $d200

noso2    equ *

 lda 623
 cmp #34
 bne nowid1
 lda music
 bne nowid1
 lda #%00100111
 sta $d203
 lda #%01100011
 sta $d205
 lda #100
 sta $d202
 lda 20
 and #5
 ora #32
 sta $d204

nowid1   equ *

 lda 623
 cmp #34
 beq nowid2
 lda music
 bne nowid2
 lda #0
 sta $d202
 sta $d203
 sta $d204
 sta $d205

nowid2   equ *

 lda sound
 beq nodzw1
 sec
 sbc #50
 and #5
 ora #%10100000
 ldx music
 bne *+5
 sta $d203
 lda sound
 and #63
 ldx music
 bne *+5
 sta $d202
 lda sound
 sec
 sbc #2
 sta sound
 cmp #50
 bcs nodzw1
 lda #0
 sta sound
 lda music
 bne *+8
 sta $d202
 sta $d203

nodzw1   equ *

 lda timer
 beq ndz2
 cmp #1
 bne ndz2
 jsr zapal

ndz2     equ *

 lda sou1
 cmp #255
 beq ndz3
 lda #100
 sec
 sbc sou1
 ldx music
 bne ndz3-3
 sta $d204
 lda sou1
 ora #%01100000
 sta $d205
 dec sou1

ndz3     equ *

 lda point
 beq nosco
 lda 20
 and #1
 beq nosco
 dec point

 ldx #5

sco1     equ *

 inc score,x
 lda score,x
 cmp #10
 bcc nosco
 lda #0
 sta score,x
 dex
 bpl sco1

nosco    equ *

 dec zmfo
 bpl nsc1
 lda #81
 sta zmfo
 ldx #2
 jsr zmniejsz

nsc1     equ *

 dec zmdr
 bpl nsc2
 lda #97
 sta zmdr
 ldx #4
 jsr zmniejsz

nsc2     equ *

 jsr showpkt
 lda $06ff
 beq nsc3
 lda #9
 sta food
 sta food+1
 sta drink
 sta drink+1
 lda #30
 sta punkty+83
 sta punkty+89
 lda #31
 sta punkty+84
 sta punkty+90

nsc3     equ *

 lda 20
 and #3
 bne *+5
 jsr miny

 ldx #$a8
 ldy #$b4
 lda food
 cmp #3
 bcs nsc4
 lda 20
 and #3
 cmp #2
 bcc *+6
 ldx #$aa
 ldy #$b6

nsc4     equ *

 lda drink
 cmp #3
 bcs nsc5
 lda 20
 and #3
 cmp #2
 bcc *+6
 ldx #$aa
 ldy #$b6

nsc5     equ *

 stx 706
 sty 707
 jmp $e462

miny     equ *

 lda #0
 ldy #70
 sta pmb+$400,y
 sta pmb+$500,y
 iny
 cpy #145
 bcc *-9
 lda zezw
 beq *+3
 rts
 lda lsnxtmin
 bne *+8
 jsr losmine
 jmp nolsmin

 lda xmine
 sta 53248
 sta 53249

 ldy ymine
 ldx #7
 lda wzorminy,x
 sta pmb+$400,y
 lda wzorminy+8,x
 sta pmb+$500,y
 dey
 dex
 bpl *-14

 lda minfaz
 asl @
 asl @
 tax
 ldy ymine
 lda wzorminy+16,x
 sta pmb+$4fe,y
 lda wzorminy+17,x
 sta pmb+$4ff,y
 lda wzorminy+18,x
 sta pmb+$500,y

 jsr obmin

 lda zxmin
 bmi minrgt

 lda xmine
 cmp #177
 bcs minlft
 ldy #3
 jsr readmine
 ldx #255
 cmp #$01
 bne *+5
 stx zxmin
 cmp #$02
 bne *+5
 stx zxmin
 ldy #35
 jsr readmine
 ldx #255
 cmp #$01
 beq minlft
 cmp #$10
 beq minlft
 stx zxmin
 jmp minlft

minrgt   equ *

 lda xmine
 cmp #73
 bcc minlft
 ldy #0
 jsr readmine
 ldx #1
 cmp #$01
 bne *+5
 stx zxmin
 cmp #$02
 bne *+5
 stx zxmin
 ldy #32
 jsr readmine
 ldx #1
 cmp #$01
 beq minlft
 cmp #$10
 beq minlft
 stx zxmin

minlft   equ *

 lda xmine
 clc
 adc zxmin
 sta xmine
 cmp #185
 bcc *+7
 ldx #0
 stx lsnxtmin

 cmp #64
 bcs *+7
 ldx #0
 stx lsnxtmin

 lda minfaz
 clc
 adc zxmin
 bpl *+4
 lda #5
 cmp #6
 bcc *+4
 lda #0
 sta minfaz

nolsmin  equ *

 rts

losmine  equ *

 lda #250
 sta xmine
 lda random
 and #31
 beq *+3
 rts
 ldy #79
 lda random
 and #3
 asl @
 tax
 lda jpmintb,x
 sta minjmp+1
 lda jpmintb+1,x
 sta minjmp+2

minjmp   equ *

 jmp *

jpmintb  equ *

 dta a(minlfup)
 dta a(minrgup)
 dta a(minlfdw)
 dta a(minrgdw)

minlfup  equ *

 lda #79
 sta ymine
 lda #65
 sta xmine
 jsr obmin
 jmp lfmintst

minlfdw  equ *

 lda #143
 sta ymine
 lda #65
 sta xmine
 jsr obmin

lfmintst equ *

 ldy #1
 jsr readmine
 cmp #$01
 beq lmt1
 cmp #$02
 bne lmt2

lmt1     equ *

 lda #250
 sta xmine
 rts

lmt2     equ *

 ldy #33
 jsr readmine
 cmp #$01
 beq *+6
 cmp #$10
 bne lmt1

 lda #1
 sta lsnxtmin
 sta zxmin
 rts


minrgup  equ *

 lda #79
 sta ymine
 lda #184
 sta xmine
 jsr obmin
 jmp rgmintst

minrgdw  equ *

 lda #143
 sta ymine
 lda #184
 sta xmine
 jsr obmin

rgmintst equ *

 ldy #1
 jsr readmine
 cmp #$01
 beq rmt1
 cmp #$02
 bne rmt2

rmt1     equ *

 lda #250
 sta xmine
 rts

rmt2     equ *

 ldy #34
 jsr readmine
 cmp #$01
 beq *+6
 cmp #$10
 bne rmt1

 lda #1
 sta lsnxtmin
 lda #255
 sta zxmin
 rts


obmin    equ *

 lda xmine
 sec
 sbc #64
 lsr @
 lsr @
 sta admin
 lda ymine
 sec
 sbc #32
 lsr @
 lsr @
 lsr @
 lsr @
 tay
 beq zermin

zmn1     equ *

 lda admin
 clc
 adc #32
 sta admin
 lda admin+1
 adc #0
 sta admin+1
 dey
 bne zmn1

zermin   equ *

 lda admin
 clc
 adc <ekran-1
 sta admin
 lda #0
 adc >ekran-1
 sta admin+1
 rts

readmine equ *

 lda (admin),y
 and #127
 lsr @
 tax
 lda stat,x
 rts


showpkt  equ *

 ldy #5
 lda score,y
 ora #208
 sta punkty+5,y
 dey
 bpl showpkt+2

 ldy #3
 ldx #2
 jsr showdig
 ldx #4
 jsr showdig
 ldx #0
 jsr showdig
 ldx #6
 jsr showdig
 ldx #8
 jmp showdig

showdig  equ *

 lda keys,x
 ora #16
 sta punkty+80,y
 lda keys+1,x
 ora #16
 sta punkty+81,y
 tya
 clc
 adc #6
 tay
 rts

haslo    equ *

 dta b($39) ;- H
 dta b($2a) ;- E
 dta b($3f) ;- A
 dta b($10) ;- V
 dta b($2b) ;- Y
 dta b($21) ;-
 dta b($25) ;- M
 dta b($2a) ;- E
 dta b($2d) ;- T
 dta b($3f) ;- A
 dta b($00) ;- L

title    equ *

 dta d'      ^_ ',B($5C),B($5D),B($5D),B($5E),d' `abcdefghijk      '
 dta d'      ~',B($7F),d' <==> lmnopqrstuvw      '

 dta d'Do powstania gry przyczynili si',B($45)
 dta d'                                '

 dta d'            Program :           '
 dta d'          Dariusz [o',B($4C),d'na         '

 dta d'            Grafika :           '
 dta d'Sebastian Michna i Dariusz [o',B($4C),d'na'

 dta d'             Muzyka:            '
 dta d'               D.K.             '

 dta d'                                '
 dta d'                                '

gratul   equ *

 dta d'          Gratulacje !          '
 dta d'Wielka Brytania zosta',B($4C),d'a ocalona.'
 dta d'    Zmasowane ataki bombowe     '
 dta d' zniszczy',B($4C),d'y wyrzutnie i fabryki '
 dta d'produkuj',B($41),d'ce rakiety V1, a dz',B($45),d'ki '
 dta d'Twojej udanej akcji poznano ich '
 dta d'budow',B($45),d' i nauczono si',B($45),d' skutecznie'
 dta d'      odpiera',B($43),d' ich ataki.       '

prgend   equ *

 dta d'D.Zolna is De Jet'

 org $3000

xsktb    equ *

 dta b(3),b(3)
 dta b(2),b(2)
 dta b(2),b(1)
 dta b(1),b(0)

ysktb    equ *

 dta b(16),b(16)
 dta b(15),b(14)
 dta b(13),b(11)
 dta b(8),b(4)

spdxtb   equ *

 dta b(3),b(2),b(1)
 dta b(1),b(1),b(1)
 dta b(1),b(1),b(0)
 dta b(0),b(0),b(0)
 dta b(0)

spdytb   equ *

 dta b(0),b(1),b(1)
 dta b(2),b(2),b(2)
 dta b(4),b(4),b(4)
 dta b(4),b(8),b(16)
 dta b(16)

wzorminy equ *

 dta b(%00111100)
 dta b(%01111110)
 dta b(%01111110)
 dta b(%11111111)
 dta b(%10000001)
 dta b(%01111110)
 dta b(%10000001)
 dta b(%01111110)

 dta b(%00000000)
 dta b(%01111110)
 dta b(%00000000)
 dta b(%11111111)
 dta b(%11111111)
 dta b(%00011000)
 dta b(%01111110)
 dta b(%01100110)

 dta b(%00011000)
 dta b(%01111110)
 dta b(%01100110)
 dta b(0)

 dta b(%00001100)
 dta b(%11111110)
 dta b(%01001100)
 dta b(0)

 dta b(%01001100)
 dta b(%11111110)
 dta b(%00001100)
 dta b(0)

 dta b(%01100110)
 dta b(%01111110)
 dta b(%00011000)
 dta b(0)

 dta b(%00110010)
 dta b(%01111111)
 dta b(%00110000)
 dta b(0)

 dta b(%00110000)
 dta b(%01111111)
 dta b(%00110010)
 dta b(0)


newdl   equ *

 dta b($70),b($f0),b($f0)
 dta b($c4),a(ekran)
 dta b($c4),a(ekran)
 dta b($c4),a(ekran+$20)
 dta b($c4),a(ekran+$20)
 dta b($c4),a(ekran+$40)
 dta b($c4),a(ekran+$40)
 dta b($c4),a(ekran+$60)
 dta b($c4),a(ekran+$60)
 dta b($c4),a(ekran+$80)
 dta b($c4),a(ekran+$80)
 dta b($c4),a(ekran+$a0)
 dta b($c4),a(ekran+$a0)
 dta b($c4),a(ekran+$c0)
 dta b($c4),a(ekran+$c0)
 dta b($c4),a(ekran+$e0)
 dta b($c4),a(ekran+$e0)
 dta b(160),b($46),a(punkty)
 dta b(32),b(4),b(4)
 dta b(2)
 dta b($41),a(newdl)

 dta d'                                '
 dta d'                                '

ekran    org *+258

titdl   equ *

 dta b($70),b($f0),b($f0)
 dta b($c4),a(ekran)
 dta b($c4),a(ekran)
 dta b($c4),a(ekran+$20)
 dta b($c4),a(ekran+$20)
 dta b($c4),a(ekran+$40)
 dta b($c4),a(ekran+$40)
 dta b($c4),a(ekran+$60)
 dta b($c4),a(ekran+$60)
 dta b($c4),a(ekran+$80)
 dta b($c4),a(ekran+$80)
 dta b($c4),a(ekran+$a0)
 dta b($c4),a(ekran+$a0)
 dta b($c4),a(ekran+$c0)
 dta b($c4),a(ekran+$c0)
 dta b($c4),a(ekran+$e0)
 dta b($c4),a(ekran+$e0)
 dta b($20),b($42),a(tytul)
 dta b(2),b($10),b(2)
 dta b(2),b($10),b($42)

adtit    dta a(title),b(2)

 dta b($41),a(titdl)

tytul    equ *

 dta d'      !"#$%&''( )*+ ,-''(''(       '
 dta d'      ./0/.123 4567892323       '
 dta d'    deQRSTU ',B($40),B($41),B($42),B($43),B($44),B($45),B($46),B($47),d' ',B($48),B($49),B($4A),B($4B),B($4C),B($4D),d'     '
 dta d'    pqVWXYZ ',B($4E),B($4F),B($50),B($51),B($52),B($53),B($54),B($55),d' ',B($56),B($57),B($58),B($59),B($5A),B($5B),d'     '


enddl   equ *

 dta b($70),b($f0),b($f0)
 dta b($c4),a(ekran)
 dta b($c4),a(ekran)
 dta b($c4),a(ekran+$20)
 dta b($c4),a(ekran+$20)
 dta b($c4),a(ekran+$40)
 dta b($c4),a(ekran+$40)
 dta b($c4),a(ekran+$60)
 dta b($c4),a(ekran+$60)
 dta b($c4),a(ekran+$80)
 dta b($c4),a(ekran+$80)
 dta b($c4),a(ekran+$a0)
 dta b($c4),a(ekran+$a0)
 dta b($c4),a(ekran+$c0)
 dta b($c4),a(ekran+$c0)
 dta b($c4),a(ekran+$e0)
 dta b($c4),a(ekran+$e0)
 dta b($30),b($42),a(gratul)
 dta d'"""""""'
 dta b($41),a(enddl)



zabijdl  equ *

 dta d'ppppppppp',b($46),a(zabtxt)
 dta b($41),a(zabijdl)

zabtxt   equ *

 dta B($40),B($42),B($44),d' ',B($46),B($47),B($48),B($49),B($4A),B($4B),B($48),B($4D),B($44),d' ',B($50),B($51),B($52),B($54),B($54),B($55)

nrschem  equ *

 dta b($01),b($03),b($07)
 dta b($15),b($23),b($24)
 dta b($46),b($66),b($74)

schtab   equ *

 dta a(kawalki+000),a(mapekr+037)
 dta a(kawalki+007),a(mapekr+044)
 dta a(kawalki+014),a(mapekr+051)
 dta a(kawalki+063),a(mapekr+133)
 dta a(kawalki+070),a(mapekr+140)
 dta a(kawalki+077),a(mapekr+147)
 dta a(kawalki+126),a(mapekr+229)
 dta a(kawalki+133),a(mapekr+236)
 dta a(kawalki+140),a(mapekr+243)

nrtekst  equ *

 dta b($15),b($34),b($41)
 dta b($45),b($48),b($51)
 dta b($53),b($55),b($92)
 dta b($61),b($64),b($67)

tektab   equ *

 dta a(tekst+000),a(mapekr+320)
 dta a(tekst+008),a(mapekr+328)
 dta a(tekst+016),a(mapekr+336)
 dta a(tekst+024),a(mapekr+344)
 dta a(tekst+128),a(mapekr+448)
 dta a(tekst+136),a(mapekr+456)
 dta a(tekst+144),a(mapekr+464)
 dta a(tekst+152),a(mapekr+472)
 dta a(tekst+256),a(mapekr+576)
 dta a(tekst+264),a(mapekr+584)
 dta a(tekst+272),a(mapekr+592)
 dta a(tekst+280),a(mapekr+600)

newmapdl equ *

 dta b($70),b($70),b($70)
 dta b($42),a(mapekr)
 dta d'""""""""',B($82),d' """"""""""""'
 dta b($41),a(newmapdl)

kawalki  equ *

 dta d'         ',B($40),B($41),B($42),B($43),d'        '
 dta d'    ',B($44),B($45),B($46),B($47),B($48),B($49),B($4A),B($4B),B($4C),B($4D),d'       '
 dta B($4E),B($4F),B($50),B($51),B($52),B($53),d' ',B($54),B($55),B($56),B($57),B($58),B($59),B($5A),B($5B),B($5C),B($5D),B($5E),B($5F),d'!"'
 dta d'#$%&''()*+,-./01234678'
 dta d'  9:;<=>?@ABCDEFGHIJ '
 dta d'  KLMNOPQRSTUVWXYZ[  '
 dta d' nop \]^       _`abc '
 dta d' qrs  de        _fghi'
 dta d' tuvwxy z{|}~',B($7F),d'   jklm'

tekst    equ *

 dta d'         Sci',B($53),d'le tajne!          '
 dta d'                                '
 dta d'   Dane techniczne broni V-1.   '
 dta d' ------------------------------ '
 dta d'                                '
 dta d'    D',B($4C),d'ugo',B($53),B($43),d' ca',B($4C),d'kowita: 8,4 m    '
 dta d' Maks. ',B($53),d'rednica kad',B($4C),d'uba: 0,83 m '
 dta d'  Rozpi',B($45),d'to',B($53),B($43),d' skrzyde',B($4C),d': 5,40 m   '
 dta d'    Ci',B($45),B($5A),d'ar startowy: 2160 kg    '
 dta d' Pr',B($45),d'dko',B($53),B($43),d' maksymalna: 640 km/h  '
 dta d'    Pu',B($4C),d'ap maksymalny: 3000 m    '
 dta d'       Zasi',B($45),d'g: ok. 250 km       '

mapekr   org *+730

char     dta b(0)
xcav     dta b(0)
ycav     dta b(0)
lc       dta b(0)
lx       dta b(0)
ly       dta b(0)
cave     dta b(0)
cavelen  dta b(0)
linelen  dta b(0)
joy      dta b(0)
xplr     dta b(0)
yplr     dta b(0)
lyplr    dta b(0)
plfaz    dta b(0)
faza     dta b(0)
lad      dta a(0)
nrdrz    dta a(0)
nrprz    dta a(0)
pom      dta b(0)
timer    dta b(0)
tim      dta b(0)
sound    dta b(0)
sou1     dta b(0)
point    dta b(0)
score    dta a(0),a(0),a(0)
keys     dta a(0)
food     dta a(0)
drink    dta a(0)
map      dta a(0)
film     dta a(0)
zmfo     dta b(0)
zmdr     dta b(0)
zezw     dta b(0)
kupa     dta b(1)
zpy      dta b(0)
lot      dta b(0)
ext      dta b(0)
goradol  dta b(0)
czas     dta b(0)
stos     dta b(0)
pozx     dta b(0)
lsnxtmin dta b(0)
xmine    dta b(0)
ymine    dta b(0)
zxmin    dta b(0)
minfaz   dta b(0)

kaslen   equ *-char

kolor    dta b(14)
zestaw   dta b($38)
music    dta b(0)

zpcol   equ *

 dta b(8),b(6),b(8),b(6)
 dta b(2),b(4),b(10),b(14)
 dta b(0)

maxmap  dta b(1),b(2)
maxfilm dta b(0),b(9)


punkty  equ *

 dta d'     ',B($D0),B($D0),B($D0),B($D0),B($D0),B($D0),d'     '
 dta d'lll:;llll<=llll23llll45llll67lll'
 dta d'lllZ[llll\]llllRSllllTUllllVWlll'
 dta d'   00    00    00    00    00   '


muz      equ $3c00
tit      equ $4800
roc      equ $4c00
got      equ $5000
fnd1     equ $5400
fnd2     equ $5800
ftl1     equ $5c00
ftl2     equ $6000
plr1     equ $6400
plr2     equ $6800
plr3     equ $6c00
plr4     equ $7000
otwarte  equ $7800
zebrane  equ $7900
pmb      equ $7800
fnt1     equ $8000
fnt2     equ $8400
stat     equ $8800
dane     equ $8900


