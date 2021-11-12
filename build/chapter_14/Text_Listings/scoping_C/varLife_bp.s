        .file   "varLife.c"
        .intel_syntax noprefix
        .text
        .globl  z
        .data
        .align 4
        .type   z, @object
        .size   z, 4
z:
        .long   56                      ## int z = INITz;
        .section        .rodata
        .align 8
.LC0:
        .string "           automatic   static   global"
        .align 8
.LC1:
        .string "                   x        y        z"
.LC2:
        .string "In main:%12i %8i %8i\n"
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     DWORD PTR -8[rbp], 12   ## int x = INITx;
        mov     DWORD PTR -4[rbp], 34   ## int y = INITy;
        lea     rdi, .LC0[rip]
        call    puts@PLT
        lea     rdi, .LC1[rip]
        call    puts@PLT
        mov     ecx, DWORD PTR z[rip]
        mov     edx, DWORD PTR -4[rbp]
        mov     eax, DWORD PTR -8[rbp]
        mov     esi, eax
        lea     rdi, .LC2[rip]
        mov     eax, 0
        call    printf@PLT
        call    addConst@PLT
        call    addConst@PLT
        mov     ecx, DWORD PTR z[rip]
        mov     edx, DWORD PTR -4[rbp]
        mov     eax, DWORD PTR -8[rbp]
        mov     esi, eax
        lea     rdi, .LC2[rip]
        mov     eax, 0
        call    printf@PLT
        mov     eax, 0
        leave
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
