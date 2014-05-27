;#############################################
;# 8086 Program to SUBTRACT two 4x4 Matrices #
;#       Author: kingspp                     #
;#############################################
;The Subtraction is done in Hexadecimal Form. Since Negetive numbers occur,
;it is difficult to convert them to decimal and the program will be lengthy.
;Note: If the resulting no is FX, It should be taken as DX_AX= FFFFFFFX, where X is the digit.
; Convert it to decimal then.
; Declaration Part
.MODEL SMALL
.DATA
M DB 01H,02H,03H,04H   ; Matrix M is a 4x4 Matrix
N DB 05H,06H,07H,08H   ; Matrix N is a 4x4 Matrix
CNT DB 04H
TEMP DB ?
RES DB ?
.CODE
START: MOV AX,@DATA
MOV DS,AX
MOV CL,CNT             ; CL is loaded with CNT for looping
LEA SI ,M              ; SI is loaded with address of Matrix M
LEA DI,N               ; DI is loaded with address of Matrix N

;Matrix Subtraction Part
L1:MOV AL,[SI]
MOV BL,[DI]
SUB AL,BL              ; Subtract the Matrices
PUSH AX                ; Push the result for storing Operations, Since both SI and DI is used
INC SI
INC DI
LOOP L1
CALL STORE


;Store Part            
STORE PROC
POP AX                 ; POP the Unwanted values first
LEA SI,RES
ADD SI,04H
MOV CL,04H
L2:POP AX              ; POP the last stored result. Here SI is added 4 and then decremented since PUSH-POP follows LIFO Principle
MOV [SI],AL
DEC SI
LOOP L2
INT 3H                 ; Since Storing is completed terminate the program
RET
STORE ENDP

END START
