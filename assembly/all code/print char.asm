.model small
.data 
.stack
.code
main:
mov ah, 02h; Set AH for character output
mov dl,41h
int 21h
end main
