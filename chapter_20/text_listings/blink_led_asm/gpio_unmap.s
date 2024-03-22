// Unmaps one page of I/O  from application memory space
// Calling sequence
//    x0 <- address of memory to unmap

        .equ    MEM_SIZE, 0x1000            // memory for RPi zero, 1, 2, 3, & 4
//        .equ    MEM_SIZE, 0x4000000         // memory for RPi 5

// Stack frame
        .equ    FRAME, 16

// Code
        .text
        .align  2
        .global gpio_unmap
        .type   gpio_unmap, %function
gpio_unmap:
        stp     fp, lr, [sp, -FRAME]!   // create our stack frame
        mov     fp, sp                  // set frame pointer

        mov     w1, MEM_SIZE            // amount we mapped for GPIO
        bl      munmap                  // unmap it
done:        
        mov     w0, wzr                 // return 0;
        ldp     fp, lr, [sp], FRAME     // undo stack frame
        ret
