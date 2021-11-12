        .file   "threeFloats.c"
        .intel_syntax noprefix
        .text
        .section        .rodata
.LC0:
        .string "Enter a number: "
.LC1:
        .string "%f"
.LC2:
        .string "%f is the same as %f\n"
.LC3:
        .string "%f is not the same as %f\n"
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     rax, QWORD PTR fs:40
        mov     QWORD PTR -8[rbp], rax
        xor     eax, eax
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    printf@PLT
        lea     rax, -28[rbp]
        mov     rsi, rax
        lea     rdi, .LC1[rip]
        mov     eax, 0
        call    __isoc99_scanf@PLT
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    printf@PLT
        lea     rax, -24[rbp]
        mov     rsi, rax
        lea     rdi, .LC1[rip]
        mov     eax, 0
        call    __isoc99_scanf@PLT
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    printf@PLT
        lea     rax, -20[rbp]
        mov     rsi, rax
        lea     rdi, .LC1[rip]
        mov     eax, 0
        call    __isoc99_scanf@PLT
        movss   xmm1, DWORD PTR -28[rbp]
        movss   xmm0, DWORD PTR -24[rbp]
        addss   xmm0, xmm1
        movss   DWORD PTR -16[rbp], xmm0
        movss   xmm0, DWORD PTR -20[rbp]
        movss   xmm1, DWORD PTR -16[rbp]
        addss   xmm0, xmm1
        movss   DWORD PTR -16[rbp], xmm0
        movss   xmm1, DWORD PTR -24[rbp]
        movss   xmm0, DWORD PTR -20[rbp]
        addss   xmm0, xmm1
        movss   DWORD PTR -12[rbp], xmm0
        movss   xmm0, DWORD PTR -28[rbp]
        movss   xmm1, DWORD PTR -12[rbp]
        addss   xmm0, xmm1
        movss   DWORD PTR -12[rbp], xmm0
        movss   xmm0, DWORD PTR -16[rbp]
        ucomiss xmm0, DWORD PTR -12[rbp]
        jp      .L2
        movss   xmm0, DWORD PTR -16[rbp]
        ucomiss xmm0, DWORD PTR -12[rbp]
        jne     .L2
        cvtss2sd        xmm1, DWORD PTR -12[rbp]
        cvtss2sd        xmm0, DWORD PTR -16[rbp]
        lea     rdi, .LC2[rip]
        mov     eax, 2
        call    printf@PLT
        jmp     .L4
.L2:
        cvtss2sd        xmm1, DWORD PTR -12[rbp]
        cvtss2sd        xmm0, DWORD PTR -16[rbp]
        lea     rdi, .LC3[rip]
        mov     eax, 2
        call    printf@PLT
.L4:
        mov     eax, 0
        mov     rdx, QWORD PTR -8[rbp]
        xor     rdx, QWORD PTR fs:40
        je      .L6
        call    __stack_chk_fail@PLT
.L6:
        leave
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
