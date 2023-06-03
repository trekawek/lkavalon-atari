* strona tytuuowa
 icl 'd1/JOINT.ASM'

coltab equ scrn1+$160
colt1  equ scrn1+$170
pasbuf equ scrn1+$1a0
dlmo   equ 0
dliv   equ $200

 opt h+
 org $2e0
 dta a(title)
 org title
 jmp titini

poke dta b($00)
 dta b($2d)        ;-helikopter
 dta b($86),b($8b) ;-centrum

 dta c'X',B($C4),B($0A),B($04),B($12),B($A4),B($8C),B($C8),B($00)  ;-kol komnat
 dta c'2',B($0E),c'2',B($0E),B($02),B($94),B($0C),B($C6),B($00)  ;-kol dol lin
 dta B($12),B($B4),B($98),B($CE)       ;-kol centrum
 dta B($C2),B($A4),B($9E),B($06)       ;-kol helikop
tico equ *
 dta B($C2),B($B4),B($0A),B($08),B($00)      ;-kol czolowki

********************

dl dta B($F0),d'pp',B($C4),a(scrn1),B($C4),a(scrn1)
 dta B($C4),a(scrn1+$20),B($C4),a(scrn1+$20)
 dta B($C4),a(scrn1+$40),B($C4),a(scrn1+$40)
 dta B($C4),a(scrn1+$60),B($C4),a(scrn1+$60)
 dta B($C4),a(scrn1+$80),B($C4),a(scrn1+$80)
 dta B($C4),a(scrn1+$a0),B($C4),a(scrn1+$a0)
 dta B($C4),a(scrn1+$c0),B($C4),a(scrn1+$c0)
 dta B($C4),a(scrn1+$e0),B($C4),a(scrn1+$e0),d'p@'
 dta B($4F),a(scrn1+$1e0)
 dta d'0',B($C4),a(scrn1+$100),B($C4),a(scrn1+$100)
 dta B($C4),a(scrn1+$120),B($C4),a(scrn1+$120)
 dta B($C4),a(scrn1+$140),B($C4),a(scrn1+$140)
 dta d'0',B($4F),a(scrn1+$1e0),b($41),a(dl)

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
 jsr inicvad

 lda #$80
 jsr sound
 lda poke
 bpl *+15
 dec poke
 lda #$0d
 jsr sound
 lda #$01
 jsr sound

 lda #0
 jsr dspmes
 lda titac
 bit titac
 bpl endmsg
titcont equ *
 lda #0
 ldx #0
 ldy #1
 jsr dspic
 lda #31
 ldx #14
 ldy #0
 jsr dspic

 ldy #3
 ldx startab,y
 lda #$4a
 sta scrn1,x
 lda #$4b
 sta scrn1+1,x
 dey
 bpl *-14

 lda #$3d
 sta 559
 ldx #10
 jsr halt
 dex
 bne *-4

 ldy #1
show tya
 pha
 jsr showmes
 bcs run_
 pla
 tay
 iny
 cpy #6
 bcc show

 sec
 jsr main
 jmp titini

run_ clc
 jsr main
 sty titac
 ldx #2
cmps lda scor,x
 cmp hisc,x
 bcc *+9
 beq *+4
 bcs hihi
 dex
 bpl cmps
 jmp titini

hihi equ *
 ldx #2
 lda scor,x
 sta hisc,x
 dex
 bpl *-5
 jmp title


endmsg equ *
 lda #$3d
 sta 559
 lda titac
 bne nonu
 lda #0
nonu clc
 adc #6
 jsr showmes
 lda titac
 bne noco
 inc coltab+6
 jsr halt
 bcc *-6
noco jsr clrmes
 lda #$80
 sta titac
 jmp titcont

;•••••••••••••••

showmes equ *
 tay
 jsr clrmes
 tya
 jsr dspmes

 lda #0
 sta hlp
lion ldy #7
 jsr halt
 bcs shox
 jsr halt
 bcs shox
lon1 equ *
 lda colt1,y
 and #$f0
 ora coltab,y
 tax
 lda colt1,y
 and #$0f
 cmp hlp
 bcc *+3
 inx
 txa
 sta coltab,y
 dey
 bpl lon1
 inc hlp
 lda hlp
 cmp #$10
 bcc lion

 lda titac
 beq shox

 ldy #0
 jsr halt
 bcs shox
 dey
 bne *-6

 lda #15
 sta hlp
liof ldy #7
 jsr halt
 bcs shox
 jsr halt
 bcs shox
lof1 equ *
 lda coltab,y
 tax
 and #$0f
 beq *+4
 dex
 txa
 sta coltab,y
 dey
 bpl lof1
 dec hlp
 bpl liof
shox rts

clrmes ldx #0
 lda scrn1,x
 cmp #$4e
 bcc *+4
 lda #0
 sta scrn1,x
 cpx #8
 bcs *+7
 lda #0
 sta coltab,x
 dex
 bne clrmes+2
 rts

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
 sta scrn1,x
 ora #1
 sta scrn1+1,x
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
 sta colt1,x
 cpx #8
 bcc *+5
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
 ldy #8
 cmp chrtab,y
 beq *+7
 dey
 bpl *-6
 bmi *+12

 tya
 cmp #4
 bcc *+4
 adc #$1a
 clc
 adc #$3c

 cmp #'a'
 bcs *+4
 adc #$20
 cmp #'@'
 bne *+4
 lda #0

 ora #$80
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


