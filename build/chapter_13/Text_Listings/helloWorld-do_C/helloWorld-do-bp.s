        .file   "helloWorld-do.c"
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
        lea     rax, .LC0[rip]          ## address of text string
        mov     QWORD PTR -8[rbp], rax
.L2:
        mov     rax, QWORD PTR -8[rbp]  ## address of current character
        mov     edx, 1                  ## one character
        mov     rsi, rax                ## pass address
        mov     edi, 1                  ## STDOUT_FILENO
        call    write@PLT
        add     QWORD PTR -8[rbp], 1    ## increment pointer
        mov     rax, QWORD PTR -8[rbp]  ## address of current characte
        movzx   eax, BYTE PTR [rax]     ## load character
        test    al, al                  ## NUL character?
        jne     .L2                     ## no, continue looping
        mov     eax, 0                  ## yes, all done
        leave
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
