amp  equ $9200

*  v1.1  Janusz Pelc

*  play song   A:00     X:song #
*  play song   A:10     X:song pos
*  sound       A:20+ch# X:note Y:inst#
*  set tempo   A:30     X:val
*  sound off   A:40
*  abort play  A:50
*  continue    A:60
*  init        A:70     X,Y dataadr

     opt h+

********************

* page 0

z0       equ $fc
addr     equ z0+00 ;+01
hlp      equ z0+02 ;+03

* system

audf     equ $d200
audctl   equ $d208
skctl    equ $d21f

* program

nor      equ 0
vib      equ 1
*        equ 2
bas      equ 3
dbl      equ 4
syn      equ 5
syn2     equ 6
bass     equ 7

t1stop   equ $8f
t1jump   equ $9f
t1jmpup  equ $af
t1jmpdw  equ $bf
t1tempo  equ $cf
t1repeat equ $df
t1begin  equ $ef

songln   equ $53

********************

     org amp

amp_     jmp _amp
amplay_  jmp _amplay

vol      dta d'   '
ptrnpos  dta d' '
songpos  dta d' '

dis      dta d'    '
aud      dta d'     '

freq     dta d'   ' ;type: dis↑↓typ
freq2nd  dta d'   '  ;typ: 0:nor 1:vib
noise    dta d'      '    ;2:??? 3:bas
adsr     dta B($FF),B($FF),B($FF),d'   '    ;4:dbl 5:syn
type     dta d'   '       ;6:syn2
cntr     dta d'   '       ;7:bass

ptrnnum  dta d'   '
ptrnpntr dta d'   '
pauscntr dta d'   '
instnum  dta d'   '
trackon  dta d'    '

rptfrom  dta d' '
rptto    dta d' '
rptcntr  dta d' '

Asav     dta d' '
Xsav     dta d' '
Ysav     dta d' '

tempo    dta d'  '
dataadr  dta d'  '


********************

_amp equ *

     sta Asav
     stx Xsav
     sty Ysav

     and #$70
     lsr @
     lsr @
     lsr @
     tax
     lda proctab,x
     sta call+1
     lda proctab+1,x
     sta call+2

     lda #3
     sta skctl

     ldy Ysav
     ldx Xsav
     lda Asav
call jmp *

proctab equ *
     dta a(_song)
     dta a(_sngp)
     dta a(_inst)
     dta a(_temp)
     dta a(_soff)
     dta a(_stop)
     dta a(_cont)
     dta a(_init)

********************

_song equ *

     lda dataadr
     sta addr
     ldy dataadr+1
     iny
     iny
     sty addr+1

     ldy #0
     txa
     beq _sngp

sso1 lda (addr),y
     cmp #t1stop
     beq *+6
     cmp #t1begin
     bne sso2

     dex
     bne sso2
     iny
     cpy #songln+1
     bcs ssox
     tya
     tax
     bpl _sngp ;-jmp

sso2 iny
     cpy #songln+1
     bcc sso1
ssox rts


_sngp equ *

     stx songpos
     lda #0
     ldx #2
ison sta ptrnpntr,x
     sta pauscntr,x
     sta trackon,x
     dex
     bpl ison
     sta ptrnpos
     sta trackon+3

     lda dataadr
     sta addr
     lda dataadr+1
     sta addr+1
     ldy #$ff
     sty rptto

     lda (addr),y
     sta tempo
     sta tempo+1
     rts



_temp equ *
     stx tempo
     stx tempo+1
     rts


_init equ *

     stx dataadr
     stx addr
     sty dataadr+1
     sty addr+1

     ldy #$ff
     lda (addr),y
     sta tempo
     sta tempo+1

     ldx #3
     stx skctl


_soff equ *

     ldy #8
sof1 lda #0
     sta audf,y
     cpy #3
     bcs sof2
     sta vol,y
     lda #$ff
     sta adsr,y
sof2 dey
     bpl sof1


_stop equ *

     lda #$80
sto1 ldx #3
     sta trackon,x
     dex
     bpl *-4
     rts


_cont equ *

     lda #0
     beq sto1 ;-jmp


_inst equ *

     lda Asav
     and #3
     tax
     lda #$80
     sta trackon,x

     ldy Ysav
     lda Xsav


