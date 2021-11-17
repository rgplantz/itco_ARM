# echoSInt.s
# Echos user input integer.
        .intel_syntax noprefix

# Stack frame
#   local vars (rbp)
        .equ    myInt,-4
        .equ    localSize,-16
# Read only data
        .section  .rodata
prompt:
        .string "Enter an integer: "
newLine:
        .string "\n"
# Code
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp             # save frame pointer
        mov     rbp, rsp        # set new frame pointer
        add     rsp, localSize  # for local var.
        
        lea     rdi, prompt[rip]    # prompt user
        call    writeStr
        
        lea     rdi, myInt[rbp]
        call    getInt
        
        mov     edi, myInt[rbp]
        add     edi, 345
        call    putInt
        
        lea     rdi, newLine[rip]   # some formatting
        call    writeStr

        mov     eax, 0
        mov     rsp, rbp        # restore stack pointer
        pop     rbp             # and caller frame pointer
        ret


