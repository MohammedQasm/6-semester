;group members:

; Mohammed Qasm
; Muhammad Shamsadin
; Mustafa Jawhar
; Redyar Rafat

.model small       ; lera modele memory dakain ba small wata small bakar denen ama bo programe bchuck gunjawa

.stack 100h        ; lera stack segment danasenen ka nrxe 100 ba hexa pe dawa

.data              ; Am line bo dyarekdne bashe Data segment ka variable kan lam basha drust dakaen
    
    newline db 0ah, 0dh, '$' ; ama bo Newline bakar det 
    num db 0     ; Am variable bo store zhmara 0 ta loop lawe dast pe bkat

.code             ; Am basha taybata ba Code segment wata codekan lera danusen
main:             ; lera main programakan dast pe dakat

    mov ax, @data ; Amyan address data segment dagwazetawa bo ax register
    mov ds, ax    ; amyan addresse data segment ka bretya la registere (ax) dagwazetawa bo data segment register (ds) 



    mov cx, 10  ; wa dakat loop counter 10 zhmara brwa la 0 ta 9
    mov num, 0  ; lera daspek bo loop dyare dakain
    
print_loop:
    ; era tabata ba print krdne zhamrakan
    add num, '0'  ; zhamrakan dakata ascii code
    mov dl, num   ; zhmaraka dakta naw Dl bo print
    mov ah, 02h   ; Am function bo print character kana
    int 21h       ; lera DOS interrupt dakain
    sub num, '0'  ; lera zhmaraka dakainawa integer
    
    ; zhamraka zyad dakat bo counter yan bllen waku ++ waya bo away zhamarayak zyad be
    inc num

    ; check dakain hata loop kota det wata print dakat
    loop print_loop

   
    mov dx, offset newline  ; offset bakardet bo dozenaway shwene address varable yan label la memory, wa pashan ka mov bakardenen dabeta hoy gwastnaway address newline bo (DX) register nak datakay nawe
    mov ah, 09h         ; amayan Function bo print stringakaya
    int 21h             ; Amyan Dos/Window interrupt dakat u newline print (drust) dabe

    mov ah, 4ch         ; ama bo terminate kdne program akaya
    int 21h             ; ama dos interrupt dakat

end main   ; lera main programaka kota det
