* fred       1.0   *

 opt h+

 icl 'd1/COMMON.ASM'

 org fred

 jmp strtfred
 jmp r
 jmp dsfred
 jmp toxy
 jmp sa
 jmp get2cav

*- jump table

test   jmp begn+3
xytoad jmp begn+6
gete   jmp begn+9
pute   jmp begn+12
zni2d  jmp begn+27
swyb   jmp begn+30
okfaz  jmp begn+33

fire   jmp ciski+6
levbeg jmp ciski+15
putit  jmp ciski+18
setmig jmp ciski+21
getit  jmp ciski+24
tstit  jmp ciski+27
bonus  jmp ciski+30
inscor jmp ciski+33

*********************

strtfred equ *

 bit demo
 bpl *+5
 jmp erght

 lda fmfl
 bne *+5
 jsr insyl

*- test move enable
* fmfl 11000001
*      ||     └ jump
*      |└────── on line
*      └─────── fall
tmen equ *

 lda deadfl
 beq *+5
 jmp dfred

 lda fmfl
 beq tj
 bmi ffl
 asl @
 bmi tj
 jsr jump
 jmp dfred
ffl equ *
 jsr fall
 jmp dfred

*- test joystick
tj   equ *

 lda stck
 and stck+1
 and stck+2
 and stck+3

*- call move procedures
 ldx #8
 cmp joyval,x
 beq *+6
 dex
 bpl *-6
r    rts

 tay
 lda fmfl  ;na linie wiew 3
 asl @
 bmi norg
 tya

*- turn fred (set wiew)
 sta tmp
 lsr @
 bcs *+6
*- up pressed
 ldy #0
 sty tmp

 lsr @
 lsr @
 bcs nolf
*- joy left
 ldy #2
 sty wiew

nolf lsr @
 bcs norg
*- joy right
 ldy #1
 sty wiew

norg txa          ;bez ruchu
 bne *+4      ;sylwetka stojaca
 sta sylnum

 asl @
 tax
 lda moveproc,x
 sta jmp+1
 lda moveproc+1,x
 sta jmp+2
jmp  jsr jmp

dfred equ *

 lda ptrg
 and ptrg+1

 bne nofire

 ldy >$d300     ;•
 sty hlp2+1     ;•
 ldy <$d300     ;•
 sty hlp2       ;•
 lda (hlp2),y   ;•
 sta bomb       ;•
 beq jook       ;•
 iny            ;•
 iny            ;•
 lda #$38       ;•
 sta (hlp2),y   ;•
 tya            ;•
 tax            ;•
 dey            ;•
 dey            ;•
 lda (hlp2),y   ;•
 sta bomb       ;•
 txa            ;•
 tay            ;•
 lda #$3c       ;•
 sta (hlp2),y   ;•
jook equ *      ;•

 jsr fire

nofire equ *
 lda ptrg
 and ptrg+1
 sta firdel

 lda wiew
 asl @
 asl @  *16
 asl @
 asl @  clc
 asl @

 sta tmp
 lda sylnum
 asl @
 adc tmp
 sta defnum

*- test ground under fred
 lda fmfl
 bne notst  ;if jump or fall no test
 lda #$80
 sta jfco   ;big fall
 lda #0
 sta jdir   ;only down
 jmp fall

notst rts

* CC if space free
ftd  equ *

 lda fpy
 and #$0f
 beq cftd

 lda #24   ;lapaj line
 jsr ftdu
 clc
 rts

cftd equ *
 lda fpy
 bpl cft1
 cmp #142
 bcc nob
 cmp #$e0
 bcs nob

 lda bulfl
 bpl nob
 inc bulfl

nob equ *
 clc
 rts

cft1 equ *
 lda #$ff
 sta bulfl
 lda #0
 jsr ftdu
 php
 cpy #$2d
 bne *+5
 jsr zni2d
 plp
r01  rts

*- test char up fred
ftu  lda #23
 jmp ftdu

*- test char left fred
ftl  lda #1
 jmp ftrl

ftr  lda #6
 jmp ftrl

*--------------------
ftdu equ *
 sta fthlp

 ldx #2     ;right legg
 ldy fthlp  ;down fred
 jsr toxy
 jsr test
 sty fxytst

 bmi ch2l
 jsr titem
 bcs r01

