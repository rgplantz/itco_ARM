// Blinks LED connected to GPIO line 17 every three seconds.

// Useful constants
        .equ    N_BLINKS, 5               // number of times to blink
        .equ    DELTA_TIME, 3             // seconds between blinks
        .equ    GPIO_LINE, 17             // line number
// The following are defined in /usr/include/asm-generic/fcntl.h:
// Note that the values are specified in octal.
        .equ    O_RDWR, 00000002          // open for read/write
        .equ    O_SYNC, 04010000          // ensure reads and writes are
        .equ    O_CLOEXEC, 02000000       //    synchronized by the OS
// The following are defined in /usr/include/asm-generic/mman-common.h:
        .equ    PROT_READ, 0x1            // page can be read
        .equ    PROT_WRITE, 0x2           // page can be written
        .equ    MAP_SHARED, 0x01          // share changes
// The following are defined by me:
//      Uncomment the GPIO for your RPi model.
        .equ    GPIO, 0x1f00000000 >> 16  // RPi 5
//        .equ    GPIO, 0x7e200000 >> 16    // RPi 4
//        .equ    GPIO, 0x3f200000 >> 16    // RPi 2 & 3
//        .equ    GPIO, 0x20200000 >> 16    // RPi zero & 1
        .equ    GPIO_OFFSET, 0xd0000      // RPi 5
//        .equ    GPIO_OFFSET, 0x00000     // other RPi models
        .equ    OPEN_FLAGS, O_RDWR | O_SYNC | O_CLOEXEC // open file flags
        .equ    PROT_RDWR, PROT_READ | PROT_WRITE       // allow read and write
        .equ    NO_ADDR_PREF, 0           // let OS choose address of mapping
//        .equ    MEM_SIZE, 0x1000          // memory for RPi zero, 1, 2, 3, & 4
        .equ    MEM_SIZE, 0x4000000       // memory for RPi 5

// Stack frame
        .equ    save1920, 16              // save regs
        .equ    save21, 32
        .equ    FRAME, 48
// Constant data
        .section .rodata
        .align  2
dev_mem:
        .asciz  "/dev/mem"
err_msg:
        .asciz  "Cannot map I/O memory.\n"
on_msg:
        .asciz  "led on...\n"
off_msg:
        .asciz  "...led off\n"

// Code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -FRAME]!     // create our stack frame
        mov     fp, sp                    // set frame pointer
        stp     x19, x20, [sp, save1920]  // save regs.
        str     x21, [sp, save21]

// Open /dev/mem for read/write and syncing        
        mov     w1, OPEN_FLAGS & 0xffff   // move 32-bit flags
        movk    w1, OPEN_FLAGS / 0xffff, lsl 16
        adr     x0, dev_mem               // i/o device memory
        bl      open
        cmp     w0, -1                    // check for error
        b.eq    error_return              // end if error
        mov     w19, w0                   // /dev/mem file descriptor
// Map the GPIO registers to a main memory location so we can access them
        movz    x5, GPIO & 0xffff, lsl 16
        movk    x5, GPIO / 0xffff, lsl 32
        mov     w4, w19                   // file descriptor
        mov     w3, MAP_SHARED            // share with other processes
        mov     w2, PROT_RDWR             // read/write this memory
        mov     w1, MEM_SIZE              // amount of memory needed
        mov     w0, NO_ADDR_PREF          // let kernel pick memory
        bl      mmap
        cmp     x0, -1                    // check for error
        b.eq    error_return              // w0 also = -1, end function
        mov     x20, x0                   // save mapped address
        mov     w0, w19                   // /dev/mem file descriptor
        bl      close                     // close /dev/mem file

// Make line an output
        mov     x0, x20                   // get mapped memory address
	      add	    x0, x0, GPIO_OFFSET       // start of GPIO registers
        mov     w1, GPIO_LINE
        bl      gpio_line_to_output
        mov     x21, x0                   // pointer to register base

// Turn the line on and off
        mov     x19, N_BLINKS             // number of times to do it
loop: 
        adr     x0, on_msg                // tell user it's on
        bl      write_str
        mov     w1, GPIO_LINE             // GPIO line number
        mov     x0, x21                   // pointer to register base
        bl      gpio_line_set             // turn LED on
        mov     w0, DELTA_TIME            // wait
        bl      sleep
       
        adr     x0, off_msg               // tell user it's off
        bl      write_str
        mov     w1, GPIO_LINE             // GPIO line number
        mov     x0, x21                   // pointer to register base
        bl      gpio_line_clr             // turn LED off
        mov     w0, DELTA_TIME            // wait
        bl      sleep

        subs    x19, x19, 1               // decrement loop counter
        b.gt    loop                      // loop if > 0
done:
        mov     x0, x20                   // our mapped memory
        mov     w1, MEM_SIZE              // amount we mapped for GPIO
        bl      munmap                    // unmap it
        mov     w0, wzr                   // return 0;
error_return:
        ldr     x21, [sp, save21]         // restore regs.
        ldp     x19, x20, [sp, save1920]
        ldp     fp, lr, [sp], FRAME       // undo stack frame
        ret
