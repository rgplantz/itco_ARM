# fraction_get.s
# Gets numerator and denominator from keyboard
# Calling sequence:
#   rdi <- address of object
        .intel_syntax noprefix
        .include    "fraction"
# Messages
        .data
numMsg:
        .string "Enter numerator: "
denMsg:
        .string "Enter denominator: "
# Stack frame
        .equ    this,-16
        .equ    localSize,-16
# Code
        .text
        .globl  fraction_get
        .type   fraction_get, @function
fraction_get:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        add     rsp, localSize    # for local var.
        mov     this[rbp], rdi    # this pointer

        lea     rdi, numMsg[rip]  # prompt message
        call    writeStr
        mov     rax, this[rbp]    # load this pointer
        lea     rdi, num[rax]
        call    getInt
        
        lea     rdi, denMsg[rip]
        call    writeStr
        mov     rax, this[rbp]    # load this pointer
        lea     rdi, den[rax]
        call    getInt
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

