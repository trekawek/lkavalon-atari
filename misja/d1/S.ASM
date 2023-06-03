* A  - parametr
* 80 - inicjaliz.
* 00 - 0f dzwiek
* 10 - 1f powtarzany
*
*  dzwiek 1x mozna
*   przerwac A=0x
*
* ff w probce=koniec

testso equ $480
setvb  equ $e45c
vbexit equ $e462
audc   equ $d200

 icl 'd1/JOINT.ASM'
*opt   equ %010101
*sound equ $a000

;••••••••••••••••••••

 opt h- o-
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
 eor #$10
 and #$10
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



setso asl @
 asl @
 asl @
 asl @
 sta snum
 bcc nrpt      ;-jezeli nie powt

 ldx #3        ;-jest juz taki?
 lda pntrs,x
 and #$f0
 cmp snum
 bne *+7
 ldy temps+4,x
 bmi sex
 dex
 bpl *-16

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
pntrs dta d'    '
temps dta d'        '

tmptab dta d'!"!!!"!"!!#!$!#!' ;0-127
sndtab equ *

*

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
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)

* wybuch

 DTA A($0000)
 DTA A($0000)
 DTA A($00ff)
 DTA A($1601)
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


* chodzenie

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
 DTA A($0000)
 DTA A($00ff)
 DTA A($0181)

* helikopter

 DTA A($1008)
 DTA A($3102)
 DTA A($3202)
 DTA A($3002)
 DTA A($1008)
 DTA A($3102)
 DTA A($3202)
 DTA A($3002)
 DTA A($1008)
 DTA A($3102)
 DTA A($3202)
 DTA A($3002)
 DTA A($1008)
 DTA A($3102)
 DTA A($3202)
 DTA A($3002)

* zegar

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
 DTA A($0000)
 DTA A($00ff)
 DTA A($03c2)

* rakieta

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
 DTA A($0ca1)
 DTA A($0da1)
 DTA A($0fa2)
 DTA A($10a2)

* zestrzelenie

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
 DTA A($04a1)
 DTA A($0501)
 DTA A($06a2)
 DTA A($0702)
 DTA A($08a2)

* energia

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($00ff)
 DTA A($31a1)
 DTA A($32a1)
 DTA A($33a1)
 DTA A($34a1)
 DTA A($35a1)
 DTA A($36a1)
 DTA A($37a1)

* strzal

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
 DTA A($0c81)
 DTA A($0a81)
 DTA A($0483)

* strzal dzial

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($00ff)
 DTA A($b0a1)
 DTA A($a0a1)
 DTA A($90a1)
 DTA A($80a2)
 DTA A($70a2)
 DTA A($60a2)
 DTA A($50a2)
 DTA A($40a2)
 DTA A($30a2)


* otw zapory

 DTA A($3ea1)
 DTA A($40a1)
 DTA A($3fa2)
 DTA A($41a2)
 DTA A($40a3)
 DTA A($42a3)
 DTA A($41a4)
 DTA A($43a4)
 DTA A($42a5)
 DTA A($44a5)
 DTA A($42a6)
 DTA A($44a6)
 DTA A($42a7)
 DTA A($44a5)
 DTA A($42a3)
 DTA A($44a1)

* zebr gran

 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($0000)
 DTA A($00ff)
 DTA A($08a4)
 DTA A($0ca4)
 DTA A($10a4)
 DTA A($18a4)
 DTA A($20a4)
 DTA A($28a4)
 DTA A($30a4)
 DTA A($38a4)
 DTA A($40a4)

* zebr uryny

 DTA A($0000)
 DTA A($46a1)
 DTA A($0000)
 DTA A($96a1)
 DTA A($0000)
 DTA A($47a2)
 DTA A($0000)
 DTA A($97a2)
 DTA A($0000)
 DTA A($48a3)
 DTA A($0000)
 DTA A($98a3)
 DTA A($0000)
 DTA A($49a4)
 DTA A($0000)
 DTA A($99a4)

* zebr energii

 DTA A($10a1)
 DTA A($11a3)
 DTA A($12a5)
 DTA A($13a8)
 DTA A($14a8)
 DTA A($15a8)
 DTA A($16a8)
 DTA A($17a8)
 DTA A($18a8)
 DTA A($1aa8)
 DTA A($19a8)
 DTA A($18a7)
 DTA A($17a6)
 DTA A($16a4)
 DTA A($15a3)
 DTA A($14a2)

* zebr nabojow

 DTA A($28a1)
 DTA A($10a1)
 DTA A($29a2)
 DTA A($11a2)
 DTA A($2aa3)
 DTA A($12a3)
 DTA A($2ba4)
 DTA A($13a4)
 DTA A($2ca4)
 DTA A($14a4)
 DTA A($2da4)
 DTA A($15a4)
 DTA A($2ea4)
 DTA A($16a4)
 DTA A($2fa4)
 DTA A($17a4)

* wypuszczanie

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
 DTA A($0102)
 DTA A($0202)
 DTA A($0401)
 DTA A($0601)
 DTA A($0a01)

     end

