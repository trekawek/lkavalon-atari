;◢▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀◣
;|  Loader do gry   |
;|   "Hans Kloss"   |
;| ---------------- |
;|                  |
;| 09 th March 1992 |
;|     01:07 am     |
;◥▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄◤

 opt h+
 org $480

newdl    equ *

 dta b($70),b($70),b($70)
 dta b($70),b($70),b($70)
 dta b($70),b($70),b($70)
 dta b($44),a(grafika)
 dta b($04),b($04),b($04)
 dta b($41),a(newdl)

grafika  equ *

 dta d'  ',B($52),B($53),d'  "#$%&''()  *+,-./()()  ',B($56),B($57),d'  '
 dta d'  rs  ',B($44),B($45),B($46),B($47),B($48),B($49),B($4A),B($4B),d'  ',B($4C),B($4D),B($4E),B($4F),B($50),B($51),B($4A),B($4B),B($4A),B($4B),d'  vw  '
 dta d'  ',B($54),B($55),d'                        ',B($58),B($59),d'  '
 dta d'  tu  01',B($40),B($41),B($42),B($43),d'23456789:;<=>?  xy  '

 org 559
 dta b(33)
 dta a(newdl)

 org 708
 dta b($24)
 dta b($18)
 dta b($0e)

 org 756
 dta b($b8)



