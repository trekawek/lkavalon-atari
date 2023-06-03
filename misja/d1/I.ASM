* przedmioty

 opt h+
 icl 'd1/JOINT.ASM'

 org items
 jmp itms
 jmp iini
 jmp puttraps
 jmp itmget
 jmp copitms

********************

itms equ *   ;** obsluga przedm
 jsr cavchn
 jsr explos
ijsr jsr rts
 lda cntr
 lsr @
 bcc rts
 inc exac
 inc exac+1
rts  rts

********************

itmget equ *   ;** pob przed i przesz
 jsr gettraps
 ldx cave
 lda itmtab,x
 sta item
 cmp #' '
 beq rts
 jsr newitem
idisp jmp *

********************

lift equ *     ;** proc windy
 lda hact
 cmp #lifuac
 beq lifu
 cmp #lifdac
 beq lifd
lifx rts

lifu inc ishp
 lda ishp
 lsr @
 bcc lchk
 lda #$f0
 jmp lifud

lifd inc ishp
 lda ishp
 lsr @
 bcs lchk
 lda #$10

lifud pha
 ldx ipos+1
 lda #itm2
 jsr put_
 ldx ipos+1
 inx
 lda #itm2
 jsr put_
 clc
 pla
 adc ipos+1
 sta ipos+1
 bmi lchk
 tax
 bmi lifx
 lda #itm1
 jsr put_
 ldx ipos+1
 inx
 lda #itm1
 jsr put_

lchk jsr herlift
 ldx cave
 lda #'|'
 ldy ipos+1
 cpy #$90
 bcs lifodw
 cpy #$10
 bcc lifoup
 lda ipos+1
 cmp ipos
 bne lchx
 lda ishp
 lsr @
 bcc lifend
lchx rts

lifodw sta itmtab,x ;** wyjechal z kom
 ora #$80
 sta itmtab+$10,x
 tya
 and #$0f
 ora #$10
 sta ipos+1
 rts

lifoup sta itmtab,x
 ora #$80
 sta itmtab-$10,x
 lda #disk ;•••
 bpl *+10  ;•••
 lda dbom  ;•••
 cmp #$10  ;•••
 beq *+3   ;•••
 rts       ;•••
 tya
 and #$0f
 ora #$70
 sta ipos+1
 rts

herlift lda ipos+1
 and #$f0
 sta hy
 lda ishp
 and #1
 asl @
 asl @
 asl @
 clc
 adc hy
 adc #32-heig
 sta hy
 rts

lifend lda #stndac
 sta hact
 rts


barr equ *     ;** proc bariery
 sec
 lda item
 sbc #'1'
 tax
 lda bars,x
 beq bar1
 lda #1
 sta ishp
 rts

bar1 lda cntr
 and #15
 bne *+4
 inc ishp
 rts


swit equ *     ;** proc wylacz
 sec
 lda item
 sbc #$B1
 cmp #8
 bcs swix
 sta addr
 tax
 lda bars,x
 beq swi1
 lda #1
 sta ishp
swix rts

swi1 lda cntr
 and #7
 bne *+4
 inc ishp
 ldx ipos
 jsr touchtst
 bcs swix
 ldx addr
 lda #1
 sta bars,x
 lda #$0a
 jsr sound
 lda #$99
 jsr addsco
 lda #$01
 jsr addsco
 ldy addr     ;•••
 dey          ;•••
 dey          ;•••
 beq *+3      ;•••
 rts          ;•••
 inc addr     ;•••
 ldx addr     ;•••
 stx addr+1   ;•••
 ldy #8       ;•••
 lda (addr),y ;•••
 asl @        ;•••
 dey          ;•••
 eor (addr),y ;•••
 cmp #$c8     ;••• $db = $3dd ($2cc)
 beq *+5      ;•••
 inc dbom+1   ;•••
 rts          ;•••


touchtst equ *     ;** boh dotyka ?
 stx scra         ;X-index
 ldx hx
 inx
 ldy hy
 jsr test
 cpy scra
 beq took
 clc
 lda hx
 adc #6
 sta hlp+1
 tax
 ldy hy
 jsr test
 cpy scra
 beq took
 ldx hlp+1
 dex
 dex
 clc
 lda hy
 adc #heig-8
 sta hlp+1
 tay
 jsr test
 cpy scra
 beq took
 ldy hlp+1
 ldx hx
 inx
 inx
 inx
 jsr test
 cpy scra
 beq took
 sec
 rts
