col_tab  equ *

 dta b($22),b($d4)
 dta b($0a),b($de)
 dta b($70)

col_plr  equ *

 dta b($74),b($88)
 dta b($c6),b($da)

tit_col  equ *

 dta b($54),b($26),b($0a),b($72),b($a0)

doz_key  equ *

 dta c' 012345678'
 dta c'9ABCDEFGHI'
 dta c'JKLMNOPQRS'
 dta c'TUVWXYZ'

addx_tab equ *

 dta b(0),b(8),b(8),b(8)
 dta b(0),b(255),b(255),b(255)

addy_tab equ *

 dta b(255),b(255),b(0),b(16)
 dta b(16),b(16),b(255),b(255)

mov_faz  equ *

 dta b(%0100),b(%1000)
 dta b(%0001),b(%0010)

block_tb equ *

 dta d'"$BDFH'

inivar   equ *

 dta h(spritf)
 dta b(spmax),b(spbegn)
 dta b(scwidth),b(scheigth)
 dta b(linedistance)
 dta a(dl1),a(dl2)
 dta h(s1),h(s2)
 dta h(magf1),h(magf2)

ekran    dta h(s1),h(s2)

anim_tab equ *

 dta d'DFHJLNPRTVXZ\',B($40),B($42)
 dta B($44),B($46),B($48),B($4A),B($4C),B($4E),B($50),B($52),B($54),B($56),B($5A),B($5C),B($5E),d'`'

jump_tab equ *

 dta a(kran)

 dta a(dzi_p)
 dta a(dzi_l)

 dta a(next)
 dta a(kropi)

 dta a(speed2)
 dta a(speed2)
 dta a(speed2)
 dta a(space)

 dta a(szppw)
 dta a(szppm)
 dta a(szplw)
 dta a(szplm)

 dta a(speed4)
 dta a(speed4)
 dta a(speed4)
 dta a(bomba)

 dta a(speed2)
 dta a(speed2)
 dta a(speed2)
 dta a(speed2)
 dta a(speed2)
 dta a(speed2)
 dta a(speed2)
 dta a(space)

 dta a(speed3)
 dta a(speed3)
 dta a(speed3)
 dta a(jajco)

bomb_tb  equ *

 dta d' $&(*,.02468:<>@',B($58),B($5A),B($5C),B($5E),d'`'

losy     equ *

 dta d'"$:<>@FH',B($40),B($48),B($58),d'"$:<>'

hiscores equ *

 dta b($00),b($99),b($99),B($A4),B($A5),B($80),B($AA),B($A5),B($B4),d'    '
 dta b($00),b($99),b($98),B($A5),B($AC),B($A1),d'       '
 dta b($00),b($30),b($00),B($A2),B($A1),B($B2),B($AF),B($AE),d'     '
 dta b($00),b($20),b($00),B($A2),B($A1),B($B2),B($B4),B($A5),B($AB),d'    '
 dta b($00),b($10),b($00),B($A7),B($B5),B($A3),B($A9),B($AF),d'     '
 dta b($00),b($00),b($90),d'@@@@@@@@@@'
 dta b($00),b($00),b($80),B($A4),B($A9),B($A7),B($A9),B($80),B($A4),B($B5),B($A3),B($AB),d' '
 dta b($00),b($00),b($70),d'@@@@@@@@@@'
 dta b($00),b($00),b($60),B($B4),B($A8),B($A5),B($80),B($AA),B($A5),B($B4),d'   '
 dta b($00),b($00),b($50),B($A1),B($A3),B($B4),B($A9),B($AF),B($AE),d'    '
 dta b($00),b($00),b($40),d'@@@@@@@@@@'
 dta b($00),b($00),b($30),B($A8),B($A1),B($AE),B($B3),B($80),B($AB),B($AC),B($AF),B($B3),B($B3)
 dta b($00),b($00),b($20),d'@@@@@@@@@@'
 dta b($00),b($00),b($10),d'@@@@@@@@@@'

chk_x_ad equ *

 dta b(0),b(7),b(255),b(8)
 dta b(255),b(8),b(0),b(7)
 dta b(0),b(7),b(0),b(7)

chk_y_ad equ *

 dta b(255),b(255),b(0),b(0)
 dta b(7),b(7),b(8),b(8)
 dta b(0),b(0),b(7),b(7)

blckrs   equ *

 dta d'"$BDFH'

