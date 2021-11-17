# echoTyping.s
# Echos your typing
        .intel_syntax noprefix
# Useful constants
        .equ    STDIN,0
        .equ    STDOUT,1
        .equ    ENTER,'\n'
   # from asm/unistd_64.h
        .equ    READ,0
        .equ    WRITE,1
# Stack frame
        .equ    theText,-128
        .equ    localSize,-128
# Data
        .section    .rodata
msg1:
        .ascii  "Enter up to 127 characters and press enter:\n"
        .equ    msg1size, .-msg1
msg2:
        .ascii  "You entered:\n"
        .equ    msg2size, .-msg2
        
# Code
        .text               # text segment
        .globl  main
        .type   main, @function
main:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        add     rsp, localSize  # for local var.

        mov     rdx, msg1size   # prompt user
        lea     rsi, msg1[rip]
        mov     edi, STDOUT
        call    write@plt
        
        lea     rbx, theText[rbp]   # place to store input
readLoop:
        mov     rdx, 1      # one character
        mov     rsi, rbx
        mov     rdi, STDIN
        call    read@plt
        cmp     byte ptr [rbx], ENTER   # enter key?
        je      show        # yes, show user
        inc     rbx         # no, increment pointer
        jmp     readLoop    # and continue
show:
        mov     rdx, msg2size   # show user
        lea     rsi, msg2[rip]
        mov     rdi, STDOUT
        call    write@plt

        lea     rbx, theText[rbp]   # place input stored
writeLoop:
        mov     rdx, 1      # one character
        mov     rsi, rbx
        mov     rdi, STDOUT
        call    write@plt
        cmp     byte ptr [rbx], ENTER   # enter key?
        je      allDone     # yes, all done
        inc     rbx         # no, increment pointer
        jmp     writeLoop   # and continue
allDone:
        mov     eax, 0      # return 0;
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret                 # end program

