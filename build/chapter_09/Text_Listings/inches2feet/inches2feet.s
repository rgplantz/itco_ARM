        .file   "inches2feet.c"
        .intel_syntax noprefix
        .text
        .section        .rodata
.LC0:
        .string "Enter inches: "
.LC1:
        .string "%i"
.LC2:
        .string "%i\" = %i' %i\"\n"
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp
        mov     rbp, rsp
        push    r12
        push    rbx
        sub     rsp, 32
        mov     rax, QWORD PTR fs:40
        mov     QWORD PTR -24[rbp], rax
        xor     eax, eax
        lea     rax, -36[rbp]
        mov     QWORD PTR -32[rbp], rax
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    printf@PLT
        mov     rax, QWORD PTR -32[rbp]
        mov     rsi, rax
        lea     rdi, .LC1[rip]
        mov     eax, 0
        call    __isoc99_scanf@PLT
        mov     eax, DWORD PTR -36[rbp]
        movsx   rdx, eax
        imul    rdx, rdx, 715827883
        shr     rdx, 32
        sar     edx
        sar     eax, 31
        sub     edx, eax
        mov     r12d, edx
        mov     edx, DWORD PTR -36[rbp]
        movsx   rax, edx
        imul    rax, rax, 715827883
        shr     rax, 32
        mov     ecx, eax
        sar     ecx
        mov     eax, edx
        sar     eax, 31
        mov     ebx, ecx
        sub     ebx, eax
        mov     eax, ebx
        add     eax, eax
        add     eax, ebx
        sal     eax, 2
        mov     ebx, edx
        sub     ebx, eax
        mov     eax, DWORD PTR -36[rbp]
        mov     ecx, ebx
        mov     edx, r12d
        mov     esi, eax
        lea     rdi, .LC2[rip]
        mov     eax, 0
        call    printf@PLT
        mov     eax, 0
        mov     rsi, QWORD PTR -24[rbp]
        xor     rsi, QWORD PTR fs:40
        je      .L3
        call    __stack_chk_fail@PLT
.L3:
        add     rsp, 32
        pop     rbx
        pop     r12
        pop     rbp
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
