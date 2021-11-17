# helloWorld-syscall.s
# Hello World program
# ld -e myStart -o helloWorld3_int80 helloWorld3_int80.o
        .intel_syntax noprefix
# Useful constants
        .equ    STDOUT, 1   # screen
        .equ    WRITE, 1    # write system call
        .equ    EXIT, 60    # exit system call
        
        .text
        .section  .rodata       # read-only data
message:
        .string "Hello, World!\n"
        .equ    msgLength, .-message-1

# Code
        .text                   # code
        .globl  myStart

myStart:
        mov     rdx, msgLength  # message length       
        lea     rsi, message[rip]  # message address
        mov     rdi, STDOUT     # the screen
        mov     rax, WRITE      # write the message
        syscall                 # tell OS to do it

        mov     rax, EXIT       # exit program
        syscall



