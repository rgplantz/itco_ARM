        .file   "coinFlips1.c"
        .intel_syntax noprefix
        .text
        .section        .rodata
.LC0:
        .string "heads"
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp
        mov     rbp, rsp
        push    r12
        push    rbx
        mov     ebx, 0
        jmp     .L2
.L4:
        call    random@PLT
        mov     r12d, eax
        cmp     r12d, 1073741822
        jg      .L3
        lea     rdi, .LC0[rip]
        call    puts@PLT
.L3:
        add     ebx, 1
.L2:
        cmp     ebx, 9
        jle     .L4
        mov     eax, 0
        pop     rbx
        pop     r12
        pop     rbp
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
