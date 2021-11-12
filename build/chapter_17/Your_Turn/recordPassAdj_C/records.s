        .file   "records.c"
        .intel_syntax noprefix
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
        lea     rax, -24[rbp]
        mov     ecx, 98
        mov     edx, 123
        mov     esi, 97
        mov     rdi, rax
        call    loadRecord@PLT
        lea     rax, -16[rbp]
        mov     ecx, 50
        mov     edx, 456
        mov     esi, 49
        mov     rdi, rax
        call    loadRecord@PLT
        mov     rax, QWORD PTR -24[rbp]
        mov     rdi, rax
        call    displayRecord@PLT
        mov     rax, QWORD PTR -16[rbp]
        mov     rdi, rax
        call    displayRecord@PLT
        mov     eax, 0
        mov     rdx, QWORD PTR -8[rbp]
        xor     rdx, QWORD PTR fs:40
        je      .L3
        call    __stack_chk_fail@PLT
.L3:
        leave
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
