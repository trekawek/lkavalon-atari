;◢▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀◣
;| Inicjalizer gry  |
;|   "Hans Kloss"   |
;| ---------------- |
;|                  |
;| 14 th March 1992 |
;|     01:32 am     |
;◥▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄◤

 opt h+
 org $480

 lda #0
 sta 580
 sta $41   ; newton
 lda $d301
 and #2
 beq *+4
 clc
 rts

 lda #33
 sta 559
 lda <newdl
 sta 560
 lda >newdl
 sta 561
 lda #1
 sta 580
 jsr $f2fd
 jmp $e477

newdl    equ *

 dta b($70),b($70),b($70)
 dta b($42),a(napis),b(2)
 dta b($41),a(newdl)

napis    equ *

 dta B($80),B($80),B($B7),B($E3),B($FA),B($F9),B($F4),B($F5),B($EA),B($80),B($FA),B($80),B($F7),B($E3),B($E9),B($F3),B($EE),B($E9),B($E5),B($F4),B($F9),B($ED),B($80),B($AF),B($B0),B($B4),B($A9),B($AF),B($AE),B($81),B($80),B($80)
 dta d'    Nacisnij dowolny klawisz    '

 org $2e2
 dta a($480)

 end

