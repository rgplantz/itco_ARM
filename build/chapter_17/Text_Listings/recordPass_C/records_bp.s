        .file   "records.c"
        .intel_syntax noprefix
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32           ## memory for 2 records
        mov     rax, QWORD PTR fs:40
        mov     QWORD PTR -8[rbp], rax
        xor     eax, eax
        lea     rax, -32[rbp]     ## address of x record
        mov     ecx, 98           ## data to store in it
        mov     edx, 123
        mov     esi, 97
        mov     rdi, rax
        call    loadRecord@PLT
        lea     rax, -20[rbp]     ## address of y record
        mov     ecx, 50           ## data to store in it
        mov     edx, 456
        mov     esi, 49
        mov     rdi, rax
        call    loadRecord@PLT
        mov     rdx, QWORD PTR -32[rbp] ## 8 bytes of x
        mov     eax, DWORD PTR -24[rbp] ## 4 more bytes of x
        mov     rdi, rdx
        mov     esi, eax
        call    displayRecord@PLT
        mov     rdx, QWORD PTR -20[rbp] ## 8 bytes of y
        mov     eax, DWORD PTR -12[rbp] ## 4 more bytes of y
        mov     rdi, rdx
        mov     esi, eax
        call    displayRecord@PLT
        mov     eax, 0
        mov     rcx, QWORD PTR -8[rbp]
        xor     rcx, QWORD PTR fs:40
        je      .L3
        call    __stack_chk_fail@PLT
.L3:
        leave
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
