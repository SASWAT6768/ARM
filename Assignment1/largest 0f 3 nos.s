     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		         
        MOV R0,#31			;SETTING FIRST 	VALUE
		MOV R1,#30			;SETTING SECOND VALUE
		MOV R2,#7          ;SETTING THIRD VALUE
		MOV R5,#0x20000000
		CMP R0,R1			;Comparing R0,R1 and storing maximum in R3
		BPL R0GR1 
		MOV R3,R1			
		B R2R3
R0GR1	MOV R3,R0

R2R3	CMP R3,R2			;Comparing R3,R2 and storing maximum in R3
		BPL endstr
		MOV R3,R2
endstr 	STR R3,[r5]			;Output is stored in 0x20000000
	
		 
     ENDFUNC
     END
