        .file   "sumIntsGlobal.c"
        .intel_syntax noprefix
        .text
        .globl  x
        .bss            ## bss section
        .align 4
        .type   x, @object
        .size   x, 4    ## 4 bytes
x:
        .zero   4       ## initialize
        .globl  y
        .align 4
        .type   y, @object
        .size   y, 4
y:
        .zero   4       ## initialize to 0
        .comm   z,4,4
        .section        .rodata
.LC0:
        .string "Enter an integer: "
.LC1:
        .string "%i"
.LC2:
        .string "%i + %i = %i\n"
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp
        mov     rbp, rsp
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    printf@PLT
        lea     rsi, x[rip]     ## globals relative to rip
        lea     rdi, .LC1[rip]  ## format string
        mov     eax, 0
        call    __isoc99_scanf@PLT
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    printf@PLT
        lea     rsi, y[rip]
        lea     rdi, .LC1[rip]
        mov     eax, 0
        call    __isoc99_scanf@PLT
        call    addTwo@PLT
        mov     ecx, DWORD PTR z[rip] ## load globals
        mov     edx, DWORD PTR y[rip]
        mov     eax, DWORD PTR x[rip]
        mov     esi, eax
        lea     rdi, .LC2[rip]
        mov     eax, 0
        call    printf@PLT
        mov     eax, 0
        pop     rbp
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
