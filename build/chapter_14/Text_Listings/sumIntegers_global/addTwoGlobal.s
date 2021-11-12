        .file   "addTwoGlobal.c"
        .intel_syntax noprefix
        .text
        .globl  addTwo
        .type   addTwo, @function
addTwo:
        push    rbp
        mov     rbp, rsp
        mov     edx, DWORD PTR x[rip]
        mov     eax, DWORD PTR y[rip]
        add     eax, edx
        mov     DWORD PTR z[rip], eax
        nop
        pop     rbp
        ret
        .size   addTwo, .-addTwo
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
