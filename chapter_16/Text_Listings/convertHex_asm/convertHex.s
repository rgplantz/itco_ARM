# convertHex.s
        .intel_syntax noprefix
# Stack frame
        .equ    myString,-48
        .equ    myInt, -16
        .equ    canary,-8
        .equ    localSize,-48
# Useful constants
        .equ    MAX,20                # character buffer limit
# Constant data
        .section	.rodata
        .align  8
prompt:
        .string "Enter up to 16 hex characters: "
format:
        .string "%lx = %li\n"
# Code
        .text
        .globl	main
        .type	  main, @function
main:
        push    rbp                   # save frame pointer
        mov     rbp, rsp              # set new frame pointer
        add     rsp, localSize        # for local var.
        mov     rax, qword ptr fs:40  # get canary
        mov     qword ptr canary[rbp], rax

        lea     rdi, prompt[rip]      # prompt user
        call    writeStr
        
        mov     esi, MAX              # get user input
        lea     rdi, myString[rbp]
        call    readLn

        lea     rsi, myInt[rbp]       # for result
        lea     rdi, myString[rbp]    # convert to int
        call    hexToInt

        mov     rdx, myInt[rbp]       # converted value
        mov     rsi, myInt[rbp]
        lea     rdi, format[rip]      # printf format string
        mov     eax, 0
        call	  printf
        
        mov     eax, 0                # return 0;
        mov     rcx, canary[rbp]      # retrieve saved canary
        xor     rcx, fs:40            # and check it
        je      goodCanary
        call    __stack_chk_fail@PLT  # bad canary
goodCanary:
        mov     rsp, rbp              # restore stack pointer
        pop     rbp                   # and caller frame pointer
        ret
