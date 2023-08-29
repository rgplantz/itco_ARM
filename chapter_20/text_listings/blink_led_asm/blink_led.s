// Blinks LED connected between pins 1 and 11 on Raspberry Pi
// GPIO connector once a second for five seconds.

// Useful constants
        .equ    N_BLINKS, 5           // number of times to blink
        .equ    DELTA_TIME, 3         // seconds between blinks
        .equ    INPUT, 0              // use pin for input
        .equ    OUTPUT, 1             // use pin for ouput
        .equ    GPIO_PIN, 17          // bit field in GPFLSEL regs.

// Stack frame
        .equ    save1920, 16          // save regs
        .equ    frame, 32
// Constant data
        .section .rodata
        .align  2
gpio_dev:
        .asciz  "/dev/gpiomem"
dev_err:
        .asciz  "Cannot open /dev/gpiomem\n"
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
        stp     fp, lr, [sp, -frame]!   // create our stack frame
        mov     fp, sp                  // set frame pointer
        stp     x19, x20, [sp, save1920]  // save regs.

// Map /dev/gpiomem to user memory
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
        mov     x20, N_BLINKS           // number of times to do it
loop:
        adr     x0, on_msg              // tell user it's on
        bl      write_str
        mov     x0, x19                 // pointer to mapped memory
        mov     w1, GPIO_PIN            // GPIO pin number
        bl      gpio_set_pin            // turn LED on
        mov     w0, DELTA_TIME          // wait
        bl      sleep
       
        adr     x0, off_msg             // tell user it's off
        bl      write_str
        mov     x0, x19                 // pointer to mapped memory
        mov     w1, GPIO_PIN            // GPIO pin number
        bl      gpio_clear_pin          // turn LED off
        mov     w0, DELTA_TIME          // wait
        bl      sleep

        sub     x20, x20, 1             // decrement loop counter
        cbnz    x20, loop               // loop if not done
       
done:
        mov     w0, wzr                 // return 0;
        ldp     fp, lr, [sp], frame     // undo stack frame
        ret