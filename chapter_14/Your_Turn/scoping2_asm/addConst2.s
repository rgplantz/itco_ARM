# addConst2.s
# Adds constant to automatic, static, global variables.
        .intel_syntax noprefix

# Stack frame
        .equ    x,-4
        .equ    localSize,-16
# Useful constants
        .equ    ADDITION0,1000
        .equ    ADDITION1,2000
        .equ    INITx,78
        .equ    INITy,90
        .equ    INITn,0
# Constant data
        .section  .rodata
        .align  8
format0:
        .string "In addConst0:%8i %8i %8i  called %i times\n"
format1:
        .string "In addConst1:%8i %8i %8i  called %i times\n"
# Define static variables
        .data
        .align 4
        .type   y_addConst0, @object
y_addConst0:
        .int    INITy
        .type   n_addConst0, @object
n_addConst0:
        .int    INITn
        .type   y_addConst1, @object
y_addConst1:
        .int    INITy
        .type   n_addConst1, @object
n_addConst1:
        .int    INITn

# Code
        .text
        .globl  addConst0
        .type   addConst0, @function
addConst0:
        push    rbp           # save frame pointer
        mov     rbp, rsp      # set new frame pointer
        add     rsp, localSize  # for local var.
        mov     dword ptr x[rbp], INITx   # initialize

        inc     dword ptr n_addConst0[rip]
        add     dword ptr x[rbp], ADDITION0 # add to vars
        add     dword ptr y_addConst0[rip], ADDITION0
        add     dword ptr z[rip], ADDITION0

        mov     r8d, n_addConst0[rip]
        mov     ecx, z[rip]   # print variables
        mov     edx, y_addConst0[rip]
        mov     esi, x[rbp]
        lea     rdi, format0[rip]
        mov     eax, 0          # no floats
        call    printf@plt

        mov     eax, 0      # return 0;
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

        .globl  addConst1
        .type   addConst1, @function
addConst1:
        push    rbp           # save frame pointer
        mov     rbp, rsp      # set new frame pointer
        add     rsp, localSize  # for local var.
        mov     dword ptr x[rbp], INITx   # initialize

        inc     dword ptr n_addConst1[rip]
        add     dword ptr x[rbp], ADDITION1 # add to vars
        add     dword ptr y_addConst1[rip], ADDITION1
        add     dword ptr z[rip], ADDITION1

        mov     r8d, n_addConst1[rip]
        mov     ecx, z[rip]   # print variables
        mov     edx, y_addConst1[rip]
        mov     esi, x[rbp]
        lea     rdi, format1[rip]
        mov     eax, 0          # no floats
        call    printf@plt

        mov     eax, 0      # return 0;
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret
