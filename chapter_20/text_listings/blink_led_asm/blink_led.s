// Blinks LED connected between GPIO pin 17 and ground on
// once once every three seconds.

// Useful constants
        .equ    N_BLINKS, 5           // number of times to blink
        .equ    DELTA_TIME, 3         // seconds between blinks
        .equ    OUTPUT, 1             // use pin for output
        .equ    GPIO_PIN, 17          // bit field in GPFLSEL regs.

// Stack frame
        .equ    save1920, 16          // save regs
        .equ    FRAME, 32
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

// Map /dev/gpiomem to application memory
        bl      gpio_map_memory
        cbnz    x0, mem_map_ok          // check for address
        adr     x0, err_msg             // NUL, give error message
        bl      write_str
        b       done
mem_map_ok:
        mov     x19, x0                 // pointer to mapped memory
// Select pin to be an output
        mov     w2, OUTPUT              // make GPIO pin an output
        mov     w1, GPIO_PIN            // GPIO pin number
        bl      gpio_pin_function

// Turn the pin on and off
        mov     x20, N_BLINKS           // number of times to do it
loop: 
        adr     x0, on_msg              // tell user it's on
        bl      write_str
        mov     w1, GPIO_PIN            // GPIO pin number
        mov     x0, x19                 // pointer to mapped memory
        bl      gpio_pin_set            // turn LED on
        mov     w0, DELTA_TIME          // wait
        bl      sleep
       
        adr     x0, off_msg             // tell user it's off
        bl      write_str
        mov     w1, GPIO_PIN            // GPIO pin number
        mov     x0, x19                 // pointer to mapped memory
        bl      gpio_pin_clr            // turn LED off
        mov     w0, DELTA_TIME          // wait
        bl      sleep

        subs    x20, x20, 1             // decrement loop counter
        b.ne    loop                    // loop if not zero
       
done:
        mov     x0, x19                 // our gpio memory
        bl      gpio_unmap_memory
        mov     w0, wzr                 // return 0;
        ldp     x19, x20, [sp, save1920]  // restore regs.
        ldp     fp, lr, [sp], FRAME     // undo stack frame
        ret
