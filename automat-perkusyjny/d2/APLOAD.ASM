
* info text for ap


     opt h+
scra  equ $80
addr  equ $82
len   equ $84
edit  equ $340

cio   equ $e456
font  equ $5800
sfont equ $e000

*-------------------

     org 65
     dta b(0)

     org $5000 ;

*- initilization ---

init equ *

     ldx #0
cflp lda sfont,x
     sta font,x
     lda sfont+$100,x
     sta font+$100,x
     lda sfont+$200,x
     sta font+$200,x
     lda sfont+$300,x
     sta font+$300,x
     lda sfont+$400,x
     sta font+$400,x
     lda sfont+$500,x
     sta font+$500,x
     lda sfont+$600,x
     sta font+$600,x
     lda sfont+$700,x
     sta font+$700,x
     lda ou-8,x
     sta font+$200,x
     dex
     bne cflp

     lda >font
     sta 756
     ldx #0
     lda <text
     sta addr
     lda >text
     sta addr+1
     lda <tlen
     sta len
     lda >tlen
     sta len+1
     jsr $f420
     lda 88
     sta scra
     lda 89
     sta scra+1

     ldx #0
     ldy #0
dspt equ *

     lda (addr,x)
     bpl dspc

     clc
     lda scra
     adc #40
     sta scra
     bcc *+4
     inc scra+1

     ldy #0
     beq cont ;-jmp

dspc equ *

     sta (scra),y
     iny

cont equ *

     inc addr
     bne *+4
     inc addr+1

     lda (addr,x)
     cmp #$ff
     bne dspt

     rts

text equ *

     dta b(155)
     dta b(155)
     dta b(155)
     dta b(155)
     dta d'          Automat Perkusyjny'
     dta b(155)
     dta d'          ------------------'
     dta b(155)
     dta d'         napisany w 1989 roku'
     dta b(155)
     dta d'       i poprawiony w 1991 roku'
     dta b(155)
     dta d'                 przez'
     dta b(155)
     dta b(155)
     dta d'            Macieja Mi',B($41),d'sika'
     dta b(155)
     dta b(155)
     dta d'   ',B($42),d' 1991 Laboratorium'
     dta d' Komputerowe'
     dta b(155)
     dta d'                AVALON'
     dta b(155)
     dta b(155)
     dta b(155)
     dta b(155)
     dta b(155)
     dta d'         Trwa wczytywanie ... '
     dta b($ff)

tlen equ *-text

ou   equ *

     dta b(%00000000)
     dta b(%00000000)
     dta b(%01111000)
     dta b(%00001100)
     dta b(%01111100)
     dta b(%11001100)
     dta b(%01111100)
     dta b(%00000110)

     dta b(%00111100)
     dta b(%01000010)
     dta b(%10011001)
     dta b(%10100001)
     dta b(%10100001)
     dta b(%10011001)
     dta b(%01000010)
     dta b(%00111100)

     org $2e2
     dta a(init)

     end
