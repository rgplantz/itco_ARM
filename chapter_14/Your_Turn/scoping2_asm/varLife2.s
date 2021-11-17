# varLife2.s
# Compares scope and lifetime of automatic, static, and global variables.
        .intel_syntax noprefix

# Stack frame
        .equ    x,-8
        .equ    y,-4
        .equ    localSize,-16
# Useful constants
        .equ    INITx,12
        .equ    INITy,34
        .equ    INITz,56
        .section    .rodata
        .align  8
tableHead1:
        .string "           automatic   static   global"
tableHead2:
        .string "                   x        y        z"
format:
        .string "In main: %12i %8i %8i\n"
# Define global variable
        .data
        .align 4
        .globl  z
        .type   z, @object
z:
        .int    INITz   # initialize the global
# Code
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        add     rsp, localSize  # for local var.

        mov     dword ptr x[rbp], INITx  # initialize locals
        mov     dword ptr y[rbp], INITy 

        lea     rdi, tableHead1[rip]    # print heading
        call    puts@plt
        lea     rdi, tableHead2[rip]
        call    puts@plt
        mov     ecx, z[rip]   # print variables
        mov     edx, y[rbp]
        mov     esi, x[rbp]
        lea     rdi, format[rip]
        mov     eax, 0
        call    printf@plt

        call    addConst0       # add to variables
        call    addConst1
        call    addConst0
        call    addConst1

        mov     ecx, z[rip]   # print variables
        mov     edx, y[rbp]
        mov     esi, x[rbp]
        lea     rdi, format[rip]
        mov     eax, 0
        call    printf@plt

        mov     eax, 0      # return 0;
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret
