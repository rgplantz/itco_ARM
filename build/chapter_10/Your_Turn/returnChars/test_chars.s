        .file   "test_chars.c"
        .intel_syntax noprefix
        .text
        .section        .rodata
        .align 8
.LC0:
        .string "The returned chars are: %c, %c, and %c.\n"
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        call    exclaim@PLT
        mov     BYTE PTR -3[rbp], al
        call    upperOh@PLT
        mov     BYTE PTR -2[rbp], al
        call    tilde@PLT
        mov     BYTE PTR -1[rbp], al
        movsx   ecx, BYTE PTR -1[rbp]
        movsx   edx, BYTE PTR -2[rbp]
        movsx   eax, BYTE PTR -3[rbp]
        mov     esi, eax
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    printf@PLT
        mov     eax, 0
        leave
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
