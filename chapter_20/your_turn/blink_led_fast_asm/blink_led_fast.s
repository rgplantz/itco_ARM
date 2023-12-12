// Blinks LED connected between GPIO pin 17 and ground on
// Raspberry Pi once a second for five seconds.

// Useful constants
        .equ    N_BLINKS, 5           // number of times to blink
        .equ    DELTA_TIME, 500000    // microseconds between blinks
        .equ    OUTPUT, 1             // use pin for output
        .equ    GPIO_PIN, 17          // bit field in GPFLSEL regs.

// Stack frame
        .equ    save1920, 16          // save regs
        .equ    save18, 32
        .equ    FRAME, 48
// Constant data
        .section .rodata
        .align  2
err_msg:
        .asciz  "Cannot map /dev/gpiomem\n"
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
        str     x18, [sp, save18]

// Map /dev/gpiomem to application memory
        bl      gpio_map_memory
        cbnz    x0, mem_map_ok          // check for address
        adr     x0, err_msg             // NUL, give error message
        bl      write_str
        b       done
mem_map_ok:
        mov     x19, x0                 // pointer to mapped memory
// Select pin to be an output
        mov     w1, GPIO_PIN            // GPIO pin number
        mov     w2, OUTPUT              // make it an output
        bl      gpio_pin_function

// Turn the pin on and off
        movz    w18, DELTA_TIME % 0xffff  // low-order 16 bits
        movk    write_str18, DELTA_TIME / 0xffff  // high-order 16 bits
        mov     x20, N_BLINKS           // number of times to do it
loop: 
        adr     x0, on_msg              // tell user it's on
        bl      write_str
        mov     w1, GPIO_PIN            // GPIO pin number
        mov     x0, x19                 // pointer to mapped memory
        bl      gpio_pin_set            // turn LED on
        mov     w0, w18                 // wait
        bl      usleep
       
        adr     x0, off_msg             // tell user it's off
        bl      write_str
        mov     w1, GPIO_PIN            // GPIO pin number
        mov     x0, x19                 // pointer to mapped memory
        bl      gpio_pin_clr            // turn LED off
        mov     w0, w18                 // wait
        bl      usleep

        sub     x20, x20, 1             // decrement loop counter
        cbnz    x20, loop               // loop if not done
       
done:
        mov     x0, x19                 // our gpio memory
        bl      gpio_unmap_memory
        mov     w0, wzr                 // return 0;
        ldr     x18, [sp, save18]       // restore regs.
        ldp     x19, x20, [sp, save1920]
        ldp     fp, lr, [sp], FRAME     // undo stack frame
        ret
