# getLength.s
# Gets length in inches and 1/16's.
# Outputs 32-bit value, high 28 bits hold inches,
# low 4 bits hold fractional value in 1/16's
# Calling sequence:
#   rdi <- pointer to length
        .intel_syntax noprefix
# Useful constant
        .equ    fractionMask, 0xf
# Stack frame
        .equ    lengthPtr,-16
        .equ    inches,-8
        .equ    fraction,-4
        .equ    localSize,-16
# Constant data
        .section	.rodata
        .align 8
prompt:
        .string "Enter inches and 1/16s\n"
inchesPrompt:
        .string "        Inches: "
fractionPrompt:
        .string "    Sixteenths: "
# Code
        .text
        .globl  getLength
        .type   getLength, @function
getLength:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        add     rsp, localSize  # for local var.
        
        mov     lengthPtr[rbp], rdi # save pointer to output

        lea     rdi, prompt[rip]    # prompt user
        call    writeStr

        lea     rdi, inchesPrompt[rip]  # ask for inches
        call    writeStr
        lea     rdi, inches[rbp]    # get inches
        call    getUInt
        lea     rdi, fractionPrompt[rip]    # ask for 1/16's
        call    writeStr
        lea     rdi, fraction[rbp]  # get fraction
        call    getUInt
        
        mov     eax, dword ptr inches[rbp]  # retrieve inches
        sal     eax, 4      # make room for fraction
        mov     ecx, dword ptr fraction[rbp]  # retrieve frac
        and     ecx, fractionMask   # make sure < 16
        add     eax, ecx    # add in fraction
        mov     rcx, lengthPtr[rbp] # load pointer to output
        mov     [rcx], eax  # output

        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

