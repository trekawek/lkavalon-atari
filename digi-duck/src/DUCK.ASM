;◢▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀◣
;|    "Digi Duck"   |
;| ---------------- |
;|      Autor:      |
;|  Dariusz  Zolna  |
;| ──────────────── |
;|  Copyright (c)   |
;| De Jet  18.11.92 |
;◥▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄◤

 opt h+
 org $4800

*- game memory

spprg  equ $8f80

s1     equ $9b00
s2     equ $bc00

spritf equ $ac00
magf1  equ $b400
magf2  equ $9c00

down_fnt equ $a800
titl_fnt equ $7000
lett_fnt equ $6c00
muzyka   equ $8300
zagraj   equ $7b00
caves    equ $2200

pmbase   equ $a000

*- page 0

sps0    equ $f3

dlmo    equ sps0+00
fnt_no  equ sps0+01
scr_no  equ sps0+02
scra    equ sps0+03
font    equ sps0+05
spta    equ sps0+07

s0       equ $80

hlp      equ s0+00
tmp      equ s0+02
rejx     equ s0+04
rejy     equ s0+05
adr1     equ s0+06
adr2     equ s0+08
adr3     equ s0+10
help     equ s0+12
pom      equ s0+13
zegar    equ s0+14
zadad    equ s0+15

*- system vectors

dlv    equ 560
dliv   equ $200
chset  equ $d409

vcount equ $d40b
nmien  equ $d40e
rnd    equ $d20a
wsync  equ $d40a

jstick0  equ $0278
strig0   equ $0284

*- consts

p       equ $c4

scwidth equ 32
linedistance equ 32
scheigth equ 8

spmax   equ 5
spbegn  equ 98

sprites equ spprg
spinit equ spprg+3
shpnum equ spprg+6
spxpo  equ shpnum+21
spypo  equ spxpo+21
revund equ spypo+21

begin    equ *

 lda #0
 sta 580
 lda #$3c
 sta $d303
 lda <bgn_1
 sta 12
 lda >bgn_1
 sta 13
 lda #1
 sta 9
 jmp $e474

bgn_1    equ *

 lda #$ff
 sta $d301
 lda #1
 sta 580

 lda #0
 sta hlp
 sta tmp
 clc
 lda >magf1
 sta hlp+1
 lda >magf2
 sta tmp+1
 ldx #8
 ldy #0

cscs     equ *

 lda (hlp),y
 sta (tmp),y
 iny
 bne cscs
 inc tmp+1
 inc hlp+1
 dex
 bne cscs

 lda #57
 sta 559
 lda #2
 sta $d01d
 lda #%100001
 sta 623
 lda #0
 sta $d008
 sta $d009
 sta $d00a
 sta $d00b
 lda >pmbase
 sta $d407

 ldx <muzyka
 ldy >muzyka
 lda #$70
 jsr zagraj+3

 ldy <vbint
 ldx >vbint
 lda #7
 jsr $e45c

petla    equ *

 jsr title
 jsr start
 jmp petla

start    equ *

 ldy <var_len
 dey
 lda #0
 sta var_bgn,y
 dey
 bpl *-4

 lda mnogo
 sta lives

 lda 20
 cmp 20
 beq *-2
 lda <dlipr1
 sta dliv
 lda >dlipr1
 sta dliv+1
 lda #$c0
 sta nmien

 ldy #0
 tya

clrpmb   equ *

 sta pmbase+$400,y
 sta pmbase+$500,y
 sta pmbase+$600,y
 sta pmbase+$700,y
 iny
 bne clrpmb

 ldy #0
 tya
 sta bit_map,y
 iny
 bne *-4
 lda <rownania-11
 sta zadad
 lda >rownania-11
 sta zadad+1
 lda #100
 sta curtain
 lda #255
 sta poziom
 jmp level

main     equ *

 ldy #10

mai_1    equ *

 lda (zadad),y
 cmp #116
 bcs *+4
 lda #126
 sta info+52,y
 ora #1
 sta info+84,y
 dey
 bpl mai_1

 lda #0
 sta discs
 sta bombs
 sta sparks
 lda poziom
 asl @
 asl @
 asl @
 asl @
 sed
 clc
 adc score+1
 sta score+1
 lda #$00
 adc score+2
 sta score+2
 cld

 lda #255
 sta 764
 sta 17

