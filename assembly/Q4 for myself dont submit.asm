;group members:

; Mohammed Qasm
; Muhammad Shamsadin
; Mustafa Jawhar
; Redyar Rafat

.model small       ; lera modele memory dakain ba small wata small bakar denen ama bo programe bchuck gunjawa

.stack 100h        ; lera stack segment danasenen ka nrxe 100 ba hexa pe dawa

.data              ; Am line bo dyarekdne bashe Data segment ka variable kan lam basha drust dakaen
    
    count db 1     ; Am variable bo store zhmara 1 ta loop lawe dast pe bkat
    newline db 10, 13, '$'  ; ama bo Newline bakar det 

.code             ; Am basha taybata ba Code segment wata codekan lera danusen

main:             ; lera main programakan dast pe dakat

    mov ax, @data ; Amyan address data segment dagwazetawa bo ax register
    mov ds, ax    ; amyan addresse data segment ka bretya la registere (ax) dagwazetawa bo data segment register (ds) 


    mov dl, '1'     ; ASCII code character '1' daxayna naw dl
    mov ah, 2     ; Nrxe AH register bka ba 2 bo print krdne character aka
    int 21h         ; interrupt Dos/Window dakat u character peshan dadre

    mov cl, 9       ; loop caounter ta 9 zhmara dabne china ema zhmara 1 man print krdwa peshtr

loop_start:
    inc count       ; hamu jar count 1 zhmara zyad dabe
    add dl, 1       ; DL hamu jar 1 zhmara zyad dakat bo print krdne zhmaray dabe
    cmp dl, '9'     ; barawrde Dl dakain lagall 9
    jbe print_digit ; Jump dakaen print_digit section agar DL bchuktr u yaksan be ba 9
    mov dl, '1'     ; Dl dakain ba 1 bo print krdne yakam digit zhmara 10
    int 21h         ; awa zhmara 1 naw zhmara 10 print aka
    mov dl, '0'     ; Dl dakain ba 0 bo print krdne dwam digit zhmara 10
    int 21h         ; amas zhmara 0 naw zhmara 10 print aka wata digit dwam
    jmp continue_loop ; Jump dakain bo continue_loop section wata loop bardawam be

print_digit:
    cmp dl, '9'     ; barawrde Dl dakain lagall 9
    jg skip_increment ; jump dakain agar DL gawratr bu la 9
    int 21h         ; interrupt Dos/Window dakat u character peshan dadre
    jmp continue_loop ; Jump dakain bo continue_loop section wata loop bardawam be

skip_increment:
    int 21h         ; interrupt Dos/Window dakat u character peshan dadre
    jmp continue_loop ; Jump dakain bo continue_loop section wata loop bardawam be

continue_loop:
    loop loop_start ; loop bardawam dabe tawaku count tawaw dabe

    ; Newline code: am basha code bo awaya print new line bkat
    lea dx, newline ; Load effective address haldaste addresse varabile newline dagwazetawa bo dx register wata dabeta pointer bo string aka ka am stringa newlineka
    mov ah, 09     ; Amyan bo Printe aw new line bakar det
    int 21h         ; Ama interrupt Dos/Window dakat bo peshandane new line ka


    ; Am parcha code bo Exit krdna la program

    mov ah, 4Ch     ; Lerda nrxe AH register dakain ba 4Ch bo terminate krdne programaka
    int 21h         ; lera interrupt 21h (INT 21h) dabeta hoye terminate krnde program aka


end main           ; lera main programaka kota det
