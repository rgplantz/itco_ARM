# records.s
# Allocates two records, assigns a value to each field
# in each record, and displays the contents.
        .intel_syntax noprefix
# Stack frame
        .equ    x,-32
        .equ    y, -20
        .equ    canary,-8
        .equ    localSize,-32
# Constant data
        .section  .rodata
        .align  8
endl:
        .string "\n"
# Code
        .text
        .globl	main
        .type	  main, @function
main:
        push    rbp                   # save frame pointer
        mov     rbp, rsp              # set new frame pointer
        add     rsp, localSize        # for local var.
        mov     rax, qword ptr fs:40  # get canary
        mov     qword ptr canary[rbp], rax

        mov     ecx, 'b'              # data to store in record
        mov     edx, 123
        mov     esi, 'a'
        lea     rdi, x[rbp]           # x record
        call    loadRecord
        
        mov     ecx, '2'              # data to store in record
        mov     edx, 456
        mov     esi, '1'
        lea     rdi, y[rbp]           # y record
        call    loadRecord

        lea     rdi, x[rbp]           # display x record
        call    displayRecord

        lea     rdi, y[rbp]           # display y record
        call    displayRecord
        
        mov     eax, 0                # return 0;
        mov     rcx, canary[rbp]      # retrieve saved canary
        xor     rcx, fs:40            # and check it
        je      goodCanary
        call    __stack_chk_fail@PLT  # bad canary
goodCanary:
        mov     rsp, rbp              # restore stack pointer
        pop     rbp                   # and caller frame pointer
        ret
