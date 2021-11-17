# addConstCount.s
# Adds constant to automatic, static, global variables.
        .intel_syntax noprefix

# Stack frame
        .equ    x,-4
        .equ    localSize,-16
# Useful constants
        .equ    ADDITION,1000
        .equ    INITx,78
        .equ    INITy,90
        .equ    INITn,0
# Constant data
        .section  .rodata
        .align  8
format:
        .string "In addConst:%8i %8i %8i  called %i times\n"
# Define static variables
        .data
        .align 4
        .type   y_addConst, @object
y_addConst:
        .int    INITy
        .type   n_addConst, @object
n_addConst:
        .int    INITn

# Code
        .text
        .globl  addConstCount
        .type   addConstCount, @function
addConstCount:
        push    rbp           # save frame pointer
        mov     rbp, rsp      # set new frame pointer
        add     rsp, localSize  # for local var.
        mov     dword ptr x[rbp], INITx   # initialize

        inc     dword ptr n_addConst[rip]
        add     dword ptr x[rbp], ADDITION # add to vars
        add     dword ptr y_addConst[rip], ADDITION
        add     dword ptr z[rip], ADDITION

        mov     r8d, n_addConst[rip]
        mov     ecx, z[rip]   # print variables
        mov     edx, y_addConst[rip]
        mov     esi, x[rbp]
        lea     rdi, format[rip]
        mov     eax, 0          # no floats
        call    printf@plt

        mov     eax, 0      # return 0;
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret
