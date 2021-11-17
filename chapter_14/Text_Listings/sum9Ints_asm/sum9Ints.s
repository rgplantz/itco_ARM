# sum9Ints.s
# Sums the integers 1 - 9.
        .intel_syntax noprefix
        
# Stack frame
#   passing arguments on stack (rsp)
#     need 3x8 = 24 -> 32 bytes
        .equ    seventh,0
        .equ    eighth,8
        .equ    ninth,16
        .equ    argSize,-32
#   local vars (rbp)
#     need 10x4 = 40 -> 48 bytes for alignment
        .equ    i,-4
        .equ    h,-8
        .equ    g,-12
        .equ    f,-16
        .equ    e,-20
        .equ    d,-24
        .equ    c,-28
        .equ    b,-32
        .equ    a,-36
        .equ    total,-40
        .equ    localSize,-48
# Read only data
        .section  .rodata
format:
        .string "The sum is %i\n"
# Code
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp                 # save frame pointer
        mov     rbp, rsp            # set new frame pointer
        add     rsp, localSize      # for local var.
        
        mov     dword ptr a[rbp], 1 # initialize values
        mov     dword ptr b[rbp], 2 #     etc...
        mov     dword ptr c[rbp], 3
        mov     dword ptr d[rbp], 4
        mov     dword ptr e[rbp], 5
        mov     dword ptr f[rbp], 6
        mov     dword ptr g[rbp], 7
        mov     dword ptr h[rbp], 8
        mov     dword ptr i[rbp], 9

        add     rsp, argSize        # space for arguments
        mov     eax, i[rbp]         # load i
        mov     ninth[rsp], rax     #   9th argument
        mov     eax, h[rbp]         # load h
        mov     eighth[rsp], rax    #   8th argument
        mov     eax, g[rbp]         # load g
        mov     seventh[rsp], rax   #   7th argument
        mov     r9d, f[rbp]         # f is 6th
        mov     r8d, e[rbp]         # e is 5th
        mov     ecx, d[rbp]         # d is 4th
        mov     edx, c[rbp]         # c is 3rd
        mov     esi, b[rbp]         # b is 2nd
        mov     edi, a[rbp]         # a is 1st
        call    addNine
        sub     rsp, argSize        # remove arguments
        mov     total[rbp], eax     # total = sumNine(...)
	
        mov     esi, total[rbp]     # show result
        lea     rdi, format[rip]
        mov     eax, 0
        call    printf@plt

        mov     eax, 0              # return 0;
        mov     rsp, rbp            # restore stack pointer
        pop     rbp                 # and caller frame pointer
        ret
