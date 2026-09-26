     opt h+
     org $600

z0   equ $cb
addr equ z0+00 ; +01
scra equ z0+02 ; +03
hlp  equ z0+05

     jmp readdta


readhex equ *

     pla
     pla
     sta addr+1
     pla
     sta addr
     pla
     sta scra+1
     pla
     sta scra
     ldx #0
     ldy #0
     sty hlp

rhex equ *

     jsr getb
     bcs error

     sta (scra),y
     clc
     adc hlp
     sta hlp

     iny
     cpy #12
     bcc rhex

     jsr getb
     cmp hlp
     beq rhxx

error equ *
     inc 0
rhxx rts


getb lda #0
     jsr getd
     bcs gtdw

     asl @
     asl @
     asl @
     asl @

getd sta gtdA+1

     lda (addr,x)
     inc addr
     bne *+4
     inc addr+1

     cmp #'0'
     bcc gtd1
     cmp #'9'+1
     bcs gtd1
     sec
     sbc #'0'
     bcs gtda ;-jmp

gtd1 cmp #'a'
     bcc gtd2
     cmp #'f'+1
     bcs gtd2
     sec
     sbc #'a'-10
     bcs gtda ;-jmp

gtd2 cmp #'A'
     bcc gtdw
     cmp #'F'+1
     bcs gtdw
     sec
     sbc #'A'-10

gtdA ora <*
     clc
     rts

gtdw sec
     rts


readdta equ *

     pla
     pla
     sta addr+1
     pla
     sta addr
     pla
     sta scra+1
     pla
     sta scra

     inc addr
     bne *+4
     inc addr+1

     ldy #19
rdta lda (addr),y
     sta (scra),y
     dey
     bpl rdta
     rts

;     opt 7
     end
