# helloWorld-int80.s
# Hello World program
# ld -e myStart -o helloWorld3-int80 helloWorld3-int80.o

        .intel_syntax noprefix
# Useful constants
        .equ    STDOUT, 1   # screen
        .equ    WRITE, 4    # write system call
        .equ    EXIT, 1     # exit system call
        
        .text
        .section  .rodata       # read-only data
message:
        .string "Hello, World!\n"
        .equ    msgLength, .-message-1

# Code
        .text                   # code
        .globl  myStart

myStart:
        mov     edx, msgLength  # message length       
        lea     ecx, message[rip]  # message address
        mov     ebx, STDOUT     # the screen
        mov     eax, WRITE      # write the message
        int     0x80            # tell OS to do it

        mov     eax, EXIT       # exit program
        int     0x80



