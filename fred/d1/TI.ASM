* title        *

 opt h+
 icl 'd1/COMMON.ASM'

main   equ ciski
scrn1  equ plrdef
coltab equ scrn1+$180
pasbuf equ scrn1+$1a0

chad equ hlp2

********************

 org $2e0
 dta a(title)

 org title
 jmp titini

xpoke dta b($00)
tico dta B($82),B($A4),B($EA),d'( '  ;-kol czolowki

********************

dl dta B($F0),d'pp',B($C4),a(scrn1),B($C4),a(scrn1)
 dta B($C4),a(scrn1+$20),B($C4),a(scrn1+$20)
 dta B($C4),a(scrn1+$40),B($C4),a(scrn1+$40)
 dta B($C4),a(scrn1+$60),B($C4),a(scrn1+$60)
 dta B($C4),a(scrn1+$80),B($C4),a(scrn1+$80)
 dta B($C4),a(scrn1+$a0),B($C4),a(scrn1+$a0)
 dta B($C4),a(scrn1+$c0),B($C4),a(scrn1+$c0)
 dta B($C4),a(scrn1+$e0),B($C4),a(scrn1+$e0)
 dta B($C4),a(scrn1+$100),B($C4),a(scrn1+$100)
 dta d'p@',B($C4),a(scrn1+$120),B($C4),a(scrn1+$120)
 dta d'p',b($d4),a(scrn1+$140),b($d4),a(scrn1+$140)
 dta b($41),a(dl)

********************

titini equ *
 cli
 cld
 ldx #255
 txs
 stx 764
 lda #0
 sta 559
 jsr halt
 jsr inilev
 jsr halt

 lda <dli
 sta dliv
 lda >dli
 sta dliv+1
 lda #$c0
 sta $d40e
 lda <dl
 sta 560
 lda >dl
 sta 561
 ldx #7
 lda #0
 sta $d000,x
 dex
 bpl *-4
 ldx #4
 lda tico,x
 sta 708,x
 dex
 bpl *-7
 jsr cls

 lda #$80
 jsr sound
 lda xpoke
 bpl xxxx
 dec xpoke
 lda #$00
 jsr sound
 lda #$0c
 jsr sound

xxxx bit titac
 bmi *+5
 jmp endmsg


 lda xpoke
 beq *+7
 lda #4
 jsr dspmes

 lda #0        ;^^^
 jsr dspmes
 lda #1
 jsr dspmes
 lda #0
 ldx #0
 ldy #4
 jsr dspic
 lda #16
 ldx #18
 ldy #3
 jsr dspic

 ldy #1
 ldx flytab,y
 lda #$52
 sta scrn1,x
 lda #$53
 sta scrn1+1,x
 dey
 bpl *-14

 lda #$3d
 sta 559
 ldx #10
 jsr halt
 dex
 bne *-4

;••••••••••••••••••••

 lda #3
 sta hsc

 lda <txt-1
 sta chad
 lda >txt-1
 sta chad+1

 lda #$ff
 sta rpt

tloop equ *

 lda hsc
 bmi *+7
 sta hscr
 bpl tcont
 lda #3
 sta hsc
 sta hscr

 ldx #0
 lda scrn1+$141,x
 sta scrn1+$140,x
 inx
 cpx #38
 bcc *-9

 bit rpt
 bpl codi
 inc chad
 bne *+4
 inc chad+1

 ldy #0
 lda (chad),y
 beq jdemo
 cmp #$B1
 bcc codi
 cmp #$B9+1
 bcs codi

 sbc #$B0-1
 asl @
 asl @
 sta rpt
 dec rpt

codi equ *
 bit rpt
 bmi codi1
 lda #' '
 dec rpt

codi1 equ *
 sta char
 lda #2
 jsr dspmes

tcont equ *
 dec hsc

 jsr halt
 bcc tloop

 lda startlevel
 bmi *+4
 sta levnum

 clc
 jsr main
 sty titac         ;-START!!!
 jmp titini

jdemo sec           ;-DEMO
 jsr main
 jmp titini


