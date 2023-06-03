;┌──────────────────┐
;|  misja 89.12.06  |
;|     MISSION      |
;|    91.02.12      |
;└──────────────────┘

opt    equ %100101

* protect  0=off min=on
cadi   equ $0
disk   equ $0


*  play song   A:00     X:song #
*  play song   A:10     X:song pos
*  sound       A:20+ch# X:note Y:inst#
*  set tempo   A:30     X:val
*  sound off   A:40
*  abort play  A:50
*  continue    A:60
*  init        A:70     X,Y dataadr


song   equ $0a00 ;$6a9
stat   equ $1200 ;$40
levl   equ $1240 ;$3c0
efnt   equ $4000 ;$800
txtfnt equ $4800 ;$800
font   equ $5000 ;$800
titfnt equ $5800 ;$800
plrd   equ $6000 ;$800

title  equ $6800
enetab equ $6f00 ;$100
sound  equ $7000

main   equ $7400
hero   equ $7f60
weap   equ $86f0
enemy  equ $8bf0
items  equ $9690
itmsrc equ $9f00 ;$100

amp    equ $a000

* wolne od $a000 

cvadrt equ $ab00 ;$200
ebuf1  equ $ad00 ;$100
scrn1  equ $ae00 ;$100
scrn2  equ $af00 ;$100
trpmap equ $b000 ;$100
itmtab equ $b100 ;$100
emask  equ $b200 ;$800
cavb   equ $ba00 ;$80
info   equ $ba80 ;$60
statbu equ $bae0 ;$20
plrs   equ $bb00 ;$500

********

outwea  equ weap+3
shoot   equ weap+6
putmis  equ weap+9

outher  equ hero+3
test    equ hero+6
plradr  equ hero+9

eneini  equ enemy+3
getene  equ enemy+6
enefonc equ enemy+9
charad  equ enemy+12
persput equ enemy+15
putene  equ enemy+18

itmsini equ items+3
putitms equ items+6
getitms equ items+9
itmfonc equ items+12

decener equ main+3
pickup  equ main+6
addsco  equ main+9
ppos    equ main+12
mpos    equ main+20

**************

scrn equ 88 ;89

m0   equ $80        ;-str0 gry
addr equ m0+00 ;+01
scra equ m0+02 ;+03
hlp  equ m0+04 ;+05
chad equ m0+06 ;+07

mnum equ m0+08
cave equ m0+09
pntr equ m0+10
x    equ m0+11
y    equ m0+12
item equ m0+13 ;+14  -prz i wlasnosci
ishp equ m0+15
ipos equ m0+16 ;+17  -akt i stala
exac equ m0+18 ;+19
scrb equ m0+20 ;+21
lstc equ m0+22 ;+23  -ost kom i licz

eact equ m0+24 ;+31
eshp equ m0+32 ;+39
ex   equ m0+40 ;+47
ey   equ m0+48 ;+55

dspf equ m0+56      ;-fla wysw przeci

hx   equ m0+57
hy   equ m0+58 ;+59
mx   equ m0+60 ;+63
my   equ m0+64 ;+67
mdx  equ m0+68 ;+71
gx   equ m0+72
gy   equ m0+73 ;+74
hact equ m0+75      ;-rodz ruchu boh
hdx  equ m0+76      ;-przyrost
hjmc equ m0+77      ;-licz skoku
hshp equ m0+78 ;+79  -postac
gact equ m0+80 ;+91  -rdz ruch gra,wys
gshp equ m0+82
gdx  equ m0+83
mdis equ m0+84 ;+85  -zabr strz/gran
cntr equ m0+86
enum equ m0+87

ener equ m0+100 ;+102
ammo equ m0+103
grns equ m0+104
dyns equ m0+105
time equ m0+106 ;+107
hisc equ m0+108 ;+110
scor equ m0+111 ;+113
demo equ m0+114

*- program

esctime equ 101
out  equ $bf
heig equ 27

plr0 equ plrs+$100
plr1 equ plrs+$200
plr2 equ plrs+$300
plr3 equ plrs+$400
plr4 equ plrs

ltshp  equ $00
rtshp  equ $10
bkshp  equ $20
fcshp  equ $30
tlshp  equ $40
trshp  equ $50

stndac equ 0
moveac equ 1
*      equ 2
downac equ 3
jumpac equ 4
jmp1ac equ 5
jmp2ac equ 6
fallac equ 7
laddac equ 8
njupac equ 9
nervac equ 10
throac equ 11
lifuac equ 12
lifdac equ 13

minx   equ 0
maxx   equ 128-8
miny   equ $30-heig
maxy   equ $a0-heig+12

itm1   equ $2a
itm2   equ $2b

*- system

tmer equ $21c
nrvt equ $21f

trig equ $d010
rnd  equ $d20a
joy  equ $d300
vcou equ $d40b