loop     equ *

 lda #0
 sta 732
 sta 20
 sta 77
 sta death
 sta $d01e
 inc zegar
 jsr animator

 lda inivar+1
 beq *+5
 jsr ducks
 jsr sprites
 jsr player
 jsr take
 jsr fire
 jsr boom
 jsr counters

 lda liv_tim
 beq *+5
 dec liv_tim

 and #1
 asl @
 ora col_plr
 sta 704
 and #2
 ora col_plr+1
 sta 705

 ldy #10

chk_zeb  equ *

 lda info+52,y
 cmp (zadad),y
 bne no_zeb
 dey
 bpl chk_zeb
 lda #100
 sta curtain
 jsr zaslon
 jmp level

no_zeb   equ *

 lda info+62
 cmp #126
 beq no_bad
 lda #100
 sta curtain
 jsr zaslon
 dec poziom
 jmp level

no_bad   equ *

 lda #1
 cmp 20
 bcs *-2
 lda 17
 bne *+5
 jmp break
 lda 764
 cmp #28
 bne *+5
 jmp break
 lda 732
 beq *+5
 jmp abort

 lda death
 bne *+5
 jmp loop
 jmp over

break    equ *

 lda #255
 sta 764
 sta 17
 jmp zaslon

abort    equ *

 lda #0
 sta ile_get
 dec poziom
 lda zadad
 sec
 sbc #11
 sta zadad
 lda zadad+1
 sbc #0
 sta zadad+1
 lda lives
 bne *+5
 jmp game_ovr
 sed
 sec
 sbc #$01
 sta lives
 cld
 lda #100
 sta curtain
 jsr zaslon
 jmp level

vbint    equ *

 lda $d01f
 cmp #5
 bne no_sel
 cmp lsel
 beq no_sel
 lda music
 eor #255
 sta music
 bne niegraj
 ldx nr_mus
 lda #$10
 jsr zagraj+3
 jmp no_sel

niegraj  equ *

 lda #$50
 jsr zagraj+3

no_sel   equ *

 lda $d01f
 sta lsel
 jsr zagraj+6
 jmp $e462

title    equ *

 lda music
 bne tit_1

 lda #$10
 ldx #0
 stx nr_mus
 jsr zagraj+3

tit_1    equ *

 ldy #4
 lda #$a0
 sta 708,y
 dey
 bpl *-4
 sta ile_get
 lda <titdl
 sta 560
 lda >titdl
 sta 561
 lda <titint
 sta 512
 lda >titint
 sta 513
 lda #192
 sta 54286
 lda #$f
 sta xcav
 sta ycav
 jsr showcav
 ldy #4
 lda tit_col,y
 sta 708,y
 dey
 bpl *-7
 lda #255
 sta 764
 lda #$09
 sta mnogo
 ldx #0

tit_lop  equ *

 lda 764
 cmp #255
 beq bad_let
 ldy #255
 sty 764
 cmp haslo,x
 beq *+7
 ldx #0
 jmp bad_let

 inx
 cpx <max_has
 bcc bad_let
 lda #$99
 sta mnogo

bad_let  equ *

 lda $0284
 beq tit_end
 lda $d01f
 cmp #6
 bne tit_lop

tit_end  equ *

 ldy #4
 lda #0
 sta 708,y
 dey
 bpl *-4
 rts

titint   equ *

 pha
 lda $d40b
 cmp #64
 bcs ttin_1
 and #4
 clc
 adc >titl_fnt
 sta $d40a
 sta $d409
 pla
 rti

ttin_1   equ *

 tya
 pha
 lda >lett_fnt
 sta $d40a
 sta $d409
 ldy #15
 sta $d40a
 dey
 bpl *-4
 lda #$0a
 ldy 712
 sta $d40a
 sta $d017
 sty $d018
 pla
 tay
 pla
 rti

