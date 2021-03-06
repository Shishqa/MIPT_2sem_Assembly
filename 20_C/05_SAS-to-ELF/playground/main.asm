
        global  _start

        section .text

_start:

        mov     rsi, -12000
        mov     rcx, 1

        call    .test_outf

        mov     rax, 60
        xor     rdi, rdi
        syscall

.test_outc:
        push    r11
        dec     rsp
        mov     byte [rsp], sil

        mov     rax, 1
        mov     rsi, rsp
        mov     rdi, 1
        mov     rdx, 1
        syscall

        inc     rsp
        pop     r11
        ret


.test_in:
        push    r11
        sub     rsp, 11

        xor     rax, rax
        mov     rsi, rsp
        xor     rdi, rdi
        mov     rdx, 10
        syscall

        mov     r11, 1
        
        cmp     byte [rsi], '-'
        jne     .proceed

        mov     r11, -1
        inc     rsi

.proceed:

        cld
        xor     rdi, rdi 
        xor     rax, rax

.convert:

        lodsb

        sub     al, '0'
        cmp     al, 9
        ja      .end

        imul    rdi, rdi, 10
        add     rdi, rax

        jmp     .convert

.end:
        add     rsp, 11
        imul    rdi, r11
        pop     r11
        ret

;==================================================
.test_outf:

        push    r11
        sub     rsp, 16

        mov     r11, 1
        cmp     esi, 0
        jge     .continue_1

        xor     r11, r11
        neg     rsi

.continue_1:

        push    rcx
        mov     rbx, 10

        lea     rdi, [rsp + 16]
        std

.before_dot:

        xor     edx, edx
        mov     eax, esi
        idiv    ebx

        mov     esi, eax
        mov     al, dl
        add     al, '0'

        stosb

        dec     rcx
        jnz     .before_dot    

.dot:
        pop     rcx
        inc     rcx

        mov     al, '.'
        stosb

.after_dot:

        xor     edx, edx
        mov     eax, esi
        idiv    ebx

        mov     esi, eax
        mov     al, dl
        add     al, '0'

        stosb
        inc     rcx

        cmp     esi, 0
        jne     .after_dot

.print_sign_1:

        cmp     r11, 0
        jne     .positive_1

        mov     byte [rdi], '-'
        inc     rcx
        jmp     .print_1

.positive_1:

        inc     rdi

.print_1:
        mov     rax, 1
        mov     rsi, rdi
        mov     rdi, 1
        mov     rdx, rcx
        syscall

        add     rsp, 16
        pop     r11

        ret

;====================================================

.test_out:

        push    r11
        sub     rsp, 11

        mov     r11, 1
        cmp     esi, 0
        jge     .continue

        xor     r11, r11
        neg     rsi

.continue:

        mov     rdi, rsp
        add     rdi, 10

        std

        mov     rbx, 10
        xor     rcx, rcx

.convert_loop:

        xor     edx, edx
        mov     eax, esi
        idiv    ebx

        mov     esi, eax
        mov     al, dl
        add     al, '0'

        stosb
        inc     rcx

        cmp     esi, 0
        jne     .convert_loop    

        cmp     r11, 0
        jne     .positive

        mov     byte [rdi], '-'
        inc     rcx
        jmp     .print

.positive:

        inc     rdi

.print:
        mov     rax, 1
        mov     rsi, rdi
        mov     rdi, 1
        mov     rdx, rcx
        syscall

        add     rsp, 11
        pop     r11

        ret
