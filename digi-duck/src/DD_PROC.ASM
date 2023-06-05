level    equ *

 lda #0
 sta ile_get
 inc poziom

 lda poziom
 cmp #8
 bcc *+5
 jmp zapis

 lda <levdl
 sta 560
 lda >levdl
 sta 561
 lda >lett_fnt
 sta 756
 ldy #0

lco_1    equ *

 lda 20
 clc
 adc #3
 cmp 20
 bne *-2
 sty 709
 iny
 cpy #$10
 bcc lco_1

 lda 20
 clc
 adc #255

 ldx $0284
 beq *+6
 cmp 20
 bne *-7

 ldy #$0e

lco_2    equ *

 lda 20
 clc
 adc #3
 cmp 20
 bne *-2
 sty 709
 dey
 bpl lco_2

 ldy poziom
 lda cav_tab,y
 and #$0f
 sta xcav
 lda cav_tab,y
 lsr @
 lsr @
 lsr @
 lsr @
 sta ycav
 lda plrx_tb,y
 sta x_plr
 lda plry_tb,y
 sta y_plr
 jsr showcav
 jsr memocav
 jsr show_plr

 jsr odslon

 ldy #zadad
 lda #11
 jsr inad
 jmp main

zaslon   equ *

 ldy #3
 lda #0
 sta 708,y
 dey
 bpl *-4

 ldx #10

lev_lop  equ *

 txa
 pha
 lda 20
 cmp 20
 beq *-2

 cpx $d40b
 bne *-3

 ldy #0

llo_1    equ *

 tya
 sta $d40a
 sta $d018
 sta $d019
 lsr @
 sta $d017
 lsr @
 sta $d016
 iny
 iny
 cpy #$10
 bcc llo_1

 lda col_tab
 ldy col_tab+1
 ldx col_tab+2
 sta $d40a
 sta $d016
 sty $d017
 stx $d018

 pla
 tax
 lda 20
 and #%1
 bne *+3
 inx
 cpx curtain
 bcc lev_lop

 ldy #15

llo_3    equ *

 lda 20
 clc
 adc #3
 cmp 20
 bne *-2

 sty help
 ldx #3

llo_4    equ *

 lda 704,x
 and #$f0
 sta hlp
 lda 704,x
 and #$0f
 cmp help
 bcc llo_5
 lda help
 ora hlp
 sta 704,x

llo_5    equ *

 dex
 bpl llo_4
 dey
 bpl llo_3
 ldy #3
 lda #0
 sta $d000,y
 dey
 bpl *-4
 rts

odslon   equ *

 ldy #3
 lda #0
 sta 708,y
 dey
 bpl *-4

 ldy #0

lao_1    equ *

 lda 20
 clc
 adc #3
 cmp 20
 bne *-2

 sty help
 ldx #3

lao_2    equ *

 lda col_plr,x
 and #$f0
 sta hlp
 lda col_plr,x
 and #$0f
 cmp help
 bcc lao_3
 lda help
 ora hlp
 sta 704,x

lao_3    equ *

 dex
 bpl lao_2
 iny
 cpy #$10
 bcc lao_1

 ldx curtain

lel_1    equ *

 txa
 pha
 lda 20
 cmp 20
 beq *-2

 cpx $d40b
 bne *-3

 ldy #0

lel_2    equ *

 tya
 sta $d40a
 sta $d018
 sta $d019
 lsr @
 sta $d017
 lsr @
 sta $d016
 iny
 iny
 cpy #$10
 bcc lel_2

 lda col_tab
 ldy col_tab+1
 ldx col_tab+2
 sta $d40a
 sta $d016
 sty $d017
 stx $d018

 pla
 tax
 lda 20
 and #%1
 bne *+3
 dex
 cpx #10
 bcs lel_1

 ldy #3
 lda col_tab,y
 sta 708,y
 dey
 bpl *-7
 rts

over     equ *

 lda liv_tim
 beq *+5
 jmp ove_end

 lda #$10
 ldx #1
 ldy music
 bne *+8
 jsr zagraj+3
 jmp ove_5

 lda #$20
 ldx #0
 ldy #19
 jsr zagraj+3

ove_5    equ *

 lda #$06
 sta 704
 lda #$0a
 sta 705

 lda <pmbase+$400
 sta adr1
 lda >pmbase+$400
 sta adr1+1
 lda y_plr
 asl @
 clc
 adc #16
 ldy #adr1
 jsr inad
 lda adr1
 sta adr2
 lda adr1+1
 clc
 adc #1
 sta adr2+1

