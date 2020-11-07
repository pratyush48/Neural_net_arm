     PRESERVE8
	 AREA     factorial, CODE, READONLY
     EXPORT __main
	IMPORT printMsg
	IMPORT printNext
	IMPORT ADDComma
	IMPORT printWelcome
     ENTRY 

	 
;-------------------------INPUT 0 -> 000
;								1 -> 001
;								........
;								7 -> 111


__EXP FUNCTION;(INPUT = S0)
	PUSH {LR}
	
	MOV R1,#500;
	VMOV.F32 S1,#1.0;	NUMERATOR
	VMOV.F32 S2,#1.0;	DENOMINATOR
	VMOV.F32 S3,#1.0;	FINAL OUTPUT
	VMOV.F32 S4,#1.0;	CONTAINS ONLY 1 TO INCREMENT

LOOP	VMUL.F32 S1,S1,S0;	S1 = S1*X
		VDIV.F32 S1,S1,S2;	S1 = S1/N
		VADD.F32 S3,S3,S1;	S3 = S3+S1
		VADD.F32 S2,S2,S4;	N++
		SUB R1,R1,#1;	
		CMP R1,#0;
		BNE LOOP;	LOOP BACK
							
		POP {LR};	OUTPUT IN S3	
		BX lr
		LTORG
	
		
	ENDFUNC
	
__SIGMOID FUNCTION
	PUSH {LR}
	
	VNEG.F32 S0,S6;	NEGATION OF S6
	BL __EXP; EXPONENTIAL SERIES
	VLDR.F32 S1,=1.0;	S1 IS NUMERATOR
	VADD.F32 S1,S0,S3;	1+E^X
	VDIV.F32 S6,S0,S1;	1/(1+E^X)
	
	POP {LR}
	BX lr
	LTORG
	
	ENDFUNC
	
	
__COMPUTE FUNCTION;{;X = W1*A1 + W2*A2 + W3*A3 + W4*A4 + B
					;Y = 1/(1+e^-x)
					;OUT(LOGIC)=(Y>=0.5)}
	
	PUSH {LR}
	VMOV.F32 S0,R4;
	VCVT.F32.S32 S0,S0;	INTEGER TO FLOAT
	VMOV.F32 S1,R5
	VCVT.F32.S32 S1,S1
	VMOV.F32 S2,R6
	VCVT.F32.S32 S2,S2
	VMOV.F32 S15,R7
	VCVT.F32.S32 S15,S15
	
	VMUL.F32 S7,S3,S0
	VADD.F32 S6,S6,S7	;x=B + W1*A1
	CMP R0,#1;	NOT LOGIC
	BEQ PERCEPTRON
	VMUL.F32 S7,S4,S1
	VADD.F32 S6,S6,S7
	VMUL.F32 S7,S5,S2
	VADD.F32 S6,S6,S7	;x=B + W1*A1 + W2*A2 + W3*A3
	CMP R0,#3;	OTHER 3 INPUT LOGIC
	BEQ PERCEPTRON
	VMUL.F32 S7,S16,S15
	VADD.F32 S6,S6,S7	;x=B + W1*A1 + W2*A2 + W3*A3 + W4*A4

PERCEPTRON	BL __SIGMOID
		MOV R0,#0
		VLDR.F32 S0,=0.5
		VCMP.F32 S6,S0
		VMRS APSR_nzcv, FPSCR
		BLT ENDIT
		MOV R0,#1

ENDIT		POP {LR}
		BX lr
		LTORG
	
	ENDFUNC
	
__AND FUNCTION
		
		PUSH {LR}
		VLDR.F32 S3,=-0.1		;W1
		VLDR.F32 S4,=0.2		;W2
		VLDR.F32 S5,=0.2		;W3
		VLDR.F32 S6,=-0.2		;B
		MOV R0,#3;`3-INPUT
		BL __COMPUTE
		
		POP {LR}
		BX lr
		LTORG
	
	ENDFUNC
	
__OR FUNCTION

		PUSH {LR}
		VLDR.F32 S3,=-0.1		;W1
		VLDR.F32 S4,=0.7		;W2
		VLDR.F32 S5,=0.7		;W3
		VLDR.F32 S6,=-0.1		;B
		MOV R0,#3
		BL __COMPUTE
		
		POP {LR}
		BX lr
		LTORG
		
		ENDFUNC
		
__NOT FUNCTION
		
		PUSH {LR}
		VLDR.F32 S3,=0.5		;W1
		VLDR.F32 S6,=0.1		;B
		MOV R0,#1; 1-INPUT
		BL __COMPUTE
		
		POP {LR}
		BX lr
		LTORG
		
		ENDFUNC

__XOR FUNCTION
		
		PUSH {LR}
		
		;HIDDEN LAYER 1
		VLDR.F32 S3,=-2.0		;W1
		VLDR.F32 S4,= 2.0		;W2
		VLDR.F32 S5,=-2.0		;W3
		VLDR.F32 S6,=-1.0		;B
		MOV R0,#3
		BL __COMPUTE
		PUSH {R0}
		
		VLDR.F32 S3,= 2.0		;W1
		VLDR.F32 S4,=-2.0		;W2
		VLDR.F32 S5,=-2.0		;W3
		VLDR.F32 S6,=-1.0		;B
		MOV R0,#3
		BL __COMPUTE
		PUSH {R0}
		
		VLDR.F32 S3,=-2.0		;W1
		VLDR.F32 S4,=-2.0		;W2
		VLDR.F32 S5,= 2.0		;W3
		VLDR.F32 S6,=-1.0		;B
		MOV R0,#3
		BL __COMPUTE
		PUSH {R0}
		
		VLDR.F32 S3,= 2.0		;W1
		VLDR.F32 S4,= 2.0		;W2
		VLDR.F32 S5,= 2.0		;W3
		VLDR.F32 S6,=-5.0		;B
		MOV R0,#3
		BL __COMPUTE
		PUSH {R0}
		
		;HIDDEN LAYER 2
		
		POP {R4-R7}
		VLDR.F32 S3,= 2.0		;W1
		VLDR.F32 S4,= 2.0		;W2
		VLDR.F32 S5,= 2.0		;W3
		VLDR.F32 S16,=2.0		;W3		
		VLDR.F32 S6,=-1.0		;B
		MOV R0,#4
		BL __COMPUTE
		
		
		POP {LR}
		BX lr
		LTORG
		
		ENDFUNC
		
__XNOR FUNCTION
		PUSH {LR}
		
		;HIDDEN LAYER 1
		VLDR.F32 S3,=-2.0		;W1
		VLDR.F32 S4,= 2.0		;W2
		VLDR.F32 S5,=-2.0		;W3
		VLDR.F32 S6,=-1.0		;B
		MOV R0,#3
		BL __COMPUTE
		PUSH {R0}
		
		VLDR.F32 S3,= 2.0		;W1
		VLDR.F32 S4,=-2.0		;W2
		VLDR.F32 S5,=-2.0		;W3
		VLDR.F32 S6,=-1.0		;B
		MOV R0,#3
		BL __COMPUTE
		PUSH {R0}
		
		VLDR.F32 S3,=-2.0		;W1
		VLDR.F32 S4,=-2.0		;W2
		VLDR.F32 S5,= 2.0		;W3
		VLDR.F32 S6,=-1.0		;B
		MOV R0,#3
		BL __COMPUTE
		PUSH {R0}
		
		VLDR.F32 S3,= 2.0		;W1
		VLDR.F32 S4,= 2.0		;W2
		VLDR.F32 S5,= 2.0		;W3
		VLDR.F32 S6,=-5.0		;B
		MOV R0,#3
		BL __COMPUTE
		PUSH {R0}
		
		;HIDDEN LAYER 2
		
		POP {R4-R7}
		VLDR.F32 S3,= -2.0		;W1
		VLDR.F32 S4,= -2.0		;W2
		VLDR.F32 S5,= -2.0		;W3
		VLDR.F32 S16,=-2.0		;W3		
		VLDR.F32 S6,= 1.0		;B
		MOV R0,#4
		BL __COMPUTE
		
		
		POP {LR}
		BX lr
		LTORG
		
		ENDFUNC

__NAND FUNCTION
	PUSH {LR}
		VLDR.F32 S3,=-2.0		;W1
		VLDR.F32 S4,=-2.0		;W2
		VLDR.F32 S5,=-2.0		;W3
		VLDR.F32 S6,=5.0		;B
		MOV R0,#3
		BL __COMPUTE
		
		POP {LR}
		BX lr
		LTORG
		
		ENDFUNC
		
__NOR FUNCTION
		PUSH {LR}
		VLDR.F32 S3,=-2.0		;W1
		VLDR.F32 S4,=-2.0		;W2
		VLDR.F32 S5,=-2.0		;W3
		VLDR.F32 S6,=1.0		;B
		MOV R0,#3
		BL __COMPUTE
		
		POP {LR}
		BX lr
		LTORG
		ENDFUNC	

__main  FUNCTION

			MOV R3,#0
START	PUSH {R3}
			MOV R0,R3
			BL printWelcome
			MOV R2,#0
							
NEXTGATE	LSR R4,R2,#2	
			LSL R4,R4,#1	
			LSR R5,R2,#1	
			LSL R5,R5,#1	
			SUB R6,R2,R5	
			
			LSR R5,R5,#1	
			SUB R5,R5,R4	
			LSR R4,R4,#1	
			
			PUSH {R2}
			MOV R0,R2
			
			PUSH {R3}
			BL printMsg
			BL ADDComma

			
			POP {R3}
			
			CMP R3,#0
			BEQ ANDL
			
			CMP R3,#1
			BEQ NANDL
			
			CMP R3,#2
			BEQ ORL
			
			CMP R3,#3
			BEQ NORL
			
			CMP R3,#4
			BEQ NOTL
			
			CMP R3,#5
			BEQ XORL
			
			CMP R3,#6
			BEQ XNORL

			B stop		
ANDL		BL __AND
			B PRINT
NANDL		BL __NAND
			B PRINT
ORL		BL __OR
			B PRINT
NORL		BL __NOR
			B PRINT
NOTL		BL __NOT
			B PRINT
XORL		BL __XOR
			B PRINT
XNORL		BL __XNOR

PRINT	BL printMsg
			BL printNext
			POP {R2}
			ADD R2,#1
			CMP R2,#8
			BNE NEXTGATE
			
			POP {R3}
			ADD R3,R3,#1
			CMP R3,#7
			
			BNE START


stop    B stop ; stop program
     ENDFUNC
     END 