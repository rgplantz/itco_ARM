# displayRecord.s
# Displays contents of a record.
# Calling sequence:
#   rdi <- pointer to record
        .intel_syntax noprefix
# Record field offsets
        .include  "aRecord"
# Stack frame
        .equ    recordPtr,-16
        .equ    localSize,-16
# Useful constant
        .equ    STDOUT,1
# Constant data
        .section  .rodata
        .align  8
endl:
        .string "\n"
# Code
        .text
        .globl  displayRecord
        .type   displayRecord, @function
displayRecord:
        push    rbp                   # save frame pointer
        mov     rbp, rsp              # set new frame pointer
        add     rsp, localSize        # for local var.
       
        mov     recordPtr[rbp], rdi   # save record address

        mov     edx, 1                # write one character
        mov     rax, recordPtr[rbp]   # address of record
        lea     rsi, aChar[rax]       # character located here
        mov     edi, STDOUT           # to screen
        call    write@plt
        lea     rdi, endl[rip]        # new line
        call    writeStr
        
        mov     rax, recordPtr[rbp]   # address of record
        mov     edi,anInt[rax]        # get the integer
        call    putInt                # write to screen
        lea     rdi, endl[rip]
        call    writeStr
        
        mov     edx, 1                # second character
        mov     rax, recordPtr[rbp]   # address of record
        lea     rsi, anotherChar[rax]
        mov     edi, STDOUT
        call    write@plt
        lea     rdi, endl[rip]
        call    writeStr

        mov     rsp, rbp              # restore stack pointer
        pop     rbp                   # and caller frame pointer
        ret
