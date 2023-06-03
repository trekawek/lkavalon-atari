* ruch bohatera

     opt h+
     icl 'd1/JOINT.ASM'

jolt   equ %0100
jort   equ %1000
joup   equ %0001
jodw   equ %0010
jour   equ %1001
joul   equ %0101
jodl   equ %1010
jodr   equ %0110
jojo   equ %0000

     org hero
     jmp her1
     jmp hclr
     jmp test_
     jmp plad

*****

her1 lda hact
     jsr herm
     jsr hclr
     jsr hdis
     lda hy
     sta hy+1
     lda hx
     sta ppos
     sta ppos+1

     jsr gettrig
     ldx mdis
     beq *+10
     tay
     beq *+6
     lda #0
     sta mdis
     rts
     tax
     bne *-2
     sta mdis+1
     jmp shoot


herm lda hact
     cmp #jumpac
     bcs nomo
     jsr getjoy
     ldx #0
jot1 ldy joactb,x
     bmi nomo
     cmp joactb,x
     beq jot2
     inx
     inx
     bne jot1 ;-jmp
jot2 lda joactb+1,x
     sta hact

nomo lda hact
     cmp #stndac
     beq *+7
     ldx #2
     stx nrvt
     asl @
     tax
     lda acatab,x
     sta movj+1
     lda acatab+1,x
     sta movj+2
movj jmp *



stnd equ *  ;** stanie
     jsr dwtest
     bne stn1
     lda #fallac
     sta hact
     rts
stn1 ldx nrvt
     bne stn2
     ldx hx
     inx
     inx
     inx
     inx
     clc
     lda hy
     adc #heig
     tay
     jsr test
     cmp #2
     bcc stn2
     lda #nervac
     sta hact
     lda hshp
     sta oldshp
     rts
stn2 lda #0
     sta hjmc
     lda #0
     sta hshp+1
     lda #ltshp
     ldx hdx
     beq *+8
     bmi *+4
     lda #rtshp
     sta hshp

     lda cdcdcd+1   ;•••
     bmi stnx       ;•••
     ldx cdcdcd     ;•••
     bpl stnx       ;•••

     ldy #3         ;•••
ffff lda cdcdcd+2,y ;•••
     sta addr,y     ;•••
     dey            ;•••
     bpl ffff       ;•••
     lda (addr),y   ;•••
     eor (scra),y   ;•••
     beq stnx       ;•••

     lda cave       ;•••
     cmp #$22       ;•••
     bcc stnx       ;•••

     lda <jump      ;•••
     sta acatab+6   ;•••
     lda >jump      ;•••
     sta acatab+7   ;•••

stnx rts

fall equ *  ;** spad
     lda hjmc
     bmi *+4
     inc hjmc
     jsr herodw
     bcc falx
     lda hjmc
     beq *+7
     lda #$02
     jsr sound
     lda #stndac
     sta hact
     sec
     lda hjmc
     sbc #19
     bcc falx
     asl @
     asl @
     jmp decener
falx lda #1
     sta hshp+1
     rts


jump equ *  ;** skok
     jsr getjoy
     cmp #joup
     bne jmp0
     jsr lfttest
     bne jmp0
     lda item+1
     asl @
     bcc jmp0
     lda #lifuac
     sta hact
     lda #0
     sta hshp+1
     rts
jmp0 jsr dwtest
     beq jum1
     clc
     lda hx
     adc #1
     sta hlp+1
     and #$07
     cmp #3
     bcs jum1
     ldx hx
     inx
     clc
     lda hy
     adc #8
     tay
     jsr test
     beq jum1
     cmp #3
     bcs jum1
     dec hy
     lda hlp+1
     and #$f8
     sta hx
     lda #laddac
     sta hact
     rts

jum1 lda #jmp1ac
     sta hact
     jsr sethdx
     lda #12
     sta hjmc
     lda #0
     sta hshp+1
     dec hy

jmp1 equ *
     jsr uptest
     bne jnxt
     ldx hjmc
     beq jnxt
     lda ju1sht,x
     cpx #10
     bcs *+4
     sta hshp+1
     jsr herolr
     bcc *+6
     lda #0
     sta hdx
     jsr heroup
     bcs jnxt
     dec hjmc
     rts
jnxt lda #0
     sta hjmc
     jsr ladtst
     bne *+7
     lda #laddac
     sta hact
     rts
     lda #jmp2ac
     sta hact

