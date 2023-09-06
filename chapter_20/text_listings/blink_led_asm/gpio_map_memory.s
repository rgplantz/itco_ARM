// Opens the /dev/gpiomem device and maps GPIO memory
// into program virtual address space.
// returns pointer to user memory for gpio registers

// The following are defined in /usr/include/asm-generic/fcntl.h:
// Note that the values are specified in octal.
        .equ    O_RDWR, 00000002          // open for read/write
        .equ    O_DSYNC, 00010000         // these flags ensure that
        .equ    __O_SYNC, 04000000        //    reads from and writes to
        .equ    O_SYNC, __O_SYNC|O_DSYNC  //    the gpio are properly
        .equ    O_CLOEXEC, 0x2000000      //    synchronized by the OS
// The following are defined in /usr/include/asm-generic/mman-common.h:
        .equ    PROT_READ, 0x1            // page can be read
        .equ    PROT_WRITE, 0x2           // page can be written
        .equ    MAP_SHARED, 0x01          // share changes
// The following are defined by me:
        .equ    PERIPH,0x3f000000         // RPi 2, 3, & g peripherals
//       .equ    PERIPH,0x20000000        // RPi zero & 1 peripherals
        .equ    GPIO_OFFSET,0x200000      // start of GPIO device
        .equ    O_FLAGS, O_RDWR|__O_SYNC|O_CLOEXEC  // open file flags
        .equ    O_FLAGS_HI, O_FLAGS/0xffff  // needed for mov
        .equ    O_FLAGS_LO, O_FLAGS&0xffff  //     instructions
        .equ    PROT_RDWR, PROT_READ|PROT_WRITE // allow read and write
        .equ    NO_PREF, 0                // let OS choose address of mapping
        .equ    PAGE_SIZE, 4096           // Raspbian memory page

// Stack frame
        .equ    save1920, 16
        .equ    frame, 32
// Constant data
        .section .rodata
        .align  2
gpio_dev:
        .asciz  "/dev/gpiomem"
dev_err:
        .asciz  "Cannot open /dev/gpiomem\n"
mmem_err:
        .asciz  "Cannot map /dev/gpiomem\n"

// The program
        .text
        .align  2
        .global gpio_map_memory
        .type   gpio_map_memory, %function
gpio_map_memory:
        stp     fp, lr, [sp, -frame]!     // create our stack frame
        mov     fp, sp                    // set frame pointer
        stp     x19, x20, [sp, save1920]  // save regs.
// Open /dev/gpiomem for read/write and syncing        
        mov     w1, O_FLAGS_LO            // read/write /dev/gpiomem
        movk    w1, O_FLAGS_HI, lsl 16
        adr     x0, gpio_dev              // specify /dev/gpiomem
        bl      open
        cmp     w0, -1                    // check for error
        bne     gpiomem_ok                // no error, continue
        adr     x0, dev_err               // error, tell user
        bl      write_str
        mov     x20, xzr                  // NUL for memory address
        b       done                      // and end program
gpiomem_ok:      
        mov     w19, w0                   // /dev/gpiomem file descriptor
// Map the GPIO registers to a main memory location so we can access them
        mov     w5, wzr                   // we're at gpio, 0 offset
        mov     w4, w0
        mov     w3, MAP_SHARED            // share with other processes
        mov     w2, PROT_RDWR             // read/write this memory
        mov     w1, PAGE_SIZE             // get 1 page of memory
        mov     w0, NO_PREF               // let kernel pick memory
        bl      mmap
        cmp     x0, -1                    // check for error
        bne     mmap_ok                   // no error, continue
        adr     x0, mmem_err              // error, tell user
        bl      write_str
        mov     x0, xzr                   // NUL for memory address
mmap_ok:
        mov     x20, x0                   // save mapped address
        mov     w0, w19                   // /dev/gpiomem file descriptor
        bl      close                     // close /dev/gpiomem file
done:        
        mov     x0, x20                   // return address of gpio registers
        ldp     x19, x20, [sp, save1920]  // restore regs.
        ldp     fp, lr, [sp], frame       // undo stack frame
        ret
