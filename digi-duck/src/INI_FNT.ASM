 opt h+
 org $b000

iocb     equ $340
ciomain  equ $e456

 ldx #16
 lda #3
 sta iocb+2,x
 lda <fname
 sta iocb+4,x
 lda >fname
 sta iocb+5,x
 lda #4
 sta iocb+10,x
 lda #0
 sta iocb+11,x
 jsr ciomain

 ldx #16
 lda #7
 sta iocb+2,x
 lda <buffer
 sta iocb+4,x
 lda >buffer
 sta iocb+5,x
 lda <486
 sta iocb+8,x
 lda >486
 sta iocb+9,x
 jsr ciomain

 ldx #16
 lda #12
 sta iocb+2,x
 jsr ciomain

 jsr $f2fd

 lda <$1c00+479
 sta buffer+4
 lda >$1c00+479
 sta buffer+5

 ldx #16
 lda #3
 sta iocb+2,x
 lda <fname
 sta iocb+4,x
 lda >fname
 sta iocb+5,x
 lda #8
 sta iocb+10,x
 lda #0
 sta iocb+11,x
 jsr ciomain

 ldx #16
 lda #11
 sta iocb+2,x
 lda <buffer
 sta iocb+4,x
 lda >buffer
 sta iocb+5,x
 lda <486
 sta iocb+8,x
 lda >486
 sta iocb+9,x
 jsr ciomain

 ldx #16
 lda #12
 sta iocb+2,x
 jmp ciomain

fname    dta c'D:INIT.FNT',b($9b)

buffer   org *+500

 end


