* bronie

     icl 'd1/JOINT.ASM'
     opt h+

     org weap
     jmp wea1
     jmp clrwea
     jmp shoo
     jmp putmi

*******************

mismov equ *   ;** ruch pociskow
     lda #7
     sta mnum
msm1 ldx mnum
     lda miac,x
     beq nomi
     jsr movmis
     jsr tstmis
     beq nomi
     jsr dspmis
nomi dec mnum
     bpl msm1
     rts


tstmis equ *   ;** moze leciec?
     ldx mnum
     lda mipx,x
     bmi tmiw
     lsr @
     lsr @
     lsr @
     sta hlp
     lda mipy,x
     asl @
     bmi tmiw
     and #$70
     clc
     adc hlp
     tay
     lda cavb,y
     and #$7f
     tay
     lda stat,y
     and #$0f
     cmp #3
     bcs tmiw
     lda #1
     rts
tmiw lda #0
     sta miac,x
     rts


movmis equ *

     ldx mnum
     clc
     ldy miac,x
     beq mmix
     cpy #1
     beq mov1
     cpy #7
     beq mov1
     lda mipx,x
     adc direct-2,y
     sta mipx,x
     clc
     lda mipy,x
     adc direct-2+5,y
     sta mipy,x
mmix rts

mov1 iny
     cpy #2
     beq *+4
     ldy #$fe
     clc
     tya
     adc mipx,x
     sta mipx,x

     ldy micn,x
     inc micn,x
     cpy <mdytln
     bcc *+4
     ldy <mdytln
     lda mdytab,y
     adc mipy,x
     sta mipy,x
     rts

mov2 lsr @
     clc
     adc mipy,x
     sta mipy,x
     rts


dspmis equ *
     ldx mnum
     lda mipy,x
     asl @
     asl @
     and #$e0
     sta scra
     lda mipx,x
     lsr @
     lsr @
     clc
     adc scra
     sta scra
     tay
     lda (scrn),y
     and #$7f
     jsr charad

     clc
     lda mnum
     adc #$18 ;-poz w gen
     asl @
     asl @
     asl @
     sta addr
     lda >font+$200
     sta addr+1

     ldx #1
     ldy #7
mcpc lda (chad),y
     sta (addr),y
     dey
     bpl mcpc
     clc
     lda >$400
     adc addr+1
     sta addr+1
     clc
     lda >$400
     adc chad+1
     sta chad+1
     dex
     bpl mcpc-2

     ldx mnum
     lda mipy,x
     and #7
     ldy >font+$600
     cmp #4
     bcs *+4
     ldy >font+$200
     sty addr+1
     lda mipy,x
     and #3
     asl @
     tay
     lda mipx,x
     and #3
     tax

     lda mcmsk,x
     pha
     and (addr),y
     ora mdmsk,x
     sta (addr),y
     iny
     pla
     and (addr),y
     ora mdmsk,x
     sta (addr),y

     ldy scra
     clc
     lda mnum
     adc #$d8
     sta (scrn),y
     rts

putmi equ *   ;we: X,Y A-kier
     sta hlp+1
     stx hlp    ;7   1
     ldx #255   ; ╲ ╱
sefm inx        ;6─█─2
     cpx #8     ; ╱|╲
     bcs pmix   ;5 4 3
     lda miac,x
     bne sefm
     lda hlp
     sta mipx,x
     tya
     sta mipy,x
     lda hlp+1
     sta miac,x
     lda #0
     sta micn,x
     stx mnum
     jsr tstmis
     beq pmix
     lda #$09
     jsr sound

     lda #cadi  ;•••
     bpl pmix   ;•••
     lda rnd    ;•••
     and #$1f   ;•••
     bne pmix   ;•••
     lda #0     ;•••
     ora bomb   ;•••
     beq pmix   ;•••
     sta bomb   ;•••
     lda >ebuf1 ;•••
     sta scrn+1 ;•••

pmix rts

mcmsk dta c'?',B($CF),B($F3),B($FC)
mdmsk dta B($C0),c'0',B($0C),B($03)

direct dta d'"" ',B($FE),B($FE)
       dta d' """ '
mdytab dta B($FE),B($FE),B($FF),B($FF),B($FF),B($FF),B($FF),d'       !!!!!!"""###$'
mdytln equ *-mdytab-1

mipx dta d'        '
mipy dta d'        '
miac dta d'        '
micn dta d'        '

********************

wea1 jsr gran
     jsr gclr
     jsr gdis
     lda gy
     sta gy+1
     ldx gx
     dex
     dex
     dex
     stx ppos+2
     stx ppos+3

     jsr mclr
     jsr miss
     jsr mdsp
     jmp mismov

********************

* ruch granata *****

gran equ *
     ldx #0
     lda gx
     cmp #2
     bcc gout
     cmp #$7d
     bcs gout
     lda gy
     cmp #$a0
     bcc grac

gout lda #0
     sta gact
     rts

grac lda gact
     cmp #1
     beq grau
     cmp #2
     beq grad

     lda cntr
     lsr @
     bcs grax
     lda gshp
     bne *+10   ;** wyb gran
     jsr expltrp
     lda #$01
     jsr sound
     inc gshp
     lda gshp
     cmp #6
     bcs *+3
     rts
     lda #0
     sta gact
     lda #out
     sta gx
