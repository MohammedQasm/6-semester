;group members:

; Mohammed Qasm
; Muhammad Shamsadin
; Mustafa Jawhar
; Redyar Rafat

.model small       ; lera modele memory dakain ba small wata small bakar denen ama bo programe bchuck gunjawa

.stack 100h        ; lera stack segment danasenen ka nrxe 100 ba hexa pe dawa

.data              ; Am line bo dyarekdne bashe Data segment ka variable kan lam basha drust dakaen
    
    ; lera message akan danusen bo dawakande user input akan u peshandany resultaka
    msg1 db 'Enter first number: $'
    msg2 db 'Enter second number: $'
    msg3 db 'The sum is: $'
    newline db 13, 10, '$' ; am varaible bo awaya dwatr bakare bhenen tawaku wa la DOS/WINDOW bkain bcheta line nwe nak hamu shte lasar haman line bet

    ; lera chand varible danasenen bo away dwatr nrxakane teda save bkain ballam rasatawxo nrxe pe nadayn ballku dwatr la input akan u sume inputakan lawe xazn dakain ka esta bam ? wadakain ka nrxe pe nadaen u dwatr boy dyare dakain wata am ? bo awaya
    num1 db ?
    num2 db ?
    sum db ?

.code              ; Am basha taybata ba Code segment wata codekan lera danusen

main:             ; lera main programakan dast pe dakat

   
    mov ax, @data ; Amyan address data segment dagwazetawa bo ax register
    mov ds, ax ; amyan addresse data segment ka bretya la registere (ax) dagwazetawa bo data segment register (ds) 

    ; am parcha code bo peshandany message yakama ka daway nusene zhmaray yakam dakat
    lea dx, msg1  ; Load effective address haldaste addresse varabile msg1 dagwazetawa bo dx register wata dabeta pointer bo string aka
    mov ah, 09h   ; amayan Function bo print stringakaya
    int 21h       ; Amyan Dos/Window datawa dast xoman bo away zhmaray nwe yan inpute nwe btwanen daxl bkain

    ; Input bo zhmaray yakam
    mov ah, 01h      ; Nrxe AH register dakain 01h bo away input warbgren la keyboard
    int 21h          ; interrupt 21h yan (INT 21h) amyan bo anjamdane oparation inputakaya yan dabeta hoe wargtne dway daxl kdne
    sub al, 30h      ; Amyan ASCII character aw digitay nuseman dagore bo numeric value
    mov num1, al     ; Esta aw numeric value ka la (AL) register hamana mov dakain bo varible num1 

    ; Newline code: am basha code bo awaya print new line bkat dway daxlkdne input yakam
    lea dx, newline ; Load effective address haldaste addresse varabile newline dagwazetawa bo dx register wata dabeta pointer bo string aka ka am stringa newlineka
    mov ah, 09h     ; Amyan bo Printe aw new line bakar det
    int 21h         ; Amyan Dos/Window datawa dast xoman bo away zhmaray nwe yan inpute nwe btwanen daxl bkain

    ; am parcha code bo peshandany message Dwama ka daway nusene zhmaray Dwam dakat
    lea dx, msg2  ; Load effective address haldaste addresse varabile msg2 dagwazetawa bo dx register wata dabeta pointer bo string aka
    mov ah, 09h   ; amayan Function bo print stringakaya
    int 21h       ; Amyan Dos/Window datawa dast xoman bo away zhmaray nwe yan inpute nwe btwanen daxl bkain


    ; Input bo zhmaray dwam
    mov ah, 01h      ; Nrxe AH register dakain 01h bo away input warbgren la keyboard
    int 21h          ; interrupt 21h yan (INT 21h) amyan bo anjamdane oparation inputakaya yan dabeta hoe wargtne dway daxl kdne
    sub al, 30h      ; Amyan ASCII character aw digitay nuseman dagore bo numeric value
    mov num2, al     ; Esta aw numeric value ka la (AL) register hamana mov dakain bo varible num2


    ; Newline code: am basha code bo awaya print new line bkat dway daxlkdne input Dwam
    lea dx, newline ; Load effective address haldaste addresse varabile newline dagwazetawa bo dx register wata dabeta pointer bo string aka ka am stringa newlineka
    mov ah, 09h     ; Amyan bo Printe aw new line bakar det
    int 21h         ; Amyan Dos/Window datawa dast xoman bo away zhmaray nwe yan inpute nwe btwanen daxl bkain

    ; am parcha code bo peshandany message 3 yama ka danusre "The sum is:"
    lea dx, msg3  ; Load effective address haldaste addresse varabile msg3 dagwazetawa bo dx register wata dabeta pointer bo string aka
    mov ah, 09h   ; amayan Function bo print stringakaya
    int 21h       ; Amyan Dos/Window datawa dast xoman bo away zhmaray nwe yan inpute nwe btwanen daxl bkain

;  am basha code bo awaya ka zhmarakane 2 inputaka ko bkatawa
    mov al, num1    ; value num1 dagwazetawa bo (AL) register
    add al, num2    ; Ama value num2 zyad dakay bo AL register wata koyan dakatawa (num1 + num2)
    mov sum, al     ; Ama result (sum) dagwazetawa la (AL) register bo variable sum

; lam parcha code cheack akain bzanen anjame sum > 9
    cmp sum, 9      ; lera barawrde value sum lagall 9 dakain
    jbe skip_convert ; lera Jump dakain bo block code skip_convert agar sum bchuktr u yaksan bu ba 9

; agar sum gawratr bu la 9 awa  convert aka bo ASCII character akay
    mov bl, 10      ; Ama value 10 dagwazetawa bo (BL) register
    sub sum, bl     ; sum - 10 bka bo mamalla krdn lagall aw case nay ka sum > 9
    mov dl, '1'     ; character '1' taybata ba 1 la zhamra 10 bgwazawa bo (DL) register
    mov ah, 02h     ; Nrxe AH register bka ba 02h bo print krdne character aka
    int 21h         ; interrupt Dos/Window dakat

; Am skip_convert: block code ka bo peshandane sum bakar det

skip_convert:
    mov dl, sum     ; Lera value sum dakaina naw (DL) register
    add dl, 30h     ; lera Convert value naw (DL) register Bo ASCII value u pashan opration sum esh dakat
    mov ah, 02h     ; Nrxe AH register bka ba 02h bo print krdne character aka
    int 21h         ; interrupt Dos/Window dakat u character peshan dadre


; Newline code: am basha code bo awaya print new line bkat
    lea dx, newline ; Load effective address haldaste addresse varabile newline dagwazetawa bo dx register wata dabeta pointer bo string aka ka am stringa newlineka
    mov ah, 09h     ; Amyan bo Printe aw new line bakar det
    int 21h         ; Ama interrupt Dos/Window dakat bo peshandane new line ka


; Am parcha code bo Exit krdna la program

    mov ah, 4Ch     ; Lerda nrxe AH register dakain ba 4Ch bo terminate krdne programaka
    int 21h         ; lera interrupt 21h (INT 21h) dabeta hoye terminate krnde program aka


end main           ; lera main programaka kota det
