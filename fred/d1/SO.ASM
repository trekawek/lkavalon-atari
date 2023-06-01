* A  - parametr
* 80 - inicjaliz.
* 00 - 0f dzwiek
* 10 - 1f powtarzany
*
*  dzwiek 1x mozna
*   przerwac A=3x
*
* ff w probce=koniec

 
 icl 'd1/COMMON.ASM'

testso equ $480
setvb  equ $e45c
vbexit equ $e462
audc   equ $d200
;••••••••••••••••••••
 
 opt o-
 org testso
 lda #$80
 jsr sound

tloop equ *
 ldx #11
 lda pntrs,x
 sta $bc40,x
 dex
 bpl *-7
 ldx 764
 cpx #$ff
 beq tloop
 lda #$ff
 sta 764

 sec
 lda $fb51,x
 sbc #'a'
 and #$0f
 sta shlp
 lda $d01f ;- START=powtarzanie
 asl @
 asl @
 asl @
 asl @
 eor #$30
 and #$30
 ora shlp
 jsr sound
 jmp tloop


;••••••••••••••••••••

 opt h+ o+
 org sound
 bpl setso

* inicjalizuj POKEY

moco equ *
 lda #1
 bne cont
 lda muso
 beq rts

cont equ *
 lsr moco+1

 ldx #7
inip lda #0
 sta pntrs,x
 sta audc,x
 sta temps,x
 dex
 bpl inip

 sta $d208
 lda #$03
 sta $d20f

 lda #$60
 sta *-2

 lda #$70
 ldx <song
 ldy >song
 jsr amp

 lda #$00
 tax
 jsr amp

 lda #7
 ldy <play
 ldx >play
 jmp setvb



setso ldx #0
 stx soff
 asl @
 asl @
 asl @
 ror soff
 asl @
 sta snum
 bcc nrpt      ;-jezeli nie powt

 ldx #3        ;-jest juz taki?
 lda pntrs,x
 and #$f0
 cmp snum
 bne *+7
 ldy temps+4,x
 bmi offt
 dex
 bpl *-16

 bit soff
 bmi offt
 jsr nrpt
 lda temps+4,x ;-ustaw powtarzanie
 ora #$80
 sta temps+4,x
rts equ *
 rts


nrpt equ *
 ldx #3        ;-przerwac powt?
 lda pntrs,x
 and #$f0
 cmp snum
 bne *+7
 ldy temps+4,x
 bmi stprpt
 dex
 bpl *-16

 ldx #3        ;-szukaj wolnego
 lda temps+4,x
 bmi *+7
 lda pntrs,x
 beq sfnd
 dex
 bpl *-11

 lda #$0f      ;-szuk najd grajacego
 tay
 sta shlp
 ldx #3
sers equ *
 lda temps+4,x
 bmi *+17
 lda pntrs,x
 and #$0f
 cmp shlp
 bcs *+7
 sta shlp
 txa
 tay
 dex
 bpl sers

 cpy #4
 bcs sex
 tya
 tax

sfnd equ *     ;-ust par dzwieku
 lda snum
 lsr @
 lsr @
 lsr @
 lsr @
 tay
 lda tmptab,y
 sta temps,x
 sta temps+4,x
 lda snum
 ora #$0f
 sta pntrs,x
sex rts

offt bit soff
 bpl sex

stprpt lda #1  ;-zatrzym powt
 sta temps,x
 lda #0
 sta temps+4,x
 sta pntrs,x
 rts


* procedura grajaca

muso dta d' '
logo dta b($04)

play equ *

 lda $d01f
 and #$04
 cmp logo
 beq noch

 sta logo
 cmp #$04
 beq noch

 lda muso
 eor #$01
 sta muso

 cmp #1
 beq inis

 lda #$70
 ldx <song
 ldy >song
 jsr amp

 lda #$00
 tax
 jsr amp

 jmp vbexit


inis equ *


 lda #$80
 jsr sound
 jmp vbexit


noch equ *

 lda muso
 bne soso
 jsr amp+3
 jmp vbexit

soso equ *
 ldx #3
plop equ *
 lda temps,x
 beq slnt
 jsr samp
 lda #0
 bcs slnt
 dec temps,x
 bne pcnt
 lda temps+4,x
 and #$0f
 sta temps,x
 lda pntrs,x
 and #$0f
 bne pinc
 ldy temps+4,x
 bmi cntrpt
stop equ *
 sta pntrs,x
 sta temps,x
 sta temps+4,x
 bpl pcnt
pinc dec pntrs,x
pcnt dex
 bpl plop
 jmp vbexit

cntrpt lda pntrs,x ;-powtarzaj
 ora #$0f
 sta pntrs,x
 lda temps+4,x
 and #$0f
 sta temps,x
 bne pcnt ;-jmp

slnt equ *         ;-wycisz
 lda temps+4,x
 bmi cntrpt
 txa
 asl @
 tay
 lda #0
 sta audc,y
 sta audc+1,y
 beq stop


