( FLOATING POINT )

: F@ >R R @ R 2+ @ R> 4 + @ ;
: F! >R R 4 + ! R 2+ ! R> ! ;

: F.TY  BEGIN INBUF @ C@ DUP
       7F AND EMIT 1 INBUF +!
       80 > UNTIL ;


: F. FR0 F@ FSWAP FR0 F! FASC
    F.TY SPACE FR0 F! ;
: F?   F@ F. ;

-->