ove_1    equ *

 lda 20
 cmp 20
 beq *-2

 ldy #31

ove_2    equ *

 lda rnd
 and #7
 tax
 lda ora_tab,x
 sta help
 eor #255
 and (adr1),y
 sta (adr1),y
 lda help
 eor #255
 and (adr2),y
 sta (adr2),y
 lda help
 and spritf+2016,y
 ora (adr1),y
 sta (adr1),y
 lda help
 and spritf+992,y
 ora (adr2),y
 sta (adr2),y
 dey
 bpl ove_2

 ldy #31

ove_3    equ *

 lda (adr1),y
 cmp spritf+2016,y
 bne ove_1
 lda (adr2),y
 cmp spritf+992,y
 bne ove_1
 dey
 bpl ove_3

 lda 20
 clc
 adc #75
 cmp 20
 bne *-2

 lda col_plr
 sta 704
 lda col_plr+1
 sta 705

 lda lives
 beq game_ovr
 lda #0
 ldy #31
 sta (adr1),y
 sta (adr2),y
 dey
 bpl *-5
 sed
 lda lives
 sec
 sbc #$01
 sta lives
 cld
 lda #80
 sta liv_tim

ove_end  equ *

 jmp loop

game_ovr equ *

 jsr zapis
 jmp zaslon

boom     equ *

 ldx inivar+1

boo_1    equ *

 dex
 bmi boo_2
 lda duk_dir,x
 cmp #16
 bcs boo_1

 lda spxpo,x
 sec
 sbc x_plr
 beq boo_1
 bmi boo_1
 cmp #16
 bcs boo_1
 lda y_plr
 asl @
 sta help
 lda spypo,x
 sec
 sbc help
 beq boo_1
 bmi boo_1
 cmp #32
 bcs boo_1

 lda #255
 sta death
 jmp boo_1

boo_2    equ *

 lda act_fir
 beq boo_4
 ldx inivar+1

boo_3    equ *

 dex
 bmi boo_4
 lda spxpo,x
 sec
 sbc x_poc
 beq boo_3
 bmi boo_3
 cmp #16
 bcs boo_3
 lda y_poc
 asl @
 sta help
 lda spypo,x
 sec
 sbc help
 beq boo_3
 bmi boo_3
 cmp #32
 bcs boo_3

 lda revund,x
 and #2
 bne boo_3
 lda duk_dir,x
 cmp #16
 bcs boo_3
 lda duk_dir,x
 clc
 adc #16
 sta duk_dir,x
 lda #0
 sta shape,x
 lda tak_duk,x
 tay
 jsr bierz_go
 jsr clr_fir
 lda #$60
 jsr inc_sco
 jmp boo_3

boo_4    equ *

 ldx #3

boo_5    equ *

 lda take_tab,x
 and #254
 ldy #14
 cmp killers,y
 beq boo_6
 dey
 bpl *-6
 dex
 bpl boo_5
 rts

boo_6    equ *

 lda $d004
 ora $d005
 and #%100
 beq *+7
 lda #255
 sta death
 rts

counters equ *

 lda sparks
 ldy #1
 jsr shw_dgt
 lda bombs
 ldy #4
 jsr shw_dgt
 lda discs
 ldy #7
 jsr shw_dgt
 lda lives
 ldy #10
 jsr shw_dgt
 lda score+2
 ldy #13
 jsr shw_dgt
 lda score+1
 ldy #15
 jsr shw_dgt
 ldy #17
 lda score

shw_dgt  equ *

 pha
 lsr @
 lsr @
 lsr @
 lsr @
 jsr shw_cph
 pla

shw_cph  equ *

 and #$0f
 asl @
 clc
 adc #96
 sta info+96,y
 ora #1
 sta info+128,y
 iny
 rts

fire     equ *

 lda 764
 cmp #33
 bne *+5
 jsr put_bomb

 lda act_fir
 beq *+5
 jmp ognia
 lda strig0
 beq *+3
 rts

 lda sparks
 bne *+3
 rts

 lda music
 beq fir_1
 lda #$20
 ldx #100
 ldy #17
 jsr zagraj+3

fir_1    equ *

 sed
 lda sparks
 sbc #$01
 sta sparks
 cld

 lda dir_plr
 cmp #12
 bne norgfi
 lda #2
 sta zxfir
 lda #0
 sta zyfir

norgfi   equ *

 lda dir_plr
 cmp #8
 bne nolffi
 lda #254
 sta zxfir
 lda #0
 sta zyfir