samp equ *     ;-odtw dzwiek z probki
 lda #0
 sta vhlp
 lda pntrs,x
 asl @
 ror vhlp
 tay
 txa
 asl @
 tax
 sec
 lda sndtab,y
 bit vhlp
 bpl *+5
 lda sndtab+$100,y
 cmp #$ff
 beq sams
 clc
 sta audc+1,x
 lda sndtab+1,y
 bit vhlp
 bpl *+5
 lda sndtab+$101,y
 sta audc,x
sams php
 txa
 lsr @
 tax
 plp
 rts


shlp  dta d'  '
snum  dta d' '
vhlp  dta d' '
soff  dta d' '
pntrs dta d'    '
temps dta d'        '

tmptab dta d'"!!!!"!"$!!###!!' ;0-127
sndtab equ *

* dynamit

 DTA A($1601)
 DTA A($1601)
 DTA A($1601)
 DTA A($1602)
 DTA A($1602)
 DTA A($1602)
 DTA A($1603)
 DTA A($1603)
 DTA A($1604)
 DTA A($1604)
 DTA A($1605)
 DTA A($1605)
 DTA A($1606)
 DTA A($1606)
 DTA A($1607)
 DTA A($1608)

* tlok

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($00ff)
 DTA A($07a1)
 DTA A($08a2)
 DTA A($09a3)


* kamienie

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($00ff)
 DTA A($0101)
 DTA A($10a2)
 DTA A($0281)
 DTA A($12a3)
 DTA A($0302)
 DTA A($14a4)
 DTA A($0483)
 DTA A($16a3)
 DTA A($0502)

* plum


 DTA A($d6a1)
 DTA A($0fa1)
 DTA A($52a1)
 DTA A($7da2)
 DTA A($3ba2)
 DTA A($0aa2)
 DTA A($c3a3)
 DTA A($10a3)
 DTA A($25a3)
 DTA A($84a3)
 DTA A($6aa4)
 DTA A($a5a4)
 DTA A($32a4)
 DTA A($02a5)
 DTA A($87a5)
 DTA A($23a5)


* odliczanie

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($00ff)
 DTA A($08a1)
 DTA A($08c4)

* czapka

 DTA A($10a1)
 DTA A($0000)
 DTA A($0000)
 DTA A($20a1)
 DTA A($0000)
 DTA A($0000)
 DTA A($10a2)
 DTA A($0000)
 DTA A($0000)
 DTA A($20a2)
 DTA A($0000)
 DTA A($0000)
 DTA A($10a4)
 DTA A($0000)
 DTA A($0000)
 DTA A($20a4)

* tarcza

 DTA A($afa1)
 DTA A($aea1)
 DTA A($afa1)
 DTA A($aea2)
 DTA A($ada2)
 DTA A($afa2)
 DTA A($aea3)
 DTA A($ada3)
 DTA A($aca3)
 DTA A($aea3)
 DTA A($ada4)
 DTA A($aca4)
 DTA A($aba4)
 DTA A($aca5)
 DTA A($aba5)
 DTA A($aaa5)

* buty

 DTA A($0000)
 DTA A($0002)
 DTA A($0000)
 DTA A($1003)
 DTA A($0000)
 DTA A($0002)
 DTA A($0000)
 DTA A($3003)
 DTA A($0000)
 DTA A($0002)
 DTA A($0000)
 DTA A($1003)
 DTA A($0000)
 DTA A($0002)
 DTA A($0000)
 DTA A($3003)

* zebr spraya

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($00ff)
 DTA A($21a1)
 DTA A($22a2)
 DTA A($23a4)
 DTA A($24a5)
 DTA A($25a5)
 DTA A($26a5)
 DTA A($27a5)
 DTA A($28a4)
 DTA A($29a3)
 DTA A($2aa2)
 DTA A($2ba1)

* sprayowanie

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($00ff)
 DTA A($0301)
 DTA A($0001)

* kamien

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($00ff)
 DTA A($aac1)
 DTA A($aac3)

* zabiciesie

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($00ff)
 DTA A($0001)
 DTA A($f0a1)
 DTA A($e8a1)
 DTA A($dea1)
 DTA A($d4a2)
 DTA A($cea2)
 DTA A($c6a2)
 DTA A($bea3)
 DTA A($b6a3)
 DTA A($b0a4)

* nowy poziom

 DTA A($0ca1)
 DTA A($18a2)
 DTA A($0ca3)
 DTA A($18a4)
 DTA A($0ca5)
 DTA A($18a6)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($10a1)
 DTA A($21a2)
 DTA A($10a3)
 DTA A($21a4)
 DTA A($10a5)
 DTA A($21a6)

* new life

 DTA A($55a8)
 DTA A($38a7)
 DTA A($55a6)
 DTA A($38a5)
 DTA A($55a4)
 DTA A($38a4)
 DTA A($55a3)
 DTA A($38a3)
 DTA A($55a2)
 DTA A($38a2)
 DTA A($55a2)
 DTA A($38a1)
 DTA A($55a1)
 DTA A($38a1)
 DTA A($55a1)
 DTA A($38a1)

* zmiana broni

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($00ff)
 DTA A($10a2)
 DTA A($80a2)
 DTA A($08a3)

* wybuszek

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($00ff)
 DTA A($0601)
 DTA A($0802)
 DTA A($1085)

     end

