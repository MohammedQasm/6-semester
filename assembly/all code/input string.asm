.model small
.stack 100h
.data
buffer_size equ 20
input_buffer db buffer_size dup('$')

.code
main:

mov ax, @data
mov ds, ax

mov ah, 0ah
lea dx, input_buffer

int 21h

mov ah, 4ch
int 21h

end main