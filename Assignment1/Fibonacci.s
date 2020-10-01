    THUMB
    AREA     appcode, CODE, READONLY
    EXPORT __main
	 ENTRY 
__main  FUNCTION		         
    MOV R0,#0			;SETTING FIRST 	VALUE
		MOV R1,#1			;SETTING SECOND VALUE
		MOV R3,#0x20000000	;Address for storing Fibonacci values
		MOV R4,#10			;The Nth number in Fibonacci series;here its is given as 10th no.
		
		CMP r4,#1           ;
		BNE elsex           ;		if (R4==1)          
		
		MOV R2,R0           ;		R2=R0
		B endx              ;

elsex 	CMP r4,#2           ;		else if(R4==2)
		BNE elsexx          ;     
		MOV R2,R1           ;
		B endx              ;
elsexx 	SUB R4,R4,#1        ;		Fibonacci values added to R2
		ADD R2,R1,R0        ;
		MOV R0,R1           ;
		MOV R1,R2           ;
		CMP R4,#2           ;
		BNE elsexx          ; 
endx	
		STR R2,[R3]			;		R2 storred in 0x20000000
stop B stop; stop program		
     ENDFUNC
     END

