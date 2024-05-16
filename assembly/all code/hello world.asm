.model small
.stack 100h
.data
myvar db 'Hellow word', '$'

.code
main:

mov ax, @data
mov ds, ax

; load address of the string  
lea dx, myvar

; Function to print string 
mov ah, 09h
int 21h

;interrupt to exit
mov ah, 4ch
int 21h

end main