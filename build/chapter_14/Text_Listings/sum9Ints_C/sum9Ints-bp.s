        .file   "sum9Ints.c"
        .intel_syntax noprefix
        .text
        .section        .rodata
.LC0:
        .string "The sum is %i\n"
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     DWORD PTR -40[rbp], 1   ## a = 1
        mov     DWORD PTR -36[rbp], 2   ## b = 2
        mov     DWORD PTR -32[rbp], 3   ## c = 3
        mov     DWORD PTR -28[rbp], 4   ## d = 4
        mov     DWORD PTR -24[rbp], 5   ## e = 5
        mov     DWORD PTR -20[rbp], 6   ## f = 6
        mov     DWORD PTR -16[rbp], 7   ## g = 7
        mov     DWORD PTR -12[rbp], 8   ## h = 8
        mov     DWORD PTR -8[rbp], 9    ## i = 9
        mov     r9d, DWORD PTR -20[rbp] ## load f
        mov     r8d, DWORD PTR -24[rbp] ## load e
        mov     ecx, DWORD PTR -28[rbp] ## load d
        mov     edx, DWORD PTR -32[rbp] ## load c
        mov     esi, DWORD PTR -36[rbp] ## load b
        mov     eax, DWORD PTR -40[rbp] ## load a
        sub     rsp, 8      ## for stack alignment
        mov     edi, DWORD PTR -8[rbp]
        push    rdi                     ## push i         
        mov     edi, DWORD PTR -12[rbp]
        push    rdi                     ## push h
        mov     edi, DWORD PTR -16[rbp]
        push    rdi                     ## push g
        mov     edi, eax
        call    addNine@PLT
        add     rsp, 32     ## remove 3 ints and alignment
        mov     DWORD PTR -4[rbp], eax
        mov     eax, DWORD PTR -4[rbp]
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
