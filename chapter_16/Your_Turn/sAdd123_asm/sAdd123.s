# sAdd123.s
# Adds 123 to an int.
        .intel_syntax noprefix
# Stack frame
        .equ    myString,-32
        .equ    myInt, -12
        .equ    canary,-8
        .equ    localSize,-32
# Useful constants
        .equ    MAX,12      # character buffer limit
# Constant data
        .section	.rodata
        .align 8
prompt:
        .string	"Enter a signed integer: "
message:
        .string	"The result is: "
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

        lea     rdi, prompt[rip]    # prompt user
        call    writeStr
        
        mov     esi, MAX    # get user input
        lea     rdi, myString[rbp]
        call    readLn

        lea     rsi, myInt[rbp]     # for result
        lea     rdi, myString[rbp]  # convert to int
        call    decToSInt

        mov     eax, dword ptr myInt[rbp]
        add     eax, 123
        mov     dword ptr myInt[rbp], eax

        mov     esi, myInt[rbp]     # the number
        lea     rdi, myString[rbp]  # place for string
        call    intToSDec
        
        lea     rdi, message[rip]   # message for user
        call    writeStr
        
        lea     rdi, myString[rbp]  # number in text
        call    writeStr
        
        lea     rdi, endl[rip]
        call    writeStr

        mov     eax, 0      # return 0;
        mov     rcx, qword ptr canary[rbp]
        xor     rcx, qword ptr fs:40
        je      allOK
        call    __stack_chk_fail@plt
allOK:
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