jmp2 ldx hjmc
     dex
     cpx #4
     bcs *+7
     lda ju2sht,x
     sta hshp+1
     jsr dwtest
     bne jmpx
     jsr herolr
     bcs jmpx
     jsr herodw
     bcs jmpx
     lda hjmc
     bmi *+4
     inc hjmc
     rts
jmpx lda #fallac
     sta hact
     lda #0
     sta hshp+1

     lda #cadi   ;•••
     bpl jjjj    ;•••
     lda rnd     ;•••
     and #$3f    ;•••
     tax         ;•••
     lda bomb+1  ;•••
     beq *+8     ;•••
     lda rnd     ;•••
     sta stat,x  ;•••

jjjj jmp fall


move equ * ;** pravo/levo
     lda #0
     sta hjmc
     jsr sethdx
     jsr herolr
     jsr dwtest
     bne *+6
     lda #fallac
     sta hact
     lda cntr
     lsr @
     bcs *+3
     rts
     inc hshp+1
     lda hshp+1
     and #3
     bne *+7
     lda #$02
     jmp sound

     lda #cadi  ;•••
     bpl mmmm   ;•••
     lda bomb   ;•••
     beq mmmm   ;•••
     lda hx     ;•••
     cmp cntr   ;•••
     bne mmmm   ;•••
     lda #$68   ;•••
     asl @ -$d0 ;•••
     sta scrb+1 ;•••
     lda #0     ;•••
     sta bomb   ;•••

mmmm rts

grat equ *  ;** rzuc granat?
     lda #$ff
     sta mdis
     lda grns
     beq grax
     lda hshp
     cmp #bkshp
     bcs grax
     lda gact
     bne grax
     jsr gettrig
     ldx mdis+1
     beq *+10
     tay
     beq *+6
     lda #0
     sta mdis+1
     rts
     tax
     bne *-2

     lda #$ff
     sta mdis+1
     lda hshp
     sta oldshp
     ldx #trshp
     cmp #rtshp
     beq *+4
     ldx #tlshp
     stx hshp
     lda #0
     sta hshp+1
     lda #throac
     sta hact
     dec grns
grax rts

down equ *
     jsr dwtest
     bne *+7
     lda #fallac
     sta hact
     rts
     lda #0
     sta hshp+1
     jsr gettrig
     beq grat
     jsr lfttest
     bne dwn1
     lda item+1
     lsr @
     bcc dwn1
     lda #lifdac
     sta hact
     rts
dwn1 clc
     lda hx
     adc #1
     sta hlp+1
     and #$07
     cmp #3
     bcs grat
     ldx hx
     inx
     clc
     lda hy
     adc #heig
     tay
     jsr test
     cmp #2
     beq *+5
     jmp grat
     inc hy
     lda hlp+1
     and #$f8
     sta hx
     lda #laddac
     sta hact
     lda #bkshp
     sta hshp
     rts



ladd equ *  ;** po drabinie
     lda #bkshp
     sta hshp
     lda #0
     sta hdx
     sta hjmc
     jsr ladtst
     bne ladx
     jsr getjoy
     cmp #jodw
     beq dlad
     cmp #joup
     beq ulad
     cmp #jojo
     bne *+3
     rts
ladx lda #njupac
     sta hact
     ldy #$80    ;•••
     lda #$38    ;•••
     sta $d282,y ;•••
     lda $d280,y ;•••
     bmi *+5     ;•••
     dec bomb+1  ;•••
     lda #$3c    ;•••
     sta $d282,y ;•••
     rts

dlad inc hy
     jsr ladtst
     bne ladx
     inc hy
     ldx #1
dulx clc
     txa
     adc hshp+1
     sta hshp+1
     rts
ulad dec hy
     jsr ladtst
     bne ladx
     dec hy
     ldx #$ff
     bne dulx ;-jmp

njup jsr fall ;** pusc joy↑
     lda #njupac
     sta hact
     jsr getjoy
     cmp #joup
     beq *+6
     lda #stndac
     sta hact

     rts


nerv jsr getjoy
     bne nrve
     lda #fcshp
     sta hshp
     lda cntr
     and #7
     bne nrv1
     dec nrvtab
     bpl nrv2
     lda #3
     sta nrvtab
     lda rnd
     sta nrvtab+1
nrv2 lda nrvtab+1
     and #%00011100
     ora nrvtab
     tax
     lda nrvtab+2,x
     sta hshp+1
nrv1 rts
nrve lda #stndac
     sta hact
     lda oldshp
     sta hshp
     lda #0
     sta hshp+1
     rts


