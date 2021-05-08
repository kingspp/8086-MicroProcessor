;###############################################################################
;##   Assembly program to perform bubble sort on a given array of 8-bit numbers
;##   Author : euhidaman
;###############################################################################

.model small

.data
    arr db 50h, 10h, 88h, 77h, 44h, 34h
    len equ ($-arr)

.code
    mov ax, @data
    mov ds, ax
    mov cl, len-1

again: mov bl, cl
       mov si, 00h

repeat1:
       mov al, arr[si]
       cmp al,arr[si+1]
       jbe next_label
       xchg al,arr[si+1]
       mov arr[si], al

next_label:
      inc si
      dec bl
      jnz repeat1
      loop again
int 3h
end
