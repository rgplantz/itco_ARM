        .file   "addTwo.c"
        .intel_syntax noprefix
        .text
        .globl  addTwo
        .type   addTwo, @function
addTwo:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR -20[rbp], edi
        mov     DWORD PTR -24[rbp], esi
        mov     QWORD PTR -32[rbp], rdx
        mov     edx, DWORD PTR -20[rbp]
        mov     eax, DWORD PTR -24[rbp]
        add     eax, edx
        mov     DWORD PTR -4[rbp], eax
        mov     rax, QWORD PTR -32[rbp]
        mov     edx, DWORD PTR -4[rbp]
        mov     DWORD PTR [rax], edx
        nop
        pop     rbp
        ret
        .size   addTwo, .-addTwo
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
