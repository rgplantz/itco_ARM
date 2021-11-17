# Computes n! recursively.        
# Calling sequence:
#       edi <- n
#       call    readLn
# returns n!
        .intel_syntax noprefix
# Stack frame
        .equ    n,-4
        .equ    localSize,-16

        .text
        .globl  factorial
        .type   factorial, @function
factorial:
        push    rbp                 # save frame pointer
        mov     rbp, rsp            # set new frame pointer
        add     rsp, localSize      # for local var.

        mov     n[rbp], edi         # save n
        mov     eax, 1              # assume at base case
        cmp     dword ptr n[rbp], 0 # at base case?
        je      done                # yes, done
        mov     edi, n[rbp]         # no,
        sub     edi, 1              #    compute (n-1)!
        call    factorial
        mul     dword ptr n[rbp]    # n! = n*(n-1)!
done:
        mov     rsp, rbp            # restore stack pointer
        pop     rbp                 # and caller frame pointer
        ret