_sound equ *

     sta Asav
     sty Ysav

     clc
     lda dataadr
     adc <$a0
     sta addr
     lda dataadr+1
     adc >$a0
     sta addr+1

     lda #0
     sta cntr,x    ;!

     tya
     asl @
     adc Ysav
     tay
     sty Ysav

     lda (addr),y
     and #$f0
     sta adsr,x    ;!

     ldy Ysav
     iny
     lda (addr),y
     sta type,x    ;!


     ldy #0
     and #$07

     cmp #bas
     bne *+4
     ldy #2

     cmp #bass
     bne *+4
     ldy #4



     lda tabtab,y
     sta hlp
     lda tabtab+1,y
     sta hlp+1

     ldy Ysav
     iny
     iny
     lda (addr),y
     lsr @
     lsr @
     lsr @
     lsr @
     clc
     adc Asav
     sta Asav
     tay

     lda type,x
     and #$07
     cmp #bass
     bne snd0
     tya
     asl @
     tay
     lda (hlp),y
     sta freq,x    ;!
     iny
     sty Asav
     jmp snd1

snd0 lda (hlp),y
     sta freq,x    ;!

     ldy Ysav
     iny
     iny
     lda type,x
     and #$07
     cmp #vib
     php
     lda (addr),y
     and #$0f
     plp
     bne *+10
     cmp #$0f
     bne *+6
     lda #$ff
     bne snd2 ;-jmp

     clc
     adc Asav
     sta Asav

snd1 ldy Asav
     lda type,x
     and #$07
     cmp #syn
     php
     lda (hlp),y
     plp
     beq snd2
     cmp freq,x
     bne snd2
     sec
     sbc #1
snd2 sta freq2nd,x ;!

     ldy Ysav
     lda (addr),y
     and #$03
     tay
     lda noistab,y
     cpy #3
     bne *+5
     lda freq,x
     sta noise,x   ;!
     lda noistab+4,y
     sta noise+3,x

     rts


tabtab equ *
 dta a(nortab),a(bastab),a(basstab)


********************

_amplay equ *

     lda addr
     pha
     lda addr+1
     pha
     lda hlp
     pha
     lda hlp+1
     pha

     lda trackon+3
     beq *+5
     jmp plas

     lda tempo
     cmp tempo+1
     beq *+5
     jmp dect

     lda ptrnpos
     beq *+5
     jmp nxtsound

     ldx #2
     lda #0
pso1 ldy trackon,x
     bmi *+5
     sta trackon,x
     sta ptrnpntr,x
     dex
     bpl pso1

     lda dataadr
     sta addr
     ldx dataadr+1
     inx
     inx
     stx addr+1

     lda #1
     sta fbgcntr

     ldy songpos
pso2 cpy rptto
     bne nrpt
     lda rptcntr
     beq nrpt

     lda songpos
     ldy rptfrom
     sty songpos
     dec rptcntr
     bne pso2

     sta songpos
     tay
     bpl pso2 ;-jmp

nrpt ldx #$ff
     stx hlp
     inx
pso3 lda (addr),y
     sta ptrnnum,x
     and hlp
     sta hlp
     clc
     tya
     adc #songln+2
     tay
     inx
     cpx #3
     bcc pso3

     lda hlp
     cmp #$ff
     bne ftst
     ldy songpos
     iny
     sty songpos
     bpl pso2 ;-jmp

ftst ldy songpos
     lda (addr),y
     bpl nxtsound
     cmp #$ff
     beq nxtsound

     lsr @
     lsr @
     lsr @
     and #$0e
     tax
     lda funatab,x
     sta func+1
     lda funatab+1,x
     sta func+2
     lda ptrnnum+1
     sta hlp
func jsr *
     sty songpos
     bcc pso2
     jmp _amplex

nxtsound jmp nxts


funatab equ *
 dta a(_fstop)
 dta a(_fjump)
 dta a(_fjmpup)
 dta a(_fjmpdw)
 dta a(_ftempo)
 dta a(_frepeat)
 dta a(_fbegin)


_fstop equ *

     jsr _stop
     sec
     rts


_fjump equ *

     lda hlp
     tay

corY equ *

     cpy #songln+1
     bcc *+5
     ldy songpos
     rts

     lda (addr),y
     cmp #$ff
     rts