endmsg equ * ;-wysw gratulacje
 lda #$3d
 sta 559
 lda titac
 bne noco

 lda #3
 jsr dspmes
 lda #0
 sta startlevel
 ldx #8
 ldy #5
 jsr dspic

 inc coltab+1
 jsr halt
 bcc *-6
noco lda #$80
 sta titac
 jmp titini

;•••••••••••••••

dspic equ *
 sty scra+1
 stx scra
 tay
 jsr spos
dpi1 lda pitab,y
 bpl *+16
 inc scra+1
 and #$7f
 cmp #$7f
 bne *+3
 rts
 pha
 jsr spos
 pla

 asl @
 bit hlp
 bmi *+7
 sta scrn1,x
 bpl *+5
 sta scrn1+$100,x
 ora #1
 bit hlp
 bmi *+7
 sta scrn1+1,x
 bpl *+5
 sta scrn1+$101,x
 inx
 inx
 iny
 bne dpi1 ;-jmp


dspmes equ *
 asl @
 tax
 lda <mess
 sta addr
 lda >mess
 sta addr+1
smes ldy #0
 lda (addr),y
 sta scra+1
 iny
 lda (addr),y
 sta scra
 iny
 txa
 beq mfnd
 lda (addr),y
 iny
 cmp #$80
 bne *-5
 dex
 clc
 tya
 adc addr
 sta addr
 bcc smes
 inc addr+1
 bne smes ;-jmp

mfnd ldx scra+1
 lda (addr),y
 cmp #$80
 beq dime-1
 sta coltab,x
 inx
 iny
 bne mfnd+2 ;-jmp

 iny
dime equ *
 jsr spos

dim1 lda (addr),y
 bne *+7
 iny
 inc scra+1 ;-newln
 bne dime ;-jmp

 bpl putc
 cmp #$ba
 bcs putc
 and #$7f
 bne *+3
 rts
 iny
 sec
 sbc #'0'
 asl @
 sta hlp+1
 txa
 adc hlp+1
 tax
 jmp dim1

putc sty hlp+1
 pha
 and #$80
 sta inv
 pla
 and #$7f
 ldy #8
 cmp chrtab,y
 beq *+7
 dey
 bpl *-6
 bmi norm

 tya
 cmp #4
 bcc *+4
 adc #$1a
 clc
 adc #$3c

norm cmp #'a'
 bcs *+4
 adc #$20
 cmp #'@'
 bne *+4
 lda #0

 ora #$80
 eor inv
 ldy hlp+1
 iny
 bit hlp
 bmi *+9
 sta scrn1,x
 inx
 jmp dim1
 sta scrn1+$100,x
 inx
 jmp dim1



spos equ *
 lda scra+1
 asl @
 asl @
 asl @
 asl @
 asl @
 php
 clc
 adc scra
 tax
 plp
 lda #0
 ror @
 sta hlp
 rts


****

cls  equ *
 ldx #0
 txa
 sta scrn1,x
 sta scrn1+$100,x
 dex
 bne *-7
 rts


halt lda 20
 cmp 20
 beq *-2

 and #$0f      ;^^^
 bne qqqq

 txa
 pha
 ldx #11
 lda scrn1+$114,x
 eor #$80
 sta scrn1+$114,x
 dex
 bpl *-9
 pla
 tax

qqqq equ *
 lda #0
 sta 77
 lda 764
 cmp #$ff
 bne gpas
 sec
 lda $d010
 and $d011
 and $d01f
 beq *+3
 clc
 rts

gpas txa
 pha
 ldx #0
 lda pasbuf+1,x
 sta pasbuf,x
 inx
 cpx #4
 bcc *-9
 ldx 764
 lda $fb51,x
 sta pasbuf+4
 lda #$ff
 sta 764

 lda xpoke
 bne sleve

 ldx #4
 lda pasbuf,x
 cmp pass,x
 beq *+6
 pla
 tax
 clc
 rts
 dex
 bpl *-13
 lda #$80
 sta xpoke
 lda #$0f
 sta 712
 lda 20
 cmp 20
 beq *-2
 jmp titini

sleve equ *

 lda pasbuf+4
 cmp #'0'
 bcc slex
 cmp #'9'+1
 bcs slex

 sec
 sbc #'1'
 bcs *+4
 lda #9
 sta startlevel

 sec
 bcs slex+1 ;-jmp

