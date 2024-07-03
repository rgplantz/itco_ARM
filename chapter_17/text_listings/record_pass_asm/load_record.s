// Load the fields of my_record.s.
// Calling sequence
//    x0 <- address of record
//    w1 <- char a
//    w2 <- int x
//    w3 <- char b
//    w4 <- int y
//    w5 <- char c
//    Returns 0
        .arch armv8-a
        .include  "my_record.s"   // Field offsets
// Code
        .text
        .align  2
        .global load_record
        .type   load_record, %function
load_record:
        strb    w1, [x0, a]       // First char
        str     w2, [x0, i]       // First int
        strb    w3, [x0, b]       // Second char
        str     w4, [x0, j]       // Second int
        strb    w5, [x0, c]       // Third char

        mov     w0, wzr           // Return 0
        ret