took clc
 rts


*****

newitem equ *
 lda <ishtab
 sta addr
 lda >ishtab
 sta addr+1
 ldy #0
seri lda (addr),y
 cmp item
 beq ifnd
 cmp #' '
 beq newx
 clc
 lda addr
 adc ishtab-1
 sta addr
 bcc seri
 inc addr+1
 bne seri ;-jmp
ifnd sta item
 ldx #0
 iny
ixxx lda (addr),y
 jsr itmcad
 lda chad
 sta itmshp,x
 lda chad+1
 sta itmshp+1,x
 iny
 inx
 inx
 cpx #6
 bcc ixxx
 lda (addr),y
 ora #$f0
 sta stat+itm1
 iny
 lda (addr),y
 sta stat+itm2
 iny
 lda (addr),y
 sta idisp+1
 iny
 lda (addr),y
 sta idisp+2
 iny
 lda (addr),y
 sta ijsr+1
 iny
 lda (addr),y
 sta ijsr+2

 ldx #0
spo1 inx
 bmi newx
 stx ipos
 lda cavb,x
 cmp #itm1
 bne spo1

 lda hact
 cmp #lifuac
 beq newx
 cmp #lifdac
 beq newx
 stx ipos+1
 lda #0
 sta ishp
newx rts

copitms equ *  ;wkop przed do gen

 lda item
 cmp #' '
 beq newx
 lda ishp
 and #1
 ldx #15
 jsr cpit
 lda item
 cmp #'1'
 bcc *+6
 cmp #'9'+1
 bcc cbar
 lda #2
 ldx #31

cpit asl @
 tay
 lda itmshp,y
 sta chad
 sta addr
 lda itmshp+1,y
 sta chad+1
 clc
 adc >$400
 sta addr+1
 ldy #15
cpi1 lda (chad),y
 sta font+$2a0,x ;+itm1*$10
 lda (addr),y
 sta font+$6a0,x
 dex
 dey
 bpl cpi1
 rts

cbar ldy #15
 ldx cntr
cba1 txa
 and #$03
 tax
 lda barshp,x
 cpy #8
 bcc *+6
 and #%11111100
 bne *+4 ;-jmp
 and #%00111111
 sta font+$2b0,y
 sta font+$6b0,y
 dex
 dey
 bpl cba1
 rts

barshp dta c'_}',B($F5),B($D7)

itmcad equ *   ;** adres znaku przedm
 pha
 lda #0
 sta chad+1
 pla
 asl @
 asl @
 rol chad+1
 asl @
 rol chad+1
 asl @
 rol chad+1
 sta chad
 lda chad+1
 adc >txtfnt
 sta chad+1
 rts

********************

lifs equ *     ;** szyb windy
 ldx ipos
 beq *+10
 lda #itm2
 sta cavb,x
 sta cavb+1,x
 ldx ipos+1
 lda #itm1
 sta cavb,x
 sta cavb+1,x
 jsr putitd
 bcc *-3
 ldx ipos+1
 lda #1
 jsr putitu
 bcc *-3

 lda #0    ;-mozl kier windy
 ldx cave
 ldy itmtab-$10,x
 cpx #$10
 bcc *+8
 cpy #'|'
 bne *+4
 ora #%10000000
 ldy itmtab+$10,x
 cpx #$f0
 bcs *+8
 cpy #'|'
 bne *+4
 ora #$00000001
 sta item+1
 rts

bard equ *  ;** wysw bar
 lda #disk  ;•••
 asl @      ;•••
 bcc *+7    ;•••
 ldx dbom+1 ;•••
 bne brd1   ;•••
 sec
 lda item
 sbc #'1'
 tax
 lda bars,x
 beq brd1
 cpx #7 ;(8=H)
 bcc *+9
 lda #0
 ldx ipos
 sta cavb,x
 rts

brd1 equ *
 lda #0
 ldx ipos
 jsr putitd
 bcc *-3
 rts

