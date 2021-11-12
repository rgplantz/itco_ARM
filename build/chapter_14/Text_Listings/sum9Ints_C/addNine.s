        .file   "addNine.c"
        .intel_syntax noprefix
        .text
        .globl  addNine
        .type   addNine, @function
addNine:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR -20[rbp], edi
        mov     DWORD PTR -24[rbp], esi
        mov     DWORD PTR -28[rbp], edx
        mov     DWORD PTR -32[rbp], ecx
        mov     DWORD PTR -36[rbp], r8d
        mov     DWORD PTR -40[rbp], r9d
        mov     edx, DWORD PTR -20[rbp]
        mov     eax, DWORD PTR -24[rbp]
        add     edx, eax
        mov     eax, DWORD PTR -28[rbp]
        add     edx, eax
        mov     eax, DWORD PTR -32[rbp]
        add     edx, eax
        mov     eax, DWORD PTR -36[rbp]
        add     edx, eax
        mov     eax, DWORD PTR -40[rbp]
        add     edx, eax
        mov     eax, DWORD PTR 16[rbp]
        add     edx, eax
        mov     eax, DWORD PTR 24[rbp]
        add     edx, eax
        mov     eax, DWORD PTR 32[rbp]
        add     eax, edx
        mov     DWORD PTR -4[rbp], eax
        mov     eax, DWORD PTR -4[rbp]
        pop     rbp
        ret
        .size   addNine, .-addNine
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
