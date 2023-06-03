* przeszkadzajki

 opt h+
 icl 'd1/JOINT.ASM'

 org enemy

 jmp enem
 jmp enini
 jmp geten
 jmp chnfnt
 jmp chadd
 jmp puper
 jmp puten

;••••••••••••••••

puper equ *
 stx hlp
 sty hlp+1
 pha
 lda #'p'
 ldx #7
pup1 cmp eact,x
 beq pup2
 dex
 bpl pup1
 pla
 sec
 rts
pup2 lda hlp
 sta ex,x
 ldy <persls
 pla
 beq *+4
 ldy <persrs
 tya
 sta eshp,x
 lda #'|'
 sta eact,x
 clc
 lda hlp+1
 adc #$10
 sta ey,x
 jsr test_
 tay
 lda hlp+1
 sta ey,x
 tya
 beq *+5
 jsr perock
 lda #$0f
 jsr sound
 clc
 rts

rocklt equ *
 jsr m1lt
 bcc rocx
rode bmi *+7
 lda #$06
 jsr sound
 ldx enum
 lda #$94
 sta eact,x
rocx rts

rockrt equ *
 jsr m1rt
 bcs rode
 rts

rockded equ *
 jsr disp1
 inc ey,x
 lda ey,x
 and #$07
 bne rocx
 lda #'p'
 sta eact,x
 rts

pers equ *
 lda #$ff      ;•••
 sta addr      ;•••
 sta addr+1    ;•••
 and #4        ;•••
 sta chad+1    ;•••
 lsr @         ;•••
 tay           ;•••
 lda <$484-2   ;•••
 sta chad      ;•••
 lda #disk     ;•••
 asl @         ;•••
 bcs per1      ;•••
 lda #cadi     ;•••
 beq per1      ;•••

 lda (addr),y  ;•••
 cmp (chad),y  ;•••
 beq per1      ;•••

 ldy rnd       ;•••
 lda cntr      ;•••
 sta cavb,y    ;•••
 lda cave      ;•••

per1 equ *
 jsr disp1
 lda eshp,x
 and #3
 cmp #3
 bne peris

 clc
 lda ey,x
 pha
 adc #$20
 sta ey,x
 jsr test_
 tay
 pla
 clc
 adc #$10
 sta ey,x
 tya
 bne perock ;-jmp

per0 lda rnd
 and #3
 beq perock
peris equ *
 lda #3
 jmp inceshp

perock ldy #'>'
 lda eshp,x
 cmp <persrs
 bcs *+4
 ldy #'<'
 tya
 sta eact,x
 lda <rockls
 cpy #'<'
 beq *+4
 lda <rockrs
 sta eshp,x
 rts


soldin equ *
 bit dspf ;•••
 bpl *+3
 rts

 lda ey,x
 beq *+5
 dec ey,x
 rts

 lda nxtsin,x
 beq sin1
 dec nxtsin,x
 rts

sin1 equ *
 lda rnd
 clc
 and #$17 ;←lub→
 adc <soldls
 sta eshp,x
 tay
 lda #$fe
 cpy <soldrs
 bcs *+8
 ldy #$1E
 lda #$20
 bne *+6 ;-jmp
 ldy #$1F
 lda #$fe
 sta ex,x
 tya
 sta eact,x
 lda rnd
 and #$70
 cmp #$70
 bcs *-7
 sta ey,x

 clc
 lda ey,x
 adc #$10
 sta ey,x
 bmi soldout
 jsr test_
 beq *-12

 sec
 lda ey,x
 sbc #$10
 sta ey,x
 jsr test_
 bcs sin1

 sec
 lda ey,x
 sbc #$10
 sta ey,x
 jsr test_
 bcs sin1

 lda #21
 ldx #7
 sta nxtsin,x
 dex
 bpl *-4
 rts


soldlt equ *
 lda #0
 jsr solshot
 jsr m2lt
 bcc solx
 bmi soldout
 lda <soldrs
 sta eshp,x
 lda #$1F
 sta eact,x
