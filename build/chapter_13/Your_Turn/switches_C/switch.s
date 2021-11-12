        .file   "switch.c"
        .intel_syntax noprefix
        .text
        .section        .rodata
.LC0:
        .string "i = 1"
.LC1:
        .string "i = 2"
.LC2:
        .string "i = 3"
.LC3:
        .string "i > 3"
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp
        mov     rbp, rsp
        push    r12
        push    rbx
        mov     ebx, 1
        jmp     .L2
.L8:
        mov     r12d, ebx
        cmp     r12d, 3
        je      .L3
        cmp     r12d, 3
        jg      .L4
        cmp     r12d, 1
        je      .L5
        cmp     r12d, 2
        je      .L6
        jmp     .L4
.L5:
        lea     rdi, .LC0[rip]
        call    puts@PLT
        jmp     .L7
.L6:
        lea     rdi, .LC1[rip]
        call    puts@PLT
        jmp     .L7
.L3:
        lea     rdi, .LC2[rip]
        call    puts@PLT
        jmp     .L7
.L4:
        lea     rdi, .LC3[rip]
        call    puts@PLT
.L7:
        add     ebx, 1
.L2:
        cmp     ebx, 9
        jle     .L8
        mov     eax, 0
        pop     rbx
        pop     r12
        pop     rbp
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
