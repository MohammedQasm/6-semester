.model small
.stack
.data
msg db 'Enter num ', '$'

.code
main:

mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg
int 21h

mov ah, 08h
int 21h

mov bl, al

mov ah, 02h
mov dl, 0ah
int 21h

mov ah, 02h
mov dl, bl
int 21h

end main