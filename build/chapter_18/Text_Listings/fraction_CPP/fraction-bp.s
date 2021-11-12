        .file   "fraction.cpp"
        .intel_syntax noprefix
        .text
        .globl  numMsg
        .data
        .align 16
        .type   numMsg, @object
        .size   numMsg, 18
numMsg:
        .string "Enter numerator: "
        .globl  denMsg
        .align 16
        .type   denMsg, @object
        .size   denMsg, 20
denMsg:
        .string "Enter denominator: "
        .globl  over
        .type   over, @object
        .size   over, 2
over:
        .string "/"
        .globl  endl
        .type   endl, @object
        .size   endl, 2
endl:
        .string "\n"
        .text
        .align 2
        .globl  _ZN8fractionC2Ev
        .type   _ZN8fractionC2Ev, @function
_ZN8fractionC2Ev:                        ## constructor
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR -8[rbp], rdi    ## this pointer
        mov     rax, QWORD PTR -8[rbp]    ## load addr of object
        mov     DWORD PTR [rax], 0        ## num= 0;
        mov     rax, QWORD PTR -8[rbp]
        mov     DWORD PTR 4[rax], 1       ## den = 1;
        nop
        pop     rbp
        ret
        .size   _ZN8fractionC2Ev, .-_ZN8fractionC2Ev
        .globl  _ZN8fractionC1Ev
        .set    _ZN8fractionC1Ev,_ZN8fractionC2Ev
        .align 2
        .globl  _ZN8fractionD2Ev
        .type   _ZN8fractionD2Ev, @function
_ZN8fractionD2Ev:                         ## destructor
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR -8[rbp], rdi    ## this pointer
        nop
        pop     rbp
        ret
        .size   _ZN8fractionD2Ev, .-_ZN8fractionD2Ev
        .globl  _ZN8fractionD1Ev
        .set    _ZN8fractionD1Ev,_ZN8fractionD2Ev
        .align 2
        .globl  _ZN8fraction3getEv
        .type   _ZN8fraction3getEv, @function
_ZN8fraction3getEv:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR -8[rbp], rdi    ## this pointer
        lea     rdi, numMsg[rip]
        call    writeStr@PLT
        mov     rax, QWORD PTR -8[rbp]
        mov     rdi, rax
        call    getInt@PLT
        lea     rdi, denMsg[rip]
        call    writeStr@PLT
        mov     rax, QWORD PTR -8[rbp]
        add     rax, 4
        mov     rdi, rax
        call    getInt@PLT
        nop
        leave
        ret
        .size   _ZN8fraction3getEv, .-_ZN8fraction3getEv
        .align 2
        .globl  _ZN8fraction7displayEv
        .type   _ZN8fraction7displayEv, @function
_ZN8fraction7displayEv:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR -8[rbp], rdi    ## this pointer
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR [rax]
        mov     edi, eax
        call    putInt@PLT
        lea     rdi, over[rip]
        call    writeStr@PLT
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 4[rax]
        mov     edi, eax
        call    putInt@PLT
        lea     rdi, endl[rip]
        call    writeStr@PLT
        nop
        leave
        ret
        .size   _ZN8fraction7displayEv, .-_ZN8fraction7displayEv
        .align 2
        .globl  _ZN8fraction3addEi
        .type   _ZN8fraction3addEi, @function
_ZN8fraction3addEi:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR -8[rbp], rdi    ## this pointer
        mov     DWORD PTR -12[rbp], esi
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, DWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 4[rax]
        imul    eax, DWORD PTR -12[rbp]
        add     edx, eax
        mov     rax, QWORD PTR -8[rbp]
        mov     DWORD PTR [rax], edx
        nop
        pop     rbp
        ret
        .size   _ZN8fraction3addEi, .-_ZN8fraction3addEi
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits

