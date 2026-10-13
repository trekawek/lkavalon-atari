( EDITOR )

: 1LINE   #LAG PAD COUNT MATCH R#
          +! ;


: FIND   BEGIN 3FF R# @ < IF TOP
         PAD HERE C/L 1+ CMOVE 0
         ERROR ENDIF 1LINE UNTIL
         ;

: DELETE   >R #LAG + FORTH R -
       #LAG R MINUS R# +! #LEAD
       + SWAP CMOVE R> BLANKS
       UPDATE ;
-->
