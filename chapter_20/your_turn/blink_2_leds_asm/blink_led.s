// Alternately blinks LEDs connected between GPIO pins 16 & 17
// once once every three three seconds.

// Useful constants
        .equ    N_BLINKS, 5           // number of times to blink
        .equ    DELTA_TIME, 3         // seconds between blinks
        .equ    OUTPUT, 1             // use pin for output
        .equ    GPIO_PIN_1, 16        // bit field in GPFLSEL regs.
        .equ    GPIO_PIN_2, 17        // bit field in GPFLSEL regs.

// Stack frame
        .equ    save1920, 16          // save regs
        .equ    FRAME, 32
// Constant data
        .section .rodata
        .align  2
err_msg:
        .asciz  "Cannot map /dev/gpiomem\n"
on_1_msg:
        .asciz  "led 1 on...\n"
on_2_msg:
        .asciz  "led 2 on...\n"

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
// Select pins to be an outputs
        mov     w2, OUTPUT              // make GPIO pin an output
        mov     w1, GPIO_PIN_1          // GPIO pin number
        bl      gpio_pin_function
        mov     w2, OUTPUT              // make GPIO pin an output
        mov     w1, GPIO_PIN_2          // GPIO pin number
        bl      gpio_pin_function

// Turn the pin on and off

        mov     x20, N_BLINKS           // number of times to do it
loop: 
        adr     x0, on_1_msg            // tell user LED 1 is on
        bl      write_str
        mov     w1, GPIO_PIN_1          // LED 1 pin number
        mov     x0, x19                 // pointer to mapped memory
        bl      gpio_pin_set            // turn LED 1 on
        mov     w1, GPIO_PIN_2          // LED 2 pin number
        mov     x0, x19                 // pointer to mapped memory
        bl      gpio_pin_clr            // turn LED 2 off
        mov     w0, DELTA_TIME          // wait
        bl      sleep

        adr     x0, on_2_msg            // tell user LED 2 is on
        bl      write_str
        mov     w1, GPIO_PIN_2          // LED 2 on
        mov     x0, x19                 // pointer to mapped memory
        bl      gpio_pin_set            // turn LED on
        mov     w1, GPIO_PIN_1          // LED 1 pin number
        mov     x0, x19                 // pointer to mapped memory
        bl      gpio_pin_clr            // turn LED 1 off
        mov     w0, DELTA_TIME          // wait
        bl      sleep

        subs    x20, x20, 1             // decrement loop counter
        b.ne    loop                    // loop if not done

        mov     w1, GPIO_PIN_2          // LED 2 pin number
        mov     x0, x19                 // pointer to mapped memory
        bl      gpio_pin_clr            // turn LED 2 off
done:
        mov     x0, x19                 // our gpio memory
        bl      gpio_unmap_memory
        mov     w0, wzr                 // return 0;
        ldp     x19, x20, [sp, save1920]  // restore regs.
        ldp     fp, lr, [sp], FRAME     // undo stack frame
        ret