nolffi   equ *

 lda dir_plr
 cmp #4
 bne nodwfi
 lda #0
 sta zxfir
 lda #2
 sta zyfir

nodwfi   equ *

 lda dir_plr
 cmp #0
 bne noupfi
 lda #0
 sta zxfir
 lda #254
 sta zyfir

noupfi   equ *

 lda x_plr
 sta x_poc
 lda y_plr
 sta y_poc
 lda #0
 sta poc_faz
 lda #255
 sta act_fir
 rts

ognia    equ *

 ldy lypoc
 ldx #15
 lda #0
 sta pmbase+$600,y
 sta pmbase+$700,y
 iny
 dex
 bpl *-8

 lda poc_faz
 and #7
 asl @
 asl @
 asl @
 asl @
 clc
 adc <spritf
 sta adr1
 sta adr2
 lda #1
 adc >spritf
 sta adr1+1
 adc #4
 sta adr2+1

 lda y_poc
 asl @
 clc
 adc #24
 sta lypoc
 tax
 ldy #0

ogn_1    equ *

 lda (adr2),y
 sta pmbase+$600,x
 lda (adr1),y
 sta pmbase+$700,x
 inx
 iny
 cpy #16
 bcc ogn_1

 lda x_poc
 clc
 adc #64
 sta $d002
 sta $d003

 jsr chk_poc

nochfir  equ *

 inc poc_faz
 lda x_poc
 clc
 adc zxfir
 sta x_poc
 lda y_poc
 clc
 adc zyfir
 sta y_poc
 lda x_poc
 cmp #121
 bcc *+5
 jmp clr_fir
 lda y_poc
 cmp #57
 bcc *+5
 jmp clr_fir
 rts

chk_poc  equ *

 ldy #3

chp_1    equ *

 sty rejy
 lda x_poc
 clc
 adc chk_x_ad+8,y
 tax
 lda y_poc
 clc
 adc chk_y_ad+8,y
 tay
 jsr ob_pl_ad
 lda screen,y
 ldy rejy
 sta ch_po_tb,y
 and #254
 ldx #5
 cmp blckrs,x
 beq clr_fir
 dex
 bpl *-6
 dey
 bpl chp_1

 ldx x_poc
 ldy y_poc
 jsr ob_pl_ad
 lda screen,y
 cmp #$58
 beq *+3
 rts
 jsr zabierz
 lda #$5a
 jsr shw_blck

clr_fir  equ *

 lda #0
 sta $d002
 sta $d003
 sta zxfir
 sta zyfir
 sta act_fir
 rts

put_bomb equ *

 lda steps
 bmi *+3
 rts
 lda #255
 sta 764
 lda bombs
 bne *+3
 rts

 ldx x_plr
 ldy y_plr
 jsr ob_pl_ad
 lda screen,y
 beq *+3
 rts

 sed
 lda bombs
 sec
 sbc #$01
 sta bombs
 cld
 lda #$40
 jsr shw_blck
 lda music
 bne *+3
 rts

 lda #$22
 ldx #50
 ldy #5
 jmp zagraj+3

take     equ *

 lda steps
 bmi *+3
 rts

 ldx x_plr
 ldy y_plr
 jsr ob_pl_ad
 lda screen,y
 cmp #$06
 bcc *+6
 cmp #$24
 bcc *+3
 rts

 and #254
 sec
 sbc #$06
 pha
 tax
 lda take_jmp,x
 sta jmp_take
 lda take_jmp+1,x
 sta jmp_take+1
 jsr zabierz
 pla

jmp_take equ *+1

 jsr digt_tak
 lda music
 bne *+3
 rts
 ldx #100
 ldy #18
 lda #$21
 jmp zagraj+3

digt_tak equ *

 pha
 ldy #0

di_1_ta  equ *

 lda info+52,y
 cmp #126
 beq di_2_ta
 iny
 cpy #11
 bcc di_1_ta

di_2_ta  equ *

 pla
 clc
 adc #96
 cmp (zadad),y
 beq di_3_ta
 pha
 ldx x_plr
 ldy y_plr
 jsr ob_pl_ad
 pla
 sec
 sbc #90
 sta screen,y
 ora #1
 sta screen+1,y
 dec ile_get
 pla
 pla
 rts

di_3_ta  equ *

 sta info+52,y
 ora #1
 sta info+84,y
 lda #$75
 jmp inc_sco

boom_tak equ *

 sed
 lda bombs
 clc
 adc #$01
 sta bombs
 cld
 lda #$25
 jmp inc_sco

