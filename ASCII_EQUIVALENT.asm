;#############################################################################################################
;##   Assembly Program to read any AlphaNumeric character and display it's equivalent (Hexadecimal)ASCII code
;##   Author : euhidaman
;#############################################################################################################

.model small

    print MACRO msg
    LEA DX, msg
    mov ah, 09h
    int 21h
    ENDM

.data

      msg1 db 10,13,"Enter any AlphaNumeric Character = $"
      msg2 db 10,13,"ASCII equivalent(hexa) is = $"
      res db ?,?

.code

      mov ax,@data
      mov ds,ax
      print msg1

      mov AH,01h   ;read single character
      int 21h

      mov BL, AL   ;copy character for reserving

      mov CL, 4   ;counter for shift
      SHR AL, CL  ;shift right 4 times for HIGHER nibble
      CMP AL, 0AH  ;check if greater thn 0Ah, for proper hexa ASCII number
      JB digit_label
      ADD AL,7  ;add 7, if AL>09

digit_label : ADD AL,30h
      MOV res, AL

      AND BL, 0Fh  ;Masking for LOWER nibble
      CMP BL, 0Ah
      JB digit1_label
      ADD BL,7

digit1_label : ADD BL, 30h
        mov res+1, BL

        print msg2
        MOV DL, res
        MOV AH, 02h
        int 21h

        mov DL, res+1
        mov AH, 02h
        int 21h

mov AH, 4ch
int 21h
END