_fjmpup equ *

     sec
     tya
     sbc hlp
     tay
     jmp corY


_fjmpdw equ *

     clc
     tya
     adc hlp
     tay
     jmp corY

_ftempo equ *

     lda hlp
     sta tempo
     sta tempo+1
     iny
     clc
     rts

_frepeat equ *

     iny
     sty rptfrom

     clc
     tya
     adc hlp
     sta rptto

     lda ptrnnum+2
     sta rptcntr
     jmp corY

fbgcntr dta d' '
_fbegin equ *


     dey
     bmi fbex

     lda (addr),y
     cmp #t1stop
     beq fbex

     cmp #t1begin
     bne _fbegin

fbex iny
     clc

     dec fbgcntr
     beq *+3
     sec
     rts


********************

nxts equ *

     ldx #2
nxs1 lda pauscntr,x
     beq *+7
     dec pauscntr,x
     bpl nxsc ;-jmp

     lda trackon,x
     bne nxsc

     ldy ptrnnum,x
     bmi nxsc

     lda dataadr
     sta addr
     lda dataadr+1
     sta addr+1

     lda (addr),y
     sta hlp
     clc
     tya
     adc #$50
     tay
     lda (addr),y
     sta hlp+1

nxs2 ldy ptrnpntr,x
     lda (hlp),y

     and #$c0
     bne nxs3

     lda (hlp),y   ;-inst
     and #$3f
     sta instnum,x
     inc ptrnpntr,x
     bpl nxs2 ;-jmp

nxs3 cmp #$40
     bne nxs4

     lda (hlp),y   ;-note
     and #$3f
     ldy instnum,x
     jsr _sound
     jmp nxs5

nxs4 cmp #$80
     bne nxsc

     lda (hlp),y
     and #$3f      ;-paus
     sta pauscntr,x
nxs5 inc ptrnpntr,x

nxsc dex
     bpl nxs1

     ldx ptrnpos
     inx
     txa
     and #$3f
     sta ptrnpos

dect dec tempo+1
     bne plas
     lda tempo
     sta tempo+1

     lda ptrnpos
     bne plas
     inc songpos

plas equ *

     ldy freq2nd
     lda type
     and #$07
     cmp #syn
     beq *+6
     cmp #syn2
     bne *+3
     dey
     sty aud+3


     ldy #$00

     cmp #syn
     beq *+6
     cmp #syn2
     bne *+4
     ldy #$02

     cmp #bass
     bne *+4
     ldy #$28
     sty aud+4


     ldx #2
pls1 equ *


     lda type,x
     and #$e0
     sta dis,x


     lda dataadr
     sta addr
     ldy dataadr+1
     iny
     sty addr+1

     lda adsr,x
     and #$0f
     cmp #$0f
     bne svol


     lda adsr+3,x
     beq sfrq
     dec adsr+3,x
     lda adsr+3,x
     bne sfrq

     ldy vol,x
     beq *+3
     dey
     tya
     sta vol,x

     ldy adsr,x
     lda (addr),y
     sta adsr+3,x

     dey
     bne sfrq


svol ldy adsr,x
     lda (addr),y
     and #$0f
     sta vol,x

sfrq ldy freq,x
     lda type,x
     and #7
     cmp #vib
     bne novi

     dey
     tya
     iny
     cmp freq2nd,x
     php
     lda #1
     plp
     bne *+4
     asl @
     asl @

     and cntr,x
     beq novi

     ldy freq2nd,x
     cpy #$ff
     bne novi
     lda #0
     sta vol,x

novi tya
     sta aud,x

     ldy adsr,x
     lda (addr),y
     bpl iads
     tya
     and #$0f
     cmp #$0f
     beq iads
     lda noise,x
     sta aud,x
     dex
     bpl *+10
     sta aud+3
     lda #0
     sta aud+4
     inx
     lda noise+3,x
     sta dis,x


iads lda adsr,x
     and #$0f
     cmp #$0f
     beq icnt

     inc adsr,x
     lda adsr,x
     and #$0f
     cmp #$0f
     bne icnt

     ldy adsr,x
     lda (addr),y
     sta adsr+3,x

icnt lda trackon,x
     bpl icn1
     lda vol,x
     bne icn1
     lda #$40
     sta trackon,x

