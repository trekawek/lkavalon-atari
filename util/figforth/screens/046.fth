( ASSEMBLER )
    HEX
: X)  01 MODE ! ;   ( [ADDR,X]  )
: #   09 MODE ! ;   ( IMMEDIATE )
: )Y  11 MODE ! ;   ( [ADDR],Y  )
: ,X  1D MODE ! ;   ( ADDR,X    )
: ,Y  19 MODE ! ;   ( ADDR,Y    )


00 M0 ORA, 20 M0 AND, 40 M0 EOR,
60 M0 ADC, 80 M0 STA, A0 M0 LDA,
C0 M0 CMP, E0 M0 SBC,

: BIT,   256< IF 24 C, C, ELSE
         2C C, , THEN ;
-->
