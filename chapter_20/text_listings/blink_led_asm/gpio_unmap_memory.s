// Unmaps one page of I/O memory
// into program virtual address space.
// Calling sequence
//    x0 <- address of memory to unmap

        .equ    PAGE_SIZE, 4096       // Raspbian memory page

// Stack frame
        .equ    frame, 16

// Code
        .text
        .align  2
        .global gpio_unmap_memory
        .type   gpio_unmap_memory, %function
gpio_unmap_memory:
        stp     fp, lr, [sp, -frame]!   // create our stack frame
        mov     fp, sp                  // set frame pointer

        mov     w1, PAGE_SIZE           // amount we mapped for GPIO
        bl      munmap                  // unmap it
done:        
        mov     w0, wzr                 // return 0;
        ldp     fp, lr, [sp], frame     // undo stack frame
        ret
