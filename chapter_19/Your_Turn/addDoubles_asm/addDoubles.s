# addDoubles.s
# Adds two doubles.
        .intel_syntax noprefix
# Stack frame
        .equ    x,-32
        .equ    y, -24
        .equ    canary,-8
        .equ    localSize,-32
# Constant data
        .section	.rodata
prompt:
        .string "Enter a number: "
scanFormat:
        .string "%lf"
printFormat:
        .string "%lf + %lf = %lf\n"
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
        
        movsd   xmm0, x[rbp]    # load x
        movsd   xmm1, y[rbp]    # load y
        movsd   xmm2, xmm0      # compute
        addsd   xmm2, xmm1      #     x + y
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

