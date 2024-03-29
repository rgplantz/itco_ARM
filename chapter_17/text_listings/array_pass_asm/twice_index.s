// Stores 2 times element number in each array element.
// Calling sequence
//    x0 <- address of array
//    w1 <- number of array elements
//    returns 0
        .arch armv8-a
// Code
        .text
        .align  2
        .global twice_index
        .type   twice_index, %function
twice_index:
        mov     w2, wzr           // i = 0;
loop:
        add     w3, w2, w2        // 2 times i
        str     w3, [x0, w2, uxtw 2]   // current element address        
        add     w2, w2, 1         // i++;
        cmp     w2, w1            // at end?
        b.lt    loop              // no, continue filling

        mov     w0, wzr           // yes, return 0
        ret
