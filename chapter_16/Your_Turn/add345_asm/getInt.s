# getInt.s
# reads an int from standard in

# Calling sequence
#       rdi <- pointer where to store the int
#       call getInt
#       returns 0
        .intel_syntax noprefix

# Useful contant
        .equ    MAX, 12  # includes NUL char and sign
# Stack frame
        .equ    canary,-8
        .equ    outPtr,-16
        .equ    buffer,-32
        .equ    localSize,-32
# Code
        .text
        .globl  getInt
        .type   getInt, @function
getInt:
        push    rbp             # save frame pointer
        mov     rbp, rsp        # set new frame pointer
        add     rsp, localSize  # for local var.
        mov     rax, fs:40      # get canary
        mov     canary[rbp], rax  #   and save
        
        mov     outPtr[rbp], rdi    # save argument

        mov     esi, MAX    # max number of chars
        lea     rdi, buffer[rbp]    # place where string stored
        call    readLn  # read it
        
        mov     rsi, outPtr[rbp]    # place to store number
        lea     rdi, buffer[rbp]    # address of string
        call    decToSInt   # convert string to int
        
        mov     eax, 0
        mov     rsi, canary[rbp]
        xor     rsi, fs:40
        je      stackGood
        call    __stack_chk_fail@plt
stackGood:
        mov     rsp, rbp        # restore stack pointer
        pop     rbp             # and caller frame pointer
        ret

