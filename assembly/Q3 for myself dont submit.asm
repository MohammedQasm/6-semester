;https://tshahab.com/assembly-language/check-input-number-is-even-or-odd/
;https://programsinengineering.blogspot.com/2015/09/program-to-check-whether-number-is-even_98.html


;group members:

; Mohammed Qasm
; Muhammad Shamsadin
; Mustafa Jawhar
; Redyar Rafat


.model small
.stack 100h
.data
    ev db 'Even$'
    od db 'Odd$'
    msg db 10, 13, 'Enter a number: $'
    num db ?
.code
main:
    mov ax, @data
    mov ds, ax

    mov dx, offset msg ; display message
    mov ah, 9
    int 21h

    mov ah, 1          ; read character from standard input
    int 21h
    sub al, 30h        ; convert ASCII to number
    mov num, al

    mov bl, 2
    div bl
    cmp ah, 0
    je IsEven
    mov dx, 10
    mov ah, 2
    int 21h
    mov dx, 13
    mov ah, 2
    int 21h
    mov dx, offset od
    mov ah, 9
    int 21h
    jmp Done
IsEven:
    mov dx, 10
    mov ah, 2
    int 21h
    mov dx, 13
    mov ah, 2
    int 21h
    mov dx, offset ev
    mov ah, 9
    int 21h
Done:
    mov ah, 4ch
    int 21h
end main
