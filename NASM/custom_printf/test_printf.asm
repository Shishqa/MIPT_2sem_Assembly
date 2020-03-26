;;=========================================================================
;; Test printf
;;=========================================================================

%macro      multipush 0-*

            %rep %0

                push    %1

            %rotate 1
            %endrep

%endmacro

%macro      multipop 2

            %rep %2

                pop %1

            %endrep

%endmacro

%macro      invoke 1-*

        %if %0 > 1

            mov     rdi, %2

        %if %0 > 2

            mov     rsi, %3

        %if %0 > 3

            mov     rdx, %4

        %if %0 > 4

            mov     rcx, %5

        %if %0 > 5

            mov     r8, %6

        %if %0 > 6

            mov     r9, %7

        %if %0 > 7

            multipush %{-1:8}

        %endif
        %endif
        %endif
        %endif
        %endif
        %endif
        %endif

            call    %1

            multipop rdi, %0 - 7

%endmacro


            default rel

            global  _start
            extern  printf

            section .text

;;=========================================================================

_start:
            invoke printf, format, qword CHAR_TEST, CSTR_TEST, qword DINT_TEST, qword UINT_TEST, qword BINT_TEST, qword OINT_TEST, qword XINT_TEST

            invoke printf, string2, lovestr, qword 3802, qword 100, qword '!', qword 127

            mov     rax, 60
            xor     rdi, rdi
            syscall

;;-------------------------------------------------------------------------

            section .data

CHAR_TEST   equ 'G'

CSTR_TEST:  db '"Hello, it is a string"', 0

DINT_TEST   equ -8625
UINT_TEST   equ 235123
BINT_TEST   equ 2121
OINT_TEST   equ 9898
XINT_TEST   equ 1024

string2:    db 'I %s %x %d%%%c%b', 0xA, 0
lovestr:    db 'love', 0

format:     db "Test formats:", 10
            db "%%c: %c", 9,9,9,9,  "(should be 'G')",      10
            db "%%s: %s",                                   10
            db "%%d: %d", 9,9,9,    "(should be -8625d)",   10
            db "%%u: %u", 9,9,9,    "(should be 235123d)",  10
            db "%%b: %b", 9,9,      "(should be 2121d)",    10
            db "%%o: %o", 9,9,9,    "(should be 9898d)",    10
            db "%%x: %x", 9,9,9,9,  "(should be 1024d)",    10
            db "Done",                                      10, 0

;;=========================================================================
