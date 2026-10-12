( Klatwa v1 20-framework.fth: target 2A76..6017 )
( Hexadecimal. BYTES emits bytes; CELL emits 16-bit cells. )
( LIT8/LIT16 compile literals; branches retain signed )
( offsets. )

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
( Trailing native code/data at 2BCB; retained exactly )
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
( Trailing native code/data at 2D0F; retained exactly )
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

( w2FF3 | NFA 2FEC CFA 2FF3 )
( Unknown erased name; CFA identifier )
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

( w37FE | NFA 37F7 CFA 37FE )
( Unknown erased name; CFA identifier )
AT 37F7
( Header: flags, saved name and link )
BYTES 84000000B0EC2F
DOCOL
w2FF3 LIT16 0100 t.2DUP t.MOD t.- t.+ t.;S
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

( w3832 | NFA 3829 CFA 3832 )
( Unknown erased name; CFA identifier )
AT 3829
( Header: flags, saved name and link )
BYTES 860000000000D41B38
DOCOL
t.<BUILDS t.SMUDGE t.] t.DOES>
( Trailing native code/data at 383C; retained exactly )
BYTES 8D13D5140F200413E4138A0F7712
AT 384A

( w384F | NFA 384A CFA 384F )
( Unknown erased name; CFA identifier )
AT 384A
( Header: flags, saved name and link )
BYTES 8200C92938
DOVAR
CELL 0000
AT 3853

