        .file   "sum9Ints.c"
        .intel_syntax noprefix
        .text
        .section        .rodata
.LC0:
        .string "The sum is %i\n"
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     DWORD PTR -40[rbp], 1
        mov     DWORD PTR -36[rbp], 2
        mov     DWORD PTR -32[rbp], 3
        mov     DWORD PTR -28[rbp], 4
        mov     DWORD PTR -24[rbp], 5
        mov     DWORD PTR -20[rbp], 6
        mov     DWORD PTR -16[rbp], 7
        mov     DWORD PTR -12[rbp], 8
        mov     DWORD PTR -8[rbp], 9
        mov     r9d, DWORD PTR -20[rbp]
        mov     r8d, DWORD PTR -24[rbp]
        mov     ecx, DWORD PTR -28[rbp]
        mov     edx, DWORD PTR -32[rbp]
        mov     esi, DWORD PTR -36[rbp]
        mov     eax, DWORD PTR -40[rbp]
        sub     rsp, 8
        mov     edi, DWORD PTR -8[rbp]
        push    rdi
        mov     edi, DWORD PTR -12[rbp]
        push    rdi
        mov     edi, DWORD PTR -16[rbp]
        push    rdi
        mov     edi, eax
        call    addNine@PLT
        add     rsp, 32
        mov     DWORD PTR -4[rbp], eax
        mov     eax, DWORD PTR -4[rbp]
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
