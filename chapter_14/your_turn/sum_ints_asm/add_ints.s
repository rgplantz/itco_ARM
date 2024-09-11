// Add all integers between two integers and return the sum.
// Calling sequence:
//    w0 <- one integer
//    w1 <- another integer
//    Returns sum
        .arch armv8-a
        .text
        .align  2
        .global add_ints
        .type   add_ints, %function
add_ints:
        cmp     w0, w1                // Check for lower
        b.lo    in_order
        mov     w2, w0                // Out of order, swap
        mov     w0, w1
        mov     w1, w2
in_order:
        mov     w2, w0                // Accumulate sum in w2
loop:
        cmp     w0, w1                // Added all of them?
        b.hs    done                  // Yes
        add     w0, w0, 1             // Next int
        add     w2, w2, w0            // Add to accmulator
        b       loop                  // And keep adding
done:
        mov     w0, w2                // Return sum
        ret                           // Back to caller
