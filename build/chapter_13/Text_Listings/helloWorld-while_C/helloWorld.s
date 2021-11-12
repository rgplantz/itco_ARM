        .file   "helloWorld.c"
        .intel_syntax noprefix
        .text
        .section        .rodata
.LC0:
        .string "Hello, World!\n"
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        lea     rax, .LC0[rip]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L2
.L3:
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, 1
        mov     rsi, rax
        mov     edi, 1
        call    write@PLT
        add     QWORD PTR -8[rbp], 1
.L2:
        mov     rax, QWORD PTR -8[rbp]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        jne     .L3
        mov     eax, 0
        leave
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
