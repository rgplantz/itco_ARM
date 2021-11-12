        .file   "UART_functions.c"
        .intel_syntax noprefix
        .text
        .globl  UART_init
        .type   UART_init, @function
UART_init:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR -24[rbp], rdi
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        add     rax, 1
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR -8[rbp]
        add     rax, 2
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR -8[rbp]
        add     rax, 3
        mov     BYTE PTR [rax], -125
        mov     rax, QWORD PTR -8[rbp]
        add     rax, 1
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     BYTE PTR [rax], 3
        mov     rax, QWORD PTR -8[rbp]
        add     rax, 3
        mov     BYTE PTR [rax], 3
        nop
        pop     rbp
        ret
        .size   UART_init, .-UART_init
        .globl  UART_in
        .type   UART_in, @function
UART_in:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR -24[rbp], rdi
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR -8[rbp], rax
        nop
.L3:
        mov     rax, QWORD PTR -8[rbp]
        add     rax, 5
        movzx   eax, BYTE PTR [rax]
        movzx   eax, al
        and     eax, 1
        test    eax, eax
        jne     .L3
        mov     rax, QWORD PTR -8[rbp]
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR -9[rbp], al
        movzx   eax, BYTE PTR -9[rbp]
        pop     rbp
        ret
        .size   UART_in, .-UART_in
        .globl  UART_out
        .type   UART_out, @function
UART_out:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR -24[rbp], rdi
        mov     eax, esi
        mov     BYTE PTR -28[rbp], al
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR -8[rbp], rax
        nop
.L6:
        mov     rax, QWORD PTR -8[rbp]
        add     rax, 5
        movzx   eax, BYTE PTR [rax]
        movzx   eax, al
        and     eax, 32
        test    eax, eax
        jne     .L6
        mov     rax, QWORD PTR -8[rbp]
        movzx   edx, BYTE PTR -28[rbp]
        mov     BYTE PTR [rax], dl
        nop
        pop     rbp
        ret
        .size   UART_out, .-UART_out
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
