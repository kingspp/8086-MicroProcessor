;######################################################
;##   Assembly program to add two 16-bit numbers
;##   Author : euhidaman
;######################################################


.model small

.data
    a dw 5000h
    b dw 3000h
    res dw ?

.code
    mov ax, @data
    mov ds, ax

    mov ax, a
    mov dx, b
    add dx, ax
    mov res, dx

mov ah, 4ch
int 21h
end
