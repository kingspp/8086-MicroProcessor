;##################################################################
;# 8086 Program to transfer a String from One location to another #
;#       Author: kingspp                                          #
;##################################################################
;Declaration Part
.MODEL SMALL
.DATA
STR1 DB 09H, "MAHARAJA",'$'  ; STR1 is the given string to be transferred
STR2 DB ?                    ; STR2 is the location for the transfer
ST1 DB 09H, "STR1:$"         ; To display STR1:
ST2 DB 09H, "STR2:$"         ; To display STR2:
LEN DB 0AH                   ; Length of the String is loaded Here
.CODE
START: MOV AX,@DATA
MOV DS,AX
MOV ES,AX
LEA SI,STR1                  ; Location of STR1 is loaded to SI
LEA DI,STR2                  ; Location of STR2 is loaded to DI

;To display STR1:
LEA DX,ST1
MOV AH,09H
INT 21H

;To display contents of STR1
LEA DX,STR1
MOV AH,09H
INT 21H

;To display STR2:
LEA DX,ST2
MOV AH,09H
INT 21H

;Transferring Part
CLD                           ; Clear the contents of Direction Flag
MOV CH,00H                    ; Since CX should be 00xx
MOV CL,LEN
REP MOVSB                     ; Repeat the transfer untill CL=0

;To display the transferred contents of STR1 to STR2
LEA DX,STR2
MOV AH,09H
INT 21H

;Program Termination
MOV AH,4CH
INT 21H
END START
