// Blinks LED connected to GPIO pin 17 every three seconds.

// Useful constants
        .equ    N_BLINKS, 5           // number of times to blink
        .equ    DELTA_TIME, 3         // seconds between blinks
        .equ    GPIO_PIN, 17          // pin number

// Stack frame
        .equ    save1920, 16          // save regs
        .equ    save21, 32
        .equ    FRAME, 48
// Constant data
        .section .rodata
        .align  2
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
        stp     fp, lr, [sp, -FRAME]!   // create our stack frame
        mov     fp, sp                  // set frame pointer
        stp     x19, x20, [sp, save1920]  // save regs.
        str     x21, [sp, save21]

// Map GPIO registers to application memory
        bl      gpio_map                // so we can program it
        cmp     x0, -1                  // error?
        b.ne    mem_map_ok              // no, mapped ok
        adr     x0, err_msg             // yes, tell user
        bl      write_str
        b       error_return            // and end program
mem_map_ok:
        mov     x19, x0                 // save address of mapped mem.
// Make pin an output
	      add	    x0, x0, 0xd0000         // x0 = GPIOBase
        mov     w1, GPIO_PIN
        bl      gpio_pin_to_output
        mov     x21, x0                 // pointer to RIOBase

// Turn the pin on and off
        mov     x20, N_BLINKS           // number of times to do it
loop: 
        adr     x0, on_msg              // tell user it's on
        bl      write_str
        mov     w1, GPIO_PIN            // GPIO pin number
        mov     x0, x21                 // pointer to RIOBase
        bl      gpio_pin_set            // turn LED on
        mov     w0, DELTA_TIME          // wait
        bl      sleep
       
        adr     x0, off_msg             // tell user it's off
        bl      write_str
        mov     w1, GPIO_PIN            // GPIO pin number
        mov     x0, x21                 // pointer to RIOBase
        bl      gpio_pin_clr            // turn LED off
        mov     w0, DELTA_TIME          // wait
        bl      sleep

        subs    x20, x20, 1             // decrement loop counter
        b.gt    loop                    // loop if > 0
       
done:
        mov     x0, x19                 // our mapped memory
        bl      gpio_unmap              // end our use of gpio
        mov     w0, wzr                 // return 0;
error_return:
        ldr     x21, [sp, save21]       // restore regs.
        ldp     x19, x20, [sp, save1920]  // restore regs.
        ldp     fp, lr, [sp], FRAME     // undo stack frame
        ret