ch2l ldx #5     ;left legg
 ldy fthlp
 jsr toxy
 jsr test
 bpl *+4
 clc
 rts
 cpy #$1e   ;lina
 beq line
 cpy #$0c
 beq line
 cpy #$0d
 beq line
* jmp titem

titem equ *
 cmp #5
 beq capsule
 cmp #7
 beq *+5
 cpy #$20
 rts

 jsr gete

 ldx bonitc
 cpx #4
 bcs *+4
 inc bonitc

 lda itm_
 asl @
 tax
 lda itproc,x
 sta jit+1
 lda itproc+1,x
 sta jit+2
jit  equ *
 jsr *
 lda #$80
 sta itm_
 clc
 rts

capsule equ *
 jsr gete
 lda #1
 jsr sound

 ldx bonitc
 cpx #4
 bcs *+4
 inc bonitc

 lda #1
 jsr inscor

 ldx kamco
 cpx #rockv
 bcs full
 inx
 stx kamco
 rts
full equ *
 lda #rocka
 jsr putit
 bcc *+3
 rts
 lda #1
 sta kamco
 rts

*- fred na linie
line equ *
 cpy fxytst
 bne cr
 lda fxreal
 and #%00000111
 cmp #%00000110
 bne cr

 lda #$40
 sta fmfl
 lda #3
 sta wiew
 lda #$39
 jsr sound
cr   clc
 rts

ftrl equ *
 sta fthlp

 ldy #1
 ldx fthlp
 jsr toxy
 jsr test
 jsr titi
 bcs rxx

ch3l ldy #16
 ldx fthlp
 jsr toxy
 jsr test
 jsr titi
 bcs rxx

ch4l ldy #28
 ldx fthlp
 jsr toxy
 jsr test
 jmp titi

titi bmi cr
 jmp titem


itproc equ *
 dta a(copka),a(spray),a(rock)
 dta a(tnt),a(kaktus),a(unvi)
 dta a(buty),a(0),a(extralife)

extralife  equ *
 inc zycia
 lda #$0d
 jmp sound

copka equ *
 lda #$5
 jsr sound
 lda #2
 jsr inscor
 lda #cpka
 jsr putit
 bcs rxx
 lda copkco
 bne rxx
 lda #cpkval
 sta copkco
rxx  equ *
 rts

tnt   equ *
 lda #2
 cmp vcou
 bne *-3
 lda #$0e
 sta $d01a

 lda #$80
 sta tntfl
 lda #0
 jsr sound

 lda #10
 jmp inscor

rock  equ *
 lda #$2
 jsr sound
 lda #2
 jsr inscor
 lda kamco
 beq *+9
 lda #rocka
 jsr putit
 bcc rxx
 lda #rockv
 sta kamco
 rts

spray equ *
 lda #$8
 jsr sound
 lda #3
 jsr inscor
 lda spraco
 beq tobotl
 lda #spra
 jsr putit
 bcc rxx

tobotl equ *
 lda #40
 sta spraco
 lda leci
 bmi *+3
 rts
 lda #1
 sta bron
 rts


kaktus equ *
 lda #$50
 jsr inscor
 lda #$4
 jmp sound

unvi equ *

 ldx #$80
 lda $380,x
 cmp $500,x
 bne nolod
 inx
 bne *-9
 lda #0
 beq *+5
nolod equ *
 lda rnd
 sta bomhk

 lda #$6
 jsr sound
 lda #2
 jsr inscor
 lda #unv
 jsr putit
 bcc *+3
 rts
 lda #unvval
 ldy unvico
 bne *+4
 sta unvico
 rts

buty equ *
 lda #7
 jsr sound
 lda #2
 jsr inscor
 lda #but
 jsr putit
 bcc *+3
 rts
 lda #butv
 ldy butco
 bne *+4
 sta butco
 rts

*- fred position to XY
toxy equ *
 stx x
 sty y
 sec
 lda fpx
 adc x
 sbc hsc
 sta fxreal
 lsr @
 lsr @
 lsr @
 clc
 adc scrnum
 sta x
 sec
 lda fpy
 sbc y
 bpl *+4
 lda #0
 lsr @
 lsr @
 lsr @
 lsr @
 and #$7
 sta y
r1   rts

left equ *

 lda fmfl
 asl @
 bmi r1

tfl  jsr ftl
 bcs r1

 ldx fpx
 cpx #48
 bcc *+5
 dec fpx
 rts
 jmp eleft

rght equ *
 lda fmfl
 asl @
 bmi r1