killers  equ *

 dta d'JLVXZ\^',B($48),B($4A),B($4C),B($4E),B($50),B($52),B($54),B($56)

posaddis equ *

 dta a(rg_disc)
 dta a(lf_disc)
 dta a(dw_disc)
 dta a(up_disc)

take_jmp equ *

 dta a(digt_tak)
 dta a(digt_tak)
 dta a(digt_tak)
 dta a(digt_tak)
 dta a(digt_tak)
 dta a(digt_tak)
 dta a(digt_tak)
 dta a(digt_tak)
 dta a(digt_tak)
 dta a(digt_tak)
 dta a(boom_tak)
 dta a(spar_tak)
 dta a(disc_tak)
 dta a(live_tak)

ora_tab  equ *

 dta b(1),b(2),b(4),b(8)
 dta b(16),b(32),b(64),b(128)

cav_tab  equ *

 dta b($00)
 dta b($04)
 dta b($08)
 dta b($0c)
 dta b($40)
 dta b($44)
 dta b($48)
 dta b($4c)

plrx_tb  equ *

 dta b(8)
 dta b(8)
 dta b(8)
 dta b(8)
 dta b(8)
 dta b(8)
 dta b(8)
 dta b(8)

plry_tb  equ *

 dta b(8)
 dta b(8)
 dta b(8)
 dta b(8)
 dta b(8)
 dta b(8)
 dta b(8)
 dta b(8)

rownania equ *

 dta d'pxdvnxftj|`'
*      8*2-7*3+5=0

 dta d'dtfthtjvl|p'
*      2+3+4+5-6=8

 dta d'rxpzhvnvl|j'
*      9*8:4-7-6=5

 dta d' hxhvhvh|h '
*       4*4-4-4=4

 dta d'nvbvhxftp|d'
*      7-1-4*3+8=2

 dta d'ntlvpxdtf|`'
*      7+6-8*2+3=0

 dta d'rzdtnzdvj|f'
*      9:2+7:2-5=3

 dta d'fzdtrvjzd|p'
*      3:2+9-5:2|8

 org $6000

ch_po_tb org *+4
dirduck  org *+5
movduck  org *+5
spxduck  org *+5
spyduck  org *+5
blck_tab org *+8
take_tab org *+4
move     org *+5
shape    org *+5
direct   org *+5
mov_tim  org *+5
chr_tb   org *+8
duk_dir  org *+5
tak_duk  org *+5
buffer   org *+3
zebrane  org *+128
pozycja  org *+128
bit_map  org *+256
info     equ *

 dta B($51),B($4D),B($4D),B($57),B($4D),B($4D),B($57),B($4D),B($4D),B($57),B($4D),B($4D),B($57),B($4D),B($4D),B($4D),B($4D),B($4D),B($4D),B($57),B($4D),B($4D),B($4D),B($4D),B($4D),B($4D),B($4D),B($4D),B($4D),B($4D),B($4D),B($45)
 dta B($56),d'!"',B($40),d'[\',B($40),d':;',B($40),B($5B),B($5C),B($40),d'  ',B($52),B($53),d'  ',B($40),d'           ',B($42)
 dta B($56),d' #',B($40),d']^',B($40),d'<=',B($40),B($5D),B($5E),B($40),d'  ',B($54),B($55),d'  ',B($40),d'           ',B($42)
 dta B($56),d'``',B($40),d'``',B($40),d'``',B($40),d'``',B($40),d'``````',B($40),B($84),B($85),B($86),B($87),B($88),B($89),B($8A),B($8B),B($8C),B($8D),B($8E),B($42)
 dta B($56),d'aa',B($40),d'aa',B($40),d'aa',B($40),d'aa',B($40),d'aaaaaa',B($40),B($C1),B($C4),B($C6),B($C7),B($C8),B($C9),B($CA),B($CB),B($CC),B($CF),B($D0),B($42)
 dta B($5A),B($4E),B($4E),B($58),B($4E),B($4E),B($58),B($4E),B($4E),B($58),B($4E),B($4E),B($58),B($4E),B($4E),B($4E),B($4E),B($4E),B($4E),B($58),B($4E),B($4E),B($4E),B($4E),B($4E),B($4E),B($4E),B($4E),B($4E),B($4E),B($4E),B($43)

levscr   equ *

 dta d'    Niech gra si= rozpocznie!   '

