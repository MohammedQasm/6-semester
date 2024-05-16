.model small
.stack 100h
.data
msg db 'number from 1 to 10 $'
newline db 10, 13, '$'
.code
main:
mov ax, @data
mov ds, ax
mov ah, 09h
lea dx, msg
int 21h
mov cx, 10
mov si, 0
print_loop:
mov ax, si
add ax, 30h
mov dl, al
mov ah, 02h
int 21h   
inc si
loop print_loop
mov ah, 4ch
int 21h
end main