spar_tak equ *

 sed
 lda sparks
 clc
 adc #$06
 sta sparks
 cld
 lda #$20
 jmp inc_sco

disc_tak equ *

 sed
 lda discs
 clc
 adc #$01
 sta discs
 cld
 lda #$30
 jmp inc_sco

live_tak equ *

 sed
 lda lives
 cmp #$99
 beq lita_1
 clc
 adc #$01
 sta lives

lita_1   equ *

 cld
 lda #$50
 jmp inc_sco

inc_sco  equ *

 sed
 clc
 adc score
 sta score
 lda #$00
 adc score+1
 sta score+1
 lda #$00
 adc score+2
 sta score+2
 cld
 rts

player   equ *

 jsr chk_plr
 lda steps
 bpl no_move
 lda #0
 sta steps
 lda jstick0
 sta joy
 cmp #15
 beq no_move
 cmp #6
 beq no_move
 cmp #5
 beq no_move
 cmp #9
 beq no_move
 cmp #10
 beq no_move
 lda #7
 sta steps

no_move  equ *

 lda joy
 cmp #7
 bne no_rg_pl
 lda #12
 sta dir_plr
 inc x_plr
 lda x_plr
 cmp #121
 bcc no_gr_pl
 lda #0
 sta x_plr
 ldx xcav
 inx
 ldy ycav
 jsr nextcav
 bcc *+10
 lda #120
 sta x_plr
 dec xcav
 lda #0
 sta steps
 jmp no_rg_pl

no_gr_pl equ *

 ldx #3
 ldy #0
 jsr chk_blk
 bcc no_rg_pl
 dec x_plr

no_rg_pl equ *

 lda joy
 cmp #11
 bne no_lf_pl
 lda #8
 sta dir_plr
 dec x_plr
 bpl no_fl_pl
 lda #120
 sta x_plr
 ldx xcav
 dex
 ldy ycav
 jsr nextcav
 bcc *+10
 lda #0
 sta x_plr
 inc xcav
 lda #0
 sta steps
 jmp no_lf_pl

no_fl_pl equ *

 ldx #2
 ldy #2
 jsr chk_blk
 bcc no_lf_pl
 inc x_plr

no_lf_pl equ *

 lda joy
 cmp #13
 bne no_dw_pl
 lda #4
 sta dir_plr
 inc y_plr
 lda y_plr
 cmp #57
 bcc no_wd_pl
 lda #0
 sta y_plr
 ldx xcav
 ldy ycav
 iny
 jsr nextcav
 bcc *+10
 lda #56
 sta y_plr
 dec ycav
 lda #0
 sta steps
 jmp no_dw_pl

no_wd_pl equ *

 ldx #6
 ldy #4
 jsr chk_blk
 bcc no_dw_pl
 dec y_plr

no_dw_pl equ *

 lda joy
 cmp #14
 bne no_up_pl
 lda #0
 sta dir_plr
 lda y_plr
 dec y_plr
 bpl no_pu_pl
 lda #56
 sta y_plr
 ldx xcav
 ldy ycav
 dey
 jsr nextcav
 bcc *+10
 lda #0
 sta y_plr
 inc ycav
 lda #0
 sta steps
 jmp no_up_pl

no_pu_pl equ *

 ldx #0
 ldy #6
 jsr chk_blk
 bcc no_up_pl
 inc y_plr

no_up_pl equ *

 lda steps
 cmp #7
 bne nouppl
 lda music
 beq nouppl
 lda #$22
 ldx #150
 ldy #23
 jsr zagraj+3

nouppl   equ *

 dec steps

show_plr equ *

 ldy lyplr
 ldx #15
 lda #0
 sta pmbase+$400,y
 sta pmbase+$500,y
 iny
 dex
 bpl *-8

 lda #0
 sta adr1+1
 lda steps
 and #7
 lsr @
 clc
 adc dir_plr
 asl @
 rol adr1+1
 asl @
 rol adr1+1
 asl @
 rol adr1+1
 asl @
 rol adr1+1
 sta adr1
 sta adr2
 lda adr1+1
 clc
 adc >spritf
 sta adr1+1
 adc #4
 sta adr2+1

 lda y_plr
 asl @
 clc
 adc #24
 sta lyplr
 tax
 ldy #0

sh_1_plr equ *

 lda (adr1),y
 sta pmbase+$500,x
 lda (adr2),y
 sta pmbase+$400,x
 inx
 iny
 cpy #16
 bcc sh_1_plr

 lda x_plr
 clc
 adc #64
 sta $d000
 sta $d001
 rts