zapis    equ *

 lda #2
 sta nr_mus

 lda #$50
 jsr zagraj+3
 jsr zaslon

 lda music
 bne zap_1
 lda #$10
 ldx #2
 jsr zagraj+3

zap_1    equ *

 lda score
 pha
 lda score+2
 sta score
 pla
 sta score+2
 jsr sortuj
 jsr shw_scor
 lda #80
 sta curtain
 jsr odslon
 sed
 sec
 ldy #2
 lda score,y
 sbc hiscores+169,y
 dey
 bpl *-7
 cld
 bcc *+5
 jsr wiekszy
 lda #0
 sta score
 sta score+1
 sta score+2
 lda #$50
 jmp zagraj+3

shw_scor equ *

 ldy #0
 tya
 sta screen,y
 sta screen+$100,y
 dey
 bne *-7

 lda <screen+7
 sta adr1
 lda >screen+7
 sta adr1+1
 lda <hiscores+3
 sta adr2
 lda >hiscores+3
 sta adr2+1
 ldx #13

sh_1_sco equ *

 ldy #9
 lda (adr2),y
 sta (adr1),y
 dey
 bpl *-5
 ldy #adr1
 lda #32
 jsr inad
 ldy #adr2
 lda #13
 jsr inad
 dex
 bpl sh_1_sco

 lda <screen+19
 sta adr1
 lda >screen+19
 sta adr1+1
 lda <hiscores
 sta adr2
 lda >hiscores
 sta adr2+1
 ldx #13

sh_2_sco equ *

 ldy #0

sh_3_sco equ *

 tya
 lsr @
 tay
 lda (adr2),y
 pha
 tya
 asl @
 tay
 pla
 jsr sh_dg_sc
 cpy #6
 bcc sh_3_sco
 ldy #adr1
 lda #32
 jsr inad
 ldy #adr2
 lda #13
 jsr inad
 dex
 bpl sh_2_sco

 lda <scodl
 sta 560
 lda >scodl
 sta 561

 lda >down_fnt
 sta 756
 ldy #3
 lda col_tab,y
 sta 708,y
 lda #0
 sta $d000,y
 dey
 bpl *-12
 rts

sh_dg_sc equ *

 pha
 lsr @
 lsr @
 lsr @
 lsr @
 jsr sh_cp_sc
 pla

sh_cp_sc equ *

 and #$0f
 clc
 adc #$10
 sta (adr1),y
 iny
 rts

wiekszy  equ *

 ldy #2
 lda score,y
 sta hiscores+169,y
 dey
 bpl *-7
 lda #$7f
 sta hiscores+172
 jsr sortuj
 lda <hiscores+3
 sta adr1
 lda >hiscores+3
 sta adr1+1
 ldx #0

szuk_zap equ *

 ldy #0
 lda (adr1),y
 cmp #$7f
 beq fou_zap
 ldy #adr1
 lda #13
 jsr inad
 inx
 bne szuk_zap

fou_zap  equ *

 ldy #9
 lda #0
 sta (adr1),y
 dey
 bpl *-3
 lda adr1
 sta adr3
 lda adr1+1
 sta adr3+1
 txa
 pha
 jsr shw_scor
 lda #0
 sta adr1+1
 pla
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
 clc
 adc <screen+7
 sta adr1
 lda adr1+1
 adc >screen+7
 sta adr1+1
 lda #0
 sta xcrs
 sta char

zap_lop  equ *

 lda 20
 cmp 20
 beq *-2

 ldx char
 and #%100
 bne *+4
 ldx #32
 txa
 ldy xcrs
 sta (adr1),y

 ldy 764
 cpy #12
 beq zap_end
 cpy #52
 bne *+5
 jsr delete
 iny
 beq zap_lop
 dey
 tya
 and #63
 lda (121),y
 cmp #96
 bcc *+5
 sec
 sbc #32
 ldx #36
 cmp doz_key,x
 beq ok_key
 dex
 bpl *-6
 lda #255
 sta 764
 jmp zap_lop

ok_key   equ *

 sec
 sbc #32
 sta char
 ldy xcrs
 sta (adr1),y
 cpy #9
 bcs *+8
 iny
 lda #0
 sta char
 sty xcrs
 lda #255
 sta 764
 jsr click
 jmp zap_lop

