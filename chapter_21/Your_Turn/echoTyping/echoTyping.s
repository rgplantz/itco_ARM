# echoTyping.s
# Shows your typing
# Does not use C libraries
        .intel_syntax noprefix
# Useful constants
        .equ    STDIN,0
        .equ    STDOUT,1
        .equ    enter,'\n'
   # from asm/unistd_64.h
        .equ    READ,0
        .equ    WRITE,1
        .equ    EXIT,60
# Stack frame
        .equ    aChar,-16
        .equ    localSize,-16
# Data
        .section    .rodata
msg:
        .ascii  "Enter up to 127 characters and press enter:\n"
        .equ    msgsize, .-msg
# Code
        .text               # text segment
        .globl  myStart
        .type   myStart, @function
myStart:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        add     rsp, localSize  # for local var.

        mov     rdx, msgsize    # prompt user
        lea     rsi, msg[rip]
        mov     rdi, STDOUT
        mov     eax, WRITE
        syscall
        
        lea     rbx, aChar[rbp] # place to store input
rwLoop:
        mov     rdx, 1      # one character
        mov     rsi, rbx
        mov     rdi, STDIN
        mov     eax, READ
        syscall             # request kernel service

        mov     rdx, 1      # one character
        mov     rsi, rbx
        mov     rdi, STDOUT
        mov     eax, WRITE
        syscall             # request kernel service

        cmp     byte ptr [rbx], enter   # enter key?
        je      allDone     # yes, all done
        inc     rbx         # no, increment pointer
        jmp     rwLoop      # and continue
allDone:
        mov     rsp, rbp    # yes, restore stack pointer
        pop     rbp         # and caller frame pointer
        mov     eax, EXIT   # end this process
        syscall