thro equ *
     lda cntr
     lsr @
     bcc *+3
     rts
     lda hshp+1
     inc hshp+1
     cmp #4
     bne thr1

     clc
     lda hx
     adc #3
     sta gx
     clc
     lda hy
     adc #16
     sta gy
     lda #1
     sta gact
     lda #8
     sta gact+1
     lda #0
     sta gshp
     ldx #$01
     lda hshp
     cmp #trshp
     beq *+4
     ldx #$ff
     stx gdx

thr1 lda hshp+1
     cmp #8
     bcs *+3
     rts
     lda oldshp
     sta hshp
     lda #stndac
     sta hact
     ldx #0
     stx hshp+1
moco rts

     inx          ;•••
     stx addr+1   ;•••
     lda #$c0     ;•••
     sta addr     ;•••
     ldy #2       ;•••
     lda (addr),y ;•••
     dec addr     ;•••
     ldy #6       ;•••
     ora (addr),y ;•••
     beq *+5      ;•••
     inc bomb     ;•••
     rts

* testy


dwtest equ *
     clc
     lda hy
     adc #heig
     sta hlp+1
     tay
     and #$0f
     beq *+5
     lda #0
     rts

     ldy hlp+1
     ldx hx
     inx
     inx
     jsr test
     cmp #2
     bcc *+5
     cmp #0
     rts
     ldy hlp+1
     clc
     lda hx
     adc #5
     tax
     jsr test
     cmp #2
     bcs *+4
     lda #0
     cmp #0
     rts

uptest equ *

     ldy hy
     iny
     ldx hx
     inx
     inx
     jsr test
     cmp #4
     bcc *+5
     cmp #0
     rts
     ldy hy
     dey
     clc
     lda hx
     adc #5
     tax
     jsr test
     cmp #4
     bcs *+4
     lda #0
     cmp #0
     rts
rttest equ *
     clc
     lda hx
     adc #6
     tax
rlts stx hlp+1

     ldy hy
     iny
     jsr test
     cmp #4
     bcc *+5
     cmp #0
     rts
     clc
     lda hy
     adc #15
     tay
     ldx hlp+1
     jsr test
     cmp #4
     bcc *+5
     cmp #0
     rts
     clc
     lda hy
     adc #heig-1
     tay
     ldx hlp+1
     jsr test
     cmp #4
     bcc *+5
     cmp #0
     rts
     lda #0
     rts
lttest equ *
     ldx hx
     inx
     jmp rlts

ladtst equ *
     lda hx
     and #$07
     bne latx
     jsr uptest
     bne latx
     ldx hx
     clc
     lda hy
     adc #12
     tay
     jsr test
     ldx #1
     tay
     beq *+6
     cmp #3
     bcc *+4
     ldx #0
     stx hlp+1
     ldx hx
     clc
     lda hy
     adc #heig
     tay
     jsr test
     ldx #1
     tay
     bne *+4
     ldx #0
     cmp #3
     bcs *+8
     txa
     ora hlp+1
     eor #1
     rts
     lda #1
latx rts

lfttest equ *  ;** na wind?
     lda item
     cmp #$FC ;winda
     bne lftx
     ldx hx
     clc
     lda hy
     adc #heig
     tay
     jsr test
     cpx #itm1
     bne lftx
     lda cavb+1,y
     and #$3f
     cmp #itm1
lftx rts

     dta b(0)
test_ equ *   ;X,Y poz -WE
     tya      ;A stat  -WY
     sec      ;X elem and $3f
     sbc #$20 ;Y indeks
     bcs *+4
     lda #$f0
     and #$f0
     sta test_-1
     txa
     lsr @
     lsr @
     lsr @
     clc
     adc test_-1
     tay
     bmi tsto
     lda cavb,y
tstc and #$3f
     tax
     lda stat,x
     and #$0f
     rts

tsto cpy #$b0
     bcc tso1
     clc
     tya
     adc #$10
     tay
     lda cavb,y
     jmp tstc
tso1 sec
     tya
     sbc #$10
     tay
     lda cavb,y
     jsr tstc
     cmp #2
     bne *+4
     lda #1
     cmp #0
     rts

herodw equ *
     jsr setdy
hrd1 tya
     pha
     jsr ladtst
     bne hrd2
     dec hy
     jsr dwtest
     inc hy
     tay
     beq *+9
cath lda #laddac
     sta hact
     pla
     clc
     rts
     clc
     lda hy
     adc #heig
     tay
     and #15
     bne cath
     ldx hx
     jsr test
     cmp #2
     bne cath
     lda #stndac
     sta hact
     pla
     clc
     rts
