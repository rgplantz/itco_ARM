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
ampersand:
        .string " & "
endl:
        .string "\n"
# Stack frame
        .equ    this,-16
        .equ    rem,-8
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

        mov     r11, this[rbp]  # load this pointer
        mov     eax, num[r11]   # numerator
        mov     edx, 0          # zero high-order
        div     dword ptr den[r11]
        mov     rem[rbp], edx   # save remainder
        mov     edi, eax        # print quotient
        call    putInt

        lea     rdi, ampersand[rip]  # and
        call    writeStr
        
        mov     edi, rem[rbp]   # remainder
        call    putInt
        lea     rdi, over[rip]  # slash
        call    writeStr

        mov     r11, this[rbp]  # load this pointer
        mov     edi, den[r11]
        call    putInt
        
        lea     rdi, endl[rip]  # newline
        call    writeStr

        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

