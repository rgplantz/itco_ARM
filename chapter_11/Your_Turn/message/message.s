# message.s
# Prints a message on screen
        .intel_syntax noprefix
# Stack frame
        .equ    aMessage,-16
        .equ    canary,-8
        .equ    localSize,-16

# Constant data
        .section  .rodata
format:
        .string "There are %i characters in %s\n"

        .text
# Code 
        .globl  main
        .type   main, @function
main:
        push    rbp             # save caller's frame pointer
        mov     rbp, rsp        # establish our frame pointer
        add     rsp, localSize  # for local variable

        mov     rax, fs:40      # get stack canary
        mov     canary[rbp], rax    # and save it

        lea     rdi, aMessage[rbp]  # place to put message
        call    theMessage      # get the message

        lea     rdx, aMessage[rbp]  # the message
        mov     esi, eax        # number of characters
        lea     rdi, format[rip]    # format string
        mov     eax, -0         # no floating point
        call    printf@plt      # print it

        mov     eax, 0          # return 0

        mov     rcx, canary[rbp]    # retrieve saved canary
        xor     rcx, fs:40    # and check it
        je      goodCanary
        call    __stack_chk_fail@plt  # bad canary
goodCanary:
        mov     rsp, rbp      # delete local variables
        pop     rbp           # restore caller's frame pointer
        ret                   # back to calling function

