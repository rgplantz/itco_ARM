        .file   "fill2XIndex.c"
        .intel_syntax noprefix
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48         ## memory for array
        mov     rax, QWORD PTR fs:40
        mov     QWORD PTR -8[rbp], rax
        xor     eax, eax
        lea     rax, -48[rbp]   ## load address of array
        mov     esi, 10         ## number of elements
        mov     rdi, rax        ## pass address
        call    twiceIndex@PLT
        lea     rax, -48[rbp]   ## load address of array
        mov     esi, 10         ## number of elements
        mov     rdi, rax        ## pass address
        call    displayArray@PLT
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
