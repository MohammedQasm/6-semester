.model small
.stack 100h

.data
msg db 10,13, 'please enter number', 10,13, "$"

.code
main:

mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg; display massege 
int 21h 
mov ah,01h
int 21h;input


mov bl,al
mov ah,02h
mov dl, 0ah
int 21h


mov ah,02h;output
mov dl,bl
int 21h
exit:
mov ah,4ch
int 21h

end main