solx rts

soldrt equ *
 lda #2
 jsr solshot
 jsr m2rt
 bcc solx
 bmi soldout
 lda <soldls
 sta eshp,x
 lda #$1E
 sta eact,x
 rts

soldout equ *
 lda #'s'
 sta eact,x
 lda rnd
 ora #$1f
 sta ey,x
 rts

soldded jsr disp2
 inc ey,x
 lda ey,x
 and #$07
 bne solx
 lda #'s'
 sta eact,x
 lda #$f0
 sta ey,x
 rts

solshot equ *
 bit dspf ;•••
 bmi ssux
 tay
 lda ex,x
 cmp #$20
 bcs ssux
 lda eshp,x
 and #7
 bne ssux
 lda rnd
 and #15
 bne ssux
 tya
 pha
 lda ey,x
 lsr @
 clc
 adc #9
 tay
 clc
 pla
 pha
 adc ex,x
 asl @
 asl @
 tax
 pla
 bne *+4
 lda #$06
 jsr putmis
 ldx enum
ssux rts


tanklt equ *
 jsr tnkshot
 jsr m3lt
 bcc tanx
 lda #'r'
 sta eact,x
tanx rts

tankrt equ *
 jsr tnkshot
 jsr m3rt
 bcc tanx
 lda #'l'
 sta eact,x
 rts


tnkshot equ *
 bit dspf ;•••
 bpl *+3
 rts
 lda rnd
 and #7
 bne tanx
 lda eshp,x
 cmp <tankes
 bcs makful

 ldy #1
 cmp <tankrs
 bcs *+4
 ldy #0
 and #3
 cmp #2
 bne tanx
 tya
 pha
 lda ey,x
 and #$f0
 tay
 lda ex,x
 tax
 inx
 pla
 jsr persput
 ldx enum
 bcs tanx
 lda eshp,x
 and #3
 ora <tankes
 sta eshp,x
 lda #$05
 jsr sound
 ldx enum
 rts


makful and #3
 sta hlp
 lda rnd
 and #7
 bne tanx
 ldy <tankls
 lda ex,x
 asl @
 asl @
 bmi *+6
 cmp hx
 bcs *+4
 ldy <tankrs
 tya
 ora hlp
 sta eshp,x
 rts




m1lt jsr disp1 ;- ruch █
 lda eshp,x
 lsr @
 bcc m1is
 dec ex,x
 jsr test_
 bcc m1is
 tay
 inc ex,x
 tya
 rts
m1is lda #3
 jsr inceshp
 clc
 rts

m1rt jsr disp1
 lda eshp,x
 lsr @
 bcc m1is
 inc ex,x
 inc ex,x
 jsr test_
 dec ex,x
 bcc m1is
 tay
 dec ex,x
 tya
 rts


m2lt jsr m2lr ;- ruch █
 lda ey,x     ;       █
 pha
 lda ex,x
 pha
 lda #$ff
 sta hlp+1
 dec ex,x
m2co jsr test_
 bcs m2wr
 lda ey,x
 adc #$10
 sta ey,x
 jsr test_
 bcs m2wr
 tya
 and #$3f
 cmp #itm2
 beq m2wr
 lda ey,x
 adc #$10
 sta ey,x
 jsr test_
 beq m2wr
 cpy #itm1
 beq m2wr
 pla
 clc
 adc hlp+1
 sta ex,x
 pla
 sta ey,x

m2is lda #7
 jsr inceshp
m2ok lda #0
 clc
 rts
m2wr tay
 pla
 sta ex,x
 pla
 sta ey,x
 tya
 sec
 rts

m2rt jsr m2lr

 lda ey,x
 pha
 lda ex,x
 pha
 lda #$01
 sta hlp+1
 inc ex,x
 inc ex,x
 jmp m2co

m2lr jsr disp2
 pla
 tay
 pla
 sta hlp
 inc ey,x
 lda ey,x
 and #1
 bne m2ok
 lda ey,x
 and #$f0
 sta ey,x
 lda eshp,x
 and #3
 cmp #3
 bne m2is
 lda hlp
 pha
 tya
 pha
 rts


