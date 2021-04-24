;###################################################################
;##   Assembly program to perform linear search among 16-bit numbers
;##   Author : euhidaman
;###################################################################

.model small

.data
    ARR dw 1000h, 2500h, 8500h, 3000h, 9500h
    LEN db ($-ARR)/2
    MSG1 db "FOUND$"
    MSG2 db "NOT FOUND$"
    SE dw 2000h

    PRINT MACRO MESSAGE
      MOV AH,09h
      LEA DX, MESSAGE
      int 21h
    ENDM

.code
        MOV AX, @DATA
        MOV DS,AX
        MOV AX,SE
        LEA SI, ARR
        MOV CL,LEN
UP:    MOV BX, [SI]
       CMP AX, BX
       JE FND
       INC SI
       INC SI
       DEC CX
       JNZ UP
       PRINT MSG2
       JMP exit
FND: PRINT MSG1
exit: MOV AH, 4CH
      INT 21h
      end
