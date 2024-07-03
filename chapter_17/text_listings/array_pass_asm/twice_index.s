// Store (2 * element number) in each array element.
// Calling sequence
//    x0 <- address of array
//    w1 <- number of array elements
//    Return 0.
        .arch armv8-a
// Code
        .text
        .align  2
        .global twice_index
        .type   twice_index, %function
twice_index:
        mov     w2, wzr                // i = 0
loop:
        add     w3, w2, w2             // 2 * i
        str     w3, [x0, w2, uxtw 2]   // Current element address        
        add     w2, w2, 1              // i++
        cmp     w2, w1                 // At end?
        b.lt    loop                   // No, continue filling

        mov     w0, wzr                // Yes, return 0
        ret
