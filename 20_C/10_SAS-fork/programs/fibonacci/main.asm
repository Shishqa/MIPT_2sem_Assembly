	JMP 	start_
	
start_:
    
    PUSH    77
    OUTC
    PUSH    58
    OUTC
	IN
	POP		cx

    PUSH    78
    OUTC
    PUSH    61
    OUTC
	IN
	POP		dx

	PUSH	cx
	PUSH	1
	JE		all_
	JMP		one_
	
one_:

	MOV	    dx ax
	CALL 	fibonacci	; ax == n, bx == F_n
	PUSH	bx
	OUT		
    PUSH    10
    OUTC
	JMP		end_
	
all_:

	MOV	    0 ax
	JMP		cycle
	
cycle:

	PUSH	ax
	PUSH	dx
	JA		cycle_end
	MOV	    0 bx
	CALL 	fibonacci	; ax == n, bx == F_n
	PUSH 	bx
	OUT 	
    PUSH    10
    OUTC
	PUSH	ax
	PUSH	1
	ADD
	POP		ax
	JMP		cycle

cycle_end:

	JMP		end_
	
end_:
	END
	
;==========================================================

fibonacci:
	PUSH	ax
	PUSH 	ax
	PUSH 	0
	JE 		F_0
	PUSH 	ax
	PUSH 	1
	JE 		F_1
	
	PUSH 	ax
	PUSH 	1
	SUB
	
	PUSH 	ax
	PUSH 	2
	SUB
	
	POP		ax
	CALL 	fibonacci
	POP		ax
	PUSH	bx
	CALL	fibonacci
	PUSH	bx
	ADD
	JMP		fib_return
	
F_0:
	PUSH 	0
	JMP 	fib_return
F_1:
	PUSH 	1
	JMP 	fib_return
	
fib_return:
	POP 	bx
	POP		ax
	RET

;==========================================================

