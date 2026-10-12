( Wladcy Ciemnosci v1 20-framework.fth: target 2A76..600F )
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
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2A8C
( Header: flags, saved name and link )
BYTES 85494E4445D8441E
DOVAR
BYTES 090905151501118009800D1D19808080800004141480808080800C1C
BYTES 1C80802C
AT 2AB6

( MODE | NFA 2AB6 CFA 2ABD )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2AB6
( Header: flags, saved name and link )
BYTES 844D4F44C58C2A
DOVAR
CELL 0002
AT 2AC1

( .A | NFA 2AC1 CFA 2AC6 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2AC1
( Header: flags, saved name and link )
BYTES 822EC1B62A
DOCOL
t.0 t.MODE t.! t.;S
AT 2AD0

( # | NFA 2AD0 CFA 2AD4 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2AD0
( Header: flags, saved name and link )
BYTES 81A3C12A
DOCOL
t.1 t.MODE t.! t.;S
AT 2ADE

( MEM | NFA 2ADE CFA 2AE4 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2ADE
( Header: flags, saved name and link )
BYTES 834D45CDD02A
DOCOL
t.2 t.MODE t.! t.;S
AT 2AEE

( ,X | NFA 2AEE CFA 2AF3 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2AEE
( Header: flags, saved name and link )
BYTES 822CD8DE2A
DOCOL
t.3 t.MODE t.! t.;S
AT 2AFD

( ,Y | NFA 2AFD CFA 2B02 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2AFD
( Header: flags, saved name and link )
BYTES 822CD9EE2A
DOCOL
LIT16 0004 t.MODE t.! t.;S
AT 2B0E

( X] | NFA 2B0E CFA 2B13 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2B0E
( Header: flags, saved name and link )
BYTES 8258A9FD2A
DOCOL
LIT16 0005 t.MODE t.! t.;S
AT 2B1F

( ]Y | NFA 2B1F CFA 2B24 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2B1F
( Header: flags, saved name and link )
BYTES 8229D90E2B
DOCOL
LIT16 0006 t.MODE t.! t.;S
AT 2B30

( ] | NFA 2B30 CFA 2B34 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2B30
( Header: flags, saved name and link )
BYTES 81A91F2B
DOCOL
LIT16 000F t.MODE t.! t.;S
AT 2B40

( BOT | NFA 2B40 CFA 2B46 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2B40
( Header: flags, saved name and link )
BYTES 83424FD4302B
DOCOL
t.,X t.0 t.;S
AT 2B4E

( SEC | NFA 2B4E CFA 2B54 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2B4E
( Header: flags, saved name and link )
BYTES 835345C3402B
DOCOL
t.,X t.2 t.;S
AT 2B5C

( RP] | NFA 2B5C CFA 2B62 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2B5C
( Header: flags, saved name and link )
BYTES 835250A94E2B
DOCOL
t.,X LIT16 0101 t.;S
AT 2B6C

( UPMODE | NFA 2B6C CFA 2B75 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
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
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2BBD
( Header: flags, saved name and link )
BYTES 834350D56C2B
DOCOL
t.<BUILDS t.C, t.DOES>
( Trailing code/data at 2BCB; retained exactly )
BYTES F9135216E42A7712
AT 2BD3

( BRK, | NFA 2BD3 CFA 2BDA )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2BD3
( Header: flags, saved name and link )
BYTES 8442524BACBD2B
DODOES
( DOES> thread at 2BCB )
BYTES CB2B00
AT 2BDF

( CLC, | NFA 2BDF CFA 2BE6 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2BDF
( Header: flags, saved name and link )
BYTES 84434C43ACD32B
DODOES
( DOES> thread at 2BCB )
BYTES CB2B18
AT 2BEB

( CLD, | NFA 2BEB CFA 2BF2 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2BEB
( Header: flags, saved name and link )
BYTES 84434C44ACDF2B
DODOES
( DOES> thread at 2BCB )
BYTES CB2BD8
AT 2BF7

( CLI, | NFA 2BF7 CFA 2BFE )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2BF7
( Header: flags, saved name and link )
BYTES 84434C49ACEB2B
DODOES
( DOES> thread at 2BCB )
BYTES CB2B58
AT 2C03

( CLV, | NFA 2C03 CFA 2C0A )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C03
( Header: flags, saved name and link )
BYTES 84434C56ACF72B
DODOES
( DOES> thread at 2BCB )
BYTES CB2BB8
AT 2C0F

( DEX, | NFA 2C0F CFA 2C16 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C0F
( Header: flags, saved name and link )
BYTES 84444558AC032C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BCA
AT 2C1B

( DEY, | NFA 2C1B CFA 2C22 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C1B
( Header: flags, saved name and link )
BYTES 84444559AC0F2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B88
AT 2C27

( INX, | NFA 2C27 CFA 2C2E )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C27
( Header: flags, saved name and link )
BYTES 84494E58AC1B2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BE8
AT 2C33

( INY, | NFA 2C33 CFA 2C3A )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C33
( Header: flags, saved name and link )
BYTES 84494E59AC272C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BC8
AT 2C3F

( NOP, | NFA 2C3F CFA 2C46 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C3F
( Header: flags, saved name and link )
BYTES 844E4F50AC332C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BEA
AT 2C4B

( PHA, | NFA 2C4B CFA 2C52 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C4B
( Header: flags, saved name and link )
BYTES 84504841AC3F2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B48
AT 2C57

( PHP, | NFA 2C57 CFA 2C5E )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C57
( Header: flags, saved name and link )
BYTES 84504850AC4B2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B08
AT 2C63

( PLA, | NFA 2C63 CFA 2C6A )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C63
( Header: flags, saved name and link )
BYTES 84504C41AC572C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B68
AT 2C6F

( PLP, | NFA 2C6F CFA 2C76 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C6F
( Header: flags, saved name and link )
BYTES 84504C50AC632C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B28
AT 2C7B

( RTI, | NFA 2C7B CFA 2C82 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C7B
( Header: flags, saved name and link )
BYTES 84525449AC6F2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B40
AT 2C87

( RTS, | NFA 2C87 CFA 2C8E )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C87
( Header: flags, saved name and link )
BYTES 84525453AC7B2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B60
AT 2C93

( SEC, | NFA 2C93 CFA 2C9A )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C93
( Header: flags, saved name and link )
BYTES 84534543AC872C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B38
AT 2C9F

( SED, | NFA 2C9F CFA 2CA6 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C9F
( Header: flags, saved name and link )
BYTES 84534544AC932C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BF8
AT 2CAB

( SEI, | NFA 2CAB CFA 2CB2 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2CAB
( Header: flags, saved name and link )
BYTES 84534549AC9F2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B78
AT 2CB7

( TAX, | NFA 2CB7 CFA 2CBE )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2CB7
( Header: flags, saved name and link )
BYTES 84544158ACAB2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BAA
AT 2CC3

( TAY, | NFA 2CC3 CFA 2CCA )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2CC3
( Header: flags, saved name and link )
BYTES 84544159ACB72C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BA8
AT 2CCF

( TSX, | NFA 2CCF CFA 2CD6 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2CCF
( Header: flags, saved name and link )
BYTES 84545358ACC32C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BBA
AT 2CDB

( TXA, | NFA 2CDB CFA 2CE2 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2CDB
( Header: flags, saved name and link )
BYTES 84545841ACCF2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B8A
AT 2CE7

( TXS, | NFA 2CE7 CFA 2CEE )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2CE7
( Header: flags, saved name and link )
BYTES 84545853ACDB2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B9A
AT 2CF3

( TYA, | NFA 2CF3 CFA 2CFA )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2CF3
( Header: flags, saved name and link )
BYTES 84545941ACE72C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B98
AT 2CFF

( MCP | NFA 2CFF CFA 2D05 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
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
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2D81
( Header: flags, saved name and link )
BYTES 84414443ACFF2C
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D606E1C
AT 2D8F

( AND, | NFA 2D8F CFA 2D96 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2D8F
( Header: flags, saved name and link )
BYTES 84414E44AC812D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D206E1C
AT 2D9D

( CMP, | NFA 2D9D CFA 2DA4 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2D9D
( Header: flags, saved name and link )
BYTES 84434D50AC8F2D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DC06E1C
AT 2DAB

( EOR, | NFA 2DAB CFA 2DB2 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2DAB
( Header: flags, saved name and link )
BYTES 84454F52AC9D2D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D406E1C
AT 2DB9

( LDA, | NFA 2DB9 CFA 2DC0 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2DB9
( Header: flags, saved name and link )
BYTES 844C4441ACAB2D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DA06E1C
AT 2DC7

( ORA, | NFA 2DC7 CFA 2DCE )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2DC7
( Header: flags, saved name and link )
BYTES 844F5241ACB92D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D006E1C
AT 2DD5

( SBC, | NFA 2DD5 CFA 2DDC )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2DD5
( Header: flags, saved name and link )
BYTES 84534243ACC72D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DE06E1C
AT 2DE3

( STA, | NFA 2DE3 CFA 2DEA )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2DE3
( Header: flags, saved name and link )
BYTES 84535441ACD52D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D806C1C
AT 2DF1

( ASL, | NFA 2DF1 CFA 2DF8 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2DF1
( Header: flags, saved name and link )
BYTES 8441534CACE32D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D010D0D
AT 2DFF

( DEC, | NFA 2DFF CFA 2E06 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2DFF
( Header: flags, saved name and link )
BYTES 84444543ACF12D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DC10C0C
AT 2E0D

( INC, | NFA 2E0D CFA 2E14 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E0D
( Header: flags, saved name and link )
BYTES 84494E43ACFF2D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DE10C0C
AT 2E1B

( LSR, | NFA 2E1B CFA 2E22 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E1B
( Header: flags, saved name and link )
BYTES 844C5352AC0D2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D410D0D
AT 2E29

( ROL, | NFA 2E29 CFA 2E30 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E29
( Header: flags, saved name and link )
BYTES 84524F4CAC1B2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D210D0D
AT 2E37

( ROR, | NFA 2E37 CFA 2E3E )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E37
( Header: flags, saved name and link )
BYTES 84524F52AC292E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D610D0D
AT 2E45

( STX, | NFA 2E45 CFA 2E4C )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E45
( Header: flags, saved name and link )
BYTES 84535458AC372E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D811404
AT 2E53

( CPX, | NFA 2E53 CFA 2E5A )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E53
( Header: flags, saved name and link )
BYTES 84435058AC452E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DE08604
AT 2E61

( CPY, | NFA 2E61 CFA 2E68 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E61
( Header: flags, saved name and link )
BYTES 84435059AC532E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DC08604
AT 2E6F

( LDX, | NFA 2E6F CFA 2E76 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E6F
( Header: flags, saved name and link )
BYTES 844C4458AC612E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DA29614
AT 2E7D

( LDY, | NFA 2E7D CFA 2E84 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E7D
( Header: flags, saved name and link )
BYTES 844C4459AC6F2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DA08E0C
AT 2E8B

( STY, | NFA 2E8B CFA 2E92 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E8B
( Header: flags, saved name and link )
BYTES 84535459AC7D2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D808C04
AT 2E99

( JSR, | NFA 2E99 CFA 2EA0 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E99
( Header: flags, saved name and link )
BYTES 844A5352AC8B2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D148004
AT 2EA7

( JMP, | NFA 2EA7 CFA 2EAE )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2EA7
( Header: flags, saved name and link )
BYTES 844A4D50AC992E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D408084
AT 2EB5

( BIT, | NFA 2EB5 CFA 2EBC )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2EB5
( Header: flags, saved name and link )
BYTES 84424954ACA72E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D208404
AT 2EC3

( BEGIN, | NFA 2EC3 CFA 2ECC )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2EC3
( Header: flags, saved name and link )
BYTES C6424547494EACB52E
DOCOL
t.HERE t.1 t.;S
AT 2ED4

( UNTIL, | NFA 2ED4 CFA 2EDD )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2ED4
( Header: flags, saved name and link )
BYTES C6554E54494CACC32E
DOCOL
t.?EXEC t.>R t.1 t.?PAIRS t.R> t.C, t.HERE t.1+ t.- t.C, t.;S
AT 2EF5

( IF, | NFA 2EF5 CFA 2EFB )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2EF5
( Header: flags, saved name and link )
BYTES C34946ACD42E
DOCOL
t.C, t.HERE t.0 t.C, t.2 t.;S
AT 2F09

( THEN, | NFA 2F09 CFA 2F11 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
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
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2F37
( Header: flags, saved name and link )
BYTES C5454C5345AC092F
DOCOL
t.2 t.?PAIRS t.HERE t.1+ t.1 t.JMP, t.SWAP t.HERE t.OVER t.1+
t.- t.SWAP t.C! t.2 t.;S
AT 2F5F

( NOT | NFA 2F5F CFA 2F65 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2F5F
( Header: flags, saved name and link )
BYTES 834E4FD4372F
DOCOL
LIT16 0020 t.+ t.;S
AT 2F6F

( CS | NFA 2F6F CFA 2F74 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2F6F
( Header: flags, saved name and link )
BYTES 8243D35F2F
DOCON
CELL 0090
AT 2F78

( 0= | NFA 2F78 CFA 2F7D )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2F78
( Header: flags, saved name and link )
BYTES 8230BD6F2F
DOCON
CELL 00D0
AT 2F81

( 0< | NFA 2F81 CFA 2F86 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2F81
( Header: flags, saved name and link )
BYTES 8230BC782F
DOCON
CELL 0010
AT 2F8A

( >= | NFA 2F8A CFA 2F8F )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2F8A
( Header: flags, saved name and link )
BYTES 823EBD812F
DOCON
CELL 0090
AT 2F93

( C; | NFA 2F93 CFA 2F98 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2F93
( Header: flags, saved name and link )
BYTES C243BB8A2F
DOCOL
t.CURRENT t.@ t.CONTEXT t.! t.?EXEC t.?CSP t.SMUDGE t.;S
AT 2FAA

( END-CODE | NFA 2FAA CFA 2FB5 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
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
( Trailing code/data at 383C; retained exactly )
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
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
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
LDA.ZP F4            ( 3B31 )
STA.ZP F2            ( 3B33 )
LDA.ZP F5            ( 3B35 )
STA.ZP F3            ( 3B37 )
RTS                  ( 3B39 )
AT 3B3A

( w3B41 | NFA 3B3A CFA 3B41 )
( Unknown erased name; CFA identifier )
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

( w3B52 | NFA 3B4C CFA 3B52 )
( Unknown erased name; CFA identifier )
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

( w3B67 | NFA 3B61 CFA 3B67 )
( Unknown erased name; CFA identifier )
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

( w3B7A | NFA 3B74 CFA 3B7A )
( Unknown erased name; CFA identifier )
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

( w3BC1 | NFA 3BBB CFA 3BC1 )
( Unknown erased name; CFA identifier )
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

( w3C04 | NFA 3BFB CFA 3C04 )
( Unknown erased name; CFA identifier )
AT 3BFB
( Header: flags, saved name and link )
BYTES 860000000000BCBB3B
CELL 3C06 ( native entry point )
STX.ZP D1            ( 3C06 )
JSR.ABS 3BC3         ( 3C08 )
LDX.ZP D1            ( 3C0B )
JMP.ABS 0F47         ( 3C0D )
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
BYTES 830000C9583C
DOVAR
CELL 0060
AT 3C6B

( w3C71 | NFA 3C6B CFA 3C71 )
( Unknown erased name; CFA identifier )
AT 3C6B
( Header: flags, saved name and link )
BYTES 830000D4613C
CELL 3C73 ( native entry point )
LDA.ABS D40B         ( 3C73 )
BMI 3C73             ( 3C76 )
LDA.ABS D40B         ( 3C78 )
BPL 3C78             ( 3C7B )
LDA.# FF             ( 3C7D )
STA.ABS D40A         ( 3C7F )
LDA.# 00             ( 3C82 )
STA.ABS D40E         ( 3C84 )
SEI                  ( 3C87 )
DEC.ABS D301         ( 3C88 )
RTS                  ( 3C8B )
AT 3C8C

( w3C92 | NFA 3C8C CFA 3C92 )
( Unknown erased name; CFA identifier )
AT 3C8C
( Header: flags, saved name and link )
BYTES 830000CC6B3C
CELL 3C94 ( native entry point )
JSR.ABS 3C73         ( 3C94 )
DEY                  ( 3C97 )
LDA.INDY DD          ( 3C98 )
STA.INDY DF          ( 3C9A )
CPY.# 00             ( 3C9C )
BNE 3C97             ( 3C9E )
INC.ABS D301         ( 3CA0 )
LDA.ABS 3C69         ( 3CA3 )
STA.ABS D40E         ( 3CA6 )
CLI                  ( 3CA9 )
RTS                  ( 3CAA )
AT 3CAB

( w3CB1 | NFA 3CAB CFA 3CB1 )
( Unknown erased name; CFA identifier )
AT 3CAB
( Header: flags, saved name and link )
BYTES 830000D68C3C
CELL 3CB3 ( native entry point )
STX.ZP D1            ( 3CB3 )
LDX.ABS 3C4E         ( 3CB5 )
LDY.# 00             ( 3CB8 )
CPX.# 00             ( 3CBA )
BEQ 3CC8             ( 3CBC )
JSR.ABS 3C94         ( 3CBE )
INC.ZP DE            ( 3CC1 )
INC.ZP E0            ( 3CC3 )
DEX                  ( 3CC5 )
BNE 3CBE             ( 3CC6 )
LDA.ABS 3C4D         ( 3CC8 )
BEQ 3CD3             ( 3CCB )
LDY.ABS 3C4D         ( 3CCD )
JSR.ABS 3C94         ( 3CD0 )
LDX.ZP D1            ( 3CD3 )
JMP.ABS 0F47         ( 3CD5 )
AT 3CD8

( w3CE0 | NFA 3CD8 CFA 3CE0 )
( Unknown erased name; CFA identifier )
AT 3CD8
( Header: flags, saved name and link )
BYTES 8500000000C5AB3C
DOCOL
w3C4B t.! w3C5D t.! w3C54 t.! w3CB1 t.;S
AT 3CF2

( w3CF8 | NFA 3CF2 CFA 3CF8 )
( Unknown erased name; CFA identifier )
AT 3CF2
( Header: flags, saved name and link )
BYTES 830000B8D83C
DOCON
CELL 2800
AT 3CFC

( w3D02 | NFA 3CFC CFA 3D02 )
( Unknown erased name; CFA identifier )
AT 3CFC
( Header: flags, saved name and link )
BYTES 830000CCF23C
DOCOL
t.OVER t.+ t.DUP t.>R w3CF8 t.< t.0=_12DE
t.0BRANCH CELL 004A ( -> 3D5E )
t.DUP w3CF8 t.< t.0=_12DE
t.0BRANCH CELL 0020 ( -> 3D40 )
t.>R t.0 t.0 LIT16 C000 t.R w3CF8 t.- t.+ t.R> t.R t.SWAP t.-
t.BRANCH CELL 001C ( -> 3D5A )
( label 3D40 )
t.>R LIT16 D800 t.R t.+ w3CF8 t.R> t.- LIT16 C000 t.R w3CF8
t.-
( label 3D5A )
t.BRANCH CELL 0018 ( -> 3D74 )
( label 3D5E )
t.>R LIT16 D800 t.R t.+ t.R> t.R t.SWAP t.- t.0 t.0
( label 3D74 )
t.R> t.DROP t.>R t.OVER t.R> t.SWAP t.;S
AT 3D82

( w3D89 | NFA 3D82 CFA 3D89 )
( Unknown erased name; CFA identifier )
AT 3D82
( Header: flags, saved name and link )
BYTES 84000000CDFC3C
DOCOL
t.ROT t.>R w3D02 t.R t.+ t.ROT t.ROT w3CE0 t.R> t.ROT t.ROT
w3CE0 t.;S
AT 3DA5

( w3DAC | NFA 3DA5 CFA 3DAC )
( Unknown erased name; CFA identifier )
AT 3DA5
( Header: flags, saved name and link )
BYTES 84000000CD823D
DOCOL
t.ROT t.>R w3D02 t.R t.+ t.SWAP w3CE0 t.R> t.SWAP w3CE0 t.;S
AT 3DC4

( w3DCE | NFA 3DC4 CFA 3DCE )
( Unknown erased name; CFA identifier )
AT 3DC4
( Header: flags, saved name and link )
BYTES 87000000000000C2A53D
CELL 3DD0 ( native entry point )
LDA.ZPX 01           ( 3DD0 )
DEX                  ( 3DD2 )
DEX                  ( 3DD3 )
STA.ZPX 00           ( 3DD4 )
LDA.# 00             ( 3DD6 )
STA.ZPX 03           ( 3DD8 )
STA.ZPX 01           ( 3DDA )
JMP.ABS 0F47         ( 3DDC )
AT 3DDF

( w3DE7 | NFA 3DDF CFA 3DE7 )
( Unknown erased name; CFA identifier )
AT 3DDF
( Header: flags, saved name and link )
BYTES 8500000000A9C43D
DOCOL
t.-FIND
t.0BRANCH CELL 0025 ( -> 3E12 )
t.DROP t.SWAP t.1+ t.ROT LIT8 03 t.* t.+ t.DUP t.>R t.1+ t.!
LIT16 0020 t.R> t.C!
t.BRANCH CELL 0010 ( -> 3E20 )
( label 3E12 )
t.DROP
( ATASCII text: ERROR VBI )
t.(.")
BYTES 094552524F5220564249
( label 3E20 )
t.;S
AT 3E22

( w3E2A | NFA 3E22 CFA 3E2A )
( Unknown erased name; CFA identifier )
AT 3E22
( Header: flags, saved name and link )
BYTES 8500000000B1DF3D
DOVAR
BYTES EAEAEAEA20F75EEAEAEAEAEAEAEAEAEA4C593E20
AT 3E40

( w3E47 | NFA 3E40 CFA 3E47 )
( Unknown erased name; CFA identifier )
AT 3E40
( Header: flags, saved name and link )
BYTES 84000000B1223E
DOCOL
w3E2A w3DE7 t.;S
AT 3E4F

( w3E57 | NFA 3E4F CFA 3E57 )
( Unknown erased name; CFA identifier )
AT 3E4F
( Header: flags, saved name and link )
BYTES 8500000000A9403E
CELL 3E59 ( native entry point )
JMP.ABS E45F         ( 3E59 )
AT 3E5C

( INSTALL-GAME-VBI | NFA 3E5C CFA 3E66 )
( Inferred descriptive name, not recovered original: Native )
( SETVBV call at $E45C installs the game interrupt entry )
( $3E2D with selector six. )
AT 3E5C
( Header: flags, saved name and link )
BYTES 87000000000000B14F3E
CELL 3E68 ( native entry point )
STX.ZP D1            ( 3E68 )
LDX.# 3E             ( 3E6A )
LDY.# 2D             ( 3E6C )
LDA.# 06             ( 3E6E )
JSR.ABS E45C         ( 3E70 )
LDX.ZP D1            ( 3E73 )
JMP.ABS 0F47         ( 3E75 )
AT 3E78

( RESTORE-OS-VBI | NFA 3E78 CFA 3E83 )
( Inferred descriptive name, not recovered original: Native )
( SETVBV call restores the operating system VBI entry $E45F )
( with selector six. )
AT 3E78
( Header: flags, saved name and link )
BYTES 8800000000000000B15C3E
CELL 3E85 ( native entry point )
STX.ZP D1            ( 3E85 )
LDX.# E4             ( 3E87 )
LDY.# 5F             ( 3E89 )
LDA.# 06             ( 3E8B )
JSR.ABS E45C         ( 3E8D )
LDX.ZP D1            ( 3E90 )
JMP.ABS 0F47         ( 3E92 )
AT 3E95

( w3E9C | NFA 3E95 CFA 3E9C )
( Unknown erased name; CFA identifier )
AT 3E95
( Header: flags, saved name and link )
BYTES 84000000C4783E
DOVAR
CELL 00C6
AT 3EA0

( w3EA6 | NFA 3EA0 CFA 3EA6 )
( Unknown erased name; CFA identifier )
AT 3EA0
( Header: flags, saved name and link )
BYTES 830000C3953E
DOVAR
CELL 00A7
AT 3EAA

( w3EAF | NFA 3EAA CFA 3EAF )
( Unknown erased name; CFA identifier )
AT 3EAA
( Header: flags, saved name and link )
BYTES 8200CBA03E
DOCON
CELL 00D2
AT 3EB3

( w3EB9 | NFA 3EB3 CFA 3EB9 )
( Unknown erased name; CFA identifier )
AT 3EB3
( Header: flags, saved name and link )
BYTES 830000ABAA3E
CELL 3EBB ( native entry point )
LDA.ZP D2            ( 3EBB )
CLC                  ( 3EBD )
ADC.ABS 3E9E         ( 3EBE )
STA.ZP D2            ( 3EC1 )
LDA.ZP D3            ( 3EC3 )
ADC.ABS 3E9F         ( 3EC5 )
STA.ZP D3            ( 3EC8 )
RTS                  ( 3ECA )
AT 3ECB

( w3ED1 | NFA 3ECB CFA 3ED1 )
( Unknown erased name; CFA identifier )
AT 3ECB
( Header: flags, saved name and link )
BYTES 830000AAB33E
CELL 3ED3 ( native entry point )
LDA.ZPX 02           ( 3ED3 )
LDY.# 00             ( 3ED5 )
TAX                  ( 3ED7 )
BEQ 3F0C             ( 3ED8 )
LDA.INDY D2          ( 3EDA )
INY                  ( 3EDC )
CLC                  ( 3EDD )
ADC.ZP D2            ( 3EDE )
STA.ABS 3E9E         ( 3EE0 )
LDA.INDY D2          ( 3EE3 )
ADC.ZP D3            ( 3EE5 )
STA.ZP D3            ( 3EE7 )
CLC                  ( 3EE9 )
LDA.ABS 3E9E         ( 3EEA )
ADC.# 02             ( 3EED )
STA.ZP D2            ( 3EEF )
BCC 3EF5             ( 3EF1 )
INC.ZP D3            ( 3EF3 )
DEY                  ( 3EF5 )
LDA.ZP D3            ( 3EF6 )
CMP.ABS 3EA8         ( 3EF8 )
BMI 3F09             ( 3EFB )
LDA.ZP D3            ( 3EFD )
CLC                  ( 3EFF )
ADC.# C0             ( 3F00 )
STA.ZP D3            ( 3F02 )
LDA.# D8             ( 3F04 )
STA.ABS 3EA8         ( 3F06 )
DEX                  ( 3F09 )
BNE 3EDA             ( 3F0A )
LDX.ZP D1            ( 3F0C )
RTS                  ( 3F0E )
AT 3F0F

( w3F15 | NFA 3F0F CFA 3F15 )
( Unknown erased name; CFA identifier )
AT 3F0F
( Header: flags, saved name and link )
BYTES 830000AACB3E
CELL 3F17 ( native entry point )
STX.ZP D1            ( 3F17 )
LDA.ZPX 00           ( 3F19 )
STA.ZP D2            ( 3F1B )
LDA.ZPX 01           ( 3F1D )
STA.ZP D3            ( 3F1F )
RTS                  ( 3F21 )
AT 3F22

( w3F28 | NFA 3F22 CFA 3F28 )
( Unknown erased name; CFA identifier )
AT 3F22
( Header: flags, saved name and link )
BYTES 830000C30F3F
CELL 3F2A ( native entry point )
LDA.# A7             ( 3F2A )
STA.ABS 3EA8         ( 3F2C )
JSR.ABS 3F17         ( 3F2F )
JSR.ABS 3ED3         ( 3F32 )
JMP.ABS 1057         ( 3F35 )
AT 3F38

( w3F42 | NFA 3F38 CFA 3F42 )
( Unknown erased name; CFA identifier )
AT 3F38
( Header: flags, saved name and link )
BYTES 87000000000000C3223F
DOCOL
t.<BUILDS t.DUP t., t.ALLOT t.DOES>
( Trailing code/data at 3F4E; retained exactly )
BYTES 1616283FAF3EE4137712
AT 3F58

( w3F5F | NFA 3F58 CFA 3F5F )
( Unknown erased name; CFA identifier )
AT 3F58
( Header: flags, saved name and link )
BYTES 84000000D4383F
DOCOL
t.DUP t.>R t.2+ t.R> t.@ t.;S
AT 3F6D

( w3F74 | NFA 3F6D CFA 3F74 )
( Unknown erased name; CFA identifier )
AT 3F6D
( Header: flags, saved name and link )
BYTES 84000000C4583F
DOCOL
w3F28 w3EAF t.@ t.;S
AT 3F7E

( w3F86 | NFA 3F7E CFA 3F86 )
( Unknown erased name; CFA identifier )
AT 3F7E
( Header: flags, saved name and link )
BYTES 8500000000D46D3F
DOCOL
LIT16 0022 t.WORD t.HERE t.1+ t.OVER t.2+ t.HERE t.C@ t.CMOVE
t.HERE t.C@ t.SWAP t.! t.;S
AT 3FA6

( w3FAD | NFA 3FA6 CFA 3FAD )
( Unknown erased name; CFA identifier )
AT 3FA6
( Header: flags, saved name and link )
BYTES 84000000D57E3F
DOCOL
t.>R t.R w3F28 w3EAF t.@ t.R> t.- t.;S
AT 3FBF

( w3FC5 | NFA 3FBF CFA 3FC5 )
( Unknown erased name; CFA identifier )
AT 3FBF
( Header: flags, saved name and link )
BYTES 830000CDA63F
DOVAR
CELL 0000
AT 3FC9

( w3FD1 | NFA 3FC9 CFA 3FD1 )
( Unknown erased name; CFA identifier )
AT 3FC9
( Header: flags, saved name and link )
BYTES 8500000000CBBF3F
DOVAR
CELL 0000
AT 3FD5

( w3FDC | NFA 3FD5 CFA 3FDC )
( Unknown erased name; CFA identifier )
AT 3FD5
( Header: flags, saved name and link )
BYTES 84000000CDC93F
DOVAR
CELL 0000
AT 3FE0

( w3FE6 | NFA 3FE0 CFA 3FE6 )
( Unknown erased name; CFA identifier )
AT 3FE0
( Header: flags, saved name and link )
BYTES 830000D2D53F
DOCOL
t.ROT w3FC5 t.@
t.0BRANCH CELL 0012 ( -> 4002 )
w3FDC t.! t.PAD w3FDC t.@ t.B/BUF w3DAC t.PAD
( label 4002 )
t.ROT t.ROT t.;S
AT 4008

( w400D | NFA 4008 CFA 400D )
( Unknown erased name; CFA identifier )
AT 4008
( Header: flags, saved name and link )
BYTES 8200CEE03F
DOCOL
w3FC5 t.@
t.0BRANCH CELL 0032 ( -> 4047 )
t.S-L t.@
t.0BRANCH CELL 0016 ( -> 4033 )
t.PAD w3FDC t.@ t.B/BUF w3D89 t.B/BUF w3FDC t.+!
t.BRANCH CELL 0012 ( -> 4043 )
( label 4033 )
t.B/BUF w3FDC t.+! t.PAD w3FDC t.@ t.B/BUF w3DAC
( label 4043 )
t.BRANCH CELL 0006 ( -> 404B )
( label 4047 )
t.B/BUF t.+
( label 404B )
t.;S
AT 404D

( w4054 | NFA 404D CFA 4054 )
( Unknown erased name; CFA identifier )
AT 404D
( Header: flags, saved name and link )
BYTES 84000000D20840
DOVAR
CELL 0000
AT 4058

( w405E | NFA 4058 CFA 405E )
( Unknown erased name; CFA identifier )
AT 4058
( Header: flags, saved name and link )
BYTES 830000D04D40
DOVAR
CELL 0000
AT 4062

( w4069 | NFA 4062 CFA 4069 )
( Unknown erased name; CFA identifier )
AT 4062
( Header: flags, saved name and link )
BYTES 84000000D25840
DOCOL
t.PAD t.B/BUF t.+ t.DUP w4054 t.! t.DIRB t.1 t.1 t.-DISK
t.0=_12DE
t.0BRANCH CELL 0054 ( -> 40D7 )
t.1 LIT16 007F t.1 t.(DO)
( label 408F )
t.OVER t.I t.=
t.0BRANCH CELL 002C ( -> 40C3 )
t.SWAP t.DROP t.DUP t.DIRB t.> t.0=_12DE t.0=_12DE t.+ w4054
t.@ t.I t.+ t.C@ t.2DUP t.+ w405E t.! t.0 t.LEAVE
t.BRANCH CELL 000E ( -> 40CF )
( label 40C3 )
w4054 t.@ t.I t.+ t.C@ t.+
( label 40CF )
t.(LOOP) CELL FFBE ( -> 408F )
t.BRANCH CELL 0006 ( -> 40DB )
( label 40D7 )
t.DROP t.1
( label 40DB )
t.;S
AT 40DD

( w40E5 | NFA 40DD CFA 40E5 )
( Unknown erased name; CFA identifier )
AT 40DD
( Header: flags, saved name and link )
BYTES 8500000000CB6240
DOCOL
w3FE6 t.OVER t.+ t.OVER t.1 t.- t.OVER t.DIRB t.SWAP t.<=<
t.0=_12DE t.0=_12DE t.+ t.SWAP t.(DO)
( label 4105 )
t.I t.DIRB t.=
t.0BRANCH CELL 0008 ( -> 4115 )
t.R> t.1+ t.>R
( label 4115 )
t.DUP t.I t.1 t.S-L t.@ t.-DISK
t.0BRANCH CELL 000C ( -> 412F )
t.DROP t.0 t.LEAVE
t.BRANCH CELL 0004 ( -> 4131 )
( label 412F )
w400D
( label 4131 )
t.(LOOP) CELL FFD2 ( -> 4105 )
t.0=_12DE t.;S
AT 4139

( DIRS | NFA 4139 CFA 4140 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $37E6 [DIRS] in contiguous 4-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 4139
( Header: flags, saved name and link )
BYTES 84000000D3DD40
DOCOL
t.0 t.S-L t.! t.SWAP t.>R w4069 t.>R t.-DUP t.0=_12DE
t.0BRANCH CELL 0005 ( -> 415B )
LIT8 FF
( label 415B )
t.R> t.R> t.;S
AT 4161

( DIRL | NFA 4161 CFA 4168 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $380E [DIRL] in contiguous 4-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 4161
( Header: flags, saved name and link )
BYTES 84000000CC3941
DOCOL
t.1 t.S-L t.! t.SWAP t.>R w4069 t.R> t.SWAP t.ROT t.;S
AT 417E

( -SE | NFA 417E CFA 4184 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $382A [-SE] in contiguous 4-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 417E
( Header: flags, saved name and link )
BYTES 830000C56141
DOVAR
CELL 0000
AT 4188

( DSL | NFA 4188 CFA 418E )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $3834 [DSL] in contiguous 4-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 4188
( Header: flags, saved name and link )
BYTES 830000CC7E41
DOCOL
t.>R t.-DUP t.0=_12DE
t.0BRANCH CELL 0028 ( -> 41C0 )
t.R t.- t.DUP t.-SE t.! t.0<_12F3 t.0=_12DE
t.0BRANCH CELL 000A ( -> 41B4 )
t.R> w40E5
t.BRANCH CELL 000A ( -> 41BC )
( label 41B4 )
t.R> t.DROP t.2DROP t.2
( label 41BC )
t.BRANCH CELL 0008 ( -> 41C6 )
( label 41C0 )
t.SWAP t.R> t.2DROP
( label 41C6 )
t.;S
AT 41C8

( w41CE | NFA 41C8 CFA 41CE )
( Unknown erased name; CFA identifier )
AT 41C8
( Header: flags, saved name and link )
BYTES 830000C48841
DOVAR
CELL 0003
AT 41D2

( w41D8 | NFA 41D2 CFA 41D8 )
( Unknown erased name; CFA identifier )
AT 41D2
( Header: flags, saved name and link )
BYTES 830000C4C841
DOCOL
t.PAD t.DIRB t.1 t.1 t.-DISK t.0=_12DE t.0=_12DE t.DUP
t.0=_12DE
t.0BRANCH CELL 0014 ( -> 4202 )
t.DROP t.PAD t.C@ w41CE t.@ t.= t.0=_12DE t.3 t.*
( label 4202 )
t.DUP
t.0BRANCH CELL 000A ( -> 4210 )
t.>R t.DROP t.2DROP t.R>
( label 4210 )
t.-DUP t.0=_12DE t.;S
AT 4216

( LAST-DISK-STATUS | NFA 4216 CFA 421C )
( Inferred descriptive name, not recovered original: )
( Receives the result of the DIRL/DSL disk operation and is )
( checked by title and game loading paths. )
AT 4216
( Header: flags, saved name and link )
BYTES 830000D2D241
DOVAR
CELL 0000
AT 4220

( w4228 | NFA 4220 CFA 4228 )
( Unknown erased name; CFA identifier )
AT 4220
( Header: flags, saved name and link )
BYTES 8500000000C41642
DOCOL
w41D8
t.0BRANCH CELL 0006 ( -> 4234 )
t.DIRL t.DSL
( label 4234 )
t.LAST-DISK-STATUS t.! t.;S
AT 423A

( w4242 | NFA 423A CFA 4242 )
( Unknown erased name; CFA identifier )
AT 423A
( Header: flags, saved name and link )
BYTES 8500000000C52042
DOCOL
w41D8
t.0BRANCH CELL 004C ( -> 4294 )
t.>R t.>R t.DUP t.R> t.R> t.2DUP t.>R t.>R t.DIRS t.DSL t.SWAP
t.DROP t.R> t.R> w4054 t.@ t.+ t.DUP t.C@ t.>R t.C! t.DUP
t.0=_12DE t.R> t.0=_12DE t.*
t.0BRANCH CELL 0014 ( -> 4294 )
t.DROP w4054 t.@ t.DIRB t.1 t.0 t.-DISK t.0=_12DE t.0=_12DE
( label 4294 )
t.LAST-DISK-STATUS t.! t.;S
AT 429A

( WAIT-FRAMES | NFA 429A CFA 42A2 )
( Inferred descriptive name, not recovered original: Loops )
( until Atari RTCLOK low byte $14 changes, once per )
( requested frame. )
AT 429A
( Header: flags, saved name and link )
BYTES 8500000000C53A42
DOCOL
t.0 t.(DO)
( label 42A8 )
LIT8 14 t.C@
( label 42AD )
t.DUP LIT8 14 t.C@ t.= t.0=_12DE
t.0BRANCH CELL FFF3 ( -> 42AD )
t.DROP
t.(LOOP) CELL FFE8 ( -> 42A8 )
t.;S
AT 42C4

( w42CA | NFA 42C4 CFA 42CA )
( Unknown erased name; CFA identifier )
AT 42C4
( Header: flags, saved name and link )
BYTES 830000A19A42
DOCOL
t.DUP t.C@ LIT16 0080 t.OR t.SWAP t.C! t.;S
AT 42DC

( w42E2 | NFA 42DC CFA 42E2 )
( Unknown erased name; CFA identifier )
AT 42DC
( Header: flags, saved name and link )
BYTES 830000CCC442
DOVAR
BYTES E4181C24C8CCC85420202020202020202020
AT 42F6

( w42FC | NFA 42F6 CFA 42FC )
( Unknown erased name; CFA identifier )
AT 42F6
( Header: flags, saved name and link )
BYTES 830000D3DC42
DOVAR
CELL 0000
AT 4300

( w4307 | NFA 4300 CFA 4307 )
( Unknown erased name; CFA identifier )
AT 4300
( Header: flags, saved name and link )
BYTES 84000000CCF642
DOCON
CELL 00DB
AT 430B

( w4312 | NFA 430B CFA 4312 )
( Unknown erased name; CFA identifier )
AT 430B
( Header: flags, saved name and link )
BYTES 84000000A90043
CELL 4314 ( native entry point )
PHP                  ( 4314 )
PHA                  ( 4315 )
TYA                  ( 4316 )
PHA                  ( 4317 )
LDY.ABS 42FE         ( 4318 )
CLC                  ( 431B )
LDA.INDY DB          ( 431C )
STA.ABS D016         ( 431E )
INY                  ( 4321 )
LDA.INDY DB          ( 4322 )
STA.ABS D017         ( 4324 )
INY                  ( 4327 )
LDA.INDY DB          ( 4328 )
STA.ABS D018         ( 432A )
INY                  ( 432D )
LDA.ABS D40B         ( 432E )
CMP.# 40             ( 4331 )
BMI 4337             ( 4333 )
LDY.# 00             ( 4335 )
STY.ABS 42FE         ( 4337 )
PLA                  ( 433A )
TAY                  ( 433B )
PLA                  ( 433C )
PLP                  ( 433D )
RTI                  ( 433E )
AT 433F

( w4346 | NFA 433F CFA 4346 )
( Unknown erased name; CFA identifier )
AT 433F
( Header: flags, saved name and link )
BYTES 84000000CC0B43
DOCOL
LIT16 4314 LIT16 0200 t.! t.0 w42FC t.! w3C67 t.C@ LIT16 00E0
t.OR t.DUP w3C67 t.C! LIT16 D40E t.C! t.;S
AT 4370

( w4377 | NFA 4370 CFA 4377 )
( Unknown erased name; CFA identifier )
AT 4370
( Header: flags, saved name and link )
BYTES 84000000CC3F43
DOCOL
LIT16 0060 w3C67 t.C! t.1 t.WAIT-FRAMES w4307 t.@ LIT16 02C4
LIT16 0003 t.CMOVE LIT16 0060 LIT16 D40E t.C! w4307 t.@
LIT16 D016 LIT16 0003 t.CMOVE t.;S
AT 43AD

( #RT | NFA 43AD CFA 43B3 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $4857 [#RT] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 43AD
( Header: flags, saved name and link )
BYTES 830000D47043
DOVAR
BYTES 000005
AT 43B8

( #RTC | NFA 43B8 CFA 43BF )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $4863 [#RTC] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 43B8
( Header: flags, saved name and link )
BYTES 84000000C3AD43
DOVAR
BYTES D1D7C5C11DC4DAD8C32020
AT 43CC

( EKP | NFA 43CC CFA 43D2 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $4876 [EKP] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 43CC
( Header: flags, saved name and link )
BYTES 830000D0B843
DOCON
CELL 00D2
AT 43D6

( #L | NFA 43D6 CFA 43DB )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $487F [#L] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 43D6
( Header: flags, saved name and link )
BYTES 8200CCCC43
DOCON
CELL 00D4
AT 43DF

( 40+ | NFA 43DF CFA 43E5 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $4889 [40+] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 43DF
( Header: flags, saved name and link )
BYTES 830000ABD643
CELL 43E7 ( native entry point )
CLC                  ( 43E7 )
LDA.ZP D2            ( 43E8 )
ADC.# 28             ( 43EA )
STA.ZP D2            ( 43EC )
LDA.ZP D3            ( 43EE )
ADC.# 00             ( 43F0 )
STA.ZP D3            ( 43F2 )
RTS                  ( 43F4 )
AT 43F5

( G#D | NFA 43F5 CFA 43FB )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $489F [G#D] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 43F5
( Header: flags, saved name and link )
BYTES 830000C4DF43
CELL 43FD ( native entry point )
LDY.# 00             ( 43FD )
LDA.ABS 43B5         ( 43FF )
STA.INDY D2          ( 4402 )
INY                  ( 4404 )
LDA.ABS 43B6         ( 4405 )
STA.INDY D2          ( 4408 )
INY                  ( 440A )
TYA                  ( 440B )
LDX.ZP D1            ( 440C )
CMP.ZPX 02           ( 440E )
BNE 4405             ( 4410 )
DEY                  ( 4412 )
LDA.ABS 43B7         ( 4413 )
STA.INDY D2          ( 4416 )
RTS                  ( 4418 )
AT 4419

( G# | NFA 4419 CFA 441E )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $48C2 [G#] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 4419
( Header: flags, saved name and link )
BYTES 8200A3F543
CELL 4420 ( native entry point )
STX.ZP D1            ( 4420 )
JSR.ABS 43FD         ( 4422 )
JSR.ABS 43E7         ( 4425 )
LDX.ZP D1            ( 4428 )
JMP.ABS 0F47         ( 442A )
AT 442D

( D# | NFA 442D CFA 4432 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $48D6 [D#] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 442D
( Header: flags, saved name and link )
BYTES 8200A31944
CELL 4434 ( native entry point )
STX.ZP D1            ( 4434 )
JSR.ABS 43FD         ( 4436 )
LDX.ZP D1            ( 4439 )
JMP.ABS 1057         ( 443B )
AT 443E

( S# | NFA 443E CFA 4443 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $48E7 [S#] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 443E
( Header: flags, saved name and link )
BYTES 8200A32D44
CELL 4445 ( native entry point )
STX.ZP D1            ( 4445 )
LDA.# 02             ( 4447 )
STA.ZP D4            ( 4449 )
JSR.ABS 43FD         ( 444B )
JSR.ABS 43E7         ( 444E )
INC.ZP D4            ( 4451 )
LDA.ZP D4            ( 4453 )
LDX.ZP D1            ( 4455 )
CMP.ZPX 00           ( 4457 )
BNE 444B             ( 4459 )
LDX.ZP D1            ( 445B )
JMP.ABS 0F47         ( 445D )
AT 4460

( [RAM] | NFA 4460 CFA 4468 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $490C [[RAM]] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 4460
( Header: flags, saved name and link )
BYTES 8500000000A93E44
DOCOL
t.#RTC t.#RT t.3 t.CMOVE t.G# t.#RTC t.3 t.+ t.#RT t.3 t.CMOVE
t.S# t.#RTC LIT16 0006 t.+ t.#RT t.3 t.CMOVE t.D# t.;S
AT 4494

( w4499 | NFA 4494 CFA 4499 )
( Unknown erased name; CFA identifier )
AT 4494
( Header: flags, saved name and link )
BYTES 8200AA6044
DOCOL
LIT8 58 t.@ t.Y@ LIT8 28 t.* t.+ t.X@ t.+ t.EKP t.! t.(RAM)
t.X@ t.1+ t.X! t.Y@ t.1+ t.Y! t.;S
AT 44C1

( w44CA | NFA 44C1 CFA 44CA )
( Unknown erased name; CFA identifier )
AT 44C1
( Header: flags, saved name and link )
BYTES 860000000000C19444
DOCOL
t.OVER t.2 t./ LIT8 14 t.SWAP t.- t.X! w4499 t.;S
AT 44DF

( w44E5 | NFA 44DF CFA 44E5 )
( Unknown erased name; CFA identifier )
AT 44DF
( Header: flags, saved name and link )
BYTES 830000CBC144
DOVAR
CELL 0000
AT 44E9

( w44EE | NFA 44E9 CFA 44EE )
( Unknown erased name; CFA identifier )
AT 44E9
( Header: flags, saved name and link )
BYTES 8200D2DF44
DOVAR
CELL 0000
AT 44F2

( w44F8 | NFA 44F2 CFA 44F8 )
( Unknown erased name; CFA identifier )
AT 44F2
( Header: flags, saved name and link )
BYTES 830000CDE944
DOCOL
t.0 t.SWAP t.COUNT t.DUP t.>R t.0 t.(DO)
( label 4508 )
t.SWAP t.OVER t.C@ t.I t.0=_12DE t.I t.1 t.= t.+
t.0BRANCH CELL 000D ( -> 4529 )
t.DUP LIT8 04 t.+ w44E5 t.!
( label 4529 )
t.MAX t.SWAP t.COUNT t.+
t.(LOOP) CELL FFD5 ( -> 4508 )
t.DROP LIT8 04 t.+ t.DUP w44EE t.! t.R> t.1 t.=
t.0BRANCH CELL 000F ( -> 4559 )
LIT8 07 t.DUP w44EE t.! w44E5 t.!
( label 4559 )
t.;S
AT 455B

( w4561 | NFA 455B CFA 4561 )
( Unknown erased name; CFA identifier )
AT 455B
( Header: flags, saved name and link )
BYTES 830000ABF244
DOCOL
t.Y@ t.1+ t.Y! t.;S
AT 456B

( w4571 | NFA 456B CFA 4571 )
( Unknown erased name; CFA identifier )
AT 456B
( Header: flags, saved name and link )
BYTES 830000D05B45
DOCOL
t.COUNT t.0 t.(DO)
( label 4579 )
t.DUP t.COUNT LIT8 14 t.OVER t.2 t./ t.- t.X! t.STYPE w4561
t.COUNT t.+
t.(LOOP) CELL FFE5 ( -> 4579 )
t.DROP t.;S
AT 459A

( w45A1 | NFA 459A CFA 45A1 )
( Unknown erased name; CFA identifier )
AT 459A
( Header: flags, saved name and link )
BYTES 84000000D46B45
DOCOL
t.DUP t.C@
t.0BRANCH CELL 0021 ( -> 45CA )
t.Y@ w4561 t.SWAP t.DUP w44F8 t.OVER t.C@ t.2+ w44CA w4571
t.Y! t.0 t.X!
( ATASCII text:  [1E] )
t.(.")
BYTES 02201E
( label 45CA )
t.;S
AT 45CC

( w45D2 | NFA 45CC CFA 45D2 )
( Unknown erased name; CFA identifier )
( Decoded text: Disk messages )
( item 0 line 1 $45DC: A )
( item 1 line 1 $45E1: BLAD DYSKOWY )
( item 1 line 2 $45EE: WLACZYLES STACJE? )
( item 1 line 3 $4600: RETURN )
( item 2 line 1 $460A: U )
( item 3 line 1 $460F: NIE TEN DYSK )
( item 3 line 2 $461C: RETURN )
AT 45CC
( Header: flags, saved name and link )
BYTES 830000D59A45
DODOES
( DOES> thread at 3F4E )
BYTES 4E3F4A0003000101412700030C426C61443D4459534B4F575911576C
BYTES 61435A596C45733D535441434A653F0652455455524E030001015515
BYTES 00020C4E49453D54454E3D4459534B0652455455524E
AT 4622

( w462A | NFA 4622 CFA 462A )
( Unknown erased name; CFA identifier )
AT 4622
( Header: flags, saved name and link )
BYTES 8500000000D5CC45
DOCOL
w45D2 t.2+ w45A1 t.;S
AT 4634

( w463A | NFA 4634 CFA 463A )
( Unknown erased name; CFA identifier )
AT 4634
( Header: flags, saved name and link )
BYTES 830000D32246
DOVAR
CELL 0000
AT 463E

( w4644 | NFA 463E CFA 4644 )
( Unknown erased name; CFA identifier )
( Decoded text: Screen background glyphs, not prose )
( background tiles $4648: )
( [3B][3D][3B][3D][3B][3D][3B][3D][3B][3D][3B][3D][3B][3D][3 )
( B][3D][3B][3D][3B][3D][3B][3D][3B][3D][3B][3D][3B][3D][3B] )
( [3D][3B][3D][3B] )
AT 463E
( Header: flags, saved name and link )
BYTES 830000B03446
DOVAR
BYTES 21003B3D3B3D3B3D3B3D3B3D3B3D3B3D3B3D3B3D3B3D3B3D3B3D3B3D
BYTES 3B3D3B3D3B3D3B
AT 4669

( w466E | NFA 4669 CFA 466E )
( Unknown erased name; CFA identifier )
AT 4669
( Header: flags, saved name and link )
BYTES 8200C53E46
DOCOL
t.0 t.0 t.POS
( ATASCII text:   )
t.(.")
BYTES 0120
LIT8 58 t.@ LIT16 002C t.+ LIT16 0009 t.0 t.(DO)
( label 468D )
w4644 t.2+ t.I t.2 t.MOD t.+ t.OVER LIT8 20 t.CMOVE LIT16 0028
t.+
t.(LOOP) CELL FFE5 ( -> 468D )
t.2 t.- LIT8 24 LIT8 0F t.FILL t.;S
AT 46B8

( w46BE | NFA 46B8 CFA 46BE )
( Unknown erased name; CFA identifier )
AT 46B8
( Header: flags, saved name and link )
BYTES 830000AA6946
DOCOL
t.>R t.2DUP t.R t.ROT t.ROT w466E w4377 t.R> w463A t.@
t.0BRANCH CELL 0008 ( -> 46DE )
w4228
t.BRANCH CELL 0004 ( -> 46E0 )
( label 46DE )
w4242
( label 46E0 )
t.LAST-DISK-STATUS t.@ w4346
t.0BRANCH CELL 000C ( -> 46F4 )
t.LAST-DISK-STATUS t.@ w462A t.KEY t.DROP
( label 46F4 )
t.;S
AT 46F6

( w46FC | NFA 46F6 CFA 46FC )
( Unknown erased name; CFA identifier )
AT 46F6
( Header: flags, saved name and link )
BYTES 830000BFB846
DOCOL
( label 46FE )
w46BE t.LAST-DISK-STATUS t.@ t.0=_12DE
t.0BRANCH CELL FFF6 ( -> 46FE )
t.DROP t.2DROP t.;S
AT 4710

( w4716 | NFA 4710 CFA 4716 )
( Unknown erased name; CFA identifier )
AT 4710
( Header: flags, saved name and link )
BYTES 830000BFF646
DOCOL
t.1 w463A t.! w46FC t.;S
AT 4722

( w4728 | NFA 4722 CFA 4728 )
( Unknown erased name; CFA identifier )
AT 4722
( Header: flags, saved name and link )
BYTES 830000BF1047
DOCOL
t.0 w463A t.! w46FC t.;S
AT 4734

( w473A | NFA 4734 CFA 473A )
( Unknown erased name; CFA identifier )
AT 4734
( Header: flags, saved name and link )
BYTES 830000AA2247
CELL 473C ( native entry point )
LDA.INDY D2          ( 473C )
STA.ABS 3E9E         ( 473E )
INY                  ( 4741 )
LDA.INDY D2          ( 4742 )
STA.ABS 3E9F         ( 4744 )
RTS                  ( 4747 )
AT 4748

( w474F | NFA 4748 CFA 474F )
( Unknown erased name; CFA identifier )
AT 4748
( Header: flags, saved name and link )
BYTES 84000000C33447
CELL 4751 ( native entry point )
LDA.# 00             ( 4751 )
STA.ABS 3EA8         ( 4753 )
JSR.ABS 3F17         ( 4756 )
LDA.ZPX 02           ( 4759 )
SEC                  ( 475B )
SBC.# 20             ( 475C )
BCC 4781             ( 475E )
STA.ZPX 02           ( 4760 )
JSR.ABS 3C73         ( 4762 )
JSR.ABS 3ED3         ( 4765 )
INC.ABS D301         ( 4768 )
LDA.ABS 3C69         ( 476B )
STA.ABS D40E         ( 476E )
CLI                  ( 4771 )
LDA.# 20             ( 4772 )
LDX.ZP D1            ( 4774 )
STA.ZPX 02           ( 4776 )
JSR.ABS 3C73         ( 4778 )
JSR.ABS 3ED3         ( 477B )
JMP.ABS 4787         ( 477E )
JSR.ABS 3C73         ( 4781 )
JSR.ABS 3ED3         ( 4784 )
JSR.ABS 473C         ( 4787 )
INC.ABS D301         ( 478A )
LDA.ABS 3C69         ( 478D )
STA.ABS D40E         ( 4790 )
CLI                  ( 4793 )
JMP.ABS 1057         ( 4794 )
AT 4797

( w479D | NFA 4797 CFA 479D )
( Unknown erased name; CFA identifier )
AT 4797
( Header: flags, saved name and link )
BYTES 830000CC4847
DOCOL
w474F w3EAF t.@ t.2+ t.DUP LIT16 D7FF t.>
t.0BRANCH CELL 000C ( -> 47BD )
LIT16 D800 t.-
t.BRANCH CELL 0008 ( -> 47C3 )
( label 47BD )
LIT16 9800 t.-
( label 47C3 )
w3E9C t.@ t.;S
AT 47C9

( w47D0 | NFA 47C9 CFA 47D0 )
( Unknown erased name; CFA identifier )
AT 47C9
( Header: flags, saved name and link )
BYTES 84000000CC9747
DOCOL
LIT16 D800 w474F w3EAF t.@ t.2+ w479D t.;S
AT 47E2

( w47E9 | NFA 47E2 CFA 47E9 )
( Unknown erased name; CFA identifier )
AT 47E2
( Header: flags, saved name and link )
BYTES 84000000CCC947
DOCOL
LIT16 D800 w479D t.;S
AT 47F3

( w47F9 | NFA 47F3 CFA 47F9 )
( Unknown erased name; CFA identifier )
AT 47F3
( Header: flags, saved name and link )
BYTES 830000C1E247
DOVAR
CELL A460
AT 47FD

( w4803 | NFA 47FD CFA 4803 )
( Unknown erased name; CFA identifier )
AT 47FD
( Header: flags, saved name and link )
BYTES 830000C1F347
DOCOL
w47F9 t.@ t.;S
AT 480B

( w4811 | NFA 480B CFA 4811 )
( Unknown erased name; CFA identifier )
AT 480B
( Header: flags, saved name and link )
BYTES 830000DAFD47
DOVAR
CELL A412
AT 4815

( w481B | NFA 4815 CFA 481B )
( Unknown erased name; CFA identifier )
AT 4815
( Header: flags, saved name and link )
BYTES 830000DA0B48
DOCOL
w4811 t.@ t.;S
AT 4823

( w482A | NFA 4823 CFA 482A )
( Unknown erased name; CFA identifier )
AT 4823
( Header: flags, saved name and link )
BYTES 84000000C21548
DOCOL
w4803 w3F74 t.;S
AT 4832

( w4838 | NFA 4832 CFA 4838 )
( Unknown erased name; CFA identifier )
AT 4832
( Header: flags, saved name and link )
BYTES 830000CD2348
DOCOL
t.SWAP w47E9 w3DAC t.;S
AT 4842

( w4849 | NFA 4842 CFA 4849 )
( Unknown erased name; CFA identifier )
AT 4842
( Header: flags, saved name and link )
BYTES 84000000CD3248
DOCOL
t.ROT t.ROT w47D0 w3DAC t.;S
AT 4855

( w485C | NFA 4855 CFA 485C )
( Unknown erased name; CFA identifier )
AT 4855
( Header: flags, saved name and link )
BYTES 84000000CD4248
DOCOL
w4803 w4838 t.;S
AT 4864

( w4869 | NFA 4864 CFA 4869 )
( Unknown erased name; CFA identifier )
AT 4864
( Header: flags, saved name and link )
BYTES 8200BC5548
CELL 486B ( native entry point )
LDA.ABS D40B         ( 486B )
BMI 486B             ( 486E )
LDA.ABS D40B         ( 4870 )
BPL 4870             ( 4873 )
RTS                  ( 4875 )
AT 4876

( w487B | NFA 4876 CFA 487B )
( Unknown erased name; CFA identifier )
AT 4876
( Header: flags, saved name and link )
BYTES 8200AA6448
CELL 487D ( native entry point )
JSR.ABS 486B         ( 487D )
JMP.ABS 0F47         ( 4880 )
AT 4883

( GRAPHICS-BASE | NFA 4883 CFA 488A )
( Inferred descriptive name, not recovered original: )
( Receives the graphics address from INSTALL-DISPLAY and is )
( used by graphics memory operations. )
AT 4883
( Header: flags, saved name and link )
BYTES 84000000D27648
DOVAR
CELL 0000
AT 488E

( w4896 | NFA 488E CFA 4896 )
( Unknown erased name; CFA identifier )
AT 488E
( Header: flags, saved name and link )
BYTES 8500000000D68348
DOCOL
t.DUP t.@ t.SWAP t.2+ t.SWAP
( label 48A2 )
t.OVER t.DUP t.C@ t.SWAP t.1+ t.C@ t.* t.OVER t.+ t.DUP t.>R
t.SWAP t.(DO)
( label 48BC )
t.DUP t.2+ t.OVER t.C@ t.I t.SWAP t.CMOVE t.DUP t.C@
t.(+LOOP) CELL FFEC ( -> 48BC )
t.DUP t.C@ t.+ t.2+ t.R> t.OVER t.@ t.0=_12DE
t.0BRANCH CELL FFBE ( -> 48A2 )
t.2DROP t.;S
AT 48EA

( INSTALL-DISPLAY | NFA 48EA CFA 48F0 )
( Inferred descriptive name, not recovered original: )
( Installs text screen address at SAVMSC $0058, stores the )
( graphics base, and writes SDLSTL $0230. )
AT 48EA
( Header: flags, saved name and link )
BYTES 830000CC8E48
DOCOL
t.DUP t.@ LIT16 0058 t.! t.2+ t.DUP t.@ t.GRAPHICS-BASE t.!
t.2+ t.DUP w4896 t.@ LIT16 0230 t.! t.;S
AT 4916

( w491B | NFA 4916 CFA 491B )
( Unknown erased name; CFA identifier )
AT 4916
( Header: flags, saved name and link )
BYTES 8200CFEA48
DOVAR
BYTES 00001EA4555555555555555555555555555555555555555555555555
BYTES 55555555555555553A91000000004A94555555555555555555555555
BYTES 55555555555555555555555555555555555555553EA40000437C
AT 496F

( w4977 | NFA 496F CFA 4977 )
( Unknown erased name; CFA identifier )
AT 496F
( Header: flags, saved name and link )
BYTES 8500000000CC1649
DOCOL
( Trailing code/data at 4979; retained exactly )
BYTES 48BA30A800A7090170704400A84E1D490E04374E1D490E03014420BA
BYTES 010B0403014100A700007712
AT 49A1

( w49A7 | NFA 49A1 CFA 49A7 )
( Unknown erased name; CFA identifier )
AT 49A1
( Header: flags, saved name and link )
BYTES 830000CC6F49
DOCON
CELL A830
AT 49AB

( w49B1 | NFA 49AB CFA 49B1 )
( Unknown erased name; CFA identifier )
AT 49AB
( Header: flags, saved name and link )
BYTES 830000CCA149
DOCON
CELL A706
AT 49B5

( w49BB | NFA 49B5 CFA 49BB )
( Unknown erased name; CFA identifier )
AT 49B5
( Header: flags, saved name and link )
BYTES 830000CCAB49
DOCON
CELL 0038
AT 49BF

( w49C5 | NFA 49BF CFA 49C5 )
( Unknown erased name; CFA identifier )
AT 49BF
( Header: flags, saved name and link )
BYTES 830000C4B549
DOVAR
BYTES 00000541
AT 49CB

( w49D0 | NFA 49CB CFA 49D0 )
( Unknown erased name; CFA identifier )
AT 49CB
( Header: flags, saved name and link )
BYTES 8200CFBF49
DOVAR
CELL 0000
AT 49D4

( w49DA | NFA 49D4 CFA 49DA )
( Unknown erased name; CFA identifier )
AT 49D4
( Header: flags, saved name and link )
BYTES 830000CFCB49
DOVAR
CELL 0000
AT 49DE

( w49E4 | NFA 49DE CFA 49E4 )
( Unknown erased name; CFA identifier )
AT 49DE
( Header: flags, saved name and link )
BYTES 830000C4D449
DOVAR
CELL 0000
AT 49E8

( w49EE | NFA 49E8 CFA 49EE )
( Unknown erased name; CFA identifier )
AT 49E8
( Header: flags, saved name and link )
BYTES 830000BEDE49
CELL 49F0 ( native entry point )
LDY.# 00             ( 49F0 )
JSR.ABS 486B         ( 49F2 )
LDA.ABS 49DC         ( 49F5 )
STA.INDY D2          ( 49F8 )
INY                  ( 49FA )
LDA.ABS 49DD         ( 49FB )
STA.INDY D2          ( 49FE )
DEY                  ( 4A00 )
JSR.ABS 3EBB         ( 4A01 )
LDA.ABS 49D2         ( 4A04 )
BNE 4A1A             ( 4A07 )
CLC                  ( 4A09 )
LDA.ABS 49DC         ( 4A0A )
ADC.# 90             ( 4A0D )
STA.ABS 49DC         ( 4A0F )
LDA.ABS 49DD         ( 4A12 )
ADC.# 01             ( 4A15 )
STA.ABS 49DD         ( 4A17 )
DEC.ABS 49E6         ( 4A1A )
BNE 49F5             ( 4A1D )
JMP.ABS 0F47         ( 4A1F )
AT 4A22

( w4A28 | NFA 4A22 CFA 4A28 )
( Unknown erased name; CFA identifier )
AT 4A22
( Header: flags, saved name and link )
BYTES 830000A1E849
DOCOL
t.DUP LIT8 04 t.* w49B1 t.+ w3EAF t.! w49D0 t.@
t.0BRANCH CELL 000A ( -> 4A49 )
t.DROP w491B
t.BRANCH CELL 000B ( -> 4A52 )
( label 4A49 )
LIT8 50 t.* w49A7 t.+
( label 4A52 )
w49DA t.! t.;S
AT 4A58

( w4A5F | NFA 4A58 CFA 4A5F )
( Unknown erased name; CFA identifier )
AT 4A58
( Header: flags, saved name and link )
BYTES 84000000BE224A
DOCOL
LIT8 14 w3E9C t.! LIT8 0C w49E4 t.! t.0 w4A28 w49EE LIT8 05
t.1 t.(DO)
( label 4A7C )
LIT8 0B w49E4 t.! t.I w4A28 w49EE
t.(LOOP) CELL FFF1 ( -> 4A7C )
t.;S
AT 4A8F

( w4A95 | NFA 4A8F CFA 4A95 )
( Unknown erased name; CFA identifier )
AT 4A8F
( Header: flags, saved name and link )
BYTES 830000CC584A
DOCOL
t.0 w49D0 t.! w4A5F t.;S
AT 4AA1

( w4AA7 | NFA 4AA1 CFA 4AA7 )
( Unknown erased name; CFA identifier )
AT 4AA1
( Header: flags, saved name and link )
BYTES 830000CC8F4A
DOCOL
t.1 w49D0 t.! w4A5F t.;S
AT 4AB3

( w4AB9 | NFA 4AB3 CFA 4AB9 )
( Unknown erased name; CFA identifier )
AT 4AB3
( Header: flags, saved name and link )
BYTES 830000ABA14A
DOCOL
t.>R t.OVER t.SWAP t.R t.SWAP t.FILL t.R> t.+ t.;S
AT 4ACD

( w4AD3 | NFA 4ACD CFA 4AD3 )
( Unknown erased name; CFA identifier )
AT 4ACD
( Header: flags, saved name and link )
BYTES 830000CCB34A
DOCOL
w49C5 t.@ t.OVER LIT8 04 t.CMOVE LIT8 04 t.+ t.DUP LIT8 20
t.ERASE LIT8 20 t.+ w49C5 t.@ LIT8 24 t.+ t.SWAP LIT8 04
t.CMOVE t.;S
AT 4B03

( w4B09 | NFA 4B03 CFA 4B09 )
( Unknown erased name; CFA identifier )
AT 4B03
( Header: flags, saved name and link )
BYTES 830000C7CD4A
DOCOL
t.GRAPHICS-BASE t.@ t.DUP LIT16 1180 t.+ t.SWAP t.(DO)
( label 4B1B )
w491B w49C5 t.! t.I w4AD3 LIT16 4945 w49C5 t.! t.I LIT8 28 t.+
w4AD3 LIT8 50
t.(+LOOP) CELL FFE0 ( -> 4B1B )
t.;S
AT 4B3F

( w4B45 | NFA 4B3F CFA 4B45 )
( Unknown erased name; CFA identifier )
AT 4B3F
( Header: flags, saved name and link )
BYTES 830000D4034B
DOCOL
LIT8 58 t.@ t.DUP LIT16 0190 t.ERASE LIT16 A800 t.DUP LIT8 28
t.ERASE LIT8 58 t.! t.1 t.0 t.POS
( Game text: )
( [16][02][0E][0D][12][14][2D][2D][2D][2D][2D][2D][2D][2D][2 )
( D][2D][06][07][08][0A][0B][0C][7C][7C][7C][7C][7C][7C][7C] )
( [7C][7C][7C][19][15][09][0F][10][13] )
t.(S")
BYTES 2616020E0D12142D2D2D2D2D2D2D2D2D2D0607080A0B0C7C7C7C7C7C
BYTES 7C7C7C7C7C1915090F1013
LIT8 28 t.- t.DUP LIT8 28 t.ERASE LIT8 58 t.! t.1 t.0 t.POS
( Game text: )
( [28][29][3C][3E][2B][2B][2B][2B][2B][2B][2B][2B][2B][2B][2 )
( B][2B][23][24][25][26][27][40][2A][2A][2A][2A][2A][2A][2A] )
( [2A][2A][2A][2A][2A][71][77][72][74] )
t.(S")
BYTES 2628293C3E2B2B2B2B2B2B2B2B2B2B2B2B2324252627402A2A2A2A2A
BYTES 2A2A2A2A2A2A2A71777274
LIT8 28 LIT8 58 t.+! t.2 t.0 t.POS
( Game text: [3A][3B] )
t.(S")
BYTES 023A3B
LIT16 0023 t.0 t.POS
( Game text: [79][75][69] )
t.(S")
BYTES 03797569
LIT16 000A t.1 t.(DO)
( label 4BFC )
t.2 t.I t.POS
( Game text: [5C][5E] )
t.(S")
BYTES 025C5E
LIT16 0024 t.I t.POS
( Game text: [64][66] )
t.(S")
BYTES 026466
t.(LOOP) CELL FFE6 ( -> 4BFC )
w4644 t.3 t.+ LIT16 0058 t.@ LIT16 0004 t.+ LIT16 001F t.CMOVE
t.;S
AT 4C32

( w4C38 | NFA 4C32 CFA 4C38 )
( Unknown erased name; CFA identifier )
AT 4C32
( Header: flags, saved name and link )
BYTES 830000D43F4B
DOCOL
LIT16 4979 t.INSTALL-DISPLAY w4A95 w466E t.;S
AT 4C46

( w4C4D | NFA 4C46 CFA 4C4D )
( Unknown erased name; CFA identifier )
AT 4C46
( Header: flags, saved name and link )
BYTES 84000000B5324C
DOCOL
LIT16 4979 t.INSTALL-DISPLAY w4B45 w4B09 w466E t.;S
AT 4C5D

( w4C63 | NFA 4C5D CFA 4C63 )
( Unknown erased name; CFA identifier )
AT 4C5D
( Header: flags, saved name and link )
BYTES 830000D9464C
DOCOL
t.DUP t.>R t.C@ t.R> t.1+ t.C@ t.;S
AT 4C73

( w4C79 | NFA 4C73 CFA 4C79 )
( Unknown erased name; CFA identifier )
AT 4C73
( Header: flags, saved name and link )
BYTES 830000A15D4C
DOCOL
t.>R t.R t.C@ t.+ t.R> t.C! t.;S
AT 4C89

( w4C90 | NFA 4C89 CFA 4C90 )
( Unknown erased name; CFA identifier )
AT 4C89
( Header: flags, saved name and link )
BYTES 84000000C2734C
DOCON
CELL 0600
AT 4C94

( w4C99 | NFA 4C94 CFA 4C99 )
( Unknown erased name; CFA identifier )
AT 4C94
( Header: flags, saved name and link )
BYTES 8200D8894C
DOVAR
CELL 0000
AT 4C9D

( w4CA2 | NFA 4C9D CFA 4CA2 )
( Unknown erased name; CFA identifier )
AT 4C9D
( Header: flags, saved name and link )
BYTES 8200D9944C
DOVAR
CELL 0000
AT 4CA6

( w4CAB | NFA 4CA6 CFA 4CAB )
( Unknown erased name; CFA identifier )
AT 4CA6
( Header: flags, saved name and link )
BYTES 8200CF9D4C
DOCOL
t.OVER w4C63 w3C17 t.SWAP t.2+ t.SWAP w3C2A w3C3D w3C04 t.;S
AT 4CC1

( w4CC8 | NFA 4CC1 CFA 4CC8 )
( Unknown erased name; CFA identifier )
AT 4CC1
( Header: flags, saved name and link )
BYTES 84000000D9A64C
DOCOL
w4CA2 t.@ t.* t.+ w4C99 t.@ t.+ t.;S
AT 4CDA

( w4CE1 | NFA 4CDA CFA 4CE1 )
( Unknown erased name; CFA identifier )
AT 4CDA
( Header: flags, saved name and link )
BYTES 84000000BEC14C
DOCOL
t.SWAP t.>R t.>R t.DUP w4C63 t.R> t.- w4CA2 t.! t.R> t.- w4C99
t.! t.;S
AT 4CFF

( w4D05 | NFA 4CFF CFA 4D05 )
( Unknown erased name; CFA identifier )
AT 4CFF
( Header: flags, saved name and link )
BYTES 830000C2DA4C
DOCOL
t.>R t.R w4C63 w4CE1 t.R t.2+ t.C@ t.SWAP t.2+ t.OVER t.R>
LIT16 0004 t.+ t.SWAP w4CC8 w4CAB t.;S
AT 4D2B

( w4D31 | NFA 4D2B CFA 4D31 )
( Unknown erased name; CFA identifier )
AT 4D2B
( Header: flags, saved name and link )
BYTES 830000C2FF4C
DOCOL
w482A t.2+ LIT16 0004 t.0 w4CE1 t.>R LIT8 28 t.R t.2+
t.GRAPHICS-BASE t.@ t.R> w4C63 LIT8 28 t.* t.+ t.+ w4CAB t.;S
AT 4D5D

( w4D62 | NFA 4D5D CFA 4D62 )
( Unknown erased name; CFA identifier )
AT 4D5D
( Header: flags, saved name and link )
BYTES 8200CF2B4D
DOCOL
t.>R t.DUP t.R LIT16 0004 t.CMOVE t.R> w4D05 t.;S
AT 4D76

( w4D7C | NFA 4D76 CFA 4D7C )
( Unknown erased name; CFA identifier )
AT 4D76
( Header: flags, saved name and link )
BYTES 830000C25D4D
DOCOL
w482A t.2+ w4C90 w4D62 t.;S
AT 4D88

( w4D8E | NFA 4D88 CFA 4D8E )
( Unknown erased name; CFA identifier )
AT 4D88
( Header: flags, saved name and link )
BYTES 830000C2764D
DOCOL
w482A t.2+ w4C90 w4D05 t.;S
AT 4D9A

( w4D9F | NFA 4D9A CFA 4D9F )
( Unknown erased name; CFA identifier )
AT 4D9A
( Header: flags, saved name and link )
BYTES 8200D4884D
DOVAR
CELL 0000
AT 4DA3

( w4DA8 | NFA 4DA3 CFA 4DA8 )
( Unknown erased name; CFA identifier )
AT 4DA3
( Header: flags, saved name and link )
BYTES 8200C19A4D
DOCON
CELL A0D5
AT 4DAC

( w4DB2 | NFA 4DAC CFA 4DB2 )
( Unknown erased name; CFA identifier )
AT 4DAC
( Header: flags, saved name and link )
BYTES 830000C2A34D
DOCOL
w4DA8 w4D9F t.@
t.0BRANCH CELL 0008 ( -> 4DC4 )
LIT16 0284 t.+
( label 4DC4 )
t.;S
AT 4DC6

( w4DCC | NFA 4DC6 CFA 4DCC )
( Unknown erased name; CFA identifier )
AT 4DC6
( Header: flags, saved name and link )
BYTES 830000CDAC4D
DOVAR
BYTES AEAAA0414C4C
AT 4DD4

( w4DDB | NFA 4DD4 CFA 4DDB )
( Unknown erased name; CFA identifier )
AT 4DD4
( Header: flags, saved name and link )
BYTES 84000000CDC64D
DOCOL
w4DCC LIT16 02C0 LIT16 0004 t.CMOVE t.;S
AT 4DEB

( w4DF1 | NFA 4DEB CFA 4DF1 )
( Unknown erased name; CFA identifier )
AT 4DEB
( Header: flags, saved name and link )
BYTES 830000A3D44D
DOVAR
CELL 0000
AT 4DF5

( w4DFC | NFA 4DF5 CFA 4DFC )
( Unknown erased name; CFA identifier )
AT 4DF5
( Header: flags, saved name and link )
BYTES 84000000C0EB4D
DOCOL
w4DF1 t.@ LIT16 0400 t.+ t.;S
AT 4E0A

( w4E11 | NFA 4E0A CFA 4E11 )
( Unknown erased name; CFA identifier )
AT 4E0A
( Header: flags, saved name and link )
BYTES 84000000A1F54D
DOCOL
t.DUP LIT16 D407 t.C! LIT16 0100 t.* w4DF1 t.! t.;S
AT 4E27

( w4E2E | NFA 4E27 CFA 4E2E )
( Unknown erased name; CFA identifier )
AT 4E27
( Header: flags, saved name and link )
BYTES 84000000CD0A4E
DOCOL
w4DFC LIT16 02FF t.ERASE t.;S
AT 4E3A

( w4E42 | NFA 4E3A CFA 4E42 )
( Unknown erased name; CFA identifier )
AT 4E3A
( Header: flags, saved name and link )
BYTES 8500000000CD274E
DOCOL
t.3 LIT16 D01D t.C! t.;S
AT 4E4E

( w4E57 | NFA 4E4E CFA 4E57 )
( Unknown erased name; CFA identifier )
AT 4E4E
( Header: flags, saved name and link )
BYTES 860000000000CD3A4E
DOCOL
LIT16 D000 LIT16 0008 t.ERASE t.0 LIT16 D01D t.C! t.;S
AT 4E6D

( w4E73 | NFA 4E6D CFA 4E73 )
( Unknown erased name; CFA identifier )
AT 4E6D
( Header: flags, saved name and link )
BYTES 830000A34E4E
DOVAR
BYTES 000005414C
AT 4E7A

( w4E81 | NFA 4E7A CFA 4E81 )
( Unknown erased name; CFA identifier )
AT 4E7A
( Header: flags, saved name and link )
BYTES 84000000A16D4E
CELL 4E83 ( native entry point )
JSR.ABS 486B         ( 4E83 )
LDA.ZPX 00           ( 4E86 )
STA.ABS D000         ( 4E88 )
STA.ABS D001         ( 4E8B )
STA.ABS D002         ( 4E8E )
JMP.ABS 1059         ( 4E91 )
AT 4E94

( w4E9A | NFA 4E94 CFA 4E9A )
( Unknown erased name; CFA identifier )
AT 4E94
( Header: flags, saved name and link )
BYTES 830000B07A4E
DOCOL
( Trailing code/data at 4E9C; retained exactly )
BYTES 00F000001008040200000000000000F0E0E0F0B89C0E040000000000
BYTES 001000004060B09A0E04007712
AT 4EC5

( w4ECA | NFA 4EC5 CFA 4ECA )
( Unknown erased name; CFA identifier )
AT 4EC5
( Header: flags, saved name and link )
BYTES 8200CB944E
DOCON
CELL 00D4
AT 4ECE

( w4ED5 | NFA 4ECE CFA 4ED5 )
( Unknown erased name; CFA identifier )
AT 4ECE
( Header: flags, saved name and link )
BYTES 84000000CDC54E
DOVAR
CELL 0000
AT 4ED9

( w4EE2 | NFA 4ED9 CFA 4EE2 )
( Unknown erased name; CFA identifier )
AT 4ED9
( Header: flags, saved name and link )
BYTES 860000000000A1CE4E
DOCOL
w4ED5 t.! w3E9C t.! t.;S
AT 4EEE

( w4EF4 | NFA 4EEE CFA 4EF4 )
( Unknown erased name; CFA identifier )
AT 4EEE
( Header: flags, saved name and link )
BYTES 830000A6D94E
CELL 4EF6 ( native entry point )
STX.ZP D1            ( 4EF6 )
JSR.ABS 486B         ( 4EF8 )
LDX.ABS 4ED7         ( 4EFB )
LDY.# 00             ( 4EFE )
LDA.INDY D2          ( 4F00 )
STA.INDY D4          ( 4F02 )
INY                  ( 4F04 )
CPY.ABS 3E9E         ( 4F05 )
BNE 4F00             ( 4F08 )
INC.ZP D5            ( 4F0A )
JSR.ABS 3EBB         ( 4F0C )
DEX                  ( 4F0F )
BNE 4EFE             ( 4F10 )
LDX.ZP D1            ( 4F12 )
JMP.ABS 0F47         ( 4F14 )
AT 4F17

( w4F1E | NFA 4F17 CFA 4F1E )
( Unknown erased name; CFA identifier )
AT 4F17
( Header: flags, saved name and link )
BYTES 84000000A1EE4E
DOCOL
LIT16 4E9C t.SWAP w4DFC t.+ w4ECA t.! w3EAF t.! t.3 w4ED5 t.!
LIT8 0D w3E9C t.! w4EF4 t.;S
AT 4F43

( w4F4C | NFA 4F43 CFA 4F4C )
( Unknown erased name; CFA identifier )
AT 4F43
( Header: flags, saved name and link )
BYTES 860000000000D9174F
DOCOL
t.<BUILDS t., t.ALLOT t.DOES>
( Trailing code/data at 4F56; retained exactly )
BYTES A513E413E413041316167712
AT 4F62

( w4F68 | NFA 4F62 CFA 4F68 )
( Unknown erased name; CFA identifier )
AT 4F62
( Header: flags, saved name and link )
BYTES 830000D9434F
DOVAR
CELL 0000
AT 4F6C

( w4F73 | NFA 4F6C CFA 4F73 )
( Unknown erased name; CFA identifier )
AT 4F6C
( Header: flags, saved name and link )
BYTES 84000000B0624F
DODOES
( DOES> thread at 4F56 )
BYTES 564F6A4F422120
AT 4F7C

( w4F82 | NFA 4F7C CFA 4F82 )
( Unknown erased name; CFA identifier )
AT 4F7C
( Header: flags, saved name and link )
BYTES 830000D06C4F
DODOES
( DOES> thread at 4F56 )
BYTES 564F6A4F000020
AT 4F8B

( w4F91 | NFA 4F8B CFA 4F91 )
( Unknown erased name; CFA identifier )
AT 4F8B
( Header: flags, saved name and link )
BYTES 830000D37C4F
DODOES
( DOES> thread at 4F56 )
BYTES 564F6A4F040620
AT 4F9A

( w4FA0 | NFA 4F9A CFA 4FA0 )
( Unknown erased name; CFA identifier )
AT 4F9A
( Header: flags, saved name and link )
BYTES 830000CD8B4F
DODOES
( DOES> thread at 4F56 )
BYTES 564F6A4F1F1220
AT 4FA9

( w4FAE | NFA 4FA9 CFA 4FAE )
( Unknown erased name; CFA identifier )
AT 4FA9
( Header: flags, saved name and link )
BYTES 8200CC9A4F
DOVAR
CELL 0000
AT 4FB2

( w4FB9 | NFA 4FB2 CFA 4FB9 )
( Unknown erased name; CFA identifier )
AT 4FB2
( Header: flags, saved name and link )
BYTES 84000000D9A94F
DOCOL
w4F73 t.C@ w4F82 t.C@ w4F91 t.C@ t.* t.+ t.;S
AT 4FCD

( w4FD4 | NFA 4FCD CFA 4FD4 )
( Unknown erased name; CFA identifier )
AT 4FCD
( Header: flags, saved name and link )
BYTES 84000000A1B24F
DOCOL
t.-DUP
t.0BRANCH CELL 0068 ( -> 5042 )
t.DUP w4FAE t.! t.0 t.<
t.0BRANCH CELL 000C ( -> 4FF4 )
w4F82 t.C@ t.0=_12DE
t.BRANCH CELL 000C ( -> 4FFE )
( label 4FF4 )
w4F82 t.C@ w4FA0 t.C@ t.=
( label 4FFE )
t.0=_12DE
t.0BRANCH CELL 0040 ( -> 5042 )
w4FB9 w4F91 t.C@ t.1+ w4FAE t.@ t.* w4FAE t.@ t.(DO)
( label 5018 )
t.DUP t.I t.+ w4F68 t.@ t.0=_12DE
t.0BRANCH CELL 0008 ( -> 502E )
w4E81
t.BRANCH CELL 0004 ( -> 5030 )
( label 502E )
w4F1E
( label 5030 )
w4FAE t.@
t.(+LOOP) CELL FFE2 ( -> 5018 )
t.DROP w4FAE t.@ w4F82 w4C79
( label 5042 )
t.;S
AT 5044

( JOYSTICK-TRIGGER | NFA 5044 CFA 504C )
( Inferred descriptive name, not recovered original: Reads )
( Atari hardware trigger $D010 plus the joystick number and )
( masks bit zero; zero means pressed. )
AT 5044
( Header: flags, saved name and link )
BYTES 8500000000C7CD4F
DOCOL
LIT16 D010 t.+ t.C@ t.1 t.AND t.;S
AT 505C

( -1 | NFA 505C CFA 5061 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $4F47 [-1] in contiguous 3-definition sequence )
( matching header flags, name suffix, word kind and body )
( size. GAM FORTH 11_A_Graf.ATR CFA $9612, identical body )
( after known address relocation; surviving name length and )
( suffix match )
AT 505C
( Header: flags, saved name and link )
BYTES 8200B14450
DOCON
CELL FFFF
AT 5065

( w506B | NFA 5065 CFA 506B )
( Unknown erased name; CFA identifier )
AT 5065
( Header: flags, saved name and link )
BYTES 830000D45C50
DODOES
( DOES> thread at 383C )
BYTES 3C38CD14CD14CD14C514615061506150C514C514C514C5147712
AT 5087

( w508D | NFA 5087 CFA 508D )
( Unknown erased name; CFA identifier )
AT 5087
( Header: flags, saved name and link )
BYTES 830000D46550
DODOES
( DOES> thread at 383C )
BYTES 3C38CD146150C514C514CD146150C514C514CD146150C5147712
AT 50A9

( JOYSTICK-DELTA | NFA 50A9 CFA 50B2 )
( Inferred descriptive name, not recovered original: Reads )
( STICK0 at $0278 plus joystick index, subtracts five, and )
( maps through two direction tables. )
AT 50A9
( Header: flags, saved name and link )
BYTES 860000000000D98750
DOCOL
LIT16 0278 t.+ t.C@ LIT16 0005 t.- t.DUP w506B t.SWAP w508D
t.;S
AT 50CC

( w50D2 | NFA 50CC CFA 50D2 )
( Unknown erased name; CFA identifier )
AT 50CC
( Header: flags, saved name and link )
BYTES 830000CDA950
DOCOL
LIT16 003E LIT16 022F t.C! t.1 LIT16 026F t.C! LIT16 00A0
w4E11 w4E2E w4DDB w4E42 t.;S
AT 50F4

( w50FC | NFA 50F4 CFA 50FC )
( Unknown erased name; CFA identifier )
AT 50F4
( Header: flags, saved name and link )
BYTES 8500000000A1CC50
DOCOL
t.1 w4F68 t.! LIT8 21 t.+ w4F73 t.C! t.0 w4F68 t.! LIT8 04 t.*
LIT8 32 t.+ w4F73 t.C! t.;S
AT 5123

( w512A | NFA 5123 CFA 512A )
( Unknown erased name; CFA identifier )
AT 5123
( Header: flags, saved name and link )
BYTES 84000000A1F450
DOCOL
t.0 w4F68 t.! t.1 t.- w4FA0 t.1+ t.C! t.1 t.- w4FA0 t.C! t.;S
AT 5146

( w514D | NFA 5146 CFA 514D )
( Unknown erased name; CFA identifier )
AT 5146
( Header: flags, saved name and link )
BYTES 84000000A12351
DOCOL
t.0 w4F68 t.! w4F91 t.1+ t.C! w4F91 t.C! t.;S
AT 5161

( w5166 | NFA 5161 CFA 5166 )
( Unknown erased name; CFA identifier )
AT 5161
( Header: flags, saved name and link )
BYTES 8200D04651
DOVAR
BYTES 000005414C4C4F542020202020202020
AT 5178

( w517D | NFA 5178 CFA 517D )
( Unknown erased name; CFA identifier )
AT 5178
( Header: flags, saved name and link )
BYTES 8200D06151
DOCOL
w5166 t.C@ t.2+ w5166 t.+ t.! t.2 w5166 w4C79 t.;S
AT 5193

( P | NFA 5193 CFA 5197 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 5193
( Header: flags, saved name and link )
BYTES 81D07851
DOCOL
w5166 t.DUP t.C@ t.+ t.@ t.;S
AT 51A5

( w51AA | NFA 51A5 CFA 51AA )
( Unknown erased name; CFA identifier )
AT 51A5
( Header: flags, saved name and link )
BYTES 8200BE9351
DOCOL
w5166 t.C@ w5166 t.+ t.@ w5166 t.C@
t.0BRANCH CELL 000A ( -> 51C6 )
LIT16 FFFE w5166 w4C79
( label 51C6 )
t.;S
AT 51C8

( w51D0 | NFA 51C8 CFA 51D0 )
( Unknown erased name; CFA identifier )
AT 51C8
( Header: flags, saved name and link )
BYTES 8500000000D9A551
DOCOL
t.<BUILDS t.2 t.* t.ALLOT t.DOES>
( Trailing code/data at 51DC; retained exactly )
BYTES 8D13D5140F2004137712
AT 51E6

( w51EC | NFA 51E6 CFA 51EC )
( Unknown erased name; CFA identifier )
AT 51E6
( Header: flags, saved name and link )
BYTES 830000D9C851
DODOES
( DOES> thread at 51DC )
BYTES DC512020202020202020202020202020
AT 51FE

( w5204 | NFA 51FE CFA 5204 )
( Unknown erased name; CFA identifier )
AT 51FE
( Header: flags, saved name and link )
BYTES 830000D9E651
DOCOL
w5166 t.C@ w51EC t.@ t.0 w4F68 t.! w4F82 t.! t.;S
AT 521A

( w5220 | NFA 521A CFA 5220 )
( Unknown erased name; CFA identifier )
AT 521A
( Header: flags, saved name and link )
BYTES 830000D9FE51
DOCOL
t.0 w4F68 t.! w4F82 t.@ w5166 t.C@ w51EC t.! t.;S
AT 5236

( w523C | NFA 5236 CFA 523C )
( Unknown erased name; CFA identifier )
AT 5236
( Header: flags, saved name and link )
BYTES 830000D91A52
DOCOL
t.0 w4F68 t.! w4DB2 w4C63 t.2 t./ w4F82 t.1+ t.C! t.2 t./ t.1
t.- w4F82 t.C! t.;S
AT 5260

( w5266 | NFA 5260 CFA 5266 )
( Unknown erased name; CFA identifier )
AT 5260
( Header: flags, saved name and link )
BYTES 830000CD3652
DOCOL
w5166 t.C@
t.0BRANCH CELL 000A ( -> 5278 )
w4C90 w4C63
t.BRANCH CELL 0008 ( -> 527E )
( label 5278 )
LIT16 0004 t.0
( label 527E )
w50FC w4DB2 w4C63 w512A LIT16 0004 LIT8 06 w514D t.;S
AT 5291

( w5298 | NFA 5291 CFA 5298 )
( Unknown erased name; CFA identifier )
AT 5291
( Header: flags, saved name and link )
BYTES 84000000C06052
DOCOL
w4DB2 t.C@ t.* t.+ w4DB2 t.+ t.2+ t.C@ t.;S
AT 52AC

( w52B3 | NFA 52AC CFA 52B3 )
( Unknown erased name; CFA identifier )
AT 52AC
( Header: flags, saved name and link )
BYTES 84000000D99152
DOCOL
w4CA2 t.@ LIT16 0006 t./ t.* t.+ w4C99 t.@ t.+ t.;S
AT 52CB

( w52D1 | NFA 52CB CFA 52D1 )
( Unknown erased name; CFA identifier )
AT 52CB
( Header: flags, saved name and link )
BYTES 830000C2AC52
DOCOL
w4DB2 t.C@ t.SWAP t.OVER w4DB2 t.2+ t.SWAP w52B3 w4CAB t.;S
AT 52E7

( w52ED | NFA 52E7 CFA 52ED )
( Unknown erased name; CFA identifier )
AT 52E7
( Header: flags, saved name and link )
BYTES 830000C1CB52
DOCOL
t.0 w4D9F t.! w482A t.2+ t.DUP w4C63 w4DB2 t.1+ t.C! t.2 t.*
w4DB2 t.C! w5266 w523C w52D1 t.;S
AT 5313

( w5319 | NFA 5313 CFA 5319 )
( Unknown erased name; CFA identifier )
AT 5313
( Header: flags, saved name and link )
BYTES 830000C1E752
DOCOL
t.1 w4D9F t.! w482A t.2+ t.DUP w4DB2 t.2 t.CMOVE w52D1 t.;S
AT 5331

( w5337 | NFA 5331 CFA 5337 )
( Unknown erased name; CFA identifier )
AT 5331
( Header: flags, saved name and link )
BYTES 830000C11353
DOCOL
w482A t.2+ w52D1 t.;S
AT 5341

( w5346 | NFA 5341 CFA 5346 )
( Unknown erased name; CFA identifier )
AT 5341
( Header: flags, saved name and link )
BYTES 8200B03153
CELL 5348 ( native entry point )
LDA.# C0             ( 5348 )
STA.ZP F4            ( 534A )
LDX.# 04             ( 534C )
LDA.INDY F0          ( 534E )
STA.ZP FA            ( 5350 )
LDA.ZP F4            ( 5352 )
AND.INDY F2          ( 5354 )
BEQ 5365             ( 5356 )
LDA.ZP F4            ( 5358 )
EOR.# FF             ( 535A )
AND.ZP FA            ( 535C )
STA.ZP FA            ( 535E )
INC.ZP FC            ( 5360 )
JMP.ABS 5377         ( 5362 )
LDA.ZP FC            ( 5365 )
CMP.# 02             ( 5367 )
BCC 5373             ( 5369 )
LDA.ZP F4            ( 536B )
EOR.# FF             ( 536D )
AND.ZP FA            ( 536F )
STA.ZP FA            ( 5371 )
LDA.# 00             ( 5373 )
STA.ZP FC            ( 5375 )
LSR.ZP F4            ( 5377 )
LSR.ZP F4            ( 5379 )
DEX                  ( 537B )
BNE 5352             ( 537C )
RTS                  ( 537E )
AT 537F

( w5384 | NFA 537F CFA 5384 )
( Unknown erased name; CFA identifier )
AT 537F
( Header: flags, saved name and link )
BYTES 8200CD4153
DOVAR
CELL 0000
AT 5388

( w538D | NFA 5388 CFA 538D )
( Unknown erased name; CFA identifier )
AT 5388
( Header: flags, saved name and link )
BYTES 8200AA7F53
CELL 538F ( native entry point )
LDA.ABS 5386         ( 538F )
BNE 539B             ( 5392 )
LDA.INDY F2          ( 5394 )
STA.INDY F0          ( 5396 )
JMP.ABS 53A7         ( 5398 )
JSR.ABS 5348         ( 539B )
SEC                  ( 539E )
BCC 53A7             ( 539F )
LDA.INDY F2          ( 53A1 )
ORA.ZP FA            ( 53A3 )
STA.INDY F0          ( 53A5 )
RTS                  ( 53A7 )
AT 53A8

( w53AE | NFA 53A8 CFA 53AE )
( Unknown erased name; CFA identifier )
AT 53A8
( Header: flags, saved name and link )
BYTES 830000C98853
CELL 53B0 ( native entry point )
LDY.# 00             ( 53B0 )
JSR.ABS 538F         ( 53B2 )
INY                  ( 53B5 )
CPY.ZP F7            ( 53B6 )
BNE 53B2             ( 53B8 )
RTS                  ( 53BA )
AT 53BB

( w53C1 | NFA 53BB CFA 53C1 )
( Unknown erased name; CFA identifier )
AT 53BB
( Header: flags, saved name and link )
BYTES 830000CFA853
CELL 53C3 ( native entry point )
LDA.# 00             ( 53C3 )
STA.ZP FC            ( 53C5 )
JSR.ABS 53B0         ( 53C7 )
LDA.ZP F6            ( 53CA )
CLC                  ( 53CC )
ADC.ZP F2            ( 53CD )
STA.ZP F2            ( 53CF )
BCC 53D5             ( 53D1 )
INC.ZP F3            ( 53D3 )
LDA.ZP F9            ( 53D5 )
CLC                  ( 53D7 )
ADC.ZP F0            ( 53D8 )
STA.ZP F0            ( 53DA )
BCC 53E0             ( 53DC )
INC.ZP F1            ( 53DE )
DEC.ZP F8            ( 53E0 )
BNE 53C7             ( 53E2 )
RTS                  ( 53E4 )
AT 53E5

( w53ED | NFA 53E5 CFA 53ED )
( Unknown erased name; CFA identifier )
AT 53E5
( Header: flags, saved name and link )
BYTES 8500000000C5BB53
CELL 53EF ( native entry point )
STX.ZP D1            ( 53EF )
JSR.ABS 53C3         ( 53F1 )
LDX.ZP D1            ( 53F4 )
JMP.ABS 0F47         ( 53F6 )
AT 53F9

( w53FE | NFA 53F9 CFA 53FE )
( Unknown erased name; CFA identifier )
AT 53F9
( Header: flags, saved name and link )
BYTES 8200D3E553
DOCOL
t.GRAPHICS-BASE t.@ t.SWAP w4C63 LIT8 28 t.* t.+ t.+ t.;S
AT 5413

( w541A | NFA 5413 CFA 541A )
( Unknown erased name; CFA identifier )
AT 5413
( Header: flags, saved name and link )
BYTES 84000000AAF953
DOCOL
w3B05 t.C! t.2+ w3ACC t.! w4C63 w3AFC t.C! t.DUP w3AE8 t.C!
w3AF2 t.C! w53ED t.;S
AT 543A

( w5441 | NFA 543A CFA 5441 )
( Unknown erased name; CFA identifier )
AT 543A
( Header: flags, saved name and link )
BYTES 84000000C21354
DOCOL
t.DUP w53FE w3AC3 t.! t.2+ t.DUP LIT8 28 w541A t.;S
AT 5456

( w545D | NFA 5456 CFA 545D )
( Unknown erased name; CFA identifier )
AT 5456
( Header: flags, saved name and link )
BYTES 84000000C63A54
DOCOL
w481B w4C90 w4C63 w4CE1 w4C90 LIT16 0004 t.+ w4C90 t.2+ t.C@
w4CC8 w3AC3 t.! t.2+ t.DUP w4C90 t.2+ t.C@ w541A t.;S
AT 5489

( w548F | NFA 5489 CFA 548F )
( Unknown erased name; CFA identifier )
AT 5489
( Header: flags, saved name and link )
BYTES 830000C35654
DOCON
CELL 0A00
AT 5493

( w5498 | NFA 5493 CFA 5498 )
( Unknown erased name; CFA identifier )
AT 5493
( Header: flags, saved name and link )
BYTES 8200D48954
DOCON
CELL 0B90
AT 549C

( w54A3 | NFA 549C CFA 54A3 )
( Unknown erased name; CFA identifier )
AT 549C
( Header: flags, saved name and link )
BYTES 84000000BE9354
DOCOL
w4C90 w548F LIT16 0004 t.CMOVE LIT8 28 w3AE8 t.C! w548F w53FE
w3ACC t.! w548F LIT16 0004 t.+ w3AC3 t.! w548F t.2+ w4C63
w3AFC t.C! t.DUP w3B05 t.C! w3AF2 t.C! w53ED t.;S
AT 54E2

( w54E8 | NFA 54E2 CFA 54E8 )
( Unknown erased name; CFA identifier )
AT 54E2
( Header: flags, saved name and link )
BYTES 830000B09C54
DOCON
CELL 8D4D
AT 54EC

( w54F2 | NFA 54EC CFA 54F2 )
( Unknown erased name; CFA identifier )
AT 54EC
( Header: flags, saved name and link )
BYTES 830000C5E254
DOCOL
w54E8 w3F74 t.;S
AT 54FA

( w5500 | NFA 54FA CFA 5500 )
( Unknown erased name; CFA identifier )
AT 54FA
( Header: flags, saved name and link )
BYTES 830000C2EC54
DOVAR
BYTES 02000A00
AT 5506

( w550D | NFA 5506 CFA 550D )
( Unknown erased name; CFA identifier )
AT 5506
( Header: flags, saved name and link )
BYTES 84000000CDFA54
DOVAR
CELL 0000
AT 5511

( w5517 | NFA 5511 CFA 5517 )
( Unknown erased name; CFA identifier )
( Decoded text: Inventory display slots )
( item 0 display $5522: [81]           [62] )
( item 1 display $5534: [ED]           [84] )
( item 2 display $5546: [81]           [62] )
( item 3 display $5558: [ED]           [84] )
( item 4 display $556A: [81]           [62] )
( item 5 display $557C: [ED]           [84] )
( item 6 display $558E: [81]           [62] )
( item 7 display $55A0: [ED]           [84] )
AT 5511
( Header: flags, saved name and link )
BYTES 830000C90655
DODOES
( DOES> thread at 3F4E )
BYTES 4E3F90001000000000813D3D3D3D3D3D3D3D3D3D3D621000000000ED
BYTES 3D3D3D3D3D3D3D3D3D3D3D841000000000813D3D3D3D3D3D3D3D3D3D
BYTES 3D621000000000ED3D3D3D3D3D3D3D3D3D3D3D841000000000813D3D
BYTES 3D3D3D3D3D3D3D3D3D621000000000ED3D3D3D3D3D3D3D3D3D3D3D84
BYTES 1000000000813D3D3D3D3D3D3D3D3D3D3D621000000000ED3D3D3D3D
BYTES 3D3D3D3D3D3D3D84
AT 55AD

( w55B4 | NFA 55AD CFA 55B4 )
( Unknown erased name; CFA identifier )
AT 55AD
( Header: flags, saved name and link )
BYTES 84000000D91155
DODOES
( DOES> thread at 51DC )
BYTES DC5116481B480C30163C07481F3C0748122A1F3C1B3C07481B421A36
BYTES 1F3C19421F3C1736122A525A0748163C0748163C1B421A3C1B42122A
BYTES 122A5AB2
AT 55F2

( w55F8 | NFA 55F2 CFA 55F8 )
( Unknown erased name; CFA identifier )
AT 55F2
( Header: flags, saved name and link )
BYTES 830000B2AD55
DODOES
( DOES> thread at 51DC )
BYTES DC511F481A2A0A480A480A480A480A480A480A480A480F4813481748
BYTES 8442083C152A083C152A0E3C08480E3C1A2A4C4F
AT 562A

( w5631 | NFA 562A CFA 5631 )
( Unknown erased name; CFA identifier )
AT 562A
( Header: flags, saved name and link )
BYTES 84000000CBF255
DOVAR
BYTES 01000541
AT 5637

( w563E | NFA 5637 CFA 563E )
( Unknown erased name; CFA identifier )
AT 5637
( Header: flags, saved name and link )
BYTES 84000000C92A56
DODOES
( DOES> thread at 51DC )
BYTES DC51202020202020
AT 5648

( w564E | NFA 5648 CFA 564E )
( Unknown erased name; CFA identifier )
AT 5648
( Header: flags, saved name and link )
BYTES 830000C23756
DOVAR
BYTES 0B0001000006000C00000000000E000300086C0003002CCED002008F
BYTES CB180003000000000400278B0000030090D20002002CDF02002B0009
BYTES 00030000000002008F00080002001E00020090D90800020000000200
BYTES 8F00120004003B00000002003ADB02003AD102002BE3120003001E19
BYTES 00020090D702008F0003002C3E000C000200000002002C0002003AE4
BYTES 1400020000000200310002003200020032CD02002BD50D0003009600
BYTES 00020032E002003100110003003B00000200A1CC02003AE502000000
BYTES 08000200A20002008F6807000500A340A4780007000500A340A47800
BYTES 0400020040A41C000200000002006ECF02006ED002006ED102006ECC
BYTES 02006ECD02006ECE090003000E0000020035DD110003007200000200
BYTES 770002007700020077000400020000000D00030000000002008ACB02
BYTES 0095DE1300010000020027DA02002700020096DB020095DC11000300
BYTES 150000020027D80200310002008ADF170003008C0000040088D4D5D6
BYTES 020025000200890002002600040002009300
AT 57CE

( w57D6 | NFA 57CE CFA 57D6 )
( Unknown erased name; CFA identifier )
AT 57CE
( Header: flags, saved name and link )
BYTES 8500000000CD4856
DOCON
CELL 0018
AT 57DA

( w57E0 | NFA 57DA CFA 57E0 )
( Unknown erased name; CFA identifier )
AT 57DA
( Header: flags, saved name and link )
BYTES 830000D0CE57
DOVAR
BYTES 0000000000000000000000000000000000000000000000000020
AT 57FC

( w5802 | NFA 57FC CFA 5802 )
( Unknown erased name; CFA identifier )
AT 57FC
( Header: flags, saved name and link )
BYTES 830000D9DA57
DODOES
( DOES> thread at 51DC )
BYTES DC510000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000000000000000000000000000D4F8
AT 5838

( w583D | NFA 5838 CFA 583D )
( Unknown erased name; CFA identifier )
AT 5838
( Header: flags, saved name and link )
BYTES 8200D4FC57
DOVAR
CELL 0000
AT 5841

( w5846 | NFA 5841 CFA 5846 )
( Unknown erased name; CFA identifier )
AT 5841
( Header: flags, saved name and link )
BYTES 8200D43858
DOVAR
CELL 0000
AT 584A

( w584F | NFA 584A CFA 584F )
( Unknown erased name; CFA identifier )
AT 584A
( Header: flags, saved name and link )
BYTES 8200CB4158
DOVAR
CELL 000C
AT 5853

( w585A | NFA 5853 CFA 585A )
( Unknown erased name; CFA identifier )
AT 5853
( Header: flags, saved name and link )
BYTES 84000000D24A58
DOVAR
CELL 0001
AT 585E

( w5865 | NFA 585E CFA 5865 )
( Unknown erased name; CFA identifier )
AT 585E
( Header: flags, saved name and link )
BYTES 84000000D35358
DOVAR
BYTES 0500020000000300
AT 586F

( w5876 | NFA 586F CFA 5876 )
( Unknown erased name; CFA identifier )
AT 586F
( Header: flags, saved name and link )
BYTES 84000000C55E58
DOVAR
CELL 0000
AT 587A

( w5880 | NFA 587A CFA 5880 )
( Unknown erased name; CFA identifier )
AT 587A
( Header: flags, saved name and link )
BYTES 830000CE6F58
DOCOL
LIT8 CA t.- t.2 t.* t.2 t.+ t.;S
AT 5891

( w5898 | NFA 5891 CFA 5898 )
( Unknown erased name; CFA identifier )
AT 5891
( Header: flags, saved name and link )
BYTES 84000000D47A58
DOCOL
t.DUP w5880 t.>R t.1 w5384 t.C! t.R w54F2 t.2+ w481B w4D62
LIT8 CA t.- w55B4 w4C63 w481B t.1+ t.C! w481B t.C! w545D t.R>
t.1+ w54F2 t.2+ w52D1 t.0 w5384 t.C! t.;S
AT 58D7

( w58DE | NFA 58D7 CFA 58DE )
( Unknown erased name; CFA identifier )
AT 58D7
( Header: flags, saved name and link )
BYTES 84000000D09158
DOCOL
t.DUP w4D31 t.1+ w52ED t.;S
AT 58EA

( w58F0 | NFA 58EA CFA 58F0 )
( Unknown erased name; CFA identifier )
AT 58EA
( Header: flags, saved name and link )
BYTES 830000D4D758
DOCOL
t.DUP w4D31 t.DUP w482A w3F5F t.+ t.@
t.0BRANCH CELL 000A ( -> 590C )
t.1+ w5337
t.BRANCH CELL 0004 ( -> 590E )
( label 590C )
t.DROP
( label 590E )
t.;S
AT 5910

( w5916 | NFA 5910 CFA 5916 )
( Unknown erased name; CFA identifier )
AT 5910
( Header: flags, saved name and link )
BYTES 830000D4EA58
DOCOL
t.DUP w4D7C t.1+ w5319 t.;S
AT 5922

( w5928 | NFA 5922 CFA 5928 )
( Unknown erased name; CFA identifier )
AT 5922
( Header: flags, saved name and link )
BYTES 830000D41059
DOCOL
t.DUP w4D8E t.1+ w5337 t.;S
AT 5934

( w593A | NFA 5934 CFA 593A )
( Unknown erased name; CFA identifier )
AT 5934
( Header: flags, saved name and link )
BYTES 830000D72259
DOCON
CELL 8CC1
AT 593E

( w5943 | NFA 593E CFA 5943 )
( Unknown erased name; CFA identifier )
AT 593E
( Header: flags, saved name and link )
BYTES 8200D73459
DOCOL
LIT8 64 t./MOD t.2 t.* t.SWAP t.;S
AT 5952

( w5958 | NFA 5952 CFA 5958 )
( Unknown erased name; CFA identifier )
AT 5952
( Header: flags, saved name and link )
BYTES 830000D73E59
DOCOL
t.DUP t.1 t.>
t.0BRANCH CELL 001D ( -> 597F )
t.DUP LIT8 C8 t.>
t.0BRANCH CELL 0008 ( -> 5975 )
t.1
t.BRANCH CELL 0008 ( -> 597B )
( label 5975 )
w5943 w485C t.2
( label 597B )
t.BRANCH CELL 0006 ( -> 5983 )
( label 597F )
t.DROP t.0
( label 5983 )
t.;S
AT 5985

( w598B | NFA 5985 CFA 598B )
( Unknown erased name; CFA identifier )
AT 5985
( Header: flags, saved name and link )
BYTES 830000C25259
DOCOL
t.>R w3F5F t.R> t.(DO)
( label 5995 )
t.DUP t.I t.+ t.C@ w5958
t.0BRANCH CELL 0004 ( -> 59A5 )
w58F0
( label 59A5 )
t.(LOOP) CELL FFEE ( -> 5995 )
t.DROP t.;S
AT 59AD

( w59B4 | NFA 59AD CFA 59B4 )
( Unknown erased name; CFA identifier )
AT 59AD
( Header: flags, saved name and link )
BYTES 84000000D28559
DOCOL
t.1 t.- t.1 w593A w4849 w593A t.2+ t.DUP t.2+ t.C@ w485C t.0
w58DE t.1 w598B t.;S
AT 59D6

( w59DC | NFA 59D6 CFA 59DC )
( Unknown erased name; CFA identifier )
AT 59D6
( Header: flags, saved name and link )
BYTES 830000C2AD59
DOCOL
t.SWAP w564E w3F74 t.2+ w3F74 t.;S
AT 59EA

( w59F0 | NFA 59EA CFA 59F0 )
( Unknown erased name; CFA identifier )
AT 59EA
( Header: flags, saved name and link )
BYTES 830000CDD659
DOCOL
t.DUP w550D t.! t.DUP w59B4 t.0 w59DC t.0 w598B t.;S
AT 5A06

( w5A0C | NFA 5A06 CFA 5A0C )
( Unknown erased name; CFA identifier )
AT 5A06
( Header: flags, saved name and link )
BYTES 830000AAEA59
CELL 5A0E ( native entry point )
LDY.# 00             ( 5A0E )
LDA.INDY F2          ( 5A10 )
STA.INDY F0          ( 5A12 )
INY                  ( 5A14 )
INY                  ( 5A15 )
DEY                  ( 5A16 )
STY.ZP F6            ( 5A17 )
LDY.# 01             ( 5A19 )
LDA.INDY F2          ( 5A1B )
LDY.ZP F6            ( 5A1D )
STA.INDY F0          ( 5A1F )
INY                  ( 5A21 )
INY                  ( 5A22 )
CPY.ZP F7            ( 5A23 )
BNE 5A16             ( 5A25 )
DEY                  ( 5A27 )
STY.ZP F6            ( 5A28 )
LDY.# 02             ( 5A2A )
LDA.INDY F2          ( 5A2C )
LDY.ZP F6            ( 5A2E )
STA.INDY F0          ( 5A30 )
RTS                  ( 5A32 )
AT 5A33

( w5A39 | NFA 5A33 CFA 5A39 )
( Unknown erased name; CFA identifier )
AT 5A33
( Header: flags, saved name and link )
BYTES 830000D3065A
CELL 5A3B ( native entry point )
LDA.ZP F7            ( 5A3B )
JSR.ABS 3B69         ( 5A3D )
RTS                  ( 5A40 )
AT 5A41

( w5A47 | NFA 5A41 CFA 5A47 )
( Unknown erased name; CFA identifier )
AT 5A41
( Header: flags, saved name and link )
BYTES 830000CC335A
CELL 5A49 ( native entry point )
LDA.# 03             ( 5A49 )
CLC                  ( 5A4B )
ADC.ZP F2            ( 5A4C )
STA.ZP F2            ( 5A4E )
BCC 5A54             ( 5A50 )
INC.ZP F3            ( 5A52 )
RTS                  ( 5A54 )
AT 5A55

( w5A5B | NFA 5A55 CFA 5A5B )
( Unknown erased name; CFA identifier )
AT 5A55
( Header: flags, saved name and link )
BYTES 830000B6415A
CELL 5A5D ( native entry point )
LDX.# 06             ( 5A5D )
DEC.ZP F8            ( 5A5F )
JSR.ABS 5A0E         ( 5A61 )
JSR.ABS 5A49         ( 5A64 )
JSR.ABS 5A3B         ( 5A67 )
DEX                  ( 5A6A )
BNE 5A61             ( 5A6B )
RTS                  ( 5A6D )
AT 5A6E

( w5A74 | NFA 5A6E CFA 5A74 )
( Unknown erased name; CFA identifier )
AT 5A6E
( Header: flags, saved name and link )
BYTES 830000C7555A
CELL 5A76 ( native entry point )
STX.ZP D1            ( 5A76 )
JSR.ABS 5A5D         ( 5A78 )
JSR.ABS 3B43         ( 5A7B )
JSR.ABS 3B31         ( 5A7E )
JSR.ABS 5A5D         ( 5A81 )
LDA.# 00             ( 5A84 )
CMP.ZP F8            ( 5A86 )
BNE 5A7E             ( 5A88 )
JSR.ABS 5A5D         ( 5A8A )
LDX.ZP D1            ( 5A8D )
JMP.ABS 0F47         ( 5A8F )
AT 5A92

( w5A98 | NFA 5A92 CFA 5A98 )
( Unknown erased name; CFA identifier )
AT 5A92
( Header: flags, saved name and link )
BYTES 830000C26E5A
DOCOL
w5943 w47D0 t.DROP w4C90 t.SWAP LIT16 0004 w3DAC t.-1 w4C90
t.+! LIT16 FFFA w4C90 t.1+ t.+! t.2 w4C90 t.2+ t.+! LIT16 000C
w4C90 t.3 t.+ t.+! t.1 w4D9F t.! w4C90 t.2+ w4DB2 t.2 t.CMOVE
w4DB2 t.1+ t.DUP t.C@ LIT16 0006 t./ t.SWAP t.C! w4DB2 w4C63
t.* w4DB2 t.2+ t.SWAP t.ERASE t.2 w485C t.0 w482A LIT16 0004
t.+ w3ACC t.! w4C90 LIT16 0004 t.+ w3AC3 t.! w4DB2 w4C63 t.1
t.- w3C17 w5A74 t.;S
AT 5B2A

( w5B30 | NFA 5B2A CFA 5B30 )
( Unknown erased name; CFA identifier )
AT 5B2A
( Header: flags, saved name and link )
BYTES 830000C2925A
DOCOL
t.(DO)
( label 5B34 )
t.DUP t.I t.+ t.C@ w5958 t.-DUP
t.0BRANCH CELL 0012 ( -> 5B54 )
t.1 t.=
t.0BRANCH CELL 0008 ( -> 5B52 )
w5898
t.BRANCH CELL 0004 ( -> 5B54 )
( label 5B52 )
w5928
( label 5B54 )
t.(LOOP) CELL FFDE ( -> 5B34 )
t.DROP t.;S
AT 5B5C

( w5B61 | NFA 5B5C CFA 5B61 )
( Unknown erased name; CFA identifier )
AT 5B5C
( Header: flags, saved name and link )
BYTES 8200C22A5B
DOCOL
w550D t.@ t.SWAP w59DC t.DUP t.2+ t.C@ w5A98 w3F5F t.0 w5B30
t.;S
AT 5B7B

( w5B80 | NFA 5B7B CFA 5B80 )
( Unknown erased name; CFA identifier )
AT 5B7B
( Header: flags, saved name and link )
BYTES 8200BC5C5B
DOCOL
w548F w5441 t.;S
AT 5B88

( w5B8D | NFA 5B88 CFA 5B8D )
( Unknown erased name; CFA identifier )
AT 5B88
( Header: flags, saved name and link )
BYTES 8200DA7B5B
DOCOL
t.DUP w5B61 w5166 t.C@ t.0=_12DE
t.0BRANCH CELL 0004 ( -> 5B9F )
w54A3
( label 5B9F )
w517D w4C90 w5441 w5266 t.;S
AT 5BA9

( w5BB0 | NFA 5BA9 CFA 5BB0 )
( Unknown erased name; CFA identifier )
AT 5BA9
( Header: flags, saved name and link )
BYTES 84000000CC885B
DOCOL
w5220 w5B8D w523C t.;S
AT 5BBA

( w5BC1 | NFA 5BBA CFA 5BC1 )
( Unknown erased name; CFA identifier )
AT 5BBA
( Header: flags, saved name and link )
BYTES 84000000CCA95B
DOCOL
t.P w5B61 w4C90 w5441 t.;S
AT 5BCD

( w5BD4 | NFA 5BCD CFA 5BD4 )
( Unknown erased name; CFA identifier )
AT 5BCD
( Header: flags, saved name and link )
BYTES 84000000CCBA5B
DOCOL
w51AA t.DROP w5166 t.C@
t.0BRANCH CELL 0008 ( -> 5BE8 )
w5BC1
t.BRANCH CELL 000A ( -> 5BF0 )
( label 5BE8 )
w5B80 t.0 w4D9F t.!
( label 5BF0 )
w5266 w5204 t.;S
AT 5BF6

( w5BFC | NFA 5BF6 CFA 5BFC )
( Unknown erased name; CFA identifier )
AT 5BF6
( Header: flags, saved name and link )
BYTES 830000DACD5B
DOCOL
w5166 t.C@
t.0BRANCH CELL 0004 ( -> 5C08 )
w5B80
( label 5C08 )
w5220 t.1 w517D t.0 t.1 w59DC t.DUP t.2+ t.C@ w5958
t.0BRANCH CELL 0004 ( -> 5C22 )
w5916
( label 5C22 )
w3F5F t.1 w5B30 w54A3 w4C90 w5441 w523C w5266 t.;S
AT 5C34

( w5C3A | NFA 5C34 CFA 5C3A )
( Unknown erased name; CFA identifier )
AT 5C34
( Header: flags, saved name and link )
BYTES 830000DAF65B
DOCOL
w51AA t.DROP w5B80 t.0 w4D9F t.! w5266 w5166 t.C@ t.-DUP
t.0BRANCH CELL 001E ( -> 5C70 )
t.2 t.=
t.0BRANCH CELL 000C ( -> 5C66 )
w51AA w5B8D w5204
t.BRANCH CELL 000C ( -> 5C70 )
( label 5C66 )
w51AA w51AA w5B8D w5B8D w5204
( label 5C70 )
w5266 w5204 t.;S
AT 5C76

( w5C7C | NFA 5C76 CFA 5C7C )
( Unknown erased name; CFA identifier )
AT 5C76
( Header: flags, saved name and link )
BYTES 830000C3345C
DOVAR
CELL 0001
AT 5C80

( w5C88 | NFA 5C80 CFA 5C88 )
( Unknown erased name; CFA identifier )
AT 5C80
( Header: flags, saved name and link )
BYTES 8500000000CB765C
DOCOL
t.>R t.1 w463A t.!
( label 5C92 )
t.1 w3FC5 t.! t.0 LIT8 78 t.R w46BE t.DROP t.2DROP
t.LAST-DISK-STATUS t.@ t.0=_12DE w5C7C t.@ t.*
t.0BRANCH CELL 0019 ( -> 5CCC )
t.0 w3FC5 t.! t.0 w54F2 LIT8 3C t.R t.1+ w46BE t.DROP t.2DROP
( label 5CCC )
t.LAST-DISK-STATUS t.@ t.0=_12DE
t.0BRANCH CELL FFBE ( -> 5C92 )
t.R> t.DROP t.;S
AT 5CDC

( NIC | NFA 5CDC CFA 5CE2 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $7146 [NIC] in contiguous 3-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 42_A_GrafDos.ATR CFA $A4BE, )
( identical body after known address relocation; surviving )
( name length and suffix match )
AT 5CDC
( Header: flags, saved name and link )
BYTES 830000C3805C
DOCOL
t.;S
AT 5CE6

( w5CEC | NFA 5CE6 CFA 5CEC )
( Unknown erased name; CFA identifier )
AT 5CE6
( Header: flags, saved name and link )
BYTES 830000C1DC5C
DOVAR
CELL 0000
AT 5CF0

( w5CF6 | NFA 5CF0 CFA 5CF6 )
( Unknown erased name; CFA identifier )
AT 5CF0
( Header: flags, saved name and link )
BYTES 830000C4E65C
DOVAR
CELL 0001
AT 5CFA

( w5D00 | NFA 5CFA CFA 5D00 )
( Unknown erased name; CFA identifier )
AT 5CFA
( Header: flags, saved name and link )
BYTES 82004BA0F05C
DOVAR
CELL 0001
AT 5D04

( w5D09 | NFA 5D04 CFA 5D09 )
( Unknown erased name; CFA identifier )
AT 5D04
( Header: flags, saved name and link )
BYTES 8200C7FA5C
DOCOL
( label 5D0B )
t.0 t.JOYSTICK-TRIGGER LIT8 05 t.WAIT-FRAMES
t.0BRANCH CELL FFF5 ( -> 5D0B )
t.;S
AT 5D1A

( w5D20 | NFA 5D1A CFA 5D20 )
( Unknown erased name; CFA identifier )
AT 5D1A
( Header: flags, saved name and link )
BYTES 830000CC045D
DOCOL
( Trailing code/data at 5D22; retained exactly )
BYTES 2105287712
AT 5D27

( w5D2E | NFA 5D27 CFA 5D2E )
( Unknown erased name; CFA identifier )
AT 5D27
( Header: flags, saved name and link )
BYTES 84000000DA1A5D
DOCOL
LIT8 FF LIT16 02FC t.C! w50D2 w5D09 t.1 w4F68 t.! w4FB9 w4F1E
t.0 w4F68 t.! w4FB9 w4E81
( label 5D51 )
t.NIC t.0 LIT8 4D t.C! t.0 t.JOYSTICK-DELTA t.1 w4F68 t.!
w4FD4 t.0 w4F68 t.! w4FD4 LIT16 02FC t.C@ LIT8 FF t.=
t.0=_12DE
t.0BRANCH CELL 0033 ( -> 5DB0 )
w5166 t.C@ t.0=_12DE w5D00 t.@ t.*
t.0BRANCH CELL 001A ( -> 5DA7 )
LIT16 02FC t.C@ LIT16 5D22 t.3 w3896 w5CF6 t.@ t.* w5CEC t.!
( label 5DA7 )
LIT8 FF LIT16 02FC t.C!
( label 5DB0 )
t.0 t.JOYSTICK-TRIGGER t.0=_12DE w5CEC t.@ t.+
t.0BRANCH CELL FF93 ( -> 5D51 )
t.0 w4F68 t.! w4F82 t.C@ w4F82 t.1+ t.C@ w4E57 t.;S
AT 5DD4

( w5DDA | NFA 5DD4 CFA 5DDA )
( Unknown erased name; CFA identifier )
AT 5DD4
( Header: flags, saved name and link )
BYTES 830000B2275D
DOVAR
BYTES 34E8DC14182C2A5420
AT 5DE5

( w5DEB | NFA 5DE5 CFA 5DEB )
( Unknown erased name; CFA identifier )
AT 5DE5
( Header: flags, saved name and link )
BYTES 830000C9D45D
DOCOL
w42E2 w4307 t.! LIT16 A701 w42CA LIT16 A7E4 w42CA w4346 w42E2
LIT16 0006 t.+ t.C@ LIT16 02C7 t.C! t.;S
AT 5E13

( w5E1A | NFA 5E13 CFA 5E1A )
( Unknown erased name; CFA identifier )
AT 5E13
( Header: flags, saved name and link )
BYTES 84000000D0E55D
DOCOL
w5DDA w42E2 LIT16 0007 t.CMOVE w5DEB t.;S
AT 5E2A

( w5E2F | NFA 5E2A CFA 5E2F )
( Unknown erased name; CFA identifier )
AT 5E2A
( Header: flags, saved name and link )
BYTES 8200CA135E
DOCON
CELL 8CB9
AT 5E33

( w5E3A | NFA 5E33 CFA 5E3A )
( Unknown erased name; CFA identifier )
AT 5E33
( Header: flags, saved name and link )
BYTES 84000000DA2A5E
DOVAR
CELL 0000
AT 5E3E

( SAVED-DMA-CONTROL | NFA 5E3E CFA 5E44 )
( Inferred descriptive name, not recovered original: )
( Receives the previous Atari SDMCTL $022F value before )
( display DMA is disabled. )
AT 5E3E
( Header: flags, saved name and link )
BYTES 830000C7335E
DOVAR
CELL 0000
AT 5E48

( DISPLAY-OFF | NFA 5E48 CFA 5E4E )
( Inferred descriptive name, not recovered original: Saves )
( SDMCTL $022F and writes zero to disable display DMA. )
AT 5E48
( Header: flags, saved name and link )
BYTES 830000C13E5E
DOCOL
LIT16 022F t.C@ t.SAVED-DMA-CONTROL t.! t.0 LIT16 022F t.C!
t.;S
AT 5E64

( RESTORE-DISPLAY | NFA 5E64 CFA 5E6A )
( Inferred descriptive name, not recovered original: )
( Restores the saved value of SDMCTL $022F. )
AT 5E64
( Header: flags, saved name and link )
BYTES 830000C9485E
DOCOL
t.SAVED-DMA-CONTROL t.@ LIT16 022F t.C! t.;S
AT 5E78

( INITIALIZE-AUDIO | NFA 5E78 CFA 5E81 )
( Inferred descriptive name, not recovered original: Native )
( routine passes the audio data address and initialization )
( selector to the embedded player entry $3003. )
AT 5E78
( Header: flags, saved name and link )
BYTES 860000000000DA645E
CELL 5E83 ( native entry point )
STX.ZP D1            ( 5E83 )
LDX.ABS 5E3C         ( 5E85 )
LDY.ABS 5E3D         ( 5E88 )
LDA.# 70             ( 5E8B )
JSR.ABS 3003         ( 5E8D )
LDX.# 00             ( 5E90 )
TXA                  ( 5E92 )
JSR.ABS 3003         ( 5E93 )
LDX.ZP D1            ( 5E96 )
JMP.ABS 0F47         ( 5E98 )
AT 5E9B

( w5EA0 | NFA 5E9B CFA 5EA0 )
( Unknown erased name; CFA identifier )
AT 5E9B
( Header: flags, saved name and link )
BYTES 8200D3785E
DOVAR
CELL 0000
AT 5EA4

( w5EAA | NFA 5EA4 CFA 5EAA )
( Unknown erased name; CFA identifier )
AT 5EA4
( Header: flags, saved name and link )
BYTES 830000CE9B5E
CELL 5EAC ( native entry point )
STX.ZP D1            ( 5EAC )
LDX.ABS 5EA2         ( 5EAE )
LDA.# 00             ( 5EB1 )
JSR.ABS 3003         ( 5EB3 )
LDX.ZP D1            ( 5EB6 )
JMP.ABS 0F47         ( 5EB8 )
AT 5EBB

( SELECT-AUDIO-SEQUENCE | NFA 5EBB CFA 5EC2 )
( Inferred descriptive name, not recovered original: Stores )
( the requested audio sequence then invokes the embedded )
( player via the adjacent native helper. )
AT 5EBB
( Header: flags, saved name and link )
BYTES 84000000C7A45E
DOCOL
w5EA0 t.! w5EAA t.;S
AT 5ECC

( STOP-AUDIO | NFA 5ECC CFA 5ED6 )
( Inferred descriptive name, not recovered original: Native )
( call to embedded player $3003 with selector $40; called )
( when the title is skipped. )
AT 5ECC
( Header: flags, saved name and link )
BYTES 87000000000000C7BB5E
CELL 5ED8 ( native entry point )
STX.ZP D1            ( 5ED8 )
LDA.# 40             ( 5EDA )
JSR.ABS 3003         ( 5EDC )
LDX.ZP D1            ( 5EDF )
JMP.ABS 0F47         ( 5EE1 )
AT 5EE4

( w5EEA | NFA 5EE4 CFA 5EEA )
( Unknown erased name; CFA identifier )
AT 5EE4
( Header: flags, saved name and link )
BYTES 830000CDCC5E
DOVAR
CELL 0000
AT 5EEE

( w5EF5 | NFA 5EEE CFA 5EF5 )
( Unknown erased name; CFA identifier )
AT 5EEE
( Header: flags, saved name and link )
BYTES 84000000DAE45E
CELL 5EF7 ( native entry point )
LDA.ABS 5EEC         ( 5EF7 )
BNE 5F0E             ( 5EFA )
LDA.ABS D01F         ( 5EFC )
CMP.# 03             ( 5EFF )
BNE 5F0B             ( 5F01 )
LDA.# 40             ( 5F03 )
JSR.ABS 3003         ( 5F05 )
INC.ABS 5EEC         ( 5F08 )
JMP.ABS 5F1D         ( 5F0B )
LDA.ABS D01F         ( 5F0E )
CMP.# 05             ( 5F11 )
BNE 5F1D             ( 5F13 )
LDA.# 60             ( 5F15 )
JSR.ABS 3003         ( 5F17 )
DEC.ABS 5EEC         ( 5F1A )
JSR.ABS 3006         ( 5F1D )
RTS                  ( 5F20 )
AT 5F21

( w5F26 | NFA 5F21 CFA 5F26 )
( Unknown erased name; CFA identifier )
AT 5F21
( Header: flags, saved name and link )
BYTES 8200C9EE5E
DOVAR
CELL 0000
AT 5F2A

( w5F30 | NFA 5F2A CFA 5F30 )
( Unknown erased name; CFA identifier )
AT 5F2A
( Header: flags, saved name and link )
BYTES 830000DA215F
CELL 5F32 ( native entry point )
STX.ZP D1            ( 5F32 )
LDA.# 21             ( 5F34 )
LDX.ABS 5F28         ( 5F36 )
LDY.ABS 5F29         ( 5F39 )
JSR.ABS 3003         ( 5F3C )
LDX.ZP D1            ( 5F3F )
JMP.ABS 0F47         ( 5F41 )
AT 5F44

( w5F4A | NFA 5F44 CFA 5F4A )
( Unknown erased name; CFA identifier )
AT 5F44
( Header: flags, saved name and link )
BYTES 830000AA2A5F
DOCOL
w5F26 t.1+ t.C! w5F26 t.C! w5F30 t.;S
AT 5F5A

( w5F60 | NFA 5F5A CFA 5F60 )
( Unknown erased name; CFA identifier )
AT 5F5A
( Header: flags, saved name and link )
BYTES 830000CF445F
DODOES
( DOES> thread at 51DC )
BYTES DC51202028073709C800370B280F202084045A076E05A012B4166407
BYTES AA0E28096902B906600599110C033C131E155A15445AD755
AT 5F96

( w5F9C | NFA 5F96 CFA 5F9C )
( Unknown erased name; CFA identifier )
AT 5F96
( Header: flags, saved name and link )
BYTES 830000D75A5F
DOCOL
w5EEA t.@
t.0BRANCH CELL 000C ( -> 5FB0 )
w5F60 w4C63 w5F4A
t.BRANCH CELL 0004 ( -> 5FB2 )
( label 5FB0 )
t.DROP
( label 5FB2 )
t.;S
AT 5FB4

( w5FBB | NFA 5FB4 CFA 5FBB )
( Unknown erased name; CFA identifier )
AT 5FB4
( Header: flags, saved name and link )
BYTES 84000000A1965F
DOCOL
w5E2F LIT16 076C t.- w5E3A t.! t.;S
AT 5FCB

( INITIALIZE-GAME-DISPLAY | NFA 5FCB CFA 5FD1 )
( Inferred descriptive name, not recovered original: )
( Disables the display, installs game display resources and )
( font at $BC00, initializes audio, then restores DMA. )
AT 5FCB
( Header: flags, saved name and link )
BYTES 830000CCB45F
DOCOL
t.1 LIT16 02F0 t.C! t.DISPLAY-OFF w5FBB LIT8 0C w5E3A t.@
LIT16 0006 t.- w4838 t.INITIALIZE-AUDIO t.0
t.SELECT-AUDIO-SEQUENCE w4C4D w5E1A LIT16 0007 LIT16 BC00
w4838 LIT16 00BC LIT16 02F4 t.C! t.RESTORE-DISPLAY t.;S
AT 6010
