;################################################################################################################
;##   Assembly Program to compare two Strings and print their length, as well as, show if they are Equal or Not
;##   Author : euhidaman
;################################################################################################################


.MODEL SMALL

; macro to read string
GETS MACRO PAR
    MOV AH, 0Ah
    LEA DX, PAR
    INT 21h
ENDM

; macro to display string
PRINT MACRO STR
    LEA DX, STR
    MOV AH, 09h
    INT 21h
ENDM

; macro to display string length
DISP MACRO
    AAM
    MOV BX, AX
    ADD BX, 3030h ; Convert ASCII to number
    MOV AH, 02h
    MOV DL, BH    ; Display higher string length character
    INT 21h
    MOV DL, BL    ; Display lower string length character
    INT 21h
ENDM

.data
      str1 db 40, 0, 40 dup(?)
      str2 db 40, 0, 40 dup(?)
      P1 db 10, 13, "Enter string 1 : $"
      P2 db 10, 13, "Enter string 2 : $"
      msg1 db 10, 13, "Strings are Equal $"
      msg2 db 10, 13, "Strings are Not Equal $"
      M1 db 10, 13, "Length of String 1 : $"
      M2 db 10, 13, "Length of String 2 : $"

.code
      MOV AX, @data
      MOV DS, AX     ; initialize data segment
      MOV ES, AX     ; initialize extra segment

      PRINT P1
      GETS str1     ; read string 1
      PRINT P2
      GETS str2     ; read string 2

      PRINT M1
      MOV AL, str1+1 ; copy string 1 length
      DISP

      PRINT M2
      MOV AL, str2+1 ; copy string 2 length
      DISP

      MOV CX, 40         ; set counter value to string buffer length
      LEA SI, str1+2     ; actual string 1 character starting address
      LEA DI, str2+2    ; actual string 2 character starting address

      REPE CMPSB
      JNE FAIL
      PRINT msg1
      JMP EXIT

FAIL : PRINT msg2
EXIT : MOV AH, 4Ch
       INT 21h
       END
