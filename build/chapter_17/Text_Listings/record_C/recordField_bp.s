        .file   "recordField.c"
        .intel_syntax noprefix
        .text
        .section        .rodata
.LC0:
        .string "x: %c, %i, %c\n"
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16                 ## memory for record
        mov     BYTE PTR -12[rbp], 97   ## x.aChar = 'a';
        mov     DWORD PTR -8[rbp], 123  ## x.anInt = 123;
        mov     BYTE PTR -4[rbp], 98    ## x.anotherChar = 'b';
        movzx   eax, BYTE PTR -4[rbp]   ## load x.anotherChar
        movsx   ecx, al                 ## to 32 bits
        mov     edx, DWORD PTR -8[rbp]  ## load x.anInt
        movzx   eax, BYTE PTR -12[rbp]  ## load x.aChar
        movsx   eax, al                 ## to 32 bits
        mov     esi, eax
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    printf@PLT
        mov     eax, 0
        leave
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