zap_end  equ *

 ldy xcrs
 lda char
 sta (adr1),y
 ldy #9

zpe_1    equ *

 lda (adr1),y
 sta (adr3),y
 dey
 bpl zpe_1
 rts

click    equ *

 ldy #10

 tya
 and #1
 asl @
 asl @
 asl @
 sta $d40a
 sta $d01f
 dey
 bpl click+2
 rts

delete   equ *

 jsr click
 ldy xcrs
 lda #0
 sta (adr1),y
 cpy #0
 beq *+3
 dey
 lda #0
 sta char
 sta (adr1),y
 sty xcrs
 ldy #255
 sty 764
 rts

sortuj   equ *

 ldx #5

sort_lop equ *

 txa
 pha
 lda <hiscores+156
 sta adr1
 lda >hiscores+156
 sta adr1+1
 lda <hiscores+169
 sta adr2
 lda >hiscores+169
 sta adr2+1

 ldx #12

sort_1   equ *

 sed
 sec
 ldy #2
 lda (adr2),y
 sbc (adr1),y
 dey
 bpl *-5
 cld
 bcc mniejszy
 ldy #12

sort_2   equ *

 lda (adr1),y
 pha
 lda (adr2),y
 sta (adr1),y
 pla
 sta (adr2),y
 dey
 bpl sort_2

mniejszy equ *

 lda adr2
 sec
 sbc #13
 sta adr2
 lda adr2+1
 sbc #0
 sta adr2+1
 lda adr1
 sec
 sbc #13
 sta adr1
 lda adr1+1
 sbc #0
 sta adr1+1
 dex
 bpl sort_1
 pla
 tax
 dex
 bpl sort_lop
 rts

 icl 'DD_PROC.ASM'

nextcav  equ *

 lda cave
 pha
 stx xcav
 sty ycav
 jsr showcav
 ldx x_plr
 ldy y_plr
 jsr ob_pl_ad
 lda monitor,y
 ldx #5
 cmp blckrs,x
 beq lastcav
 dex
 bpl *-6
 lda cave
 tax
 pla
 sta cave
 txa
 pha
 ldy #0

nxc_1    equ *

 tya
 pha
 lda screen,y
 cmp #$40
 bcc nxc_2
 cmp #$48
 bcs nxc_2
 jsr ekr_bomb

nxc_2    equ *

 pla
 tay
 iny
 iny
 bne nxc_1

 pla
 sta cave
 jsr memocav
 clc
 rts

lastcav  equ *

 pla
 sta cave
 lda 20
 cmp 20
 beq *-2
 sec
 rts

chk_blk  equ *

 lda blck_tab,x
 cmp #1
 beq zablokuj
 clc
 rts

zablokuj equ *

 lda discs
 bne *+4
 sec
 rts

 lda posaddis,y
 sta dis_jmp
 lda posaddis+1,y
 sta dis_jmp+1

dis_jmp  equ *+1

 jsr rg_disc
 bcc *+3
 rts
 lda music
 bne *+4
 clc
 rts
 lda #$20
 ldx #20
 ldy #22
 jsr zagraj+3
 clc
 rts

rg_disc  equ *

 lda x_plr
 clc
 adc #7
 tax
 ldy y_plr
 jsr check_pl
 cmp #$22
 beq *+4
 sec
 rts
 dec discs
 jmp zabierz

lf_disc  equ *

 ldx x_plr
 ldy y_plr
 jsr check_pl
 cmp #$23
 beq *+4
 sec
 rts
 dec discs
 dey
 jmp zabierz

dw_disc  equ *

 ldx x_plr
 lda y_plr
 clc
 adc #7
 tay
 jsr check_pl
 cmp #$22
 beq *+4
 sec
 rts
 dec discs
 jmp zabierz

up_disc  equ *

 ldx x_plr
 ldy y_plr
 jsr check_pl
 cmp #$22
 beq *+4
 sec
 rts
 dec discs
 jmp zabierz

zabierz  equ *

 jsr space