inicvad equ *
 lda #0
 beq *+3
 rts
 inc inicvad+1
 sta cave
icad jsr sercav
 ldx cave
 lda addr
 sta cvadrt,x
 lda addr+1
 sta cvadrt+$100,x
 inc cave
 bne icad
 rts

sercav lda <levl  ;** szukaj komn
 sta addr
 lda >levl
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


halt lda 20
 cmp 20
 beq *-2
 lda #0
 sta 77
 lda 764
 cmp #$ff
 bne gpas
 sec
 and $d010
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
 cpx #5
 bcc *-9
 ldx 764
 lda $fb51,x
 sta pasbuf+5
 lda #$ff
 sta 764

 lda poke
 bne papr
 ldx #5
 lda pasbuf,x
 cmp pass,x
 beq *+6
papr pla
 tax
 clc
 rts
 dex
 bpl *-13
 lda #$26
 sta pitab+2
 lda #$80
 sta poke
 lda #$0f
 sta 712
 lda 20
 cmp 20
 beq *-2
 jmp titini

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


****

mess equ *
 dta a($0008),b($3a),b($c2),b($94),B($80)
 dta B($B2),c'/; 1991  zeppelin games',B($00)
 dta B($B1),c'program, graphics and music',B($00)
 dta B($B4),c' by janusz pelc',B($80)

 dta a($0c04),b($0a),b($ca),B($80)
 dta B($B1),c' zeppelin games',B($00),B($B3),c'presents',B($80)

 dta a($0c04),B($AE),B($EA),B($80)
 dta B($B3),c' mission',B($00)
 dta B($B4),c'shark',B($80)

 dta a($0c04),B($96),B($84),B($B2),B($80)
 dta B($B2),c'use joystick',B($00)
 dta B($B2),c' to control',B($00)
 dta B($B2),c'your soldier',B($80)

 dta a($0c04),b($34),b($b6)
 dta b($e8),b($ca),B($80)
 dta c' pull joystick down',B($00)
 dta B($B2),c' and press',B($00)
 dta B($B2),c'fire button',B($00)
 dta B($B1),c'to throw grenade',B($80)

 dta a($0c03),b($ea),b($e4),b($e4)
 dta b($aa),b($a4),B($80)
 dta B($B1),c'press option key',B($00)
 dta B($B2),c' to select',B($00)
 dta B($B1),c'music or sound fx',B($00)
 dta B($B1),c' press break key',B($00)
 dta B($B2),c'to abort game',B($80)

 dta a($0000),b($0e),b($00),b($34)
 dta b($e8),b($9a),b($00),b($0e),B($80)
 dta B($B5),c' well done',B($00)
 dta B($00)
 dta B($B3),c'the secret military',B($00)
 dta B($B3),c' underground  base',B($00)
 dta B($B2),c' is entirely destroyed ',B($00)
 dta B($00)
 dta B($B3),c' mission completed',B($80)

 dta a($0c03),d'.',B($80),c'game over',B($80)

 dta a($0203),d'.',B($80)
 dta c' you did not escape in time',B($80)

 dta a($0a03),d'.',B($80),c'game aborted',B($80)

pass dta c'j.pelc'
titac dta b($80)

pitab dta d' !"',B($90),d'12''',B($83),d'$%&',B($93),d'456',B($80),d'(9:',B($97),d'8)*+',B($89),d'*+)*+',B($FF)
 dta d',-  ./',B($9C),d'=>?@ABC',B($FF)

chrtab dta c',ACELNOSZ'
startab dta b($0a),b($3e),b($20),b($52)

endtit equ *

 org itmsrc
*      0123456789abcdef

 dta c'    1      |    ' ;0
 dta c'       ',B($FC),c'   ',B($FC),c'    ' ;1
 dta B($B1),c'  ',B($B3),c'   |   | 8  ' ;2
 dta c'   ',B($B2),c'  3|   |2   ' ;3
 dta c'                ' ;4
 dta c' ',B($FC),c'        ',B($FC),c'     ' ;5
 dta c' |        |     ' ;6
 dta c'        ',B($B6),c' |     ' ;7
 dta c'     5    ',B($B8),c'4 ',B($FC),c'  ' ;8
 dta c'             |  ' ;9
 dta c'             |  ' ;a
 dta c'    7 |      |  ' ;b
 dta c'      |  ',B($B7),c'      ' ;c
 dta c'  ',B($B4),c'   |         ' ;d
 dta c'      ',B($FC),c'       | ' ;e
 dta c'           ',B($B5),c'  ',B($FC),c'6' ;f

 org enetab
*      0123456789abcdef

 dta c'2101209    9    ' ;0
 dta c'110021133012    ' ;1
 dta c'901112032  3 99 ' ;2
 dta c'901203200  0122 ' ;3
 dta c'9139  9         ' ;4
 dta c'02203910103     ' ;5
 dta c'012319210000    ' ;6
 dta c'     91300230   ' ;7
 dta c'     999999083  ' ;8
 dta c' 072         9  ' ;9
 dta c' 010         67 ' ;a
 dta c' 800160000000548' ;b
 dta c'      2284     4' ;c
 dta c'  9   03       5' ;d
 dta c'  53213028291500' ;e
 dta c'        08302 03' ;f

* u233 0b,55,a3,bd


 org endtit
 end


