        .file   "inc2Fractions.cpp"
        .intel_syntax noprefix
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 40
        mov     rax, QWORD PTR fs:40
        mov     QWORD PTR -24[rbp], rax
        xor     eax, eax
        lea     rax, -40[rbp]
        mov     rdi, rax
        call    _ZN8fractionC1Ev@PLT
        lea     rax, -40[rbp]
        mov     rdi, rax
        call    _ZN8fraction7displayEv@PLT
        lea     rax, -40[rbp]
        mov     rdi, rax
        call    _ZN8fraction3getEv@PLT
        lea     rax, -40[rbp]
        mov     esi, 1
        mov     rdi, rax
        call    _ZN8fraction3addEi@PLT
        lea     rax, -40[rbp]
        mov     rdi, rax
        call    _ZN8fraction7displayEv@PLT
        lea     rax, -32[rbp]
        mov     edx, 2
        mov     esi, 1
        mov     rdi, rax
        call    _ZN8fractionC1Eii@PLT
        lea     rax, -32[rbp]
        mov     rdi, rax
        call    _ZN8fraction7displayEv@PLT
        lea     rax, -32[rbp]
        mov     rdi, rax
        call    _ZN8fraction3getEv@PLT
        lea     rax, -32[rbp]
        mov     esi, 1
        mov     rdi, rax
        call    _ZN8fraction3addEi@PLT
        lea     rax, -32[rbp]
        mov     rdi, rax
        call    _ZN8fraction7displayEv@PLT
        mov     ebx, 0
        lea     rax, -32[rbp]
        mov     rdi, rax
        call    _ZN8fractionD1Ev@PLT
        lea     rax, -40[rbp]
        mov     rdi, rax
        call    _ZN8fractionD1Ev@PLT
        mov     eax, ebx
        mov     rcx, QWORD PTR -24[rbp]
        xor     rcx, QWORD PTR fs:40
        je      .L3
        call    __stack_chk_fail@PLT
.L3:
        add     rsp, 40
        pop     rbx
        pop     rbp
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