tfr  jsr ftr
 bcs r1
 ldx fpx
 cpx #104
 bcs *+5
 inc fpx
r4   rts
 jmp erght

*-- down fred
dn   equ *
 lda fmfl
 asl @
 bmi dn0

 lda #0
 sta sylnum
 rts

dn0 equ *
 lda bomb
 bmi joko

 lda #ver
 beq joko

 lda #$80
 sta upspd
 sta upspd+1

joko equ *
 lda #$80
 sta fmfl
 lda #0
 jsr ftdu
 cpy #$20
 beq grunt
 jsr ftd
 bcs noli

 lda fmfl
 asl @
 bmi cdn

noli equ *
 lda #$80
 sta jfco
 sta fmfl
 lda #0
 sta jdir
 sta sylnum
 lda #1
 sta wiew
 jmp fall

cdn equ *
 inc fpy
 inc fpy

 ldx sylnum
 cpx #8
 bcs *+4
 ldx #7
 inx
 cpx #16
 bcc *+4
 ldx #8
 stx sylnum
 rts

grunt equ *
 ldx #0
 stx fmfl
 stx sylnum
 inx
 stx wiew
 dec fpy
 rts

fall equ *
 lda bulfl
 bmi *+3
 rts
 jsr ftd
 bcc cofl
efl  lda fmfl
 asl @
 bmi *+6
 lda #$0   ;no fall
 sta fmfl  ;joy test ok
r5   rts

cofl equ *

 lda butco
 beq cof1

 lda fpy
 bpl cof1
 cmp #152 ;>>128
 bcs cof1
 lda #128
 sta fpy

 ldx butco
 dex
 stx butco
 beq tstnxbut
 cpx #15
 bne efl
*- mig butem
 lda #but
 jsr setmig
 jmp efl

tstnxbut equ *
 lda #but
 jsr getit
 bcs cof1
 lda #but
 jsr tstit
 bcs cof1
 lda #butv
 sta butco
 bne efl  ;jmp

cof1 equ *
 lda fmfl
 asl @
 bmi efl

 lda #$80  ;fall
 sta fmfl  ;no joy test

 ldx jfco  ;80 to fall bez skoku
 cpx #$80
 bne fcon
 ldx #9
 inx       ;search first fall size
 lda upspd,x
 bpl *-4
 inx
 stx jfco

fcon equ *

*- set sylwetke
 jsr sesjf

 lda upspd,x
 sta jfh
fll  inc fpy

 jsr ftd
 bcs efl
 dec jfh
 bpl fll

 inc jfco

 lda jdir
 beq r5
 bmi *+5
 jmp rght
 jmp left

*- jump right
jr   lda #1
 sta jdir
 lda fmfl
 asl @
 bpl jp
 lda #1
 bne swc

*- jump left
jl   lda #$ff
 sta jdir
 lda fmfl
 asl @
 bpl jp
 lda #2
swc  pha
 jsr ftu
 cpy #$20
 bne swc1
 lda #%01000000
 sta fmfl
 pla
 rts

swc1 equ *
 pla
 sta wiew
 bne jp

*- jump up
ju   equ *

 lda fmfl
 asl @
 bpl coju
*- fred up on line

 jsr ftu
 bcc *+3
 rts
 dec fpy
 jsr ftu
 bcs *+4
 dec fpy

insyl equ *
 ldx sylnum
 cpx #7
 inx
 bcc *+4
 ldx #0
 stx sylnum
 rts

coju equ *
 lda #0
 sta jdir
jp   lda #1
 sta fmfl

 ldx #0
 stx jfco
 rts

jump equ *

 lda jdir
 beq cj
 bmi *+8
 jsr rght
 jmp cj
 jsr left

cj equ *

  ldx jfco

*- set sylwetke
 jsr sesjf

 ldy upspd,x
 bmi eup
 sty jfh
jupl dec fpy
 jsr ftu
 bcs eup
 dec jfh
 bpl jupl
 inc jfco
 rts

eup  equ *
 ldx #$80
 stx jfco
 lda fmfl
 asl @
 bmi *+4
 stx fmfl
 rts

*- set sylwetke in jump & fall
sesjf equ *
 txa
 cmp #8
 bcc *+4
 lda #6       ;sec
 adc #8
 sta sylnum
r8   rts

dspf equ *   ;disp half freda
 ldy #0
cppl lda (tmp),y
 sta plrdef,x
 lda (hlp),y
 sta plrdef+$100,x
 inx
 iny
 cpy #16
 bne cppl
 rts

sa equ *
 ldx #0
 stx tmp+1
 asl @
 rol tmp+1
 asl @
 rol tmp+1
 asl @
 rol tmp+1
 asl @
 rol tmp+1 ;clc
 adc <plfnt
 sta tmp
 sta hlp
 lda tmp+1
 adc >plfnt
 sta tmp+1
 clc
 lda tmp+1
 adc >$400
 sta hlp+1
 rts

*- clear old shape
dsfred equ *

 lda bulfl
 bmi tded

 bne *+7
 lda #3
 jsr sound

 jsr clfred

 ldx #130
 ldy #15
 lda #0
clrb sta plrdef,x
 sta plrdef+$100,x
 inx
 dey
 bpl clrb

 ldx bulfl
 lda bfaz,x
 inx
 stx bulfl

 cpx #8
 bcs tsgdzie
 jsr sa
 ldx #130
 jmp dspf

tsgdzie equ *
 jsr bonus
 bcs qdb
 inc zycia
 jmp qdb

tded equ *
 lda deadfl
 beq life

 jsr bonus
 bcs dego

 lda timebo
 bne dego
 inc zycia
 jmp qdb


dego equ *

 lda deadco
 bne *+7
 lda #$b
 jsr sound

 lda #0
 sta deadco
 ldx fpyo
 ldy #31
clr  equ *
 lda plrdef,x
 and rnd
 sta plrdef,x
 beq *+4
 sta deadco
 lda plrdef+$100,x
 and rnd
 sta plrdef+$100,x
 beq *+4
 sta deadco
 inx
 dey
 bpl clr

 lda deadco
 beq *+3
 rts

 jsr bonus
 bcs qdb
 inc zycia

qdb equ *
 dec zycia
 jsr clfred
 jmp levbeg

life equ *
 jsr clfred
*- display fred
 ldx defnum
 lda fst+1,x
 jsr sa
 ldx fpy
 jsr dspf
 ldx defnum
 lda fst,x
 jsr sa
 clc
 lda fpy
 adc #16
 tax
 jsr dspf

 lda fpy
 sta fpyo
 lda fpx
 sta fpxo
 rts

clfred equ *
 ldx fpyo
 ldy #31
 lda #0
clrp sta plrdef,x
 sta plrdef+$100,x
 inx
 dey
 bpl clrp
 rts

*- set spray
spr  equ *
 lda #0
 sta sylnum
 lda bron
 beq *+3
 rts
 lda spraco
 beq *-3
 lda #1
 jmp ssss
*- set kamien
kam  equ *
 lda #0
 sta sylnum
 lda bron
 bne *+3
 rts
 lda kamco
 beq *-3
 lda #0
ssss equ *
 ldx leci
 bmi *+3
 rts
 sta bron
 lda #$39
 jsr sound
 lda #$e
 jmp sound

*******************
get2cav equ *

 lda cave    ;•
 cmp #4      ;•
 bcc gnor    ;•
             ;•
 lda #ver    ;•
 beq gnor    ;•
             ;•
 clc         ;•
 lda cave    ;•
 adc bomhk   ;•
 sta cave    ;•

gnor equ *
 inc cave
 inc cave
 jsr sercav
 bcc *+7
 dec cave
 dec cave
 rts

*- copy right caves to left
 lda #0
 sta x
 sta y
cc   jsr xytoad
 lda y
 clc
 lda mad
 adc #32
 sta addr
 lda mad+1
 adc #0
 sta addr+1

 ldy #31
c    lda (addr),y
 sta (mad),y
 dey
 bpl c

 inc y
 lda y
 cmp #8
 bcc cc

*  decompress 2 caves to right

 dec cave
 lda #32
 jsr getcav
 inc cave
 lda #32+16
 jsr getcav
 clc
 rts

getcav equ *
 sta x
 jsr sercav
 lda #0
 sta y
 sta tmp      ;index do (mad)
 sta tmp+1    ;index do (addr)
 sta tmp+2    ;licznik
 jsr xytoad

*- komn do bufora
gcv1 equ *
 ldy tmp+1
 lda (addr),y
 asl @
 php
 lsr @
 plp
 ror @
 sta hlp

 ldy tmp
 sta (mad),y
 jsr inin

 ldy tmp+1
 lda (addr),y
 and #1
 beq gcv2

 iny
 sty tmp+1
 lda (addr),y
 tax
 dex

 lda hlp
 cmp #$80
 bne *+4
 lda #0
tutu ldy tmp
 sta (mad),y
 jsr inin
 dex
 bne tutu

gcv2 inc tmp+1
 bpl gcv1

inin inc tmp+2
 bpl *+5
 pla
 pla
 rts

 pha
 ldy tmp
 iny
 cpy #16
 bne inok
 clc
 lda mad
 adc #64
 sta mad
 bcc *+4
 inc mad+1
 ldy #0
inok sty tmp
 pla
 rts


sercav equ *
 sec
 ldx cave
 lda #ver
 beq scon
 bmi scon

 tay           ;•
 lda 0,y       ;•
 pha           ;•
 tya           ;•
 asl @         ;•
 asl @         ;•
 sta hlp2+1    ;•
 ora #$80      ;•
 sta hlp2      ;•
 dey           ;•
 pla           ;•
 cmp (hlp2),y  ;•
 beq scon      ;•
               ;•
 cpx #23       ;•
 bcc scon      ;•
               ;•
 lda <jl       ;•
 sta moveproc  ;•
 lda >jl        ;•
 sta moveproc+1 ;•
                ;•
scon equ *
 lda lvtab+$100,x
 bne *+3
 rts
 sta addr+1
 lda lvtab,x
 sta addr
 clc
 rts

eleft equ *
 jsr bonus
 bcc tsl

nobo equ *
 ldx scrnum
 dex
 bpl ele1

tsl equ *
 ldx fpx
 cpx #$11
 bcs nost
 lda #0
 sta sylnum
 rts
nost equ *
 dec fpx
 rts

ele1 equ *
 ldy hsc
 iny
 cpy #$10
 bne *+6
 stx scrnum
 ldy #8
 sty hsc
 rts

erght equ *
 jsr bonus
 bcs nobon

 ldx fpx
 cpx #$88
 bcs ss0
 inc fpx
 rts

ss0 equ *
 lda #0
 sta sylnum
 rts

nobon equ *
 ldy hsc
 dey
 beq *+5
 sty hsc
 rts

 lda #8
 sta hsc
 ldx scrnum
 inx
 cpx #33
 beq *+5
 stx scrnum
 rts

 jsr nxcv
 bcs *+6
 ldx #01
 stx scrnum
 rts

nxcv  equ *
 jsr get2cav
 bcs *+3
 rts
 lda #255
 sta cave
 jmp get2cav
 rts

joyval equ *
 dta b(15),b(7),b(11),b(14),b(13),b(6),b(10),b(5),b(9)
*      •     →    ←     ↑     ↓    ↑→    ←↑    ↓→   ←↓

moveproc equ *
 dta a(r),a(rght),a(left),a(ju),a(dn)
 dta a(jr),a(jl),a(kam),a(spr)

bomb dta B($FF)
bomhk dta d' '

fst  equ *

*•  wiew=0
 dta a($1213),a($1213),a($1213),a($1213)
 dta a($1213),a($1213),a($1213),a($1213)
*•↑
 dta a($1213),a($1215),a($1213),a($1215)
 dta a($1213),a($1215),a($1213),a($1215)

*→  wiew=1
 dta a($2021),a($2223),a($2425),a($2627)
 dta a($2829),a($282b),a($2a2d),a($202c)
*→↑
 dta a($0203),a($0203),a($0405),a($0405)
 dta a($0607),a($0607),a($0607),a($0607)

*←  wiew=2
 dta a($2e2f),a($3031),a($3233),a($3435)
 dta a($3437),a($3639),a($383b),a($2e3a)
*←↑
 dta a($0809),a($0809),a($0a0b),a($0a0b)
 dta a($0c0d),a($0c0d),a($0c0d),a($0c0d)

*on line↑ wiew=3
 dta a($1011),a($1011),a($1213),a($1213)
 dta a($1415),a($1415),a($1617),a($1617)
*on line↓
 dta a($1617),a($1617),a($1415),a($1415)
 dta a($1213),a($1213),a($1011),a($1011)

bfaz equ *
 dta b($18),b($19),b($1a),b($1b),b($1c),b($1d),b($1e),b($1f)

upspd   dta d'$###"""!!!! ',B($80),d' !!!!"""###$$&&((**0000'

 end

