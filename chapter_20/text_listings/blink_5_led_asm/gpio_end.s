// Unmaps one page of I/O  from application memory space
// Calling sequence
//    x0 <- address of memory to unmap

        .equ    PAGE_SIZE, 4096       // Raspbian memory page

// Stack frame
        .equ    FRAME, 16

// Code
        .text
        .align  2
        .global gpio_end
        .type   gpio_end, %function
gpio_end:
        stp     fp, lr, [sp, -FRAME]!   // create our stack frame
        mov     fp, sp                  // set frame pointer

        mov     w1, PAGE_SIZE           // amount we mapped for GPIO
        bl      munmap                  // unmap it
done:        
        mov     w0, wzr                 // return 0;
        ldp     fp, lr, [sp], FRAME     // undo stack frame
        ret
