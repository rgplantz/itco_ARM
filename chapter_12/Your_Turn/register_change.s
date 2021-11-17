# register_change.s
# Some instructions to illustrate machine code.
        .intel_syntax noprefix
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp         # save caller's frame pointer
        mov     rbp, rsp    # establish our frame pointer
        
        mov     ecx, eax    # 32 bits, low reg codes
        mov     edx, ebx    # highest reg codes
        mov     bx, dx      # 16 bits
        mov     bl, dl      # 8 bits
        mov     r11d, r10d  # 32 bits, 64-bit register
        mov     rdx, rbx    # 64 bits

        mov     eax, 0      # return 0 to os
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         #   and frame pointer
        ret                 # back to caller
