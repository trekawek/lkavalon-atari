DES  EQU $E2 ;A3
memlo equ $2e7

     opt h+

     ORG $2E0
     DTA A(INIT)


     ORG $600

init equ *
     SEC
     LDA MEMLO
     SBC #1
     STA DES
     LDA MEMLO+1
     SBC #0
     STA DES+1

SERC LDY #0
SER  LDA (DES),Y
     CMP SUK,Y
     BNE DECC
     INY
     CPY #3
     BNE SER

     JMP FND

DECC EQU *

     LDA DES
     BNE *+4
     DEC DES+1
     DEC DES

     LDA DES+1
     CMP #6   ;<<<<<<
     BNE SERC

*<<<<<<<<<<<<<<<<<<<

FND  EQU *

     ldy #12
ccpp lda buff-12,y
     beq eend
     ldx #$ff
     inx
     cmp $fb51,x
     bne *-4
     txa
     sta (des),y
     inc ptr
     iny
     cpy #40+12
     bcc ccpp

eend equ *
     lda ptr
     ldy #12+40
     sta (des),y
     rts

suk  dta c'SUK'

BUFF EQU *

 DTA c'qa'
     dta b($9b)
 DTA c'!flgr'
     dta b($9b)
 DTA c'aflfr'
     dta b($9b)
 dta c'aflci'
     dta b($9b)
 dta c'aflso'
     dta b($9b)
 dta c'aflti'
     dta b($9b)
 dta c'afqlf'
     dta b($9b)
     dta b(0)

PTR  DTA D' '

     end

