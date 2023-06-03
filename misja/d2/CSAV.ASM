* nasza transmisja
* kasetowa  90.03.15


************************************

init  equ $b800   ;saver

begn  equ $480   ;loader

************************************

     opt h+ s+

     org $2e0
     dta a(init)

* strona 0

csum   equ 1

p0     equ $80
addr   equ p0+00 ;+01
endp   equ p0+02 ;+03
csflg  equ p0+04 ;-save
time   equ p0+04 ;-load
mtim   equ time+8

* stale

bne    equ $d0
moton  equ $34
motof  equ $3c

buff   equ $b000
blen   equ $180

secbuf equ $600

tpos   equ $bc40+93+720

* system

setvb  equ $e45c
vbex   equ $e45f
getk   equ $f2fd
ciov   equ $e456

iocb   equ $350
iccom  equ iocb+2
icba   equ iocb+4 ;+5
icbl   equ iocb+8 ;+9
icax1  equ iocb+10
icax2  equ iocb+11

ddevic equ $300
dunit  equ $301
dcmmd  equ $302
dstats equ $303
dbufa  equ $304
dtimlo equ $306
dbyt   equ $308
daux2  equ $30b

chksum equ $31
bufr   equ $32
bufen  equ $34
chksnt equ $3b
serout equ $d20d
serin  equ serout
irqen  equ $d20e
irqens equ $10


vseror equ $20c
sysout equ $eaad
sioini equ $e459

b1    equ $0b
b0    equ $8b
bmask equ %00010000

io    equ $d20f
timer equ $21c
audf  equ $d200

*--- saver -------------------------

     org init
     lda #$80
     sta 17 ;-brkflg
     lda #$00
     jsr savprg
     lda csum
     sta buff+4

     jsr savldr
     bmi init

     lda #$80
     jsr savprg
     jmp init

* zapisz loader

savldr equ *

     lda <sysout
     sta vseror
     lda >sysout
     sta vseror+1

     lda #$0c
     sta iccom
     ldx #$10
     jsr ciov

     lda <cname
     sta icba
     lda >cname
     sta icba+1
     lda #3
     sta iccom
     lda #8
     sta icax1
     lda #$80
     sta icax2

     ldx #$10
     jsr ciov
     bmi svlx

     lda <blen
     sta icbl
     lda >blen
     sta icbl+1
     lda <buff
     sta icba
     lda >buff
     sta icba+1
     lda #11
     sta iccom
     ldx #$10
     jsr ciov

     ldx #8
     lda data,x
     sta audf,x
     dex
     bpl *-7

     lda 20
     cmp 20
     beq *-2

     lda #b1
     sta io

     lda #2
     sta timer
     lda timer
     bne *-3

     lda #b0
     sta io
     ldy #1

svlx rts

data dta d'%',B($A0),d'''',B($A0),d'%',B($A0),d'''',B($A0),d' '

* zapisz program

savprg equ *
     sta csflg

     lda <myout
     sta vseror
     lda >myout
     sta vseror+1

     ldx #3
     lda head-begn+buff,x
     sta addr,x
     dex
     bpl *-6

     lda #$55
     sta csum
     sta secbuf
     sta secbuf+1

savloop ldy #$7f
     lda (addr),y
     sta secbuf+2,y
     eor csum
     sta csum
     dey
     bpl savloop+2

     jsr writebuf
     bmi svlx
     clc
     lda addr
     adc #$80
     sta addr
     bcc *+4
     inc addr+1

     lda addr
     cmp endp
     lda addr+1
     sbc endp+1
     bcc savloop
     ldy #1
     rts

writebuf equ *
     bit csflg
     bmi *+3
     rts
     lda #'W'
     sta dcmmd
     lda #0
     sta dbyt+1
     sta dunit
     lda #$82
     sta dbyt
     lda >secbuf
     sta dbufa+1
     lda <secbuf
     sta dbufa
     lda #$60
     sta ddevic
     lda #$23
     sta dtimlo
     lda dcmmd
     lda #$80
     sta dstats
     sta daux2
     jmp sioini


