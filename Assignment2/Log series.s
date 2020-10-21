	AREA appcode,CODE,READONLY
    EXPORT __main
		ENTRY 
__main  FUNCTION			
		VLDR.F32 S0,=0.5               ;S0=X HERE X HAS TO BE GREATER THAN -1
		MOV R1,#10                      ;(NUMBER OF TERMS) 
	    VMOV.F32 S3,#0.0                  ;store the result of LOG(1+X)
		VMOV.F32 S2,#1.0                  ;DENOMINATOR
		VMOV.F32 S1,#1.0                  ;X^N
OE      VMOV.F32 S6,S4;                  S6=S4
        VDIV.F32 S6,S2,#2.0;             TO CHECK WHETHER ODD OR EVEN
        VMLS.F32 S6,S6,S2,#2.0;               finding MOD; for odd it will be non-zero and for even it is 0
		VCMP.F32 S6,#0;
		IT EQ
		VNEGEQ.F32 S4,S4;
LOOP	VMUL.F32 S1,S1,S0;              ;S1=S1*X
		VDIV.F32 S4,S1,S2               ;S4=S1/N
		//VMOV.F32 S4,S1;
		B OE;
		VADD.F32 S3,S3,S4              ;S3=S3 +/- X^N/N
		VADD.F32 S2,S2,#1.0               ;N++
		SUB R1,R1,#1                    
		CMP R1,#0
		BNE LOOP                        ;BRANCH TO LOOP 
stop    B stop                          ; stop program
     ENDFUNC
	 END
