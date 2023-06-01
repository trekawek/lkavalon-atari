begn equ $0a00
load equ $480

     opt h+

     org $2e0
     dta a(begn)

*************************************

sect equ $04

p0   equ $80
len  equ p0+00 ;+01
addr equ p0+02 ;+03
cntr equ p0+04 ;+05


dunit equ $301
dcmmd equ $302
dbufa equ $304 ;(2)
daux1 equ $30a
daux2 equ $30b
disk  equ $e453

*************************************

     org load
     dta b($9b),b($03)
     dta a(load)
     dta a($f556)

     jsr halt

     ldx #7
i    lda ldat,x
     sta $d300,x
     lda mess,x
     sta $bc78,x
     cpx #2
     bcs c
     lda data,x
     sta daux1,x
     lda data+2,x
     sta dbufa,x
     lda data+4,x
     sta $2e0,x
c    dex
     bpl i

     asl $bc42
     lda #$3c
     sta $d302
     stx cntr
     stx $d300 ;-pic
     stx 764   ;-pic
     inx
     stx $d018 ;-pic
     stx 559
     stx $41
     stx $d40a ;-pic
     tsx
     inc 88    ;-pic
     stx ldat
     jsr halt  ;-pic

lod1 jsr getb
     sta addr
     cmp #$ff
     beq lod1
     jsr getb
     sta addr+1
     tax
     beq tbad
     and addr
     cmp #$ff
     beq lod1
     jsr getb
     sta len
     jsr getb
     sta len+1
     lda <rts
     sta $2e2
     lda >rts
     sta $2e3
     bne lod3 ;-jmp

lod2 inc addr
     bne *+4
     inc addr+1

lod3 jsr getb
     ldy #0
     sta (addr),y

     lda addr+1
     cmp len+1
     bne lod2
     lda addr
     cmp len
     bne lod2

     jsr inij
     jmp lod1

inij jmp ($2e2)

error ldx ldat
     txs
     lda daux1
     cmp #$cc
     bne *+6
     cpy #$90
     beq *+4
     clc
     rts

     jmp ($2e0)


tbad lda #$cc
     sta daux1
     lda #$02
     sta daux2
     jsr halt
     jmp gets

getb ldx cntr
     bpl gtb1

gets jsr disk
     bmi error
     inc daux1
     bne *+5
     inc daux2

     ldx #0
gtb1 lda secb,x
     eor load,x
     inx
     stx cntr
rts  rts

data dta a(4)
     dta a(secb)
     dta a(rts)
     dta a($f556) ;-pic

ldat dta B($FF),B($FF),c'0<',B($FF),B($FF),c'0<'
mess dta d'loading:'

halt lda 20
     cmp 20
     beq *-2
     rts

endldr equ *

secb equ load+$180

*************************************

     opt h-
     org begn
     dta a(begn)
     dta a(buff-9)

     jsr $f556
     jsr $f2fd

* zapisz loader

     lda <load
     sta dbufa
     lda >load
     sta dbufa+1
     lda <1
     sta daux1
     lda >1
     sta daux2
     lda <3
     sta cntr
     lda >3
     sta cntr+1
     jsr save

* koduj plik

     lda <buff
     sta addr
     lda >buff
     sta addr+1

     ldx #0
     ldy #0
kodu lda (addr),y
     eor load,x
     sta (addr),y
     inx
     bpl *+4
     ldx #0
     iny
     bne kodu
     inc addr+1
     lda addr+1
     cmp >$bb00
     bcc kodu

* zapisz plik

     lda <buff
     sta dbufa
     lda >buff
     sta dbufa+1
     lda #0
     sta cntr+1
     sec
     lda >$bc00
     sbc >buff
     asl @
     rol cntr+1
     sta cntr


save equ *
     lda #'P'
     sta dcmmd
     lda #1
     sta dunit
     lda dcmmd
     cmp #'P'
     bne save

sav1 jsr disk
     bmi savx
     clc
     lda dbufa
     adc #128
     sta dbufa
     bcc *+5
     inc dbufa+1
     inc daux1
     bne *+5
     inc daux2
     dec cntr
     bne sav1
     dec cntr+1
     bpl save
     ldy #1

savx rts

     dta a($ffff)
     dta a(buff)
     dta a($c000)

buff equ *

     org endldr
     END


