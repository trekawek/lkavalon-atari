( EDITOR )


: CLEAR  SCR ! 10 0 DO FORTH I
         EDITOR E LOOP ;





: COPY   B/SCR * OFFSET @ + SWAP
         B/SCR * B/SCR OVER +
         SWAP DO DUP FORTH I
         BLOCK 2 - ! 1+ UPDATE
         LOOP DROP FLUSH ;
  -->
