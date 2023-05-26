loader equ $500
saver  equ $100
mess   equ $480
title  equ $3800

     opt h+
     org $2e0
     dta a(saver)

* strona 0

p0     equ $80
addr   equ p0+00 ;+01
endp   equ p0+02 ;+03

* system

ciov   equ $e456

htbs   equ $31a
iocb   equ $350
iccom  equ iocb+2
icba   equ iocb+4 ;+5
icbl   equ iocb+8 ;+9
icax1  equ iocb+10
icax2  equ iocb+11

b0    equ $0b
b1    equ $8b
bmask equ %00010000
moton equ $34
motof equ $3c

cpntr equ $3d
timer equ $21c
io    equ $d20f
audf  equ $d200
cass  equ $d302

********************

     org saver
     jsr close
     jsr $f420 ;-cls

     ldx #119
dspm lda mess,x
     sta $bc40,x
     stx file
     dex
     bpl dspm
     stx 764

     jsr $f2fd
     cmp #'0'
     bcc saver
     cmp #'3'
     bne noru
     lda 10
     sta res1+1
     lda 11
     sta res2+1
     lda <res1
     sta 10
     lda >res2
     sta 11
     jmp title


noru bcs saver
     sec
     sbc #'0'
     sta file
     sta 764

     lda #$80
     sta 17


     lda #8
     jsr open
     bmi error
     lda file
     cmp #2
     beq nold
     lda #3
     jsr writeblk
     bmi error

nold jsr send1
     jsr eorblk
     lda file
     jsr writeblk
     php
     jsr eorblk
     plp
     bmi error
     jmp saver



error equ *
     jsr $f556
     jmp saver



writeblk equ *
     jsr blkadr

     lda #11
     sta iccom
     ldx #$10
     jmp ciov





send1 equ *

     lda #b1
     sta io

     lda #32
     sta timer
     lda timer
     bne *-3

     lda #b0
     sta io
     rts


res1 lda <*
     sta 10
res2 lda >*
     sta 11
     jmp saver


     org mess
 dta d'   Robbo Saver  (press RESET to exit)   '*
 dta d'    1: save part 1,   3: run Robbo,     '
 dta d'    2: save part 2,   0: save Robbo,    '

**************************************



     org loader
file dta b(0),b(3)
     dta a(loader)
     dta a($3800)

     lda #$80
     stx cpntr
     stx $28a
     stx 17
     stx $3E  ;-gap
     asl @
     sta $3f  ;-feof

     lda file+1
     beq nceo

     ldx #127
ceof lda $400,x
     sta loader+$180,x
     stx file+1
     dex
     bpl ceof

nceo lda #$0c
     sta iccom
     ldx #$10
     jsr ciov

     lda htbs+4
     pha
     lda htbs+5
     pha
     lda <myht
     sta htbs+4
     lda >myht
     sta htbs+5
     lda #4
     jsr open
     pla
     sta htbs+5
     pla
     sta htbs+4
     lda #moton
     sta cass


wait lda 17
     bpl fail
     lda io
     and #bmask
     bne wait

     lda #16
     sta timer
wai1 lda 17
     bpl fail
     lda io
     and #bmask
     beq *-5
     lda timer
     bne wait


     jsr halt
     lda <dl
     sta 560
     lda >dl
     sta 561
     lda #$0a
     sta 709
     lda #0
     sta 710
     lda #$e0
     sta 756
     sta 17
     jsr halt


     lda file
     jsr blkadr
     lda #7
     sta iccom
     ldx #$10
     jsr ciov
     php
     jsr close
     plp
     bpl eorblk
fail sec
     rts



open equ *
     sta icax1
     lda <cname
     sta icba
     lda >cname
     sta icba+1
     lda #3
     sta iccom
     lda #$80
     sta icax2
     ldx #$10
     jmp ciov



close equ *
     lda #$0c
     sta iccom
     ldx #$10
     jsr ciov

     lda #motof
     sta cass
     ldx #8
     lda #0
     sta audf,x
     dex
     bpl *-4
     rts



blkadr equ *
     asl @
     asl @
     tax

     lda filetab,x
     sta icba
     lda filetab+1,x
     sta icba+1
     sec
     lda filetab+2,x
     sbc icba
     sta icbl
     lda filetab+3,x
     sbc icba+1
     sta icbl+1
     inc icbl
     bne *+5
     inc icbl+1
     rts



eorblk equ *
     lda file
     asl @
     asl @
     tax

     lda filetab,x
     sta addr
     lda filetab+1,x
     sta addr+1
     lda filetab+2,x
     sta endp
     lda filetab+3,x
     sta endp+1

     ldy #0
eor1 lda (addr),y
     ldx addr
     eor loader+6,x
     sta (addr),y

     lda addr+1
     cmp endp+1
     bne eor2
     lda addr
     cmp endp
     bne eor2
     clc
ok   ldy #1
     rts

eor2 inc addr
     bne eor1
     inc addr+1
     jmp eor1



halt lda 20
     cmp 20
     beq *-2
     rts


********************

filetab equ *
     dta a($0e00),a($b7ff)
     dta a($0e00),a($67ff)
     dta a($6800),a($b7ff)
     dta a(loader),a(loader+$1ff)

dl   equ *
     dta d'ppppppppppppp'
     dta b($42),a(scrn),d'""',b($41)
dlad dta a(dl)

scrn equ *
 dta d' †è	 † † 	 (C)1989 by Laboratorium '
 dta d' †å†ô†ô†ô†ô  Komputerowe  Avalon   '
 dta d' †ôèå†å†åèå Kopiowanie zabronione! '

myht  dta a(ok-1)
cname dta c'C:',b($9b)

endldr equ *-1

*************************************

     end csaver
