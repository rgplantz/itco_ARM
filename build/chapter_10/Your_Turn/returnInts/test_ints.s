        .file   "test_ints.c"
        .intel_syntax noprefix
        .text
        .section        .rodata
        .align 8
.LC0:
        .string "The returned ints are: %i, %i, and %i.\n"
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        call    twelve@PLT
        mov     DWORD PTR -12[rbp], eax
        call    thirtyFour@PLT
        mov     DWORD PTR -8[rbp], eax
        call    fiftySix@PLT
        mov     DWORD PTR -4[rbp], eax
        mov     ecx, DWORD PTR -4[rbp]
        mov     edx, DWORD PTR -8[rbp]
        mov     eax, DWORD PTR -12[rbp]
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