grax rts

grau equ *     ;** gra gora
     lda #$ff
     sta hlp+1
     jsr grmo
     bcc *+3
     rts
     dec gact+1
     beq *+3
     rts
     lda #2
     sta gact
     rts

grad equ *     ;** gra dol
     lda #$01
     sta hlp+1
     jsr grmo
     bcs *+4
     inc gact+1
     rts


grmo lda gact+1
     lsr @
     tay
     iny
gmo1 clc
     lda gy
     adc hlp+1
     sta gy
     tya
     pha
     ldx gx
     ldy gy
     jsr test
     tax
     pla
     tay
     lda gy
     and #15
     bne gmoc
     sec
     lda gact
     sbc #1
     asl @
     eor #2
     sta hlp
     txa
     sec
     sbc hlp
     bmi gmoc
     cmp #2
     bcs grbl
gmoc dey
     bne gmo1
gmo2 clc
     lda gx
     adc gdx
     clc
     adc gdx
     sta gx
     clc
     ldx gx
     ldy gy
     jsr test
     cmp #4
     bcs *+4
     clc
     rts
grbl lda #3
     sta gact
     sec
     rts


gclr sec
     lda gy+1
     sbc #8
     tax
     ldy #15
     lda #0
     sta plr2,x
     sta plr3,x
     inx
     dey
     bpl *-8
     rts
gdis lda gact
     bne *+3
     rts
     sec
     lda gy
     sbc #8
     tax
     ldy gshp
     lda gshtab,y
     jsr plradr
     ldy #0
gdi1 lda (addr),y
     sta plr2,x
     lda (scra),y
     sta plr3,x
     inx
     iny
     cpy #16
     bcc gdi1
     rts

expltrp equ *  ;** wybuchnij pulapki
     ldx gx
     dex
     dex
     dex
     ldy gy
     dey
     jsr ext1
     ldx gx
     inx
     inx
     inx
     ldy gy
     dey
ext1 jsr test
     lda stat,x
     ldx cavb,y
     and #$f0
     cmp #$10 ;-las
     bne *+4
     ldx #$27
     cmp #$90
     beq emin
     cmp #$a0
     beq emin
     cmp #$50 ;-min
     bne *+4
emin ldx #$26
     txa
     cmp cavb,y
     beq *+7
     lda #$25
     jsr addsco
     txa
     sta cavb,y
     ldx #0
     stx exac
     stx exac+1
     rts

* ruch pociskuw ****

miss lda #3
     sta hlp+1
mis1 ldx hlp+1
     lda mdx,x
     beq mis2
     lda mx,x
     cmp #$04
     bcc *+6
     cmp #$7d
     bcc *+10
     lda #out
     sta mx,x
     lda #0
     sta mdx,x
     ldy my,x
     tax
     beq *+5
     jsr test
     cmp #4
     bcc *+5
     jsr traf
     ldx hlp+1
     lda mdx,x
     adc mx,x
     sta mx,x
mis2 dec hlp+1
     bpl mis1

     ldx #3
     lda mx,x
     sta mpos,x
     dex
     bpl *-6
     rts

* strzal

bomb dta b($00),b($9b) ;•••
shoo equ *

     lda #2
     sta nrvt
     sta addr+1   ;•••
     lda cntr     ;•••  pod $240
     and #$40     ;•••  musi byc $9b
     beq ssss     ;•••
     sta addr     ;•••
     ldy #0       ;•••
     lda (addr),y ;•••
     cmp bomb+1   ;•••
     beq ssss     ;•••
     dec bomb     ;•••

ssss lda ammo
     beq miex
     lda hact
     cmp #lifuac
     bcs miex


     ldx #3
     stx mdis
serm lda mdx,x
     beq *+7
     dex
     bpl serm
     bmi miex

     ldy hshp
     cpy #bkshp
     bcs miex
     lda hx
     cpy #ltshp
     beq *+5
     clc
     adc #7
     sta mx,x
     clc
     lda hy
     adc #12
     cmp #$20
     bcc miex
     sta my,x
     lda #$04
     cpy #ltshp
     bne *+4
     lda #$fc
     sta mdx,x
     dec ammo
     lda #$08
     jmp sound
miex rts

traf ldx hlp+1
     lda #0
     sta mdx,x
     lda #out
     sta mx,x
     rts


mclr lda #$00
     ldx #3
mcld ldy my,x
     sta plr4,y
     dex
     bpl mcld
     rts
mdsp ldx #3
     lda #%11000000
     sta hlp
mds1 lda mdx,x
     beq mds2
     lda hlp
     ldy my,x
     ora plr4,y
     sta plr4,y
mds2 lsr hlp
     lsr hlp
     dex
     bpl mds1
     rts

********************

clrwea equ *
     jsr gclr
     lda #0
     sta gact
     ldx #3
     lda #0
     sta mdx,x
     lda #out
     sta mpos,x
     dex
     bpl *-10

     ldx #7
     lda #0
     sta miac,x
     dex
     bpl *-4
     rts

gshtab dta b($3a),b($3c),b($3e),b($3b),b($3d),b($3f)

     end weap

