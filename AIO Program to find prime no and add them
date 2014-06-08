;##################################################################
;# 8086 AIO (All in One)Program to Print and add Prime Numbers    #
;#       Author: kingspp                                          #
;##################################################################

;NUM is assigned to the Number to be checked
;AL is used as the default no
;BL is used as Dividing Variable. It is Incremented in each loop
;BH is used to know the number of variables which can divide the Number. BH>02, The number is not prime
;BL is made to run x number of times, where x is the given number.

; Declaration Part
.MODEL SMALL
.DATA
CNT DB 05H      ;Enter the NO required  here
TEMP DB ?       ;Used as a Temporary Variable
RES DB ?        ;Used to print the Prime Numbers
RESF DW ?       ;Used to Print the sum of all Prime Numbers
COUNT DB ?      ;Used for looping during the addition of Prime Numbers
.CODE

START: MOV AX,@DATA
MOV DS,AX
MOV CL,CNT
LEA SI,RES
MOV COUNT,00H

;Declarations
MOV AL,03H
MOV TEMP,AL
MOV [SI],01H
INC SI
MOV [SI],02H
INC SI
MOV [SI],03H
INC SI

;Prime Number Part
L2:             ; L2 is used to Increment the value of AL. I.e, to go to next digit
MOV AL,TEMP     ; Old value of AL
INC AL          ; Next Digit
MOV TEMP,AL     ; New value of AL
MOV BL,02H      ; The Dividing starts from 2, Hence BH is compare to 02H
MOV BH,00H      ; Initialize
MOV DX,0000H    ; To avoid Divide overflow error
MOV AH,00H      ; To avoid Divide overflow error

;Loop to check for Prime No
L1:             ; L1 is used to check for Prime numbers. I.e, to increase the divisor
DIV BL
CMP AH,00H      ; Remainder is compared with 00H (AH)
JNE NEXT
INC BH          ; BH is incremented if the Number is divisible by current value of BL
NEXT:CMP BH,02H ; If BH > 02H, There is no need to proceed, It is not a Prime
JE  L2          ; The no is not a Prime No,. hence jump to next number
INC BL          ; Increment BL, Next Divisor for same Number
MOV AX,0000H    ; To avoid Divide overflow error
MOV DX,0000H    ; To avoid Divide overflow error
MOV AL,TEMP     ; To store Old value for AL, so that for we can Increment to next Digit
CMP BL,TEMP     ; Run the loop until BL matches Number. I.e, Run loop x no of times, where x is the Number given
JNE L1          ; Jump to check again with incremented value of BL
MOV AL,TEMP     ; To store the old value of AL
CMP BH,01H      ; The num is not prime if BH=1, 
JNE PRIME
L3:LOOP L2      ; Jump to L@. I.e, Perform Looping operation for next Digit
JMP ADDITION    ; When CL=0, L3 Completes and then it jumps to Addition

;Prime Number Storage Part
PRIME:
ADD AX,0000H
DAA             ; 0B in hexa is a prime Number, It is used to Convert that to Decimal. I.e, 11
MOV [SI],AL     ; This is used to store only the prime Numbers
INC SI
INC COUNT       ; Count is used to get the no of Only the prime Numbers, which is used in looping during Addition
JMP L3

;Addition Part
ADDITION:
LEA SI,RES      ; The original location is loaded to SI. I.e, where 1 is present
MOV CL,COUNT    ; CL is Initialized with the number of Prime Numbers Stored
MOV AX,0000H
L4:ADD AL,[SI]
DAA             ; Decimal Adjust After Addition
INC SI
LOOP L4
MOV RESF,AX     ; The Final addition of all the Prime Numbers is present in location RESF

EXIT:           ; Terminate the Program
INT 3H
END START
