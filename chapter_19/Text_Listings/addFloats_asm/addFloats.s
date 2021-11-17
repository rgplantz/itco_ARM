# addFloats.s
# Adds two floats.
        .intel_syntax noprefix
# Stack frame
        .equ    x,-20
        .equ    y,-16
        .equ    z,-12
        .equ    canary,-8
        .equ    localSize,-32
# Constant data
        .section	.rodata
prompt:
        .string "Enter a number: "
scanFormat:
        .string "%f"
printFormat:
        .string "%f + %f = %f\n"
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

        lea     rdi, prompt[rip]  # prompt for input
        mov     eax, 0
        call    printf@plt
        lea     rsi, x[rbp]       # read x
        lea     rdi, scanFormat[rip]
        mov     eax, 0
        call    __isoc99_scanf@plt
        
        lea     rdi, prompt[rip]  # prompt for input
        mov     eax, 0
        call    printf@plt
        lea     rsi, y[rbp]       # read y
        lea     rdi, scanFormat[rip]
        mov     eax, 0
        call    __isoc99_scanf@plt
        
        movss   xmm2, x[rbp]    # load x
        addss   xmm2, y[rbp]    # compute
        movss   z[rbp], xmm2    #     x + y
        cvtss2sd   xmm0, x[rbp] # convert to double
        cvtss2sd   xmm1, y[rbp] # convert to double
        cvtss2sd   xmm2, z[rbp] # convert to double
        lea     rdi, printFormat[rip]
        mov     eax, 3          # 3 xmm regs.
        call    printf@plt

        mov     eax, 0      # return 0;
        mov     rcx, qword ptr canary[rbp]
        xor     rcx, qword ptr fs:40
        je      allOK
        call    __stack_chk_fail@plt
allOK:
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

