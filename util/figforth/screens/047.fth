( ASSEMBLER )

: STOREADD  C, 256<  IF C, ELSE ,
            THEN 0D MODE ! ;

: ZPAGE      OVER 100 < IF F7 AND
             THEN  ;
: XYMODE  MODE @ 19 = MODE @ 1D
          = OR ;
: M1  <BUILDS C, DOES> C@ MODE @
      1D = IF 10 ELSE 0 THEN OR
      ZPAGE STOREADD ;

0E M1 ASL, 2E M1 ROL, 4E M1 LSR,
6E M1 ROR, CE M1 DEC, EE M1 INC,
-->
