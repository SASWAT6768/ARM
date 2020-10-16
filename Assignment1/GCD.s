     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		         
        	MOV R0,#42			;	take any values for A,B A=42
		    MOV R1,#12			;	B=12
		    MOV R2,#0x10000000	;	        address for storing GCD
		
WHILE		CMP R0,R1		;	While(A!=B)
			BEQ ENDLOOP		;
			
			CMP R0,R1		;	if(A>B)
			BLS ELSELOOP	;
			SUB R0,R0,R1	;	A=A-B
			B WHILE			;	else
ELSELOOP	SUB R1,R1,R0	;	B=B-A
			B WHILE			;
			
 
ENDLOOP		STR R0,[R2]		;	Store in 0x10000000
		 
     ENDFUNC
     END
