font equ $a800
scrn equ $ac00
prog equ $ad00

     opt h+

     org prog

dl   equ *
     dta c'pppppppppppp'
     dta b($44),a(scrn),d'$$$p$'
     dta b($41),a(dl)

cols equ *
 dta b($c2),b($b4),b($0a),b($f6),b($00)

begn equ *

     lda 20
     cmp 20
     beq *-2
     lda #$21
     sta 559
     sta $d400
     lda >font
     sta 756
     sta $d409
     lda <dl
     sta 560
     sta $d402
     lda >dl
     sta 561
     sta $d403

     ldx #4
     lda cols,x
     sta 708,x
     sta $d016,x
     dex
     bpl *-10

     ldx #0
     txa
     sta scrn,x
     dex
     bne *-4

     ldx #127
dsp1 equ *
     txa
     and #$1f
     cmp #2
     bcc cnt1
     cmp #18
     bcs cnt1
     txa
     sta scrn+6,x
cnt1 dex
     bpl dsp1

     ldx #13
dsp2 equ *
     clc
     txa
     adc #$32+$80
     sta scrn+134,x
     ora #$40
     sta scrn+134+14,x
     dex
     bpl dsp2

     lda #$40
     sta scrn+36
     sta scrn+89
     lda #$41
     sta scrn+36+1
     sta scrn+89+1
     lda #$60
     sta scrn+36+32
     sta scrn+89+32
     lda #$61
     sta scrn+36+33
     sta scrn+89+33

     rts

     org $2e2
     dta a(begn)

     end