m3lt jsr disp3 ;- ruch ██
 inc ey,x
 lda ey,x
 and #1
 bne m3ok
 lda ey,x
 and #$f0
 sta ey,x
 lda eshp,x
 and #3
 cmp #3
 bne m3is

 lda ex,x
 pha
 lda ey,x
 pha
 dec ex,x
 lda #$ff
m3co sta hlp+1
 jsr test_
 bcs m3wr
 lda ey,x
 adc #$10
 sta ey,x
 jsr test_
 beq m3wr
 cpy #itm1
 beq m3wr
 pla
 sta ey,x
 clc
 pla
 adc hlp+1
 sta ex,x
 bit hlp+1
 bpl m3ds

m3is lda #3
 jsr inceshp
 clc
 rts
m3ds lda #3
 jsr deceshp
m3ok clc
 rts
m3wr pla
 sta ey,x
 pla
 sta ex,x
 sec
 rts


m3rt jsr disp3
 inc ey,x
 lda ey,x
 and #1
 bne m3ok
 lda ey,x
 and #$f0
 sta ey,x
 lda eshp,x
 and #3
 bne m3ds

 lda ex,x
 pha
 clc
 adc #4
 sta ex,x
 lda ey,x
 pha
 lda #1
 sta chad
 lda #$01
 bne m3co ;-jmp

;••••••••••••••••••••

test_ equ *
 lda ex,x
 bpl *+8
 cmp #$fe
 bcc tout
 lda #$00

 cmp #$20
 bcc *+8
 cmp #$22
 bcs tout
 lda #$1e

 lsr @
 sta hlp

 lda ey,x
 cmp #$c0
 bcc *+8
 cmp #$f0
 bcc tout
 lda #$00

 cmp #$80
 bcc *+8
 cmp #$90
 bcs tout
 lda #$70

 ora hlp
 tay
 lda cavb,y
 and #$3f
 tay
 lda stat,y
 and #$0f
 cmp #3
 pha
 pla
 rts
tout lda #$80
 sec
 rts

disp1 equ *
 bit dspf ;•••
 bpl *+3
 rts
 lda enum
 tax
 asl @
 sta pntr
 ldy ey,x
 lda ex,x
 tax
 jsr disp
 inx
 inc pntr
 jsr disp
 ldx enum
 rts

disp2 equ *
 bit dspf ;•••
 bpl *+3
 rts
 jsr disp1
 inc pntr
 clc
 lda eshp,x
 adc #8
 sta eshp,x
 lda ey,x
 adc #$10
 tay
 lda ex,x
 tax
 jsr disp
 inx
 inc pntr
 jsr disp
 ldx enum
 sec
 lda eshp,x
 sbc #8
 sta eshp,x
 rts

disp3 equ *
 bit dspf ;•••
 bpl *+3
 rts
 jsr disp1
 inc pntr
 clc
 lda eshp,x
 adc #4
 sta eshp,x
 ldy ey,x
 lda ex,x
 tax
 inx
 inx
 jsr disp
 inx
 inc pntr
 jsr disp
 ldx enum
 sec
 lda eshp,x
 sbc #4
 sta eshp,x
 rts

deceshp ldy #$ff
 bne *+4
inceshp ldy #1
 sty scra
 sta hlp
 eor #$ff
 sta hlp+1
 ldx enum
 lda eshp,x
 tay
 and hlp+1
 sta eshp,x
 iny
 bit scra
 bpl *+4
 dey
 dey
 tya
 and hlp
 ora eshp,x
 sta eshp,x
 rts


xytoscr equ *
 tya
 and #$f0
 asl @
 sta scra
 txa
 and #$1f
 ora scra
 sta scra
xytx rts


