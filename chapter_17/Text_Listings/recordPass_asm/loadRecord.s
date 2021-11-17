# loadRecord.s
# Loads record with data.
# Calling sequence:
#   rdi <- pointer to record
#   esi <- 1st char
#   edx <- int
#   ecx <- 2nd char
        .intel_syntax noprefix
# Record field offsets
        .include  "aRecord"
# Code
        .text
        .globl  loadRecord
        .type   loadRecord, @function
loadRecord:
        push    rbp                   # save frame pointer
        mov     rbp, rsp              # set new frame pointer

        mov     aChar[rdi], esi       # 1st char field
        mov     anInt[rdi], edx       # int field
        mov     anotherChar[rdi], ecx # 2nd char field

        mov     rsp, rbp              # restore stack pointer
        pop     rbp                   # and caller frame pointer
        ret