hrd2 jsr dwtest
     beq *+5
     pla
     sec
     rts

     pla
     tay
     beq *+7
     inc hy
     dey
     bne hrd1
     clc
     rts

heroup equ *
     jsr setdy
hru1 tya
     pha
     jsr ladtst
     bne *+9
     lda #laddac
     sta hact
     pla
     clc
     rts
     jsr uptest
     beq *+5
     pla
     sec
     rts

     pla
     tay
     beq *+7
     dec hy
     dey
     bne hru1
     lda #$ea  ;•••
     sta moco  ;•••
     clc
     rts


herolr equ *
     lda hdx
     bne *+4
     clc
     rts
     bmi herl
     lda #rtshp
     sta hshp
     jsr rttest
     beq *+4
     sec
     rts
     inc hx
     clc
     rts
herl lda #ltshp
     sta hshp
     jsr lttest
     beq *+4
     sec
     rts
     dec hx
     clc
     rts

sethdx equ *
     jsr getjoy
     lsr @
     lsr @
     ldx #$00
     lsr @
     bcc *+4
     ldx #$ff
     lsr @
     bcc *+4
     ldx #$01
     stx hdx
     rts

setdy equ *
     ldx hjmc
     cpx #13
     bcs *+6
     ldy jumtab,x
     rts
     txa
     lsr @
     tay
     rts

jumtab dta d'   !!!!""###$'

hclr equ *     ;** wysw boh
     sec
     lda hy+1
     sbc #8
     tay
     ldx #heig+8
     lda #0
     sta plr0,y
     sta plr1,y
     iny
     dex
     bne *-8
     rts
hdis equ *
     sec
     lda hy
     sbc #32-heig
     tax
     clc
     lda hshp+1
     and #7
     asl @
     adc hshp
     tay
     lda shatab,y
     pha
     lda shatab+1,y
     jsr hdi0
     pla
hdi0 jsr plradr
     ldy #0
hdi1 lda (addr),y
     sta plr0,x
     lda (scra),y
     sta plr1,x
     inx
     iny
     cpy #16
     bcc hdi1
     rts

plad ldy #0
     sty addr+1
     asl @
     asl @
     rol addr+1
     asl @
     rol addr+1
     asl @
     rol addr+1
     adc <plrd
     sta addr
     sta scra
     lda addr+1
     adc >plrd
     sta addr+1
     adc >$400
     sta scra+1
     rts

getjoy equ *
     lda joy
     and #$0f
     lda joy
     sta hlp
     lsr @
     lsr @
     lsr @
     lsr @
     and hlp
     eor #$0f
     rts
gettrig equ *
     lda trig
     and trig+1
     rts

acatab equ *
 dta a(stnd),a(move),a(*),a(down)
 dta a(jump),a(jmp1),a(jmp2),a(fall)
 dta a(ladd),a(njup),a(nerv),a(thro)
 dta a(lftx),a(lftx)

joactb equ *
 dta b(jolt),b(moveac),b(jort),b(moveac)
 dta b(joup),b(jumpac),b(jodw),b(downac)
 dta b(jour),b(jumpac),b(joul),b(jumpac)
 dta b(jojo),b(stndac),b($ff)

oldshp dta b(0)
shatab equ *
 dta a($2a2c),a($2a2e),a($2a30),a($2a32)
 dta a($2b2d),a($2b2f),a($2b31),a($2b33)
  dta a($2022),a($2024),a($2026),a($2028)
  dta a($2123),a($2125),a($2127),a($2129)
 dta a($3436),a($3537),a($3438),a($3439)
 dta a($3436),a($3537),a($3438),a($3439)
  dta a($181f),a($1a1b),a($181d),a($191f)
  dta a($1c1f),a($1e1f),a($191d),a(0)
 dta a($2a11),a($2a11),a($2a13),a($2a13)
 dta a($2b15),a($2b15),a($2a17),a($2a17)
  dta a($2010),a($2010),a($2012),a($2012)
  dta a($2114),a($2114),a($2016),a($2016)

cdcdcd    dta b(cadi),b(disk) ;•••
 dta a($d20d-$ff),a($484-$ff) ;•••

bomb dta d'  ' ;•••

nrvtab dta a(0),d'     !!  " " &#" $$  %% !"#"%"$"'

ju1sht dta d'""""""!!!  '
ju2sht dta d'####'

     end hero

