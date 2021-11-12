        .file   "coinFlips2.c"
        .intel_syntax noprefix
        .text
        .section        .rodata
.LC0:
        .string "heads"
.LC1:
        .string "tails"
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
.L5:
        call    random@PLT        ## get random number
        mov     r12d, eax         ## save random number
        cmp     r12d, 1073741822  ## less than half max?
        jg      .L3               ## no, else block
        lea     rdi, .LC0[rip]    ## yes, then block
        call    puts@PLT
        jmp     .L4
.L3:
        lea     rdi, .LC1[rip]    ## else block
        call    puts@PLT
.L4:
        add     ebx, 1
.L2:
        cmp     ebx, 9
        jle     .L5
        mov     eax, 0
        pop     rbx
        pop     r12
        pop     rbp
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
