# displayArray.s
# Prints array contents.
# Calling sequence:
#   rdi <- pointer to array
#   esi <- number of elements
        .intel_syntax noprefix

# Stack frame
        .equ    nElements,-8
        .equ    localSize,-16
# Constant data
        .section  .rodata
        .align  8
format1:
        .string "intArray["
format2:
        .string "] = "
endl:
        .string "\n"
# Code
        .text
        .globl  displayArray
        .type   displayArray, @function
displayArray:
        push    rbp                 # save frame pointer
        mov     rbp, rsp            # set new frame pointer
        add     rsp, localSize      # local variables
        push    rbx                 # save, use for i
        push    r12                 # save, use for array pointer

        mov     r12, rdi            # pointer to array
        mov     nElements[rbp], esi # number of elements
        
        mov     ebx, 0              # index = 0
printLoop:
        lea     rdi, format1[rip]   # start of formatting
        call    writeStr
        mov     edi, ebx            # index
        call    putInt
        lea     rdi, format2[rip]   # more formatting
        call    writeStr
        mov     edi, [r12+rbx*4]    # array element
        call    putInt              # print on screen
        lea     rdi, endl[rip]      # next line
        call    writeStr

        inc     ebx                 # increment index
        cmp     ebx, nElements[rbp] # end of array?
        jl      printLoop           # no, loop back
        
        pop     r12                 # restore registers
        pop     rbx
        mov     rsp, rbp            # yes, restore stack pointer
        pop     rbp                 # and caller frame pointer
        ret
