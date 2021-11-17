# helloWorld.s
# Hello World program using the write() system call
# one character at a time.

        .intel_syntax noprefix
# Useful constants
        .equ    STDOUT,1
# Stack frame
        .equ    aString,-8
        .equ    localSize,-16
# Read only data
        .section  .rodata
theString:
        .string "Hello, World!\n"
# Code
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp                 # save frame pointer
        mov     rbp, rsp            # set new frame pointer
        add     rsp, localSize      # for local var.

        lea     rax, theString[rip]
        mov     aString[rbp], rax   # *aString = "Hello World.\n";
whileLoop:
        mov     rsi, aString[rbp]   # current char in string
        cmp     byte ptr [rsi], 0   # null character?
        je      allDone             # yes, all done

        mov     edx, 1              # one character
        mov     edi, STDOUT         #    to standard out
        call    write@plt
        
        inc     qword ptr aString[rbp]  # aString++;
        jmp     whileLoop           # back to top
allDone:
        mov     eax, 0              # return 0;
        mov     rsp, rbp            # restore stack pointer
        pop     rbp                 # and caller frame pointer
        ret
