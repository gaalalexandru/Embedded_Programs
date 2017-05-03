; OSasm.s: low-level OS commands, written in assembly                       
; Runs on LM4F120/TM4C123 will be ported to MSP432 in next version
; ssOS - stupid simple Operating System
; A very simple real time operating system with minimal features.
; For copyright, configuration and usage read readme.txt

	AREA |.text|, CODE, READONLY, ALIGN=2
	THUMB
	REQUIRE8
	PRESERVE8

	EXTERN  RunPt	; currently running thread
	EXPORT  StartOS
	EXPORT  SysTick_Handler
	IMPORT  Scheduler

SysTick_Handler		; 1) Saves R0-R3,R12,LR,PC,PSR
    CPSID   I		; 2) Prevent interrupt during switch
    PUSH {R4-R11}	;saves registers R4 to R11
    LDR R0,=RunPt	;load address of RunPt to R0
    LDR R1,[R0]		;R1 = RunPt
    STR SP,[R1]		;save current SP to tcbs.sp
    PUSH {R0,LR}
    BL Scheduler
    POP {R0,LR}
    LDR R1,[R0]		; 6) R1 = RunPt, new thread
    LDR SP,[R1]		;load new SP, SP = RunPt.sp
    POP {R4-R11}	;load registers from stack
    CPSIE   I		; 9) tasks run with interrupts enabled
    BX      LR		; 10) restore R0-R3,R12,LR,PC,PSR

StartOS
    LDR     R0, =RunPt	; currently running thread, load address of RunPt to R0
    LDR     R2, [R0]	; R2 = value of RunPt
    LDR     SP, [R2]	; new thread SP, SP = RunPt->stackPointer, load address of RunPt to R0
    POP     {R4-R11}	; restore regs r4-11
    POP     {R0-R3}		; restore regs r0-3
    POP     {R12}
    ADD     SP,SP,#4	; discard LR from initial stack, move to next element
    POP     {LR}		; start location
    ADD     SP,SP,#4	; discard PSR, move to next element
    CPSIE   I			; Enable interrupts at processor level
    BX      LR			; start first thread
    ALIGN
    END
