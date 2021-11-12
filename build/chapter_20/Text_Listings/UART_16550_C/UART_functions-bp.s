        .file   "UART_functions.c"
        .intel_syntax noprefix
        .text
        .globl  UART_init
        .type   UART_init, @function
UART_init:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR -24[rbp], rdi
        mov     rax, QWORD PTR -24[rbp] ## UART base address
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]  ## UART base address
        add     rax, 1                  ## IER offset
        mov     BYTE PTR [rax], 0       ## no interrupts
        mov     rax, QWORD PTR -8[rbp]
        add     rax, 2                  ## FCR offset
        mov     BYTE PTR [rax], 0       ## no FIFO
        mov     rax, QWORD PTR -8[rbp]
        add     rax, 3                  ## LCR offset
        mov     BYTE PTR [rax], -125    ## set baud mode
        mov     rax, QWORD PTR -8[rbp]
        add     rax, 1                  ## DLM offset
        mov     BYTE PTR [rax], 0       ## high byte
        mov     rax, QWORD PTR -8[rbp]  ## DLL offset = 0
        mov     BYTE PTR [rax], 3       ## low byte
        mov     rax, QWORD PTR -8[rbp]
        add     rax, 3                  ## LCR offset
        mov     BYTE PTR [rax], 3       ## communications mode
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
        mov     rax, QWORD PTR -8[rbp]  ## UART base address
        add     rax, 5                  ## LSR offset
        movzx   eax, BYTE PTR [rax]
        movzx   eax, al             ## load LSR
        and     eax, 1              ## (*(port+LSR) & RxRDY)
        test    eax, eax
        jne     .L3
        mov     rax, QWORD PTR -8[rbp]
        movzx   eax, BYTE PTR [rax]     ## input character
        mov     BYTE PTR -9[rbp], al
        movzx   eax, BYTE PTR -9[rbp]   ## return character
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
        mov     rax, QWORD PTR -8[rbp]  ## UART base address
        add     rax, 5                  ## LSR offset
        movzx   eax, BYTE PTR [rax]
        movzx   eax, al             ## load LSR
        and     eax, 32             ## (*(port+LSR) & TxRDY)
        test    eax, eax
        jne     .L6
        mov     rax, QWORD PTR -8[rbp]
        movzx   edx, BYTE PTR -28[rbp]  ## load character
        mov     BYTE PTR [rax], dl      ## output character
        nop
        pop     rbp
        ret
        .size   UART_out, .-UART_out
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
