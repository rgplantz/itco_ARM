# helloBob.s
# Hello Bob program using the write() system call
        .intel_syntax noprefix
# Useful constant
        .equ    STDOUT, 1
# Constant data       
        .section  .rodata       
message:
        .string "Hello, Bob!\n"
        .equ    msgLength, .-message-1

# Code
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp             # save caller's frame pointer
        mov     rbp, rsp        # our frame pointer

        mov     edx, msgLength  # message length       
        lea     rsi, message[rip]  # message address
        mov     edi, STDOUT     # the screen
        call    write@plt       # write message

        mov     eax, 0          # return 0

        pop     rbp             # restore caller frame pointer
        ret                     # back to caller

