        .file   "displayArray.c"
        .intel_syntax noprefix
        .text
        .section        .rodata
.LC0:
        .string "intArray["
.LC1:
        .string "] = "
.LC2:
        .string "\n"
        .text
        .globl  displayArray
        .type   displayArray, @function
displayArray:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR -24[rbp], rdi
        mov     DWORD PTR -28[rbp], esi
        mov     DWORD PTR -4[rbp], 0
        jmp     .L2
.L3:
        lea     rdi, .LC0[rip]
        call    writeStr@PLT
        mov     eax, DWORD PTR -4[rbp]
        mov     edi, eax
        call    putInt@PLT
        lea     rdi, .LC1[rip]
        call    writeStr@PLT
        mov     eax, DWORD PTR -4[rbp]
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        mov     eax, DWORD PTR [rax]
        mov     edi, eax
        call    putInt@PLT
        lea     rdi, .LC2[rip]
        call    writeStr@PLT
        add     DWORD PTR -4[rbp], 1
.L2:
        mov     eax, DWORD PTR -4[rbp]
        cmp     eax, DWORD PTR -28[rbp]
        jl      .L3
        nop
        nop
        leave
        ret
        .size   displayArray, .-displayArray
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