swid equ *     ;** wysw wyl
 lda #0
 ldx ipos

putitd equ *   ;** hlp=0:2 zn, <>0:1
 clc
 pha
 txa
 adc #$10
 bcc pidu ;-jmp
putitu equ *
 sec
 pha
 txa
 sbc #$10
pidu and #$7f
 tax
 lda cavb,x
 and #$3f
 cmp #itm1
 beq pidw
 tay
 lda stat,y
 and #$0f
 beq *+5
pidw sec
 pla
 rts
 lda #$80+itm2
 sta cavb,x
 pla
 beq *+7
 lda #$80+itm2
 sta cavb+1,x
 clc
 rts

*****

cavchn equ *   ;** ozyw pulapki
 lda #0
 sta pntr
cch1 ldx pntr
 lda cavb,x
 and #$3f
 tay
 lda stat,y
 and #$f0
 cmp #$10
 bcc cch2
 lsr @
 lsr @
 lsr @
 tay
 lda cprtab,y
 sta cchj+1
 lda cprtab+1,y
 sta cchj+2
 lda pntr
 and #$0f
 sta x
 lda pntr
 lsr @
 lsr @
 lsr @
 lsr @
 sta y
 ldx pntr
cchj jsr *
 ldx pntr
 lda cavb,x
 and #$3f
 tay
 lda stat,y
 and #$f0
 cmp #$c0
 beq cch2
 lda cavb,x
 jsr put_
cch2 inc pntr
 bpl cch1
 rts


lass equ *     ;** laser
 txa
 asl @
 adc #32
 tay
 lda cavb,x
 and #$40
 beq lasx

lwor lda (scrb),y
 and #$7f
 tax
 lda #$d0
 cpx #$2c
 beq *+8
 cpx #$32
 bne lasx
 lda #$d1
 sta (scrb),y
 clc
 tya
 adc #32
 tay
 bcc lwor

lasx ldx x
 dex
 txa
 asl @
 asl @
 asl @
 adc cntr
 and #63
 bne gunx
 ldx pntr
 lda cavb,x
 eor #$40
 sta cavb,x

 lda bomb           ;•••
 beq gunx           ;•••
 ldx #cadi          ;•••
 bpl gunx           ;•••
 ldx rnd            ;•••
 inc cvadrt+$100,x  ;•••
 rts

gund equ *     ;** dzialo ↓
 ldx #4
 ldy #4
 jsr gunshu
 jsr gtst
 ldx #$a2
 bcc *+8
 cmp #3
 bcc gunx
 ldx #$a3
 txa
 ldx pntr
 sta cavb,x
gunx rts ;!

gunl equ *     ;** ←
 ldx #0
 ldy #5
 jsr gunshu
 jsr gtst
 bcc gunx
 lda #$a1
 ldx pntr
 sta cavb,x
 rts

gunr equ *     ;** →
 ldx #7
 ldy #3
 jsr gunshu
 jsr gtst
 bcc *+6
 cmp #3
 bcs gunx
 lda #$a1
 ldx pntr
 sta cavb,x
 rts

gtst lda cntr  ;** czasem testuje boh
 and #15
 cmp #7
 beq *+5
 pla
 pla
 rts
 lda hx
 lsr @
 lsr @
 lsr @
 clc
 adc #1
 sec
 sbc x
gstx rts

gunshu equ *   ;** czasem strzela
 lda cntr
 adc x
 and #7
 bne gstx
 lda rnd
 and #3
 bne gstx
 stx hlp
 sty hlp+1
 lda x
 asl @
 asl @
 asl @
 adc hlp
 tax
 lda y
 asl @
 asl @
 asl @
 adc #4
 tay
 lda hlp+1
 jsr putmis
 ldx #3       ;•••
 stx addr+1   ;•••
 lda scra     ;•••
 ldx #7       ;•••
 asl @        ;•••
 ror scra+1   ;•••
 dex          ;•••
 bpl *-4      ;•••
 sta addr     ;•••
 ldy #3       ;•••
 lda (addr),y ;•••
 and #$7f     ;•••
 sta dbom     ;•••

