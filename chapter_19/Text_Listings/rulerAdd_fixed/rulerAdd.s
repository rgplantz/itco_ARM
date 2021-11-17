# rulerAdd.s
# Adds two ruler measurements, to nearest 1/16 inch.
        .intel_syntax noprefix
# Stack frame
        .equ    x,-16
        .equ    y, -12
        .equ    canary,-8
        .equ    localSize,-16
# Constant data
        .section	.rodata
        .align 8
endl:
        .string "\n"
# Code
        .text
        .globl	main
        .type	main, @function
main:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        add     rsp, localSize  # for local var.
        mov     rax, qword ptr fs:40    # get canary
        mov     qword ptr canary[rbp], rax

        lea     rdi, x[rbp] # x length
        call    getLength
        
        lea     rdi, y[rbp] # y length
        call    getLength

        mov     edi, x[rbp] # retrieve x length
        add     edi, y[rbp] # add y length
        call    displayLength

        mov     eax, 0      # return 0;
        mov     rcx, qword ptr canary[rbp]
        xor     rcx, qword ptr fs:40
        je      allOK
        call    __stack_chk_fail@plt
allOK:
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

