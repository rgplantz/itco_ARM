# convertUDec.s
        .intel_syntax noprefix
# Stack frame
        .equ    myString,-48
        .equ    myInt, -12
        .equ    canary,-8
        .equ    localSize,-48
# Useful constants
        .equ    MAX,11      # character buffer limit
# Constant data
        .section	.rodata
        .align 8
prompt:
        .string	"Enter an unsigned integer: "
format:
        .string	"\"%s\" is stored as 0x%x\n"
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

        lea     rdi, prompt[rip]    # prompt user
        call    writeStr
        
        mov     esi, MAX    # get user input
        lea     rdi, myString[rbp]
        call    readLn

        lea     rsi, myInt[rbp]     # for result
        lea     rdi, myString[rbp]  # convert to int
        call    decToUInt

        mov     edx, myInt[rbp]     # converted value
        lea     rsi, myString[rbp]  # echo user input
        lea     rdi, format[rip]    # printf format string
        mov     eax, 0
        call	printf
        
        mov     eax, 0      # return 0;
        mov     rcx, qword ptr canary[rbp]
        xor     rcx, qword ptr fs:40
        je      allOK
        call    __stack_chk_fail@plt
allOK:
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