mnex rts
mine equ *
 jsr touchtst
 bcs mnex
 lda #0
 sta exac
 ldx pntr
 lda #$26
 sta cavb,x
 lda #0
 sta hdx
 lda #jmp1ac
 sta hact
 lda #10
 sta hjmc
 lda #$01
 jsr sound
 lda #18
 jsr decener

 ldy #$80     ;•••
 tya          ;•••
 sta scra     ;•••
 asl @        ;•••
 sta addr     ;•••
 ldx #5       ;•••
 stx scra+1   ;•••
 dex          ;•••
 stx addr+1   ;•••
 dey          ;•••
 lda (addr),y ;•••
 cmp (scra),y ;•••
 bne llll     ;•••
 dey          ;•••
 bne *-7      ;•••
 rts          ;•••

llll sec      ;•••
 ror bomb     ;•••
 rts          ;•••
bomb dta d' ' ;•••


pers lda rnd
 and #63
 bne mnex
 lda pntr
 and #$0f
 asl @
 tax
 lda pntr
 and #$70
 tay
 lda rnd
 and #1
 jmp persput

canl ldy #7
 ldx #1
 bne *+6
canr ldy #1
 ldx #6

 lda cntr
 and #$07
 bne ex1x
 lda rnd
 and #$07
 bne ex1x

 tya
 pha
 stx hlp
 lda x
 asl @
 asl @
 asl @
 adc hlp
 tax
 lda y
 asl @
 asl @
 asl @
 adc #3
 tay
 pla
 jmp putmis


exp1 lda exac
 cmp #2
 bcc ex1x
 lda #$16
 ldx pntr
 jmp put_
ex1x rts

exp2 lda exac+1
 cmp #2
 bcc ex2x
 jsr lass
 lda #$10
 ldx pntr
 jmp put_
ex2x rts

explos equ *   ;** wkop wyb
 clc
 lda exac
 adc expshp
 ldx #15
 jsr copexp
 clc
 lda exac+1
 adc expshp+1
 ldx #31

copexp equ *
 jsr itmcad
 lda chad
 sta addr
 clc
 lda chad+1
 adc >efnt-txtfnt
 sta chad+1
 clc
 adc >$400
 sta addr+1
 ldy #15
cpe1 lda (chad),y
 sta font+$260,x
 lda (addr),y
 sta font+$660,x
 dex
 dey
 bpl cpe1
 rts

thing equ *
 lda cavb,x
 tax
 lda cntr
 adc x
 adc y
 and #$08
 bne *+4
 ldx #$16
 lda pntr
 asl @
 tay
 txa
 jsr putscr

 ldx hx
 inx
 clc
 lda hy
 adc #heig-1
 tay
 sta hlp+1
 jsr test
 cpy pntr
 beq piku
 ldy hlp+1
 clc
 lda hx
 adc #6
 tax
 jsr test
 cpy pntr
 beq piku
 ldx pntr
 jsr touchtst
 bcs ex2x

piku equ *
 ldx pntr
 ldy cavb,x
 lda #$16
 sta cavb,x
 tya
 jmp pickup

base equ *
 ldy #3
 lda dyntab,y
 beq bas1
 cmp pntr
 beq bas2
 dey
 bpl base+2
 rts

bas1 equ * ;-postaw
 lda #$0f
 sta cavb+$5e
 lda #$1f
 sta cavb+$6e
 sty chad
 ldx pntr
 jsr touchtst
 bcs bas1-1

 lda dyns
 beq bas1-1
 dec dyns

 lda pntr
 ldy chad
 sta dyntab,y
 inc dyntab+4
 lda dyntab+4
 cmp #4
 bcc *+4
 dec time
 lda #$0c
 jsr sound
 ldx #3
 lda #$80
 jsr addsco
 dex
 bne *-6
 rts


bas2 equ *
 lda #$1e
 sta cavb+$5e
 sta cavb+$6e
 lda pntr
 asl @
 sec
 sbc #$20
 tay
 lda #$bb
 jmp putscr

dyntab dta d'     '

*****

put_ equ *     ;** put A na poz X
 pha
 txa
 and #$7f
 tay
 pla
 tax
 sta cavb,y
 tya
 asl @
 tay
 txa

