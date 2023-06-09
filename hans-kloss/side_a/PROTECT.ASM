 OPT h+
 ORG $0480

adr1     equ $b0
adr2     equ $b2
iocb     equ $0340
ciomain  equ $e456

buffer   equ $6f00

 ldx #16
 lda #3
 sta iocb+2,x
 lda <fname1
 sta iocb+4,x
 lda >fname1
 sta iocb+5,x
 lda #4
 sta iocb+10,x
 lda #0
 sta iocb+11,x
 jsr ciomain

 lda #7
 sta iocb+2,x
 lda <buffer
 sta iocb+4,x
 lda >buffer
 sta iocb+5,x
 lda #255
 sta iocb+8,x
 sta iocb+9,x
 jsr ciomain

 lda iocb+8,x
 sta len
 lda iocb+9,x
 sta len+1

 lda #12
 sta iocb+2,x
 jsr ciomain

 jsr $f2fd
 jsr neguj

 ldx #16
 lda #3
 sta iocb+2,x
 lda <fname2
 sta iocb+4,x
 lda >fname2
 sta iocb+5,x
 lda #8
 sta iocb+10,x
 lda #0
 sta iocb+11,x
 jsr ciomain

 lda #11
 sta iocb+2,x
 lda <buffer
 sta iocb+4,x
 lda >buffer
 sta iocb+5,x
 lda len
 sta iocb+8,x
 lda len+1
 sta iocb+9,x
 jsr ciomain

 lda #12
 sta iocb+2,x
 jmp ciomain

neguj   equ *

 lda <buffer
 clc
 adc len
 sta koniec
 lda >buffer
 adc len+1
 sta koniec+1

*szukanie poczatku

 lda <buffer
 sta adr1
 sta adr2
 lda >buffer
 sta adr1+1
 sta adr2+1

searbeg  equ *

 ldy #255

sbe1     equ *

 iny
 cpy #18
 bcs searend
 lda (adr1),y
 cmp begin,y
 beq sbe1
 inc adr1
 bne *+4
 inc adr1+1
 bne searbeg
 pla
 pla
 rts

searend  equ *

 ldy #255

sen1     equ *

 iny
 cpy #17
 bcs foundend
 lda (adr2),y
 cmp finish,y
 beq sen1
 inc adr2
 bne *+4
 inc adr2+1
 bne searend
 pla
 pla
 rts

foundend equ *

 lda adr1
 clc
 adc #18
 sta adr1
 lda adr1+1
 adc #0
 sta adr1+1

foundlop equ *

 ldy #0
 lda (adr1),y
 eor #17
 sta (adr1),y
 inc adr1
 bne *+4
 inc adr1+1

 lda adr1+1
 cmp adr2+1
 bcc foundloop
 lda adr1
 cmp adr2
 bcc foundloop
 rts


fname1   dta c'D:HK_MAIN.OBJ',b($9b)
fname2   dta c'D:HK_MAIN.COM',b($9b)

len      dta a(0)
koniec   dta a(0)

begin    dta d'Written by:D.Zolna'
finish   dta d'D.Zolna is De Jet'

 end