bierz_go equ *

 ldx ile_get
 lda cave
 sta zebrane,x
 tya
 sta pozycja,x
 inx
 stx ile_get
 clc
 rts

chk_plr  equ *

 ldx #11

ch_1_kpl equ *

 stx rejx
 lda y_plr
 clc
 adc chk_y_ad,x
 tay
 lda x_plr
 clc
 adc chk_x_ad,x
 tax
 jsr check_pl
 ldx rejx
 sta blck_tab,x
 dex
 bpl ch_1_kpl

 ldx #7

ch_2_kpl equ *

 lda blck_tab,x
 pha
 lda #1
 sta blck_tab,x
 pla
 and #254
 ldy #5
 cmp blckrs,y
 beq ch_3_kpl
 dey
 bpl *-6
 lda #0
 sta blck_tab,x

ch_3_kpl equ *

 dex
 bpl ch_2_kpl
 rts

check_pl equ *

 jsr ob_pl_ad
 lda screen,y
 rts

ob_pl_ad equ *

 tya
 asl @
 asl @
 and #%11100000
 sta help
 txa
 lsr @
 lsr @
 and #%00011111
 ora help
 tay
 rts


animator equ *

 lda #0
 sta sou_1_nd
 sta sou_2_nd

 ldy #0

ani_1    equ *

 lda bit_map,y
 bne no_anim
 lda screen,y
 cmp #$24
 bcc no_anim
 ldx #28

ani_2    equ *

 cmp anim_tab,x
 beq animuj
 dex
 bpl ani_2

no_anim  equ *

 iny
 iny
 bne ani_1

 lda scr_no
 and #1
 tax
 lda ekran,x
 sta adr1+1
 lda #0
 sta adr1
 ldy #0

ani_3    equ *

 lda screen,y
 sta (adr1),y
 lda #0
 sta bit_map,y
 iny
 bne ani_3

 lda music
 beq ani_5

 lda sou_1_nd
 beq ani_4
 tay
 lda #$20
 ldx #0
 jsr zagraj+3

ani_4    equ *

 lda sou_2_nd
 beq ani_5
 tay
 ldx #50
 lda #$22
 jsr zagraj+3

ani_5    equ *

 rts

animuj   equ *

 stx rejx
 sty rejy
 txa
 asl @
 tax
 lda jump_tab,x
 sta ani_jmp
 lda jump_tab+1,x
 sta ani_jmp+1

ani_jmp  equ *+1

 jsr kran
 ldy rejy
 jmp no_anim

kran     equ *

 lda zegar
 and #%111
 beq *+3
 rts
 lda rnd
 and #7
 beq *+3
 rts
 tya
 clc
 adc #32
 tay
 lda screen,y
 bne *+4
 lda #$2a
 jmp shw_blck

dzi_p    equ *

 lda zegar
 and #%11
 beq *+3
 rts
 lda rnd
 and #31
 beq *+3
 rts
 lda #20
 sta sou_1_nd
 iny
 iny
 lda screen,y
 bne *+4
 lda #$36
 jmp shw_blck

dzi_l    equ *

 lda zegar
 and #%11
 beq *+3
 rts
 lda rnd
 and #31
 beq *+3
 rts
 lda #20
 sta sou_1_nd
 dey
 dey
 lda screen,y
 bne *+4
 lda #$3a
 jmp shw_blck

kropi    equ *

 lda zegar
 and #%11
 beq *+3
 rts
 jsr space
 cpy #224
 bcc *+3
 rts
 tya
 clc
 adc #32
 tay
 lda screen,y
 bne *+7
 lda #$2a
 jmp shw_blck

 tya
 sec
 sbc #32
 tay
 lda #21
 sta sou_2_nd
 lda #$2e
 jmp shw_blck

szppw    equ *

 lda zegar
 and #%11
 beq *+3
 rts
 lda #$3e
 jsr shw_blck
 tya
 and #30
 cmp #30
 bcs spw_1+2
 iny
 iny
 lda screen,y
 bne spw_1
 lda #$36
 jmp shw_blck

spw_1    equ *

 dey
 dey
 lda #$38
 jmp shw_blck