disp equ *
 tya
 bmi xytx
 cpx #$20
 bcs xytx
 jsr xytoscr
 txa
 pha
 tya
 pha

 ldx enum
 ldy eshp,x
 lda eshpt,y
 jsr echrad

 lda scra
 tay
 lda (scrb),y
 pha
 clc
 lda #$e0
 adc pntr
 sta (scrb),y
 lda >$400
 sta scra+1
 pla
 and #$7f
 cmp #$60
 bcc nchr
 cmp #$70
 bcs nchr
 and #$0f
 asl @
 asl @
 asl @
 sta chad
 lda >ebuf1
 sta chad+1
 lda #0
 sta scra+1
 beq *+5
nchr jsr charad

 lda addr
 sta hlp
 lda addr+1
 clc
 adc >emask-efnt
 sta hlp+1

 lda pntr
 asl @
 asl @
 asl @
 adc #7
 tax
 pha
 ldy enum
 lda eact,y
 bmi dded
 lda eshp,y
 cmp <rockls
 bcc dper

 ldy #7
dst1 lda (chad),y
 and (hlp),y
 ora (addr),y
 sta ebuf1,x
 dex
 dey
 bpl dst1

 jsr a400

 pla
 tax
 ldy #7
dst2 lda (chad),y
 and (hlp),y
 ora (addr),y
 sta ebuf1+$80,x
 dex
 dey
 bpl dst2
dsex pla
 tay
 pla
 tax
 rts

dded ldy #7
ded1 lda (addr),y
 and rnd
 sta ebuf1,x
 lda (chad),y
 and (hlp),y
 ora ebuf1,x
 sta ebuf1,x
 dex
 dey
 bpl ded1

 jsr a400

 pla
 tax
 ldy #7
ded2 lda (addr),y
 and rnd
 sta ebuf1+$80,x
 lda (chad),y
 and (hlp),y
 ora ebuf1+$80,x
 sta ebuf1+$80,x
 dex
 dey
 bpl ded2
 bmi dsex ;-jmp

dper ldy #7
 lda (chad),y
 sta ebuf1,x
 dex
 dey
 bpl *-7
 jsr a401
 pla
 tax
 ldy #7
 lda (chad),y
 sta ebuf1+$80,x
 dex
 dey
 bpl *-7
 ldy enum
 lda eshp,y
 and #3
 tay
 clc
 txa
 adc perata,y
 tax
 ldy #3
dpe1 lda ebuf1,x
 and (hlp),y
 ora (addr),y
 sta ebuf1,x
 dex
 dey
 bpl dpe1
 bmi dsex ;-jmp
perata dta b($05),b($09),b($85),b($89)


a400 clc
 lda addr+1
 adc >$400
 sta addr+1
 lda hlp+1
 adc >$400
 sta hlp+1
a401 lda chad+1
 adc scra+1
 sta chad+1
 lda scra+1
 bne *+8
 lda chad
 adc #$80
 sta chad
 rts

********************

chadd equ *   ;** adres znaku
 ldy #0
 sty chad+1
 asl @
 rol chad+1
 asl @
 rol chad+1
 asl @
 rol chad+1
 sta chad
 lda chad+1
 adc >font
 sta chad+1
 rts
echrad equ *
 sta chad
 lda pntr
 lsr @
 rol chad
 lda chad
 jsr charad
 lda chad
 sta addr
 clc
 lda chad+1
 adc >efnt-font
 sta addr+1
 rts


********************

enem equ *
 bit dspf ;•••
 bmi *+5
 jsr killtest
 lda #0
 sta enum
cal1 ldx enum
 lda eact,x
 and #$7f
 ldy #0
cal2 cmp eproct,y
 bne cal3
 lda eproct+1,y
 sta ejsr+1
 lda eproct+2,y
 sta ejsr+2
ejsr jsr *
 jmp cal4
cal3 iny
 iny
 iny
 cpy <eprtln
 bcc cal2
cal4 inc enum
 lda enum
 cmp #8
 bcc cal1
 rts


chnfnt equ *
 ldx #$7f
 lda ebuf1,x
 sta font+$300,x
 lda ebuf1+$80,x
 sta font+$700,x
 dex
 bpl chnfnt+2
 rts


