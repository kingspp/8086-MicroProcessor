;################################################################################################
;##   Assembly program to find the reverse of a given word, and check if it is palindrome or not
;##   Author : euhidaman
;################################################################################################


.model small

.data
str1 db 5 dup(?)
rev1 db 5 dup(?)
msg3 db 10,13,"enter the string : $"
msg1 db 10,13,"palindrome$"
msg2 db 10,13,"not palindrome$"
msg4 db 10,13,"reverse string : $"
msg5 db 10,13,"$"

    print macro msg
    lea dx,msg
    mov ah,09h
    int 21h
    endm

.code
mov ax,@data
mov ds,ax
mov si,00
mov cl,00
print msg3
print msg5
back :  mov ah,01H
                int 21H
                cmp al,0Dh
                je next
                mov str1[si],al
                inc si
                inc cl
                jmp back
next :  print msg4
                dec si
                mov bl,cl
                mov di,00h
back2:  mov dl,str1[si]
                mov rev1[di],dl
                mov ah,02h
                int 21h
                inc di
                dec si
                dec bl
                jnz back2
mov di,00
mov si,00
back3:  mov dl,str1[si]
                cmp rev1[di],dl
                jne notpal
                inc si
                inc di
                loop back3
                print msg1
                jmp exit
notpal: print msg2
exit  : mov ah,4ch
        int 21h
        end
