        .file   "theMessage.c"
        .intel_syntax noprefix
        .text
        .section        .rodata
.LC0:
        .string "Hello.\n"
        .text
        .globl  theMessage
        .type   theMessage, @function
theMessage:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR -24[rbp], rdi
        mov     DWORD PTR -12[rbp], 0
        lea     rax, .LC0[rip]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L2
.L3:
        mov     rax, QWORD PTR -8[rbp]
        movzx   edx, BYTE PTR [rax]
        mov     rax, QWORD PTR -24[rbp]
        mov     BYTE PTR [rax], dl
        add     DWORD PTR -12[rbp], 1
        add     QWORD PTR -8[rbp], 1
        add     QWORD PTR -24[rbp], 1
.L2:
        mov     rax, QWORD PTR -8[rbp]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        jne     .L3
        mov     eax, DWORD PTR -12[rbp]
        pop     rbp
        ret
        .size   theMessage, .-theMessage
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
