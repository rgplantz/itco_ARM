# incFraction.s
# Gets numerator and denominator of a fraction
# from user and adds 1 to the fraction.
        .intel_syntax noprefix
# Stack frame
        .equ    x,-16
        .equ    canary,-8
        .equ    localSize,-16
# Constant data
        .section	.rodata
        .align 8
# Code
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        add     rsp, localSize  # for local var.
        mov     rax, qword ptr fs:40    # get canary
        mov     canary[rbp], rax

        lea     rdi, x[rbp] # address of object
        call    fraction_construct  # construct it
        
        lea     rdi, x[rbp] # address of object
        call    fraction_display # display fraction
        
        lea     rdi, x[rbp] # address of object
        call    fraction_get  # get fraction values
        
        mov     esi, 1      # amount to add
        lea     rdi, x[rbp] # address of object
        call    fraction_add  # add it

        lea     rdi, x[rbp] # address of object
        call    fraction_display # display fraction
        
        lea     rdi, x[rbp] # address of object
        call    fraction_destruct   # delete fraction
        
        mov     eax, 0      # return 0;
        mov     rcx, canary[rbp]
        xor     rcx, qword ptr fs:40
        je      allOK
        call    __stack_chk_fail@plt
allOK:
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