enini equ *

 lda #0
 sta chad
 sta addr
 lda >emask
 sta addr+1
 lda >efnt
 sta chad+1
 ldx #7
 ldy #0
makm lda (chad),y
 sta scra
 asl @
 ora scra
 and #%10101010
 sta scra
 lsr @
 ora scra
 eor #$ff
 sta (addr),y
 iny
 bne makm
 inc addr+1
 inc chad+1
 lda #0
 sta oldene+1,x
 sta oldene+33,x
 dex
 bpl makm
 rts


geten equ *
 ldx #7
set1 lda #0
 sta tnkpos,x
 lda #$80
 sta eact,x
 lda rnd
 and #$0f
 ora #$10
 sta ey,x ;-sold
 dex
 bpl set1

 ldy cave
 lda enetab,y
 cmp #' '
 bne *+3
 rts
 sec
 sbc #'0'
 asl @
 asl @
 tay
 ldx #0
set2 lda ekinds,y
 sta eact,x
 cmp #'p'
 bne *+4
 sta eact+1,x
 iny
 inx
 inx
 cpx #8
 bcc set2

 ldx #0
 stx hlp
gtnk lda cavb,x
 and #$3f
 tay
 lda stat,y
 and #$f0
 tay
 lda #'l'
 cpy #$70
 beq *+8
 cpy #$80
 bne gtn1
 lda #'r'
 pha
 ldy hlp
 lda eact,y
 cmp #'t'
 beq *+12
 iny
 iny
 cpy #8
 bcc *-11
 pla
 jmp getolde
 txa
 sta tnkpos,y
 pla
 sta eact,y
 cmp #'l'
 beq *+6
 lda <tankrs
 bne *+4
 lda <tankls
 sta eshp,y
 inc hlp
 inc hlp
 lda cavb+1,x
 sta cavb,x
 txa
 and #$0f
 asl @
 sta ex,y
 txa
 and #$f0
 sta ey,y
gtn1 inx
 bpl gtnk

getolde equ *
 ldx oldene+1
 bne *+3
 rts
 lda cave
 cmp oldene
 beq *+3
 rts
 ldy lstc+1
 bpl *+3
 rts

 ldx #31
 lda oldene+1,x
 sta eact,x
 dex
 bpl *-6

 ldx hact
 cpx #lifuac
 beq *+6
 cpx #lifdac
 bne *+4
 ldy #$0a

 cpy #$18
 bcc *+4
 ldy #$18

 lda #$80
 sta dspf
 tya
 pha
 jsr enemy
 pla
 tay
 dey
 bpl *-8
 asl dspf
 rts


puten equ *
 ldx #7
svt1 ldy eact,x
 lda #$30 ;lub 31
 cpy #'l'
 beq *+6
 cpy #'r'
 bne *+8
 ldy tnkpos,x
 sta cavb,y
 dex
 bpl svt1

 lda lstc
 sta oldene
 ldx #31
 lda oldene+33,x
 sta oldene+1,x
 lda eact,x
 sta oldene+33,x
 dex
 bpl *-12

 rts


********************

killtest equ *
 ldx #7
 stx pntr
 ldy #256-7
kit2 clc
 tya
 adc #7
 tay
 lda killtab,y
 bmi kitc
 lda eact,x
 cmp killtab,y
 beq kit3
 cmp killtab+1,y
 bne kit2

kit3 lda killtab+2,y
 sta chad
 lda killtab+3,y
 sta scra
 lda killtab+4,y
 sta scra+1
 lda killtab+5,y
 sta kjsr+1
 lda killtab+6,y
 sta kjsr+2
kjsr jsr *

kitc ldx pntr
 dex
 bpl kit2-4
 rts

rockkt equ *
 ldx #0
 ldy #1
 stx x
 sty y

 jsr graktry
 bcs *+7
 lda #$12
 jsr adscorx
 jsr misktrty
 bcs *+7
 lda #$15
 jmp adscorx
 rts


soldkt equ *
 ldx #0
 ldy #5
 stx x
 sty y
 jsr graktry
 bcs *+7
 lda #$50
 jsr adscorx
 jsr misktrty
 bcc *+3
 rts
 lda #$08

adscorx equ *
 ldx chad+1
 pha
 jsr addsco
 pla
 dex
 bne *-6
 rts



misktrty equ *
 lda #0
 sta chad+1 ;-punkty
 ldx #3
mkt1 txa
 pha
 lda mdx,x
 beq mkt2
 sec
 lda my,x
 sbc #$20
 tay
 lda mx,x
 tax
 jsr coltest
 bcs mkt2
 inc chad+1
 pla
 tax
 lda #out
 sta mx,x
 txa
 pha
mkt2 pla
 tax
 dex
 bpl mkt1
 clc
 lda chad+1
 bne *+3
 sec
 rts


graktry equ *
 lda #0
 sta chad+1
 sec
 lda gy
 sbc #$20
 tay
 ldx gx

 lda gact
 beq gtrx
 cmp #3
 bcs gtr1

 jsr coltest
 bcs gtrx
 lda #3
 sta gact
 inc chad+1
gtrx clc
 lda chad+1
 bne *+3
 sec
 rts

gtr1 equ *
 dey
 dey
 jsr coltest
 bcs *+4
 inc chad+1
 lda gshp
 cmp #2
 bcc gtrx
 cmp #4
 bcs gtrx
 dex
 jsr coltest
 bcs *+4
 inc chad+1
 inx
 inx
 inx
 jsr coltest
 bcs gtrx
 inc chad+1
 bcc gtrx ;-jmp

coltest equ *
 txa
 pha
 ldx pntr
 lda ex,x
 asl @
 asl @
 bpl *+4
 lda #0
 clc
 adc x
 sta addr
 lda ey,x
 and #$f0
 clc
 adc y
 sta addr+1
 pla
 tax

 cpx addr
 bcc nocl
 clc
 lda addr
 adc scra
 sta addr
 cpx addr
 bcs nocl

 ldx addr+1
 cpy addr+1
 bcc nocl
 clc
 lda addr+1
 adc scra+1
 sta addr+1
 cpy addr+1
 bcs nocl
 txa
 pha
 tya
 pha
 lda chad
 ldx pntr
 sta eact,x
 lda #$06
 jsr sound
 pla
 tay
 pla
 tax
 clc
 rts
nocl sec
 rts


********************

killtab equ *
 dta c'<>',B($94),a($0509),a(rockkt)
 dta B($1E),B($1F),B($EF),a($1a0a),a(soldkt)
 dta B($A0)


ekinds equ *
 dta c'ssss'
 dta c'spss'
 dta c'spsp'
 dta c'pspp'
 dta c'tttp'
 dta c'tptp'
 dta c'tppp'
 dta c'tstp'
 dta c'stsp'
 dta c'pppp'

eproct equ *
 dta c'|',a(pers)
 dta c'p',a(rocx)
 dta B($14),a(rockded)
 dta c'<',a(rocklt)
 dta c'>',a(rockrt)
 dta c's',a(soldin)
 dta c'o',a(soldded)
 dta B($1E),a(soldlt)
 dta B($1F),a(soldrt)
 dta c'l',a(tanklt)
 dta c'r',a(tankrt)
eprtln equ *-eproct-1

eshpt dta d'3333',B($53),B($53),B($53),B($53),d'76764545'
 dta d'ONMLOKJL_^]\_[ZY'
 dta d'CDEFCGHFSTUVSWXI'
 dta d'><:8?=;9.,*(/-+)'
 dta d'&$"0''%#1'

persls equ $00
persrs equ $04
rockls equ $08
rockrs equ $0c
soldls equ $10
soldrs equ $20
tankls equ $30
tankrs equ $38
tankes equ $40

nxtsin dta d'        '
tnkpos dta d'        '
oldene dta d' '
 org *+64

 end enemy