szppm    equ *

 lda zegar
 and #%11
 beq *+3
 rts
 jsr space
 dey
 dey
 lda screen,y
 cmp #$3e
 bne *+4
 lda #$38
 jmp shw_blck

szplw    equ *

 lda zegar
 and #%11
 beq *+3
 rts
 lda #$3e
 jsr shw_blck
 tya
 and #30
 beq slm_1+2
 dey
 dey
 lda screen,y
 bne slm_1
 lda #$3a
 jmp shw_blck

slm_1    equ *

 iny
 iny
 lda #$3c
 jmp shw_blck

szplm    equ *

 lda zegar
 and #%11
 beq *+3
 rts
 jsr space
 iny
 iny
 lda screen,y
 cmp #$3e
 bne *+4
 lda #$3c
 jmp shw_blck

bomba    equ *

 lda zegar
 and #%1111
 beq *+3
 rts
 lda #11
 sta sou_1_nd

ekr_bomb equ *

 jsr space
 tya
 jsr chk_bomb
 tya
 sec
 sbc #32
 jsr chk_bomb
 tya
 clc
 adc #30
 jsr chk_bomb
 tya
 clc
 adc #4
 jsr chk_bomb
 tya
 clc
 adc #30

chk_bomb equ *

 tay
 lda screen,y
 ldx #20
 cmp bomb_tb,x
 beq postaw
 dex
 bpl *-6
 rts

postaw   equ *

 cmp #$00
 beq *+5
 jsr zabierz
 lda #$48
 jmp shw_blck

jajco    equ *

 lda zegar
 and #%111
 beq *+3
 rts

 lda rnd
 and #15
 tax
 lda losy,x
 jmp shw_blck

speed4   equ *

 lda zegar
 and #%1111
 beq next
 rts

speed3   equ *

 lda zegar
 and #%111
 beq next
 rts

speed2   equ *

 lda zegar
 and #%11
 beq next
 rts

next     equ *

 lda screen,y
 clc
 adc #2
 jmp shw_blck

space    equ *

 lda #$00

shw_blck equ *

 sta screen,y
 ora #1
 sta screen+1,y
 sta bit_map,y
 rts



ducks    equ *

 ldx inivar+1
 dex

loo_1    equ *

 lda revund,x
 and #%10
 beq *+5
 jmp sho_1_dk
 dec mov_tim,x
 beq *+5
 jmp no_duk
 lda #8
 sta mov_tim,x

get_chr  equ *

 lda spypo,x
 sec
 sbc #16
 and #%11110000
 asl @
 sta hlp
 lda spxpo,x
 sec
 sbc #8
 lsr @
 lsr @
 ora hlp
 clc
 adc <screen-32
 sta adr1
 lda #0
 adc >screen-32
 sta adr1+1

 lda direct,x
 cmp #24
 bne *+8
 jsr anticlk
 jmp no_duk
 jsr clkwise

no_duk   equ *

 lda move,x
 cmp #%1000
 bne *+8
 inc spxpo,x
 jmp show

 cmp #%0100
 bne *+8
 dec spxpo,x
 jmp show

 cmp #%0010
 bne *+11
 inc spypo,x
 inc spypo,x
 jmp show

 cmp #%0001
 bne *+8
 dec spypo,x
 dec spypo,x

show     equ *

 lda duk_dir,x
 cmp #16
 bcc sho_2_dk
 lda shape,x
 cmp #3
 bne sho_1_dk
 lda #%10
 sta revund,x

sho_1_dk equ *

 lda zegar
 and #%11
 bne *+5

sho_2_dk equ *

 inc shape,x
 lda shape,x
 and #3
 sta shape,x
 clc
 adc #24
 adc duk_dir,x
 sta shpnum,x
 lda duk_dir,x
 dex
 bmi *+5
 jmp loo_1
 rts

chk_rg   equ *

 lda spxpo,x
 cmp #121
 bcs stop
 ldy #34
 jsr testuj
 tya
 bne stop
 lda #%1000
 sta move,x
 lda duk_dir,x
 and #16
 sta duk_dir,x
 clc
 rts

