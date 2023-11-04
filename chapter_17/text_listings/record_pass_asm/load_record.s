// Loads fields of aRecord.s
// Calling sequence
//    x0 <- address of record
//    w1 <- char a
//    w2 <- int x
//    w3 <- char b
//    w4 <- int y
//    w5 <- char c
//    returns 0
        .arch armv8-a
        .include  "our_record.s"  // field offsets
// Code
        .text
        .align  2
        .global load_record
        .type   load_record, %function
load_record:
        strb    w1, [x0, a]       // first char
        str     w2, [x0, i]       // first int
        strb    w3, [x0, b]       // second char
        str     w4, [x0, j]       // second int
        strb    w5, [x0, c]       // third char

        mov     w0, wzr           // return 0
        ret