hiscoscr equ *

 dta d'   ',B($5B),B($5C),d'    BLAZE OF GLORY    ',B($52),B($53),d'   '
 dta d'   ',B($5D),B($5E),d'   @@@@@@@@@@@@@@@@   ',B($54),B($55),d'   '

tit_scr  equ *

 dta d'          ',B($40),B($41),B($42),B($43),d' ',B($44),B($45),B($46),B($47),B($48),B($49),B($4B),d'          '
 dta d'          ',B($4C),B($4D),B($4E),B($4F),d' ',B($50),B($51),B($52),B($53),B($54),B($55),B($56),d'          '
 dta d'       Program i grafika:       '
 dta d'         ',B($58),B($5B),B($5D),B($5F),d'#%'' )*,/',B($5B),d'          '
 dta d'         ',B($59),B($5C),B($5E),d'"$&( (+-`',B($5C),d'          '
 dta d'            Muzyka:             '
 dta d'        BARTOSZ GA',B($5A),B($57),d'ZKA         '
 dta d'      @| 1992 L.K. AVALON       '
 dta d'   Dzi=ki dla A.GODAWSKIEGO za  '
 dta d'  plansze do gry i dla S.MICHNY '
 dta d'      za plansz= tytu>ow;.      '

dl1  equ *
 dta B($F0),d'p'
 dta b(p),a(s1+$00),b(p),a(s1+$00)
 dta b(p),a(s1+$20),b(p),a(s1+$20)
 dta b(p),a(s1+$40),b(p),a(s1+$40)
 dta b(p),a(s1+$60),b(p),a(s1+$60)
 dta b(p),a(s1+$80),b(p),a(s1+$80)
 dta b(p),a(s1+$a0),b(p),a(s1+$a0)
 dta b(p),a(s1+$c0),b(p),a(s1+$c0)
 dta b(p),a(s1+$e0),b(p),a(s1+$e0)
 dta b($44),a(info),d'$$$$$'
 dta b($41),a(dl1)

dl2  equ *
 dta B($F0),d'p'
 dta b(p),a(s2+$00),b(p),a(s2+$00)
 dta b(p),a(s2+$20),b(p),a(s2+$20)
 dta b(p),a(s2+$40),b(p),a(s2+$40)
 dta b(p),a(s2+$60),b(p),a(s2+$60)
 dta b(p),a(s2+$80),b(p),a(s2+$80)
 dta b(p),a(s2+$a0),b(p),a(s2+$a0)
 dta b(p),a(s2+$c0),b(p),a(s2+$c0)
 dta b(p),a(s2+$e0),b(p),a(s2+$e0)
 dta b($44),a(info),d'$$$$$'
 dta b($41),a(dl2)

levdl    equ *

 dta d'pppppppppp'
 dta b($42),a(levscr)
 dta b($41),a(levdl)

scodl    equ *

 dta d'ppp'
 dta b($44),a(hiscoscr),d'$p'
 dta b($44),a(screen+$00)
 dta b($44),a(screen+$20)
 dta b($44),a(screen+$40)
 dta b($44),a(screen+$60)
 dta b($44),a(screen+$80)
 dta b($44),a(screen+$a0)
 dta b($44),a(screen+$c0)
 dta b($44),a(screen+$e0)
 dta b($44),a(screen+$100)
 dta b($44),a(screen+$120)
 dta b($44),a(screen+$140)
 dta b($44),a(screen+$160)
 dta b($44),a(screen+$180)
 dta b($44),a(screen+$1a0)
 dta b($41),a(scodl)

titdl    equ *

 dta d'p',B($F0)
 dta b($c4),a(monitor+$00)
 dta b($c4),a(monitor+$00)
 dta b($c4),a(monitor+$20)
 dta b($c4),a(monitor+$20)
 dta b($c4),a(monitor+$40)
 dta b($c4),a(monitor+$40)
 dta b($c4),a(monitor+$60)
 dta b($c4),a(monitor+$60)
 dta b($c4),a(monitor+$80)
 dta b($c4),a(monitor+$80)
 dta b($c4),a(monitor+$a0)
 dta b($c4),a(monitor+$a0)
 dta b($c4),a(monitor+$c0)
 dta b($c4),a(monitor+$c0)
 dta b($44),a(tit_scr)
 dta d'$@" """"@"P"""'
 dta b($41),a(titdl)

monitor  equ $7800
screen   equ $7900



