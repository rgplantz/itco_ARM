        .file   "twiceIndex.c"
        .intel_syntax noprefix
        .text
        .globl  twiceIndex
        .type   twiceIndex, @function
twiceIndex:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR -24[rbp], rdi
        mov     DWORD PTR -28[rbp], esi
        mov     DWORD PTR -4[rbp], 0
        jmp     .L2
.L3:
        mov     eax, DWORD PTR -4[rbp]
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        mov     edx, DWORD PTR -4[rbp]
        add     edx, edx
        mov     DWORD PTR [rax], edx
        add     DWORD PTR -4[rbp], 1
.L2:
        mov     eax, DWORD PTR -4[rbp]
        cmp     eax, DWORD PTR -28[rbp]
        jl      .L3
        nop
        nop
        pop     rbp
        ret
        .size   twiceIndex, .-twiceIndex
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
