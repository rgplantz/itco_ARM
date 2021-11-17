# upperCase.s
# Makes user alphabetic text string all upper case
        .intel_syntax noprefix
# Stack frame
        .equ    myString,-64
        .equ    canary,-8
        .equ    localSize,-64
# Useful constants
        .equ    upperMask,0xdf
        .equ    MAX,50                # character buffer limit
        .equ    NUL,0
# Constant data
        .section  .rodata
        .align  8
prompt:
        .string "Enter up to 50 alphabetic characters: "
message:
        .string "All upper: "
newLine:
        .string "\n"
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
        
        mov     esi, MAX              # limit user input
        lea     rdi, myString[rbp]    # place to store input
        call    readLn

        lea     rsi, myString[rbp]    # destination string
        lea     rdi, myString[rbp]    # source string
        call    toUpper
        
        lea     rdi, message[rip]     # tell user
        call    writeStr

        lea     rdi, myString[rbp]    # result
        call    writeStr
        lea     rdi, newLine[rip]     # some formatting
        call    writeStr

        mov     eax, 0                # return 0;
        mov     rcx, canary[rbp]      # retrieve saved canary
        xor     rcx, fs:40            # and check it
        je      goodCanary
        call    __stack_chk_fail@PLT  # bad canary
goodCanary:
        mov     rsp, rbp              # restore stack pointer
        pop     rbp                   # and caller frame pointer
        ret