( w3858 | NFA 3853 CFA 3858 )
( Unknown erased name; CFA identifier )
AT 3853
( Header: flags, saved name and link )
BYTES 8200D54A38
CELL 385A ( native entry point )
BYTES A001 ( 385A: LDY #$01 )
BYTES 8C5138 ( 385C: STY $3851 )
BYTES 88 ( 385F: DEY )
BYTES B1D3 ( 3860: LDA [$d3],Y )
BYTES D504 ( 3862: CMP $04,X )
BYTES D006 ( 3864: BNE $386c )
BYTES CE5138 ( 3866: DEC $3851 )
BYTES 4C8638 ( 3869: JMP $3886 )
BYTES A901 ( 386C: LDA #$01 )
BYTES 18 ( 386E: CLC )
BYTES 65D3 ( 386F: ADC $d3 )
BYTES 85D3 ( 3871: STA $d3 )
BYTES 9002 ( 3873: BCC $3877 )
BYTES E6D4 ( 3875: INC $d4 )
BYTES B501 ( 3877: LDA $01,X )
BYTES C5D4 ( 3879: CMP $d4 )
BYTES D009 ( 387B: BNE $3886 )
BYTES B500 ( 387D: LDA $00,X )
BYTES C5D3 ( 387F: CMP $d3 )
BYTES D003 ( 3881: BNE $3886 )
BYTES CE5138 ( 3883: DEC $3851 )
BYTES AD5138 ( 3886: LDA $3851 )
BYTES D0D5 ( 3889: BNE $3860 )
BYTES 4C470F ( 388B: JMP $0f47 )
AT 388E

( w3896 | NFA 388E CFA 3896 )
( Unknown erased name; CFA identifier )
AT 388E
( Header: flags, saved name and link )
BYTES 8500000000D25338
DOCOL
t.DUP t.0=_12DE t.+ t.OVER t.+ t.OVER t.XSAVE t.2+ t.! w3858
t.XSAVE t.2+ t.@ t.=
t.0BRANCH CELL 000A ( -> 38C0 )
t.2DROP t.0
t.BRANCH CELL 0012 ( -> 38D0 )
( label 38C0 )
t.XSAVE t.2+ t.@ t.SWAP t.- t.1+ t.SWAP t.DROP
( label 38D0 )
t.;S
AT 38D2

( w38DA | NFA 38D2 CFA 38DA )
( Unknown erased name; CFA identifier )
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
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $34F2 [<=<] in contiguous 4-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $38DF, )
( identical body after known address relocation; surviving )
( name length and suffix match )
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
BYTES 86D1 ( 3975: STX $d1 )
BYTES B500 ( 3977: LDA $00,X )
BYTES A8 ( 3979: TAY )
BYTES E8 ( 397A: INX )
BYTES E8 ( 397B: INX )
BYTES B500 ( 397C: LDA $00,X )
BYTES 85D3 ( 397E: STA $d3 )
BYTES E8 ( 3980: INX )
BYTES B500 ( 3981: LDA $00,X )
BYTES 85D4 ( 3983: STA $d4 )
BYTES 88 ( 3985: DEY )
BYTES B1D3 ( 3986: LDA [$d3],Y )
BYTES A201 ( 3988: LDX #$01 )
BYTES C980 ( 398A: CMP #$80 )
BYTES 1009 ( 398C: BPL $3997 )
BYTES C920 ( 398E: CMP #$20 )
BYTES 1002 ( 3990: BPL $3994 )
BYTES A200 ( 3992: LDX #$00 )
BYTES 4C9D39 ( 3994: JMP $399d )
BYTES C9A0 ( 3997: CMP #$a0 )
BYTES 1002 ( 3999: BPL $399d )
BYTES A200 ( 399B: LDX #$00 )
BYTES E000 ( 399D: CPX #$00 )
BYTES D007 ( 399F: BNE $39a8 )
BYTES 18 ( 39A1: CLC )
BYTES 6940 ( 39A2: ADC #$40 )
BYTES 18 ( 39A4: CLC )
BYTES 4CBF39 ( 39A5: JMP $39bf )
BYTES C980 ( 39A8: CMP #$80 )
BYTES 100B ( 39AA: BPL $39b7 )
BYTES C960 ( 39AC: CMP #$60 )
BYTES 1004 ( 39AE: BPL $39b4 )
BYTES 38 ( 39B0: SEC )
BYTES E920 ( 39B1: SBC #$20 )
BYTES 18 ( 39B3: CLC )
BYTES 4CBF39 ( 39B4: JMP $39bf )
BYTES C9E0 ( 39B7: CMP #$e0 )
BYTES 1004 ( 39B9: BPL $39bf )
BYTES 38 ( 39BB: SEC )
BYTES E920 ( 39BC: SBC #$20 )
BYTES 18 ( 39BE: CLC )
BYTES 91D3 ( 39BF: STA [$d3],Y )
BYTES C000 ( 39C1: CPY #$00 )
BYTES D0C0 ( 39C3: BNE $3985 )
BYTES A6D1 ( 39C5: LDX $d1 )
BYTES 4C5710 ( 39C7: JMP $1057 )
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
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $364A [X!] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $3B7E, )
( identical body after known address relocation; surviving )
( name length and suffix match )
AT 39EB
( Header: flags, saved name and link )
BYTES 8200A1CA39
DOCOL
LIT8 55 t.! t.;S
AT 39F9

( Y! | NFA 39F9 CFA 39FE )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $3658 [Y!] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $3B8C, )
( identical body after known address relocation; surviving )
( name length and suffix match )
AT 39F9
( Header: flags, saved name and link )
BYTES 8200A1EB39
DOCOL
LIT8 54 t.C! t.;S
AT 3A07

( X@ | NFA 3A07 CFA 3A0C )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $3666 [X@] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $3B9A, )
( identical body after known address relocation; surviving )
( name length and suffix match )
AT 3A07
( Header: flags, saved name and link )
BYTES 8200C0F939
DOCOL
LIT8 55 t.@ t.;S
AT 3A15

( Y@ | NFA 3A15 CFA 3A1A )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $3674 [Y@] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $3BA8, )
( identical body after known address relocation; surviving )
( name length and suffix match )
AT 3A15
( Header: flags, saved name and link )
BYTES 8200C0073A
DOCOL
LIT8 54 t.C@ t.;S
AT 3A23

( POS | NFA 3A23 CFA 3A29 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $3683 [POS] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $3BB7, )
( identical body after known address relocation; surviving )
( name length and suffix match )
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

( w3AC3 | NFA 3ABE CFA 3AC3 )
( Unknown erased name; CFA identifier )
AT 3ABE
( Header: flags, saved name and link )
BYTES 8200D39F3A
DOCON
CELL 00F0
AT 3AC7

( w3ACC | NFA 3AC7 CFA 3ACC )
( Unknown erased name; CFA identifier )
AT 3AC7
( Header: flags, saved name and link )
BYTES 8200CCBE3A
DOCON
CELL 00F2
AT 3AD0

( w3AD5 | NFA 3AD0 CFA 3AD5 )
( Unknown erased name; CFA identifier )
AT 3AD0
( Header: flags, saved name and link )
BYTES 8200AAC73A
DOCON
CELL 00F4
AT 3AD9

( w3ADF | NFA 3AD9 CFA 3ADF )
( Unknown erased name; CFA identifier )
AT 3AD9
( Header: flags, saved name and link )
BYTES 830000B0D03A
DOCON
CELL 00F4
AT 3AE3

( w3AE8 | NFA 3AE3 CFA 3AE8 )
( Unknown erased name; CFA identifier )
AT 3AE3
( Header: flags, saved name and link )
BYTES 8200ABD93A
DOCON
CELL 00F6
AT 3AEC

( w3AF2 | NFA 3AEC CFA 3AF2 )
( Unknown erased name; CFA identifier )
AT 3AEC
( Header: flags, saved name and link )
BYTES 830000C1E33A
DOCON
CELL 00F7
AT 3AF6

( w3AFC | NFA 3AF6 CFA 3AFC )
( Unknown erased name; CFA identifier )
AT 3AF6
( Header: flags, saved name and link )
BYTES 830000C1EC3A
DOCON
CELL 00F8
AT 3B00

( w3B05 | NFA 3B00 CFA 3B05 )
( Unknown erased name; CFA identifier )
AT 3B00
( Header: flags, saved name and link )
BYTES 8200CDF63A
DOCON
CELL 00F9
AT 3B09

( w3B0F | NFA 3B09 CFA 3B0F )
( Unknown erased name; CFA identifier )
AT 3B09
( Header: flags, saved name and link )
BYTES 830000D0003B
DOCON
CELL 00FA
AT 3B13

( w3B1A | NFA 3B13 CFA 3B1A )
( Unknown erased name; CFA identifier )
AT 3B13
( Header: flags, saved name and link )
BYTES 84000000DA093B
DOCON
CELL 00FB
AT 3B1E

( w3B24 | NFA 3B1E CFA 3B24 )
( Unknown erased name; CFA identifier )
AT 3B1E
( Header: flags, saved name and link )
BYTES 830000CF133B
DOCON
CELL 00FC
AT 3B28

( w3B2F | NFA 3B28 CFA 3B2F )
( Unknown erased name; CFA identifier )
AT 3B28
( Header: flags, saved name and link )
BYTES 84000000B01E3B
CELL 3B31 ( native entry point )
BYTES A5F4 ( 3B31: LDA $f4 )
BYTES 85F2 ( 3B33: STA $f2 )
BYTES A5F5 ( 3B35: LDA $f5 )
BYTES 85F3 ( 3B37: STA $f3 )
BYTES 60 ( 3B39: RTS )
AT 3B3A

( w3B41 | NFA 3B3A CFA 3B41 )
( Unknown erased name; CFA identifier )
AT 3B3A
( Header: flags, saved name and link )
BYTES 84000000B0283B
CELL 3B43 ( native entry point )
BYTES A5F2 ( 3B43: LDA $f2 )
BYTES 85F4 ( 3B45: STA $f4 )
BYTES A5F3 ( 3B47: LDA $f3 )
BYTES 85F5 ( 3B49: STA $f5 )
BYTES 60 ( 3B4B: RTS )
AT 3B4C

( w3B52 | NFA 3B4C CFA 3B52 )
( Unknown erased name; CFA identifier )
AT 3B4C
( Header: flags, saved name and link )
BYTES 830000AB3A3B
CELL 3B54 ( native entry point )
BYTES 18 ( 3B54: CLC )
BYTES A5F6 ( 3B55: LDA $f6 )
BYTES 65F2 ( 3B57: ADC $f2 )
BYTES 85F2 ( 3B59: STA $f2 )
BYTES 9003 ( 3B5B: BCC $3b60 )
BYTES E6F3 ( 3B5D: INC $f3 )
BYTES 18 ( 3B5F: CLC )
BYTES 60 ( 3B60: RTS )
AT 3B61

( w3B67 | NFA 3B61 CFA 3B67 )
( Unknown erased name; CFA identifier )
AT 3B61
( Header: flags, saved name and link )
BYTES 830000AB4C3B
CELL 3B69 ( native entry point )
BYTES 18 ( 3B69: CLC )
BYTES 65F0 ( 3B6A: ADC $f0 )
BYTES 85F0 ( 3B6C: STA $f0 )
BYTES 9003 ( 3B6E: BCC $3b73 )
BYTES E6F1 ( 3B70: INC $f1 )
BYTES 18 ( 3B72: CLC )
BYTES 60 ( 3B73: RTS )
AT 3B74

( w3B7A | NFA 3B74 CFA 3B7A )
( Unknown erased name; CFA identifier )
AT 3B74
( Header: flags, saved name and link )
BYTES 830000D0613B
CELL 3B7C ( native entry point )
BYTES A001 ( 3B7C: LDY #$01 )
BYTES A9C0 ( 3B7E: LDA #$c0 )
BYTES 31F0 ( 3B80: AND [$f0],Y )
BYTES 4A ( 3B82: LSR A )
BYTES 4A ( 3B83: LSR A )
BYTES 4A ( 3B84: LSR A )
BYTES 4A ( 3B85: LSR A )
BYTES 4A ( 3B86: LSR A )
BYTES 4A ( 3B87: LSR A )
BYTES 18 ( 3B88: CLC )
BYTES 6901 ( 3B89: ADC #$01 )
BYTES 85FA ( 3B8B: STA $fa )
BYTES A93F ( 3B8D: LDA #$3f )
BYTES 31F0 ( 3B8F: AND [$f0],Y )
BYTES 85FB ( 3B91: STA $fb )
BYTES A200 ( 3B93: LDX #$00 )
BYTES C8 ( 3B95: INY )
BYTES B1F0 ( 3B96: LDA [$f0],Y )
BYTES 95FC ( 3B98: STA $fc,X )
BYTES C8 ( 3B9A: INY )
BYTES E8 ( 3B9B: INX )
BYTES E4FA ( 3B9C: CPX $fa )
BYTES D0F6 ( 3B9E: BNE $3b96 )
BYTES 98 ( 3BA0: TYA )
BYTES 20693B ( 3BA1: JSR $3b69 )
BYTES A000 ( 3BA4: LDY #$00 )
BYTES A200 ( 3BA6: LDX #$00 )
BYTES B5FC ( 3BA8: LDA $fc,X )
BYTES 91F2 ( 3BAA: STA [$f2],Y )
BYTES 20543B ( 3BAC: JSR $3b54 )
BYTES C6F9 ( 3BAF: DEC $f9 )
BYTES E8 ( 3BB1: INX )
BYTES E4FA ( 3BB2: CPX $fa )
BYTES D0F2 ( 3BB4: BNE $3ba8 )
BYTES C6FB ( 3BB6: DEC $fb )
BYTES D0EC ( 3BB8: BNE $3ba6 )
BYTES 60 ( 3BBA: RTS )
AT 3BBB

( w3BC1 | NFA 3BBB CFA 3BC1 )
( Unknown erased name; CFA identifier )
AT 3BBB
( Header: flags, saved name and link )
BYTES 830000BC743B
CELL 3BC3 ( native entry point )
BYTES 20433B ( 3BC3: JSR $3b43 )
BYTES A5F8 ( 3BC6: LDA $f8 )
BYTES 85F9 ( 3BC8: STA $f9 )
BYTES A000 ( 3BCA: LDY #$00 )
BYTES B1F0 ( 3BCC: LDA [$f0],Y )
BYTES C98D ( 3BCE: CMP #$8d )
BYTES D006 ( 3BD0: BNE $3bd8 )
BYTES 207C3B ( 3BD2: JSR $3b7c )
BYTES 4CE43B ( 3BD5: JMP $3be4 )
BYTES 91F2 ( 3BD8: STA [$f2],Y )
BYTES C6F9 ( 3BDA: DEC $f9 )
BYTES 20543B ( 3BDC: JSR $3b54 )
BYTES A901 ( 3BDF: LDA #$01 )
BYTES 20693B ( 3BE1: JSR $3b69 )
BYTES A5F9 ( 3BE4: LDA $f9 )
BYTES D0E2 ( 3BE6: BNE $3bca )
BYTES 20313B ( 3BE8: JSR $3b31 )
BYTES A5F2 ( 3BEB: LDA $f2 )
BYTES 18 ( 3BED: CLC )
BYTES 6901 ( 3BEE: ADC #$01 )
BYTES 85F2 ( 3BF0: STA $f2 )
BYTES 9002 ( 3BF2: BCC $3bf6 )
BYTES E6F3 ( 3BF4: INC $f3 )
BYTES C6F7 ( 3BF6: DEC $f7 )
BYTES D0C9 ( 3BF8: BNE $3bc3 )
BYTES 60 ( 3BFA: RTS )
AT 3BFB

( w3C04 | NFA 3BFB CFA 3C04 )
( Unknown erased name; CFA identifier )
AT 3BFB
( Header: flags, saved name and link )
BYTES 860000000000BCBB3B
CELL 3C06 ( native entry point )
BYTES 86D1 ( 3C06: STX $d1 )
BYTES 20C33B ( 3C08: JSR $3bc3 )
BYTES A6D1 ( 3C0B: LDX $d1 )
BYTES 4C470F ( 3C0D: JMP $0f47 )
AT 3C10

( w3C17 | NFA 3C10 CFA 3C17 )
( Unknown erased name; CFA identifier )
AT 3C10
( Header: flags, saved name and link )
BYTES 84000000A1FB3B
DOCOL
w3AFC t.C! w3AF2 t.C! t.;S
AT 3C23

( w3C2A | NFA 3C23 CFA 3C2A )
( Unknown erased name; CFA identifier )
AT 3C23
( Header: flags, saved name and link )
BYTES 84000000A1103C
DOCOL
w3ACC t.! w3AC3 t.! t.;S
AT 3C36

( w3C3D | NFA 3C36 CFA 3C3D )
( Unknown erased name; CFA identifier )
AT 3C36
( Header: flags, saved name and link )
BYTES 84000000A1233C
DOCOL
w3AE8 t.C! t.;S
AT 3C45

( w3C4B | NFA 3C45 CFA 3C4B )
( Unknown erased name; CFA identifier )
AT 3C45
( Header: flags, saved name and link )
BYTES 830000CC363C
DOVAR
CELL 0000
AT 3C4F

( w3C54 | NFA 3C4F CFA 3C54 )
( Unknown erased name; CFA identifier )
AT 3C4F
( Header: flags, saved name and link )
BYTES 8200A5453C
DOCON
CELL 00DD
AT 3C58

( w3C5D | NFA 3C58 CFA 3C5D )
( Unknown erased name; CFA identifier )
AT 3C58
( Header: flags, saved name and link )
BYTES 8200A54F3C
DOCON
CELL 00DF
AT 3C61

( w3C67 | NFA 3C61 CFA 3C67 )
( Unknown erased name; CFA identifier )
AT 3C61
( Header: flags, saved name and link )
BYTES 830000D4583C
CELL 3C69 ( native entry point )
BYTES AD0BD4 ( 3C69: LDA $d40b )
BYTES 30FB ( 3C6C: BMI $3c69 )
BYTES AD0BD4 ( 3C6E: LDA $d40b )
BYTES 10FB ( 3C71: BPL $3c6e )
BYTES A9FF ( 3C73: LDA #$ff )
BYTES 8D0AD4 ( 3C75: STA $d40a )
BYTES 78 ( 3C78: SEI )
BYTES CE01D3 ( 3C79: DEC $d301 )
BYTES 60 ( 3C7C: RTS )
AT 3C7D

( w3C83 | NFA 3C7D CFA 3C83 )
( Unknown erased name; CFA identifier )
AT 3C7D
( Header: flags, saved name and link )
BYTES 830000CC613C
CELL 3C85 ( native entry point )
BYTES 20693C ( 3C85: JSR $3c69 )
BYTES 88 ( 3C88: DEY )
BYTES B1DD ( 3C89: LDA [$dd],Y )
BYTES 91DF ( 3C8B: STA [$df],Y )
BYTES C000 ( 3C8D: CPY #$00 )
BYTES D0F7 ( 3C8F: BNE $3c88 )
BYTES EE01D3 ( 3C91: INC $d301 )
BYTES 58 ( 3C94: CLI )
BYTES 60 ( 3C95: RTS )
AT 3C96

( w3C9C | NFA 3C96 CFA 3C9C )
( Unknown erased name; CFA identifier )
AT 3C96
( Header: flags, saved name and link )
BYTES 830000D67D3C
CELL 3C9E ( native entry point )
BYTES 86D1 ( 3C9E: STX $d1 )
BYTES AE4E3C ( 3CA0: LDX $3c4e )
BYTES A000 ( 3CA3: LDY #$00 )
BYTES E000 ( 3CA5: CPX #$00 )
BYTES F00A ( 3CA7: BEQ $3cb3 )
BYTES 20853C ( 3CA9: JSR $3c85 )
BYTES E6DE ( 3CAC: INC $de )
BYTES E6E0 ( 3CAE: INC $e0 )
BYTES CA ( 3CB0: DEX )
BYTES D0F6 ( 3CB1: BNE $3ca9 )
BYTES AD4D3C ( 3CB3: LDA $3c4d )
BYTES F006 ( 3CB6: BEQ $3cbe )
BYTES AC4D3C ( 3CB8: LDY $3c4d )
BYTES 20853C ( 3CBB: JSR $3c85 )
BYTES A6D1 ( 3CBE: LDX $d1 )
BYTES 4C470F ( 3CC0: JMP $0f47 )
AT 3CC3

( w3CCB | NFA 3CC3 CFA 3CCB )
( Unknown erased name; CFA identifier )
AT 3CC3
( Header: flags, saved name and link )
BYTES 8500000000C5963C
DOCOL
w3C4B t.! w3C5D t.! w3C54 t.! w3C9C t.;S
AT 3CDD

( w3CE3 | NFA 3CDD CFA 3CE3 )
( Unknown erased name; CFA identifier )
AT 3CDD
( Header: flags, saved name and link )
BYTES 830000B8C33C
DOCON
CELL 2800
AT 3CE7

( w3CED | NFA 3CE7 CFA 3CED )
( Unknown erased name; CFA identifier )
AT 3CE7
( Header: flags, saved name and link )
BYTES 830000CCDD3C
DOCOL
t.OVER t.+ t.DUP t.>R w3CE3 t.< t.0=_12DE
t.0BRANCH CELL 004A ( -> 3D49 )
t.DUP w3CE3 t.< t.0=_12DE
t.0BRANCH CELL 0020 ( -> 3D2B )
t.>R t.0 t.0 LIT16 C000 t.R w3CE3 t.- t.+ t.R> t.R t.SWAP t.-
t.BRANCH CELL 001C ( -> 3D45 )
( label 3D2B )
t.>R LIT16 D800 t.R t.+ w3CE3 t.R> t.- LIT16 C000 t.R w3CE3
t.-
( label 3D45 )
t.BRANCH CELL 0018 ( -> 3D5F )
( label 3D49 )
t.>R LIT16 D800 t.R t.+ t.R> t.R t.SWAP t.- t.0 t.0
( label 3D5F )
t.R> t.DROP t.>R t.OVER t.R> t.SWAP t.;S
AT 3D6D

( w3D74 | NFA 3D6D CFA 3D74 )
( Unknown erased name; CFA identifier )
AT 3D6D
( Header: flags, saved name and link )
BYTES 84000000CDE73C
DOCOL
t.ROT t.>R w3CED t.R t.+ t.ROT t.ROT w3CCB t.R> t.ROT t.ROT
w3CCB t.;S
AT 3D90

( w3D97 | NFA 3D90 CFA 3D97 )
( Unknown erased name; CFA identifier )
AT 3D90
( Header: flags, saved name and link )
BYTES 84000000CD6D3D
DOCOL
t.ROT t.>R w3CED t.R t.+ t.SWAP w3CCB t.R> t.SWAP w3CCB t.;S
AT 3DAF

( w3DB9 | NFA 3DAF CFA 3DB9 )
( Unknown erased name; CFA identifier )
AT 3DAF
( Header: flags, saved name and link )
BYTES 87000000000000C2903D
CELL 3DBB ( native entry point )
BYTES B501 ( 3DBB: LDA $01,X )
BYTES CA ( 3DBD: DEX )
BYTES CA ( 3DBE: DEX )
BYTES 9500 ( 3DBF: STA $00,X )
BYTES A900 ( 3DC1: LDA #$00 )
BYTES 9503 ( 3DC3: STA $03,X )
BYTES 9501 ( 3DC5: STA $01,X )
BYTES 4C470F ( 3DC7: JMP $0f47 )
AT 3DCA

( w3DD2 | NFA 3DCA CFA 3DD2 )
( Unknown erased name; CFA identifier )
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

( w3E15 | NFA 3E0D CFA 3E15 )
( Unknown erased name; CFA identifier )
AT 3E0D
( Header: flags, saved name and link )
BYTES 8500000000B1CA3D
DOVAR
BYTES EAEAEAEA205B5FEAEAEA20316FEAEAEAEAEAEAEAEAEAEAEAEAEAEAEA
BYTES EAEAEA4C533E20
AT 3E3A

( w3E41 | NFA 3E3A CFA 3E41 )
( Unknown erased name; CFA identifier )
AT 3E3A
( Header: flags, saved name and link )
BYTES 84000000B10D3E
DOCOL
w3E15 w3DD2 t.;S
AT 3E49

( w3E51 | NFA 3E49 CFA 3E51 )
( Unknown erased name; CFA identifier )
AT 3E49
( Header: flags, saved name and link )
BYTES 8500000000A93A3E
CELL 3E53 ( native entry point )
BYTES 4C62E4 ( 3E53: JMP $e462 )
AT 3E56

( RUN-VBI1 | NFA 3E56 CFA 3E60 )
( Matches GAM FORTH deferred-VBI native routine: SETVBV )
( with X/Y selecting vector $3E18. )
AT 3E56
( Header: flags, saved name and link )
BYTES 87000000000000B1493E
CELL 3E62 ( native entry point )
BYTES 86D1 ( 3E62: STX $d1 )
BYTES A23E ( 3E64: LDX #$3e )
BYTES A018 ( 3E66: LDY #$18 )
BYTES A907 ( 3E68: LDA #$07 )
BYTES 205CE4 ( 3E6A: JSR $e45c )
BYTES A6D1 ( 3E6D: LDX $d1 )
BYTES 4C470F ( 3E6F: JMP $0f47 )
AT 3E72

( STOP-VBI1 | NFA 3E72 CFA 3E7D )
( Matches GAM FORTH deferred-VBI native routine: SETVBV )
( with X/Y selecting vector $E462. )
AT 3E72
( Header: flags, saved name and link )
BYTES 8800000000000000B1563E
CELL 3E7F ( native entry point )
BYTES 86D1 ( 3E7F: STX $d1 )
BYTES A2E4 ( 3E81: LDX #$e4 )
BYTES A062 ( 3E83: LDY #$62 )
BYTES A907 ( 3E85: LDA #$07 )
BYTES 205CE4 ( 3E87: JSR $e45c )
BYTES A6D1 ( 3E8A: LDX $d1 )
BYTES 4C470F ( 3E8C: JMP $0f47 )
AT 3E8F

( w3E96 | NFA 3E8F CFA 3E96 )
( Unknown erased name; CFA identifier )
AT 3E8F
( Header: flags, saved name and link )
BYTES 84000000C4723E
DOVAR
CELL 0003
AT 3E9A

( w3EA0 | NFA 3E9A CFA 3EA0 )
( Unknown erased name; CFA identifier )
AT 3E9A
( Header: flags, saved name and link )
BYTES 830000C38F3E
DOVAR
CELL 00A7
AT 3EA4

( w3EA9 | NFA 3EA4 CFA 3EA9 )
( Unknown erased name; CFA identifier )
AT 3EA4
( Header: flags, saved name and link )
BYTES 8200CB9A3E
DOCON
CELL 00D2
AT 3EAD

( w3EB3 | NFA 3EAD CFA 3EB3 )
( Unknown erased name; CFA identifier )
AT 3EAD
( Header: flags, saved name and link )
BYTES 830000ABA43E
CELL 3EB5 ( native entry point )
BYTES A5D2 ( 3EB5: LDA $d2 )
BYTES 18 ( 3EB7: CLC )
BYTES 6D983E ( 3EB8: ADC $3e98 )
BYTES 85D2 ( 3EBB: STA $d2 )
BYTES A5D3 ( 3EBD: LDA $d3 )
BYTES 6D993E ( 3EBF: ADC $3e99 )
BYTES 85D3 ( 3EC2: STA $d3 )
BYTES 60 ( 3EC4: RTS )
AT 3EC5

( w3ECB | NFA 3EC5 CFA 3ECB )
( Unknown erased name; CFA identifier )
AT 3EC5
( Header: flags, saved name and link )
BYTES 830000AAAD3E
CELL 3ECD ( native entry point )
BYTES B502 ( 3ECD: LDA $02,X )
BYTES A000 ( 3ECF: LDY #$00 )
BYTES AA ( 3ED1: TAX )
BYTES F031 ( 3ED2: BEQ $3f05 )
BYTES B1D2 ( 3ED4: LDA [$d2],Y )
BYTES 8D983E ( 3ED6: STA $3e98 )
BYTES C8 ( 3ED9: INY )
BYTES B1D2 ( 3EDA: LDA [$d2],Y )
BYTES 8D993E ( 3EDC: STA $3e99 )
BYTES 88 ( 3EDF: DEY )
BYTES A902 ( 3EE0: LDA #$02 )
BYTES 18 ( 3EE2: CLC )
BYTES 6D983E ( 3EE3: ADC $3e98 )
BYTES 8D983E ( 3EE6: STA $3e98 )
BYTES 9003 ( 3EE9: BCC $3eee )
BYTES EE993E ( 3EEB: INC $3e99 )
BYTES 20B53E ( 3EEE: JSR $3eb5 )
BYTES CDA23E ( 3EF1: CMP $3ea2 )
BYTES 300C ( 3EF4: BMI $3f02 )
BYTES A5D3 ( 3EF6: LDA $d3 )
BYTES 18 ( 3EF8: CLC )
BYTES 69C0 ( 3EF9: ADC #$c0 )
BYTES 85D3 ( 3EFB: STA $d3 )
BYTES A9D8 ( 3EFD: LDA #$d8 )
BYTES 8DA23E ( 3EFF: STA $3ea2 )
BYTES CA ( 3F02: DEX )
BYTES D0CF ( 3F03: BNE $3ed4 )
BYTES A6D1 ( 3F05: LDX $d1 )
BYTES 60 ( 3F07: RTS )
AT 3F08

( w3F0E | NFA 3F08 CFA 3F0E )
( Unknown erased name; CFA identifier )
AT 3F08
( Header: flags, saved name and link )
BYTES 830000AAC53E
CELL 3F10 ( native entry point )
BYTES 86D1 ( 3F10: STX $d1 )
BYTES B500 ( 3F12: LDA $00,X )
BYTES 85D2 ( 3F14: STA $d2 )
BYTES B501 ( 3F16: LDA $01,X )
BYTES 85D3 ( 3F18: STA $d3 )
BYTES 60 ( 3F1A: RTS )
AT 3F1B

( w3F21 | NFA 3F1B CFA 3F21 )
( Unknown erased name; CFA identifier )
AT 3F1B
( Header: flags, saved name and link )
BYTES 830000C3083F
CELL 3F23 ( native entry point )
BYTES A9A7 ( 3F23: LDA #$a7 )
BYTES 8DA23E ( 3F25: STA $3ea2 )
BYTES 20103F ( 3F28: JSR $3f10 )
BYTES 20CD3E ( 3F2B: JSR $3ecd )
BYTES 4C5710 ( 3F2E: JMP $1057 )
AT 3F31

( w3F3B | NFA 3F31 CFA 3F3B )
( Unknown erased name; CFA identifier )
AT 3F31
( Header: flags, saved name and link )
BYTES 87000000000000C31B3F
DOCOL
t.<BUILDS t.DUP t., t.ALLOT t.DOES>
( Trailing native code/data at 3F47; retained exactly )
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

( w3F6D | NFA 3F66 CFA 3F6D )
( Unknown erased name; CFA identifier )
AT 3F66
( Header: flags, saved name and link )
BYTES 84000000C4513F
DOCOL
w3F21 w3EA9 t.@ t.;S
AT 3F77

( w3F7F | NFA 3F77 CFA 3F7F )
( Unknown erased name; CFA identifier )
AT 3F77
( Header: flags, saved name and link )
BYTES 8500000000D4663F
DOCOL
LIT16 0022 t.WORD t.HERE t.1+ t.OVER t.2+ t.HERE t.C@ t.CMOVE
t.HERE t.C@ t.SWAP t.! t.;S
AT 3F9F

( w3FA6 | NFA 3F9F CFA 3FA6 )
( Unknown erased name; CFA identifier )
AT 3F9F
( Header: flags, saved name and link )
BYTES 84000000D5773F
DOCOL
t.>R t.R w3F21 w3EA9 t.@ t.R> t.- t.;S
AT 3FB8

( w3FBE | NFA 3FB8 CFA 3FBE )
( Unknown erased name; CFA identifier )
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

( w3FD5 | NFA 3FCE CFA 3FD5 )
( Unknown erased name; CFA identifier )
AT 3FCE
( Header: flags, saved name and link )
BYTES 84000000CDC23F
DOVAR
CELL 0000
AT 3FD9

( w3FDF | NFA 3FD9 CFA 3FDF )
( Unknown erased name; CFA identifier )
AT 3FD9
( Header: flags, saved name and link )
BYTES 830000D2CE3F
DOCOL
t.ROT w3FBE t.@
t.0BRANCH CELL 0012 ( -> 3FFB )
w3FD5 t.! t.PAD w3FD5 t.@ t.B/BUF w3D97 t.PAD
( label 3FFB )
t.ROT t.ROT t.;S
AT 4001

( w4006 | NFA 4001 CFA 4006 )
( Unknown erased name; CFA identifier )
AT 4001
( Header: flags, saved name and link )
BYTES 8200CED93F
DOCOL
w3FBE t.@
t.0BRANCH CELL 0032 ( -> 4040 )
t.S-L t.@
t.0BRANCH CELL 0016 ( -> 402C )
t.PAD w3FD5 t.@ t.B/BUF w3D74 t.B/BUF w3FD5 t.+!
t.BRANCH CELL 0012 ( -> 403C )
( label 402C )
t.B/BUF w3FD5 t.+! t.PAD w3FD5 t.@ t.B/BUF w3D97
( label 403C )
t.BRANCH CELL 0006 ( -> 4044 )
( label 4040 )
t.B/BUF t.+
( label 4044 )
t.;S
AT 4046

( w404D | NFA 4046 CFA 404D )
( Unknown erased name; CFA identifier )
AT 4046
( Header: flags, saved name and link )
BYTES 84000000D20140
DOVAR
CELL 0000
AT 4051

( w4057 | NFA 4051 CFA 4057 )
( Unknown erased name; CFA identifier )
AT 4051
( Header: flags, saved name and link )
BYTES 830000D04640
DOVAR
CELL 0000
AT 405B

( w4062 | NFA 405B CFA 4062 )
( Unknown erased name; CFA identifier )
AT 405B
( Header: flags, saved name and link )
BYTES 84000000D25140
DOCOL
t.PAD t.B/BUF t.+ t.DUP w404D t.! t.DIRB t.1 t.1 t.-DISK
t.0=_12DE
t.0BRANCH CELL 0054 ( -> 40D0 )
t.1 LIT16 007F t.1 t.(DO)
( label 4088 )
t.OVER t.I t.=
t.0BRANCH CELL 002C ( -> 40BC )
t.SWAP t.DROP t.DUP t.DIRB t.> t.0=_12DE t.0=_12DE t.+ w404D
t.@ t.I t.+ t.C@ t.2DUP t.+ w4057 t.! t.0 t.LEAVE
t.BRANCH CELL 000E ( -> 40C8 )
( label 40BC )
w404D t.@ t.I t.+ t.C@ t.+
( label 40C8 )
t.(LOOP) CELL FFBE ( -> 4088 )
t.BRANCH CELL 0006 ( -> 40D4 )
( label 40D0 )
t.DROP t.1
( label 40D4 )
t.;S
AT 40D6

( w40DE | NFA 40D6 CFA 40DE )
( Unknown erased name; CFA identifier )
AT 40D6
( Header: flags, saved name and link )
BYTES 8500000000CB5B40
DOCOL
w3FDF t.OVER t.+ t.OVER t.1 t.- t.OVER t.DIRB t.SWAP t.<=<
t.0=_12DE t.0=_12DE t.+ t.SWAP t.(DO)
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
w4006
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
t.0 t.S-L t.! t.SWAP t.>R w4062 t.>R t.-DUP t.0=_12DE
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
t.1 t.S-L t.! t.SWAP t.>R w4062 t.R> t.SWAP t.ROT t.;S
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
t.R> w40DE
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

( w41C7 | NFA 41C1 CFA 41C7 )
( Unknown erased name; CFA identifier )
AT 41C1
( Header: flags, saved name and link )
BYTES 830000C48141
DOVAR
CELL 0003
AT 41CB

( w41D1 | NFA 41CB CFA 41D1 )
( Unknown erased name; CFA identifier )
AT 41CB
( Header: flags, saved name and link )
BYTES 830000C4C141
DOCOL
t.PAD t.DIRB t.1 t.1 t.-DISK t.0=_12DE t.0=_12DE t.DUP
t.0=_12DE
t.0BRANCH CELL 0014 ( -> 41FB )
t.DROP t.PAD t.C@ w41C7 t.@ t.= t.0=_12DE t.3 t.*
( label 41FB )
t.DUP
t.0BRANCH CELL 000A ( -> 4209 )
t.>R t.DROP t.2DROP t.R>
( label 4209 )
t.-DUP t.0=_12DE t.;S
AT 420F

( w4215 | NFA 420F CFA 4215 )
( Unknown erased name; CFA identifier )
AT 420F
( Header: flags, saved name and link )
BYTES 830000D2CB41
DOVAR
CELL 0000
AT 4219

( w4221 | NFA 4219 CFA 4221 )
( Unknown erased name; CFA identifier )
AT 4219
( Header: flags, saved name and link )
BYTES 8500000000C40F42
DOCOL
w41D1
t.0BRANCH CELL 0006 ( -> 422D )
t.DIRL t.DSL
( label 422D )
w4215 t.! t.;S
AT 4233

( w423B | NFA 4233 CFA 423B )
( Unknown erased name; CFA identifier )
AT 4233
( Header: flags, saved name and link )
BYTES 8500000000C51942
DOCOL
w41D1
t.0BRANCH CELL 004C ( -> 428D )
t.>R t.>R t.DUP t.R> t.R> t.2DUP t.>R t.>R t.DIRS t.DSL t.SWAP
t.DROP t.R> t.R> w404D t.@ t.+ t.DUP t.C@ t.>R t.C! t.DUP
t.0=_12DE t.R> t.0=_12DE t.*
t.0BRANCH CELL 0014 ( -> 428D )
t.DROP w404D t.@ t.DIRB t.1 t.0 t.-DISK t.0=_12DE t.0=_12DE
( label 428D )
w4215 t.! t.;S
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

( w42C3 | NFA 42BD CFA 42C3 )
( Unknown erased name; CFA identifier )
AT 42BD
( Header: flags, saved name and link )
BYTES 830000A19342
DOCOL
t.DUP t.C@ LIT16 0080 t.OR t.SWAP t.C! t.;S
AT 42D5

( w42DB | NFA 42D5 CFA 42DB )
( Unknown erased name; CFA identifier )
AT 42D5
( Header: flags, saved name and link )
BYTES 830000CCBD42
DOVAR
BYTES E4181C9C54C8785420202020202020202020
AT 42EF

( w42F5 | NFA 42EF CFA 42F5 )
( Unknown erased name; CFA identifier )
AT 42EF
( Header: flags, saved name and link )
BYTES 830000D3D542
DOVAR
CELL 0000
AT 42F9

( w4300 | NFA 42F9 CFA 4300 )
( Unknown erased name; CFA identifier )
AT 42F9
( Header: flags, saved name and link )
BYTES 84000000CCEF42
DOCON
CELL 00DB
AT 4304

( w430A | NFA 4304 CFA 430A )
( Unknown erased name; CFA identifier )
AT 4304
( Header: flags, saved name and link )
BYTES 830000C9F942
DOVAR
CELL 0060
AT 430E

( w4315 | NFA 430E CFA 4315 )
( Unknown erased name; CFA identifier )
AT 430E
( Header: flags, saved name and link )
BYTES 84000000A90443
CELL 4317 ( native entry point )
BYTES 08 ( 4317: PHP )
BYTES 48 ( 4318: PHA )
BYTES 98 ( 4319: TYA )
BYTES 48 ( 431A: PHA )
BYTES ACF742 ( 431B: LDY $42f7 )
BYTES 18 ( 431E: CLC )
BYTES B1DB ( 431F: LDA [$db],Y )
BYTES 8D16D0 ( 4321: STA $d016 )
BYTES C8 ( 4324: INY )
BYTES B1DB ( 4325: LDA [$db],Y )
BYTES 8D17D0 ( 4327: STA $d017 )
BYTES C8 ( 432A: INY )
BYTES B1DB ( 432B: LDA [$db],Y )
BYTES 8D18D0 ( 432D: STA $d018 )
BYTES C8 ( 4330: INY )
BYTES AD0BD4 ( 4331: LDA $d40b )
BYTES C940 ( 4334: CMP #$40 )
BYTES 3002 ( 4336: BMI $433a )
BYTES A000 ( 4338: LDY #$00 )
BYTES 8CF742 ( 433A: STY $42f7 )
BYTES 68 ( 433D: PLA )
BYTES A8 ( 433E: TAY )
BYTES 68 ( 433F: PLA )
BYTES 28 ( 4340: PLP )
BYTES 40 ( 4341: RTI )
AT 4342

( w4349 | NFA 4342 CFA 4349 )
( Unknown erased name; CFA identifier )
AT 4342
( Header: flags, saved name and link )
BYTES 84000000CC0E43
DOCOL
LIT16 4317 LIT16 0200 t.! t.0 w42F5 t.! w430A t.C@ LIT16 00E0
t.OR t.DUP w430A t.C! LIT16 D40E t.C! t.;S
AT 4373

( w437A | NFA 4373 CFA 437A )
( Unknown erased name; CFA identifier )
AT 4373
( Header: flags, saved name and link )
BYTES 84000000CC4243
DOCOL
LIT16 0060 w430A t.C! t.1 t.PAUSE w4300 t.@ LIT16 02C4
LIT16 0003 t.CMOVE LIT16 0060 LIT16 D40E t.C! w4300 t.@
LIT16 D016 LIT16 0003 t.CMOVE t.;S
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
BYTES 18 ( 43EA: CLC )
BYTES A5D2 ( 43EB: LDA $d2 )
BYTES 6928 ( 43ED: ADC #$28 )
BYTES 85D2 ( 43EF: STA $d2 )
BYTES A5D3 ( 43F1: LDA $d3 )
BYTES 6900 ( 43F3: ADC #$00 )
BYTES 85D3 ( 43F5: STA $d3 )
BYTES 60 ( 43F7: RTS )
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
BYTES A000 ( 4400: LDY #$00 )
BYTES ADB843 ( 4402: LDA $43b8 )
BYTES 91D2 ( 4405: STA [$d2],Y )
BYTES C8 ( 4407: INY )
BYTES ADB943 ( 4408: LDA $43b9 )
BYTES 91D2 ( 440B: STA [$d2],Y )
BYTES C8 ( 440D: INY )
BYTES 98 ( 440E: TYA )
BYTES A6D1 ( 440F: LDX $d1 )
BYTES D502 ( 4411: CMP $02,X )
BYTES D0F3 ( 4413: BNE $4408 )
BYTES 88 ( 4415: DEY )
BYTES ADBA43 ( 4416: LDA $43ba )
BYTES 91D2 ( 4419: STA [$d2],Y )
BYTES 60 ( 441B: RTS )
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
BYTES 86D1 ( 4423: STX $d1 )
BYTES 200044 ( 4425: JSR $4400 )
BYTES 20EA43 ( 4428: JSR $43ea )
BYTES A6D1 ( 442B: LDX $d1 )
BYTES 4C470F ( 442D: JMP $0f47 )
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
BYTES 86D1 ( 4437: STX $d1 )
BYTES 200044 ( 4439: JSR $4400 )
BYTES A6D1 ( 443C: LDX $d1 )
BYTES 4C5710 ( 443E: JMP $1057 )
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
BYTES 86D1 ( 4448: STX $d1 )
BYTES A902 ( 444A: LDA #$02 )
BYTES 85D4 ( 444C: STA $d4 )
BYTES 200044 ( 444E: JSR $4400 )
BYTES 20EA43 ( 4451: JSR $43ea )
BYTES E6D4 ( 4454: INC $d4 )
BYTES A5D4 ( 4456: LDA $d4 )
BYTES A6D1 ( 4458: LDX $d1 )
BYTES D500 ( 445A: CMP $00,X )
BYTES D0F0 ( 445C: BNE $444e )
BYTES A6D1 ( 445E: LDX $d1 )
BYTES 4C470F ( 4460: JMP $0f47 )
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

( w449C | NFA 4497 CFA 449C )
( Unknown erased name; CFA identifier )
AT 4497
( Header: flags, saved name and link )
BYTES 8200AA6344
DOCOL
LIT8 58 t.@ t.Y@ LIT8 28 t.* t.+ t.X@ t.+ t.EKP t.! t.(RAM)
t.X@ t.1+ t.X! t.Y@ t.1+ t.Y! t.;S
AT 44C4

( w44CD | NFA 44C4 CFA 44CD )
( Unknown erased name; CFA identifier )
AT 44C4
( Header: flags, saved name and link )
BYTES 860000000000C19744
DOCOL
t.OVER t.2 t./ LIT8 14 t.SWAP t.- t.X! w449C t.;S
AT 44E2

( w44E8 | NFA 44E2 CFA 44E8 )
( Unknown erased name; CFA identifier )
AT 44E2
( Header: flags, saved name and link )
BYTES 830000CBC444
DOVAR
CELL 0000
AT 44EC

( w44F1 | NFA 44EC CFA 44F1 )
( Unknown erased name; CFA identifier )
AT 44EC
( Header: flags, saved name and link )
BYTES 8200D2E244
DOVAR
CELL 0000
AT 44F5

( w44FB | NFA 44F5 CFA 44FB )
( Unknown erased name; CFA identifier )
AT 44F5
( Header: flags, saved name and link )
BYTES 830000CDEC44
DOCOL
t.0 t.SWAP t.COUNT t.DUP t.>R t.0 t.(DO)
( label 450B )
t.SWAP t.OVER t.C@ t.I t.0=_12DE t.I t.1 t.= t.+
t.0BRANCH CELL 000D ( -> 452C )
t.DUP LIT8 04 t.+ w44E8 t.!
( label 452C )
t.MAX t.SWAP t.COUNT t.+
t.(LOOP) CELL FFD5 ( -> 450B )
t.DROP LIT8 04 t.+ t.DUP w44F1 t.! t.R> t.1 t.=
t.0BRANCH CELL 000F ( -> 455C )
LIT8 07 t.DUP w44F1 t.! w44E8 t.!
( label 455C )
t.;S
AT 455E

( w4564 | NFA 455E CFA 4564 )
( Unknown erased name; CFA identifier )
AT 455E
( Header: flags, saved name and link )
BYTES 830000ABF544
DOCOL
t.Y@ t.1+ t.Y! t.;S
AT 456E

( w4574 | NFA 456E CFA 4574 )
( Unknown erased name; CFA identifier )
AT 456E
( Header: flags, saved name and link )
BYTES 830000D05E45
DOCOL
t.COUNT t.0 t.(DO)
( label 457C )
t.DUP t.COUNT LIT8 14 t.OVER t.2 t./ t.- t.X! t.STYPE w4564
t.COUNT t.+
t.(LOOP) CELL FFE5 ( -> 457C )
t.DROP t.;S
AT 459D

( w45A4 | NFA 459D CFA 45A4 )
( Unknown erased name; CFA identifier )
AT 459D
( Header: flags, saved name and link )
BYTES 84000000D46E45
DOCOL
t.DUP t.C@
t.0BRANCH CELL 0041 ( -> 45ED )
t.Y@ LIT8 58 t.@ t.Y@ t.1+ LIT8 28 t.* t.+ LIT8 0B t.Y@ t.1+
t.- LIT8 28 t.* t.ERASE w4564 t.SWAP t.DUP w44FB t.OVER t.C@
t.2+ w44CD w4574 t.Y! t.0 t.X!
( ATASCII text:  [1E] )
t.(.")
BYTES 02201E
( label 45ED )
t.;S
AT 45EF

( w45F5 | NFA 45EF CFA 45F5 )
( Unknown erased name; CFA identifier )
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

( w468C | NFA 4684 CFA 468C )
( Unknown erased name; CFA identifier )
AT 4684
( Header: flags, saved name and link )
BYTES 8500000000D5EF45
DOCOL
w45F5 t.2+ w45A4 t.;S
AT 4696

( w469B | NFA 4696 CFA 469B )
( Unknown erased name; CFA identifier )
AT 4696
( Header: flags, saved name and link )
BYTES 8200C58446
DOCOL
LIT8 58 t.@ LIT16 01B8 t.ERASE t.0 t.0 t.POS t.;S
AT 46B0

( w46B6 | NFA 46B0 CFA 46B6 )
( Unknown erased name; CFA identifier )
AT 46B0
( Header: flags, saved name and link )
BYTES 830000D39646
DOVAR
CELL 0000
AT 46BA

( w46C0 | NFA 46BA CFA 46C0 )
( Unknown erased name; CFA identifier )
AT 46BA
( Header: flags, saved name and link )
BYTES 830000AAB046
DOCOL
t.>R t.2DUP t.R t.ROT t.ROT w469B w437A t.R> w46B6 t.@
t.0BRANCH CELL 0008 ( -> 46E0 )
w4221
t.BRANCH CELL 0004 ( -> 46E2 )
( label 46E0 )
w423B
( label 46E2 )
w4215 t.@ w4349
t.0BRANCH CELL 000C ( -> 46F6 )
w4215 t.@ w468C t.KEY t.DROP
( label 46F6 )
t.;S
AT 46F8

( w46FE | NFA 46F8 CFA 46FE )
( Unknown erased name; CFA identifier )
AT 46F8
( Header: flags, saved name and link )
BYTES 830000BFBA46
DOCOL
( label 4700 )
w46C0 w4215 t.@ t.0=_12DE
t.0BRANCH CELL FFF6 ( -> 4700 )
t.DROP t.2DROP t.;S
AT 4712

( w4718 | NFA 4712 CFA 4718 )
( Unknown erased name; CFA identifier )
AT 4712
( Header: flags, saved name and link )
BYTES 830000BFF846
DOCOL
t.1 w46B6 t.! w46FE t.;S
AT 4724

( w472A | NFA 4724 CFA 472A )
( Unknown erased name; CFA identifier )
AT 4724
( Header: flags, saved name and link )
BYTES 830000BF1247
DOCOL
t.0 w46B6 t.! w46FE t.;S
AT 4736

( w473C | NFA 4736 CFA 473C )
( Unknown erased name; CFA identifier )
AT 4736
( Header: flags, saved name and link )
BYTES 830000AA2447
CELL 473E ( native entry point )
BYTES B1D2 ( 473E: LDA [$d2],Y )
BYTES 8D983E ( 4740: STA $3e98 )
BYTES C8 ( 4743: INY )
BYTES B1D2 ( 4744: LDA [$d2],Y )
BYTES 8D993E ( 4746: STA $3e99 )
BYTES 60 ( 4749: RTS )
AT 474A

( w4751 | NFA 474A CFA 4751 )
( Unknown erased name; CFA identifier )
AT 474A
( Header: flags, saved name and link )
BYTES 84000000C33647
CELL 4753 ( native entry point )
BYTES A900 ( 4753: LDA #$00 )
BYTES 8DA23E ( 4755: STA $3ea2 )
BYTES 20103F ( 4758: JSR $3f10 )
BYTES 20693C ( 475B: JSR $3c69 )
BYTES 20CD3E ( 475E: JSR $3ecd )
BYTES 203E47 ( 4761: JSR $473e )
BYTES EE01D3 ( 4764: INC $d301 )
BYTES 58 ( 4767: CLI )
BYTES 4C5710 ( 4768: JMP $1057 )
AT 476B

( w4771 | NFA 476B CFA 4771 )
( Unknown erased name; CFA identifier )
AT 476B
( Header: flags, saved name and link )
BYTES 830000CC4A47
DOCOL
w4751 w3EA9 t.@ t.2+ t.DUP LIT16 D7FF t.>
t.0BRANCH CELL 000C ( -> 4791 )
LIT16 D800 t.-
t.BRANCH CELL 0008 ( -> 4797 )
( label 4791 )
LIT16 9800 t.-
( label 4797 )
w3E96 t.@ t.;S
AT 479D

( w47A4 | NFA 479D CFA 47A4 )
( Unknown erased name; CFA identifier )
AT 479D
( Header: flags, saved name and link )
BYTES 84000000CC6B47
DOCOL
LIT16 D800 w4751 w3EA9 t.@ t.2+ w4771 t.;S
AT 47B6

( w47BD | NFA 47B6 CFA 47BD )
( Unknown erased name; CFA identifier )
AT 47B6
( Header: flags, saved name and link )
BYTES 84000000CC9D47
DOCOL
LIT16 D800 w4771 t.;S
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

( w47D7 | NFA 47D1 CFA 47D7 )
( Unknown erased name; CFA identifier )
AT 47D1
( Header: flags, saved name and link )
BYTES 830000C1C747
DOCOL
t.RESOURCE-BASE t.@ t.;S
AT 47DF

( w47E5 | NFA 47DF CFA 47E5 )
( Unknown erased name; CFA identifier )
AT 47DF
( Header: flags, saved name and link )
BYTES 830000DAD147
DOVAR
CELL A392
AT 47E9

( w47EF | NFA 47E9 CFA 47EF )
( Unknown erased name; CFA identifier )
AT 47E9
( Header: flags, saved name and link )
BYTES 830000DADF47
DOCOL
w47E5 t.@ t.;S
AT 47F7

( w47FE | NFA 47F7 CFA 47FE )
( Unknown erased name; CFA identifier )
AT 47F7
( Header: flags, saved name and link )
BYTES 84000000C2E947
DOCOL
w47D7 w3F6D t.;S
AT 4806

( w480C | NFA 4806 CFA 480C )
( Unknown erased name; CFA identifier )
AT 4806
( Header: flags, saved name and link )
BYTES 830000CDF747
DOCOL
t.SWAP w47BD w3D97 t.;S
AT 4816

( w481D | NFA 4816 CFA 481D )
( Unknown erased name; CFA identifier )
AT 4816
( Header: flags, saved name and link )
BYTES 84000000CD0648
DOCOL
t.ROT t.ROT w47A4 w3D97 t.;S
AT 4829

( w4830 | NFA 4829 CFA 4830 )
( Unknown erased name; CFA identifier )
AT 4829
( Header: flags, saved name and link )
BYTES 84000000CD1648
DOCOL
w47D7 w480C t.;S
AT 4838

( w483D | NFA 4838 CFA 483D )
( Unknown erased name; CFA identifier )
AT 4838
( Header: flags, saved name and link )
BYTES 8200BC2948
CELL 483F ( native entry point )
BYTES AD0BD4 ( 483F: LDA $d40b )
BYTES 30FB ( 4842: BMI $483f )
BYTES AD0BD4 ( 4844: LDA $d40b )
BYTES 10FB ( 4847: BPL $4844 )
BYTES 60 ( 4849: RTS )
AT 484A

( w484F | NFA 484A CFA 484F )
( Unknown erased name; CFA identifier )
AT 484A
( Header: flags, saved name and link )
BYTES 8200AA3848
CELL 4851 ( native entry point )
BYTES 203F48 ( 4851: JSR $483f )
BYTES 4C470F ( 4854: JMP $0f47 )
AT 4857

( w485E | NFA 4857 CFA 485E )
( Unknown erased name; CFA identifier )
AT 4857
( Header: flags, saved name and link )
BYTES 84000000D24A48
DOVAR
CELL 0000
AT 4862

( w486A | NFA 4862 CFA 486A )
( Unknown erased name; CFA identifier )
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

( w48C4 | NFA 48BE CFA 48C4 )
( Unknown erased name; CFA identifier )
AT 48BE
( Header: flags, saved name and link )
BYTES 830000CC6248
DOCOL
t.DUP t.@ LIT16 0058 t.! t.2+ t.DUP t.@ w485E t.! t.2+ t.DUP
w486A t.@ LIT16 0230 t.! t.;S
AT 48EA

( w48EF | NFA 48EA CFA 48EF )
( Unknown erased name; CFA identifier )
AT 48EA
( Header: flags, saved name and link )
BYTES 8200CFBE48
DOVAR
BYTES 00000AA45A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A
BYTES 5A5A5A5A5A5A5A5A2A90000000000EA45A5A5A5A5A5A5A5A5A5A5A5A
BYTES 5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A3A900000437C
AT 4943

( w4949 | NFA 4943 CFA 4949 )
( Unknown erased name; CFA identifier )
AT 4943
( Header: flags, saved name and link )
BYTES 830000B1EA48
DOVAR
BYTES 00000AA4050505050505050505050505050505050505050505050505
BYTES 05050505050505052A90000000000EA4050505050505050505050505
BYTES 05050505050505050505050505050505050505053A900000BA30
AT 499D

( w49A5 | NFA 499D CFA 49A5 )
( Unknown erased name; CFA identifier )
AT 499D
( Header: flags, saved name and link )
BYTES 8500000000CC4349
DOCOL
( Trailing native code/data at 49A7; retained exactly )
BYTES 48BA30A800A7090170704400A84E4B490E04374EF1480E03014420BA
BYTES 010B0403014100A700007712
AT 49CF

( w49D5 | NFA 49CF CFA 49D5 )
( Unknown erased name; CFA identifier )
AT 49CF
( Header: flags, saved name and link )
BYTES 830000CC9D49
DOCON
CELL A706
AT 49D9

( w49DF | NFA 49D9 CFA 49DF )
( Unknown erased name; CFA identifier )
AT 49D9
( Header: flags, saved name and link )
BYTES 830000CCCF49
DOCON
CELL 0038
AT 49E3

( w49E9 | NFA 49E3 CFA 49E9 )
( Unknown erased name; CFA identifier )
AT 49E3
( Header: flags, saved name and link )
BYTES 830000C4D949
DOVAR
BYTES 00000541
AT 49EF

( w49F5 | NFA 49EF CFA 49F5 )
( Unknown erased name; CFA identifier )
AT 49EF
( Header: flags, saved name and link )
BYTES 830000C4E349
DOVAR
BYTES 00000541
AT 49FB

( w4A01 | NFA 49FB CFA 4A01 )
( Unknown erased name; CFA identifier )
AT 49FB
( Header: flags, saved name and link )
BYTES 830000D5EF49
DOVAR
CELL 0008
AT 4A05

( w4A0B | NFA 4A05 CFA 4A0B )
( Unknown erased name; CFA identifier )
AT 4A05
( Header: flags, saved name and link )
BYTES 830000A1FB49
CELL 4A0D ( native entry point )
BYTES 18 ( 4A0D: CLC )
BYTES 46F3 ( 4A0E: LSR $f3 )
BYTES 66F2 ( 4A10: ROR $f2 )
BYTES 18 ( 4A12: CLC )
BYTES 46F3 ( 4A13: LSR $f3 )
BYTES 66F2 ( 4A15: ROR $f2 )
BYTES A5F2 ( 4A17: LDA $f2 )
BYTES 18 ( 4A19: CLC )
BYTES 6D034A ( 4A1A: ADC $4a03 )
BYTES CD0BD4 ( 4A1D: CMP $d40b )
BYTES B008 ( 4A20: BCS $4a2a )
BYTES 18 ( 4A22: CLC )
BYTES 6904 ( 4A23: ADC #$04 )
BYTES CD0BD4 ( 4A25: CMP $d40b )
BYTES B0FB ( 4A28: BCS $4a25 )
BYTES A000 ( 4A2A: LDY #$00 )
BYTES ADEB49 ( 4A2C: LDA $49eb )
BYTES 91F0 ( 4A2F: STA [$f0],Y )
BYTES C8 ( 4A31: INY )
BYTES ADEC49 ( 4A32: LDA $49ec )
BYTES 91F0 ( 4A35: STA [$f0],Y )
BYTES 4C470F ( 4A37: JMP $0f47 )
AT 4A3A

( w4A40 | NFA 4A3A CFA 4A40 )
( Unknown erased name; CFA identifier )
AT 4A3A
( Header: flags, saved name and link )
BYTES 830000CC054A
DOCOL
t.0 w484F t.(DO)
( label 4A48 )
w49E9 t.2+ t.@ t.DUP w3AC3 t.! w49D5 t.- w3ACC t.! w4A0B w49F5
t.@ t.OVER t.+- w49E9 t.+! w49F5 t.2+ t.@ t.OVER t.+- w49E9
t.2+ t.+! t.>R t.OVER t.R> t.SWAP w49F5 t.+! t.OVER w49F5 t.2+
t.+! t.MINUS
t.(LOOP) CELL FFB6 ( -> 4A48 )
t.2DROP t.DROP t.;S
AT 4A9A

( w4AA0 | NFA 4A9A CFA 4AA0 )
( Unknown erased name; CFA identifier )
AT 4A9A
( Header: flags, saved name and link )
BYTES 830000A13A4A
DOCOL
w49E9 t.! w49E9 t.2+ t.! w49F5 t.! w49F5 t.2+ t.! t.;S
AT 4AB8

( w4ABE | NFA 4AB8 CFA 4ABE )
( Unknown erased name; CFA identifier )
AT 4AB8
( Header: flags, saved name and link )
BYTES 830000CC9A4A
DOCOL
LIT16 00DC t.0 w49D5 w4949 w4AA0 t.0 LIT16 FFFC t.1 t.1 w4A40
w48EF w49E9 t.! t.0 LIT16 FFFC LIT16 FFFF w49DF t.1 t.- w4A40
t.;S
AT 4AF2

( w4AF8 | NFA 4AF2 CFA 4AF8 )
( Unknown erased name; CFA identifier )
AT 4AF2
( Header: flags, saved name and link )
BYTES 830000CCB84A
DOCOL
LIT8 04 LIT8 50 LIT16 A772 w485E t.@ LIT16 0870 t.+ w4AA0
LIT8 50 LIT16 0004 t.1 w49DF w4A40 t.;S
AT 4B1F

( w4B25 | NFA 4B1F CFA 4B25 )
( Unknown erased name; CFA identifier )
AT 4B1F
( Header: flags, saved name and link )
BYTES 830000CCF24A
DOCOL
w49E9 t.@ t.OVER LIT8 04 t.CMOVE LIT8 04 t.+ t.DUP LIT8 20
t.ERASE LIT8 20 t.+ w49E9 t.@ LIT8 24 t.+ t.SWAP LIT8 04
t.CMOVE t.;S
AT 4B55

( w4B5B | NFA 4B55 CFA 4B5B )
( Unknown erased name; CFA identifier )
AT 4B55
( Header: flags, saved name and link )
BYTES 830000C71F4B
DOCOL
w485E t.@ t.DUP LIT16 1180 t.+ t.SWAP t.(DO)
( label 4B6D )
w48EF w49E9 t.! t.I w4B25 LIT16 4919 w49E9 t.! t.I LIT8 28 t.+
w4B25 LIT8 50
t.(+LOOP) CELL FFE0 ( -> 4B6D )
t.;S
AT 4B91

( w4B97 | NFA 4B91 CFA 4B97 )
( Unknown erased name; CFA identifier )
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

( w4C29 | NFA 4C23 CFA 4C29 )
( Unknown erased name; CFA identifier )
AT 4C23
( Header: flags, saved name and link )
BYTES 830000D4914B
DOCOL
LIT16 49A7 w48C4 w4AF8 w469B t.;S
AT 4C37

( w4C3E | NFA 4C37 CFA 4C3E )
( Unknown erased name; CFA identifier )
AT 4C37
( Header: flags, saved name and link )
BYTES 84000000B5234C
DOCOL
LIT16 49A7 w48C4 w4B97 w4B5B w469B t.;S
AT 4C4E

( w4C54 | NFA 4C4E CFA 4C54 )
( Unknown erased name; CFA identifier )
AT 4C4E
( Header: flags, saved name and link )
BYTES 830000D9374C
DOCOL
t.DUP t.>R t.C@ t.R> t.1+ t.C@ t.;S
AT 4C64

( w4C6A | NFA 4C64 CFA 4C6A )
( Unknown erased name; CFA identifier )
AT 4C64
( Header: flags, saved name and link )
BYTES 830000A14E4C
DOCOL
t.>R t.R t.C@ t.+ t.R> t.C! t.;S
AT 4C7A

( w4C81 | NFA 4C7A CFA 4C81 )
( Unknown erased name; CFA identifier )
AT 4C7A
( Header: flags, saved name and link )
BYTES 84000000C2644C
DOCON
CELL 0600
AT 4C85

( w4C8A | NFA 4C85 CFA 4C8A )
( Unknown erased name; CFA identifier )
AT 4C85
( Header: flags, saved name and link )
BYTES 8200D87A4C
DOVAR
CELL 0000
AT 4C8E

( w4C93 | NFA 4C8E CFA 4C93 )
( Unknown erased name; CFA identifier )
AT 4C8E
( Header: flags, saved name and link )
BYTES 8200D9854C
DOVAR
CELL 0000
AT 4C97

( w4C9C | NFA 4C97 CFA 4C9C )
( Unknown erased name; CFA identifier )
AT 4C97
( Header: flags, saved name and link )
BYTES 8200CF8E4C
DOCOL
t.OVER w4C54 w3C17 t.SWAP t.2+ t.SWAP w3C2A w3C3D w3C04 t.;S
AT 4CB2

( w4CB9 | NFA 4CB2 CFA 4CB9 )
( Unknown erased name; CFA identifier )
AT 4CB2
( Header: flags, saved name and link )
BYTES 84000000D9974C
DOCOL
w4C93 t.@ t.* t.+ w4C8A t.@ t.+ t.;S
AT 4CCB

( w4CD2 | NFA 4CCB CFA 4CD2 )
( Unknown erased name; CFA identifier )
AT 4CCB
( Header: flags, saved name and link )
BYTES 84000000BEB24C
DOCOL
t.SWAP t.>R t.>R t.DUP w4C54 t.R> t.- w4C93 t.! t.R> t.- w4C8A
t.! t.;S
AT 4CF0

( w4CF6 | NFA 4CF0 CFA 4CF6 )
( Unknown erased name; CFA identifier )
AT 4CF0
( Header: flags, saved name and link )
BYTES 830000C2CB4C
DOCOL
t.>R t.R w4C54 w4CD2 t.R t.2+ t.C@ t.SWAP t.2+ t.OVER t.R>
LIT16 0004 t.+ t.SWAP w4CB9 w4C9C t.;S
AT 4D1C

( w4D22 | NFA 4D1C CFA 4D22 )
( Unknown erased name; CFA identifier )
AT 4D1C
( Header: flags, saved name and link )
BYTES 830000C2F04C
DOCOL
w47FE t.2+ LIT16 0004 t.0 w4CD2 t.>R LIT8 28 t.R t.2+ w485E
t.@ t.R> w4C54 LIT8 28 t.* t.+ t.+ w4C9C t.;S
AT 4D4E

( w4D53 | NFA 4D4E CFA 4D53 )
( Unknown erased name; CFA identifier )
AT 4D4E
( Header: flags, saved name and link )
BYTES 8200CF1C4D
DOCOL
t.>R t.DUP t.R LIT16 0004 t.CMOVE t.R> w4CF6 t.;S
AT 4D67

( w4D6D | NFA 4D67 CFA 4D6D )
( Unknown erased name; CFA identifier )
AT 4D67
( Header: flags, saved name and link )
BYTES 830000C24E4D
DOCOL
w47FE t.2+ w4C81 w4D53 t.;S
AT 4D79

( w4D7F | NFA 4D79 CFA 4D7F )
( Unknown erased name; CFA identifier )
AT 4D79
( Header: flags, saved name and link )
BYTES 830000C2674D
DOCOL
w47FE t.2+ w4C81 w4CF6 t.;S
AT 4D8B

( w4D90 | NFA 4D8B CFA 4D90 )
( Unknown erased name; CFA identifier )
AT 4D8B
( Header: flags, saved name and link )
BYTES 8200D4794D
DOVAR
CELL 0000
AT 4D94

( w4D99 | NFA 4D94 CFA 4D99 )
( Unknown erased name; CFA identifier )
AT 4D94
( Header: flags, saved name and link )
BYTES 8200C18B4D
DOCON
CELL A058
AT 4D9D

( w4DA3 | NFA 4D9D CFA 4DA3 )
( Unknown erased name; CFA identifier )
AT 4D9D
( Header: flags, saved name and link )
BYTES 830000C2944D
DOCOL
w4D99 w4D90 t.@
t.0BRANCH CELL 0008 ( -> 4DB5 )
LIT16 0284 t.+
( label 4DB5 )
t.;S
AT 4DB7

( w4DBD | NFA 4DB7 CFA 4DBD )
( Unknown erased name; CFA identifier )
AT 4DB7
( Header: flags, saved name and link )
BYTES 830000CD9D4D
DOVAR
BYTES AEAAA0414C4C
AT 4DC5

( w4DCC | NFA 4DC5 CFA 4DCC )
( Unknown erased name; CFA identifier )
AT 4DC5
( Header: flags, saved name and link )
BYTES 84000000CDB74D
DOCOL
w4DBD LIT16 02C0 LIT16 0004 t.CMOVE t.;S
AT 4DDC

( w4DE2 | NFA 4DDC CFA 4DE2 )
( Unknown erased name; CFA identifier )
AT 4DDC
( Header: flags, saved name and link )
BYTES 830000A3C54D
DOVAR
CELL 0000
AT 4DE6

( w4DED | NFA 4DE6 CFA 4DED )
( Unknown erased name; CFA identifier )
AT 4DE6
( Header: flags, saved name and link )
BYTES 84000000C0DC4D
DOCOL
w4DE2 t.@ LIT16 0400 t.+ t.;S
AT 4DFB

( w4E02 | NFA 4DFB CFA 4E02 )
( Unknown erased name; CFA identifier )
AT 4DFB
( Header: flags, saved name and link )
BYTES 84000000A1E64D
DOCOL
t.DUP LIT16 D407 t.C! LIT16 0100 t.* w4DE2 t.! t.;S
AT 4E18

( w4E1F | NFA 4E18 CFA 4E1F )
( Unknown erased name; CFA identifier )
AT 4E18
( Header: flags, saved name and link )
BYTES 84000000CDFB4D
DOCOL
w4DED LIT16 02FF t.ERASE t.;S
AT 4E2B

( w4E33 | NFA 4E2B CFA 4E33 )
( Unknown erased name; CFA identifier )
AT 4E2B
( Header: flags, saved name and link )
BYTES 8500000000CD184E
DOCOL
t.3 LIT16 D01D t.C! t.;S
AT 4E3F

( w4E48 | NFA 4E3F CFA 4E48 )
( Unknown erased name; CFA identifier )
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

( w4E72 | NFA 4E6B CFA 4E72 )
( Unknown erased name; CFA identifier )
AT 4E6B
( Header: flags, saved name and link )
BYTES 84000000A15E4E
CELL 4E74 ( native entry point )
BYTES 203F48 ( 4E74: JSR $483f )
BYTES B500 ( 4E77: LDA $00,X )
BYTES 8D00D0 ( 4E79: STA $d000 )
BYTES 8D01D0 ( 4E7C: STA $d001 )
BYTES 8D02D0 ( 4E7F: STA $d002 )
BYTES 4C5910 ( 4E82: JMP $1059 )
AT 4E85

( w4E8B | NFA 4E85 CFA 4E8B )
( Unknown erased name; CFA identifier )
AT 4E85
( Header: flags, saved name and link )
BYTES 830000B06B4E
DOCOL
( Trailing native code/data at 4E8D; retained exactly )
BYTES 00F000001008040200000000000000F0E0E0F0B89C0E040000000000
BYTES 001000004060B09A0E04007712
AT 4EB6

( w4EBB | NFA 4EB6 CFA 4EBB )
( Unknown erased name; CFA identifier )
AT 4EB6
( Header: flags, saved name and link )
BYTES 8200CB854E
DOCON
CELL 00D4
AT 4EBF

( w4EC6 | NFA 4EBF CFA 4EC6 )
( Unknown erased name; CFA identifier )
AT 4EBF
( Header: flags, saved name and link )
BYTES 84000000CDB64E
DOVAR
CELL 0000
AT 4ECA

( w4ED3 | NFA 4ECA CFA 4ED3 )
( Unknown erased name; CFA identifier )
AT 4ECA
( Header: flags, saved name and link )
BYTES 860000000000A1BF4E
DOCOL
w4EC6 t.! w3E96 t.! t.;S
AT 4EDF

( w4EE5 | NFA 4EDF CFA 4EE5 )
( Unknown erased name; CFA identifier )
AT 4EDF
( Header: flags, saved name and link )
BYTES 830000A6CA4E
CELL 4EE7 ( native entry point )
BYTES 86D1 ( 4EE7: STX $d1 )
BYTES 203F48 ( 4EE9: JSR $483f )
BYTES AEC84E ( 4EEC: LDX $4ec8 )
BYTES A000 ( 4EEF: LDY #$00 )
BYTES B1D2 ( 4EF1: LDA [$d2],Y )
BYTES 91D4 ( 4EF3: STA [$d4],Y )
BYTES C8 ( 4EF5: INY )
BYTES CC983E ( 4EF6: CPY $3e98 )
BYTES D0F6 ( 4EF9: BNE $4ef1 )
BYTES E6D5 ( 4EFB: INC $d5 )
BYTES 20B53E ( 4EFD: JSR $3eb5 )
BYTES CA ( 4F00: DEX )
BYTES D0EC ( 4F01: BNE $4eef )
BYTES A6D1 ( 4F03: LDX $d1 )
BYTES 4C470F ( 4F05: JMP $0f47 )
AT 4F08

( w4F0F | NFA 4F08 CFA 4F0F )
( Unknown erased name; CFA identifier )
AT 4F08
( Header: flags, saved name and link )
BYTES 84000000A1DF4E
DOCOL
LIT16 4E8D t.SWAP w4DED t.+ w4EBB t.! w3EA9 t.! t.3 w4EC6 t.!
LIT8 0D w3E96 t.! w4EE5 t.;S
AT 4F34

( w4F3D | NFA 4F34 CFA 4F3D )
( Unknown erased name; CFA identifier )
AT 4F34
( Header: flags, saved name and link )
BYTES 860000000000D9084F
DOCOL
t.<BUILDS t., t.ALLOT t.DOES>
( Trailing native code/data at 4F47; retained exactly )
BYTES A513E413E413041316167712
AT 4F53

( w4F59 | NFA 4F53 CFA 4F59 )
( Unknown erased name; CFA identifier )
AT 4F53
( Header: flags, saved name and link )
BYTES 830000D9344F
DOVAR
CELL 0000
AT 4F5D

( w4F64 | NFA 4F5D CFA 4F64 )
( Unknown erased name; CFA identifier )
AT 4F5D
( Header: flags, saved name and link )
BYTES 84000000B0534F
DODOES
( DOES> thread at 4F47 )
BYTES 474F5B4F422120
AT 4F6D

( w4F73 | NFA 4F6D CFA 4F73 )
( Unknown erased name; CFA identifier )
AT 4F6D
( Header: flags, saved name and link )
BYTES 830000D05D4F
DODOES
( DOES> thread at 4F47 )
BYTES 474F5B4F000020
AT 4F7C

( w4F82 | NFA 4F7C CFA 4F82 )
( Unknown erased name; CFA identifier )
AT 4F7C
( Header: flags, saved name and link )
BYTES 830000D36D4F
DODOES
( DOES> thread at 4F47 )
BYTES 474F5B4F040620
AT 4F8B

( w4F91 | NFA 4F8B CFA 4F91 )
( Unknown erased name; CFA identifier )
AT 4F8B
( Header: flags, saved name and link )
BYTES 830000CD7C4F
DODOES
( DOES> thread at 4F47 )
BYTES 474F5B4F1F1220
AT 4F9A

( w4F9F | NFA 4F9A CFA 4F9F )
( Unknown erased name; CFA identifier )
AT 4F9A
( Header: flags, saved name and link )
BYTES 8200CC8B4F
DOVAR
CELL 0000
AT 4FA3

( w4FAA | NFA 4FA3 CFA 4FAA )
( Unknown erased name; CFA identifier )
AT 4FA3
( Header: flags, saved name and link )
BYTES 84000000D99A4F
DOCOL
w4F64 t.C@ w4F73 t.C@ w4F82 t.C@ t.* t.+ t.;S
AT 4FBE

( w4FC5 | NFA 4FBE CFA 4FC5 )
( Unknown erased name; CFA identifier )
AT 4FBE
( Header: flags, saved name and link )
BYTES 84000000A1A34F
DOCOL
t.-DUP
t.0BRANCH CELL 0068 ( -> 5033 )
t.DUP w4F9F t.! t.0 t.<
t.0BRANCH CELL 000C ( -> 4FE5 )
w4F73 t.C@ t.0=_12DE
t.BRANCH CELL 000C ( -> 4FEF )
( label 4FE5 )
w4F73 t.C@ w4F91 t.C@ t.=
( label 4FEF )
t.0=_12DE
t.0BRANCH CELL 0040 ( -> 5033 )
w4FAA w4F82 t.C@ t.1+ w4F9F t.@ t.* w4F9F t.@ t.(DO)
( label 5009 )
t.DUP t.I t.+ w4F59 t.@ t.0=_12DE
t.0BRANCH CELL 0008 ( -> 501F )
w4E72
t.BRANCH CELL 0004 ( -> 5021 )
( label 501F )
w4F0F
( label 5021 )
w4F9F t.@
t.(+LOOP) CELL FFE2 ( -> 5009 )
t.DROP w4F9F t.@ w4F73 w4C6A
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

( w505C | NFA 5056 CFA 505C )
( Unknown erased name; CFA identifier )
AT 5056
( Header: flags, saved name and link )
BYTES 830000D44D50
DODOES
( DOES> thread at 383C )
BYTES 3C38CD14CD14CD14C514525052505250C514C514C514C5147712
AT 5078

( w507E | NFA 5078 CFA 507E )
( Unknown erased name; CFA identifier )
AT 5078
( Header: flags, saved name and link )
BYTES 830000D45650
DODOES
( DOES> thread at 383C )
BYTES 3C38CD145250C514C514CD145250C514C514CD145250C5147712
AT 509A

( w50A3 | NFA 509A CFA 50A3 )
( Unknown erased name; CFA identifier )
AT 509A
( Header: flags, saved name and link )
BYTES 860000000000D97850
DOCOL
LIT16 0278 t.+ t.C@ LIT16 0005 t.- t.DUP w505C t.SWAP w507E
t.;S
AT 50BD

( w50C3 | NFA 50BD CFA 50C3 )
( Unknown erased name; CFA identifier )
AT 50BD
( Header: flags, saved name and link )
BYTES 830000CD9A50
DOCOL
LIT16 003E LIT16 022F t.C! t.1 LIT16 026F t.C! LIT16 00A0
w4E02 w4E1F w4DCC w4E33 t.;S
AT 50E5

( w50ED | NFA 50E5 CFA 50ED )
( Unknown erased name; CFA identifier )
AT 50E5
( Header: flags, saved name and link )
BYTES 8500000000A1BD50
DOCOL
t.1 w4F59 t.! LIT8 21 t.+ w4F64 t.C! t.0 w4F59 t.! LIT8 04 t.*
LIT8 32 t.+ w4F64 t.C! t.;S
AT 5114

( w511B | NFA 5114 CFA 511B )
( Unknown erased name; CFA identifier )
AT 5114
( Header: flags, saved name and link )
BYTES 84000000A1E550
DOCOL
t.0 w4F59 t.! t.1 t.- w4F91 t.1+ t.C! t.1 t.- w4F91 t.C! t.;S
AT 5137

( w513E | NFA 5137 CFA 513E )
( Unknown erased name; CFA identifier )
AT 5137
( Header: flags, saved name and link )
BYTES 84000000A11451
DOCOL
t.0 w4F59 t.! w4F82 t.1+ t.C! w4F82 t.C! t.;S
AT 5152

( w5157 | NFA 5152 CFA 5157 )
( Unknown erased name; CFA identifier )
AT 5152
( Header: flags, saved name and link )
BYTES 8200D03751
DOVAR
BYTES 000005414C4C4F542020202020202020
AT 5169

( w516E | NFA 5169 CFA 516E )
( Unknown erased name; CFA identifier )
AT 5169
( Header: flags, saved name and link )
BYTES 8200D05251
DOCOL
w5157 t.C@ t.2+ w5157 t.+ t.! t.2 w5157 w4C6A t.;S
AT 5184

( P | NFA 5184 CFA 5188 )
( Intact dictionary name in supplied Klatwa v1 image. )
AT 5184
( Header: flags, saved name and link )
BYTES 81D06951
DOCOL
w5157 t.DUP t.C@ t.+ t.@ t.;S
AT 5196

( w519B | NFA 5196 CFA 519B )
( Unknown erased name; CFA identifier )
AT 5196
( Header: flags, saved name and link )
BYTES 8200BE8451
DOCOL
w5157 t.C@ w5157 t.+ t.@ w5157 t.C@
t.0BRANCH CELL 000A ( -> 51B7 )
LIT16 FFFE w5157 w4C6A
( label 51B7 )
t.;S
AT 51B9

( w51C1 | NFA 51B9 CFA 51C1 )
( Unknown erased name; CFA identifier )
AT 51B9
( Header: flags, saved name and link )
BYTES 8500000000D99651
DOCOL
t.<BUILDS t.2 t.* t.ALLOT t.DOES>
( Trailing native code/data at 51CD; retained exactly )
BYTES 8D13D5140F2004137712
AT 51D7

( w51DD | NFA 51D7 CFA 51DD )
( Unknown erased name; CFA identifier )
AT 51D7
( Header: flags, saved name and link )
BYTES 830000D9B951
DODOES
( DOES> thread at 51CD )
BYTES CD512020202020202020202020202020
AT 51EF

( w51F5 | NFA 51EF CFA 51F5 )
( Unknown erased name; CFA identifier )
AT 51EF
( Header: flags, saved name and link )
BYTES 830000D9D751
DOCOL
w5157 t.C@ w51DD t.@ t.0 w4F59 t.! w4F73 t.! t.;S
AT 520B

( w5211 | NFA 520B CFA 5211 )
( Unknown erased name; CFA identifier )
AT 520B
( Header: flags, saved name and link )
BYTES 830000D9EF51
DOCOL
t.0 w4F59 t.! w4F73 t.@ w5157 t.C@ w51DD t.! t.;S
AT 5227

( w522D | NFA 5227 CFA 522D )
( Unknown erased name; CFA identifier )
AT 5227
( Header: flags, saved name and link )
BYTES 830000D90B52
DOCOL
t.0 w4F59 t.! w4DA3 w4C54 t.2 t./ w4F73 t.1+ t.C! t.2 t./ t.1
t.- w4F73 t.C! t.;S
AT 5251

( w5257 | NFA 5251 CFA 5257 )
( Unknown erased name; CFA identifier )
AT 5251
( Header: flags, saved name and link )
BYTES 830000CD2752
DOCOL
w5157 t.C@
t.0BRANCH CELL 000A ( -> 5269 )
w4C81 w4C54
t.BRANCH CELL 0008 ( -> 526F )
( label 5269 )
LIT16 0004 t.0
( label 526F )
w50ED w4DA3 w4C54 w511B LIT16 0004 LIT8 06 w513E t.;S
AT 5282

( w5289 | NFA 5282 CFA 5289 )
( Unknown erased name; CFA identifier )
AT 5282
( Header: flags, saved name and link )
BYTES 84000000C05152
DOCOL
w4DA3 t.C@ t.* t.+ w4DA3 t.+ t.2+ t.C@ t.;S
AT 529D

( w52A4 | NFA 529D CFA 52A4 )
( Unknown erased name; CFA identifier )
AT 529D
( Header: flags, saved name and link )
BYTES 84000000D98252
DOCOL
w4C93 t.@ LIT16 0006 t./ t.* t.+ w4C8A t.@ t.+ t.;S
AT 52BC

( w52C2 | NFA 52BC CFA 52C2 )
( Unknown erased name; CFA identifier )
AT 52BC
( Header: flags, saved name and link )
BYTES 830000C29D52
DOCOL
w4DA3 t.C@ t.SWAP t.OVER w4DA3 t.2+ t.SWAP w52A4 w4C9C t.;S
AT 52D8

( w52DE | NFA 52D8 CFA 52DE )
( Unknown erased name; CFA identifier )
AT 52D8
( Header: flags, saved name and link )
BYTES 830000C1BC52
DOCOL
t.0 w4D90 t.! w47FE t.2+ t.DUP w4C54 w4DA3 t.1+ t.C! t.2 t.*
w4DA3 t.C! w5257 w522D w52C2 t.;S
AT 5304

( w530A | NFA 5304 CFA 530A )
( Unknown erased name; CFA identifier )
AT 5304
( Header: flags, saved name and link )
BYTES 830000C1D852
DOCOL
t.1 w4D90 t.! w47FE t.2+ t.DUP w4DA3 t.2 t.CMOVE w52C2 t.;S
AT 5322

( w5328 | NFA 5322 CFA 5328 )
( Unknown erased name; CFA identifier )
AT 5322
( Header: flags, saved name and link )
BYTES 830000C10453
DOCOL
w47FE t.2+ w52C2 t.;S
AT 5332

( w5338 | NFA 5332 CFA 5338 )
( Unknown erased name; CFA identifier )
AT 5332
( Header: flags, saved name and link )
BYTES 830000CC2253
DOVAR
CELL 0000
AT 533C

( w5343 | NFA 533C CFA 5343 )
( Unknown erased name; CFA identifier )
AT 533C
( Header: flags, saved name and link )
BYTES 84000000D93253
DOVAR
CELL 0001
AT 5347

( w534C | NFA 5347 CFA 534C )
( Unknown erased name; CFA identifier )
AT 5347
( Header: flags, saved name and link )
BYTES 8200B03C53
CELL 534E ( native entry point )
BYTES A9C0 ( 534E: LDA #$c0 )
BYTES 85F4 ( 5350: STA $f4 )
BYTES A204 ( 5352: LDX #$04 )
BYTES B1F0 ( 5354: LDA [$f0],Y )
BYTES 85FA ( 5356: STA $fa )
BYTES A5F4 ( 5358: LDA $f4 )
BYTES 31F2 ( 535A: AND [$f2],Y )
BYTES F00D ( 535C: BEQ $536b )
BYTES A5F4 ( 535E: LDA $f4 )
BYTES 49FF ( 5360: EOR #$ff )
BYTES 25FA ( 5362: AND $fa )
BYTES 85FA ( 5364: STA $fa )
BYTES E6FC ( 5366: INC $fc )
BYTES 4C7D53 ( 5368: JMP $537d )
BYTES A5FC ( 536B: LDA $fc )
BYTES C902 ( 536D: CMP #$02 )
BYTES 9008 ( 536F: BCC $5379 )
BYTES A5F4 ( 5371: LDA $f4 )
BYTES 49FF ( 5373: EOR #$ff )
BYTES 25FA ( 5375: AND $fa )
BYTES 85FA ( 5377: STA $fa )
BYTES A900 ( 5379: LDA #$00 )
BYTES 85FC ( 537B: STA $fc )
BYTES 46F4 ( 537D: LSR $f4 )
BYTES 46F4 ( 537F: LSR $f4 )
BYTES CA ( 5381: DEX )
BYTES D0D4 ( 5382: BNE $5358 )
BYTES 60 ( 5384: RTS )
AT 5385

( w538A | NFA 5385 CFA 538A )
( Unknown erased name; CFA identifier )
AT 5385
( Header: flags, saved name and link )
BYTES 8200CD4753
DOVAR
CELL 0000
AT 538E

( w5393 | NFA 538E CFA 5393 )
( Unknown erased name; CFA identifier )
AT 538E
( Header: flags, saved name and link )
BYTES 8200AA8553
CELL 5395 ( native entry point )
BYTES AD8C53 ( 5395: LDA $538c )
BYTES D007 ( 5398: BNE $53a1 )
BYTES B1F2 ( 539A: LDA [$f2],Y )
BYTES 91F0 ( 539C: STA [$f0],Y )
BYTES 4CB753 ( 539E: JMP $53b7 )
BYTES 204E53 ( 53A1: JSR $534e )
BYTES 38 ( 53A4: SEC )
BYTES AD4553 ( 53A5: LDA $5345 )
BYTES D005 ( 53A8: BNE $53af )
BYTES AD3A53 ( 53AA: LDA $533a )
BYTES D1D2 ( 53AD: CMP [$d2],Y )
BYTES 9006 ( 53AF: BCC $53b7 )
BYTES B1F2 ( 53B1: LDA [$f2],Y )
BYTES 05FA ( 53B3: ORA $fa )
BYTES 91F0 ( 53B5: STA [$f0],Y )
BYTES 60 ( 53B7: RTS )
AT 53B8

( w53BE | NFA 53B8 CFA 53BE )
( Unknown erased name; CFA identifier )
AT 53B8
( Header: flags, saved name and link )
BYTES 830000C98E53
CELL 53C0 ( native entry point )
BYTES A000 ( 53C0: LDY #$00 )
BYTES 209553 ( 53C2: JSR $5395 )
BYTES C8 ( 53C5: INY )
BYTES C4F7 ( 53C6: CPY $f7 )
BYTES D0F8 ( 53C8: BNE $53c2 )
BYTES 60 ( 53CA: RTS )
AT 53CB

( w53D1 | NFA 53CB CFA 53D1 )
( Unknown erased name; CFA identifier )
AT 53CB
( Header: flags, saved name and link )
BYTES 830000CDB853
DOVAR
CELL 0000
AT 53D5

( w53DA | NFA 53D5 CFA 53DA )
( Unknown erased name; CFA identifier )
AT 53D5
( Header: flags, saved name and link )
BYTES 8200DACB53
DOVAR
CELL 0001
AT 53DE

( w53E4 | NFA 53DE CFA 53E4 )
( Unknown erased name; CFA identifier )
AT 53DE
( Header: flags, saved name and link )
BYTES 830000CFD553
CELL 53E6 ( native entry point )
BYTES A900 ( 53E6: LDA #$00 )
BYTES 85FC ( 53E8: STA $fc )
BYTES 20C053 ( 53EA: JSR $53c0 )
BYTES A5F6 ( 53ED: LDA $f6 )
BYTES 18 ( 53EF: CLC )
BYTES 65F2 ( 53F0: ADC $f2 )
BYTES 85F2 ( 53F2: STA $f2 )
BYTES 9002 ( 53F4: BCC $53f8 )
BYTES E6F3 ( 53F6: INC $f3 )
BYTES A5F9 ( 53F8: LDA $f9 )
BYTES 18 ( 53FA: CLC )
BYTES 65F0 ( 53FB: ADC $f0 )
BYTES 85F0 ( 53FD: STA $f0 )
BYTES 9002 ( 53FF: BCC $5403 )
BYTES E6F1 ( 5401: INC $f1 )
BYTES AD4553 ( 5403: LDA $5345 )
BYTES D013 ( 5406: BNE $541b )
BYTES C6FB ( 5408: DEC $fb )
BYTES D00F ( 540A: BNE $541b )
BYTES A5D2 ( 540C: LDA $d2 )
BYTES 18 ( 540E: CLC )
BYTES 6920 ( 540F: ADC #$20 )
BYTES 85D2 ( 5411: STA $d2 )
BYTES 9002 ( 5413: BCC $5417 )
BYTES E6D3 ( 5415: INC $d3 )
BYTES A906 ( 5417: LDA #$06 )
BYTES 85FB ( 5419: STA $fb )
BYTES ADDC53 ( 541B: LDA $53dc )
BYTES D00E ( 541E: BNE $542e )
BYTES EED353 ( 5420: INC $53d3 )
BYTES A971 ( 5423: LDA #$71 )
BYTES CDD353 ( 5425: CMP $53d3 )
BYTES B004 ( 5428: BCS $542e )
BYTES A901 ( 542A: LDA #$01 )
BYTES 85F8 ( 542C: STA $f8 )
BYTES C6F8 ( 542E: DEC $f8 )
BYTES D0B8 ( 5430: BNE $53ea )
BYTES 60 ( 5432: RTS )
AT 5433

( w543B | NFA 5433 CFA 543B )
( Unknown erased name; CFA identifier )
AT 5433
( Header: flags, saved name and link )
BYTES 8500000000C5DE53
CELL 543D ( native entry point )
BYTES 86D1 ( 543D: STX $d1 )
BYTES 20E653 ( 543F: JSR $53e6 )
BYTES A6D1 ( 5442: LDX $d1 )
BYTES 4C470F ( 5444: JMP $0f47 )
AT 5447

( w544C | NFA 5447 CFA 544C )
( Unknown erased name; CFA identifier )
AT 5447
( Header: flags, saved name and link )
BYTES 8200D33354
DOCOL
w485E t.@ t.SWAP w4C54 LIT8 28 t.* t.+ t.+ t.;S
AT 5461

( w5468 | NFA 5461 CFA 5468 )
( Unknown erased name; CFA identifier )
AT 5461
( Header: flags, saved name and link )
BYTES 84000000AA4754
DOCOL
w3B05 t.C! t.2+ w3ACC t.! w4C54 w3AFC t.C! t.DUP w3AE8 t.C!
w3AF2 t.C! w543B t.;S
AT 5488

( w548F | NFA 5488 CFA 548F )
( Unknown erased name; CFA identifier )
AT 5488
( Header: flags, saved name and link )
BYTES 84000000C26154
DOCOL
t.DUP w544C w3AC3 t.! t.2+ t.DUP LIT8 28 w5468 t.;S
AT 54A4

( w54AB | NFA 54A4 CFA 54AB )
( Unknown erased name; CFA identifier )
AT 54A4
( Header: flags, saved name and link )
BYTES 84000000C68854
DOCOL
w47EF w4C81 w4C54 w4CD2 w4C81 LIT16 0004 t.+ w4C81 t.2+ t.C@
w4CB9 w3AC3 t.! t.2+ t.DUP w4C81 t.2+ t.C@ w5468 t.;S
AT 54D7

( w54DD | NFA 54D7 CFA 54DD )
( Unknown erased name; CFA identifier )
AT 54D7
( Header: flags, saved name and link )
BYTES 830000C3A454
DOCON
CELL 0A00
AT 54E1

( w54E6 | NFA 54E1 CFA 54E6 )
( Unknown erased name; CFA identifier )
AT 54E1
( Header: flags, saved name and link )
BYTES 8200D4D754
DOCON
CELL 0B90
AT 54EA

( w54F1 | NFA 54EA CFA 54F1 )
( Unknown erased name; CFA identifier )
AT 54EA
( Header: flags, saved name and link )
BYTES 84000000BEE154
DOCOL
t.1 w5343 t.! w54E6 LIT16 36EA LIT16 0112 w3D74 w4C81 w54DD
LIT16 0004 t.CMOVE LIT8 28 w3AE8 t.C! w54DD w544C w3ACC t.!
w54DD LIT16 0004 t.+ w3AC3 t.! w54DD t.2+ w4C54 w3AFC t.C!
t.DUP w3B05 t.C! w3AF2 t.C! w543B t.;S
AT 5542

( w5548 | NFA 5542 CFA 5548 )
( Unknown erased name; CFA identifier )
AT 5542
( Header: flags, saved name and link )
BYTES 830000B0EA54
DOCON
CELL 9932
AT 554C

( w5552 | NFA 554C CFA 5552 )
( Unknown erased name; CFA identifier )
AT 554C
( Header: flags, saved name and link )
BYTES 830000C54255
DOCOL
w5548 w3F6D t.;S
AT 555A

( w5560 | NFA 555A CFA 5560 )
( Unknown erased name; CFA identifier )
AT 555A
( Header: flags, saved name and link )
BYTES 830000C24C55
DOVAR
BYTES 02000A00
AT 5566

( w556D | NFA 5566 CFA 556D )
( Unknown erased name; CFA identifier )
AT 5566
( Header: flags, saved name and link )
BYTES 84000000CD5A55
DOVAR
CELL 0000
AT 5571

( w5577 | NFA 5571 CFA 5577 )
( Unknown erased name; CFA identifier )
( Decoded text: Inventory display slots )
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

( w5638 | NFA 5631 CFA 5638 )
( Unknown erased name; CFA identifier )
AT 5631
( Header: flags, saved name and link )
BYTES 84000000D97155
DODOES
( DOES> thread at 51CD )
BYTES CD511648073C1A360D421F3C093C16482020073C1B3C073C16481A36
BYTES 0D42073C0000173615420000000000000000
AT 5668

( w566E | NFA 5668 CFA 566E )
( Unknown erased name; CFA identifier )
AT 5668
( Header: flags, saved name and link )
BYTES 830000B23156
DODOES
( DOES> thread at 51CD )
BYTES CD511F4806421F42143C143C1F4207420642202020201F422020
AT 568A

( w5691 | NFA 568A CFA 5691 )
( Unknown erased name; CFA identifier )
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

( w56AE | NFA 56A8 CFA 56AE )
( Unknown erased name; CFA identifier )
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

( w587C | NFA 5876 CFA 587C )
( Unknown erased name; CFA identifier )
AT 5876
( Header: flags, saved name and link )
BYTES 830000D06A58
DOVAR
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000020
AT 589E

( w58A4 | NFA 589E CFA 58A4 )
( Unknown erased name; CFA identifier )
AT 589E
( Header: flags, saved name and link )
BYTES 830000D97658
DODOES
( DOES> thread at 51CD )
BYTES CD5100000000000000000000000000008F0000000000000000000000
BYTES 000000000000
AT 58C8

( w58CF | NFA 58C8 CFA 58CF )
( Unknown erased name; CFA identifier )
AT 58C8
( Header: flags, saved name and link )
BYTES 84000000C59E58
DOVAR
CELL 0000
AT 58D3

( w58D9 | NFA 58D3 CFA 58D9 )
( Unknown erased name; CFA identifier )
AT 58D3
( Header: flags, saved name and link )
BYTES 830000CEC858
DOCOL
LIT8 CA t.- t.2 t.* t.2 t.+ t.;S
AT 58EA

( w58F1 | NFA 58EA CFA 58F1 )
( Unknown erased name; CFA identifier )
AT 58EA
( Header: flags, saved name and link )
BYTES 84000000D4D358
DOCOL
t.DUP w58D9 t.>R t.1 w538A t.C! t.R w5552 t.2+ w47EF w4D53
LIT8 CA t.- w5638 w4C54 w47EF t.1+ t.C! w47EF t.C! w54AB t.R>
t.1+ w5552 t.2+ w52C2 t.0 w538A t.C! t.;S
AT 5930

( w5937 | NFA 5930 CFA 5937 )
( Unknown erased name; CFA identifier )
AT 5930
( Header: flags, saved name and link )
BYTES 84000000D0EA58
DOCOL
t.DUP w4D22 t.1+ w52DE t.;S
AT 5943

( w5949 | NFA 5943 CFA 5949 )
( Unknown erased name; CFA identifier )
AT 5943
( Header: flags, saved name and link )
BYTES 830000D43059
DOCOL
t.DUP w4D22 t.DUP w47FE t.WORD-COUNT t.+ t.@
t.0BRANCH CELL 000A ( -> 5965 )
t.1+ w5328
t.BRANCH CELL 0004 ( -> 5967 )
( label 5965 )
t.DROP
( label 5967 )
t.;S
AT 5969

( w596F | NFA 5969 CFA 596F )
( Unknown erased name; CFA identifier )
AT 5969
( Header: flags, saved name and link )
BYTES 830000D44359
DOCOL
t.DUP w4D6D t.1+ w530A t.;S
AT 597B

( w5981 | NFA 597B CFA 5981 )
( Unknown erased name; CFA identifier )
AT 597B
( Header: flags, saved name and link )
BYTES 830000D46959
DOCOL
t.DUP w4D7F t.1+ w5328 t.;S
AT 598D

( w5993 | NFA 598D CFA 5993 )
( Unknown erased name; CFA identifier )
AT 598D
( Header: flags, saved name and link )
BYTES 830000D77B59
DOCON
CELL 9752
AT 5997

( w599C | NFA 5997 CFA 599C )
( Unknown erased name; CFA identifier )
AT 5997
( Header: flags, saved name and link )
BYTES 8200D78D59
DOCOL
LIT8 64 t./MOD t.2 t.* t.SWAP t.;S
AT 59AB

( w59B1 | NFA 59AB CFA 59B1 )
( Unknown erased name; CFA identifier )
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
w599C w4830 t.2
( label 59D4 )
t.BRANCH CELL 0006 ( -> 59DC )
( label 59D8 )
t.DROP t.0
( label 59DC )
t.;S
AT 59DE

( w59E4 | NFA 59DE CFA 59E4 )
( Unknown erased name; CFA identifier )
AT 59DE
( Header: flags, saved name and link )
BYTES 830000C2AB59
DOCOL
t.>R t.WORD-COUNT t.R> t.(DO)
( label 59EE )
t.DUP t.I t.+ t.C@ w59B1
t.0BRANCH CELL 0004 ( -> 59FE )
w5949
( label 59FE )
t.(LOOP) CELL FFEE ( -> 59EE )
t.DROP t.;S
AT 5A06

( w5A0D | NFA 5A06 CFA 5A0D )
( Unknown erased name; CFA identifier )
AT 5A06
( Header: flags, saved name and link )
BYTES 84000000D2DE59
DOCOL
t.1 t.- t.1 w5993 w481D w5993 t.2+ t.DUP t.2+ t.C@ w4830 t.0
w5937 t.1 w59E4 t.;S
AT 5A2F

( w5A35 | NFA 5A2F CFA 5A35 )
( Unknown erased name; CFA identifier )
AT 5A2F
( Header: flags, saved name and link )
BYTES 830000C2065A
DOCOL
t.SWAP w56AE w3F6D t.2+ w3F6D t.;S
AT 5A43

( w5A49 | NFA 5A43 CFA 5A49 )
( Unknown erased name; CFA identifier )
AT 5A43
( Header: flags, saved name and link )
BYTES 830000CD2F5A
DOCOL
t.DUP w556D t.! t.DUP w5A0D t.0 w5A35 t.0 w59E4 t.;S
AT 5A5F

( w5A65 | NFA 5A5F CFA 5A65 )
( Unknown erased name; CFA identifier )
AT 5A5F
( Header: flags, saved name and link )
BYTES 830000AA435A
CELL 5A67 ( native entry point )
BYTES A000 ( 5A67: LDY #$00 )
BYTES B1F2 ( 5A69: LDA [$f2],Y )
BYTES 91F0 ( 5A6B: STA [$f0],Y )
BYTES C8 ( 5A6D: INY )
BYTES C8 ( 5A6E: INY )
BYTES 88 ( 5A6F: DEY )
BYTES 84F6 ( 5A70: STY $f6 )
BYTES A001 ( 5A72: LDY #$01 )
BYTES B1F2 ( 5A74: LDA [$f2],Y )
BYTES A4F6 ( 5A76: LDY $f6 )
BYTES 91F0 ( 5A78: STA [$f0],Y )
BYTES C8 ( 5A7A: INY )
BYTES C8 ( 5A7B: INY )
BYTES C4F7 ( 5A7C: CPY $f7 )
BYTES D0EF ( 5A7E: BNE $5a6f )
BYTES 88 ( 5A80: DEY )
BYTES 84F6 ( 5A81: STY $f6 )
BYTES A002 ( 5A83: LDY #$02 )
BYTES B1F2 ( 5A85: LDA [$f2],Y )
BYTES A4F6 ( 5A87: LDY $f6 )
BYTES 91F0 ( 5A89: STA [$f0],Y )
BYTES 60 ( 5A8B: RTS )
AT 5A8C

( w5A92 | NFA 5A8C CFA 5A92 )
( Unknown erased name; CFA identifier )
AT 5A8C
( Header: flags, saved name and link )
BYTES 830000D35F5A
CELL 5A94 ( native entry point )
BYTES A5F7 ( 5A94: LDA $f7 )
BYTES 20693B ( 5A96: JSR $3b69 )
BYTES 60 ( 5A99: RTS )
AT 5A9A

( w5AA0 | NFA 5A9A CFA 5AA0 )
( Unknown erased name; CFA identifier )
AT 5A9A
( Header: flags, saved name and link )
BYTES 830000CC8C5A
CELL 5AA2 ( native entry point )
BYTES A903 ( 5AA2: LDA #$03 )
BYTES 18 ( 5AA4: CLC )
BYTES 65F2 ( 5AA5: ADC $f2 )
BYTES 85F2 ( 5AA7: STA $f2 )
BYTES 9002 ( 5AA9: BCC $5aad )
BYTES E6F3 ( 5AAB: INC $f3 )
BYTES 60 ( 5AAD: RTS )
AT 5AAE

( w5AB4 | NFA 5AAE CFA 5AB4 )
( Unknown erased name; CFA identifier )
AT 5AAE
( Header: flags, saved name and link )
BYTES 830000B69A5A
CELL 5AB6 ( native entry point )
BYTES A206 ( 5AB6: LDX #$06 )
BYTES C6F8 ( 5AB8: DEC $f8 )
BYTES 20675A ( 5ABA: JSR $5a67 )
BYTES 20A25A ( 5ABD: JSR $5aa2 )
BYTES 20945A ( 5AC0: JSR $5a94 )
BYTES CA ( 5AC3: DEX )
BYTES D0F4 ( 5AC4: BNE $5aba )
BYTES 60 ( 5AC6: RTS )
AT 5AC7

( w5ACD | NFA 5AC7 CFA 5ACD )
( Unknown erased name; CFA identifier )
AT 5AC7
( Header: flags, saved name and link )
BYTES 830000C7AE5A
CELL 5ACF ( native entry point )
BYTES 86D1 ( 5ACF: STX $d1 )
BYTES 20B65A ( 5AD1: JSR $5ab6 )
BYTES 20433B ( 5AD4: JSR $3b43 )
BYTES 20313B ( 5AD7: JSR $3b31 )
BYTES 20B65A ( 5ADA: JSR $5ab6 )
BYTES A900 ( 5ADD: LDA #$00 )
BYTES C5F8 ( 5ADF: CMP $f8 )
BYTES D0F4 ( 5AE1: BNE $5ad7 )
BYTES 20B65A ( 5AE3: JSR $5ab6 )
BYTES A6D1 ( 5AE6: LDX $d1 )
BYTES 4C470F ( 5AE8: JMP $0f47 )
AT 5AEB

( w5AF1 | NFA 5AEB CFA 5AF1 )
( Unknown erased name; CFA identifier )
AT 5AEB
( Header: flags, saved name and link )
BYTES 830000C2C75A
DOCOL
w599C w47A4 t.DROP w4C81 t.SWAP LIT16 0004 w3D97 t.-1 w4C81
t.+! LIT16 FFFA w4C81 t.1+ t.+! t.2 w4C81 t.2+ t.+! LIT16 000C
w4C81 t.3 t.+ t.+! t.1 w4D90 t.! w4C81 t.2+ w4DA3 t.2 t.CMOVE
w4DA3 t.1+ t.DUP t.C@ LIT16 0006 t./ t.SWAP t.C! w4DA3 w4C54
t.* w4DA3 t.2+ t.SWAP t.ERASE t.2 w4830 t.0 w47FE LIT16 0004
t.+ w3ACC t.! w4C81 LIT16 0004 t.+ w3AC3 t.! w4DA3 w4C54 t.1
t.- w3C17 w5ACD t.;S
AT 5B83

( w5B89 | NFA 5B83 CFA 5B89 )
( Unknown erased name; CFA identifier )
AT 5B83
( Header: flags, saved name and link )
BYTES 830000C2EB5A
DOCOL
t.(DO)
( label 5B8D )
t.DUP t.I t.+ t.C@ w59B1 t.-DUP
t.0BRANCH CELL 0012 ( -> 5BAD )
t.1 t.=
t.0BRANCH CELL 0008 ( -> 5BAB )
w58F1
t.BRANCH CELL 0004 ( -> 5BAD )
( label 5BAB )
w5981
( label 5BAD )
t.(LOOP) CELL FFDE ( -> 5B8D )
t.DROP t.;S
AT 5BB5

( w5BBA | NFA 5BB5 CFA 5BBA )
( Unknown erased name; CFA identifier )
AT 5BB5
( Header: flags, saved name and link )
BYTES 8200C2835B
DOCOL
w556D t.@ t.SWAP w5A35 t.DUP t.2+ t.C@ w5AF1 t.WORD-COUNT t.0
w5B89 t.;S
AT 5BD4

( w5BD9 | NFA 5BD4 CFA 5BD9 )
( Unknown erased name; CFA identifier )
AT 5BD4
( Header: flags, saved name and link )
BYTES 8200BCB55B
DOCOL
w54DD w548F w54E6 LIT16 36EA LIT16 0112 w3D97 t.;S
AT 5BED

( w5BF2 | NFA 5BED CFA 5BF2 )
( Unknown erased name; CFA identifier )
AT 5BED
( Header: flags, saved name and link )
BYTES 8200DAD45B
DOCOL
t.DUP w5BBA w5157 t.C@ t.0=_12DE
t.0BRANCH CELL 0004 ( -> 5C04 )
w54F1
( label 5C04 )
w516E w4C81 w548F w5257 t.;S
AT 5C0E

( w5C15 | NFA 5C0E CFA 5C15 )
( Unknown erased name; CFA identifier )
AT 5C0E
( Header: flags, saved name and link )
BYTES 84000000CCED5B
DOCOL
w5211 w5BF2 w522D t.;S
AT 5C1F

( w5C26 | NFA 5C1F CFA 5C26 )
( Unknown erased name; CFA identifier )
AT 5C1F
( Header: flags, saved name and link )
BYTES 84000000CC0E5C
DOCOL
t.P w5BBA w4C81 w548F t.;S
AT 5C32

( w5C39 | NFA 5C32 CFA 5C39 )
( Unknown erased name; CFA identifier )
AT 5C32
( Header: flags, saved name and link )
BYTES 84000000CC1F5C
DOCOL
w519B t.DROP w5157 t.C@
t.0BRANCH CELL 0008 ( -> 5C4D )
w5C26
t.BRANCH CELL 000A ( -> 5C55 )
( label 5C4D )
w5BD9 t.0 w4D90 t.!
( label 5C55 )
w5257 w51F5 t.;S
AT 5C5B

( w5C61 | NFA 5C5B CFA 5C61 )
( Unknown erased name; CFA identifier )
AT 5C5B
( Header: flags, saved name and link )
BYTES 830000DA325C
DOCOL
w5157 t.C@
t.0BRANCH CELL 0004 ( -> 5C6D )
w5BD9
( label 5C6D )
w5211 t.1 w516E t.0 t.1 w5A35 t.DUP t.2+ t.C@ w59B1
t.0BRANCH CELL 0004 ( -> 5C87 )
w596F
( label 5C87 )
t.WORD-COUNT t.1 w5B89 w54F1 w4C81 w548F w522D w5257 t.;S
AT 5C99

( w5C9F | NFA 5C99 CFA 5C9F )
( Unknown erased name; CFA identifier )
AT 5C99
( Header: flags, saved name and link )
BYTES 830000DA5B5C
DOCOL
w519B t.DROP w5BD9 t.0 w4D90 t.! w5257 w5157 t.C@ t.-DUP
t.0BRANCH CELL 001E ( -> 5CD5 )
t.2 t.=
t.0BRANCH CELL 000C ( -> 5CCB )
w519B w5BF2 w51F5
t.BRANCH CELL 000C ( -> 5CD5 )
( label 5CCB )
w519B w519B w5BF2 w5BF2 w51F5
( label 5CD5 )
w5257 w51F5 t.;S
AT 5CDB

( w5CE1 | NFA 5CDB CFA 5CE1 )
( Unknown erased name; CFA identifier )
AT 5CDB
( Header: flags, saved name and link )
BYTES 830000C3995C
DOVAR
CELL 0001
AT 5CE5

( w5CED | NFA 5CE5 CFA 5CED )
( Unknown erased name; CFA identifier )
AT 5CE5
( Header: flags, saved name and link )
BYTES 8500000000CBDB5C
DOCOL
t.>R t.1 w46B6 t.!
( label 5CF7 )
t.1 w3FBE t.! t.0 LIT8 78 t.R w46C0 t.DROP t.2DROP w4215 t.@
t.0=_12DE w5CE1 t.@ t.*
t.0BRANCH CELL 0019 ( -> 5D31 )
t.0 w3FBE t.! t.0 w5552 LIT8 18 t.R t.1+ w46C0 t.DROP t.2DROP
( label 5D31 )
w4215 t.@ t.0=_12DE
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

( w5D51 | NFA 5D4B CFA 5D51 )
( Unknown erased name; CFA identifier )
AT 5D4B
( Header: flags, saved name and link )
BYTES 830000C1415D
DOVAR
CELL 0000
AT 5D55

( w5D5B | NFA 5D55 CFA 5D5B )
( Unknown erased name; CFA identifier )
AT 5D55
( Header: flags, saved name and link )
BYTES 830000C44B5D
DOVAR
CELL 0001
AT 5D5F

( w5D64 | NFA 5D5F CFA 5D64 )
( Unknown erased name; CFA identifier )
AT 5D5F
( Header: flags, saved name and link )
BYTES 8200CB555D
DOVAR
CELL 0001
AT 5D68

( w5D6D | NFA 5D68 CFA 5D6D )
( Unknown erased name; CFA identifier )
AT 5D68
( Header: flags, saved name and link )
BYTES 8200C75F5D
DOCOL
( label 5D6F )
t.0 t.TRIGGER@ LIT8 05 t.PAUSE
t.0BRANCH CELL FFF5 ( -> 5D6F )
t.;S
AT 5D7E

( w5D84 | NFA 5D7E CFA 5D84 )
( Unknown erased name; CFA identifier )
AT 5D7E
( Header: flags, saved name and link )
BYTES 830000CC685D
DOCOL
( Trailing native code/data at 5D86; retained exactly )
BYTES 2105287712
AT 5D8B

( w5D92 | NFA 5D8B CFA 5D92 )
( Unknown erased name; CFA identifier )
AT 5D8B
( Header: flags, saved name and link )
BYTES 84000000DA7E5D
DOCOL
LIT8 FF LIT16 02FC t.C! w50C3 w5D6D t.1 w4F59 t.! w4FAA w4F0F
t.0 w4F59 t.! w4FAA w4E72
( label 5DB5 )
t.NIC t.0 LIT8 4D t.C! t.0 w50A3 t.1 w4F59 t.! w4FC5 t.0 w4F59
t.! w4FC5 LIT16 02FC t.C@ LIT8 FF t.= t.0=_12DE
t.0BRANCH CELL 0033 ( -> 5E14 )
w5157 t.C@ t.0=_12DE w5D64 t.@ t.*
t.0BRANCH CELL 001A ( -> 5E0B )
LIT16 02FC t.C@ LIT16 5D86 t.3 w3896 w5D5B t.@ t.* w5D51 t.!
( label 5E0B )
LIT8 FF LIT16 02FC t.C!
( label 5E14 )
t.0 t.TRIGGER@ t.0=_12DE w5D51 t.@ t.+
t.0BRANCH CELL FF93 ( -> 5DB5 )
t.0 w4F59 t.! w4F73 t.C@ w4F73 t.1+ t.C@ w4E48 t.;S
AT 5E38

( w5E3E | NFA 5E38 CFA 5E3E )
( Unknown erased name; CFA identifier )
AT 5E38
( Header: flags, saved name and link )
BYTES 830000B28B5D
DOVAR
BYTES 34E8DC2A1418965420
AT 5E49

( w5E4F | NFA 5E49 CFA 5E4F )
( Unknown erased name; CFA identifier )
AT 5E49
( Header: flags, saved name and link )
BYTES 830000C9385E
DOCOL
w42DB w4300 t.! LIT16 A701 w42C3 LIT16 A7E5 w42C3 w4349 w42DB
LIT16 0006 t.+ t.C@ LIT16 02C7 t.C! t.;S
AT 5E77

( w5E7E | NFA 5E77 CFA 5E7E )
( Unknown erased name; CFA identifier )
AT 5E77
( Header: flags, saved name and link )
BYTES 84000000D0495E
DOCOL
w5E3E w42DB LIT16 0007 t.CMOVE w5E4F t.;S
AT 5E8E

( w5E93 | NFA 5E8E CFA 5E93 )
( Unknown erased name; CFA identifier )
AT 5E8E
( Header: flags, saved name and link )
BYTES 8200CA775E
DOCON
CELL 8D52
AT 5E97

( w5E9E | NFA 5E97 CFA 5E9E )
( Unknown erased name; CFA identifier )
AT 5E97
( Header: flags, saved name and link )
BYTES 84000000DA8E5E
DOVAR
CELL 0000
AT 5EA2

( w5EA8 | NFA 5EA2 CFA 5EA8 )
( Unknown erased name; CFA identifier )
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
LIT16 022F t.C@ w5EA8 t.! t.0 LIT16 022F t.C! t.;S
AT 5EC8

( RESTORE-DISPLAY-DMA | NFA 5EC8 CFA 5ECE )
( Inferred descriptive name, not recovered original: )
( Restores SDMCTL [$022F] from the saved variable. )
AT 5EC8
( Header: flags, saved name and link )
BYTES 830000C9AC5E
DOCOL
w5EA8 t.@ LIT16 022F t.C! t.;S
AT 5EDC

( w5EE5 | NFA 5EDC CFA 5EE5 )
( Unknown erased name; CFA identifier )
AT 5EDC
( Header: flags, saved name and link )
BYTES 860000000000DAC85E
CELL 5EE7 ( native entry point )
BYTES 86D1 ( 5EE7: STX $d1 )
BYTES AEA05E ( 5EE9: LDX $5ea0 )
BYTES ACA15E ( 5EEC: LDY $5ea1 )
BYTES A970 ( 5EEF: LDA #$70 )
BYTES 200330 ( 5EF1: JSR $3003 )
BYTES A200 ( 5EF4: LDX #$00 )
BYTES 8A ( 5EF6: TXA )
BYTES 200330 ( 5EF7: JSR $3003 )
BYTES A6D1 ( 5EFA: LDX $d1 )
BYTES 4C470F ( 5EFC: JMP $0f47 )
AT 5EFF

( w5F04 | NFA 5EFF CFA 5F04 )
( Unknown erased name; CFA identifier )
AT 5EFF
( Header: flags, saved name and link )
BYTES 8200D3DC5E
DOVAR
CELL 0000
AT 5F08

( w5F0E | NFA 5F08 CFA 5F0E )
( Unknown erased name; CFA identifier )
AT 5F08
( Header: flags, saved name and link )
BYTES 830000CEFF5E
CELL 5F10 ( native entry point )
BYTES 86D1 ( 5F10: STX $d1 )
BYTES AE065F ( 5F12: LDX $5f06 )
BYTES A900 ( 5F15: LDA #$00 )
BYTES 200330 ( 5F17: JSR $3003 )
BYTES A6D1 ( 5F1A: LDX $d1 )
BYTES 4C470F ( 5F1C: JMP $0f47 )
AT 5F1F

( PLAY-MUSIC | NFA 5F1F CFA 5F26 )
( Inferred descriptive name, not recovered original: Stores )
( selected tune then calls native sound-player entry $3003 )
( with A=0 and X=tune. )
AT 5F1F
( Header: flags, saved name and link )
BYTES 84000000C7085F
DOCOL
w5F04 t.! w5F0E t.;S
AT 5F30

( STOP-MUSIC | NFA 5F30 CFA 5F3A )
( Inferred descriptive name, not recovered original: Calls )
( native sound-player entry $3003 with command A=$40. )
AT 5F30
( Header: flags, saved name and link )
BYTES 87000000000000C71F5F
CELL 5F3C ( native entry point )
BYTES 86D1 ( 5F3C: STX $d1 )
BYTES A940 ( 5F3E: LDA #$40 )
BYTES 200330 ( 5F40: JSR $3003 )
BYTES A6D1 ( 5F43: LDX $d1 )
BYTES 4C470F ( 5F45: JMP $0f47 )
AT 5F48

( w5F4E | NFA 5F48 CFA 5F4E )
( Unknown erased name; CFA identifier )
AT 5F48
( Header: flags, saved name and link )
BYTES 830000CD305F
DOVAR
CELL 0000
AT 5F52

( w5F59 | NFA 5F52 CFA 5F59 )
( Unknown erased name; CFA identifier )
AT 5F52
( Header: flags, saved name and link )
BYTES 84000000DA485F
CELL 5F5B ( native entry point )
BYTES AD505F ( 5F5B: LDA $5f50 )
BYTES D012 ( 5F5E: BNE $5f72 )
BYTES AD1FD0 ( 5F60: LDA $d01f )
BYTES C903 ( 5F63: CMP #$03 )
BYTES D008 ( 5F65: BNE $5f6f )
BYTES A940 ( 5F67: LDA #$40 )
BYTES 200330 ( 5F69: JSR $3003 )
BYTES EE505F ( 5F6C: INC $5f50 )
BYTES 4C815F ( 5F6F: JMP $5f81 )
BYTES AD1FD0 ( 5F72: LDA $d01f )
BYTES C905 ( 5F75: CMP #$05 )
BYTES D008 ( 5F77: BNE $5f81 )
BYTES A960 ( 5F79: LDA #$60 )
BYTES 200330 ( 5F7B: JSR $3003 )
BYTES CE505F ( 5F7E: DEC $5f50 )
BYTES 200630 ( 5F81: JSR $3006 )
BYTES 60 ( 5F84: RTS )
AT 5F85

( w5F8A | NFA 5F85 CFA 5F8A )
( Unknown erased name; CFA identifier )
AT 5F85
( Header: flags, saved name and link )
BYTES 8200C9525F
DOVAR
CELL 0000
AT 5F8E

( w5F94 | NFA 5F8E CFA 5F94 )
( Unknown erased name; CFA identifier )
AT 5F8E
( Header: flags, saved name and link )
BYTES 830000DA855F
CELL 5F96 ( native entry point )
BYTES 86D1 ( 5F96: STX $d1 )
BYTES A921 ( 5F98: LDA #$21 )
BYTES AE8C5F ( 5F9A: LDX $5f8c )
BYTES AC8D5F ( 5F9D: LDY $5f8d )
BYTES 200330 ( 5FA0: JSR $3003 )
BYTES A6D1 ( 5FA3: LDX $d1 )
BYTES 4C470F ( 5FA5: JMP $0f47 )
AT 5FA8

( w5FAE | NFA 5FA8 CFA 5FAE )
( Unknown erased name; CFA identifier )
AT 5FA8
( Header: flags, saved name and link )
BYTES 830000AA8E5F
DOCOL
w5F8A t.1+ t.C! w5F8A t.C! w5F94 t.;S
AT 5FBE

( w5FC4 | NFA 5FBE CFA 5FC4 )
( Unknown erased name; CFA identifier )
AT 5FBE
( Header: flags, saved name and link )
BYTES 830000CFA85F
DODOES
( DOES> thread at 51CD )
BYTES CD51202028073709C800370B280F202084045A076E05A012B4166407
BYTES AA0E28096902B906600599110C033C131E155A1500000000
AT 5FFA

( w6000 | NFA 5FFA CFA 6000 )
( Unknown erased name; CFA identifier )
AT 5FFA
( Header: flags, saved name and link )
BYTES 830000D7BE5F
DOCOL
w5F4E t.@
t.0BRANCH CELL 000C ( -> 6014 )
w5FC4 w4C54 w5FAE
t.BRANCH CELL 0004 ( -> 6016 )
( label 6014 )
t.DROP
( label 6016 )
t.;S
AT 6018
