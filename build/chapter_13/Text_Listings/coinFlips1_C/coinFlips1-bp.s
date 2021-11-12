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
        jmp     .L2               ## jump to bottom of for loop
.L4:
        call    random@PLT        ## get random number
        mov     r12d, eax         ## save random number
        cmp     r12d, 1073741822  ## compare with half max
        jg      .L3               ## greater, skip body
        lea     rdi, .LC0[rip]    ## less or equal, body
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
