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
        mov     QWORD PTR -24[rbp], rdi ## save array address
        mov     DWORD PTR -28[rbp], esi ## and num of elements
        mov     DWORD PTR -4[rbp], 0    ## i = 0
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
        cdqe                            ## to 64 bits
        lea     rdx, 0[0+rax*4]         ## element offset
        mov     rax, QWORD PTR -24[rbp] ## array address
        add     rax, rdx                ## element address
        mov     eax, DWORD PTR [rax]    ## load element
        mov     edi, eax                ## argument reg.
        call    putInt@PLT
        lea     rdi, .LC2[rip]
        call    writeStr@PLT
        add     DWORD PTR -4[rbp], 1    ## i++
.L2:
        mov     eax, DWORD PTR -4[rbp]  ## load new i
        cmp     eax, DWORD PTR -28[rbp] ## i < nElements?
        jl      .L3                     ## yes, loop back
        nop                             ## no, all done
        nop
        leave
        ret
        .size   displayArray, .-displayArray
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
