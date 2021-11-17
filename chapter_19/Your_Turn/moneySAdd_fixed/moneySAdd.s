# moneySAdd.s
# Adds two money amounts in dollars and cents.
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

        lea     rdi, x[rbp] # x amount
        call    getSMoney
        
        lea     rdi, y[rbp] # y amount
        call    getSMoney

        mov     edi, x[rbp] # retrieve x amount
        add     edi, y[rbp] # add y amount
        call    displaySMoney

        mov     eax, 0      # return 0;
        mov     rcx, qword ptr canary[rbp]
        xor     rcx, qword ptr fs:40
        je      allOK
        call    __stack_chk_fail@plt
allOK:
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

