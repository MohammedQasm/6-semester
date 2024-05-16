;group members:

; Mohammed Qasm
; Muhammad Shamsadin
; Mustafa Jawhar
; Redyar Rafat

.model small       ; lera modele memory dakain ba small wata small bakar denen ama bo programe bchuck gunjawa

.stack 100h        ; lera stack segment danasenen ka nrxe 100 ba hexa pe dawa

.data              ; Am line bo dyarekdne bashe Data segment ka variable kan lam basha drust dakaen

    ; lera message akan danusen bo dawakande user input akan u peshandany away zhamraka even yan odd
    ev db 'The Number Is Even$'   ; Am stinga katak peshan dadre ka zhmaraka jut bet
    od db 'The Number Is Odd$'    ; Am stinga katak peshan dadre ka zhmaraka tak bet
    msg db 10, 13, 'Enter a number: $'  ; Am message bo awya ba user blle zhmara bnuse
    num db ?             ; Am varible zhmarakay tya store dakain

.code                   ; Am basha taybata ba Code segment wata codekan lera danusen

main:                   ; lera main programakan dast pe dakat
    mov ax, @data       ; Amyan address data segment dagwazetawa bo ax register
    mov ds, ax          ; amyan addresse data segment ka bretya la registere (ax) dagwazetawa bo data segment register (ds) 


    mov dx, offset msg  ; offset bakardet bo dozenaway shwene address varable yan label la memory, wa pashan ka mov bakardenen dabeta hoy gwastnaway address msg bo (DX) register nak datakay nawe
    mov ah, 09h         ; amayan Function bo print stringakaya
    int 21h             ; Amyan Dos/Window interrupt dakat u message print dabe


    mov ah, 1           ; Set AH to 1 to read a character from standard input
    int 21h             ; Call interrupt 21h to read the character
    sub al, 30h         ; amyan converte ASCII character bo zhmara
    mov num, al         ; zhamaraka la variable num xazn dakain

    mov bl, 2           ; BL dakain ba 2 bo away bzanen zhmaraka jut dabe yan tak
    div bl              ; lera dabshkrdne zhmaraka anjam dada
    cmp ah, 0           ; ama barawrde rimnder (Ah) dakat lagall 0
    je IsEven           ; agar remainder = 0 awa jump dakat bo IsEven section
    mov dx, 10          ; mov 10 ascii code dakain bo naw dx register
    mov dx, 13          ; lera ascii 13 dakaina naw dx
    mov ah, 2h           ; amyan bo prent knakay charakterkaya
    int 21h             ; lera dos interrupt dabe


 
    
    mov dx, offset od   ; amyan address od dagwazetawa bo dx register
    mov ah, 09h         ; amayan Function bo print stringakaya
    int 21h             ; Amyan Dos/Window interrupt dakat u message The Number Is Odd peshan dadre
    jmp Done            ; amyan Jump dakat bo Done section

IsEven:
    mov dx, 10          ; lera ASCII 10 dakaina naw dx
    mov dx, 13          ; lera ASCII 13 dakaina naw dx
    mov ah, 2h           ; amyan bo print
    int 21h             ; lera dos interrupt dabe
   
    mov dx, offset ev   ; amyan address ev la memory daxata naw dx
    mov ah, 09h         ; amayan Function bo print stringakaya
    int 21h             ; Amyan Dos/Window interrupt dakat u message The Number Is Even peshan dadre
    
Done:
    mov ah, 4ch         ; ama bo terminate kdne program akaya
    int 21h             ; ama dos interrupt dakat

end main                ; lera main programaka kota det