chk_lf   equ *

 lda spxpo,x
 cmp #16
 bcc stop
 ldy #31
 jsr testuj
 tya
 bne stop
 lda #%0100
 sta move,x
 lda duk_dir,x
 and #16
 ora #4
 sta duk_dir,x
 clc
 rts

chk_dw   equ *

 lda spypo,x
 cmp #121
 bcs stop
 ldy #64
 jsr testuj
 tya
 bne stop
 lda #%0010
 sta move,x
 lda duk_dir,x
 and #16
 ora #8
 sta duk_dir,x
 clc
 rts

chk_up   equ *

 lda spypo,x
 cmp #32
 bcc stop
 ldy #0
 jsr testuj
 tya
 bne stop
 lda #%0001
 sta move,x
 lda duk_dir,x
 and #16
 ora #12
 sta duk_dir,x
 clc
 rts

stop     equ *

 sec
 rts

anticlk  equ *

 lda move,x
 cmp #%1000
 bne no_lrg
 jsr chk_up
 bcc clkend
 jsr chk_rg
 bcc clkend
 jsr chk_dw
 bcc clkend
 lda #%0100
 sta move,x
 jmp clkend

no_lrg   equ *

 lda move,x
 cmp #%0100
 bne no_lft
 jsr chk_dw
 bcc clkend
 jsr chk_lf
 bcc clkend
 jsr chk_up
 bcc clkend
 lda #%1000
 sta move,x
 jmp clkend

no_lft   equ *

 lda move,x
 cmp #%0010
 bne no_ldw
 jsr chk_rg
 bcc clkend
 jsr chk_dw
 bcc clkend
 jsr chk_lf
 bcc clkend
 lda #%0001
 sta move,x
 jmp clkend

no_ldw   equ *

 lda move,x
 cmp #%0001
 bne clkend
 jsr chk_lf
 bcc clkend
 jsr chk_up
 bcc clkend
 jsr chk_rg
 bcc clkend
 lda #%0010
 sta move,x

clkend   equ *

 rts

clkwise  equ *

 lda move,x
 cmp #%1000
 bne no_rrg
 jsr chk_dw
 bcc atcend
 jsr chk_rg
 bcc atcend
 jsr chk_up
 bcc atcend
 lda #%0100
 sta move,x
 jmp atcend

no_rrg   equ *

 lda move,x
 cmp #%0100
 bne no_rft
 jsr chk_up
 bcc atcend
 jsr chk_lf
 bcc atcend
 jsr chk_dw
 bcc atcend
 lda #%1000
 sta move,x
 jmp atcend

no_rft   equ *

 lda move,x
 cmp #%0010
 bne no_rdw
 jsr chk_lf
 bcc atcend
 jsr chk_dw
 bcc atcend
 jsr chk_rg
 bcc atcend
 lda #%0001
 sta move,x
 jmp atcend

no_rdw   equ *

 lda move,x
 cmp #%0001
 bne atcend
 jsr chk_rg
 bcc atcend
 jsr chk_up
 bcc atcend
 jsr chk_lf
 bcc atcend
 lda #%0010
 sta move,x

atcend   equ *

 rts

testuj   equ *

 txa
 pha
 lda (adr1),y
 and #254
 ldy #1
 ldx #5
 cmp block_tb,x
 beq blocker
 dex
 bpl *-6
 ldy #0

blocker  equ *

 pla
 tax
 rts

showcav  equ *

 lda <caves
 sta adr1
 lda >caves
 sta adr1+1
 lda xcav
 lda ycav
 asl @
 asl @
 asl @
 asl @
 ora xcav
 sta cave

loopfor equ *

 ldy #0
 lda (adr1),y
 cmp cave
 beq found
 iny
 lda (adr1),y
 ldy #adr1
 jsr inad
 jmp loopfor

found    equ *

 ldy #1
 lda (adr1),y
 sta cavelen

 lda <monitor
 sta adr2
 lda >monitor
 sta adr2+1

 ldy #2

shc_1    equ *

 tya
 pha
 ldx #1
 lda (adr1),y
 sta char
 and #1
 beq one_chr
 iny
 lda (adr1),y
 tax

one_chr  equ *

 txa
 asl @
 sta linelen
 ldy #0

shw_chr  equ *

 lda char
 and #254
 sta (adr2),y
 iny
 ora #1
 sta (adr2),y
 iny
 dex
 bne shw_chr

 ldy #adr2
 lda linelen
 jsr inad

 pla
 tay
 iny
 lda char
 and #1
 beq *+3
 iny
 cpy cavelen
 bcc shc_1

 ldy ile_get

clr_getd equ *

 dey
 bmi no_getd
 lda zebrane,y
 cmp cave
 bne clr_getd
 lda pozycja,y
 tax
 lda #$00
 sta monitor,x
 lda #$01
 sta monitor+1,x
 jmp clr_getd

no_getd  equ *

 rts

memocav  equ *

 ldx #0
 ldy #0

get_sprt equ *

 tya
 pha
 lda monitor,y
 cmp #$62
 bcc no_sprt

 cmp #$76
 bcs no_sprt

fou_sprt equ *

 sec
 sbc #$62
 lsr @
 pha
 ldy #40
 cmp #4
 bcc *+4
 ldy #24
 tya
 sta direct,x
 pla
 and #3
 tay
 lda mov_faz,y
 sta move,x
 tya
 asl @
 asl @
 sta duk_dir,x
 pla
 pha
 tay
 lda #1
 sta mov_tim,x
 lda #0
 sta monitor,y
 lda #1
 sta monitor+1,y
 tya
 and #%11100000
 lsr @
 clc
 adc #16
 sta spypo,x
 tya
 and #%00011111
 asl @
 asl @
 clc
 adc #8
 sta spxpo,x
 lda #0
 sta revund,x
 pla
 pha
 sta tak_duk,x
 inx

no_sprt  equ *

 pla
 tay
 iny
 iny
 bne get_sprt
 stx inivar+1
 ldx <inivar
 ldy >inivar
 jsr spinit

 jsr clr_fir

 ldy #0
 lda monitor,y
 sta screen,y
 sta s1,y
 sta s2,y
 iny
 bne *-13
 rts

inad     equ *

 clc
 adc 0,y
 sta 0,y
 lda #0
 adc 1,y
 sta 1,y
 rts

dlipr1   equ *

 pha

 lda vcount
 cmp #72
 bcs dli2
 cmp #8
 bcs dli1
 lda #$0
 sta fnt_no

dli1     equ *

 inc fnt_no
 lda fnt_no
 lsr @
 lda dlmo
 bcs *+4
 adc >$400
 sta chset
 pla
 rti

dli2     equ *

 lda >down_fnt
 sta $d40a
 sta $d409
 pla
 rti

var_bgn  equ *

xcav     dta b(0)
ycav     dta b(0)
cave     dta b(0)
cavelen  dta b(0)
linelen  dta b(0)
char     dta b(0)
x_plr    dta b(0)
y_plr    dta b(0)
lyplr    dta b(0)
joy      dta b(0)
plr_mov  dta b(0)
steps    dta b(0)
dir_plr  dta b(0)
ile_get  dta b(0)
bombs    dta b(0)
sparks   dta b(0)
discs    dta b(0)
lives    dta b(0)
x_poc    dta b(0)
y_poc    dta b(0)
lypoc    dta b(0)
zxfir    dta b(0)
zyfir    dta b(0)
poc_faz  dta b(0)
act_fir  dta b(0)
death    dta b(0)
score    dta d'   '
liv_tim  dta b(0)
poziom   dta b(0)
ljoy     dta b(0)
xcrs     dta b(0)
curtain  dta b(0)
nr_mus   dta b(0)
lsel     dta b(0)
sou_1_nd dta b(0)
sou_2_nd dta b(0)

var_len  equ *-var_bgn

music    dta b(0)
mnogo    dta b(0)

 icl 'DATAS.ASM'

haslo    equ *

 dta b($3a) ;d
 dta b($2a) ;e
 dta b($21)
 dta b($01) ;j
 dta b($2a) ;e
 dta b($2d) ;t

max_has  equ *-haslo

 org $02e0
 dta a(begin)

 end