icn1 inc cntr,x

     ldy #0
     lda type,x
     lsr @
     lsr @
     lsr @
     lsr @
     bcc *+3
     dey
     lsr @
     bcc *+3
     iny

     clc
     tya
     adc freq,x
     sta freq,x

     lda freq2nd,x
     cmp #$ff
     bne *+4
     ldy #0
     clc
     tya
     adc freq2nd,x
     sta freq2nd,x

     dex
     bmi *+5
     jmp pls1


     lda dis
     sta dis+3
     lda vol


     lda type
     and #7
     ldy #3

     cmp #dbl
     bne *+4
     ldy #7

     cmp #syn
     bne *+4
     ldy #11

     cmp #syn2
     bne *+4
     ldy #15

     cmp #bass
     bne *+4
     ldy #19


saud tya
     pha
     lda atab,y
     php
     and #$7f
     tax

     tya
     and #$03
     asl @
     tay

     lda aud,x
     sta audf,y
     lda vol,x
     cpx #3
     bne *+5
     lda vol
     ora dis,x
     plp
     bpl *+4
     lda #0
     sta audf+1,y

     pla
     tay
     dey
     and #$03
     bne saud

     lda aud+4
     sta audctl
     clc

_amplex equ *

     pla
     sta hlp+1
     pla
     sta hlp
     pla
     sta addr+1
     pla
     sta addr
     rts


atab equ *
     dta d' !"',B($83) ;nor vib bas
     dta d' !"#' ;dbl
     dta d'! "',B($83) ;syn
     dta d'! "#' ;syn2
     dta d'!"',B($80),d'#' ;bass

********************

nortab   equ *


 dta B($FF),B($F1),B($E4),B($D7),B($CB),B($C0),B($B5),B($AA),B($A1),B($98),B($8F),B($87)
 dta B($7F),c'xrke_ZUPKGC'
 dta c'?<852/,*''%#!'
 dta B($1F),B($1D),B($1C),B($1A),B($18),B($17),B($16),B($14),B($13),B($12),B($11),B($10)
 dta B($0F),B($0E),B($0D),B($0C),B($0B)
      dta d'*)(''&%$'
 dta d'#"!  '

bastab   equ *

 dta B($00),B($00),B($00),B($00),B($F2),B($E9),B($DA),B($CE),B($BF),B($B6),B($AA),B($A1)
 dta B($98),B($8F),B($89),B($80),c'zqke_',B($00),c'VP'
 dta c'g`ZUQLHC?=94'
 dta c'39-*(%$!',B($1F),B($1E),B($00),B($00)

 dta B($0F),B($0E),B($0D),B($0C),B($0B)
      dta d'*)(''&%$'
 dta d'#"!  '


basstab  equ *

 dta c'8',B($0B),B($8C),B($0A),B($00),B($0A),c'j',B($09),B($E8),B($08),c'j',B($08),B($EF),B($07),B($80),B($07),B($08),B($07),B($AE),B($06),c'F',B($06),B($E6),B($05)
 dta B($95),B($05),c'A',B($05),B($F6),B($04),B($B0),B($04),c'n',B($04),c'0',B($04),B($F6),B($03),B($BB),B($03),B($84),B($03),c'R',B($03),c'"',B($03),B($F4),B($02)
 dta B($C8),B($02),B($A0),B($02),c'z',B($02),c'U',B($02),c'4',B($02),B($14),B($02),B($F5),B($01),B($D8),B($01),B($BD),B($01),B($A4),B($01),B($8D),B($01),c'w',B($01)
 dta c'`',B($01),c'N',B($01),c'8',B($01),c'''',B($01),B($15),B($01),B($06),B($01),B($F7),B($00),B($E8),B($00),B($DB),B($00),B($CF),B($00),B($C3),B($00),B($B8),B($00)
 dta B($AC),B($00),B($A2),B($00),B($9A),B($00),B($90),B($00),B($88),B($00),B($7F),B($00),c'x',B($00),c'p',B($00),c'j',B($00),c'd',B($00),c'^',B($00),c'W',B($00),c'R',B($00),c'2',B($00),B($0A),B($00)

noistab  equ *

 dta B($00),B($01),c'5?'
 dta d' ',B($80),B($80),B($A0)


     end AvMusPlayer

