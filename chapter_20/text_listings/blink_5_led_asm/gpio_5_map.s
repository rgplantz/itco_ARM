// Opens /dev/mem device, maps GPIO memory into application address space.
// For RP1 peripherals on Raspberry Pi 5
// Returns pointer to GPIO in application memory if successful, -1 if error

// The following are defined in /usr/include/asm-generic/fcntl.h:
// Note that the values are specified in octal.
        .equ    O_RDWR, 00000002            // open for read/write
        .equ    O_SYNC, 04010000            // ensure reads and writes are
        .equ    O_CLOEXEC, 02000000         //    synchronized by the OS
// The following are defined in /usr/include/asm-generic/mman-common.h:
        .equ    PROT_READ, 0x1              // page can be read
        .equ    PROT_WRITE, 0x2             // page can be written
        .equ    MAP_SHARED, 0x01            // share changes
// The following are defined by me:
        .equ    GPIO, 0x1f00000000          // start of GPIO on RPi 5
        .equ    OPEN_FLAGS, O_RDWR | O_SYNC | O_CLOEXEC // open file flags
        .equ    PROT_RDWR, PROT_READ | PROT_WRITE       // allow read and write
        .equ    NO_ADDR_PREF, 0             // let OS choose address of mapping
        .equ    PAGE_SIZE, 4096             // Raspbian memory page

// Stack frame
        .equ    save1920, 16
        .equ    FRAME, 32
// Constant data
        .section .rodata
        .align  2
dev_mem:
        .asciz  "/dev/mem"

// Code
        .text
        .align  2
        .global gpio_map
        .type   gpio_map, %function
gpio_map:
        stp     fp, lr, [sp, -FRAME]!       // create our stack frame
        mov     fp, sp                      // set frame pointer
        stp     x19, x20, [sp, save1920]    // save regs.
// Open /dev/mem for read/write and syncing        
        mov     w1, OPEN_FLAGS & 0xffff     // move 32-bit flags
        movk    w1, OPEN_FLAGS & 0xffff0000, lsl 16
        movk    w1, OPEN_FLAGS & 0xffff00000000, lsl 32
        adr     x0, dev_mem                 // i/o device memory
        bl      open
        cmp     w0, -1                      // check for error
        b.eq    error_return                // end function if error

        mov     w19, w0                     // /dev/mem file descriptor
// Map the GPIO registers to a main memory location so we can access them
        mov     w5, GPIO & 0xffff           // address of GPIO
        movk    w5, GPIO / 0xffff, lsl 16
        mov     x5, xzr                     // move 32-bit flags
        movk    x5, GPIO, lsl 32
        mov     w4, w19                     // file descriptor
        mov     w3, MAP_SHARED              // share with other processes
        mov     w2, PROT_RDWR               // read/write this memory
        mov     w1, 0x4000000               // get 4 MB of memory
        mov     w0, NO_ADDR_PREF            // let kernel pick memory
        bl      mmap
        cmp     x0, -1                      // check for error
        b.eq    error_return                // w0 also = -1, end function

        mov     x20, x0                     // save mapped address
        mov     w0, w19                     // /dev/gpiomem4 file descriptor
        bl      close                       // close /dev/gpiomem4 file
done:        
        mov     x0, x20                     // return address of gpio registers
error_return:
        ldp     x19, x20, [sp, save1920]    // restore regs.
        ldp     fp, lr, [sp], FRAME         // undo stack frame
        ret