slex equ *
 clc
 pla
 tax
 rts


inilev equ *
 lda #$60
 sta *-2

 ldx #0
cfnt equ *
 lda font,x
 sta font1,x
 lda font+$100,x
 sta font1+$100,x
 lda font+$200,x
 sta font1+$200,x
 lda font+$300,x
 sta font1+$300,x
 lda font+$400,x
 sta font1+$400,x
 lda font+$500,x
 sta font1+$500,x
 lda font+$600,x
 sta font1+$600,x
 lda font+$700,x
 sta font1+$700,x
 dex
 bne cfnt

 lda #0
 sta cave
icad jsr sercav
 ldx cave
 lda addr
 sta lvtab,x
 lda addr+1
 sta lvtab+$100,x
 inc cave
 bne icad
 rts

sercav lda <levb  ;** szukaj komn
 sta addr
 lda >levb
 sta addr+1
ser1 ldy #1
 lda (addr),y
 beq nocv
 dey
 lda (addr),y
 cmp cave
 beq fndc
 iny
 lda (addr),y
 clc
 adc addr
 sta addr
 bcc *+4
 inc addr+1
 jmp ser1

nocv equ *
 lda #0
 sta addr
 sta addr+1
 rts

fndc equ *
 clc
 lda addr
 adc #2
 sta addr
 bcc *+4
 inc addr+1
 rts


********************

dli  pha
 txa
 pha

 lda vcou
 cmp #8
 bcs dli1

 lda #0
 sta dlmo


dli1 lda dlmo
 lsr @
 tax
 lda >titfnt
 bcc *+4
 adc >$400-1
 sta $d409
 inc dlmo

 lda coltab,x
 sta $d019

 pla
 tax
 pla
 rti

c  dta B($11),B($07),B($03),B($0D),B($1C)

mess equ *
 dta a($0409),B($DC),B($80)
 dta c'45 7887 zeppelin games',B($80)

 dta a($0000),d'(TD    (T',B($80)
 dta c'programmed',B($00)
 dta c'  by mirosLaw liminowicz',B($00)
 dta c'  and janusz pelc',B($00),B($00),B($00),B($00),B($00)
 dta c'graphics and music',B($00)
 dta c'  by janusz pelc',B($80)


 dta a($000a),d't ',B($80),B($00),B($B2)
char dta c' ',B($80)

 dta a($0101),d'  ',B($9C),d'     ',B($C4),B($80)
 dta B($B3),c' congratulations',B($00),B($00)
 dta B($B2),c' you have  completed'
 dta B($00),B($00),B($00),B($00),B($00),B($00)
 dta B($B5),c'game over',B($80)

 dta a($1408),B($9A),B($80)
 dta B($F3),B($E5),B($EC),B($E5),B($E3),B($F4),c' ',B($EC),B($E5),B($F6),B($E5),B($EC),B($80)

txt equ *
 dta B($B4),c'zeppelin games presents  ',B($E6),B($F2),B($E5),B($E4)
 dta B($B6)
 dta c'you have to survive in full'
 dta c' of adventures and dangers '
 dta c'travel through wild land',B($B6)
 dta c'you must skillfully use things'
 dta c' you will find on your way',B($B6)
 dta c'you can choose: ',B($F3),B($F4),B($EF),B($EE),B($E5),B($F3)
 dta c' right and down, ',B($F3),B($F0),B($F2),B($E1),B($F9)
 dta c' left and down'
 dta B($B6),c' ',B($E7),B($EF),B($EF),B($E4),B($A0),B($EC),B($F5),B($E3),B($EB),c' '
 dta B($B9),B($B2)
 dta B($00)

pass  dta c'chaos'
titac dta b($80)

pitab dta d'!"#$%&''',b($91),d'234567',b($FF)
 dta d' H()*+,-',B($A3),d'89:;<=',B($80),d'0./@AB',B($80),d'G>?DEF',B($FF)

chrtab dta c',ACELNOSZ'
flytab dta b($1b),b($b0)
inv    dta d' '

startlevel dta d' '*

 end

