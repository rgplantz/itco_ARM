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
        mov     edx, 14         ## number of chars
        lea     rsi, .LC0[rip]  ## address of string
        mov     edi, 1          ## STDOUT_FILENO
        call    write@PLT
        mov     eax, 0
        pop     rbp
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
