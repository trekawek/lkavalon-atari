begn equ $be80
scrn equ $a010

 opt h+

 org begn
 jmp cont

cols dta b($f8),b($c4),b($0c),b($f8),d' '

dl   dta d'ppP',b($4e),a(scrn)
 dta d'...............................'
 dta d'................................'
 dta d'................................'
 dta d'......',b($4e),a(scrn+$ff0)
 dta d'...........................'
 dta d'................................'
 dta d'..............................'
 dta d'P',b($44),a(mess),b($41),a(dl)

cont equ *

 lda <dl
 sta 560
 lda >dl
 sta 561

 ldx #4
 lda cols,x
 sta 708,x
 dex
 bpl *-7

 lda #0
 tax
 sta $bc20,x
 dex
 bne *-4

 lda #$22
 sta 559

 lda 20
 cmp 20
 beq *-2

 rts

mess dta d' (C) 1990 Avalon      rys.Marek Siewior '*

endp equ *

 org $2e2
 dta a(begn)

 end

