 opt h+
 org $1e00

init     equ *

 lda #33
 sta 559
 lda <newdl
 sta 560
 lda >newdl
 sta 561
 lda #$02
 sta 708
 lda #$04
 sta 709
 lda #$00
 sta 710
 sta 712
 sta 65
 lda #$0a
 sta 711
 lda #$1c
 sta 756
 lda 20
 cmp 20
 beq *-2
 rts

newdl    equ *

 dta d'ppppppppp'
 dta b($44),a(screen)
 dta d'$ ""'
 dta b($41),a(newdl)

screen   equ *

 dta d'        !"#$%&#$  ''()*+,-.      '*;*
 dta d'        /0123412  56789:;<      '*;*
 dta d'         >? @ABCDEF GHIJK       '
 dta d'         L MNNO PQRSTUVWX       '

 org $02e2
 dta a(init)


