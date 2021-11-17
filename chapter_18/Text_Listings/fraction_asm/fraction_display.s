# fraction_display.s
# Displays fraction
# Calling sequence:
#   rdi <- address of object
        .intel_syntax noprefix
        .include    "fraction"
# Text for fraction_display
        .data
over:
        .string "/"
endl:
        .string "\n"
# Stack frame
        .equ    this,-16
        .equ    localSize,-16
# Code
        .text
        .globl  fraction_display
        .type   fraction_display, @function
fraction_display:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        add     rsp, localSize  # for local var.
        mov     this[rbp], rdi  # this pointer

        mov     rax, this[rbp]  # load this pointer
        mov     edi, num[rax]
        call    putInt
        
        lea     rdi, over[rip]  # slash
        call    writeStr

        mov     rax, this[rbp]  # load this pointer
        mov     edi, den[rax]
        call    putInt
        
        lea     rdi, endl[rip]  # newline
        call    writeStr

        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

