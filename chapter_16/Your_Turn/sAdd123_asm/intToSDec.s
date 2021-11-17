# intToSDec.s
# Converts int to corresponding signed decimal string

# Calling sequence
#       esi <- value of the int
#       rdi <- address of string
#       call intToSDec
#       returns zero
        .intel_syntax noprefix

# Code
        .text
        .globl	intToSDec
        .type   intToSDec, @function
intToSDec:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer

        cmp     esi, 0      # >= 0?
        jge     positive    # yes, just convert it
        mov     byte ptr [rdi], '-' # store minus sign
        inc     rdi         # and move the pointer
        neg     esi         # negate the number
positive:
        call    intToUDec   # rest is unsigned
	
        mov     eax, 0      # return 0;
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

