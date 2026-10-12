( Klatwa v1 20-framework.fth: target 2A76..6017 )
( Hexadecimal. BYTES emits bytes; CELL emits 16-bit cells. )
( LIT8/LIT16 compile literals; branches retain signed )
( offsets. )
( 6502 mnemonics use 06-assembler.fth; operands follow )
( words. )

( ASSEMBLER | NFA 2A76 CFA 2A82 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $2A82 [ASSEMBLER] in contiguous 330-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $2A82, )
( corresponding word in contiguous 252-definition sequence )
( matching name length/suffix, flags, word kind, and body )
( length )
AT 2A76
( Header: flags, saved name and link )
BYTES C90000000000000000D2042A
DODOES
( DOES> thread at 1E30 )
BYTES 301E81A0AA2F481E
AT 2A8C

( INDEX | NFA 2A8C CFA 2A94 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2A8C
( Header: flags, saved name and link )
BYTES 85494E4445D8441E
DOVAR
BYTES 090905151501118009800D1D19808080800004141480808080800C1C
BYTES 1C80802C
AT 2AB6

( MODE | NFA 2AB6 CFA 2ABD )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2AB6
( Header: flags, saved name and link )
BYTES 844D4F44C58C2A
DOVAR
CELL 0002
AT 2AC1

( .A | NFA 2AC1 CFA 2AC6 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2AC1
( Header: flags, saved name and link )
BYTES 822EC1B62A
DOCOL
t.0 t.MODE t.! t.;S
AT 2AD0

( # | NFA 2AD0 CFA 2AD4 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2AD0
( Header: flags, saved name and link )
BYTES 81A3C12A
DOCOL
t.1 t.MODE t.! t.;S
AT 2ADE

( MEM | NFA 2ADE CFA 2AE4 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2ADE
( Header: flags, saved name and link )
BYTES 834D45CDD02A
DOCOL
t.2 t.MODE t.! t.;S
AT 2AEE

( ,X | NFA 2AEE CFA 2AF3 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2AEE
( Header: flags, saved name and link )
BYTES 822CD8DE2A
DOCOL
t.3 t.MODE t.! t.;S
AT 2AFD

( ,Y | NFA 2AFD CFA 2B02 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2AFD
( Header: flags, saved name and link )
BYTES 822CD9EE2A
DOCOL
LIT16 0004 t.MODE t.! t.;S
AT 2B0E

( X] | NFA 2B0E CFA 2B13 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2B0E
( Header: flags, saved name and link )
BYTES 8258A9FD2A
DOCOL
LIT16 0005 t.MODE t.! t.;S
AT 2B1F

( ]Y | NFA 2B1F CFA 2B24 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2B1F
( Header: flags, saved name and link )
BYTES 8229D90E2B
DOCOL
LIT16 0006 t.MODE t.! t.;S
AT 2B30

( ] | NFA 2B30 CFA 2B34 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2B30
( Header: flags, saved name and link )
BYTES 81A91F2B
DOCOL
LIT16 000F t.MODE t.! t.;S
AT 2B40

( BOT | NFA 2B40 CFA 2B46 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2B40
( Header: flags, saved name and link )
BYTES 83424FD4302B
DOCOL
t.,X t.0 t.;S
AT 2B4E

( SEC | NFA 2B4E CFA 2B54 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2B4E
( Header: flags, saved name and link )
BYTES 835345C3402B
DOCOL
t.,X t.2 t.;S
AT 2B5C

( RP] | NFA 2B5C CFA 2B62 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2B5C
( Header: flags, saved name and link )
BYTES 835250A94E2B
DOCOL
t.,X LIT16 0101 t.;S
AT 2B6C

( UPMODE | NFA 2B6C CFA 2B75 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2B6C
( Header: flags, saved name and link )
BYTES 8655504D4F44C55C2B
DOCOL
t.0BRANCH CELL 001A ( -> 2B93 )
t.MODE t.@ LIT16 0008 t.AND t.0=_12DE
t.0BRANCH CELL 000A ( -> 2B93 )
LIT16 0008 t.MODE t.+!
( label 2B93 )
t.1 t.MODE t.@ LIT16 000F t.AND t.-DUP
t.0BRANCH CELL 000E ( -> 2BB1 )
t.0 t.(DO)
( label 2BA9 )
t.DUP t.+
t.(LOOP) CELL FFFA ( -> 2BA9 )
( label 2BB1 )
t.OVER t.1+ t.@ t.AND t.0=_12DE t.;S
AT 2BBD

( CPU | NFA 2BBD CFA 2BC3 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2BBD
( Header: flags, saved name and link )
BYTES 834350D56C2B
DOCOL
t.<BUILDS t.C, t.DOES>
( Trailing code/data at 2BCB; retained exactly )
BYTES F9135216E42A7712
AT 2BD3

( BRK, | NFA 2BD3 CFA 2BDA )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2BD3
( Header: flags, saved name and link )
BYTES 8442524BACBD2B
DODOES
( DOES> thread at 2BCB )
BYTES CB2B00
AT 2BDF

( CLC, | NFA 2BDF CFA 2BE6 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2BDF
( Header: flags, saved name and link )
BYTES 84434C43ACD32B
DODOES
( DOES> thread at 2BCB )
BYTES CB2B18
AT 2BEB

( CLD, | NFA 2BEB CFA 2BF2 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2BEB
( Header: flags, saved name and link )
BYTES 84434C44ACDF2B
DODOES
( DOES> thread at 2BCB )
BYTES CB2BD8
AT 2BF7

( CLI, | NFA 2BF7 CFA 2BFE )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2BF7
( Header: flags, saved name and link )
BYTES 84434C49ACEB2B
DODOES
( DOES> thread at 2BCB )
BYTES CB2B58
AT 2C03

( CLV, | NFA 2C03 CFA 2C0A )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2C03
( Header: flags, saved name and link )
BYTES 84434C56ACF72B
DODOES
( DOES> thread at 2BCB )
BYTES CB2BB8
AT 2C0F

( DEX, | NFA 2C0F CFA 2C16 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2C0F
( Header: flags, saved name and link )
BYTES 84444558AC032C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BCA
AT 2C1B

( DEY, | NFA 2C1B CFA 2C22 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2C1B
( Header: flags, saved name and link )
BYTES 84444559AC0F2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B88
AT 2C27

( INX, | NFA 2C27 CFA 2C2E )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2C27
( Header: flags, saved name and link )
BYTES 84494E58AC1B2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BE8
AT 2C33

( INY, | NFA 2C33 CFA 2C3A )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2C33
( Header: flags, saved name and link )
BYTES 84494E59AC272C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BC8
AT 2C3F

( NOP, | NFA 2C3F CFA 2C46 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2C3F
( Header: flags, saved name and link )
BYTES 844E4F50AC332C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BEA
AT 2C4B

( PHA, | NFA 2C4B CFA 2C52 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2C4B
( Header: flags, saved name and link )
BYTES 84504841AC3F2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B48
AT 2C57

( PHP, | NFA 2C57 CFA 2C5E )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2C57
( Header: flags, saved name and link )
BYTES 84504850AC4B2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B08
AT 2C63

( PLA, | NFA 2C63 CFA 2C6A )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2C63
( Header: flags, saved name and link )
BYTES 84504C41AC572C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B68
AT 2C6F

( PLP, | NFA 2C6F CFA 2C76 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2C6F
( Header: flags, saved name and link )
BYTES 84504C50AC632C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B28
AT 2C7B

( RTI, | NFA 2C7B CFA 2C82 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2C7B
( Header: flags, saved name and link )
BYTES 84525449AC6F2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B40
AT 2C87

( RTS, | NFA 2C87 CFA 2C8E )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2C87
( Header: flags, saved name and link )
BYTES 84525453AC7B2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B60
AT 2C93

( SEC, | NFA 2C93 CFA 2C9A )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2C93
( Header: flags, saved name and link )
BYTES 84534543AC872C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B38
AT 2C9F

( SED, | NFA 2C9F CFA 2CA6 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2C9F
( Header: flags, saved name and link )
BYTES 84534544AC932C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BF8
AT 2CAB

( SEI, | NFA 2CAB CFA 2CB2 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2CAB
( Header: flags, saved name and link )
BYTES 84534549AC9F2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B78
AT 2CB7

( TAX, | NFA 2CB7 CFA 2CBE )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2CB7
( Header: flags, saved name and link )
BYTES 84544158ACAB2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BAA
AT 2CC3

( TAY, | NFA 2CC3 CFA 2CCA )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2CC3
( Header: flags, saved name and link )
BYTES 84544159ACB72C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BA8
AT 2CCF

( TSX, | NFA 2CCF CFA 2CD6 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2CCF
( Header: flags, saved name and link )
BYTES 84545358ACC32C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BBA
AT 2CDB

( TXA, | NFA 2CDB CFA 2CE2 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2CDB
( Header: flags, saved name and link )
BYTES 84545841ACCF2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B8A
AT 2CE7

( TXS, | NFA 2CE7 CFA 2CEE )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2CE7
( Header: flags, saved name and link )
BYTES 84545853ACDB2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B9A
AT 2CF3

( TYA, | NFA 2CF3 CFA 2CFA )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2CF3
( Header: flags, saved name and link )
BYTES 84545941ACE72C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B98
AT 2CFF

( MCP | NFA 2CFF CFA 2D05 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2CFF
( Header: flags, saved name and link )
BYTES 834D43D0F32C
DOCOL
t.<BUILDS t.C, t., t.DOES>
( Trailing code/data at 2D0F; retained exactly )
BYTES A5130916E4132D0F80000312C10F0A002D0F1000BD2AB41373132D0F
BYTES 00FF0312752B752BC10F0E00E42A5F112417841CDD144F1CF913BD2A
BYTES F913942A0413F91304135216BD2AF9132D0F07000312C10F1E00BD2A
BYTES F9132D0F0F0003122D0F07009B16C10F08005216A20F04004116E42A
BYTES 7712
AT 2D81

( ADC, | NFA 2D81 CFA 2D88 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2D81
( Header: flags, saved name and link )
BYTES 84414443ACFF2C
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D606E1C
AT 2D8F

( AND, | NFA 2D8F CFA 2D96 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2D8F
( Header: flags, saved name and link )
BYTES 84414E44AC812D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D206E1C
AT 2D9D

( CMP, | NFA 2D9D CFA 2DA4 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2D9D
( Header: flags, saved name and link )
BYTES 84434D50AC8F2D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DC06E1C
AT 2DAB

( EOR, | NFA 2DAB CFA 2DB2 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2DAB
( Header: flags, saved name and link )
BYTES 84454F52AC9D2D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D406E1C
AT 2DB9

( LDA, | NFA 2DB9 CFA 2DC0 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2DB9
( Header: flags, saved name and link )
BYTES 844C4441ACAB2D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DA06E1C
AT 2DC7

( ORA, | NFA 2DC7 CFA 2DCE )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2DC7
( Header: flags, saved name and link )
BYTES 844F5241ACB92D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D006E1C
AT 2DD5

( SBC, | NFA 2DD5 CFA 2DDC )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2DD5
( Header: flags, saved name and link )
BYTES 84534243ACC72D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DE06E1C
AT 2DE3

( STA, | NFA 2DE3 CFA 2DEA )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2DE3
( Header: flags, saved name and link )
BYTES 84535441ACD52D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D806C1C
AT 2DF1

( ASL, | NFA 2DF1 CFA 2DF8 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2DF1
( Header: flags, saved name and link )
BYTES 8441534CACE32D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D010D0D
AT 2DFF

( DEC, | NFA 2DFF CFA 2E06 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2DFF
( Header: flags, saved name and link )
BYTES 84444543ACF12D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DC10C0C
AT 2E0D

( INC, | NFA 2E0D CFA 2E14 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2E0D
( Header: flags, saved name and link )
BYTES 84494E43ACFF2D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DE10C0C
AT 2E1B

( LSR, | NFA 2E1B CFA 2E22 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2E1B
( Header: flags, saved name and link )
BYTES 844C5352AC0D2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D410D0D
AT 2E29

( ROL, | NFA 2E29 CFA 2E30 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2E29
( Header: flags, saved name and link )
BYTES 84524F4CAC1B2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D210D0D
AT 2E37

( ROR, | NFA 2E37 CFA 2E3E )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2E37
( Header: flags, saved name and link )
BYTES 84524F52AC292E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D610D0D
AT 2E45

( STX, | NFA 2E45 CFA 2E4C )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2E45
( Header: flags, saved name and link )
BYTES 84535458AC372E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D811404
AT 2E53

( CPX, | NFA 2E53 CFA 2E5A )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2E53
( Header: flags, saved name and link )
BYTES 84435058AC452E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DE08604
AT 2E61

( CPY, | NFA 2E61 CFA 2E68 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2E61
( Header: flags, saved name and link )
BYTES 84435059AC532E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DC08604
AT 2E6F

( LDX, | NFA 2E6F CFA 2E76 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2E6F
( Header: flags, saved name and link )
BYTES 844C4458AC612E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DA29614
AT 2E7D

( LDY, | NFA 2E7D CFA 2E84 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2E7D
( Header: flags, saved name and link )
BYTES 844C4459AC6F2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DA08E0C
AT 2E8B

( STY, | NFA 2E8B CFA 2E92 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2E8B
( Header: flags, saved name and link )
BYTES 84535459AC7D2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D808C04
AT 2E99

( JSR, | NFA 2E99 CFA 2EA0 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2E99
( Header: flags, saved name and link )
BYTES 844A5352AC8B2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D148004
AT 2EA7

( JMP, | NFA 2EA7 CFA 2EAE )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2EA7
( Header: flags, saved name and link )
BYTES 844A4D50AC992E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D408084
AT 2EB5

( BIT, | NFA 2EB5 CFA 2EBC )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2EB5
( Header: flags, saved name and link )
BYTES 84424954ACA72E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D208404
AT 2EC3

( BEGIN, | NFA 2EC3 CFA 2ECC )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2EC3
( Header: flags, saved name and link )
BYTES C6424547494EACB52E
DOCOL
t.HERE t.1 t.;S
AT 2ED4

( UNTIL, | NFA 2ED4 CFA 2EDD )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2ED4
( Header: flags, saved name and link )
BYTES C6554E54494CACC32E
DOCOL
t.?EXEC t.>R t.1 t.?PAIRS t.R> t.C, t.HERE t.1+ t.- t.C, t.;S
AT 2EF5

( IF, | NFA 2EF5 CFA 2EFB )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2EF5
( Header: flags, saved name and link )
BYTES C34946ACD42E
DOCOL
t.C, t.HERE t.0 t.C, t.2 t.;S
AT 2F09

( THEN, | NFA 2F09 CFA 2F11 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2F09
( Header: flags, saved name and link )
BYTES C55448454EACF52E
DOCOL
t.?EXEC t.2 t.?PAIRS t.HERE t.OVER t.C@
t.0BRANCH CELL 000A ( -> 2F2B )
t.SWAP t.!
t.BRANCH CELL 000C ( -> 2F35 )
( label 2F2B )
t.OVER t.1+ t.- t.SWAP t.C!
( label 2F35 )
t.;S
AT 2F37

( ELSE, | NFA 2F37 CFA 2F3F )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2F37
( Header: flags, saved name and link )
BYTES C5454C5345AC092F
DOCOL
t.2 t.?PAIRS t.HERE t.1+ t.1 t.JMP, t.SWAP t.HERE t.OVER t.1+
t.- t.SWAP t.C! t.2 t.;S
AT 2F5F

( NOT | NFA 2F5F CFA 2F65 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2F5F
( Header: flags, saved name and link )
BYTES 834E4FD4372F
DOCOL
LIT16 0020 t.+ t.;S
AT 2F6F

( CS | NFA 2F6F CFA 2F74 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2F6F
( Header: flags, saved name and link )
BYTES 8243D35F2F
DOCON
CELL 0090
AT 2F78

( 0= | NFA 2F78 CFA 2F7D )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2F78
( Header: flags, saved name and link )
BYTES 8230BD6F2F
DOCON
CELL 00D0
AT 2F81

( 0< | NFA 2F81 CFA 2F86 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2F81
( Header: flags, saved name and link )
BYTES 8230BC782F
DOCON
CELL 0010
AT 2F8A

( >= | NFA 2F8A CFA 2F8F )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2F8A
( Header: flags, saved name and link )
BYTES 823EBD812F
DOCON
CELL 0090
AT 2F93

( C; | NFA 2F93 CFA 2F98 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2F93
( Header: flags, saved name and link )
BYTES C243BB8A2F
DOCOL
t.CURRENT t.@ t.CONTEXT t.! t.?EXEC t.?CSP t.SMUDGE t.;S
AT 2FAA

( END-CODE | NFA 2FAA CFA 2FB5 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 2FAA
( Header: flags, saved name and link )
BYTES C8454E442D434F44C5932F
DOCOL
t.C; t.;S
AT 2FBB

( CODE | NFA 2FBB CFA 2FC2 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $2FC2 [CODE] in contiguous 330-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $2FC2, )
( identical body after known address relocation; surviving )
( name length and suffix match )
AT 2FBB
( Header: flags, saved name and link )
BYTES C4000000C5762A
DOCOL
t.?EXEC t.CREATE t.ASSEMBLER t.MEM t.!CSP t.;S
AT 2FD0

( MAC | NFA 2FD0 CFA 2FD6 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $2FD6 [MAC] in contiguous 330-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $2FD6, )
( identical body after known address relocation; surviving )
( name length and suffix match )
AT 2FD0
( Header: flags, saved name and link )
BYTES C30000C3BB2F
DOCOL
t.-FIND t.0=_12DE t.0 t.?ERROR t.DROP LIT16 0020 t.C, t., t.;S
AT 2FEC

( CMC-PLAYER-STORAGE | NFA 2FEC CFA 2FF3 )
( Inferred descriptive name, not recovered original: )
( Allocated buffer contains the CMC player with dispatcher )
( $3003 and frame routine $3006; music commands at )
( $5EE5/$5F0E/$5F3A call those entries. )
( Stack: -- address )
AT 2FEC
( Header: flags, saved name and link )
BYTES 84000000DAD02F
DOVAR
BYTES 000005414CFFFF0030C1374C5A374C63304CBB3200000000004CC65F
BYTES C207000000000000000000000000000000000000000000FFFFFF0000
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 0080808080000000401B2B0606008414840086000000000000008D51
BYTES 308E52308C533029704A4A4AAABD94308D9230BD95308D9330A9038D
BYTES 1FD2A9018D6230AC5330AE5230AD51304C6859A430CF3092312E3168
BYTES 3183318E313531AD5A3085FCAD5B3085FDA0008AF01CB1FCC98FF004
BYTES C9EFD00CCAD009C8C054B00998AA1006C8C05490E5608E0D30A900A2
BYTES 029D41309D44309D4A30CA10F48D0C308D4D30A0FF8C4F30AD563085
BYTES FCAD573085FDA013B1FCAAAD5A3085FCAD5B3085FDAC0D30B1FCC9CF
BYTES D00D98186955A8B1FC300FAA4C2731C98FF007C9EFF0038810E28E54
BYTES 308E5530608E54308E5530608E563086FC8C573084FD188A69148D58
BYTES 309869008D5930188A69008D5A309869028D5B30A013B1FC8D54308D
BYTES 5530A2038E1FD2A9008D6230A008A9009900D2C003B008990930A9FF
BYTES 9928308810ECA980A2039D4A30CA10FA60A900F0F3AD51302903AAA9
BYTES 809D4A30AC5330AD52308D51308C5330A9009D31309D28309D2B3098
BYTES 0A0A0A85FE18AD5630693048AD57306901A8681865FE9D5C30986900
BYTES 9D5F3018AD5630699485FCAD5730690085FDAD53300A6D53300AA88C
BYTES 5330C8C8C8C8C8B1FC9D3A3088B1FC9D373088B1FC9D34308888B1FC
BYTES 9D2E30A0002907C903D002A002C907D002A004B9B53285FEB9B63285
BYTES FFAC5330C8C8B1FC4A4A4A4A186D51308D51308DAC32A8BD2E302907
BYTES C907D00F980AA8B1FE9D1C30C88C51304C6932B1FE9D1C30AC5330C8
BYTES C8B1FC290F186D51308D5130AC5130BD2E302907C90508B1FE28F008
BYTES DD1C30D00338E9019D1F30AC5330B1FC482903A8B944379D2530684A
BYTES 4A4A4AA03EC90FF010A037C90EF00AA030C90DF0041869ABA8B94436
BYTES 9D22306044368536C636D8A5FC48A5FD48A5FE48A5FF48AD6230D003
BYTES 4C2336AD4D30F0034C7834AD5430CD5530F0034C6534AD0C30F0034C
BYTES 8B33A202A900BC4A3030039D4A309D4130CA10F2AD5A3085FCAD5B30
BYTES 85FDAC0D308C8E33CC4F30D019AD5030F014AD0D30AC4E308C0D30CE
BYTES 5030D0E88D0D30A810E2A200B1FCC9FEF00F9D3E3018986955A8E8E0
BYTES 0390EDB00FAC0D30C8CC8E33F0378C0D304C0D33AC0D30B1FC1033C9
BYTES FFF02F4A4A4A290EAABD8F338D7433BD90338D7533AD3F3085FE2073
BYTES 5B8C0D30C055B005CC8E33D08BAC8E338C0D304C23364CF533009D33
BYTES A333A933B333BD33C933E633208331A0FF60A5FE30F9A860A5FE30F3
BYTES 3898E5FEA860A5FE30E9189865FEA860A5FE30DF8D54308D5530C860
BYTES A5FE30D3AD403030CEC88C4E30189865FE8D4F30AD40308D5030C054
BYTES 6088300AB1FCC98FF004C9EFD0F3C860A202BD4430F005DE44301057
BYTES BD4A30D052BC3E30C940B04BAD583085FCAD593085FDB1FC85FE1898
BYTES 6940A8B1FC85FFBC4130B1FE29C0D00CB1FE293F9D4730FE413010EB
BYTES C940D00DB1FE293FBC473020A3314C5534C980D00AB1FE293F9D4430
BYTES FE4130CA109CAE0C30E88A293F8D0C30CE5530D00EAD54308D5530AD
BYTES 0C30D003EE0D30AC1F30AD2E302907C905F004C906D001888C1A30A0
BYTES 00C905F004C906D002A002C907D002A0288C1B30A202BD2E3029E09D
BYTES 1330BD5C3085FCBD5F3085FDBD2830C9FFF037C90FD021BD2B30F02E
BYTES DE2B30BD2B30D026BC0930F00188989D0930BD34309D2B30884CF334
BYTES BD28304AA8B1FC90044A4A4A4A290F9D0930BC1C30BD2E302907C901
BYTES D01F8898C8DD1F3008A90128D0020A0A3D3130F00CBC1F30C0FFD005
BYTES A9009D0930989D1730A9018D3D30BD2830C90FF0382907A8B9503785
BYTES FEBD28302908088A2818F0026903A8B9373025FEF01BBD22309D1730
BYTES 8E3D30CA10088D1A30A9008D1B30E8BD25309D1330BD2830290FC90F
BYTES F012FE2830BD2830290FC90FD006BD34309D2B30BD4A30100ABD0930
BYTES D005A9409D4A30FE3130A000BD2E304A4A4A4A9001884A9001C81898
BYTES 7D1C309D1C30BD1F30C9FFD002A00018987D1F309D1F30CA30034CA3
BYTES 34AD13308D1630AD2E302907A003AE3D30F018C904D002A007C905D0
BYTES 02A00BC906D002A00FC907D002A0139848B9303608297FAA9829030A
BYTES A8BD17309900D2BD0930E003D003AD09301D1330281002A9009901D2
BYTES 68A8882903D0D0AD1B308D08D2186885FF6885FE6885FD6885FC6000
BYTES 01028300010203010002830100020301028003FFF1E4D7CBC0B5AAA1
BYTES 988F877F78726B655F5A55504B47433F3C3835322F2C2A272523211F
BYTES 1D1C1A18171614131211100F0E0D0C0B0A0908070605040302010000
BYTES 00000000F2E9DACEBFB6AAA1988F89807A716B655F00565067605A55
BYTES 514C48433F3D393433392D2A282524211F1E00000F0E0D0C0B0A0908
BYTES 070605040302010000380B8C0A000A6A09E8086A08EF0780070807AE
BYTES 064606E60595054105F604B0046E043004F603BB03840352032203F4
BYTES 02C802A0027A02550234021402F501D801BD01A4018D01770160014E
BYTES 013801270115010601F700E800DB00CF00C300B800AC00A2009A0090
BYTES 0088007F00780070006A0064005E005700520032000A0080A0204000
BYTES 01353F008080A08040201008040201B73768AAF042C902F0066868CA
BYTES D0FB60A514C514F0FCAD24028DC037AD25028DC137AD58378D2402AD
BYTES 59378D25026868F00338E9018D9C3768A868AAA970206330A900A29B
BYTES 4C6330A514C514F0FCADC0378D2402ADC1378D2502A9404C633020BB
BYTES 32900320A6374CBF5F13C10F1200B13708146F1AB137E41314157335
BYTES 6F1AC616C6167712822BCEB53741149A37E413C10F32002D31E413C1
BYTES 0F16006F1AB1
AT 37F7

( CMC-ALIGNED-BASE | NFA 37F7 CFA 37FE )
( Inferred descriptive name, not recovered original: Rounds )
( the player-storage address up to the next $100-byte )
( boundary, yielding $3000. No decoded caller was found. )
( Stack: -- address )
AT 37F7
( Header: flags, saved name and link )
BYTES 84000000B0EC2F
DOCOL
t.CMC-PLAYER-STORAGE LIT16 0100 t.2DUP t.MOD t.- t.+ t.;S
AT 3810

( w3817 | NFA 3810 CFA 3817 )
( Unknown erased name; CFA identifier )
AT 3810
( Header: flags, saved name and link )
BYTES 84000000C5F737
DOVAR
CELL 0081
AT 381B

( w3821 | NFA 381B CFA 3821 )
( Unknown erased name; CFA identifier )
AT 381B
( Header: flags, saved name and link )
BYTES 830000C51038
DOCOL
w3817 t.@ t.;S
AT 3829

( THREADED-SELECTOR: | NFA 3829 CFA 3832 )
( Inferred descriptive name, not recovered original: )
( Defining word compiles a list of CFA cells; its DOES> )
( tail doubles an index, adds it to the parameter address )
( and executes the selected CFA. Used by joystick delta )
( tables $505C/$507E. )
AT 3829
( Header: flags, saved name and link )
BYTES 860000000000D41B38
DOCOL
t.<BUILDS t.SMUDGE t.] t.DOES>
( Trailing code/data at 383C; retained exactly )
BYTES 8D13D5140F200413E4138A0F7712
AT 384A

( SEARCH-ACTIVE | NFA 384A CFA 384F )
( Inferred descriptive name, not recovered original: Low )
( byte is set, tested and cleared by native $385A while )
( scanning for a matching byte or the endpoint. )
( Stack: -- address )
AT 384A
( Header: flags, saved name and link )
BYTES 8200C92938
DOVAR
CELL 0000
AT 3853

( SCAN-BYTE-MATCH | NFA 3853 CFA 3858 )
( Inferred descriptive name, not recovered original: Native )
( helper compares byte at [$D3] with the third stack cell, )
( advances $D3/$D4 to the first match or end, and clears )
( $3851 when finished. $3896 supplies the endpoints. )
AT 3853
( Header: flags, saved name and link )
BYTES 8200D54A38
CELL 385A ( native entry point )
LDY.# 01             ( 385A )
STY.ABS 3851         ( 385C )
DEY                  ( 385F )
LDA.INDY D3          ( 3860 )
CMP.ZPX 04           ( 3862 )
BNE 386C             ( 3864 )
DEC.ABS 3851         ( 3866 )
JMP.ABS 3886         ( 3869 )
LDA.# 01             ( 386C )
CLC                  ( 386E )
ADC.ZP D3            ( 386F )
STA.ZP D3            ( 3871 )
BCC 3877             ( 3873 )
INC.ZP D4            ( 3875 )
LDA.ZPX 01           ( 3877 )
CMP.ZP D4            ( 3879 )
BNE 3886             ( 387B )
LDA.ZPX 00           ( 387D )
CMP.ZP D3            ( 387F )
BNE 3886             ( 3881 )
DEC.ABS 3851         ( 3883 )
LDA.ABS 3851         ( 3886 )
BNE 3860             ( 3889 )
JMP.ABS 0F47         ( 388B )
AT 388E

( FIND-BYTE-FIRST | NFA 388E CFA 3896 )
( Inferred descriptive name, not recovered original: )
( Initializes the search pointer at XSAVE+2, scans forward )
( with $3858, and returns the one-based first-match index )
( or zero. Used for raw keycodes in $5D92. A zero count is )
( coerced to one, so even that case examines the first byte. )
( Stack: byte address count -- index-or-zero )
AT 388E
( Header: flags, saved name and link )
BYTES 8500000000D25338
DOCOL
t.DUP t.0=_12DE t.+ t.OVER t.+ t.OVER t.XSAVE t.2+ t.!
t.SCAN-BYTE-MATCH t.XSAVE t.2+ t.@ t.=
t.0BRANCH CELL 000A ( -> 38C0 )
t.2DROP t.0
t.BRANCH CELL 0012 ( -> 38D0 )
( label 38C0 )
t.XSAVE t.2+ t.@ t.SWAP t.- t.1+ t.SWAP t.DROP
( label 38D0 )
t.;S
AT 38D2

( LOAD-UNLESS-DEFINED | NFA 38D2 CFA 38DA )
( Inferred descriptive name, not recovered original: Parses )
( the following name with -FIND; if it exists discards the )
( screen number, otherwise LOADs it. )
( Stack: screen -- )
AT 38D2
( Header: flags, saved name and link )
BYTES 8500000000A28E38
DOCOL
t.-FIND
t.0BRANCH CELL 000A ( -> 38EA )
t.2DROP t.DROP
t.BRANCH CELL 0004 ( -> 38EC )
( label 38EA )
t.LOAD
( label 38EC )
t.;S
AT 38EE

( <=< | NFA 38EE CFA 38F4 )
( Matched original source name: Complete threaded body OVER )
( > >R < R> * matches the author tutorial and GAM source; )
( surviving three-character name and final < agree. Both )
( comparisons are strict signed bounds, so equal endpoints )
( return0. )
( Stack: low value high -- flag )
AT 38EE
( Header: flags, saved name and link )
BYTES 830000BCD238
DOCOL
t.OVER t.> t.>R t.< t.R> t.* t.;S
AT 3904

( % | NFA 3904 CFA 3908 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 3904
( Header: flags, saved name and link )
BYTES C1A5EE38
DOCOL
t.COMPILE t.CLIT t.BL t.WORD t.HERE t.NUMBER t.DROP LIT16 FFFF
t.OVER LIT16 0100 t.<=< t.0=_12DE
t.0BRANCH CELL 0014 ( -> 393C )
t.CR
( ATASCII text: Error: %  )
t.(.")
BYTES 094572726F723A202520
t.DUP t..
( label 393C )
t.C, t.;S
AT 3940

( DIRB | NFA 3940 CFA 3947 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $3545 [DIRB] in contiguous 4-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $3932, )
( identical body after known address relocation; surviving )
( name length and suffix match )
AT 3940
( Header: flags, saved name and link )
BYTES 84000000C20439
DOCON
CELL 01F4
AT 394B

( S-L | NFA 394B CFA 3951 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $354F [S-L] in contiguous 4-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $393C, )
( corresponding word in contiguous 33-definition sequence )
( matching name length/suffix, flags, word kind, and body )
( length )
AT 394B
( Header: flags, saved name and link )
BYTES 830000CC4039
DOVAR
CELL 0000
AT 3955

( HE | NFA 3955 CFA 395A )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $35B4 [HE] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $39A1, )
( identical body after known address relocation; surviving )
( name length and suffix match )
AT 3955
( Header: flags, saved name and link )
BYTES 8200C54B39
DOCON
CELL 8CA0
AT 395E

( SP& | NFA 395E CFA 3964 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $35BE [SP&] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $39AB, )
( corresponding word in contiguous 33-definition sequence )
( matching name length/suffix, flags, word kind, and body )
( length )
AT 395E
( Header: flags, saved name and link )
BYTES 830000A65539
DOVAR
CELL 00FF
AT 3968

( ASC-PEEK | NFA 3968 CFA 3973 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $35CD [ASC-PEEK] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 11_A_Graf.ATR CFA $3303, )
( corresponding word in contiguous 10-definition sequence )
( matching name length/suffix, flags, word kind, and body )
( length )
AT 3968
( Header: flags, saved name and link )
BYTES 8800000000000000CB5E39
CELL 3975 ( native entry point )
STX.ZP D1            ( 3975 )
LDA.ZPX 00           ( 3977 )
TAY                  ( 3979 )
INX                  ( 397A )
INX                  ( 397B )
LDA.ZPX 00           ( 397C )
STA.ZP D3            ( 397E )
INX                  ( 3980 )
LDA.ZPX 00           ( 3981 )
STA.ZP D4            ( 3983 )
DEY                  ( 3985 )
LDA.INDY D3          ( 3986 )
LDX.# 01             ( 3988 )
CMP.# 80             ( 398A )
BPL 3997             ( 398C )
CMP.# 20             ( 398E )
BPL 3994             ( 3990 )
LDX.# 00             ( 3992 )
JMP.ABS 399D         ( 3994 )
CMP.# A0             ( 3997 )
BPL 399D             ( 3999 )
LDX.# 00             ( 399B )
CPX.# 00             ( 399D )
BNE 39A8             ( 399F )
CLC                  ( 39A1 )
ADC.# 40             ( 39A2 )
CLC                  ( 39A4 )
JMP.ABS 39BF         ( 39A5 )
CMP.# 80             ( 39A8 )
BPL 39B7             ( 39AA )
CMP.# 60             ( 39AC )
BPL 39B4             ( 39AE )
SEC                  ( 39B0 )
SBC.# 20             ( 39B1 )
CLC                  ( 39B3 )
JMP.ABS 39BF         ( 39B4 )
CMP.# E0             ( 39B7 )
BPL 39BF             ( 39B9 )
SEC                  ( 39BB )
SBC.# 20             ( 39BC )
CLC                  ( 39BE )
STA.INDY D3          ( 39BF )
CPY.# 00             ( 39C1 )
BNE 3985             ( 39C3 )
LDX.ZP D1            ( 39C5 )
JMP.ABS 1057         ( 39C7 )
AT 39CA

( PEEK-ASC | NFA 39CA CFA 39D5 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $362F [PEEK-ASC] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 11_A_Graf.ATR CFA $3365, )
( corresponding word in contiguous 10-definition sequence )
( matching name length/suffix, flags, word kind, and body )
( length )
AT 39CA
( Header: flags, saved name and link )
BYTES 8800000000000000C36839
DOCOL
t.OVER t.OVER LIT8 02 LIT8 00 t.(DO)
( label 39E3 )
t.ASC-PEEK
t.(LOOP) CELL FFFC ( -> 39E3 )
t.;S
AT 39EB

( X! | NFA 39EB CFA 39F0 )
( Matched original source name: Complete body stores a cell )
( at OS COLCRS $55; the author tutorial defines X! as85 !, )
( and GAM uses the same byte-literal form. Surviving )
( two-character name ends in!. )
( Stack: x -- )
AT 39EB
( Header: flags, saved name and link )
BYTES 8200A1CA39
DOCOL
LIT8 55 t.! t.;S
AT 39F9

( Y! | NFA 39F9 CFA 39FE )
( Matched original source name: Complete body stores a byte )
( at OS ROWCRS $54; the author tutorial defines Y! as84 C!, )
( and GAM uses the same byte-literal form. Surviving )
( two-character name ends in!. )
( Stack: y -- )
AT 39F9
( Header: flags, saved name and link )
BYTES 8200A1EB39
DOCOL
LIT8 54 t.C! t.;S
AT 3A07

( X@ | NFA 3A07 CFA 3A0C )
( Matched original source name: Complete body matches GAM )
( screen18 line9: byte literal85 followed by @. It fetches )
( the OS COLCRS cell; surviving two-character name ends in@. )
( Stack: -- x )
AT 3A07
( Header: flags, saved name and link )
BYTES 8200C0F939
DOCOL
LIT8 55 t.@ t.;S
AT 3A15

( Y@ | NFA 3A15 CFA 3A1A )
( Matched original source name: Complete body matches GAM )
( screen18 line10: byte literal84 followed by C@. It )
( fetches OS ROWCRS; surviving two-character name ends in@. )
( Stack: -- y )
AT 3A15
( Header: flags, saved name and link )
BYTES 8200C0073A
DOCOL
LIT8 54 t.C@ t.;S
AT 3A23

( POS | NFA 3A23 CFA 3A29 )
( Matched original source name: Complete body calls Y! then )
( X!, exactly as in the author tutorial and preserved GAM )
( source. The three-character header ends inS; )
( original-runtime tests confirm both OS cursor fields. )
( Stack: x y -- )
AT 3A23
( Header: flags, saved name and link )
BYTES 830000D3153A
DOCOL
t.Y! t.X! t.;S
AT 3A31

( STYPE | NFA 3A31 CFA 3A39 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $3693 [STYPE] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 11_A_Graf.ATR CFA $33C9, )
( corresponding word in contiguous 10-definition sequence )
( matching name length/suffix, flags, word kind, and body )
( length )
AT 3A31
( Header: flags, saved name and link )
BYTES 8500000000C5233A
DOCOL
t.OVER t.OVER t.ASC-PEEK t.OVER t.OVER t.DUP t.>R LIT8 58 t.@
LIT8 55 t.@ t.DUP t.>R t.+ LIT8 54 t.C@ LIT8 28 t.* t.+ t.SWAP
t.R> t.R> t.+ LIT16 0055 t.! LIT8 1E t.EMIT LIT16 001F t.EMIT
t.CMOVE t.PEEK-ASC t.;S
AT 3A84

( [S"] | NFA 3A84 CFA 3A8B )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $36E5 [[S"]] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 11_A_Graf.ATR CFA $341B, )
( corresponding word in contiguous 10-definition sequence )
( matching name length/suffix, flags, word kind, and body )
( length )
AT 3A84
( Header: flags, saved name and link )
BYTES 84000000A9313A
DOCOL
t.R t.COUNT t.DUP t.1+ t.R> t.+ t.>R t.STYPE t.;S
AT 3A9F

( S" | NFA 3A9F CFA 3AA4 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $36FE [S"] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 11_A_Graf.ATR CFA $3434, )
( corresponding word in contiguous 10-definition sequence )
( matching name length/suffix, flags, word kind, and body )
( length )
AT 3A9F
( Header: flags, saved name and link )
BYTES C200A2843A
DOCOL
LIT16 3A8B LIT16 199F t.! t.." LIT16 1977 LIT16 199F t.! t.;S
AT 3ABE

( GRAPHICS-SOURCE-PTR | NFA 3ABE CFA 3AC3 )
( Inferred descriptive name, not recovered original: )
( Constant $F0; RLE decoding reads its source pointer and )
( picture composition also uses it as a destination pointer. )
( Stack: -- address )
AT 3ABE
( Header: flags, saved name and link )
BYTES 8200D39F3A
DOCON
CELL 00F0
AT 3AC7

( GRAPHICS-DEST-PTR | NFA 3AC7 CFA 3ACC )
( Inferred descriptive name, not recovered original: )
( Constant $F2; RLE decoding writes through this pointer. )
( Bitmap composition reuses it as a source pointer. )
( Stack: -- address )
AT 3AC7
( Header: flags, saved name and link )
BYTES 8200CCBE3A
DOCON
CELL 00F2
AT 3AD0

( GRAPHICS-ZP-F4 | NFA 3AD0 CFA 3AD5 )
( Inferred descriptive name, not recovered original: )
( Constant $F4, the two-byte saved column origin in the RLE )
( engine. No Forth caller distinguishes this constant from )
( the identical alias at $3ADF. )
( Stack: -- address )
AT 3AD0
( Header: flags, saved name and link )
BYTES 8200AAC73A
DOCON
CELL 00F4
AT 3AD9

( GRAPHICS-ZP-F4-ALIAS | NFA 3AD9 CFA 3ADF )
( Inferred descriptive name, not recovered original: Second )
( constant returning $F4. Native composition also reuses )
( its low byte as a two-bit pixel mask; no decoded Forth )
( consumer establishes this alias's original intended role. )
( Stack: -- address )
AT 3AD9
( Header: flags, saved name and link )
BYTES 830000B0D03A
DOCON
CELL 00F4
AT 3AE3

( GRAPHICS-ROW-STRIDE | NFA 3AE3 CFA 3AE8 )
( Inferred descriptive name, not recovered original: )
( Constant $F6; RLE destination-row increment and )
( composition source-row increment are stored here. )
( Stack: -- address )
AT 3AE3
( Header: flags, saved name and link )
BYTES 8200ABD93A
DOCON
CELL 00F6
AT 3AEC

( GRAPHICS-COLUMN-COUNT | NFA 3AEC CFA 3AF2 )
( Inferred descriptive name, not recovered original: )
( Constant $F7; RLE decrements it once per output column, )
( and bitmap composition uses it as bytes per row. )
( Stack: -- address )
AT 3AEC
( Header: flags, saved name and link )
BYTES 830000C1E33A
DOCON
CELL 00F7
AT 3AF6

( GRAPHICS-ROW-COUNT | NFA 3AF6 CFA 3AFC )
( Inferred descriptive name, not recovered original: )
( Constant $F8; RLE reloads its per-column row countdown )
( from this byte, while composition decrements it directly. )
( Stack: -- address )
AT 3AF6
( Header: flags, saved name and link )
BYTES 830000C1EC3A
DOCON
CELL 00F8
AT 3B00

( GRAPHICS-ROW-COUNTER | NFA 3B00 CFA 3B05 )
( Inferred descriptive name, not recovered original: )
( Constant $F9; RLE decrements its remaining rows; the )
( blitter reuses the byte as destination stride. )
( Stack: -- address )
AT 3B00
( Header: flags, saved name and link )
BYTES 8200CDF63A
DOCON
CELL 00F9
AT 3B09

( GRAPHICS-RLE-GROUP-SIZE | NFA 3B09 CFA 3B0F )
( Inferred descriptive name, not recovered original: )
( Constant $FA; the RLE escape decoder stores the repeated )
( group width [one through four] here. Composition reuses )
( it as a pixel byte. )
( Stack: -- address )
AT 3B09
( Header: flags, saved name and link )
BYTES 830000D0003B
DOCON
CELL 00FA
AT 3B13

( GRAPHICS-RLE-REPEATS | NFA 3B13 CFA 3B1A )
( Inferred descriptive name, not recovered original: )
( Constant $FB; low six bits of an $8D escape control byte )
( specify the repeat counter. Blitting also reuses it for )
( six-row hit-map progression. )
( Stack: -- address )
AT 3B13
( Header: flags, saved name and link )
BYTES 84000000DA093B
DOCON
CELL 00FB
AT 3B1E

( GRAPHICS-RLE-GROUP | NFA 3B1E CFA 3B24 )
( Inferred descriptive name, not recovered original: )
( Constant $FC; the RLE escape decoder stores up to four )
( bytes beginning here. The transparency helper reuses its )
( low byte as a run counter. )
( Stack: -- address )
AT 3B1E
( Header: flags, saved name and link )
BYTES 830000CF133B
DOCON
CELL 00FC
AT 3B28

( RLE-RESTORE-COLUMN | NFA 3B28 CFA 3B2F )
( Inferred descriptive name, not recovered original: Copies )
( saved destination $F4/$F5 to $F2/$F3, then RTS. )
( Native-only helper called by $3BC3 and repeated-row )
( expansion. )
( Assembly subroutine entry; returns with RTS. )
AT 3B28
( Header: flags, saved name and link )
BYTES 84000000B01E3B
CELL 3B31 ( native entry point )
LDA.ZP F4            ( 3B31 )
STA.ZP F2            ( 3B33 )
LDA.ZP F5            ( 3B35 )
STA.ZP F3            ( 3B37 )
RTS                  ( 3B39 )
AT 3B3A

( RLE-SAVE-COLUMN | NFA 3B3A CFA 3B41 )
( Inferred descriptive name, not recovered original: Copies )
( $F2/$F3 to saved origin $F4/$F5, then RTS; used before )
( decoding each column. )
( Assembly subroutine entry; returns with RTS. )
AT 3B3A
( Header: flags, saved name and link )
BYTES 84000000B0283B
CELL 3B43 ( native entry point )
LDA.ZP F2            ( 3B43 )
STA.ZP F4            ( 3B45 )
LDA.ZP F3            ( 3B47 )
STA.ZP F5            ( 3B49 )
RTS                  ( 3B4B )
AT 3B4C

( RLE-NEXT-ROW | NFA 3B4C CFA 3B52 )
( Inferred descriptive name, not recovered original: Adds )
( unsigned stride $F6 to pointer $F2/$F3, then RTS. Called )
( after each output byte. )
( Assembly subroutine entry; returns with RTS. )
AT 3B4C
( Header: flags, saved name and link )
BYTES 830000AB3A3B
CELL 3B54 ( native entry point )
CLC                  ( 3B54 )
LDA.ZP F6            ( 3B55 )
ADC.ZP F2            ( 3B57 )
STA.ZP F2            ( 3B59 )
BCC 3B60             ( 3B5B )
INC.ZP F3            ( 3B5D )
CLC                  ( 3B5F )
RTS                  ( 3B60 )
AT 3B61

( RLE-ADVANCE-SOURCE | NFA 3B61 CFA 3B67 )
( Inferred descriptive name, not recovered original: Adds )
( accumulator A to $F0/$F1 with carry, then RTS. )
( Native-only helper. )
( Assembly subroutine entry; returns with RTS. )
AT 3B61
( Header: flags, saved name and link )
BYTES 830000AB4C3B
CELL 3B69 ( native entry point )
CLC                  ( 3B69 )
ADC.ZP F0            ( 3B6A )
STA.ZP F0            ( 3B6C )
BCC 3B73             ( 3B6E )
INC.ZP F1            ( 3B70 )
CLC                  ( 3B72 )
RTS                  ( 3B73 )
AT 3B74

( RLE-EXPAND-RUN | NFA 3B74 CFA 3B7A )
( Inferred descriptive name, not recovered original: )
( Decodes escape $8D: control top two bits plus one give )
( group size, low six bits initialize the repeat countdown; )
( reads the group and writes strided bytes. A zero )
( countdown wraps to256 repetitions in this native loop. )
( Returns RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 3B74
( Header: flags, saved name and link )
BYTES 830000D0613B
CELL 3B7C ( native entry point )
LDY.# 01             ( 3B7C )
LDA.# C0             ( 3B7E )
AND.INDY F0          ( 3B80 )
LSR.A                ( 3B82 )
LSR.A                ( 3B83 )
LSR.A                ( 3B84 )
LSR.A                ( 3B85 )
LSR.A                ( 3B86 )
LSR.A                ( 3B87 )
CLC                  ( 3B88 )
ADC.# 01             ( 3B89 )
STA.ZP FA            ( 3B8B )
LDA.# 3F             ( 3B8D )
AND.INDY F0          ( 3B8F )
STA.ZP FB            ( 3B91 )
LDX.# 00             ( 3B93 )
INY                  ( 3B95 )
LDA.INDY F0          ( 3B96 )
STA.ZPX FC           ( 3B98 )
INY                  ( 3B9A )
INX                  ( 3B9B )
CPX.ZP FA            ( 3B9C )
BNE 3B96             ( 3B9E )
TYA                  ( 3BA0 )
JSR.ABS 3B69         ( 3BA1 )
LDY.# 00             ( 3BA4 )
LDX.# 00             ( 3BA6 )
LDA.ZPX FC           ( 3BA8 )
STA.INDY F2          ( 3BAA )
JSR.ABS 3B54         ( 3BAC )
DEC.ZP F9            ( 3BAF )
INX                  ( 3BB1 )
CPX.ZP FA            ( 3BB2 )
BNE 3BA8             ( 3BB4 )
DEC.ZP FB            ( 3BB6 )
BNE 3BA6             ( 3BB8 )
RTS                  ( 3BBA )
AT 3BBB

( RLE-EXPAND-COLUMNS | NFA 3BBB CFA 3BC1 )
( Inferred descriptive name, not recovered original: Native )
( decoder consumes literals or $8D runs column by column, )
( using $F7 columns, $F8 rows and $F6 destination stride. )
( Returns with RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 3BBB
( Header: flags, saved name and link )
BYTES 830000BC743B
CELL 3BC3 ( native entry point )
JSR.ABS 3B43         ( 3BC3 )
LDA.ZP F8            ( 3BC6 )
STA.ZP F9            ( 3BC8 )
LDY.# 00             ( 3BCA )
LDA.INDY F0          ( 3BCC )
CMP.# 8D             ( 3BCE )
BNE 3BD8             ( 3BD0 )
JSR.ABS 3B7C         ( 3BD2 )
JMP.ABS 3BE4         ( 3BD5 )
STA.INDY F2          ( 3BD8 )
DEC.ZP F9            ( 3BDA )
JSR.ABS 3B54         ( 3BDC )
LDA.# 01             ( 3BDF )
JSR.ABS 3B69         ( 3BE1 )
LDA.ZP F9            ( 3BE4 )
BNE 3BCA             ( 3BE6 )
JSR.ABS 3B31         ( 3BE8 )
LDA.ZP F2            ( 3BEB )
CLC                  ( 3BED )
ADC.# 01             ( 3BEE )
STA.ZP F2            ( 3BF0 )
BCC 3BF6             ( 3BF2 )
INC.ZP F3            ( 3BF4 )
DEC.ZP F7            ( 3BF6 )
BNE 3BC3             ( 3BF8 )
RTS                  ( 3BFA )
AT 3BFB

( RLE-EXPAND | NFA 3BFB CFA 3C04 )
( Inferred descriptive name, not recovered original: )
( Preserves the Forth X stack pointer, calls native column )
( decoder $3BC3, restores X and jumps to NEXT. )
( Stack: -- )
AT 3BFB
( Header: flags, saved name and link )
BYTES 860000000000BCBB3B
CELL 3C06 ( native entry point )
STX.ZP D1            ( 3C06 )
JSR.ABS 3BC3         ( 3C08 )
LDX.ZP D1            ( 3C0B )
JMP.ABS 0F47         ( 3C0D )
AT 3C10

( RLE-SIZE! | NFA 3C10 CFA 3C17 )
( Inferred descriptive name, not recovered original: Stores )
( rows in $F8 and columns in $F7 for the column decoder. )
( Stack: columns rows -- )
AT 3C10
( Header: flags, saved name and link )
BYTES 84000000A1FB3B
DOCOL
t.GRAPHICS-ROW-COUNT t.C! t.GRAPHICS-COLUMN-COUNT t.C! t.;S
AT 3C23

( RLE-POINTERS! | NFA 3C23 CFA 3C2A )
( Inferred descriptive name, not recovered original: Stores )
( destination in $F2/$F3 and source in $F0/$F1. )
( Stack: source destination -- )
AT 3C23
( Header: flags, saved name and link )
BYTES 84000000A1103C
DOCOL
t.GRAPHICS-DEST-PTR t.! t.GRAPHICS-SOURCE-PTR t.! t.;S
AT 3C36

( RLE-STRIDE! | NFA 3C36 CFA 3C3D )
( Inferred descriptive name, not recovered original: Stores )
( the low byte of its argument in $F6. )
( Stack: stride -- )
AT 3C36
( Header: flags, saved name and link )
BYTES 84000000A1233C
DOCOL
t.GRAPHICS-ROW-STRIDE t.C! t.;S
AT 3C45

( BANK-COPY-LENGTH | NFA 3C45 CFA 3C4B )
( Inferred descriptive name, not recovered original: 16-bit )
( count read by $3C9C: high byte supplies full 256-byte )
( pages and low byte a final partial page. )
( Stack: -- address )
AT 3C45
( Header: flags, saved name and link )
BYTES 830000CC363C
DOVAR
CELL 0000
AT 3C4F

( BANK-COPY-SOURCE | NFA 3C4F CFA 3C54 )
( Inferred descriptive name, not recovered original: )
( Constant $DD, the source pointer used by native $3C83. )
( Stack: -- address )
AT 3C4F
( Header: flags, saved name and link )
BYTES 8200A5453C
DOCON
CELL 00DD
AT 3C58

( BANK-COPY-DEST | NFA 3C58 CFA 3C5D )
( Inferred descriptive name, not recovered original: )
( Constant $DF, the destination pointer used by native )
( $3C83. )
( Stack: -- address )
AT 3C58
( Header: flags, saved name and link )
BYTES 8200A54F3C
DOCON
CELL 00DF
AT 3C61

( ENTER-RAM-UNDER-OS | NFA 3C61 CFA 3C67 )
( Inferred descriptive name, not recovered original: Waits )
( for VCOUNT bit7 to transition, synchronizes WSYNC, )
( disables IRQs and decrements PORTB to expose RAM beneath )
( the OS ROM. Native subroutine returns with RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 3C61
( Header: flags, saved name and link )
BYTES 830000D4583C
CELL 3C69 ( native entry point )
LDA.ABS D40B         ( 3C69 )
BMI 3C69             ( 3C6C )
LDA.ABS D40B         ( 3C6E )
BPL 3C6E             ( 3C71 )
LDA.# FF             ( 3C73 )
STA.ABS D40A         ( 3C75 )
SEI                  ( 3C78 )
DEC.ABS D301         ( 3C79 )
RTS                  ( 3C7C )
AT 3C7D

( COPY-BANK-PAGE | NFA 3C7D CFA 3C83 )
( Inferred descriptive name, not recovered original: After )
( exposing RAM under the OS, copies Y bytes backward )
( through pointers $DD/$DF, restores PORTB and IRQs, and )
( RTS. Y=0 copies a full 256-byte page. )
( Assembly subroutine entry; returns with RTS. )
AT 3C7D
( Header: flags, saved name and link )
BYTES 830000CC613C
CELL 3C85 ( native entry point )
JSR.ABS 3C69         ( 3C85 )
DEY                  ( 3C88 )
LDA.INDY DD          ( 3C89 )
STA.INDY DF          ( 3C8B )
CPY.# 00             ( 3C8D )
BNE 3C88             ( 3C8F )
INC.ABS D301         ( 3C91 )
CLI                  ( 3C94 )
RTS                  ( 3C95 )
AT 3C96

( COPY-BANK-BYTES | NFA 3C96 CFA 3C9C )
( Inferred descriptive name, not recovered original: Copies )
( the full pages and remainder specified by $3C4B through )
( native $3C83, preserving the Forth parameter-stack X )
( register. )
( Stack: -- )
AT 3C96
( Header: flags, saved name and link )
BYTES 830000D67D3C
CELL 3C9E ( native entry point )
STX.ZP D1            ( 3C9E )
LDX.ABS 3C4E         ( 3CA0 )
LDY.# 00             ( 3CA3 )
CPX.# 00             ( 3CA5 )
BEQ 3CB3             ( 3CA7 )
JSR.ABS 3C85         ( 3CA9 )
INC.ZP DE            ( 3CAC )
INC.ZP E0            ( 3CAE )
DEX                  ( 3CB0 )
BNE 3CA9             ( 3CB1 )
LDA.ABS 3C4D         ( 3CB3 )
BEQ 3CBE             ( 3CB6 )
LDY.ABS 3C4D         ( 3CB8 )
JSR.ABS 3C85         ( 3CBB )
LDX.ZP D1            ( 3CBE )
JMP.ABS 0F47         ( 3CC0 )
AT 3CC3

( COPY-UNDER-OS | NFA 3CC3 CFA 3CCB )
( Inferred descriptive name, not recovered original: Stores )
( length and both bank-copy pointers, then executes $3C9C. )
( Tutorial PMOVE has the same parameter roles, but this )
( game uses its own raster-synchronized implementation. )
( Stack: source destination length -- )
AT 3CC3
( Header: flags, saved name and link )
BYTES 8500000000C5963C
DOCOL
t.BANK-COPY-LENGTH t.! t.BANK-COPY-DEST t.! t.BANK-COPY-SOURCE
t.! t.COPY-BANK-BYTES t.;S
AT 3CDD

( BANK-FIRST-SPAN | NFA 3CDD CFA 3CE3 )
( Inferred descriptive name, not recovered original: )
( Constant $2800 is the size of logical offsets mapped to )
( physical $D800..$FFFF; later offsets map from $C000. )
( Stack: -- bytes )
AT 3CDD
( Header: flags, saved name and link )
BYTES 830000B8C33C
DOCON
CELL 2800
AT 3CE7

( SPLIT-BANK-RANGE | NFA 3CE7 CFA 3CED )
( Inferred descriptive name, not recovered original: Splits )
( a logical offset/count pair at $2800 into physical copy )
( spans, mapping lower offsets from $D800 and higher )
( offsets from $C000. Called by both directions of bank )
( transfer. )
( Stack: offset count -- address1 count1 address2 count2 )
( count1 )
AT 3CE7
( Header: flags, saved name and link )
BYTES 830000CCDD3C
DOCOL
t.OVER t.+ t.DUP t.>R t.BANK-FIRST-SPAN t.< t.0=_12DE
t.0BRANCH CELL 004A ( -> 3D49 )
t.DUP t.BANK-FIRST-SPAN t.< t.0=_12DE
t.0BRANCH CELL 0020 ( -> 3D2B )
t.>R t.0 t.0 LIT16 C000 t.R t.BANK-FIRST-SPAN t.- t.+ t.R> t.R
t.SWAP t.-
t.BRANCH CELL 001C ( -> 3D45 )
( label 3D2B )
t.>R LIT16 D800 t.R t.+ t.BANK-FIRST-SPAN t.R> t.- LIT16 C000
t.R t.BANK-FIRST-SPAN t.-
( label 3D45 )
t.BRANCH CELL 0018 ( -> 3D5F )
( label 3D49 )
t.>R LIT16 D800 t.R t.+ t.R> t.R t.SWAP t.- t.0 t.0
( label 3D5F )
t.R> t.DROP t.>R t.OVER t.R> t.SWAP t.;S
AT 3D6D

( STORE-BANK-RANGE | NFA 3D6D CFA 3D74 )
( Inferred descriptive name, not recovered original: Uses )
( $3CED to split the logical range, then copies from normal )
( RAM into one or two physical RAM-under-OS spans with )
( $3CCB. )
( Stack: source offset count -- )
AT 3D6D
( Header: flags, saved name and link )
BYTES 84000000CDE73C
DOCOL
t.ROT t.>R t.SPLIT-BANK-RANGE t.R t.+ t.ROT t.ROT
t.COPY-UNDER-OS t.R> t.ROT t.ROT t.COPY-UNDER-OS t.;S
AT 3D90

( FETCH-BANK-RANGE | NFA 3D90 CFA 3D97 )
( Inferred descriptive name, not recovered original: Uses )
( $3CED to split the logical range, then copies one or two )
( RAM-under-OS spans into contiguous normal RAM with $3CCB. )
( Stack: destination offset count -- )
AT 3D90
( Header: flags, saved name and link )
BYTES 84000000CD6D3D
DOCOL
t.ROT t.>R t.SPLIT-BANK-RANGE t.R t.+ t.SWAP t.COPY-UNDER-OS
t.R> t.SWAP t.COPY-UNDER-OS t.;S
AT 3DAF

( SPLIT-UNSIGNED-BYTES | NFA 3DAF CFA 3DB9 )
( Inferred descriptive name, not recovered original: Native )
( code moves the original high byte to a new zero-extended )
( stack cell and clears both high halves. )
( Stack: cell -- low high )
AT 3DAF
( Header: flags, saved name and link )
BYTES 87000000000000C2903D
CELL 3DBB ( native entry point )
LDA.ZPX 01           ( 3DBB )
DEX                  ( 3DBD )
DEX                  ( 3DBE )
STA.ZPX 00           ( 3DBF )
LDA.# 00             ( 3DC1 )
STA.ZPX 03           ( 3DC3 )
STA.ZPX 01           ( 3DC5 )
JMP.ABS 0F47         ( 3DC7 )
AT 3DCA

( PATCH-VBI-SLOT | NFA 3DCA CFA 3DD2 )
( Inferred descriptive name, not recovered original: Parses )
( a Forth name with -FIND, writes JSR opcode $20 at )
( table+1+3*slot and stores the target native entry after )
( it; otherwise prints ERROR VBI. )
( Stack: slot table -- )
AT 3DCA
( Header: flags, saved name and link )
BYTES 8500000000A9AF3D
DOCOL
t.-FIND
t.0BRANCH CELL 0025 ( -> 3DFD )
t.DROP t.SWAP t.1+ t.ROT LIT8 03 t.* t.+ t.DUP t.>R t.1+ t.!
LIT16 0020 t.R> t.C!
t.BRANCH CELL 0010 ( -> 3E0B )
( label 3DFD )
t.DROP
( ATASCII text: ERROR VBI )
t.(.")
BYTES 094552524F5220564249
( label 3E0B )
t.;S
AT 3E0D

( VBI-CALL-TABLE | NFA 3E0D CFA 3E15 )
( Inferred descriptive name, not recovered original: )
( Mutable slots of three-byte native calls/NOPs, ending in )
( a jump to $3E53. RUN-VBI1 installs execution at table+1 )
( via SETVBV. )
( Stack: -- address )
AT 3E0D
( Header: flags, saved name and link )
BYTES 8500000000B1CA3D
DOVAR
BYTES EAEAEAEA205B5FEAEAEA20316FEAEAEAEAEAEAEAEAEAEAEAEAEAEAEA
BYTES EAEAEA4C533E20
AT 3E3A

( VBI-SLOT! | NFA 3E3A CFA 3E41 )
( Inferred descriptive name, not recovered original: )
( Supplies the VBI call table to $3DD2; the parsed name )
( determines the installed JSR target. )
( Stack: slot -- )
AT 3E3A
( Header: flags, saved name and link )
BYTES 84000000B10D3E
DOCOL
t.VBI-CALL-TABLE t.PATCH-VBI-SLOT t.;S
AT 3E49

( RETURN-FROM-VBI | NFA 3E49 CFA 3E51 )
( Inferred descriptive name, not recovered original: Native )
( JMP $E462 invokes the OS XITVBV exit; not a normal Forth )
( NEXT return. )
( Assembly VBI exit; jumps to OS XITVBV. )
AT 3E49
( Header: flags, saved name and link )
BYTES 8500000000A93A3E
CELL 3E53 ( native entry point )
JMP.ABS E462         ( 3E53 )
AT 3E56

( RUN-VBI1 | NFA 3E56 CFA 3E60 )
( Matches GAM FORTH deferred-VBI native routine: SETVBV )
( with X/Y selecting vector $3E18. )
AT 3E56
( Header: flags, saved name and link )
BYTES 87000000000000B1493E
CELL 3E62 ( native entry point )
STX.ZP D1            ( 3E62 )
LDX.# 3E             ( 3E64 )
LDY.# 18             ( 3E66 )
LDA.# 07             ( 3E68 )
JSR.ABS E45C         ( 3E6A )
LDX.ZP D1            ( 3E6D )
JMP.ABS 0F47         ( 3E6F )
AT 3E72

( STOP-VBI1 | NFA 3E72 CFA 3E7D )
( Matches GAM FORTH deferred-VBI native routine: SETVBV )
( with X/Y selecting vector $E462. )
AT 3E72
( Header: flags, saved name and link )
BYTES 8800000000000000B1563E
CELL 3E7F ( native entry point )
STX.ZP D1            ( 3E7F )
LDX.# E4             ( 3E81 )
LDY.# 62             ( 3E83 )
LDA.# 07             ( 3E85 )
JSR.ABS E45C         ( 3E87 )
LDX.ZP D1            ( 3E8A )
JMP.ABS 0F47         ( 3E8C )
AT 3E8F

( RECORD-SPAN | NFA 3E8F CFA 3E96 )
( Inferred descriptive name, not recovered original: Cell )
( used by resource scanning as the current u16 record )
( length plus two; native PM graphics copies also reuse it )
( as plane byte count. )
( Stack: -- address )
AT 3E8F
( Header: flags, saved name and link )
BYTES 84000000C4723E
DOVAR
CELL 0003
AT 3E9A

( RECORD-WRAP-HIGH | NFA 3E9A CFA 3EA0 )
( Inferred descriptive name, not recovered original: Native )
( scan $3ECB compares pointer high byte against this )
( threshold, initially $A7, then sets it to $D8 after )
( wrapping the resource window. )
( Stack: -- address )
AT 3E9A
( Header: flags, saved name and link )
BYTES 830000C38F3E
DOVAR
CELL 00A7
AT 3EA4

( RECORD-POINTER | NFA 3EA4 CFA 3EA9 )
( Inferred descriptive name, not recovered original: )
( Constant $D2, the current pointer used by resource )
( scanning and PM-plane copies. )
( Stack: -- address )
AT 3EA4
( Header: flags, saved name and link )
BYTES 8200CB9A3E
DOCON
CELL 00D2
AT 3EAD

( ADVANCE-RECORD-POINTER | NFA 3EAD CFA 3EB3 )
( Inferred descriptive name, not recovered original: Adds )
( the 16-bit RECORD-SPAN cell to $D2/$D3 and returns with )
( RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 3EAD
( Header: flags, saved name and link )
BYTES 830000ABA43E
CELL 3EB5 ( native entry point )
LDA.ZP D2            ( 3EB5 )
CLC                  ( 3EB7 )
ADC.ABS 3E98         ( 3EB8 )
STA.ZP D2            ( 3EBB )
LDA.ZP D3            ( 3EBD )
ADC.ABS 3E99         ( 3EBF )
STA.ZP D3            ( 3EC2 )
RTS                  ( 3EC4 )
AT 3EC5

( SCAN-LENGTH-RECORDS | NFA 3EC5 CFA 3ECB )
( Inferred descriptive name, not recovered original: Walks )
( the requested number of u16-length records, advancing by )
( length+2 and handling the resource-window wrap. Called by )
( both visible-RAM and banked-resource lookup. )
AT 3EC5
( Header: flags, saved name and link )
BYTES 830000AAAD3E
CELL 3ECD ( native entry point )
LDA.ZPX 02           ( 3ECD )
LDY.# 00             ( 3ECF )
TAX                  ( 3ED1 )
BEQ 3F05             ( 3ED2 )
LDA.INDY D2          ( 3ED4 )
STA.ABS 3E98         ( 3ED6 )
INY                  ( 3ED9 )
LDA.INDY D2          ( 3EDA )
STA.ABS 3E99         ( 3EDC )
DEY                  ( 3EDF )
LDA.# 02             ( 3EE0 )
CLC                  ( 3EE2 )
ADC.ABS 3E98         ( 3EE3 )
STA.ABS 3E98         ( 3EE6 )
BCC 3EEE             ( 3EE9 )
INC.ABS 3E99         ( 3EEB )
JSR.ABS 3EB5         ( 3EEE )
CMP.ABS 3EA2         ( 3EF1 )
BMI 3F02             ( 3EF4 )
LDA.ZP D3            ( 3EF6 )
CLC                  ( 3EF8 )
ADC.# C0             ( 3EF9 )
STA.ZP D3            ( 3EFB )
LDA.# D8             ( 3EFD )
STA.ABS 3EA2         ( 3EFF )
DEX                  ( 3F02 )
BNE 3ED4             ( 3F03 )
LDX.ZP D1            ( 3F05 )
RTS                  ( 3F07 )
AT 3F08

( SET-RECORD-SCAN-POINTER | NFA 3F08 CFA 3F0E )
( Inferred descriptive name, not recovered original: Copies )
( the top Forth cell into $D2/$D3 and saves X in XSAVE; )
( native helper returns RTS without dropping parameters. )
( Assembly subroutine entry; returns with RTS. )
AT 3F08
( Header: flags, saved name and link )
BYTES 830000AAC53E
CELL 3F10 ( native entry point )
STX.ZP D1            ( 3F10 )
LDA.ZPX 00           ( 3F12 )
STA.ZP D2            ( 3F14 )
LDA.ZPX 01           ( 3F16 )
STA.ZP D3            ( 3F18 )
RTS                  ( 3F1A )
AT 3F1B

( SCAN-RAM-RECORD | NFA 3F1B CFA 3F21 )
( Inferred descriptive name, not recovered original: Sets )
( the wrap threshold to $A7, initializes $D2/$D3, scans )
( records, and drops both arguments; resulting address )
( remains in RECORD-POINTER. )
( Stack: index base -- )
AT 3F1B
( Header: flags, saved name and link )
BYTES 830000C3083F
CELL 3F23 ( native entry point )
LDA.# A7             ( 3F23 )
STA.ABS 3EA2         ( 3F25 )
JSR.ABS 3F10         ( 3F28 )
JSR.ABS 3ECD         ( 3F2B )
JMP.ABS 1057         ( 3F2E )
AT 3F31

( LENGTH-RECORD-TABLE: | NFA 3F31 CFA 3F3B )
( Inferred descriptive name, not recovered original: )
( Defining word stores a u16 total length and allocates )
( bytes. Its DOES> tail skips that length and indexes )
( variable-length records through $3F21, returning the )
( record header address. )
AT 3F31
( Header: flags, saved name and link )
BYTES 87000000000000C31B3F
DOCOL
t.<BUILDS t.DUP t., t.ALLOT t.DOES>
( Trailing code/data at 3F47; retained exactly )
BYTES 1616213FA93EE4137712
AT 3F51

( WORD-COUNT | NFA 3F51 CFA 3F58 )
( Inferred descriptive name, not recovered original: )
( Returns address+2 and the 16-bit length stored at address. )
AT 3F51
( Header: flags, saved name and link )
BYTES 84000000D4313F
DOCOL
t.DUP t.>R t.2+ t.R> t.@ t.;S
AT 3F66

( LENGTH-RECORD-ADDR | NFA 3F66 CFA 3F6D )
( Inferred descriptive name, not recovered original: Runs )
( $3F21 and fetches its resulting $D2/$D3 pointer. The )
( result points at the u16 length field. )
( Stack: index base -- record )
AT 3F66
( Header: flags, saved name and link )
BYTES 84000000C4513F
DOCOL
t.SCAN-RAM-RECORD t.RECORD-POINTER t.@ t.;S
AT 3F77

( STORE-QUOTED-RECORD | NFA 3F77 CFA 3F7F )
( Inferred descriptive name, not recovered original: Parses )
( text delimited by a double quote, copies the characters )
( after the record's u16 header, then stores the text )
( length in that header. )
( Stack: record -- )
AT 3F77
( Header: flags, saved name and link )
BYTES 8500000000D4663F
DOCOL
LIT16 0022 t.WORD t.HERE t.1+ t.OVER t.2+ t.HERE t.C@ t.CMOVE
t.HERE t.C@ t.SWAP t.! t.;S
AT 3F9F

( RECORD-OFFSET | NFA 3F9F CFA 3FA6 )
( Inferred descriptive name, not recovered original: )
( Preserves base, scans indexed record, and subtracts base )
( from the resulting pointer. )
( Stack: index base -- offset )
AT 3F9F
( Header: flags, saved name and link )
BYTES 84000000D5773F
DOCOL
t.>R t.R t.SCAN-RAM-RECORD t.RECORD-POINTER t.@ t.R> t.- t.;S
AT 3FB8

( BANKED-TRANSFER | NFA 3FB8 CFA 3FBE )
( Inferred descriptive name, not recovered original: )
( Nonzero selects sector transfer through PAD and the )
( logical bank-copy helpers; zero transfers directly )
( through normal RAM. Set by $5CED when loading banked )
( scene assets. )
( Stack: -- address )
AT 3FB8
( Header: flags, saved name and link )
BYTES 830000CD9F3F
DOVAR
CELL 0000
AT 3FC2

( w3FCA | NFA 3FC2 CFA 3FCA )
( Unknown erased name; CFA identifier )
AT 3FC2
( Header: flags, saved name and link )
BYTES 8500000000CBB83F
DOVAR
CELL 0000
AT 3FCE

( TRANSFER-BANK-OFFSET | NFA 3FCE CFA 3FD5 )
( Inferred descriptive name, not recovered original: )
( Logical bank offset advanced by B/BUF during the )
( PAD-staged disk transfer. )
( Stack: -- address )
AT 3FCE
( Header: flags, saved name and link )
BYTES 84000000CDC23F
DOVAR
CELL 0000
AT 3FD9

( PREPARE-SECTOR-BUFFER | NFA 3FD9 CFA 3FDF )
( Inferred descriptive name, not recovered original: In )
( normal mode leaves all three transfer arguments )
( unchanged. In banked mode replaces the address with PAD )
( after fetching a sector from the supplied logical bank )
( offset; retains first/count. )
( Stack: address first count -- buffer first count )
AT 3FD9
( Header: flags, saved name and link )
BYTES 830000D2CE3F
DOCOL
t.ROT t.BANKED-TRANSFER t.@
t.0BRANCH CELL 0012 ( -> 3FFB )
t.TRANSFER-BANK-OFFSET t.! t.PAD t.TRANSFER-BANK-OFFSET t.@
t.B/BUF t.FETCH-BANK-RANGE t.PAD
( label 3FFB )
t.ROT t.ROT t.;S
AT 4001

( ADVANCE-SECTOR-BUFFER | NFA 4001 CFA 4006 )
( Inferred descriptive name, not recovered original: For )
( normal RAM adds B/BUF; in banked mode keeps PAD, updates )
( the logical offset and copies a sector between PAD and )
( banked RAM according to S-L. )
( Stack: buffer -- next-buffer )
AT 4001
( Header: flags, saved name and link )
BYTES 8200CED93F
DOCOL
t.BANKED-TRANSFER t.@
t.0BRANCH CELL 0032 ( -> 4040 )
t.S-L t.@
t.0BRANCH CELL 0016 ( -> 402C )
t.PAD t.TRANSFER-BANK-OFFSET t.@ t.B/BUF t.STORE-BANK-RANGE
t.B/BUF t.TRANSFER-BANK-OFFSET t.+!
t.BRANCH CELL 0012 ( -> 403C )
( label 402C )
t.B/BUF t.TRANSFER-BANK-OFFSET t.+! t.PAD
t.TRANSFER-BANK-OFFSET t.@ t.B/BUF t.FETCH-BANK-RANGE
( label 403C )
t.BRANCH CELL 0006 ( -> 4044 )
( label 4040 )
t.B/BUF t.+
( label 4044 )
t.;S
AT 4046

( DIRECTORY-BUFFER | NFA 4046 CFA 404D )
( Inferred descriptive name, not recovered original: Points )
( at the PAD+B/BUF sector buffer loaded from DIRB by $4062. )
( Stack: -- address )
AT 4046
( Header: flags, saved name and link )
BYTES 84000000D20140
DOVAR
CELL 0000
AT 4051

( GROUP-END-SECTOR | NFA 4051 CFA 4057 )
( Inferred descriptive name, not recovered original: Set to )
( start sector plus sector count while $4062 resolves a )
( directory entry. )
( Stack: -- address )
AT 4051
( Header: flags, saved name and link )
BYTES 830000D04640
DOVAR
CELL 0000
AT 405B

( FIND-GAM-GROUP | NFA 405B CFA 4062 )
( Inferred descriptive name, not recovered original: Reads )
( directory sector DIRB, sums preceding one-byte group )
( lengths, compensates for the directory-sector hole and )
( returns start/count with zero error, or an error result. )
( Stack: group -- start count 0 | error )
AT 405B
( Header: flags, saved name and link )
BYTES 84000000D25140
DOCOL
t.PAD t.B/BUF t.+ t.DUP t.DIRECTORY-BUFFER t.! t.DIRB t.1 t.1
t.-DISK t.0=_12DE
t.0BRANCH CELL 0054 ( -> 40D0 )
t.1 LIT16 007F t.1 t.(DO)
( label 4088 )
t.OVER t.I t.=
t.0BRANCH CELL 002C ( -> 40BC )
t.SWAP t.DROP t.DUP t.DIRB t.> t.0=_12DE t.0=_12DE t.+
t.DIRECTORY-BUFFER t.@ t.I t.+ t.C@ t.2DUP t.+
t.GROUP-END-SECTOR t.! t.0 t.LEAVE
t.BRANCH CELL 000E ( -> 40C8 )
( label 40BC )
t.DIRECTORY-BUFFER t.@ t.I t.+ t.C@ t.+
( label 40C8 )
t.(LOOP) CELL FFBE ( -> 4088 )
t.BRANCH CELL 0006 ( -> 40D4 )
( label 40D0 )
t.DROP t.1
( label 40D4 )
t.;S
AT 40D6

( TRANSFER-GROUP-SECTORS | NFA 40D6 CFA 40DE )
( Inferred descriptive name, not recovered original: )
( Transfers consecutive sectors through -DISK using S-L; )
( skips the directory sector when encountered, )
( advances/stages the buffer and returns a zero/nonzero )
( error status. )
( Stack: address first count -- error )
AT 40D6
( Header: flags, saved name and link )
BYTES 8500000000CB5B40
DOCOL
t.PREPARE-SECTOR-BUFFER t.OVER t.+ t.OVER t.1 t.- t.OVER
t.DIRB t.SWAP t.<=< t.0=_12DE t.0=_12DE t.+ t.SWAP t.(DO)
( label 40FE )
t.I t.DIRB t.=
t.0BRANCH CELL 0008 ( -> 410E )
t.R> t.1+ t.>R
( label 410E )
t.DUP t.I t.1 t.S-L t.@ t.-DISK
t.0BRANCH CELL 000C ( -> 4128 )
t.DROP t.0 t.LEAVE
t.BRANCH CELL 0004 ( -> 412A )
( label 4128 )
t.ADVANCE-SECTOR-BUFFER
( label 412A )
t.(LOOP) CELL FFD2 ( -> 40FE )
t.0=_12DE t.;S
AT 4132

( DIRS | NFA 4132 CFA 4139 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $37E6 [DIRS] in contiguous 4-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 4132
( Header: flags, saved name and link )
BYTES 84000000D3D640
DOCOL
t.0 t.S-L t.! t.SWAP t.>R t.FIND-GAM-GROUP t.>R t.-DUP
t.0=_12DE
t.0BRANCH CELL 0005 ( -> 4154 )
LIT8 FF
( label 4154 )
t.R> t.R> t.;S
AT 415A

( DIRL | NFA 415A CFA 4161 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $380E [DIRL] in contiguous 4-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 415A
( Header: flags, saved name and link )
BYTES 84000000CC3241
DOCOL
t.1 t.S-L t.! t.SWAP t.>R t.FIND-GAM-GROUP t.R> t.SWAP t.ROT
t.;S
AT 4177

( -SE | NFA 4177 CFA 417D )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $382A [-SE] in contiguous 4-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 4177
( Header: flags, saved name and link )
BYTES 830000C55A41
DOVAR
CELL 0000
AT 4181

( DSL | NFA 4181 CFA 4187 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $3834 [DSL] in contiguous 4-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 4181
( Header: flags, saved name and link )
BYTES 830000CC7741
DOCOL
t.>R t.-DUP t.0=_12DE
t.0BRANCH CELL 0028 ( -> 41B9 )
t.R t.- t.DUP t.-SE t.! t.0<_12F3 t.0=_12DE
t.0BRANCH CELL 000A ( -> 41AD )
t.R> t.TRANSFER-GROUP-SECTORS
t.BRANCH CELL 000A ( -> 41B5 )
( label 41AD )
t.R> t.DROP t.2DROP t.2
( label 41B5 )
t.BRANCH CELL 0008 ( -> 41BF )
( label 41B9 )
t.SWAP t.R> t.2DROP
( label 41BF )
t.;S
AT 41C1

( EXPECTED-DISK-ID | NFA 41C1 CFA 41C7 )
( Inferred descriptive name, not recovered original: )
( Expected first byte of the GAM directory, initially 3. )
( $41D1 compares this against the disk before a group )
( transfer. )
( Stack: -- address )
AT 41C1
( Header: flags, saved name and link )
BYTES 830000C48141
DOVAR
CELL 0003
AT 41CB

( CHECK-GAM-DISK | NFA 41CB CFA 41D1 )
( Inferred descriptive name, not recovered original: Reads )
( DIRB into PAD; returns whether its first byte matches )
( EXPECTED-DISK-ID, or disk/error code. Preserves the )
( transfer arguments on success and removes them on failure. )
AT 41CB
( Header: flags, saved name and link )
BYTES 830000C4C141
DOCOL
t.PAD t.DIRB t.1 t.1 t.-DISK t.0=_12DE t.0=_12DE t.DUP
t.0=_12DE
t.0BRANCH CELL 0014 ( -> 41FB )
t.DROP t.PAD t.C@ t.EXPECTED-DISK-ID t.@ t.= t.0=_12DE t.3 t.*
( label 41FB )
t.DUP
t.0BRANCH CELL 000A ( -> 4209 )
t.>R t.DROP t.2DROP t.R>
( label 4209 )
t.-DUP t.0=_12DE t.;S
AT 420F

( GROUP-TRANSFER-ERROR | NFA 420F CFA 4215 )
( Inferred descriptive name, not recovered original: Stores )
( the last load/save result; $46C0 checks it to display an )
( error and $46FE retries until zero. )
( Stack: -- address )
AT 420F
( Header: flags, saved name and link )
BYTES 830000D2CB41
DOVAR
CELL 0000
AT 4219

( LOAD-GAM-GROUP | NFA 4219 CFA 4221 )
( Inferred descriptive name, not recovered original: Checks )
( disk ID, invokes DIRL/DSL and stores the result in )
( GROUP-TRANSFER-ERROR. )
( Stack: address count group -- )
AT 4219
( Header: flags, saved name and link )
BYTES 8500000000C40F42
DOCOL
t.CHECK-GAM-DISK
t.0BRANCH CELL 0006 ( -> 422D )
t.DIRL t.DSL
( label 422D )
t.GROUP-TRANSFER-ERROR t.! t.;S
AT 4233

( SAVE-GAM-GROUP | NFA 4233 CFA 423B )
( Inferred descriptive name, not recovered original: Checks )
( disk ID, invokes DIRS/DSL, updates the cached group )
( length, and writes the directory when a formerly empty )
( group was successfully allocated; stores the result at )
( $4215. )
( Stack: address count group -- )
AT 4233
( Header: flags, saved name and link )
BYTES 8500000000C51942
DOCOL
t.CHECK-GAM-DISK
t.0BRANCH CELL 004C ( -> 428D )
t.>R t.>R t.DUP t.R> t.R> t.2DUP t.>R t.>R t.DIRS t.DSL t.SWAP
t.DROP t.R> t.R> t.DIRECTORY-BUFFER t.@ t.+ t.DUP t.C@ t.>R
t.C! t.DUP t.0=_12DE t.R> t.0=_12DE t.*
t.0BRANCH CELL 0014 ( -> 428D )
t.DROP t.DIRECTORY-BUFFER t.@ t.DIRB t.1 t.0 t.-DISK t.0=_12DE
t.0=_12DE
( label 428D )
t.GROUP-TRANSFER-ERROR t.! t.;S
AT 4293

( PAUSE | NFA 4293 CFA 429B )
( Inferred descriptive name, not recovered original: Waits )
( for the RTCLOK low byte $14 to change once per requested )
( tick. )
AT 4293
( Header: flags, saved name and link )
BYTES 8500000000C53342
DOCOL
t.0 t.(DO)
( label 42A1 )
LIT8 14 t.C@
( label 42A6 )
t.DUP LIT8 14 t.C@ t.= t.0=_12DE
t.0BRANCH CELL FFF3 ( -> 42A6 )
t.DROP
t.(LOOP) CELL FFE8 ( -> 42A1 )
t.;S
AT 42BD

( ENABLE-DLI-AT | NFA 42BD CFA 42C3 )
( Inferred descriptive name, not recovered original: Sets )
( bit $80 in a display-list instruction byte to request a )
( DLI. )
( Stack: address -- )
AT 42BD
( Header: flags, saved name and link )
BYTES 830000A19342
DOCOL
t.DUP t.C@ LIT16 0080 t.OR t.SWAP t.C! t.;S
AT 42D5

( GAME-COLOR-TABLE | NFA 42D5 CFA 42DB )
( Inferred descriptive name, not recovered original: )
( Triplets read by COLOR-TABLE-DLI into COLPF0..2; $5E7E )
( installs the gameplay colors here. )
( Stack: -- address )
AT 42D5
( Header: flags, saved name and link )
BYTES 830000CCBD42
DOVAR
BYTES E4181C9C54C8785420202020202020202020
AT 42EF

( DLI-COLOR-OFFSET | NFA 42EF CFA 42F5 )
( Inferred descriptive name, not recovered original: Byte )
( index into the color table; native DLI advances by three )
( and resets after VCOUNT reaches $40. )
( Stack: -- address )
AT 42EF
( Header: flags, saved name and link )
BYTES 830000D3D542
DOVAR
CELL 0000
AT 42F9

( DLI-COLOR-POINTER | NFA 42F9 CFA 4300 )
( Inferred descriptive name, not recovered original: )
( Constant $DB, zero-page pointer dereferenced by the )
( color-table DLI. )
( Stack: -- address )
AT 42F9
( Header: flags, saved name and link )
BYTES 84000000CCEF42
DOCON
CELL 00DB
AT 4304

( NMI-ENABLE-SHADOW | NFA 4304 CFA 430A )
( Inferred descriptive name, not recovered original: )
( Software shadow for NMIEN; installation ORs in $E0, while )
( $437A selects $60 and copies fixed colors. )
( Stack: -- address )
AT 4304
( Header: flags, saved name and link )
BYTES 830000C9F942
DOVAR
CELL 0060
AT 430E

( COLOR-TABLE-DLI | NFA 430E CFA 4315 )
( Inferred descriptive name, not recovered original: Native )
( interrupt handler preserves A/Y, sends successive table )
( triplets to GTIA $D016..$D018 and returns RTI. )
( Interrupt entry; returns with RTI. )
AT 430E
( Header: flags, saved name and link )
BYTES 84000000A90443
CELL 4317 ( native entry point )
PHP                  ( 4317 )
PHA                  ( 4318 )
TYA                  ( 4319 )
PHA                  ( 431A )
LDY.ABS 42F7         ( 431B )
CLC                  ( 431E )
LDA.INDY DB          ( 431F )
STA.ABS D016         ( 4321 )
INY                  ( 4324 )
LDA.INDY DB          ( 4325 )
STA.ABS D017         ( 4327 )
INY                  ( 432A )
LDA.INDY DB          ( 432B )
STA.ABS D018         ( 432D )
INY                  ( 4330 )
LDA.ABS D40B         ( 4331 )
CMP.# 40             ( 4334 )
BMI 433A             ( 4336 )
LDY.# 00             ( 4338 )
STY.ABS 42F7         ( 433A )
PLA                  ( 433D )
TAY                  ( 433E )
PLA                  ( 433F )
PLP                  ( 4340 )
RTI                  ( 4341 )
AT 4342

( INSTALL-COLOR-DLI | NFA 4342 CFA 4349 )
( Inferred descriptive name, not recovered original: Stores )
( native $4317 in VDSLST [$0200], clears its table index )
( and enables NMI bits in both the shadow and $D40E. )
( Stack: -- )
AT 4342
( Header: flags, saved name and link )
BYTES 84000000CC0E43
DOCOL
LIT16 4317 LIT16 0200 t.! t.0 t.DLI-COLOR-OFFSET t.!
t.NMI-ENABLE-SHADOW t.C@ LIT16 00E0 t.OR t.DUP
t.NMI-ENABLE-SHADOW t.C! LIT16 D40E t.C! t.;S
AT 4373

( PAUSE-COLOR-DLI | NFA 4373 CFA 437A )
( Inferred descriptive name, not recovered original: )
( Selects NMI mask $60, waits a frame, and copies the first )
( color triplet to OS shadows $02C4 and live GTIA $D016 )
( before disabling DLI. )
( Stack: -- )
AT 4373
( Header: flags, saved name and link )
BYTES 84000000CC4243
DOCOL
LIT16 0060 t.NMI-ENABLE-SHADOW t.C! t.1 t.PAUSE
t.DLI-COLOR-POINTER t.@ LIT16 02C4 LIT16 0003 t.CMOVE
LIT16 0060 LIT16 D40E t.C! t.DLI-COLOR-POINTER t.@ LIT16 D016
LIT16 0003 t.CMOVE t.;S
AT 43B0

( #RT | NFA 43B0 CFA 43B6 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $4857 [#RT] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 43B0
( Header: flags, saved name and link )
BYTES 830000D47343
DOVAR
BYTES 000005
AT 43BB

( #RTC | NFA 43BB CFA 43C2 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $4863 [#RTC] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 43BB
( Header: flags, saved name and link )
BYTES 84000000C3B043
DOVAR
BYTES D1D7C5C11DC4DAD8C32020
AT 43CF

( EKP | NFA 43CF CFA 43D5 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $4876 [EKP] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 43CF
( Header: flags, saved name and link )
BYTES 830000D0BB43
DOCON
CELL 00D2
AT 43D9

( #L | NFA 43D9 CFA 43DE )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $487F [#L] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 43D9
( Header: flags, saved name and link )
BYTES 8200CCCF43
DOCON
CELL 00D4
AT 43E2

( 40+ | NFA 43E2 CFA 43E8 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $4889 [40+] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 43E2
( Header: flags, saved name and link )
BYTES 830000ABD943
CELL 43EA ( native entry point )
CLC                  ( 43EA )
LDA.ZP D2            ( 43EB )
ADC.# 28             ( 43ED )
STA.ZP D2            ( 43EF )
LDA.ZP D3            ( 43F1 )
ADC.# 00             ( 43F3 )
STA.ZP D3            ( 43F5 )
RTS                  ( 43F7 )
AT 43F8

( G#D | NFA 43F8 CFA 43FE )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $489F [G#D] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 43F8
( Header: flags, saved name and link )
BYTES 830000C4E243
CELL 4400 ( native entry point )
LDY.# 00             ( 4400 )
LDA.ABS 43B8         ( 4402 )
STA.INDY D2          ( 4405 )
INY                  ( 4407 )
LDA.ABS 43B9         ( 4408 )
STA.INDY D2          ( 440B )
INY                  ( 440D )
TYA                  ( 440E )
LDX.ZP D1            ( 440F )
CMP.ZPX 02           ( 4411 )
BNE 4408             ( 4413 )
DEY                  ( 4415 )
LDA.ABS 43BA         ( 4416 )
STA.INDY D2          ( 4419 )
RTS                  ( 441B )
AT 441C

( G# | NFA 441C CFA 4421 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $48C2 [G#] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 441C
( Header: flags, saved name and link )
BYTES 8200A3F843
CELL 4423 ( native entry point )
STX.ZP D1            ( 4423 )
JSR.ABS 4400         ( 4425 )
JSR.ABS 43EA         ( 4428 )
LDX.ZP D1            ( 442B )
JMP.ABS 0F47         ( 442D )
AT 4430

( D# | NFA 4430 CFA 4435 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $48D6 [D#] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 4430
( Header: flags, saved name and link )
BYTES 8200A31C44
CELL 4437 ( native entry point )
STX.ZP D1            ( 4437 )
JSR.ABS 4400         ( 4439 )
LDX.ZP D1            ( 443C )
JMP.ABS 1057         ( 443E )
AT 4441

( S# | NFA 4441 CFA 4446 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $48E7 [S#] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 4441
( Header: flags, saved name and link )
BYTES 8200A33044
CELL 4448 ( native entry point )
STX.ZP D1            ( 4448 )
LDA.# 02             ( 444A )
STA.ZP D4            ( 444C )
JSR.ABS 4400         ( 444E )
JSR.ABS 43EA         ( 4451 )
INC.ZP D4            ( 4454 )
LDA.ZP D4            ( 4456 )
LDX.ZP D1            ( 4458 )
CMP.ZPX 00           ( 445A )
BNE 444E             ( 445C )
LDX.ZP D1            ( 445E )
JMP.ABS 0F47         ( 4460 )
AT 4463

( [RAM] | NFA 4463 CFA 446B )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $490C [[RAM]] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 4463
( Header: flags, saved name and link )
BYTES 8500000000A94144
DOCOL
t.#RTC t.#RT t.3 t.CMOVE t.G# t.#RTC t.3 t.+ t.#RT t.3 t.CMOVE
t.S# t.#RTC LIT16 0006 t.+ t.#RT t.3 t.CMOVE t.D# t.;S
AT 4497

( DRAW-TEXT-FRAME | NFA 4497 CFA 449C )
( Inferred descriptive name, not recovered original: )
( Computes screen address from SAVMSC, column and row; )
( invokes [RAM], then advances text coordinates into the )
( frame interior. )
( Stack: width height -- )
AT 4497
( Header: flags, saved name and link )
BYTES 8200AA6344
DOCOL
LIT8 58 t.@ t.Y@ LIT8 28 t.* t.+ t.X@ t.+ t.EKP t.! t.(RAM)
t.X@ t.1+ t.X! t.Y@ t.1+ t.Y! t.;S
AT 44C4

( DRAW-CENTERED-TEXT-FRAME | NFA 44C4 CFA 44CD )
( Inferred descriptive name, not recovered original: Sets )
( column to 20-width/2 and draws the frame at the current )
( row. )
( Stack: width height -- )
AT 44C4
( Header: flags, saved name and link )
BYTES 860000000000C19744
DOCOL
t.OVER t.2 t./ LIT8 14 t.SWAP t.- t.X! t.DRAW-TEXT-FRAME t.;S
AT 44E2

( MESSAGE-FIRST-LINE-WIDTH | NFA 44E2 CFA 44E8 )
( Inferred descriptive name, not recovered original: $44FB )
( stores the first or second line width plus four here; )
( later UI code can size message choices from this value. )
( Stack: -- address )
AT 44E2
( Header: flags, saved name and link )
BYTES 830000CBC444
DOVAR
CELL 0000
AT 44EC

( MESSAGE-FRAME-WIDTH | NFA 44EC CFA 44F1 )
( Inferred descriptive name, not recovered original: Stores )
( maximum counted-line length plus four, with a )
( seven-column special case for a single-line message. )
( Stack: -- address )
AT 44EC
( Header: flags, saved name and link )
BYTES 8200D2E244
DOVAR
CELL 0000
AT 44F5

( MEASURE-MESSAGE | NFA 44F5 CFA 44FB )
( Inferred descriptive name, not recovered original: Walks )
( a line-count byte followed by counted strings, computes )
( maximum width+4, stores width fields and uses width seven )
( when there is only one line. )
( Stack: message -- width )
AT 44F5
( Header: flags, saved name and link )
BYTES 830000CDEC44
DOCOL
t.0 t.SWAP t.COUNT t.DUP t.>R t.0 t.(DO)
( label 450B )
t.SWAP t.OVER t.C@ t.I t.0=_12DE t.I t.1 t.= t.+
t.0BRANCH CELL 000D ( -> 452C )
t.DUP LIT8 04 t.+ t.MESSAGE-FIRST-LINE-WIDTH t.!
( label 452C )
t.MAX t.SWAP t.COUNT t.+
t.(LOOP) CELL FFD5 ( -> 450B )
t.DROP LIT8 04 t.+ t.DUP t.MESSAGE-FRAME-WIDTH t.! t.R> t.1
t.=
t.0BRANCH CELL 000F ( -> 455C )
LIT8 07 t.DUP t.MESSAGE-FRAME-WIDTH t.!
t.MESSAGE-FIRST-LINE-WIDTH t.!
( label 455C )
t.;S
AT 455E

( NEXT-TEXT-ROW | NFA 455E CFA 4564 )
( Inferred descriptive name, not recovered original: )
( Increments the OS text row through Y@ and Y!. )
( Stack: -- )
AT 455E
( Header: flags, saved name and link )
BYTES 830000ABF544
DOCOL
t.Y@ t.1+ t.Y! t.;S
AT 456E

( PRINT-CENTERED-LINES | NFA 456E CFA 4574 )
( Inferred descriptive name, not recovered original: Walks )
( the counted-line message, sets each starting column to )
( 20-length/2, prints via STYPE, and advances the row. )
( Stack: message -- )
AT 456E
( Header: flags, saved name and link )
BYTES 830000D05E45
DOCOL
t.COUNT t.0 t.(DO)
( label 457C )
t.DUP t.COUNT LIT8 14 t.OVER t.2 t./ t.- t.X! t.STYPE
t.NEXT-TEXT-ROW t.COUNT t.+
t.(LOOP) CELL FFE5 ( -> 457C )
t.DROP t.;S
AT 459D

( SHOW-MESSAGE | NFA 459D CFA 45A4 )
( Inferred descriptive name, not recovered original: For a )
( nonempty counted-line group, clears following text rows, )
( measures and draws its frame, prints centered lines, and )
( restores the original row. )
( Stack: message -- )
AT 459D
( Header: flags, saved name and link )
BYTES 84000000D46E45
DOCOL
t.DUP t.C@
t.0BRANCH CELL 0041 ( -> 45ED )
t.Y@ LIT8 58 t.@ t.Y@ t.1+ LIT8 28 t.* t.+ LIT8 0B t.Y@ t.1+
t.- LIT8 28 t.* t.ERASE t.NEXT-TEXT-ROW t.SWAP t.DUP
t.MEASURE-MESSAGE t.OVER t.C@ t.2+ t.DRAW-CENTERED-TEXT-FRAME
t.PRINT-CENTERED-LINES t.Y! t.0 t.X!
( ATASCII text:  [1E] )
t.(.")
BYTES 02201E
( label 45ED )
t.;S
AT 45EF

( DISK-ERROR-MESSAGES | NFA 45EF CFA 45F5 )
( Inferred descriptive name, not recovered original: )
( u16-length vector of Polish tape/disk prompts, including )
( PODAJ STAN LICZNIKA and error/insertion messages; )
( consumed by $468C after transfer failures. )
( Stack: index -- record )
( Decoded text: Disk and tape messages )
( item 0 line 1 $45FF: PODAJ STAN LICZNIKA )
( item 0 line 2 $4613: W MAGNETOFONIE )
( item 1 line 1 $4625: BLAD DYSKOWY )
( item 1 line 2 $4632: WLACZYLES STACJE? )
( item 1 line 3 $4644: RETURN )
( item 2 line 1 $464E: USTAW TASME Z GRA NA )
( item 2 line 2 $4663:   )
( item 2 line 3 $4665: RETURN )
( item 3 line 1 $466F: NIE TEN DYSK )
( item 3 line 2 $467C: RETURN )
AT 45EF
( Header: flags, saved name and link )
BYTES 830000D59D45
DODOES
( DOES> thread at 3F47 )
BYTES 473F890024000213504F44414A3D5354414E3D4C49435A4E494B410E
BYTES 573D4D41474E45544F464F4E49452700030C426C61443D4459534B4F
BYTES 575911576C61435A596C45733D535441434A653F0652455455524E1F
BYTES 00031455535441573D5441734D653D5A3D4752613D4E41013D065245
BYTES 5455524E1500020C4E49453D54454E3D4459534B0652455455524E14
BYTES A5
AT 4684

( SHOW-DISK-ERROR | NFA 4684 CFA 468C )
( Inferred descriptive name, not recovered original: )
( Indexes the disk-error vector, skips its u16 header and )
( displays the multiline message. )
( Stack: error -- )
AT 4684
( Header: flags, saved name and link )
BYTES 8500000000D5EF45
DOCOL
t.DISK-ERROR-MESSAGES t.2+ t.SHOW-MESSAGE t.;S
AT 4696

( CLEAR-TEXT-AREA | NFA 4696 CFA 469B )
( Inferred descriptive name, not recovered original: Erases )
( $1B8 bytes from SAVMSC and resets text position to 0,0. )
( Stack: -- )
AT 4696
( Header: flags, saved name and link )
BYTES 8200C58446
DOCOL
LIT8 58 t.@ LIT16 01B8 t.ERASE t.0 t.0 t.POS t.;S
AT 46B0

( TRANSFER-IS-LOAD | NFA 46B0 CFA 46B6 )
( Inferred descriptive name, not recovered original: )
( Selects $4221 load when nonzero or $423B save when zero )
( in $46C0. )
( Stack: -- address )
AT 46B0
( Header: flags, saved name and link )
BYTES 830000D39646
DOVAR
CELL 0000
AT 46BA

( TRY-GROUP-TRANSFER | NFA 46BA CFA 46C0 )
( Inferred descriptive name, not recovered original: Keeps )
( transfer arguments, clears text, pauses the DLI, tries )
( load/save, resumes DLI, and displays/acknowledges an )
( error if needed. )
( Stack: address count group -- address count group )
AT 46BA
( Header: flags, saved name and link )
BYTES 830000AAB046
DOCOL
t.>R t.2DUP t.R t.ROT t.ROT t.CLEAR-TEXT-AREA
t.PAUSE-COLOR-DLI t.R> t.TRANSFER-IS-LOAD t.@
t.0BRANCH CELL 0008 ( -> 46E0 )
t.LOAD-GAM-GROUP
t.BRANCH CELL 0004 ( -> 46E2 )
( label 46E0 )
t.SAVE-GAM-GROUP
( label 46E2 )
t.GROUP-TRANSFER-ERROR t.@ t.INSTALL-COLOR-DLI
t.0BRANCH CELL 000C ( -> 46F6 )
t.GROUP-TRANSFER-ERROR t.@ t.SHOW-DISK-ERROR t.KEY t.DROP
( label 46F6 )
t.;S
AT 46F8

( RETRY-GROUP-TRANSFER | NFA 46F8 CFA 46FE )
( Inferred descriptive name, not recovered original: )
( Repeats $46C0 until the stored transfer error is zero, )
( then drops the retained transfer arguments. )
( Stack: address count group -- )
AT 46F8
( Header: flags, saved name and link )
BYTES 830000BFBA46
DOCOL
( label 4700 )
t.TRY-GROUP-TRANSFER t.GROUP-TRANSFER-ERROR t.@ t.0=_12DE
t.0BRANCH CELL FFF6 ( -> 4700 )
t.DROP t.2DROP t.;S
AT 4712

( READ-RESOURCE-GROUP | NFA 4712 CFA 4718 )
( Inferred descriptive name, not recovered original: Sets )
( transfer mode to read and invokes the retrying transfer. )
( Stack: address count group -- )
AT 4712
( Header: flags, saved name and link )
BYTES 830000BFF846
DOCOL
t.1 t.TRANSFER-IS-LOAD t.! t.RETRY-GROUP-TRANSFER t.;S
AT 4724

( WRITE-RESOURCE-GROUP | NFA 4724 CFA 472A )
( Inferred descriptive name, not recovered original: Sets )
( transfer mode to write and invokes the retrying transfer. )
( Stack: address count group -- )
AT 4724
( Header: flags, saved name and link )
BYTES 830000BF1247
DOCOL
t.0 t.TRANSFER-IS-LOAD t.! t.RETRY-GROUP-TRANSFER t.;S
AT 4736

( READ-BANK-RECORD-LENGTH | NFA 4736 CFA 473C )
( Inferred descriptive name, not recovered original: Native )
( helper reads the u16 at [$D2],Y into RECORD-SPAN; returns )
( RTS. Used while OS ROM is switched out. )
( Assembly subroutine entry; returns with RTS. )
AT 4736
( Header: flags, saved name and link )
BYTES 830000AA2447
CELL 473E ( native entry point )
LDA.INDY D2          ( 473E )
STA.ABS 3E98         ( 4740 )
INY                  ( 4743 )
LDA.INDY D2          ( 4744 )
STA.ABS 3E99         ( 4746 )
RTS                  ( 4749 )
AT 474A

( SCAN-BANK-RECORD | NFA 474A CFA 4751 )
( Inferred descriptive name, not recovered original: Sets )
( banked scanning threshold, exposes RAM under OS, scans to )
( the indexed record, reads its length, restores PORTB/IRQs )
( and drops both arguments. )
( Stack: index base -- )
AT 474A
( Header: flags, saved name and link )
BYTES 84000000C33647
CELL 4753 ( native entry point )
LDA.# 00             ( 4753 )
STA.ABS 3EA2         ( 4755 )
JSR.ABS 3F10         ( 4758 )
JSR.ABS 3C69         ( 475B )
JSR.ABS 3ECD         ( 475E )
JSR.ABS 473E         ( 4761 )
INC.ABS D301         ( 4764 )
CLI                  ( 4767 )
JMP.ABS 1057         ( 4768 )
AT 476B

( BANK-RECORD-RANGE | NFA 476B CFA 4771 )
( Inferred descriptive name, not recovered original: Scans )
( a banked record, skips its u16 header, converts the )
( physical address to a logical offset [subtracting $D800 )
( or $9800], and returns its payload length. )
( Stack: index base -- offset length )
AT 476B
( Header: flags, saved name and link )
BYTES 830000CC4A47
DOCOL
t.SCAN-BANK-RECORD t.RECORD-POINTER t.@ t.2+ t.DUP LIT16 D7FF
t.>
t.0BRANCH CELL 000C ( -> 4791 )
LIT16 D800 t.-
t.BRANCH CELL 0008 ( -> 4797 )
( label 4791 )
LIT16 9800 t.-
( label 4797 )
t.RECORD-SPAN t.@ t.;S
AT 479D

( NESTED-BANK-RECORD | NFA 479D CFA 47A4 )
( Inferred descriptive name, not recovered original: First )
( indexes a collection at banked base $D800, then indexes )
( its nested record and returns the logical payload range. )
( Stack: index collection -- offset length )
AT 479D
( Header: flags, saved name and link )
BYTES 84000000CC6B47
DOCOL
LIT16 D800 t.SCAN-BANK-RECORD t.RECORD-POINTER t.@ t.2+
t.BANK-RECORD-RANGE t.;S
AT 47B6

( BANK-RESOURCE-RANGE | NFA 47B6 CFA 47BD )
( Inferred descriptive name, not recovered original: Uses )
( banked base $D800 and returns the indexed resource's )
( payload offset and length. )
( Stack: index -- offset length )
AT 47B6
( Header: flags, saved name and link )
BYTES 84000000CC9D47
DOCOL
LIT16 D800 t.BANK-RECORD-RANGE t.;S
AT 47C7

( RESOURCE-BASE | NFA 47C7 CFA 47CD )
( Inferred descriptive name, not recovered original: )
( Startup selects $A050 for introduction resources and )
( $A3E0 for gameplay resources. )
AT 47C7
( Header: flags, saved name and link )
BYTES 830000C1B647
DOVAR
CELL A3E0
AT 47D1

( RESOURCE-BASE@ | NFA 47D1 CFA 47D7 )
( Inferred descriptive name, not recovered original: )
( Fetches the visible resource collection base from )
( RESOURCE-BASE, initially $A3E0. )
( Stack: -- address )
AT 47D1
( Header: flags, saved name and link )
BYTES 830000C1C747
DOCOL
t.RESOURCE-BASE t.@ t.;S
AT 47DF

( PICTURE-STAGING-BASE | NFA 47DF CFA 47E5 )
( Inferred descriptive name, not recovered original: )
( Pointer cell initially $A392; its fetched address )
( receives decoded object pictures before composition. )
( Stack: -- address )
AT 47DF
( Header: flags, saved name and link )
BYTES 830000DAD147
DOVAR
CELL A392
AT 47E9

( PICTURE-STAGING@ | NFA 47E9 CFA 47EF )
( Inferred descriptive name, not recovered original: )
( Fetches PICTURE-STAGING-BASE; $58F1 decodes item art here )
( and $54AB composites it into the scene picture. )
( Stack: -- address )
AT 47E9
( Header: flags, saved name and link )
BYTES 830000DADF47
DOCOL
t.PICTURE-STAGING-BASE t.@ t.;S
AT 47F7

( RESOURCE-ADDR | NFA 47F7 CFA 47FE )
( Inferred descriptive name, not recovered original: )
( Indexes a u16-length record at RESOURCE-BASE through )
( $3F6D; returns its length header. )
( Stack: index -- record )
AT 47F7
( Header: flags, saved name and link )
BYTES 84000000C2E947
DOCOL
t.RESOURCE-BASE@ t.LENGTH-RECORD-ADDR t.;S
AT 4806

( FETCH-RESOURCE-TO | NFA 4806 CFA 480C )
( Inferred descriptive name, not recovered original: )
( Resolves a banked resource payload and copies it to the )
( supplied normal-RAM destination. )
( Stack: index destination -- )
AT 4806
( Header: flags, saved name and link )
BYTES 830000CDF747
DOCOL
t.SWAP t.BANK-RESOURCE-RANGE t.FETCH-BANK-RANGE t.;S
AT 4816

( FETCH-NESTED-RESOURCE | NFA 4816 CFA 481D )
( Inferred descriptive name, not recovered original: )
( Resolves a nested banked resource and copies its payload )
( to the supplied destination. )
( Stack: index collection destination -- )
AT 4816
( Header: flags, saved name and link )
BYTES 84000000CD0648
DOCOL
t.ROT t.ROT t.NESTED-BANK-RECORD t.FETCH-BANK-RANGE t.;S
AT 4829

( FETCH-RESOURCE | NFA 4829 CFA 4830 )
( Inferred descriptive name, not recovered original: Copies )
( the chosen banked resource into the visible RESOURCE-BASE )
( buffer. )
( Stack: index -- )
AT 4829
( Header: flags, saved name and link )
BYTES 84000000CD1648
DOCOL
t.RESOURCE-BASE@ t.FETCH-RESOURCE-TO t.;S
AT 4838

( WAIT-RASTER-HALF | NFA 4838 CFA 483D )
( Inferred descriptive name, not recovered original: Native )
( loop waits for VCOUNT bit7 to clear and then set; returns )
( RTS. Used to synchronize player positions and graphics )
( work. )
( Assembly subroutine entry; returns with RTS. )
AT 4838
( Header: flags, saved name and link )
BYTES 8200BC2948
CELL 483F ( native entry point )
LDA.ABS D40B         ( 483F )
BMI 483F             ( 4842 )
LDA.ABS D40B         ( 4844 )
BPL 4844             ( 4847 )
RTS                  ( 4849 )
AT 484A

( WAIT-RASTER | NFA 484A CFA 484F )
( Inferred descriptive name, not recovered original: Calls )
( the native raster wait at $483F and returns to Forth NEXT. )
( Stack: -- )
AT 484A
( Header: flags, saved name and link )
BYTES 8200AA3848
CELL 4851 ( native entry point )
JSR.ABS 483F         ( 4851 )
JMP.ABS 0F47         ( 4854 )
AT 4857

( BITMAP-BASE | NFA 4857 CFA 485E )
( Inferred descriptive name, not recovered original: Set )
( from the second cell of a screen description at $48C4; )
( drawing computes bitmap byte address as base+x+40*y. )
( Stack: -- address )
AT 4857
( Header: flags, saved name and link )
BYTES 84000000D24A48
DOVAR
CELL 0000
AT 4862

( EXPAND-SCREEN-DESCRIPTOR | NFA 4862 CFA 486A )
( Inferred descriptive name, not recovered original: Reads )
( the destination cell, then expands )
( width/row-count/pattern records sequentially into )
( destination RAM until a zero pattern terminator. Consumes )
( the descriptor address; runtime test expands width2, )
( rows3, pattern11/22 into six bytes. )
( Stack: descriptor -- )
AT 4862
( Header: flags, saved name and link )
BYTES 8500000000D65748
DOCOL
t.DUP t.@ t.SWAP t.2+ t.SWAP
( label 4876 )
t.OVER t.DUP t.C@ t.SWAP t.1+ t.C@ t.* t.OVER t.+ t.DUP t.>R
t.SWAP t.(DO)
( label 4890 )
t.DUP t.2+ t.OVER t.C@ t.I t.SWAP t.CMOVE t.DUP t.C@
t.(+LOOP) CELL FFEC ( -> 4890 )
t.DUP t.C@ t.+ t.2+ t.R> t.OVER t.@ t.0=_12DE
t.0BRANCH CELL FFBE ( -> 4876 )
t.2DROP t.;S
AT 48BE

( INSTALL-SCREEN-DESCRIPTOR | NFA 48BE CFA 48C4 )
( Inferred descriptive name, not recovered original: Loads )
( SAVMSC and BITMAP-BASE from the first two descriptor )
( cells, expands the display-list patterns beginning at the )
( third cell, then installs that cell's destination address )
( in SDLSTL $0230. )
( Stack: address -- )
AT 48BE
( Header: flags, saved name and link )
BYTES 830000CC6248
DOCOL
t.DUP t.@ LIT16 0058 t.! t.2+ t.DUP t.@ t.BITMAP-BASE t.! t.2+
t.DUP t.EXPAND-SCREEN-DESCRIPTOR t.@ LIT16 0230 t.! t.;S
AT 48EA

( FRAME-PATTERN-DATA | NFA 48EA CFA 48EF )
( Inferred descriptive name, not recovered original: Two )
( patterned frame records include alternating $5A bytes and )
( display-line pointers; $4B5B copies their borders into )
( the room bitmap. )
( Stack: -- address )
AT 48EA
( Header: flags, saved name and link )
BYTES 8200CFBE48
DOVAR
BYTES 00000AA45A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A
BYTES 5A5A5A5A5A5A5A5A2A90000000000EA45A5A5A5A5A5A5A5A5A5A5A5A
BYTES 5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A3A900000437C
AT 4943

( TRANSITION-PATTERN-DATA | NFA 4943 CFA 4949 )
( Inferred descriptive name, not recovered original: )
( Companion pattern records filled with $05 bytes; $4ABE )
( uses them while animating display-list/frame pointers. )
( Stack: -- address )
AT 4943
( Header: flags, saved name and link )
BYTES 830000B1EA48
DOVAR
BYTES 00000AA4050505050505050505050505050505050505050505050505
BYTES 05050505050505052A90000000000EA4050505050505050505050505
BYTES 05050505050505050505050505050505050505053A900000BA30
AT 499D

( GAME-SCREEN-DESCRIPTOR | NFA 499D CFA 49A5 )
( Inferred descriptive name, not recovered original: )
( Despite its saved DOCOL code field, the body is )
( screen-description data beginning at $49A7. $4C29/$4C3E )
( pass that literal address to $48C4; it is not executed as )
( Forth. )
( Data body referenced by literal address; do not execute )
( its saved DOCOL entry. )
AT 499D
( Header: flags, saved name and link )
BYTES 8500000000CC4349
DOCOL
( Trailing code/data at 49A7; retained exactly )
BYTES 48BA30A800A7090170704400A84E4B490E04374EF1480E03014420BA
BYTES 010B0403014100A700007712
AT 49CF

( DISPLAY-LINE-POINTERS | NFA 49CF CFA 49D5 )
( Inferred descriptive name, not recovered original: )
( Constant $A706 is the first display-list address field )
( modified by the screen-transition routines. )
( Stack: -- address )
AT 49CF
( Header: flags, saved name and link )
BYTES 830000CC9D49
DOCON
CELL A706
AT 49D9

( TRANSITION-ROW-PAIRS | NFA 49D9 CFA 49DF )
( Inferred descriptive name, not recovered original: )
( Constant 56 is the transition loop bound; a displayed )
( 112-row room uses paired rows. )
( Stack: -- count )
AT 49D9
( Header: flags, saved name and link )
BYTES 830000CCCF49
DOCON
CELL 0038
AT 49E3

( TRANSITION-POINTERS | NFA 49E3 CFA 49E9 )
( Inferred descriptive name, not recovered original: Two )
( mutable cells hold the value to write and the address to )
( patch; native $4A0B writes the first cell through the )
( second. )
( Stack: -- address )
AT 49E3
( Header: flags, saved name and link )
BYTES 830000C4D949
DOVAR
BYTES 00000541
AT 49EF

( TRANSITION-INCREMENTS | NFA 49EF CFA 49F5 )
( Inferred descriptive name, not recovered original: Pair )
( of increments added to transition value/address after )
( each synchronized update. )
( Stack: -- address )
AT 49EF
( Header: flags, saved name and link )
BYTES 830000C4E349
DOVAR
BYTES 00000541
AT 49FB

( TRANSITION-RASTER-OFFSET | NFA 49FB CFA 4A01 )
( Inferred descriptive name, not recovered original: )
( Initial value eight is added to a display-list-relative )
( row calculation before comparing it to VCOUNT in $4A0B. )
( Stack: -- address )
AT 49FB
( Header: flags, saved name and link )
BYTES 830000D5EF49
DOVAR
CELL 0008
AT 4A05

( PATCH-DISPLAY-LINE | NFA 4A05 CFA 4A0B )
( Inferred descriptive name, not recovered original: Waits )
( until the beam has passed the relevant four-scanline )
( interval, then writes TRANSITION-POINTERS' value through )
( $F0. )
( Stack: -- )
AT 4A05
( Header: flags, saved name and link )
BYTES 830000A1FB49
CELL 4A0D ( native entry point )
CLC                  ( 4A0D )
LSR.ZP F3            ( 4A0E )
ROR.ZP F2            ( 4A10 )
CLC                  ( 4A12 )
LSR.ZP F3            ( 4A13 )
ROR.ZP F2            ( 4A15 )
LDA.ZP F2            ( 4A17 )
CLC                  ( 4A19 )
ADC.ABS 4A03         ( 4A1A )
CMP.ABS D40B         ( 4A1D )
BCS 4A2A             ( 4A20 )
CLC                  ( 4A22 )
ADC.# 04             ( 4A23 )
CMP.ABS D40B         ( 4A25 )
BCS 4A25             ( 4A28 )
LDY.# 00             ( 4A2A )
LDA.ABS 49EB         ( 4A2C )
STA.INDY F0          ( 4A2F )
INY                  ( 4A31 )
LDA.ABS 49EC         ( 4A32 )
STA.INDY F0          ( 4A35 )
JMP.ABS 0F47         ( 4A37 )
AT 4A3A

( ANIMATE-DISPLAY-LINES | NFA 4A3A CFA 4A40 )
( Inferred descriptive name, not recovered original: )
( Repeatedly synchronizes raster, patches a display-line )
( pointer, and updates pointer values/increments from )
( $49E9/$49F5; used by two room transition effects. )
AT 4A3A
( Header: flags, saved name and link )
BYTES 830000CC054A
DOCOL
t.0 t.WAIT-RASTER t.(DO)
( label 4A48 )
t.TRANSITION-POINTERS t.2+ t.@ t.DUP t.GRAPHICS-SOURCE-PTR t.!
t.DISPLAY-LINE-POINTERS t.- t.GRAPHICS-DEST-PTR t.!
t.PATCH-DISPLAY-LINE t.TRANSITION-INCREMENTS t.@ t.OVER t.+-
t.TRANSITION-POINTERS t.+! t.TRANSITION-INCREMENTS t.2+ t.@
t.OVER t.+- t.TRANSITION-POINTERS t.2+ t.+! t.>R t.OVER t.R>
t.SWAP t.TRANSITION-INCREMENTS t.+! t.OVER
t.TRANSITION-INCREMENTS t.2+ t.+! t.MINUS
t.(LOOP) CELL FFB6 ( -> 4A48 )
t.2DROP t.DROP t.;S
AT 4A9A

( TRANSITION-PARAMETERS! | NFA 4A9A CFA 4AA0 )
( Inferred descriptive name, not recovered original: Stores )
( value and address in $49E9, then the value/address )
( increments in $49F5. )
( Stack: address-step value-step address value -- )
AT 4A9A
( Header: flags, saved name and link )
BYTES 830000A13A4A
DOCOL
t.TRANSITION-POINTERS t.! t.TRANSITION-POINTERS t.2+ t.!
t.TRANSITION-INCREMENTS t.! t.TRANSITION-INCREMENTS t.2+ t.!
t.;S
AT 4AB8

( CLOSE-SCENE-TRANSITION | NFA 4AB8 CFA 4ABE )
( Inferred descriptive name, not recovered original: Runs )
( two display-line pointer sweeps using the $05 and $5A )
( pattern blocks, creating the scene closing transition. )
( Stack: -- )
AT 4AB8
( Header: flags, saved name and link )
BYTES 830000CC9A4A
DOCOL
LIT16 00DC t.0 t.DISPLAY-LINE-POINTERS
t.TRANSITION-PATTERN-DATA t.TRANSITION-PARAMETERS! t.0
LIT16 FFFC t.1 t.1 t.ANIMATE-DISPLAY-LINES
t.FRAME-PATTERN-DATA t.TRANSITION-POINTERS t.! t.0 LIT16 FFFC
LIT16 FFFF t.TRANSITION-ROW-PAIRS t.1 t.-
t.ANIMATE-DISPLAY-LINES t.;S
AT 4AF2

( OPEN-SCENE-TRANSITION | NFA 4AF2 CFA 4AF8 )
( Inferred descriptive name, not recovered original: )
( Initializes pointer increments 4 and 80, a destination )
( near the display-list end, and the bitmap's final row )
( pair; performs the 56-step opening sweep. )
( Stack: -- )
AT 4AF2
( Header: flags, saved name and link )
BYTES 830000CCB84A
DOCOL
LIT8 04 LIT8 50 LIT16 A772 t.BITMAP-BASE t.@ LIT16 0870 t.+
t.TRANSITION-PARAMETERS! LIT8 50 LIT16 0004 t.1
t.TRANSITION-ROW-PAIRS t.ANIMATE-DISPLAY-LINES t.;S
AT 4B1F

( DRAW-FRAME-ROW | NFA 4B1F CFA 4B25 )
( Inferred descriptive name, not recovered original: Copies )
( four left border bytes, clears the next 32 bytes, and )
( copies four right border bytes from the current frame )
( pattern. )
( Stack: destination -- )
AT 4B1F
( Header: flags, saved name and link )
BYTES 830000CCF24A
DOCOL
t.TRANSITION-POINTERS t.@ t.OVER LIT8 04 t.CMOVE LIT8 04 t.+
t.DUP LIT8 20 t.ERASE LIT8 20 t.+ t.TRANSITION-POINTERS t.@
LIT8 24 t.+ t.SWAP LIT8 04 t.CMOVE t.;S
AT 4B55

( DRAW-SCENE-FRAME | NFA 4B55 CFA 4B5B )
( Inferred descriptive name, not recovered original: )
( Iterates the 112-row bitmap in 80-byte row pairs, drawing )
( the alternating frame-row patterns around a 32-byte )
( interior. )
( Stack: -- )
AT 4B55
( Header: flags, saved name and link )
BYTES 830000C71F4B
DOCOL
t.BITMAP-BASE t.@ t.DUP LIT16 1180 t.+ t.SWAP t.(DO)
( label 4B6D )
t.FRAME-PATTERN-DATA t.TRANSITION-POINTERS t.! t.I
t.DRAW-FRAME-ROW LIT16 4919 t.TRANSITION-POINTERS t.! t.I
LIT8 28 t.+ t.DRAW-FRAME-ROW LIT8 50
t.(+LOOP) CELL FFE0 ( -> 4B6D )
t.;S
AT 4B91

( DRAW-TEXT-PANEL-BORDERS | NFA 4B91 CFA 4B97 )
( Inferred descriptive name, not recovered original: Draws )
( a custom-font border string with SAVMSC=$A800, then )
( another at the original SAVMSC-40, and restores the )
( original SAVMSC by adding40. )
( Stack: -- )
AT 4B91
( Header: flags, saved name and link )
BYTES 830000D4554B
DOCOL
LIT8 58 t.@ LIT16 A800 t.DUP LIT8 28 t.ERASE LIT8 58 t.! t.2
t.0 t.POS
( Game text: )
( [12][14][10][10][10][10][10][10][10][10][10][10][09][0F][5 )
( B][5B][5B][5B][5B][5B][5B][5B][0B][0C][10][10][10][10][10] )
( [10][10][10][10][10][19][15] )
t.(S")
BYTES 24121410101010101010101010090F5B5B5B5B5B5B5B5B0B0C101010
BYTES 101010101010101915
LIT8 28 t.- t.DUP LIT8 28 t.ERASE LIT8 58 t.! t.2 t.0 t.POS
( Game text: )
( [06][07][10][10][10][10][10][10][10][10][10][10][10][10][1 )
( 6][02][5D][5D][5D][5D][0E][0D][10][10][10][10][10][10][10] )
( [10][10][10][10][10][08][0A] )
t.(S")
BYTES 24060710101010101010101010101016025D5D5D5D0E0D1010101010
BYTES 10101010101010080A
LIT8 28 LIT8 58 t.+! t.;S
AT 4C23

( OPEN-GAME-SCREEN | NFA 4C23 CFA 4C29 )
( Inferred descriptive name, not recovered original: )
( Installs the screen descriptor, performs the opening )
( transition, and clears the text area. )
( Stack: -- )
AT 4C23
( Header: flags, saved name and link )
BYTES 830000D4914B
DOCOL
LIT16 49A7 t.INSTALL-SCREEN-DESCRIPTOR t.OPEN-SCENE-TRANSITION
t.CLEAR-TEXT-AREA t.;S
AT 4C37

( INIT-GAME-SCREEN | NFA 4C37 CFA 4C3E )
( Inferred descriptive name, not recovered original: )
( Installs the screen descriptor, draws text-panel borders )
( and the alternating scene frame, then clears the text )
( area. )
( Stack: -- )
AT 4C37
( Header: flags, saved name and link )
BYTES 84000000B5234C
DOCOL
LIT16 49A7 t.INSTALL-SCREEN-DESCRIPTOR
t.DRAW-TEXT-PANEL-BORDERS t.DRAW-SCENE-FRAME t.CLEAR-TEXT-AREA
t.;S
AT 4C4E

( BYTE-PAIR@ | NFA 4C4E CFA 4C54 )
( Inferred descriptive name, not recovered original: Reads )
( adjacent bytes at address and address+1 as zero-extended )
( values. )
( Stack: address -- first second )
AT 4C4E
( Header: flags, saved name and link )
BYTES 830000D9374C
DOCOL
t.DUP t.>R t.C@ t.R> t.1+ t.C@ t.;S
AT 4C64

( BYTE+! | NFA 4C64 CFA 4C6A )
( Inferred descriptive name, not recovered original: Adds )
( delta to the byte at address, storing only the low eight )
( bits. )
( Stack: delta address -- )
AT 4C64
( Header: flags, saved name and link )
BYTES 830000A14E4C
DOCOL
t.>R t.R t.C@ t.+ t.R> t.C! t.;S
AT 4C7A

( SCENE-PICTURE-BUFFER | NFA 4C7A CFA 4C81 )
( Inferred descriptive name, not recovered original: )
( Constant $0600 is the decompressed scene/zoom picture )
( buffer, with x,y,width,height followed by pixels. )
( Stack: -- address )
AT 4C7A
( Header: flags, saved name and link )
BYTES 84000000C2644C
DOCON
CELL 0600
AT 4C85

( PICTURE-X-OFFSET | NFA 4C85 CFA 4C8A )
( Inferred descriptive name, not recovered original: Stored )
( by $4CD2 as picture x minus the supplied destination )
( origin; used by $4CB9 for composition placement. )
( Stack: -- address )
AT 4C85
( Header: flags, saved name and link )
BYTES 8200D87A4C
DOVAR
CELL 0000
AT 4C8E

( PICTURE-Y-OFFSET | NFA 4C8E CFA 4C93 )
( Inferred descriptive name, not recovered original: Stored )
( by $4CD2 as picture y minus the supplied destination )
( origin; used by $4CB9 and hit-map placement. )
( Stack: -- address )
AT 4C8E
( Header: flags, saved name and link )
BYTES 8200D9854C
DOVAR
CELL 0000
AT 4C97

( EXPAND-PICTURE-DATA | NFA 4C97 CFA 4C9C )
( Inferred descriptive name, not recovered original: Reads )
( width/height from the source, advances past its two-byte )
( dimensions, sets RLE parameters and expands into )
( destination with the requested stride. )
( Stack: stride source destination -- )
AT 4C97
( Header: flags, saved name and link )
BYTES 8200CF8E4C
DOCOL
t.OVER t.BYTE-PAIR@ t.RLE-SIZE! t.SWAP t.2+ t.SWAP
t.RLE-POINTERS! t.RLE-STRIDE! t.RLE-EXPAND t.;S
AT 4CB2

( PICTURE-OFFSET | NFA 4CB2 CFA 4CB9 )
( Inferred descriptive name, not recovered original: Adds )
( PICTURE-X-OFFSET and stride*PICTURE-Y-OFFSET to the )
( supplied base. )
( Stack: base stride -- address )
AT 4CB2
( Header: flags, saved name and link )
BYTES 84000000D9974C
DOCOL
t.PICTURE-Y-OFFSET t.@ t.* t.+ t.PICTURE-X-OFFSET t.@ t.+ t.;S
AT 4CCB

( SET-PICTURE-OFFSETS | NFA 4CCB CFA 4CD2 )
( Inferred descriptive name, not recovered original: Reads )
( picture x/y and subtracts supplied origin coordinates, )
( storing relative x/y offsets. )
( Stack: picture x-origin y-origin -- picture )
AT 4CCB
( Header: flags, saved name and link )
BYTES 84000000BEB24C
DOCOL
t.SWAP t.>R t.>R t.DUP t.BYTE-PAIR@ t.R> t.-
t.PICTURE-Y-OFFSET t.! t.R> t.- t.PICTURE-X-OFFSET t.! t.;S
AT 4CF0

( OVERLAY-PACKED-PICTURE | NFA 4CF0 CFA 4CF6 )
( Inferred descriptive name, not recovered original: Uses )
( both four-byte picture headers to compute relative )
( placement, then expands source RLE bytes into destination )
( at its own row stride. )
( Stack: source destination -- )
AT 4CF0
( Header: flags, saved name and link )
BYTES 830000C2CB4C
DOCOL
t.>R t.R t.BYTE-PAIR@ t.SET-PICTURE-OFFSETS t.R t.2+ t.C@
t.SWAP t.2+ t.OVER t.R> LIT16 0004 t.+ t.SWAP t.PICTURE-OFFSET
t.EXPAND-PICTURE-DATA t.;S
AT 4D1C

( DRAW-RESOURCE-PICTURE | NFA 4D1C CFA 4D22 )
( Inferred descriptive name, not recovered original: )
( Resolves the picture record, sets origin-relative offsets )
( using x=4/y=0, then decodes the image into BITMAP-BASE at )
( its stored x/y with stride40. )
( Stack: resource -- )
AT 4D1C
( Header: flags, saved name and link )
BYTES 830000C2F04C
DOCOL
t.RESOURCE-ADDR t.2+ LIT16 0004 t.0 t.SET-PICTURE-OFFSETS t.>R
LIT8 28 t.R t.2+ t.BITMAP-BASE t.@ t.R> t.BYTE-PAIR@ LIT8 28
t.* t.+ t.+ t.EXPAND-PICTURE-DATA t.;S
AT 4D4E

( DECODE-PICTURE | NFA 4D4E CFA 4D53 )
( Inferred descriptive name, not recovered original: Copies )
( the source's x/y/width/height header to destination, then )
( expands its packed payload there. )
( Stack: source destination -- )
AT 4D4E
( Header: flags, saved name and link )
BYTES 8200CF1C4D
DOCOL
t.>R t.DUP t.R LIT16 0004 t.CMOVE t.R>
t.OVERLAY-PACKED-PICTURE t.;S
AT 4D67

( DECODE-SCENE-RESOURCE | NFA 4D67 CFA 4D6D )
( Inferred descriptive name, not recovered original: )
( Resolves a picture resource and decodes it into the $0600 )
( scene picture buffer. )
( Stack: resource -- )
AT 4D67
( Header: flags, saved name and link )
BYTES 830000C24E4D
DOCOL
t.RESOURCE-ADDR t.2+ t.SCENE-PICTURE-BUFFER t.DECODE-PICTURE
t.;S
AT 4D79

( OVERLAY-SCENE-RESOURCE | NFA 4D79 CFA 4D7F )
( Inferred descriptive name, not recovered original: )
( Resolves a packed picture and overlays it into the )
( existing $0600 scene picture buffer. )
( Stack: resource -- )
AT 4D79
( Header: flags, saved name and link )
BYTES 830000C2674D
DOCOL
t.RESOURCE-ADDR t.2+ t.SCENE-PICTURE-BUFFER
t.OVERLAY-PACKED-PICTURE t.;S
AT 4D8B

( HIT-MAP-SELECTOR | NFA 4D8B CFA 4D90 )
( Inferred descriptive name, not recovered original: Zero )
( chooses the base hit map; nonzero selects the zoom hit )
( map at +$284. Scene/zoom drawing routines set it )
( explicitly. )
( Stack: -- address )
AT 4D8B
( Header: flags, saved name and link )
BYTES 8200D4794D
DOVAR
CELL 0000
AT 4D94

( HIT-MAP-BASE | NFA 4D94 CFA 4D99 )
( Inferred descriptive name, not recovered original: )
( Constant $A058 addresses the base room hit map, whose )
( first two bytes are width/height. )
( Stack: -- address )
AT 4D94
( Header: flags, saved name and link )
BYTES 8200C18B4D
DOCON
CELL A058
AT 4D9D

( HIT-MAP@ | NFA 4D9D CFA 4DA3 )
( Inferred descriptive name, not recovered original: )
( Returns $A058, adding $284 when HIT-MAP-SELECTOR is )
( nonzero. )
( Stack: -- address )
AT 4D9D
( Header: flags, saved name and link )
BYTES 830000C2944D
DOCOL
t.HIT-MAP-BASE t.HIT-MAP-SELECTOR t.@
t.0BRANCH CELL 0008 ( -> 4DB5 )
LIT16 0284 t.+
( label 4DB5 )
t.;S
AT 4DB7

( PLAYER-COLORS | NFA 4DB7 CFA 4DBD )
( Inferred descriptive name, not recovered original: Bytes )
( copied to OS PCOLR0..3 at $02C0 by $4DCC to color the )
( player/missile cursor. )
( Stack: -- address )
AT 4DB7
( Header: flags, saved name and link )
BYTES 830000CD9D4D
DOVAR
BYTES AEAAA0414C4C
AT 4DC5

( SET-PLAYER-COLORS | NFA 4DC5 CFA 4DCC )
( Inferred descriptive name, not recovered original: Copies )
( four bytes from PLAYER-COLORS to OS color shadows )
( $02C0..$02C3. )
( Stack: -- )
AT 4DC5
( Header: flags, saved name and link )
BYTES 84000000CDB74D
DOCOL
t.PLAYER-COLORS LIT16 02C0 LIT16 0004 t.CMOVE t.;S
AT 4DDC

( PM-BASE | NFA 4DDC CFA 4DE2 )
( Inferred descriptive name, not recovered original: Cell )
( stores the player/missile memory base in bytes; set while )
( writing PMBASE hardware $D407. )
( Stack: -- address )
AT 4DDC
( Header: flags, saved name and link )
BYTES 830000A3C54D
DOVAR
CELL 0000
AT 4DE6

( PLAYER-DATA-BASE | NFA 4DE6 CFA 4DED )
( Inferred descriptive name, not recovered original: )
( Returns PM-BASE+$400, the first player area for the )
( configured single-line PM graphics. )
( Stack: -- address )
AT 4DE6
( Header: flags, saved name and link )
BYTES 84000000C0DC4D
DOCOL
t.PM-BASE t.@ LIT16 0400 t.+ t.;S
AT 4DFB

( PM-BASE! | NFA 4DFB CFA 4E02 )
( Inferred descriptive name, not recovered original: Writes )
( the page number to ANTIC PMBASE $D407 and stores page*256 )
( in PM-BASE. )
( Stack: page -- )
AT 4DFB
( Header: flags, saved name and link )
BYTES 84000000A1E64D
DOCOL
t.DUP LIT16 D407 t.C! LIT16 0100 t.* t.PM-BASE t.! t.;S
AT 4E18

( CLEAR-PLAYERS | NFA 4E18 CFA 4E1F )
( Inferred descriptive name, not recovered original: Erases )
( $2FF bytes from PM-BASE+$400, covering the cursor's three )
( player planes. )
( Stack: -- )
AT 4E18
( Header: flags, saved name and link )
BYTES 84000000CDFB4D
DOCOL
t.PLAYER-DATA-BASE LIT16 02FF t.ERASE t.;S
AT 4E2B

( ENABLE-PLAYERS | NFA 4E2B CFA 4E33 )
( Inferred descriptive name, not recovered original: Writes )
( three to GTIA GRACTL $D01D, enabling missile and player )
( DMA display. )
( Stack: -- )
AT 4E2B
( Header: flags, saved name and link )
BYTES 8500000000CD184E
DOCOL
t.3 LIT16 D01D t.C! t.;S
AT 4E3F

( DISABLE-PLAYERS | NFA 4E3F CFA 4E48 )
( Inferred descriptive name, not recovered original: Clears )
( eight horizontal position registers at $D000 and writes )
( zero to GRACTL. )
( Stack: -- )
AT 4E3F
( Header: flags, saved name and link )
BYTES 860000000000CD2B4E
DOCOL
LIT16 D000 LIT16 0008 t.ERASE t.0 LIT16 D01D t.C! t.;S
AT 4E5E

( w4E64 | NFA 4E5E CFA 4E64 )
( Unknown erased name; CFA identifier )
AT 4E5E
( Header: flags, saved name and link )
BYTES 830000A33F4E
DOVAR
BYTES 000005414C
AT 4E6B

( SET-CURSOR-PM-X | NFA 4E6B CFA 4E72 )
( Inferred descriptive name, not recovered original: Waits )
( for the raster point, then writes the supplied x to )
( HPOSP0, HPOSP1 and HPOSP2 and drops it. )
( Stack: x -- )
AT 4E6B
( Header: flags, saved name and link )
BYTES 84000000A15E4E
CELL 4E74 ( native entry point )
JSR.ABS 483F         ( 4E74 )
LDA.ZPX 00           ( 4E77 )
STA.ABS D000         ( 4E79 )
STA.ABS D001         ( 4E7C )
STA.ABS D002         ( 4E7F )
JMP.ABS 1059         ( 4E82 )
AT 4E85

( CURSOR-PLAYER-BITMAP | NFA 4E85 CFA 4E8B )
( Inferred descriptive name, not recovered original: Body )
( at $4E8D contains three 13-byte cursor planes. $4F0F )
( refers to that literal body address; its saved DOCOL )
( field is not evidence this data is executable Forth. )
( Data body referenced by literal address; do not execute )
( its saved DOCOL entry. )
AT 4E85
( Header: flags, saved name and link )
BYTES 830000B06B4E
DOCOL
( Trailing code/data at 4E8D; retained exactly )
BYTES 00F000001008040200000000000000F0E0E0F0B89C0E040000000000
BYTES 001000004060B09A0E04007712
AT 4EB6

( PM-COPY-DEST | NFA 4EB6 CFA 4EBB )
( Inferred descriptive name, not recovered original: )
( Constant $D4, the destination pointer used by the native )
( player-plane copy. )
( Stack: -- address )
AT 4EB6
( Header: flags, saved name and link )
BYTES 8200CB854E
DOCON
CELL 00D4
AT 4EBF

( PM-COPY-PLANES | NFA 4EBF CFA 4EC6 )
( Inferred descriptive name, not recovered original: Native )
( $4EE5 uses its low byte as plane count and advances )
( destination by256 for each plane. )
( Stack: -- address )
AT 4EBF
( Header: flags, saved name and link )
BYTES 84000000CDB64E
DOVAR
CELL 0000
AT 4ECA

( PM-COPY-PARAMETERS! | NFA 4ECA CFA 4ED3 )
( Inferred descriptive name, not recovered original: Stores )
( plane count and the per-plane byte count [the shared )
( RECORD-SPAN cell]. )
( Stack: bytes-per-plane planes -- )
AT 4ECA
( Header: flags, saved name and link )
BYTES 860000000000A1BF4E
DOCOL
t.PM-COPY-PLANES t.! t.RECORD-SPAN t.! t.;S
AT 4EDF

( COPY-PM-PLANES | NFA 4EDF CFA 4EE5 )
( Inferred descriptive name, not recovered original: Waits )
( for raster, copies each plane from $D2 to $D4, advances )
( source by plane length and destination by256, preserving )
( Forth X. )
( Stack: -- )
AT 4EDF
( Header: flags, saved name and link )
BYTES 830000A6CA4E
CELL 4EE7 ( native entry point )
STX.ZP D1            ( 4EE7 )
JSR.ABS 483F         ( 4EE9 )
LDX.ABS 4EC8         ( 4EEC )
LDY.# 00             ( 4EEF )
LDA.INDY D2          ( 4EF1 )
STA.INDY D4          ( 4EF3 )
INY                  ( 4EF5 )
CPY.ABS 3E98         ( 4EF6 )
BNE 4EF1             ( 4EF9 )
INC.ZP D5            ( 4EFB )
JSR.ABS 3EB5         ( 4EFD )
DEX                  ( 4F00 )
BNE 4EEF             ( 4F01 )
LDX.ZP D1            ( 4F03 )
JMP.ABS 0F47         ( 4F05 )
AT 4F08

( SET-CURSOR-PM-Y | NFA 4F08 CFA 4F0F )
( Inferred descriptive name, not recovered original: Copies )
( the fixed three-plane,13-row cursor bitmap to )
( PM-BASE+$400+y using $4EE5. )
( Stack: y -- )
AT 4F08
( Header: flags, saved name and link )
BYTES 84000000A1DF4E
DOCOL
LIT16 4E8D t.SWAP t.PLAYER-DATA-BASE t.+ t.PM-COPY-DEST t.!
t.RECORD-POINTER t.! t.3 t.PM-COPY-PLANES t.! LIT8 0D
t.RECORD-SPAN t.! t.COPY-PM-PLANES t.;S
AT 4F34

( CONTEXT-BYTE-ARRAY: | NFA 4F34 CFA 4F3D )
( Inferred descriptive name, not recovered original: )
( Defining word stores an index-cell address and allocates )
( bytes; DOES> fetches that index and adds it to the )
( payload address. )
AT 4F34
( Header: flags, saved name and link )
BYTES 860000000000D9084F
DOCOL
t.<BUILDS t., t.ALLOT t.DOES>
( Trailing code/data at 4F47; retained exactly )
BYTES A513E413E413041316167712
AT 4F53

( CURSOR-AXIS | NFA 4F53 CFA 4F59 )
( Inferred descriptive name, not recovered original: Zero )
( selects horizontal cursor cells; one selects the adjacent )
( vertical cells in the four context-indexed arrays. )
( Stack: -- address )
AT 4F53
( Header: flags, saved name and link )
BYTES 830000D9344F
DOVAR
CELL 0000
AT 4F5D

( CURSOR-ORIGIN | NFA 4F5D CFA 4F64 )
( Inferred descriptive name, not recovered original: )
( Axis-indexed byte origins used with grid step and )
( position to compute PM screen coordinates. )
( Stack: -- address )
AT 4F5D
( Header: flags, saved name and link )
BYTES 84000000B0534F
DODOES
( DOES> thread at 4F47 )
BYTES 474F5B4F422120
AT 4F6D

( CURSOR-GRID-POS | NFA 4F6D CFA 4F73 )
( Inferred descriptive name, not recovered original: )
( Axis-indexed cursor x/y grid positions; input wait )
( returns both bytes and navigation saves/restores their )
( pair. )
( Stack: -- address )
AT 4F6D
( Header: flags, saved name and link )
BYTES 830000D05D4F
DODOES
( DOES> thread at 4F47 )
BYTES 474F5B4F000020
AT 4F7C

( CURSOR-GRID-STEP | NFA 4F7C CFA 4F82 )
( Inferred descriptive name, not recovered original: )
( Axis-indexed pixel steps, normally x4 and y6; $4FAA )
( scales the selected grid position by this value. )
( Stack: -- address )
AT 4F7C
( Header: flags, saved name and link )
BYTES 830000D36D4F
DODOES
( DOES> thread at 4F47 )
BYTES 474F5B4F040620
AT 4F8B

( CURSOR-GRID-LIMIT | NFA 4F8B CFA 4F91 )
( Inferred descriptive name, not recovered original: )
( Axis-indexed maximum grid coordinates; movement stops at )
( zero or this limit. )
( Stack: -- address )
AT 4F8B
( Header: flags, saved name and link )
BYTES 830000CD7C4F
DODOES
( DOES> thread at 4F47 )
BYTES 474F5B4F1F1220
AT 4F9A

( CURSOR-MOVE-DELTA | NFA 4F9A CFA 4F9F )
( Inferred descriptive name, not recovered original: Stores )
( the signed one-step input delta during animated cursor )
( movement. )
( Stack: -- address )
AT 4F9A
( Header: flags, saved name and link )
BYTES 8200CC8B4F
DOVAR
CELL 0000
AT 4FA3

( CURSOR-PIXEL | NFA 4FA3 CFA 4FAA )
( Inferred descriptive name, not recovered original: )
( Computes selected-axis origin + grid-position*grid-step. )
( Stack: -- pixel )
AT 4FA3
( Header: flags, saved name and link )
BYTES 84000000D99A4F
DOCOL
t.CURSOR-ORIGIN t.C@ t.CURSOR-GRID-POS t.C@ t.CURSOR-GRID-STEP
t.C@ t.* t.+ t.;S
AT 4FBE

( STEP-CURSOR | NFA 4FBE CFA 4FC5 )
( Inferred descriptive name, not recovered original: For )
( nonzero signed movement, checks the selected-axis limit, )
( animates PM position across one grid step and adjusts its )
( stored grid byte. Intended deltas are -1,0,+1. )
( Stack: delta -- )
AT 4FBE
( Header: flags, saved name and link )
BYTES 84000000A1A34F
DOCOL
t.-DUP
t.0BRANCH CELL 0068 ( -> 5033 )
t.DUP t.CURSOR-MOVE-DELTA t.! t.0 t.<
t.0BRANCH CELL 000C ( -> 4FE5 )
t.CURSOR-GRID-POS t.C@ t.0=_12DE
t.BRANCH CELL 000C ( -> 4FEF )
( label 4FE5 )
t.CURSOR-GRID-POS t.C@ t.CURSOR-GRID-LIMIT t.C@ t.=
( label 4FEF )
t.0=_12DE
t.0BRANCH CELL 0040 ( -> 5033 )
t.CURSOR-PIXEL t.CURSOR-GRID-STEP t.C@ t.1+
t.CURSOR-MOVE-DELTA t.@ t.* t.CURSOR-MOVE-DELTA t.@ t.(DO)
( label 5009 )
t.DUP t.I t.+ t.CURSOR-AXIS t.@ t.0=_12DE
t.0BRANCH CELL 0008 ( -> 501F )
t.SET-CURSOR-PM-X
t.BRANCH CELL 0004 ( -> 5021 )
( label 501F )
t.SET-CURSOR-PM-Y
( label 5021 )
t.CURSOR-MOVE-DELTA t.@
t.(+LOOP) CELL FFE2 ( -> 5009 )
t.DROP t.CURSOR-MOVE-DELTA t.@ t.CURSOR-GRID-POS t.BYTE+!
( label 5033 )
t.;S
AT 5035

( TRIGGER@ | NFA 5035 CFA 503D )
( Inferred descriptive name, not recovered original: Reads )
( GTIA trigger register $D010 plus controller index and )
( masks bit zero. )
AT 5035
( Header: flags, saved name and link )
BYTES 8500000000C7BE4F
DOCOL
LIT16 D010 t.+ t.C@ t.1 t.AND t.;S
AT 504D

( -1 | NFA 504D CFA 5052 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $4F47 [-1] in contiguous 3-definition sequence )
( matching header flags, name suffix, word kind and body )
( size. GAM FORTH 11_A_Graf.ATR CFA $9612, identical body )
( after known address relocation; surviving name length and )
( suffix match )
AT 504D
( Header: flags, saved name and link )
BYTES 8200B13550
DOCON
CELL FFFF
AT 5056

( STICK-X-DELTA-TABLE | NFA 5056 CFA 505C )
( Inferred descriptive name, not recovered original: )
( Threaded selector indexed by raw STICK nibble minus five; )
( entries yield +1,-1 or0 for horizontal movement. )
( Stack: index -- dx )
AT 5056
( Header: flags, saved name and link )
BYTES 830000D44D50
DODOES
( DOES> thread at 383C )
BYTES 3C38CD14CD14CD14C514525052505250C514C514C514C5147712
AT 5078

( STICK-Y-DELTA-TABLE | NFA 5078 CFA 507E )
( Inferred descriptive name, not recovered original: )
( Companion selector yields vertical -1/0/+1 after the raw )
( joystick nibble is reduced by five. )
( Stack: index -- dy )
AT 5078
( Header: flags, saved name and link )
BYTES 830000D45650
DODOES
( DOES> thread at 383C )
BYTES 3C38CD145250C514C514CD145250C514C514CD145250C5147712
AT 509A

( JOYSTICK-DELTA | NFA 509A CFA 50A3 )
( Inferred descriptive name, not recovered original: Reads )
( OS STICK0+controller at $0278, subtracts five and applies )
( the X/Y selector tables. Unlike AD2044's raw-nibble )
( helper, this word accepts a controller index. )
( Stack: controller -- dx dy )
AT 509A
( Header: flags, saved name and link )
BYTES 860000000000D97850
DOCOL
LIT16 0278 t.+ t.C@ LIT16 0005 t.- t.DUP t.STICK-X-DELTA-TABLE
t.SWAP t.STICK-Y-DELTA-TABLE t.;S
AT 50BD

( INIT-CURSOR-PLAYERS | NFA 50BD CFA 50C3 )
( Inferred descriptive name, not recovered original: Sets )
( SDMCTL=$3E and GPRIOR=1, selects PM base $A000, clears )
( players, installs their colors and enables GRACTL. )
( Stack: -- )
AT 50BD
( Header: flags, saved name and link )
BYTES 830000CD9A50
DOCOL
LIT16 003E LIT16 022F t.C! t.1 LIT16 026F t.C! LIT16 00A0
t.PM-BASE! t.CLEAR-PLAYERS t.SET-PLAYER-COLORS
t.ENABLE-PLAYERS t.;S
AT 50E5

( CURSOR-ORIGIN! | NFA 50E5 CFA 50ED )
( Inferred descriptive name, not recovered original: Sets )
( vertical origin y+$21 and horizontal origin 4*x+$32 in )
( the axis-indexed cursor array. )
( Stack: x-byte y -- )
AT 50E5
( Header: flags, saved name and link )
BYTES 8500000000A1BD50
DOCOL
t.1 t.CURSOR-AXIS t.! LIT8 21 t.+ t.CURSOR-ORIGIN t.C! t.0
t.CURSOR-AXIS t.! LIT8 04 t.* LIT8 32 t.+ t.CURSOR-ORIGIN t.C!
t.;S
AT 5114

( CURSOR-LIMITS! | NFA 5114 CFA 511B )
( Inferred descriptive name, not recovered original: Stores )
( rows-1 and columns-1 as vertical/horizontal maximum grid )
( positions. )
( Stack: columns rows -- )
AT 5114
( Header: flags, saved name and link )
BYTES 84000000A1E550
DOCOL
t.0 t.CURSOR-AXIS t.! t.1 t.- t.CURSOR-GRID-LIMIT t.1+ t.C!
t.1 t.- t.CURSOR-GRID-LIMIT t.C! t.;S
AT 5137

( CURSOR-STEPS! | NFA 5137 CFA 513E )
( Inferred descriptive name, not recovered original: Stores )
( the horizontal and vertical byte steps used to animate )
( cursor movement. )
( Stack: x-step y-step -- )
AT 5137
( Header: flags, saved name and link )
BYTES 84000000A11451
DOCOL
t.0 t.CURSOR-AXIS t.! t.CURSOR-GRID-STEP t.1+ t.C!
t.CURSOR-GRID-STEP t.C! t.;S
AT 5152

( VIEW-STACK | NFA 5152 CFA 5157 )
( Inferred descriptive name, not recovered original: )
( Counted stack of 16-bit view IDs; the first byte counts )
( stored bytes. $516E pushes and $519B pops. )
( Stack: -- address )
AT 5152
( Header: flags, saved name and link )
BYTES 8200D03751
DOVAR
BYTES 000005414C4C4F542020202020202020
AT 5169

( PUSH-VIEW | NFA 5169 CFA 516E )
( Inferred descriptive name, not recovered original: Stores )
( the cell at VIEW-STACK+count+2, then increments the byte )
( count by two. This implementation has no capacity check. )
( Stack: view -- )
AT 5169
( Header: flags, saved name and link )
BYTES 8200D05251
DOCOL
t.VIEW-STACK t.C@ t.2+ t.VIEW-STACK t.+ t.! t.2 t.VIEW-STACK
t.BYTE+! t.;S
AT 5184

( P | NFA 5184 CFA 5188 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 5184
( Header: flags, saved name and link )
BYTES 81D06951
DOCOL
t.VIEW-STACK t.DUP t.C@ t.+ t.@ t.;S
AT 5196

( POP-VIEW | NFA 5196 CFA 519B )
( Inferred descriptive name, not recovered original: )
( Fetches the cell at VIEW-STACK+count, then decrements a )
( nonzero byte count by two; zero count returns the initial )
( cell. )
( Stack: -- view )
AT 5196
( Header: flags, saved name and link )
BYTES 8200BE8451
DOCOL
t.VIEW-STACK t.C@ t.VIEW-STACK t.+ t.@ t.VIEW-STACK t.C@
t.0BRANCH CELL 000A ( -> 51B7 )
LIT16 FFFE t.VIEW-STACK t.BYTE+!
( label 51B7 )
t.;S
AT 51B9

( CELL-ARRAY: | NFA 51B9 CFA 51C1 )
( Inferred descriptive name, not recovered original: )
( Defining word allocates twice the requested count; DOES> )
( doubles the index and adds it to the payload. )
AT 51B9
( Header: flags, saved name and link )
BYTES 8500000000D99651
DOCOL
t.<BUILDS t.2 t.* t.ALLOT t.DOES>
( Trailing code/data at 51CD; retained exactly )
BYTES 8D13D5140F2004137712
AT 51D7

( VIEW-CURSOR-POSITIONS | NFA 51D7 CFA 51DD )
( Inferred descriptive name, not recovered original: Cell )
( array stores one cursor x/y byte pair for each view-stack )
( byte-count index, as used by $51F5/$5211. )
( Stack: index -- address )
AT 51D7
( Header: flags, saved name and link )
BYTES 830000D9B951
DODOES
( DOES> thread at 51CD )
BYTES CD512020202020202020202020202020
AT 51EF

( RESTORE-VIEW-CURSOR | NFA 51EF CFA 51F5 )
( Inferred descriptive name, not recovered original: )
( Indexes saved cursor cells by current VIEW-STACK byte )
( count, fetches the packed pair and writes it to the )
( horizontal/vertical cursor bytes. )
( Stack: -- )
AT 51EF
( Header: flags, saved name and link )
BYTES 830000D9D751
DOCOL
t.VIEW-STACK t.C@ t.VIEW-CURSOR-POSITIONS t.@ t.0
t.CURSOR-AXIS t.! t.CURSOR-GRID-POS t.! t.;S
AT 520B

( SAVE-VIEW-CURSOR | NFA 520B CFA 5211 )
( Inferred descriptive name, not recovered original: Stores )
( the current packed cursor position at the cell-array )
( index given by the current VIEW-STACK byte count. )
( Stack: -- )
AT 520B
( Header: flags, saved name and link )
BYTES 830000D9EF51
DOCOL
t.0 t.CURSOR-AXIS t.! t.CURSOR-GRID-POS t.@ t.VIEW-STACK t.C@
t.VIEW-CURSOR-POSITIONS t.! t.;S
AT 5227

( CENTER-VIEW-CURSOR | NFA 5227 CFA 522D )
( Inferred descriptive name, not recovered original: Uses )
( active hit-map dimensions: y becomes height/2 and x )
( becomes width/2-1. )
( Stack: -- )
AT 5227
( Header: flags, saved name and link )
BYTES 830000D90B52
DOCOL
t.0 t.CURSOR-AXIS t.! t.HIT-MAP@ t.BYTE-PAIR@ t.2 t./
t.CURSOR-GRID-POS t.1+ t.C! t.2 t./ t.1 t.- t.CURSOR-GRID-POS
t.C! t.;S
AT 5251

( CONFIGURE-VIEW-CURSOR | NFA 5251 CFA 5257 )
( Inferred descriptive name, not recovered original: Uses )
( picture origin for a zoom view or x4/y0 for the base )
( view, applies active hit-map dimensions as limits and )
( fixes cursor steps to4/6 pixels. )
( Stack: -- )
AT 5251
( Header: flags, saved name and link )
BYTES 830000CD2752
DOCOL
t.VIEW-STACK t.C@
t.0BRANCH CELL 000A ( -> 5269 )
t.SCENE-PICTURE-BUFFER t.BYTE-PAIR@
t.BRANCH CELL 0008 ( -> 526F )
( label 5269 )
LIT16 0004 t.0
( label 526F )
t.CURSOR-ORIGIN! t.HIT-MAP@ t.BYTE-PAIR@ t.CURSOR-LIMITS!
LIT16 0004 LIT8 06 t.CURSOR-STEPS! t.;S
AT 5282

( HIT-MAP-CELL | NFA 5282 CFA 5289 )
( Inferred descriptive name, not recovered original: )
( Returns the hit-map byte at base+2+x+y*width for the )
( currently selected map. )
( Stack: x y -- object )
AT 5282
( Header: flags, saved name and link )
BYTES 84000000C05152
DOCOL
t.HIT-MAP@ t.C@ t.* t.+ t.HIT-MAP@ t.+ t.2+ t.C@ t.;S
AT 529D

( HIT-MAP-OFFSET | NFA 529D CFA 52A4 )
( Inferred descriptive name, not recovered original: Adds )
( horizontal picture offset and stride*[vertical offset/6], )
( matching six bitmap rows per hit-map row. )
( Stack: base stride -- address )
AT 529D
( Header: flags, saved name and link )
BYTES 84000000D98252
DOCOL
t.PICTURE-Y-OFFSET t.@ LIT16 0006 t./ t.* t.+
t.PICTURE-X-OFFSET t.@ t.+ t.;S
AT 52BC

( EXPAND-HIT-MAP | NFA 52BC CFA 52C2 )
( Inferred descriptive name, not recovered original: )
( Decodes a packed width/height hit-map record at its )
( relative picture offset into the active hit-map buffer. )
( Stack: source -- )
AT 52BC
( Header: flags, saved name and link )
BYTES 830000C29D52
DOCOL
t.HIT-MAP@ t.C@ t.SWAP t.OVER t.HIT-MAP@ t.2+ t.SWAP
t.HIT-MAP-OFFSET t.EXPAND-PICTURE-DATA t.;S
AT 52D8

( LOAD-BASE-HIT-MAP | NFA 52D8 CFA 52DE )
( Inferred descriptive name, not recovered original: )
( Selects the base map, copies its dimensions [doubling )
( width], configures/centers the cursor and expands the )
( packed map. )
( Stack: resource -- )
AT 52D8
( Header: flags, saved name and link )
BYTES 830000C1BC52
DOCOL
t.0 t.HIT-MAP-SELECTOR t.! t.RESOURCE-ADDR t.2+ t.DUP
t.BYTE-PAIR@ t.HIT-MAP@ t.1+ t.C! t.2 t.* t.HIT-MAP@ t.C!
t.CONFIGURE-VIEW-CURSOR t.CENTER-VIEW-CURSOR t.EXPAND-HIT-MAP
t.;S
AT 5304

( LOAD-ZOOM-HIT-MAP | NFA 5304 CFA 530A )
( Inferred descriptive name, not recovered original: )
( Selects the zoom map, copies its width/height header and )
( expands its packed payload. )
( Stack: resource -- )
AT 5304
( Header: flags, saved name and link )
BYTES 830000C1D852
DOCOL
t.1 t.HIT-MAP-SELECTOR t.! t.RESOURCE-ADDR t.2+ t.DUP
t.HIT-MAP@ t.2 t.CMOVE t.EXPAND-HIT-MAP t.;S
AT 5322

( OVERLAY-HIT-MAP | NFA 5322 CFA 5328 )
( Inferred descriptive name, not recovered original: )
( Resolves a mask resource and expands it into the current )
( hit map using the current picture offsets. )
( Stack: resource -- )
AT 5322
( Header: flags, saved name and link )
BYTES 830000C10453
DOCOL
t.RESOURCE-ADDR t.2+ t.EXPAND-HIT-MAP t.;S
AT 5332

( BLIT-HIT-THRESHOLD | NFA 5332 CFA 5338 )
( Inferred descriptive name, not recovered original: Native )
( blend compares this byte against the hit-map byte at )
( [$D2],Y when BLIT-IGNORE-HIT is zero. )
( Stack: -- address )
AT 5332
( Header: flags, saved name and link )
BYTES 830000CC2253
DOVAR
CELL 0000
AT 533C

( BLIT-IGNORE-HIT | NFA 533C CFA 5343 )
( Inferred descriptive name, not recovered original: When )
( nonzero, native blend skips the threshold comparison )
( against [$D2],Y; zero enables that test and six-row )
( mask-pointer progression. )
( Stack: -- address )
AT 533C
( Header: flags, saved name and link )
BYTES 84000000D93253
DOVAR
CELL 0001
AT 5347

( MASK-PICTURE-BYTE | NFA 5347 CFA 534C )
( Inferred descriptive name, not recovered original: Native )
( helper processes four two-bit pixels, combines a )
( source-pixel mask with destination, and tracks runs )
( through $FC. Returns masked byte in $FA with RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 5347
( Header: flags, saved name and link )
BYTES 8200B03C53
CELL 534E ( native entry point )
LDA.# C0             ( 534E )
STA.ZP F4            ( 5350 )
LDX.# 04             ( 5352 )
LDA.INDY F0          ( 5354 )
STA.ZP FA            ( 5356 )
LDA.ZP F4            ( 5358 )
AND.INDY F2          ( 535A )
BEQ 536B             ( 535C )
LDA.ZP F4            ( 535E )
EOR.# FF             ( 5360 )
AND.ZP FA            ( 5362 )
STA.ZP FA            ( 5364 )
INC.ZP FC            ( 5366 )
JMP.ABS 537D         ( 5368 )
LDA.ZP FC            ( 536B )
CMP.# 02             ( 536D )
BCC 5379             ( 536F )
LDA.ZP F4            ( 5371 )
EOR.# FF             ( 5373 )
AND.ZP FA            ( 5375 )
STA.ZP FA            ( 5377 )
LDA.# 00             ( 5379 )
STA.ZP FC            ( 537B )
LSR.ZP F4            ( 537D )
LSR.ZP F4            ( 537F )
DEX                  ( 5381 )
BNE 5358             ( 5382 )
RTS                  ( 5384 )
AT 5385

( BLIT-MASKED | NFA 5385 CFA 538A )
( Inferred descriptive name, not recovered original: Zero )
( makes $5393 copy source directly; nonzero enables masked )
( blending with the optional hit/depth comparison. )
( Stack: -- address )
AT 5385
( Header: flags, saved name and link )
BYTES 8200CD4753
DOVAR
CELL 0000
AT 538E

( BLEND-PICTURE-BYTE | NFA 538E CFA 5393 )
( Inferred descriptive name, not recovered original: Copies )
( or masks a pixel byte from [$F2],Y into [$F0],Y according )
( to $538A/$5343 and the hit-map threshold. Native helper )
( returns RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 538E
( Header: flags, saved name and link )
BYTES 8200AA8553
CELL 5395 ( native entry point )
LDA.ABS 538C         ( 5395 )
BNE 53A1             ( 5398 )
LDA.INDY F2          ( 539A )
STA.INDY F0          ( 539C )
JMP.ABS 53B7         ( 539E )
JSR.ABS 534E         ( 53A1 )
SEC                  ( 53A4 )
LDA.ABS 5345         ( 53A5 )
BNE 53AF             ( 53A8 )
LDA.ABS 533A         ( 53AA )
CMP.INDY D2          ( 53AD )
BCC 53B7             ( 53AF )
LDA.INDY F2          ( 53B1 )
ORA.ZP FA            ( 53B3 )
STA.INDY F0          ( 53B5 )
RTS                  ( 53B7 )
AT 53B8

( BLEND-PICTURE-ROW | NFA 53B8 CFA 53BE )
( Inferred descriptive name, not recovered original: Calls )
( the byte blending helper for Y=0 through width-1, width )
( held in $F7. Native RTS helper. )
( Assembly subroutine entry; returns with RTS. )
AT 53B8
( Header: flags, saved name and link )
BYTES 830000C98E53
CELL 53C0 ( native entry point )
LDY.# 00             ( 53C0 )
JSR.ABS 5395         ( 53C2 )
INY                  ( 53C5 )
CPY.ZP F7            ( 53C6 )
BNE 53C2             ( 53C8 )
RTS                  ( 53CA )
AT 53CB

( BLIT-ROW-POSITION | NFA 53CB CFA 53D1 )
( Inferred descriptive name, not recovered original: Row )
( counter incremented by native $53E4 when clipping is )
( enabled; output terminates when it passes $70. )
( Stack: -- address )
AT 53CB
( Header: flags, saved name and link )
BYTES 830000CDB853
DOVAR
CELL 0000
AT 53D5

( BLIT-NO-ROW-CLIP | NFA 53D5 CFA 53DA )
( Inferred descriptive name, not recovered original: )
( Nonzero bypasses row counter/clipping in $53E4; zero )
( enables clipping at row112. )
( Stack: -- address )
AT 53D5
( Header: flags, saved name and link )
BYTES 8200DACB53
DOVAR
CELL 0001
AT 53DE

( BLEND-PICTURE-ROWS | NFA 53DE CFA 53E4 )
( Inferred descriptive name, not recovered original: )
( Processes the rectangle row by row, advances )
( source/destination pointers by independent strides, steps )
( the hit-map pointer every six rows when enabled, and )
( optionally clips at row112. Returns RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 53DE
( Header: flags, saved name and link )
BYTES 830000CFD553
CELL 53E6 ( native entry point )
LDA.# 00             ( 53E6 )
STA.ZP FC            ( 53E8 )
JSR.ABS 53C0         ( 53EA )
LDA.ZP F6            ( 53ED )
CLC                  ( 53EF )
ADC.ZP F2            ( 53F0 )
STA.ZP F2            ( 53F2 )
BCC 53F8             ( 53F4 )
INC.ZP F3            ( 53F6 )
LDA.ZP F9            ( 53F8 )
CLC                  ( 53FA )
ADC.ZP F0            ( 53FB )
STA.ZP F0            ( 53FD )
BCC 5403             ( 53FF )
INC.ZP F1            ( 5401 )
LDA.ABS 5345         ( 5403 )
BNE 541B             ( 5406 )
DEC.ZP FB            ( 5408 )
BNE 541B             ( 540A )
LDA.ZP D2            ( 540C )
CLC                  ( 540E )
ADC.# 20             ( 540F )
STA.ZP D2            ( 5411 )
BCC 5417             ( 5413 )
INC.ZP D3            ( 5415 )
LDA.# 06             ( 5417 )
STA.ZP FB            ( 5419 )
LDA.ABS 53DC         ( 541B )
BNE 542E             ( 541E )
INC.ABS 53D3         ( 5420 )
LDA.# 71             ( 5423 )
CMP.ABS 53D3         ( 5425 )
BCS 542E             ( 5428 )
LDA.# 01             ( 542A )
STA.ZP F8            ( 542C )
DEC.ZP F8            ( 542E )
BNE 53EA             ( 5430 )
RTS                  ( 5432 )
AT 5433

( BLIT-PICTURE | NFA 5433 CFA 543B )
( Inferred descriptive name, not recovered original: )
( Preserves the Forth stack register while invoking the )
( native rectangle compositor at $53E6. )
( Stack: -- )
AT 5433
( Header: flags, saved name and link )
BYTES 8500000000C5DE53
CELL 543D ( native entry point )
STX.ZP D1            ( 543D )
JSR.ABS 53E6         ( 543F )
LDX.ZP D1            ( 5442 )
JMP.ABS 0F47         ( 5444 )
AT 5447

( PICTURE-SCREEN-ADDR | NFA 5447 CFA 544C )
( Inferred descriptive name, not recovered original: Reads )
( picture x/y and returns BITMAP-BASE+x+40*y. )
( Stack: picture -- address )
AT 5447
( Header: flags, saved name and link )
BYTES 8200D33354
DOCOL
t.BITMAP-BASE t.@ t.SWAP t.BYTE-PAIR@ LIT8 28 t.* t.+ t.+ t.;S
AT 5461

( BLIT-PARAMETERS | NFA 5461 CFA 5468 )
( Inferred descriptive name, not recovered original: Stores )
( destination stride, source pointer and )
( width/height/source stride, then calls the native )
( blitter. Header begins with width/height. )
( Stack: header pixels stride -- )
AT 5461
( Header: flags, saved name and link )
BYTES 84000000AA4754
DOCOL
t.GRAPHICS-ROW-COUNTER t.C! t.2+ t.GRAPHICS-DEST-PTR t.!
t.BYTE-PAIR@ t.GRAPHICS-ROW-COUNT t.C! t.DUP
t.GRAPHICS-ROW-STRIDE t.C! t.GRAPHICS-COLUMN-COUNT t.C!
t.BLIT-PICTURE t.;S
AT 5488

( DRAW-DECODED-PICTURE | NFA 5488 CFA 548F )
( Inferred descriptive name, not recovered original: )
( Converts the picture's x/y header into its screen )
( address, sets destination pointer and blits width/height )
( pixels with40-byte screen stride. )
( Stack: picture -- )
AT 5488
( Header: flags, saved name and link )
BYTES 84000000C26154
DOCOL
t.DUP t.PICTURE-SCREEN-ADDR t.GRAPHICS-SOURCE-PTR t.! t.2+
t.DUP LIT8 28 t.BLIT-PARAMETERS t.;S
AT 54A4

( COMPOSE-STAGED-PICTURE | NFA 54A4 CFA 54AB )
( Inferred descriptive name, not recovered original: Uses )
( staged picture and $0600 scene headers to calculate )
( relative offsets, then blits the staged image into the )
( scene buffer using scene width as destination stride. )
( Stack: -- )
AT 54A4
( Header: flags, saved name and link )
BYTES 84000000C68854
DOCOL
t.PICTURE-STAGING@ t.SCENE-PICTURE-BUFFER t.BYTE-PAIR@
t.SET-PICTURE-OFFSETS t.SCENE-PICTURE-BUFFER LIT16 0004 t.+
t.SCENE-PICTURE-BUFFER t.2+ t.C@ t.PICTURE-OFFSET
t.GRAPHICS-SOURCE-PTR t.! t.2+ t.DUP t.SCENE-PICTURE-BUFFER
t.2+ t.C@ t.BLIT-PARAMETERS t.;S
AT 54D7

( SCENE-BACKUP-PICTURE | NFA 54D7 CFA 54DD )
( Inferred descriptive name, not recovered original: )
( Constant $0A00 is a four-byte picture header followed by )
( a saved screen rectangle used when entering/leaving zoom )
( views. )
( Stack: -- address )
AT 54D7
( Header: flags, saved name and link )
BYTES 830000C3A454
DOCON
CELL 0A00
AT 54E1

( SCENE-BACKUP-BYTES | NFA 54E1 CFA 54E6 )
( Inferred descriptive name, not recovered original: )
( Constant $0B90 is the normal-RAM staging location for )
( $112 bytes copied to/from logical bank offset $36EA by )
( zoom backup routines. )
( Stack: -- address )
AT 54E1
( Header: flags, saved name and link )
BYTES 8200D4D754
DOCON
CELL 0B90
AT 54EA

( SAVE-SCENE-BACKGROUND | NFA 54EA CFA 54F1 )
( Inferred descriptive name, not recovered original: Copies )
( current backup bytes to bank offset $36EA, saves the )
( scene picture header and captures its screen rectangle )
( into the $0A00 backup using the blitter. )
( Stack: -- )
AT 54EA
( Header: flags, saved name and link )
BYTES 84000000BEE154
DOCOL
t.1 t.BLIT-IGNORE-HIT t.! t.SCENE-BACKUP-BYTES LIT16 36EA
LIT16 0112 t.STORE-BANK-RANGE t.SCENE-PICTURE-BUFFER
t.SCENE-BACKUP-PICTURE LIT16 0004 t.CMOVE LIT8 28
t.GRAPHICS-ROW-STRIDE t.C! t.SCENE-BACKUP-PICTURE
t.PICTURE-SCREEN-ADDR t.GRAPHICS-DEST-PTR t.!
t.SCENE-BACKUP-PICTURE LIT16 0004 t.+ t.GRAPHICS-SOURCE-PTR
t.! t.SCENE-BACKUP-PICTURE t.2+ t.BYTE-PAIR@
t.GRAPHICS-ROW-COUNT t.C! t.DUP t.GRAPHICS-ROW-COUNTER t.C!
t.GRAPHICS-COLUMN-COUNT t.C! t.BLIT-PICTURE t.;S
AT 5542

( ITEM-RESOURCE-BASE | NFA 5542 CFA 5548 )
( Inferred descriptive name, not recovered original: )
( Constant $9932 is the normal-RAM base of the item-art )
( u16-length resource collection. )
( Stack: -- address )
AT 5542
( Header: flags, saved name and link )
BYTES 830000B0EA54
DOCON
CELL 9932
AT 554C

( ITEM-RESOURCE-ADDR | NFA 554C CFA 5552 )
( Inferred descriptive name, not recovered original: )
( Indexes the item-art length-record collection at $9932. )
( Stack: index -- record )
AT 554C
( Header: flags, saved name and link )
BYTES 830000C54255
DOCOL
t.ITEM-RESOURCE-BASE t.LENGTH-RECORD-ADDR t.;S
AT 555A

( SAVED-STATE-BASE | NFA 555A CFA 5560 )
( Inferred descriptive name, not recovered original: Start )
( of the saved game-state span copied by $78E8/$7978/$79C5; )
( contains initial cells2 and10 before CURRENT-ROOM and the )
( spellbook records. No more specific direct reader was )
( found. )
( Stack: -- address )
AT 555A
( Header: flags, saved name and link )
BYTES 830000C24C55
DOVAR
BYTES 02000A00
AT 5566

( CURRENT-ROOM | NFA 5566 CFA 556D )
( Inferred descriptive name, not recovered original: Room )
( cell set by $5A49 and read by room/view list selection, )
( achievements and high-level game actions. )
( Stack: -- address )
AT 5566
( Header: flags, saved name and link )
BYTES 84000000CD5A55
DOVAR
CELL 0000
AT 5571

( SPELLBOOK-RECORDS | NFA 5571 CFA 5577 )
( Inferred descriptive name, not recovered original: )
( u16-length vector holding spellbook entries; $60B5 )
( renders KSIEGA CZAROW and $6256 interprets )
( spell/ingredient fields. )
( Stack: index -- record )
( Decoded text: Spellbook display slots )
( item 0 display $5582: [A4]           [23] )
( item 1 display $5594: [24]           [A3] )
( item 2 display $55A6: [A4]           [23] )
( item 3 display $55B8: [24]           [A3] )
( item 4 display $55CA: [A4]           [23] )
( item 5 display $55DC: [24]           [A3] )
( item 6 display $55EE: [A4]           [23] )
( item 7 display $5600: [24]           [A3] )
( item 8 display $5612: [A4]     [3C][3E]    [23] )
( item 9 display $5624: [24]    [3C][3E]     [A3] )
AT 5571
( Header: flags, saved name and link )
BYTES 830000C96655
DODOES
( DOES> thread at 3F47 )
BYTES 473FB4001000000000A43D3D3D3D3D3D3D3D3D3D3D23100000000024
BYTES 3D3D3D3D3D3D3D3D3D3D3DA31000000000A43D3D3D3D3D3D3D3D3D3D
BYTES 3D231000000000243D3D3D3D3D3D3D3D3D3D3DA31000000000A43D3D
BYTES 3D3D3D3D3D3D3D3D3D231000000000243D3D3D3D3D3D3D3D3D3D3DA3
BYTES 1000000000A43D3D3D3D3D3D3D3D3D3D3D231000000000243D3D3D3D
BYTES 3D3D3D3D3D3D3DA31000000000A43D3D3D3D3D3C3E3D3D3D3D231000
BYTES 000000243D3D3D3D3C3E3D3D3D3D3DA3
AT 5631

( ITEM-POSITIONS | NFA 5631 CFA 5638 )
( Inferred descriptive name, not recovered original: Cell )
( array of x/y byte pairs. $58F1 indexes by objectID-$CA )
( and installs the coordinates before drawing a dropped )
( item. )
( Stack: item-index -- address )
AT 5631
( Header: flags, saved name and link )
BYTES 84000000D97155
DODOES
( DOES> thread at 51CD )
BYTES CD511648073C1A360D421F3C093C16482020073C1B3C073C16481A36
BYTES 0D42073C0000173615420000000000000000
AT 5668

( PART2-ITEM-POSITIONS | NFA 5668 CFA 566E )
( Inferred descriptive name, not recovered original: )
( Initial x/y coordinate table copied into ITEM-POSITIONS )
( during the part-two setup at $79E3. )
( Stack: item-index -- address )
AT 5668
( Header: flags, saved name and link )
BYTES 830000B23156
DODOES
( DOES> thread at 51CD )
BYTES CD511F4806421F42143C143C1F4207420642202020201F422020
AT 568A

( CURRENT-PART-GROUP | NFA 568A CFA 5691 )
( Inferred descriptive name, not recovered original: )
( Selects the game-part resource group. Start/load paths )
( set2 or4; saved-game loading derives group4 or6 by adding )
( two. )
( Stack: -- address )
AT 568A
( Header: flags, saved name and link )
BYTES 84000000CB6856
DOVAR
BYTES 01000541
AT 5697

( w569E | NFA 5697 CFA 569E )
( Unknown erased name; CFA identifier )
AT 5697
( Header: flags, saved name and link )
BYTES 84000000C98A56
DODOES
( DOES> thread at 51CD )
BYTES CD51202020202020
AT 56A8

( ROOM-OBJECT-STATE | NFA 56A8 CFA 56AE )
( Inferred descriptive name, not recovered original: )
( Mutable nested u16-length records indexed by room and )
( view in $5A35; entries are the object IDs composed when )
( drawing each scene/view. )
( Stack: -- address )
AT 56A8
( Header: flags, saved name and link )
BYTES 830000C29756
DOVAR
BYTES 0B0001000006000C000000000009000300086D0002006F0017000300
BYTES 00000002006FD202000FCC0300738CD30300288D0009000200763103
BYTES 00782D00080001000003006FD89508000200080002006F0012000200
BYTES 320003007F81000200780003007F1C00090002000000030085220008
BYTES 000200760002002400090002007B3503007F81000E0003007B7D0003
BYTES 0024CE0002002589120003002E920002006F00020030CD03008586CA
BYTES 0800010000030028290008000200080902006FD41500020000000200
BYTES 6FCB0200340002000FD60300738C00050003006C0000150002000000
BYTES 020028000200730002006F0003000F0000080001000003008586D008
BYTES 000100000300782D00050003007631901000010000030085D5000200
BYTES 7F00020082CF0B0001009402002800020030D7080001000003007F81
BYTES 000D0003006F110002007300020010000F00010078020073D1020010
BYTES 00020012CE110003006B00000200170002007900020073CB10000100
BYTES 0002001700020073000300107ACC1300010000020017000200730002
BYTES 0010D4020084CA110003000700000200170002001000020012CD0800
BYTES 02001D00020010CF08000200191C020021D000000000
AT 586A

( w5872 | NFA 586A CFA 5872 )
( Unknown erased name; CFA identifier )
AT 586A
( Header: flags, saved name and link )
BYTES 8500000000CDA856
DOCON
CELL 001E
AT 5876

( ROOM-ACHIEVEMENT-BITS | NFA 5876 CFA 587C )
( Inferred descriptive name, not recovered original:31-byte )
( room-indexed achievement bitmap. $69E8 ORs a mask into )
( the current room byte and $69C0 counts set bits toward )
( a65-achievement score. )
( Stack: -- address )
AT 5876
( Header: flags, saved name and link )
BYTES 830000D06A58
DOVAR
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000020
AT 589E

( PUZZLE-STATE-CELLS | NFA 589E CFA 58A4 )
( Inferred descriptive name, not recovered original: Cell )
( array used by spell/puzzle actions: flags include magic )
( disabled, gates, ending and multi-item puzzles. Its )
( values are part of the saved state. )
( Stack: index -- address )
AT 589E
( Header: flags, saved name and link )
BYTES 830000D97658
DODOES
( DOES> thread at 51CD )
BYTES CD5100000000000000000000000000008F0000000000000000000000
BYTES 000000000000
AT 58C8

( LAST-DIRECTION | NFA 58C8 CFA 58CF )
( Inferred descriptive name, not recovered original: )
( Updated by movement at $7423 and preserved in the saved )
( state by $78E8/$7978; records the previous movement )
( direction. )
( Stack: -- address )
AT 58C8
( Header: flags, saved name and link )
BYTES 84000000C59E58
DOVAR
CELL 0000
AT 58D3

( ITEM-PICTURE-INDEX | NFA 58D3 CFA 58D9 )
( Inferred descriptive name, not recovered original: Maps )
( an inventory/drop object ID to its picture resource: )
( 2*[object-$CA]+2, followed by its paired mask resource. )
( Stack: object -- resource )
AT 58D3
( Header: flags, saved name and link )
BYTES 830000CEC858
DOCOL
LIT8 CA t.- t.2 t.* t.2 t.+ t.;S
AT 58EA

( COMPOSE-DROPPED-ITEM | NFA 58EA CFA 58F1 )
( Inferred descriptive name, not recovered original: )
( Enables masked blending, decodes item art, applies the )
( saved ITEM-POSITIONS coordinates, composes it into the )
( scene and expands its paired hit map, then disables )
( masked blending. )
( Stack: object -- )
AT 58EA
( Header: flags, saved name and link )
BYTES 84000000D4D358
DOCOL
t.DUP t.ITEM-PICTURE-INDEX t.>R t.1 t.BLIT-MASKED t.C! t.R
t.ITEM-RESOURCE-ADDR t.2+ t.PICTURE-STAGING@ t.DECODE-PICTURE
LIT8 CA t.- t.ITEM-POSITIONS t.BYTE-PAIR@ t.PICTURE-STAGING@
t.1+ t.C! t.PICTURE-STAGING@ t.C! t.COMPOSE-STAGED-PICTURE
t.R> t.1+ t.ITEM-RESOURCE-ADDR t.2+ t.EXPAND-HIT-MAP t.0
t.BLIT-MASKED t.C! t.;S
AT 5930

( DRAW-BASE-PICTURE | NFA 5930 CFA 5937 )
( Inferred descriptive name, not recovered original: Draws )
( the selected picture directly to screen and loads the )
( next resource as its base hit map. )
( Stack: resource -- )
AT 5930
( Header: flags, saved name and link )
BYTES 84000000D0EA58
DOCOL
t.DUP t.DRAW-RESOURCE-PICTURE t.1+ t.LOAD-BASE-HIT-MAP t.;S
AT 5943

( DRAW-PICTURE-AND-MASK | NFA 5943 CFA 5949 )
( Inferred descriptive name, not recovered original: Draws )
( the picture; only if the word after its length-bounded )
( payload is nonzero does it expand the next resource as a )
( hit-map overlay. )
( Stack: resource -- )
AT 5943
( Header: flags, saved name and link )
BYTES 830000D43059
DOCOL
t.DUP t.DRAW-RESOURCE-PICTURE t.DUP t.RESOURCE-ADDR
t.WORD-COUNT t.+ t.@
t.0BRANCH CELL 000A ( -> 5965 )
t.1+ t.OVERLAY-HIT-MAP
t.BRANCH CELL 0004 ( -> 5967 )
( label 5965 )
t.DROP
( label 5967 )
t.;S
AT 5969

( DECODE-ZOOM-PICTURE | NFA 5969 CFA 596F )
( Inferred descriptive name, not recovered original: )
( Decodes a picture into the scene buffer and loads the )
( following resource as the zoom hit map. )
( Stack: resource -- )
AT 5969
( Header: flags, saved name and link )
BYTES 830000D44359
DOCOL
t.DUP t.DECODE-SCENE-RESOURCE t.1+ t.LOAD-ZOOM-HIT-MAP t.;S
AT 597B

( COMPOSE-PICTURE-AND-MASK | NFA 597B CFA 5981 )
( Inferred descriptive name, not recovered original: )
( Overlays a picture in the scene buffer, then expands its )
( following mask resource into the selected hit map. )
( Stack: resource -- )
AT 597B
( Header: flags, saved name and link )
BYTES 830000D46959
DOCOL
t.DUP t.OVERLAY-SCENE-RESOURCE t.1+ t.OVERLAY-HIT-MAP t.;S
AT 598D

( ROOM-RECORD-BUFFER | NFA 598D CFA 5993 )
( Inferred descriptive name, not recovered original: )
( Constant $9752 receives a room's nested descriptor record )
( before its background and object resources are selected. )
( Stack: -- address )
AT 598D
( Header: flags, saved name and link )
BYTES 830000D77B59
DOCON
CELL 9752
AT 5997

( SPLIT-OBJECT-ID | NFA 5997 CFA 599C )
( Inferred descriptive name, not recovered original: )
( Divides by100, doubles the quotient for the resource )
( collection number and retains the remainder as the local )
( object index. )
( Stack: object -- collection local-index )
AT 5997
( Header: flags, saved name and link )
BYTES 8200D78D59
DOCOL
LIT8 64 t./MOD t.2 t.* t.SWAP t.;S
AT 59AB

( CLASSIFY-OBJECT | NFA 59AB CFA 59B1 )
( Inferred descriptive name, not recovered original: IDs0/1 )
( produce only0; IDs above200 retain the original ID and )
( return1 [item art]; IDs2..200 load the collection )
( selected by ID/100 and return local index followed by )
( class2 [scene art]. Stack arity therefore differs for )
( ignored IDs. )
AT 59AB
( Header: flags, saved name and link )
BYTES 830000D79759
DOCOL
t.DUP t.1 t.>
t.0BRANCH CELL 001D ( -> 59D8 )
t.DUP LIT8 C8 t.>
t.0BRANCH CELL 0008 ( -> 59CE )
t.1
t.BRANCH CELL 0008 ( -> 59D4 )
( label 59CE )
t.SPLIT-OBJECT-ID t.FETCH-RESOURCE t.2
( label 59D4 )
t.BRANCH CELL 0006 ( -> 59DC )
( label 59D8 )
t.DROP t.0
( label 59DC )
t.;S
AT 59DE

( DRAW-OBJECT-LIST | NFA 59DE CFA 59E4 )
( Inferred descriptive name, not recovered original: Walks )
( object bytes in a u16-length record beginning at start; )
( classifies each ID and draws its picture/mask when )
( nonzero. )
( Stack: record start -- )
AT 59DE
( Header: flags, saved name and link )
BYTES 830000C2AB59
DOCOL
t.>R t.WORD-COUNT t.R> t.(DO)
( label 59EE )
t.DUP t.I t.+ t.C@ t.CLASSIFY-OBJECT
t.0BRANCH CELL 0004 ( -> 59FE )
t.DRAW-PICTURE-AND-MASK
( label 59FE )
t.(LOOP) CELL FFEE ( -> 59EE )
t.DROP t.;S
AT 5A06

( DRAW-ROOM-BACKGROUND | NFA 5A06 CFA 5A0D )
( Inferred descriptive name, not recovered original: )
( Fetches room-1 from nested collection1 into )
( ROOM-RECORD-BUFFER, loads its specified resource group, )
( draws base picture0 and remaining static object entries. )
( Stack: room -- )
AT 5A06
( Header: flags, saved name and link )
BYTES 84000000D2DE59
DOCOL
t.1 t.- t.1 t.ROOM-RECORD-BUFFER t.FETCH-NESTED-RESOURCE
t.ROOM-RECORD-BUFFER t.2+ t.DUP t.2+ t.C@ t.FETCH-RESOURCE t.0
t.DRAW-BASE-PICTURE t.1 t.DRAW-OBJECT-LIST t.;S
AT 5A2F

( ROOM-VIEW-OBJECTS | NFA 5A2F CFA 5A35 )
( Inferred descriptive name, not recovered original: )
( Indexes outer ROOM-OBJECT-STATE by room, skips its u16 )
( header, then indexes the selected view's u16-length )
( object list. )
( Stack: room view -- record )
AT 5A2F
( Header: flags, saved name and link )
BYTES 830000C2065A
DOCOL
t.SWAP t.ROOM-OBJECT-STATE t.LENGTH-RECORD-ADDR t.2+
t.LENGTH-RECORD-ADDR t.;S
AT 5A43

( DRAW-ROOM | NFA 5A43 CFA 5A49 )
( Inferred descriptive name, not recovered original: Stores )
( CURRENT-ROOM, draws its static background, then draws the )
( mutable object list for base view0. )
( Stack: room -- )
AT 5A43
( Header: flags, saved name and link )
BYTES 830000CD2F5A
DOCOL
t.DUP t.CURRENT-ROOM t.! t.DUP t.DRAW-ROOM-BACKGROUND t.0
t.ROOM-VIEW-OBJECTS t.0 t.DRAW-OBJECT-LIST t.;S
AT 5A5F

( EXPAND-THREE-BYTE-ROW | NFA 5A5F CFA 5A65 )
( Inferred descriptive name, not recovered original: Native )
( helper expands a three-byte template across a wider )
( destination row: first and last bytes are borders, middle )
( byte repeats. Returns RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 5A5F
( Header: flags, saved name and link )
BYTES 830000AA435A
CELL 5A67 ( native entry point )
LDY.# 00             ( 5A67 )
LDA.INDY F2          ( 5A69 )
STA.INDY F0          ( 5A6B )
INY                  ( 5A6D )
INY                  ( 5A6E )
DEY                  ( 5A6F )
STY.ZP F6            ( 5A70 )
LDY.# 01             ( 5A72 )
LDA.INDY F2          ( 5A74 )
LDY.ZP F6            ( 5A76 )
STA.INDY F0          ( 5A78 )
INY                  ( 5A7A )
INY                  ( 5A7B )
CPY.ZP F7            ( 5A7C )
BNE 5A6F             ( 5A7E )
DEY                  ( 5A80 )
STY.ZP F6            ( 5A81 )
LDY.# 02             ( 5A83 )
LDA.INDY F2          ( 5A85 )
LDY.ZP F6            ( 5A87 )
STA.INDY F0          ( 5A89 )
RTS                  ( 5A8B )
AT 5A8C

( ADVANCE-EXPANDED-ROW | NFA 5A8C CFA 5A92 )
( Inferred descriptive name, not recovered original: Adds )
( destination width $F7 to $F0/$F1 through the RLE )
( source-pointer increment helper; native RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 5A8C
( Header: flags, saved name and link )
BYTES 830000D35F5A
CELL 5A94 ( native entry point )
LDA.ZP F7            ( 5A94 )
JSR.ABS 3B69         ( 5A96 )
RTS                  ( 5A99 )
AT 5A9A

( ADVANCE-ROW-TEMPLATE | NFA 5A9A CFA 5AA0 )
( Inferred descriptive name, not recovered original: Adds )
( three to template pointer $F2/$F3; native RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 5A9A
( Header: flags, saved name and link )
BYTES 830000CC8C5A
CELL 5AA2 ( native entry point )
LDA.# 03             ( 5AA2 )
CLC                  ( 5AA4 )
ADC.ZP F2            ( 5AA5 )
STA.ZP F2            ( 5AA7 )
BCC 5AAD             ( 5AA9 )
INC.ZP F3            ( 5AAB )
RTS                  ( 5AAD )
AT 5AAE

( EXPAND-SIX-ROWS | NFA 5AAE CFA 5AB4 )
( Inferred descriptive name, not recovered original: )
( Repeats the three-byte row expansion six times, )
( decrementing remaining height and advancing both )
( pointers; native RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 5AAE
( Header: flags, saved name and link )
BYTES 830000B69A5A
CELL 5AB6 ( native entry point )
LDX.# 06             ( 5AB6 )
DEC.ZP F8            ( 5AB8 )
JSR.ABS 5A67         ( 5ABA )
JSR.ABS 5AA2         ( 5ABD )
JSR.ABS 5A94         ( 5AC0 )
DEX                  ( 5AC3 )
BNE 5ABA             ( 5AC4 )
RTS                  ( 5AC6 )
AT 5AC7

( EXPAND-PICTURE-FRAME | NFA 5AC7 CFA 5ACD )
( Inferred descriptive name, not recovered original: )
( Expands the first six template rows, repeats the middle )
( six-row strip, then adds a final strip; used to frame )
( zoom pictures. )
( Stack: -- )
AT 5AC7
( Header: flags, saved name and link )
BYTES 830000C7AE5A
CELL 5ACF ( native entry point )
STX.ZP D1            ( 5ACF )
JSR.ABS 5AB6         ( 5AD1 )
JSR.ABS 3B43         ( 5AD4 )
JSR.ABS 3B31         ( 5AD7 )
JSR.ABS 5AB6         ( 5ADA )
LDA.# 00             ( 5ADD )
CMP.ZP F8            ( 5ADF )
BNE 5AD7             ( 5AE1 )
JSR.ABS 5AB6         ( 5AE3 )
LDX.ZP D1            ( 5AE6 )
JMP.ABS 0F47         ( 5AE8 )
AT 5AEB

( PREPARE-ZOOM-FRAME | NFA 5AEB CFA 5AF1 )
( Inferred descriptive name, not recovered original: )
( Fetches an object's four-byte geometry, enlarges it by )
( two columns and12 rows, clears/configures the zoom hit )
( map, then expands a repeated border around the scene )
( picture. )
( Stack: object -- )
AT 5AEB
( Header: flags, saved name and link )
BYTES 830000C2C75A
DOCOL
t.SPLIT-OBJECT-ID t.NESTED-BANK-RECORD t.DROP
t.SCENE-PICTURE-BUFFER t.SWAP LIT16 0004 t.FETCH-BANK-RANGE
t.-1 t.SCENE-PICTURE-BUFFER t.+! LIT16 FFFA
t.SCENE-PICTURE-BUFFER t.1+ t.+! t.2 t.SCENE-PICTURE-BUFFER
t.2+ t.+! LIT16 000C t.SCENE-PICTURE-BUFFER t.3 t.+ t.+! t.1
t.HIT-MAP-SELECTOR t.! t.SCENE-PICTURE-BUFFER t.2+ t.HIT-MAP@
t.2 t.CMOVE t.HIT-MAP@ t.1+ t.DUP t.C@ LIT16 0006 t./ t.SWAP
t.C! t.HIT-MAP@ t.BYTE-PAIR@ t.* t.HIT-MAP@ t.2+ t.SWAP
t.ERASE t.2 t.FETCH-RESOURCE t.0 t.RESOURCE-ADDR LIT16 0004
t.+ t.GRAPHICS-DEST-PTR t.! t.SCENE-PICTURE-BUFFER LIT16 0004
t.+ t.GRAPHICS-SOURCE-PTR t.! t.HIT-MAP@ t.BYTE-PAIR@ t.1 t.-
t.RLE-SIZE! t.EXPAND-PICTURE-FRAME t.;S
AT 5B83

( COMPOSE-OBJECT-LIST | NFA 5B83 CFA 5B89 )
( Inferred descriptive name, not recovered original: Walks )
( the byte list range; item-class IDs use dropped-item )
( composition and scene-class IDs use picture/mask )
( composition. )
( Stack: address end start -- )
AT 5B83
( Header: flags, saved name and link )
BYTES 830000C2EB5A
DOCOL
t.(DO)
( label 5B8D )
t.DUP t.I t.+ t.C@ t.CLASSIFY-OBJECT t.-DUP
t.0BRANCH CELL 0012 ( -> 5BAD )
t.1 t.=
t.0BRANCH CELL 0008 ( -> 5BAB )
t.COMPOSE-DROPPED-ITEM
t.BRANCH CELL 0004 ( -> 5BAD )
( label 5BAB )
t.COMPOSE-PICTURE-AND-MASK
( label 5BAD )
t.(LOOP) CELL FFDE ( -> 5B8D )
t.DROP t.;S
AT 5BB5

( COMPOSE-VIEW | NFA 5BB5 CFA 5BBA )
( Inferred descriptive name, not recovered original: Gets )
( the current room's view list, prepares its first object's )
( zoom frame, then composes every listed object into it. )
( Stack: view -- )
AT 5BB5
( Header: flags, saved name and link )
BYTES 8200C2835B
DOCOL
t.CURRENT-ROOM t.@ t.SWAP t.ROOM-VIEW-OBJECTS t.DUP t.2+ t.C@
t.PREPARE-ZOOM-FRAME t.WORD-COUNT t.0 t.COMPOSE-OBJECT-LIST
t.;S
AT 5BD4

( RESTORE-SCENE-BACKGROUND | NFA 5BD4 CFA 5BD9 )
( Inferred descriptive name, not recovered original: Draws )
( the saved $0A00 background picture and fetches $112 saved )
( bytes from logical bank offset $36EA back to $0B90. )
( Stack: -- )
AT 5BD4
( Header: flags, saved name and link )
BYTES 8200BCB55B
DOCOL
t.SCENE-BACKUP-PICTURE t.DRAW-DECODED-PICTURE
t.SCENE-BACKUP-BYTES LIT16 36EA LIT16 0112 t.FETCH-BANK-RANGE
t.;S
AT 5BED

( PUSH-AND-DRAW-VIEW | NFA 5BED CFA 5BF2 )
( Inferred descriptive name, not recovered original: )
( Composes the view, saves the base background when )
( entering the first zoom, pushes its ID, draws its picture )
( and configures its cursor. )
( Stack: view -- )
AT 5BED
( Header: flags, saved name and link )
BYTES 8200DAD45B
DOCOL
t.DUP t.COMPOSE-VIEW t.VIEW-STACK t.C@ t.0=_12DE
t.0BRANCH CELL 0004 ( -> 5C04 )
t.SAVE-SCENE-BACKGROUND
( label 5C04 )
t.PUSH-VIEW t.SCENE-PICTURE-BUFFER t.DRAW-DECODED-PICTURE
t.CONFIGURE-VIEW-CURSOR t.;S
AT 5C0E

( ENTER-VIEW | NFA 5C0E CFA 5C15 )
( Inferred descriptive name, not recovered original: Saves )
( current cursor position, invokes $5BF2 and centers the )
( new view cursor. )
( Stack: view -- )
AT 5C0E
( Header: flags, saved name and link )
BYTES 84000000CCED5B
DOCOL
t.SAVE-VIEW-CURSOR t.PUSH-AND-DRAW-VIEW t.CENTER-VIEW-CURSOR
t.;S
AT 5C1F

( REDRAW-CURRENT-VIEW | NFA 5C1F CFA 5C26 )
( Inferred descriptive name, not recovered original: )
( Fetches top view ID through P, recomposes it and draws )
( the scene picture. )
( Stack: -- )
AT 5C1F
( Header: flags, saved name and link )
BYTES 84000000CC0E5C
DOCOL
t.P t.COMPOSE-VIEW t.SCENE-PICTURE-BUFFER
t.DRAW-DECODED-PICTURE t.;S
AT 5C32

( LEAVE-VIEW | NFA 5C32 CFA 5C39 )
( Inferred descriptive name, not recovered original: )
( Pops/discards the current view; redraws the preceding )
( zoom or restores the base background, then )
( reconfigures/restores its cursor. )
( Stack: -- )
AT 5C32
( Header: flags, saved name and link )
BYTES 84000000CC1F5C
DOCOL
t.POP-VIEW t.DROP t.VIEW-STACK t.C@
t.0BRANCH CELL 0008 ( -> 5C4D )
t.REDRAW-CURRENT-VIEW
t.BRANCH CELL 000A ( -> 5C55 )
( label 5C4D )
t.RESTORE-SCENE-BACKGROUND t.0 t.HIT-MAP-SELECTOR t.!
( label 5C55 )
t.CONFIGURE-VIEW-CURSOR t.RESTORE-VIEW-CURSOR t.;S
AT 5C5B

( ENTER-INVENTORY-VIEW | NFA 5C5B CFA 5C61 )
( Inferred descriptive name, not recovered original: Saves )
( any active zoom background/cursor, pushes view1 and )
( composes its special room0/view1 object list before )
( drawing and configuring the cursor. )
( Stack: -- )
AT 5C5B
( Header: flags, saved name and link )
BYTES 830000DA325C
DOCOL
t.VIEW-STACK t.C@
t.0BRANCH CELL 0004 ( -> 5C6D )
t.RESTORE-SCENE-BACKGROUND
( label 5C6D )
t.SAVE-VIEW-CURSOR t.1 t.PUSH-VIEW t.0 t.1 t.ROOM-VIEW-OBJECTS
t.DUP t.2+ t.C@ t.CLASSIFY-OBJECT
t.0BRANCH CELL 0004 ( -> 5C87 )
t.DECODE-ZOOM-PICTURE
( label 5C87 )
t.WORD-COUNT t.1 t.COMPOSE-OBJECT-LIST t.SAVE-SCENE-BACKGROUND
t.SCENE-PICTURE-BUFFER t.DRAW-DECODED-PICTURE
t.CENTER-VIEW-CURSOR t.CONFIGURE-VIEW-CURSOR t.;S
AT 5C99

( LEAVE-INVENTORY-VIEW | NFA 5C99 CFA 5C9F )
( Inferred descriptive name, not recovered original: Pops )
( inventory view, restores base background, then rebuilds )
( the preceding nested views and restores saved cursor )
( coordinates. )
( Stack: -- )
AT 5C99
( Header: flags, saved name and link )
BYTES 830000DA5B5C
DOCOL
t.POP-VIEW t.DROP t.RESTORE-SCENE-BACKGROUND t.0
t.HIT-MAP-SELECTOR t.! t.CONFIGURE-VIEW-CURSOR t.VIEW-STACK
t.C@ t.-DUP
t.0BRANCH CELL 001E ( -> 5CD5 )
t.2 t.=
t.0BRANCH CELL 000C ( -> 5CCB )
t.POP-VIEW t.PUSH-AND-DRAW-VIEW t.RESTORE-VIEW-CURSOR
t.BRANCH CELL 000C ( -> 5CD5 )
( label 5CCB )
t.POP-VIEW t.POP-VIEW t.PUSH-AND-DRAW-VIEW
t.PUSH-AND-DRAW-VIEW t.RESTORE-VIEW-CURSOR
( label 5CD5 )
t.CONFIGURE-VIEW-CURSOR t.RESTORE-VIEW-CURSOR t.;S
AT 5CDB

( LOAD-ITEM-ART-ENABLED | NFA 5CDB CFA 5CE1 )
( Inferred descriptive name, not recovered original: When )
( nonzero, $5CED loads the following resource group into )
( ITEM-RESOURCE-BASE after the main banked group succeeds. )
( Stack: -- address )
AT 5CDB
( Header: flags, saved name and link )
BYTES 830000C3995C
DOVAR
CELL 0001
AT 5CE5

( LOAD-PART-RESOURCES | NFA 5CE5 CFA 5CED )
( Inferred descriptive name, not recovered original: Loads )
( up to120 sectors into logical bank offset0; if )
( LOAD-ITEM-ART-ENABLED is nonzero, also loads24 sectors of )
( the next group into item-art RAM. Retries the sequence on )
( disk failure. )
( Stack: group -- )
AT 5CE5
( Header: flags, saved name and link )
BYTES 8500000000CBDB5C
DOCOL
t.>R t.1 t.TRANSFER-IS-LOAD t.!
( label 5CF7 )
t.1 t.BANKED-TRANSFER t.! t.0 LIT8 78 t.R t.TRY-GROUP-TRANSFER
t.DROP t.2DROP t.GROUP-TRANSFER-ERROR t.@ t.0=_12DE
t.LOAD-ITEM-ART-ENABLED t.@ t.*
t.0BRANCH CELL 0019 ( -> 5D31 )
t.0 t.BANKED-TRANSFER t.! t.0 t.ITEM-RESOURCE-ADDR LIT8 18 t.R
t.1+ t.TRY-GROUP-TRANSFER t.DROP t.2DROP
( label 5D31 )
t.GROUP-TRANSFER-ERROR t.@ t.0=_12DE
t.0BRANCH CELL FFBE ( -> 5CF7 )
t.R> t.DROP t.;S
AT 5D41

( NIC | NFA 5D41 CFA 5D47 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $7146 [NIC] in contiguous 3-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 42_A_GrafDos.ATR CFA $A4BE, )
( identical body after known address relocation; surviving )
( name length and suffix match )
AT 5D41
( Header: flags, saved name and link )
BYTES 830000C3E55C
DOCOL
t.;S
AT 5D4B

( KEYBOARD-SELECTION | NFA 5D4B CFA 5D51 )
( Inferred descriptive name, not recovered original: Input )
( wait stores the one-based key-list match here. A nonzero )
( value also ends the wait even if the trigger is not )
( pressed. )
( Stack: -- address )
AT 5D4B
( Header: flags, saved name and link )
BYTES 830000C1415D
DOVAR
CELL 0000
AT 5D55

( KEYBOARD-SHORTCUTS-ENABLED | NFA 5D55 CFA 5D5B )
( Inferred descriptive name, not recovered original: )
( Multiplier applied to the raw key-list match in input )
( wait; zero suppresses keyboard selection. )
( Stack: -- address )
AT 5D55
( Header: flags, saved name and link )
BYTES 830000C44B5D
DOVAR
CELL 0001
AT 5D5F

( BASE-VIEW-KEYS-ENABLED | NFA 5D5F CFA 5D64 )
( Inferred descriptive name, not recovered original: )
( Together with an empty view stack, gates whether input )
( wait interprets the shortcut key list; high-level modal )
( screens change this flag. )
( Stack: -- address )
AT 5D5F
( Header: flags, saved name and link )
BYTES 8200CB555D
DOVAR
CELL 0001
AT 5D68

( WAIT-TRIGGER-RELEASE | NFA 5D68 CFA 5D6D )
( Inferred descriptive name, not recovered original: )
( Repeatedly samples active-low controller0 trigger with )
( five-frame pauses until released. )
( Stack: -- )
AT 5D68
( Header: flags, saved name and link )
BYTES 8200C75F5D
DOCOL
( label 5D6F )
t.0 t.TRIGGER@ LIT8 05 t.PAUSE
t.0BRANCH CELL FFF5 ( -> 5D6F )
t.;S
AT 5D7E

( SHORTCUT-KEYCODES | NFA 5D7E CFA 5D84 )
( Inferred descriptive name, not recovered original: Three )
( bytes at body address $5D86 are raw CH keycodes21,05,28; )
( input wait searches them directly. The saved DOCOL field )
( is not executed. )
( Data body referenced by literal address; do not execute )
( its saved DOCOL entry. )
AT 5D7E
( Header: flags, saved name and link )
BYTES 830000CC685D
DOCOL
( Trailing code/data at 5D86; retained exactly )
BYTES 2105287712
AT 5D8B

( WAIT-GAME-INPUT | NFA 5D8B CFA 5D92 )
( Inferred descriptive name, not recovered original: Clears )
( CH, initializes cursor players, waits for trigger )
( release, applies controller0 movements and shortcut keys )
( until trigger/key selection, then returns the grid x/y )
( bytes and disables players. )
( Stack: -- x y )
AT 5D8B
( Header: flags, saved name and link )
BYTES 84000000DA7E5D
DOCOL
LIT8 FF LIT16 02FC t.C! t.INIT-CURSOR-PLAYERS
t.WAIT-TRIGGER-RELEASE t.1 t.CURSOR-AXIS t.! t.CURSOR-PIXEL
t.SET-CURSOR-PM-Y t.0 t.CURSOR-AXIS t.! t.CURSOR-PIXEL
t.SET-CURSOR-PM-X
( label 5DB5 )
t.NIC t.0 LIT8 4D t.C! t.0 t.JOYSTICK-DELTA t.1 t.CURSOR-AXIS
t.! t.STEP-CURSOR t.0 t.CURSOR-AXIS t.! t.STEP-CURSOR
LIT16 02FC t.C@ LIT8 FF t.= t.0=_12DE
t.0BRANCH CELL 0033 ( -> 5E14 )
t.VIEW-STACK t.C@ t.0=_12DE t.BASE-VIEW-KEYS-ENABLED t.@ t.*
t.0BRANCH CELL 001A ( -> 5E0B )
LIT16 02FC t.C@ LIT16 5D86 t.3 t.FIND-BYTE-FIRST
t.KEYBOARD-SHORTCUTS-ENABLED t.@ t.* t.KEYBOARD-SELECTION t.!
( label 5E0B )
LIT8 FF LIT16 02FC t.C!
( label 5E14 )
t.0 t.TRIGGER@ t.0=_12DE t.KEYBOARD-SELECTION t.@ t.+
t.0BRANCH CELL FF93 ( -> 5DB5 )
t.0 t.CURSOR-AXIS t.! t.CURSOR-GRID-POS t.C@ t.CURSOR-GRID-POS
t.1+ t.C@ t.DISABLE-PLAYERS t.;S
AT 5E38

( DEFAULT-GAME-COLORS | NFA 5E38 CFA 5E3E )
( Inferred descriptive name, not recovered original: )
( Initial color bytes copied into GAME-COLOR-TABLE by )
( $5E7E, with the seventh byte used for COLPF3 shadow. )
( Stack: -- address )
AT 5E38
( Header: flags, saved name and link )
BYTES 830000B28B5D
DOVAR
BYTES 34E8DC2A1418965420
AT 5E49

( INSTALL-GAME-COLORS | NFA 5E49 CFA 5E4F )
( Inferred descriptive name, not recovered original: Points )
( the DLI at GAME-COLOR-TABLE, enables two display-list )
( interrupt bits, installs the handler and writes COLPF3 )
( shadow. )
( Stack: -- )
AT 5E49
( Header: flags, saved name and link )
BYTES 830000C9385E
DOCOL
t.GAME-COLOR-TABLE t.DLI-COLOR-POINTER t.! LIT16 A701
t.ENABLE-DLI-AT LIT16 A7E5 t.ENABLE-DLI-AT t.INSTALL-COLOR-DLI
t.GAME-COLOR-TABLE LIT16 0006 t.+ t.C@ LIT16 02C7 t.C! t.;S
AT 5E77

( RESET-GAME-COLORS | NFA 5E77 CFA 5E7E )
( Inferred descriptive name, not recovered original: Copies )
( seven default color bytes to the live table and installs )
( the game's color DLI. )
( Stack: -- )
AT 5E77
( Header: flags, saved name and link )
BYTES 84000000D0495E
DOCOL
t.DEFAULT-GAME-COLORS t.GAME-COLOR-TABLE LIT16 0007 t.CMOVE
t.INSTALL-GAME-COLORS t.;S
AT 5E8E

( TITLE-MUSIC-OR-SPRITES | NFA 5E8E CFA 5E93 )
( Inferred descriptive name, not recovered original: )
( Constant $8D52 is shared overlay storage: title CMC )
( module base during the introduction, and player-sprite )
( records during gameplay. $6035 loads resource 10 there )
( and $6E0F indexes its sprite frames. $601F subtracts )
( $069A to derive the gameplay CMC base $86B8. )
( Stack: -- address )
AT 5E8E
( Header: flags, saved name and link )
BYTES 8200CA775E
DOCON
CELL 8D52
AT 5E97

( CMC-MODULE-ADDRESS | NFA 5E97 CFA 5E9E )
( Inferred descriptive name, not recovered original: Cell )
( supplied as X/Y to CMC command $70 by $5EE5; stores the )
( module load address. )
( Stack: -- address )
AT 5E97
( Header: flags, saved name and link )
BYTES 84000000DA8E5E
DOVAR
CELL 0000
AT 5EA2

( SAVED-DMA-CONTROL | NFA 5EA2 CFA 5EA8 )
( Inferred descriptive name, not recovered original: )
( DISABLE-DISPLAY-DMA saves SDMCTL here, clears it, and )
( RESTORE-DISPLAY-DMA restores the saved byte. )
( Stack: -- address )
AT 5EA2
( Header: flags, saved name and link )
BYTES 830000C7975E
DOVAR
CELL 0000
AT 5EAC

( DISABLE-DISPLAY-DMA | NFA 5EAC CFA 5EB2 )
( Inferred descriptive name, not recovered original: Saves )
( SDMCTL [$022F] and writes zero there. )
AT 5EAC
( Header: flags, saved name and link )
BYTES 830000C1A25E
DOCOL
LIT16 022F t.C@ t.SAVED-DMA-CONTROL t.! t.0 LIT16 022F t.C!
t.;S
AT 5EC8

( RESTORE-DISPLAY-DMA | NFA 5EC8 CFA 5ECE )
( Inferred descriptive name, not recovered original: )
( Restores SDMCTL [$022F] from the saved variable. )
AT 5EC8
( Header: flags, saved name and link )
BYTES 830000C9AC5E
DOCOL
t.SAVED-DMA-CONTROL t.@ LIT16 022F t.C! t.;S
AT 5EDC

( INIT-CMC-MODULE | NFA 5EDC CFA 5EE5 )
( Inferred descriptive name, not recovered original: )
( Preserves X, passes module address to dispatcher $3003 )
( with A=$70, then starts song0 with A=0/X=0 and returns )
( NEXT. )
( Stack: -- )
AT 5EDC
( Header: flags, saved name and link )
BYTES 860000000000DAC85E
CELL 5EE7 ( native entry point )
STX.ZP D1            ( 5EE7 )
LDX.ABS 5EA0         ( 5EE9 )
LDY.ABS 5EA1         ( 5EEC )
LDA.# 70             ( 5EEF )
JSR.ABS 3003         ( 5EF1 )
LDX.# 00             ( 5EF4 )
TXA                  ( 5EF6 )
JSR.ABS 3003         ( 5EF7 )
LDX.ZP D1            ( 5EFA )
JMP.ABS 0F47         ( 5EFC )
AT 5EFF

( CMC-SONG-NUMBER | NFA 5EFF CFA 5F04 )
( Inferred descriptive name, not recovered original: Low )
( byte is supplied in X to CMC command0 by $5F0E; )
( PLAY-MUSIC stores its requested song here. )
( Stack: -- address )
AT 5EFF
( Header: flags, saved name and link )
BYTES 8200D3DC5E
DOVAR
CELL 0000
AT 5F08

( START-CMC-SONG | NFA 5F08 CFA 5F0E )
( Inferred descriptive name, not recovered original: )
( Preserves Forth X, invokes dispatcher $3003 with A=0 and )
( song number in X, restores X and returns NEXT. )
( Stack: -- )
AT 5F08
( Header: flags, saved name and link )
BYTES 830000CEFF5E
CELL 5F10 ( native entry point )
STX.ZP D1            ( 5F10 )
LDX.ABS 5F06         ( 5F12 )
LDA.# 00             ( 5F15 )
JSR.ABS 3003         ( 5F17 )
LDX.ZP D1            ( 5F1A )
JMP.ABS 0F47         ( 5F1C )
AT 5F1F

( PLAY-MUSIC | NFA 5F1F CFA 5F26 )
( Inferred descriptive name, not recovered original: Stores )
( selected tune then calls native sound-player entry $3003 )
( with A=0 and X=tune. )
AT 5F1F
( Header: flags, saved name and link )
BYTES 84000000C7085F
DOCOL
t.CMC-SONG-NUMBER t.! t.START-CMC-SONG t.;S
AT 5F30

( STOP-MUSIC | NFA 5F30 CFA 5F3A )
( Inferred descriptive name, not recovered original: Calls )
( native sound-player entry $3003 with command A=$40. )
AT 5F30
( Header: flags, saved name and link )
BYTES 87000000000000C71F5F
CELL 5F3C ( native entry point )
STX.ZP D1            ( 5F3C )
LDA.# 40             ( 5F3E )
JSR.ABS 3003         ( 5F40 )
LDX.ZP D1            ( 5F43 )
JMP.ABS 0F47         ( 5F45 )
AT 5F48

( MUSIC-PAUSED | NFA 5F48 CFA 5F4E )
( Inferred descriptive name, not recovered original: )
( Console-key music handler toggles this byte when )
( pausing/resuming CMC playback. )
( Stack: -- address )
AT 5F48
( Header: flags, saved name and link )
BYTES 830000CD305F
DOVAR
CELL 0000
AT 5F52

( UPDATE-CMC-MUSIC | NFA 5F52 CFA 5F59 )
( Inferred descriptive name, not recovered original: )
( VBI-callable native routine checks CONSOL: value3 sends )
( stop command$40 and sets pause flag; value5 sends )
( resume$60 and clears it. Always calls player frame )
( routine$3006 before RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 5F52
( Header: flags, saved name and link )
BYTES 84000000DA485F
CELL 5F5B ( native entry point )
LDA.ABS 5F50         ( 5F5B )
BNE 5F72             ( 5F5E )
LDA.ABS D01F         ( 5F60 )
CMP.# 03             ( 5F63 )
BNE 5F6F             ( 5F65 )
LDA.# 40             ( 5F67 )
JSR.ABS 3003         ( 5F69 )
INC.ABS 5F50         ( 5F6C )
JMP.ABS 5F81         ( 5F6F )
LDA.ABS D01F         ( 5F72 )
CMP.# 05             ( 5F75 )
BNE 5F81             ( 5F77 )
LDA.# 60             ( 5F79 )
JSR.ABS 3003         ( 5F7B )
DEC.ABS 5F50         ( 5F7E )
JSR.ABS 3006         ( 5F81 )
RTS                  ( 5F84 )
AT 5F85

( CMC-EFFECT-PARAMETERS | NFA 5F85 CFA 5F8A )
( Inferred descriptive name, not recovered original: Two )
( bytes passed as X/Y to CMC command$21 by $5F94. )
( Stack: -- address )
AT 5F85
( Header: flags, saved name and link )
BYTES 8200C9525F
DOVAR
CELL 0000
AT 5F8E

( PLAY-CMC-EFFECT | NFA 5F8E CFA 5F94 )
( Inferred descriptive name, not recovered original: )
( Preserves Forth X, calls CMC dispatcher with A=$21 and )
( parameter bytes X/Y from $5F8A, then returns NEXT. )
( Stack: -- )
AT 5F8E
( Header: flags, saved name and link )
BYTES 830000DA855F
CELL 5F96 ( native entry point )
STX.ZP D1            ( 5F96 )
LDA.# 21             ( 5F98 )
LDX.ABS 5F8C         ( 5F9A )
LDY.ABS 5F8D         ( 5F9D )
JSR.ABS 3003         ( 5FA0 )
LDX.ZP D1            ( 5FA3 )
JMP.ABS 0F47         ( 5FA5 )
AT 5FA8

( CMC-EFFECT! | NFA 5FA8 CFA 5FAE )
( Inferred descriptive name, not recovered original: Stores )
( the two bytes in CMC-EFFECT-PARAMETERS then invokes )
( PLAY-CMC-EFFECT. )
( Stack: x-parameter y-parameter -- )
AT 5FA8
( Header: flags, saved name and link )
BYTES 830000AA8E5F
DOCOL
t.CMC-EFFECT-PARAMETERS t.1+ t.C! t.CMC-EFFECT-PARAMETERS t.C!
t.PLAY-CMC-EFFECT t.;S
AT 5FBE

( SOUND-EFFECT-TABLE | NFA 5FBE CFA 5FC4 )
( Inferred descriptive name, not recovered original: )
( Paired-byte sound-effect parameters read by $6000 )
( PLAY-SOUND-EFFECT, which passes both bytes to $5FAE and )
( the CMC dispatcher. )
( Stack: index -- address )
AT 5FBE
( Header: flags, saved name and link )
BYTES 830000CFA85F
DODOES
( DOES> thread at 51CD )
BYTES CD51202028073709C800370B280F202084045A076E05A012B4166407
BYTES AA0E28096902B906600599110C033C131E155A1500000000
AT 5FFA

( PLAY-SOUND-EFFECT | NFA 5FFA CFA 6000 )
( Inferred descriptive name, not recovered original: When )
( the audio-state flag $5F4E is nonzero, indexes the )
( two-byte effect table $5FC4 and passes its bytes to )
( $5FAE/CMC; otherwise drops the effect index. )
( Stack: effect -- )
AT 5FFA
( Header: flags, saved name and link )
BYTES 830000D7BE5F
DOCOL
t.MUSIC-PAUSED t.@
t.0BRANCH CELL 000C ( -> 6014 )
t.SOUND-EFFECT-TABLE t.BYTE-PAIR@ t.CMC-EFFECT!
t.BRANCH CELL 0004 ( -> 6016 )
( label 6014 )
t.DROP
( label 6016 )
t.;S
AT 6018
