;#############################################################
;# 8086 Program to 16-Bit Hexadecimal to unpacked decimal no #
;#       Author: kingspp                                     #
;#############################################################
; Declaration
.MODEL SMALL
.DATA
NUM DW 1234H  ; Enter the number Here
ORG 0020H
RES DB ?

.CODE
START:MOV AX,@DATA
MOV DS,AX

MOV AX,NUM    
XOR DX,DX     ; Used to make DX as 0000H
MOV CX,100    
DIV CX        ; Used to get first two LSB
AAM           ; Used to Convert Hexadecimal to Unpackled BCD
XCHG AX,DX    ; Since AX underwent AAM, Its time for DX
AAM           ; Used to Convert Hexadecimal to Unpackled BCD
MOV RES,DH
MOV RES+1,DL
MOV RES+2,AH
MOV RES+3,AL

INT 3H        ; Halt the program, Used due to use of AFDEBUG
END START
