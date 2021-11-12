        .file   "echoChar.c"
        .intel_syntax noprefix
        .text
        .section        .rodata
.LC0:
        .string "Enter one character: "
.LC1:
        .string "You entered: "
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     rax, QWORD PTR fs:40
        mov     QWORD PTR -8[rbp], rax
        xor     eax, eax
        mov     edx, 21           ## prompt message
        lea     rsi, .LC0[rip]
        mov     edi, 1
        call    write@PLT
        lea     rax, -9[rbp]      ## &aLetter
        mov     edx, 1
        mov     rsi, rax
        mov     edi, 0
        call    read@PLT
        mov     edx, 13           ## response message
        lea     rsi, .LC1[rip]
        mov     edi, 1
        call    write@PLT
        lea     rax, -9[rbp]
        mov     edx, 1
        mov     rsi, rax
        mov     edi, 1
        call    write@PLT
        mov     eax, 0
        mov     rcx, QWORD PTR -8[rbp]
        xor     rcx, QWORD PTR fs:40
        je      .L3
        call    __stack_chk_fail@PLT
.L3:
        leave
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
