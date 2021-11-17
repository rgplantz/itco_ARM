# sum9Ints.s
# Sums the integers 1 - 9.
        .intel_syntax noprefix
        
# Stack frame
#   passing arguments on stack (rsp)
#     need 9x8 = 72 -> 80 bytes
        .equ    first,0
        .equ    second,8
        .equ    third,16
        .equ    fourth,24
        .equ    fifth,32
        .equ    sixth,40
        .equ    seventh,48
        .equ    eighth,56
        .equ    ninth,64
        .equ    argSize,-80
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
        push    rbp             # save frame pointer
        mov     rbp, rsp        # set new frame pointer
        add     rsp, localSize  # for local var.
        
        mov     dword ptr a[rbp], 1 # initialize values
        mov	dword ptr b[rbp], 2 #     etc...
        mov     dword ptr c[rbp], 3
        mov	dword ptr d[rbp], 4
        mov	dword ptr e[rbp], 5
        mov	dword ptr f[rbp], 6
        mov	dword ptr g[rbp], 7
        mov     dword ptr h[rbp], 8
        mov	dword ptr i[rbp], 9

        add     rsp, argSize    # space for arguments
        mov     eax, i[rbp]     # load i
        mov     ninth[rsp], rax #   9th argument
        mov     eax, h[rbp]     # load h
        mov     eighth[rsp], rax  #   8th argument
        mov     eax, g[rbp]     # load g
        mov	seventh[rsp], rax #   7th argument
        mov     eax, f[rbp]     # load f
        mov     sixth[rsp], rax #   6th argument
        mov     eax, e[rbp]     # load e
        mov     fifth[rsp], rax #   5th argument
        mov     eax, d[rbp]     # load d
        mov	fourth[rsp], rax  #   4th argument
        mov     eax, c[rbp]     # load c
        mov     third[rsp], rax   #   3rd argument
        mov     eax, b[rbp]     # load b
        mov     second[rsp], rax  #   2nd argument
        mov     eax, a[rbp]     # load a
        mov	first[rsp], rax #   1st argument
        call    addNine
        sub     rsp, argSize    # remove arguments
        mov     total[rbp], eax # total = sumNine(...)
	
        mov     esi, total[rbp] # show result
        lea     rdi, format[rip]
        mov     eax, 0
        call    printf@plt

        mov     eax, 0          # return 0;
        mov     rsp, rbp        # restore stack pointer
        pop     rbp             # and caller frame pointer
        ret


