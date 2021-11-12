# putInt.s
# writes a signed int to standard out

# Calling sequence
#       edi <- value of the int
#       call putInt
        .intel_syntax noprefix

# Stack frame
        .equ    canary,-8
        .equ    buffer,-20
        .equ    localSize,-32
# Code
        .text
        .globl  putInt
        .type   putInt, @function
putInt:
        push    rbp             # save frame pointer
        mov     rbp, rsp        # set new frame pointer
        add     rsp, localSize  # for local var.
        mov     rax, fs:40      # get canary
        mov     canary[rbp], rax  #   and save

        mov     esi, edi        # number to convert
        lea     rdi, buffer[rbp]  # place to store string
        call    intToSDec   # do the conversion to string
        
        lea     rdi, buffer[rbp]  # place where string stored
        call    writeStr    # write it
        
        mov     eax, 0
        mov     rsi, canary[rbp]
        xor     rsi, fs:40
        je      stackGood
        call    __stack_chk_fail@plt
stackGood:
        mov     rsp, rbp        # restore stack pointer
        pop     rbp             # and caller frame pointer
        ret

