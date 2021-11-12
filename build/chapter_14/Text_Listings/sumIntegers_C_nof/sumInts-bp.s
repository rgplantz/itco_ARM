        .file   "sumInts.c"
        .intel_syntax noprefix
        .text
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
        sub     rsp, 32
        mov     rax, QWORD PTR fs:40
        mov     QWORD PTR -8[rbp], rax
        xor     eax, eax
        mov     DWORD PTR -20[rbp], 0 ## x = 0;
        mov     DWORD PTR -16[rbp], 0 ## y = 0;
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    printf@PLT
        lea     rax, -20[rbp]   ## address of x
        mov     rsi, rax
        lea     rdi, .LC1[rip]
        mov     eax, 0
        call    __isoc99_scanf@PLT
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    printf@PLT
        lea     rax, -16[rbp]   ## address of y
        mov     rsi, rax
        lea     rdi, .LC1[rip]
        mov     eax, 0
        call    __isoc99_scanf@PLT
        mov     ecx, DWORD PTR -16[rbp]   ## load y
        mov     eax, DWORD PTR -20[rbp]   ## load x
        lea     rdx, -12[rbp]   ## address of z
        mov     esi, ecx        ## y
        mov     edi, eax        ## x
        call    addTwo@PLT
        mov     ecx, DWORD PTR -12[rbp]   ## z
        mov     edx, DWORD PTR -16[rbp]   ## y
        mov     eax, DWORD PTR -20[rbp]   ## x
        mov     esi, eax
        lea     rdi, .LC2[rip]
        mov     eax, 0
        call    printf@PLT
        mov     eax, 0
        mov     rsi, QWORD PTR -8[rbp]
        xor     rsi, QWORD PTR fs:40
        je      .L3
        call    __stack_chk_fail@PLT
.L3:
        leave
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
