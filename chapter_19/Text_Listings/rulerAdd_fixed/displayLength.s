# displayLength.s
# Displays length in inches and 1/16s.
# Calling sequence:
#   edi <- value with 1/16s in low-order 4 bits
        .intel_syntax noprefix
# Useful constant
        .equ    fractionMask, 0xf
# Stack frame
        .equ    length,-16
        .equ    localSize,-16
# Constant data
        .section	.rodata
        .align 8
link:
        .string " "
over:
        .string "/16"
msg:
        .string "Total = "
endl:
        .string "\n"
# Code
        .text
        .globl  displayLength
        .type   displayLength, @function
displayLength:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        add     rsp, localSize  # for local var.
        
        mov     length[rbp], rdi    # save input length
        lea     rdi, msg[rip]   # nice message
        call    writeStr
        
        mov     edi, length[rbp]    # original value
        shr     edi, 4      # integer part
        call    putUInt     # write to screen
        lea     rdi, link[rip]
        call    writeStr
        
        mov     edi, length[rbp]    # original value
        and     edi, fractionMask   # fraction part
        call    putUInt     # write to screen
        lea     rdi, over[rip]
        call    writeStr

        lea     rdi, endl[rip]
        call    writeStr

        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

