*    HEARTLIGHT    *
*                  *
*    24.11.1990    *
*                  *
*   Janusz  Pelc   *

data equ $7000
font equ $9000
begn equ $9260
scrn equ $9b00
cave equ scrn+960
caby equ cave+$100

; opt equ %100101

; Labels corrected from the disk source spelling.
cavewidth equ cavewidt
fallrant equ fallrandt
soundflag equ soundflg
exlifcntr equ exlifcnt
dspscr equ dspscrn
_lives equ data
_exlif equ data+1
_caves equ data+2
cavesby equ data+3
caves equ data+23

     opt h+
; org $480
; jmp begn

********************

z0       equ $cb
scra     equ z0+00 ; +01
addr     equ z0+02 ; +03
cntr     equ z0+05

x        equ 0 ; z0+04
y        equ 1 ; z0+05

timer    equ $21c
rnd      equ $d21a
vcount   equ $d40b

cavelen  equ 239
cavewidt equ 19
caveheig equ 11

lt       equ 0
rt       equ 1
up       equ 2
dw       equ 3
dwlt     equ 4
dwrt     equ 5

rock     equ ''''
froc1    equ '/'
frock    equ '('
trea     equ '$'
ftrea    equ ')'
bomb     equ '&'
fbom1    equ '-'
fbomb    equ '"'
abomb    equ '+'
hero     equ '*'
grass    equ '.'
wall     equ '#'
wall1    equ '%'
exit     equ '!'
blast    equ '0'

grassnd  equ 1
rocksnd  equ 2
treasnd  equ 3
bombsnd  equ 4

********************

     org begn
     ldx #255
     txs
     jsr init
     jmp cont

dl   dta d'P'
     dta b($45),a(info),d'P'
     dta b($44),a(scrn)
     dta d'$$$$$$$$$$$$$$$$$$$$$$$'
     dta b($41),a(dl)

tidl dta d'pppppppp'
     dta b($47),a(titxt)
     dta d'p&pppp&p'
     dta b($46),a(caby)
     dta b($41),a(tidl)

info     equ *
     dta d'     '*,B($1A),B($1B),d' '*,B($C0),B($C4),d'          '*
     dta d'           '*,B($4A),B($4B),d' '*,B($C0),B($C1),d'    '*

titxt    equ *
     dta d'     HEARTLIGHT     '*
     dta d' autor',B($5A),d' janusz pelc '
     dta d'    autor komnat'*,B($DA),d'   '*


cont jsr getcave
loop jsr animate

     ldy 764
     cpy #$ff
     beq cont1
     lda #$ff
     sta 764
     cpy #$1c
     beq dead ;-jmp

cont1 equ *

     bit exitflag
     bpl nextcave

     lda #hero
     jsr compute
     bne loop

dead equ *

     ldx #0
     lda #abomb
hrm1 ldy cave,x
     cpy #hero
     bne *+5
     sta cave,x
     inx
     cpx #cavelen+1
     bcc hrm1

     lda #64
     sta timer+2
     jsr animate
     lda timer+2
     bne *-6

     dec lives
     lda lives
     cmp #255
     bne *+5
     jmp begn

     jsr convlives
     jmp cont


nextcave equ *

     inc cavenum
     lda cavenum
     cmp _caves
     lda #0
     bcc *+8
     sta cavenum
     sta cavenum+1

     sed
     clc
     lda cavenum+1
     adc #1
     sta cavenum+1
     cld

     dec exlifcntr
     bne cont

     inc lives
     bne *+7
     dec lives
     bne *+5

     jsr convlives

     lda _exlif
     sta exlifcntr

     jmp cont


convlives equ *

     lda #0
     sta lives+1

     ldx lives
     beq covx

cov1 sed
     clc
     lda lives+1
     adc #1
     bcc *+4
     lda #$99
     sta lives+1
     cld
     dex
     bne cov1

covx rts


********************

rockproc equ *

     lda #froc1
     jmp falltest


froc1proc equ *

     lda #frock
     ldy #rock
     jmp fall


frockproc equ *

     lda #rocksnd
     sta scra
     lda #frock
     ldy #rock
     bpl fallrant ;-jmp

treaproc equ *

     lda #ftrea
     jmp falltest

ftreaproc equ *

     lda #treasnd
     sta scra
     lda #ftrea
     ldy #trea


fallrandt equ *

     sta addr
     sty addr+1

     ldy #dw
     jsr test
     bcc frt1

     cmp #hero
     beq fffb
     cmp #fbomb
     beq fffb
     cmp #bomb
     bne frt1

fffb lda #abomb
     sta cave,y
frts lda scra
     jmp sound

frt1 lda addr
     ldy addr+1
     jsr fall
     bcc exix
     bcs frts


bombproc equ *

     lda #fbom1
     jmp falltest


fbom1proc equ *

     lda #fbomb
     ldy #bomb
     jmp fall

fbombproc equ *

     ldy #dw
     jsr test
     bcc fbm1

     pha
     lda #rocksnd
     jsr sound
     pla

     cmp #hero
     bne *+8
     lda #abomb
     sta cave,y
     rts

     cmp #grass
     bne *+6
     lda #bomb
     bne fbmp

     lda #abomb
fbmp sta cave,x
fbmx rts

fbm1 lda #fbomb
     ldy #bomb
     jmp fall


abombproc equ *

     ldy #3
publ tya
     pha
     jsr test
     bmi pub1
     cmp #wall1
     beq pub1
     cmp #bomb
     beq *+6
     cmp #abomb
     bne *+6
     lda #abomb+$80
     bmi *+4 ;-jmp
     lda #blast+$80
     sta cave,y

pub1 pla
     tay
     dey
     bpl publ

     lda #blast+$80 ; +1
     sta cave,x
exix rts



exitproc equ *

     lda treacntr
     bne exix

     lda cntr
     and #4
     php
     lda exitshp
     and #$7f
     plp
     beq *+4
     ora #$80
     sta exitshp
     rts


heroproc equ *

     lda $d300
     cmp #$ff
     beq keyt
     lsr @
     lsr @
     lsr @
     lsr @
     and $d300
     ora #$f0
     bmi movt

keyt lda $d20f
     and #$04
     bne nomo
     ldy $d209
     lda $fb51,y

movt ldy #15
     cmp keytab,y
     beq movh
     dey
     bpl *-6

nomo lda heroshp
     and #$fc
     sta heroshp
     rts

movh tya
     and #3
     tay
     sty moveflag

     cpy #up
     bcs mov1

     lda heroshp
     and #%11110011
     sta addr
     tya
     pha
     adc #1
     asl @
     asl @
     ora addr
     sta heroshp
     jsr push
     pla
     tay

mov1 jsr test
     bcc *+7
     jsr take
     bcs herx

     lda cave,x
     ora #$80
     sta cave,y
     lda #' '
     sta cave,x

herx rts


push equ *

     txa
     pha

     clc
     lda x
     adc dirx,y
     clc
     adc dirx,y
     cmp #cavewidth+1
     bcs pusx

     sty addr
     jsr test
     ldx #frock
     cmp #rock
     beq *+8
     ldx #fbomb
     cmp #bomb
     bne pusx
     stx addr+1

     tya
     tax
     ldy addr
     jsr test
     bcs pusx

     lda cntr
     lsr @
     bcs pusx

     lda #grassnd
     jsr sound

     lda cave,x
     ora #$80
     sta cave,y
     lda #' '
     sta cave,x

pusx pla
     tax
     rts


take equ *

     cmp #trea
     bne tak1

     dec treacntr
     lda #treasnd
     jsr sound
     clc
     rts

tak1 cmp #grass
     bne tak2

     lda #grassnd
     jsr sound
tako clc
     rts

tak2 cmp #exit
     bne tak3

     lda treacntr
     bne tak3

     sta exitflag
     lda #exit
     sta cave,x

     clc
     rts

tak3 sec
takx rts


keytab equ *
     dta b(%11111011)
     dta b(%11110111)
     dta b(%11111110)
     dta b(%11111101)

     dta c'opqa+*-=6987'


********************

falltest equ *

     sta addr

     ldy #dw
     jsr test

     eor #grass
     beq fatx
     eor #grass
     eor #wall1
     beq fatx
     eor #wall1
     eor #hero
     beq fatx
     bcc pufa

     ldy #up
     jsr test
     cmp addr
     beq fatx

     ldy #lt
     jsr test
     bne fatr

     ldy #dwlt
     jsr test
     bcc pufa

fatr ldy #rt
     jsr test
     bne fatx

     ldy #dwrt
     jsr test
     bcc pufa

fatx rts


pufa lda addr
     sta cave,x
     rts


fall equ *

     ora #$80
     sta addr
     sty addr+1

     lda #' '
     sta cave,x

     ldy #dw
     jsr test
     bcs fal1
     bcc falc+1

falc sec
     lda addr
     sta cave,y
     rts

fal1 equ *
     cmp #grass
     beq falx
     cmp #wall1
     beq falx

falt ldy #dwlt
     jsr test
     bcs fart

     ldy #lt
     jsr test
     bcc falc

fart ldy #dwrt
     jsr test
     bcs falx

     ldy #rt
     jsr test
     bcc falc

falx lda addr+1
     sta cave,x
     sec
     rts


********************

test equ *

     clc
     lda x
     adc dirx,y
     cmp #cavewidt+1
     bcc tst1

tout lda #$ff
     rts

tst1 clc
     lda y
     adc diry,y
     cmp #caveheig+1
     bcs tout

     clc
     txa
     adc dirp,y
     tay
     lda cave,y
     and #$7f
     cmp #' '
     clc
     beq *+3
     sec
     rts



*lt, rt, up, dw, dwlt, dwrt

dirx equ *
 dta b(255),b(1),b(0),b(0),b(255),b(1)

diry equ *
 dta b(0),b(0),b(255),b(1),b(1),b(1)

dirp dta b(255)
     dta b(1)
     dta b(255-cavewidt)
     dta b(cavewidt+1)
     dta b(cavewidt)
     dta b(cavewidt+2)

********************

sound equ *

     cmp soundflag
     bcc *+5
     sta soundflag
     rts

playsound equ *

     ldy soundflag
     beq psnx
     dey

     jsr halt

     lda rnd
     and #$0f
     adc #8
     sta freqtab+2


     lda voltab,y
     cpy #bombsnd-1
     bcc psn1
     tya
     ldy #bombsnd-1
     ora voltab,y
psn1 sta $d201

     lda freqtab,y
     sta $d200

     jsr halt

     lda #0
     sta $d201
     sta soundflag

psnx rts


freqtab dta b($00),b($04)
        dta b($00),b($10)
voltab  dta b($81),b($04)
        dta b($a4),b($00)

********************

animate equ *

     ldx #255
     stx moveflag
     stx exitflag
     inx
     stx x
     stx y

anim lda cave,x
     bmi anic

     cmp #blast
     bcc ani1

     pha
     sec
     sbc #blast
     adc #bombsnd-1
     jsr sound
     clc
     pla
     adc #1
     cmp #blast+7
     bcc *+4
     lda #' '
     sta cave,x
     bne anic ;-jmp


ani1 and #$0f
     asl @
     tay
     lda proctab+1,y
     beq anic
     sta call+2
     lda proctab,y
     sta call+1

     txa
     pha
call jsr *
     pla
     tax

anic inc x
     lda x
     cmp #cavewidt+1
     bcc *+8
     lda #0
     sta x
     inc y

     inx
     cpx #cavelen+1
     bcc anim

     ldx #cavelen
     lda cave,x
     and #$7f
     sta cave,x
     dex
     cpx #$ff
     bne *-11

     lda heroshp
     ldy moveflag
     bmi dmhe

     lda heroshp
     eor #2
     bne *+4 ;-jmp

dmhe and #$fe
     sta heroshp

     lda cntr
     and #1
     bne anix

     lda treashp
     eor #$80
     sta treashp
     lda ftreashp
     eor #$80
     sta ftreashp

anix jsr playsound

     lsr 77
     lda 17
     bmi *+5
     jmp begn

     lda timer
     bne *-3
     lda #6
     sta timer
     inc cntr



dspscrn equ *

     ldx #0
     lda <scrn
     sta scra
     lda >scrn
     sta scra+1

dsc1 lda #cavewidt
     sta addr

dlin ldy cave,x
     lda shapetab-$20,y

     ldy #0
     sta (scra),y
     ora #$01
     iny
     sta (scra),y
     ora #$20
     ldy #41
     sta (scra),y
     and #$fe
     dey
     sta (scra),y

     clc
     lda scra
     adc #2
     sta scra
     bcc *+4
     inc scra+1

     inx
     dec addr
     bpl dlin

     clc
     lda scra
     adc #40
     sta scra
     bcc *+4
     inc scra+1

     cpx #cavelen+1
     bcc dsc1

     lda lives+1
     ldy #9
     jsr dspb
     lda cavenum+1
     ldy #35

dspb pha
     jsr dspd
     pla
     lsr @
     lsr @
     lsr @
     lsr @
dspd and #$0f
     clc
     adc #'@'
     sta info,y
     dey
     rts

********************

init equ *

     lda #$e0
     sta 17
     ldx <tidl
     ldy >tidl
     jsr newdl

wait lsr 77
     lda $d20f
     lsr @
     lsr @
     lsr @
     and $d01f
     and $d010
     and $d011
     bne wait

     ldx #0
     stx cavenum
     inx
     stx cavenum+1

     ldy #cavelen
     lda #' '
     sta cave,y
     dey
     cpy #255
     bne *-6

     lda _lives
     sta lives
     jsr convlives
     lda _exlif
     sta exlifcntr
     jsr dspscr


     lda >font
     ldx <dl
     ldy >dl

newdl equ *
     sta 756
     lda #0
     sta $d400
     sta 559

     stx 560
     sty 561

     ldx #19
iiii lda #0
     sta font,x
     lda cavesby,x

     asl @ -atin
     php
     cmp #$c0
     bcs *+8
     sbc #$3e
     bcs *+4
     adc #$c0
     plp
     ror @

     sta caby,x
     dex
     bpl iiii

     jsr halt
     lda #$22
     sta 559

halt lda 20
     cmp 20
     beq *-2
     rts



getcave equ *

     lda <caves
     sta addr
     lda >caves
     sta addr+1
     ldx cavenum
     beq cav0
gcas sec
     lda #cavelen
     adc addr
     sta addr
     bcc *+4
     inc addr+1
     dex
     bne gcas

cav0 lda #$80
     jsr disprnd

     lda heroshp
     and #$fc
     sta heroshp
     lda exitshp
     and #$7f
     sta exitshp
     jsr disprnd

     lda #trea
     jsr compute
     sta treacntr
     lda #255
     sta 764
     rts



disprnd equ *

     sta dirf

     ldx #25
dir1 txa
     pha

     ldx #40
dir2 ldy rnd
     cpy #cavelen+1
     bcs dir2
     jsr dirone
     dex
     bne dir2

     jsr dirdisp

     pla
     tax
     dex
     bne dir1

     ldy #0
dir3 jsr dirone
     iny
     cpy #cavelen+1
     bcc dir3

dirdisp equ *
     lda addr
     pha
     lda addr+1
     pha
     jsr halt
     jsr dspscr
     lda #treasnd
     jsr sound
     jsr playsound
     pla
     sta addr+1
     pla
     sta addr
     rts

dirone equ *
     lda (addr),y
     bit dirf
     bpl *+4
     lda #wall

     cmp #' '
     bcc *+6
     cmp #blast
     bcc *+4
     lda #''''

     sta cave,y
     rts

