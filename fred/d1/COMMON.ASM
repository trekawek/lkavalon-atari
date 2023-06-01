opt    equ %100101

;  •••• •••  •••• •••
;  ••   •• • ••   •• •  06.12.89
;  •••  •••  •••  •• •
;  ••   •• • ••   •• •  25.02.90
;  ••   •• • •••• •••

ver    equ $00 ;00 file, 01 cass, ff disk

sound  equ $0F00 ;4
ciski  equ $1300 ;b
fred   equ $1E00 ;9
begn   equ $2700 ;8

title  equ $3000 ;?

titfnt equ $3800  ;czolo
plfnt  equ $4000  ;player
dnfnt  equ $4800  ;info
nxfnt  equ $5000  ;fazy
font   equ $5800  ;maina

qbu    equ $6000
statab equ $60C0 ;1

levb   equ $6100 ;-8A14

song   equ $8b00
amp    equ $9200

font1  equ $a000

maint  equ $b300 ;-b6ff
lvtab  equ $b700 ;-b8ff
cvsc   equ $b900 ;-bAff
plrdef equ $bc00 ;-bfff ($bb00-bfff)

poke   equ title+3

*- strona 0

s0     equ $80
scra   equ s0+00 ;+01 -aktualny adres znaku w maint
addr   equ s0+02 ;+03
lvad   equ s0+04 ;+05
hlp    equ s0+06 ;+07
oldi   equ s0+10 ;+11 -stare pszerw dl
mad    equ s0+12 ;+13 -adres do obslugi maintab
tmp    equ s0+14 ;+15 +16
hlp1   equ s0+17 ;+18 +19
hlp2   equ s0+20 ;+21
score  equ s0+22 ;+23 +24
hisc   equ s0+25 ;+26 +27
exlif  equ s0+28 ;+29 +30

dlmo   equ 0
cave   equ s0+32 ;-nr komnaty
x      equ s0+33 ;-poz x w kom
y      equ s0+34 ;-poz y w kom
scrnum equ s0+35 ;-pozycja ekranu w maint
yin    equ s0+36 ;-index do scra
ostos  equ s0+37 ;-stary SP
hsc    equ s0+38 ;-moja wartosc HSCRoll
nrstw  equ s0+39 ;-numer aktualnego stwora
zegar  equ s0+40 ;-moj zegar

fpx    equ s0+41 ;-x freda
fpy    equ s0+42 ;-y freda
wiew   equ s0+43 ;-widok 0• 1→ 2←,evry wiew 2*8 sylw.(8• 8↑)
sylnum equ s0+44 ;-numer sylwetki w wiew
fmfl   equ s0+45 ;-flaga fall & jump
defnum equ s0+46 ;-index def do wysw
jdir   equ s0+47 ;-kier skoku:0↑ 1→ ff←
jfco   equ s0+48 ;-licznik do skoku i spadania
fthlp  equ s0+49 ;-test position help
jfh    equ s0+50
fpxo   equ s0+51
fpyo   equ s0+52
fxytst equ s0+53
fxreal equ s0+54

kx     equ s0+55
ky     equ s0+56
kxo    equ s0+57
kyo    equ s0+58
leci   equ s0+59
kdir   equ s0+60
spdn   equ s0+61
nonx   equ s0+62
kco    equ s0+63
bron   equ s0+64 ;0-kam 1-spray
itm_   equ s0+65
itco_  equ s0+66
byte   equ s0+67
rpt    equ s0+68
deadfl equ s0+69
deadco equ s0+70
bulfl  equ s0+71
spraco equ s0+72
copkco equ s0+73
kamco  equ s0+74
tntfl  equ s0+75
unvico equ s0+76
butco  equ s0+77
bonitc equ s0+78
timebo equ s0+79
levnum equ s0+80
firdel equ s0+81
zycia  equ s0+82
demo   equ s0+83
spsof  equ s0+84
olev   equ s0+85

colors equ s0+90 ;91 92 93
czapa  equ s0+94

*- system

dlstv EQU 560
timer EQU $21C
dliv  equ $200
stck  equ $278
ptrg  equ $284

rnd  equ $d20a
prta equ $d300
chba equ $d409
vcou equ $d40b
hscr equ $d404

l      equ $d4   ;-gr4 z przerwaniem
nomove equ %01000000
pockln equ 8
unv    equ 5
unvval equ 1
cpka   equ 0
cpkval equ 3
spra   equ 1
rocka  equ 2
rockv  equ 10
but    equ 6
butv   equ 40
timbo  equ $20
extra  equ $80


