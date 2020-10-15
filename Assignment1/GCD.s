     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		         
        	MOV R0,#42			;	A=32
		    MOV R1,#12			;	B=16
		    MOV R2,#0x20000000	;	
		
WHILE		CMP R0,R1		;	While(A!=B)
			BEQ ENDLOOP		;
			
			CMP R0,R1		;	if(A>B)
			BLS ELSELOOP	;
			SUB R0,R0,R1	;	A=A-B
			B WHILE			;	else
ELSELOOP	SUB R1,R1,R0	;	B=B-A
			B WHILE			;
			
 
ENDLOOP		STR R0,[R2]		;	Store data back to 0x20000000
		 
     ENDFUNC
     END