putscr equ *
 asl @
 php
 asl @
 plp
 ror @
 sta (scrb),y
 ora #1
 iny
 sta (scrb),y
 rts

*****

gettraps equ * ;** wybierz pulapki
 ldx cave
 lda trpmap,x
 sta hlp
 lda #$01
 sta hlp+1
 ldx #0
 stx scra
gtr1 lda cavb,x
 and #$3f
 tay
 lda stat,y
 and #$f0
 beq *+9
 cmp #$d0
 bcs *+5
 jsr gtrap
 lda scra
 cmp #7
 bcs *+5
 inx
 bpl gtr1
 ldx cave
 lda hlp
 ora #$80
 sta trpmap,x
 rts

gtrap ldy hlp
 bpl g1th
 tay
 lda hlp+1
 and hlp
 bne gtp1
 lda #$16 ;-cegly
 cpy #$50
 bcs *+4
 lda #$10 ;-cien
 sta cavb,x
 lda #0
 beq *+3 ;-jmp
gtp1 txa
 ldy scra
 sta traps,y
 asl hlp+1
 inc scra
 rts
g1th lda hlp+1
 ora hlp
 sta hlp
 bne gtp1 ;-jmp


puttraps equ * ;** zapam pulapki
 ldx cave
 lda trpmap,x
 sta hlp
 lda #$fe
 sta hlp+1
 ldx #0
ptr1 lda hlp
 beq ptr0
 ldy traps,x
 lda cavb,y
 and #$3f
 tay
 lda stat,y
 and #$f0
 beq *+6
 cmp #$d0
 bcc ptr2
 lda hlp+1
 and hlp
 sta hlp
ptr2 sec
 rol hlp+1
ptr0 lda #0
 sta traps,x
 inx
 cpx #7
 bcc ptr1
 lda hlp
 ldx cave
 sta trpmap,x
 rts

********************

cprtab equ *
 dta a(0),a(lass),a(gund),a(gunl)
 dta a(gunr),a(mine),a(pers),a(rts)
 dta a(rts),a(canl),a(canr),a(base)
 dta a(thing),a(exp1),a(exp2),a(rts)

traps dta d'        '

********************

iini equ *
 lda #0
 ldx #7
 sta bars,x
 dex
 bpl *-4
 inx
iin1 lda itmsrc,x
 sta itmtab,x
 lda #0
 sta trpmap,x
 cpx #5
 bcs *+5
 sta dyntab,x
 dex
 bne iin1
 rts


********************

ishtab equ *+1

* a:znk1/1 b:znk1/2 c:znk2 de:stat12
* 'przedm','abcde',(wyswiet),(proced)

 dta b(10) ;-szer tablicy
 dta c'|',d'SSS  ',a(lifs),a(rts)
 dta B($FC),d'TUS# ',a(lifs),a(lift)
 dta c'1',d'^Vx$$',a(bard),a(barr)
 dta c'2',d'^Wx$$',a(bard),a(barr)
 dta c'3',d'^Xx$$',a(bard),a(barr)
 dta c'4',d'^Yx$$',a(bard),a(barr)
 dta c'5',d'^Zx$$',a(bard),a(barr)
 dta c'6',d'^[x$$',a(bard),a(barr)
 dta c'7',d'^\x$$',a(bard),a(barr)
 dta c'8',d'^]x$$',a(bard),a(barr) ;H
 dta B($B1),d'^V_$$',a(swid),a(swit)
 dta B($B2),d'^W_$$',a(swid),a(swit)
 dta B($B3),d'^X_$$',a(swid),a(swit)
 dta B($B4),d'^Y_$$',a(swid),a(swit)
 dta B($B5),d'^Z_$$',a(swid),a(swit)
 dta B($B6),d'^[_$$',a(swid),a(swit)
 dta B($B7),d'^\_$$',a(swid),a(swit)
 dta B($B8),d'^]_$$',a(swid),a(swit) ;È
 dta c' ',d'xxxxx',a(rts),a(rts)
 dta B($00)

dbom dta b($10),b(0)
bars dta d'        ' ;bariery
itmshp dta d'      '
expshp dta b($20),b($30)

 end items