myout equ *
     tya
     pha
     inc bufr
     bne *+4
     inc bufr+1
     lda bufr
     cmp bufen
     lda bufr+1
     sbc bufen+1
     bcc myco
     lda chksnt
     bne send
     lda csum
     sta serout
     lda #$ff
     sta chksnt
     bne myex
send lda irqens
     ora #$08
     sta irqens
     sta irqen
     bne myex ;-jmp
myco ldy #0
     lda (bufr),y
     sta serout
myex pla
     tay
     pla
     rti


cname dta c'C:',b($9b)

;•••••••••••••••••••••••••••••••••••••

     opt h-  ;bez glowy

     org begn-6

*--- disk header ---
     dta a($ffff)
     dta a(buff)
     dta a(lend-begn+buff-1)

*--- cass header ---

     org begn
     dta b($9b),b(2)
     dta a(begn)
     dta a($e400)

     ldy #$7f
c    lda $400,y
     sta begn+$100,y
     dey
     bpl c

     ldy #20
d    lda head,y
     sta addr,y
     cpy #8
     bcs *+8
     lda ldat,y
     sta $d300,y
     dey
     bpl d

     lda #$c0
     sta $6a

     jsr $ef94 ;-edopn

     asl $bc42

     ldy #15
e    lda mess,y
     sta $bc73,y
     sty 710
     dey
     bpl e

*     ldy <vbli
*     ldx >vbli
*     lda #6
*     jsr setvb

     lda #$55
     sta csum

     lda io
     and #bmask
     bne *-5
     lda io
     and #bmask
     beq *-5


lolo equ *

     lda #$82
     sta dbyt
     lda <secbuf
     sta dbufa
     lda >secbuf
     sta dbufa+1
     sta dtimlo ;=6
     lda #$40
     sta dstats
     jsr sioini

     lsr 77

     ldy #$7f
copy lda secbuf+2,y
     sta (addr),y
     eor csum
     sta csum
     dey
     bpl copy

     cmp serin
     beq *+8
     jsr $f556
     jmp $e471

     lda addr
     eor #$80
     sta addr
     bmi *+4
     inc addr+1

     cmp endp
     lda addr+1
     sbc endp+1
     bcc lolo

     lda #$3c
     sta $d302
     lda #$ff
     sta $d300

     ldx >vbli
     ldy <vbli
     lda #7
     jmp run


* zegar

vbli equ *
     lda time+16
     beq tend
     ldx #7
tlop lda mtim,x
     beq tcon
     ldy time,x
     dey
     tya
     sta time,x
     cpy #$10
     bcs tend
     lda mtim,x
     sta time,x
tcon dex
     bpl tlop
tend lda #0
     sta time+16
     ldy #6
tdis lda time,y
     and #$0f
     cmp #10
     bcs *+8
     tax
     ora time+16
     sta time+16
     txa
     asl @
     tax
     tya
     pha
     asl @
     tay
     lda nums+1,x
     sta tpos+1,y
     lda nums,x
     sta tpos,y
     lda nums+1+22,x
     sta tpos+1+40,y
     lda nums+22,x
     sta tpos+40,y
     lda nums+1+44,x
     sta tpos+1+80,y
     lda nums+44,x
     sta tpos+80,y
     pla
     tay
     dey
     bpl tdis
     jmp vbex

nums dta B($C9),B($59),B($D9),d' ',B($4B),B($59),B($D5),B($59),B($59),d' ',B($C9),d' ',B($C9),d' ',B($D5),B($59),B($C9),B($59),B($C9),B($59),B($49),d' '
     dta B($59),B($59),B($D9),d' ',B($C9),B($4C),B($4B),B($59),B($CB),B($59),B($D5),B($59),B($C9),B($59),B($CF),B($4C),B($C9),B($59),B($D5),B($59),B($49),d' '

mess equ *
     dta d'Mission shark...     '

head dta a($0a00),a($ab00)
run  equ $6800
timp dta d'11:38:80'
     dta d'59 59 94'
ldat dta B($FF),B($FF),c'0<',B($FF),B($FF),c'0<'

msss dta d' J.Pelc '

lend equ *

*************************************
     end



