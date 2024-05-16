;group members:

; Mohammed Qasm
; Muhammad Shamsadin
; Mustafa Jawhar
; Redyar Rafat

.model small       ; lera modele memory dakain ba small wata small bakar denen ama bo programe bchuck gunjawa

.stack             ; lera stack segment danasenen

.data              ; Am line bo dyarekdne bashe Data segment ka variable kan lam basha drust dakaen

mystring db 'Hello, World!', '$'  ; lera varabile kman banawe mystring drust krdwa wa jorakay db ya wata 1 Byte shwen dagre la memory wa value am varabile 'Hello, World!' wa bam '$' kotayeeman bam varabile henawa

.code              ; Am basha taybata ba Code segment wata codekan lera danusen

main:             ; lera main programakan dast pe dakat

mov ax, @data     ; Amyan address data segment dagwazetawa bo ax register

mov ds, ax        ; amyan addresse data segment ka bretya la registere (ax) dagwazetawa bo data segment register (ds) 

lea dx, mystring  ; Load effective address haldaste addresse varabile mystring dagwazetawa bo dx register wata dabeta pointer bo string aka

mov ah, 09h       ; amyan function bo print string bakar det

int 21h           ; am interrupt 21h bo print string kaya 

mov ah, 4ch       ; am function bakarde bo terminate yan ragrtne programaka

int 21h           ; am interrupt 21h bo awaya ka program daxra shasha rashaka bkawetawa zher daste xoman

end main          ; lera main programakan kota det