dirf dta d' '


compute equ *
     ldx #0
     ldy #0
cpt1 cmp cave,y
     bne *+3
     inx
     iny
     cpy #cavelen+1
     bcc cpt1
     txa
     rts




********************

lives    dta d'  '
treacntr dta d' '
cavenum  dta d'  '
moveflag dta d' '
exitflag dta d' '
soundflg dta d' '
exlifcnt dta d' '

shapetab equ *
*           !"#$%&@()*+,-./
     dta d' ',B($9C),d'2*',B($90),B($9E),d'2,,',B($90),d'8"(2.,'
     dta d'"$&(&$"'

exitshp  equ shapetab+1
treashp  equ shapetab+4
ftreashp equ shapetab+9
heroshp  equ shapetab+10

proctab  dta a(0000)
         dta a(exitproc) ; !
         dta a(fbombproc) ; "
         dta a(0000) ; #
         dta a(treaproc) ; $
         dta a(0000) ; %
         dta a(bombproc) ; &
         dta a(rockproc) ; '
         dta a(frockproc) ; (
         dta a(ftreaproc) ; )
         dta a(heroproc) ; *
         dta a(abombproc) ; +
         dta a(0000) ; ,
         dta a(fbom1proc) ; -
         dta a(0000) ; .
         dta a(froc1proc) ; /

endp equ *
