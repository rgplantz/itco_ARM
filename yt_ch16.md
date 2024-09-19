---
layout: default
title: Chapter 16
---

## Chapter 16

1.  Lowercase
    ```asm
    // Make an alphabetic text string lowercase.
            .arch armv8-a
    // Useful constant
            .equ    MAX,50                    // Character limit
    // Stack frame
            .equ    the_string, 16
            .equ    FRAME, 80                 // Allows >51 bytes
    // Code
            .text
            .section  .rodata
            .align  3
    prompt:
            .string "Enter up to 50 alphabetic characters: "
    result:
            .string "All lower: "
            .text
            .align  2
            .global main
            .type   main, %function
    main:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Set our frame pointer
            adr     x0, prompt            // Prompt message
            bl      write_str             // Ask for input

            add     x0, sp, the_string    // Place to store string
            mov     w1, MAX               // Limit number of input chars
            bl      read_str              // Get from keyboard

            add     x1, sp, the_string    // Address of string
            mov     x0, x1                // Replace the string.
            bl      to_lower              // Do conversion

            adr     x0, result            // Show result
            bl      write_str
            add     x0, sp, the_string    // Converted string
            bl      write_str
            mov     w0, '\n'              // Nice formatting
            bl      write_char

            mov     w0, 0                 // Return 0
            ldp     x29, x30, [sp], FRAME // Delete stack frame
            ret
    ```
    ```
    // Convert alphabetic letters in a C string to lowercase.
    // Calling sequence
    //    x0 <- pointer to result
    //    x1 <- pointer to string to convert
    //    Return number of characters converted.
            .arch armv8-a
    // Useful constant
            .equ    LOWMASK, 0x20
    // Program code
            .text
            .align  2
            .global to_lower
            .type   to_lower, %function
    to_lower:
            mov     w2, wzr               // counter = 0
    loop:
            ldrb    w3, [x1]              // Load character
            cbz     w3, done              // All done if NUL char
            movz    w4, LOWMASK           // If not, do masking
            orr     w3, w3, w4            // Mask to lower
            strb    w3, [x0]              // Store result
            add     x0, x0, 1             // Increment destination pointer,
            add     x1, x1, 1             //   source pointer,
            add     w2, w2, 1             //   and counter,
            b       loop                  //   and continue
    done:
            strb    w3, [x0]              // Terminating NUL got us here
            mov     w0, w2                // Return count
            ret                           // Back to caller
    ```
2.  Inline assembly to detect carry.
    ```c
    // Add two integers and show if there is carry.

    #include <stdio.h>

    int main(void)
    {
        unsigned int x, y, z, carry;
      
        printf("Enter an integer: ");
        scanf("%u", &x);
        printf("Enter an integer: ");
        scanf("%u", &y);

        asm ("adds %w0, %w2, %w3\n"
            "cinc %w1, wzr, cs"
            : "=r" (z), "=r" (carry)
            : "r" (x), "r" (y));

        printf("%u + %u = %u\n", x, y, z);
        if (carry)
            printf("** Carry occurred **\n");

        return 0;
    }
    ```
3.  Registers for variables.
    ```
    // Add two integers and show if there is overflow.

    #include <stdio.h>

    int main(void)
    {
        int x, y;
        register int z, overflow;
      
        printf("Enter an integer: ");
        scanf("%i", &x);
        printf("Enter an integer: ");
        scanf("%i", &y);

        asm ("adds %w0, %w2, %w3\n"
            "cinc %w1, wzr, vs"
            : "=r" (z), "=r" (overflow)
            : "r" (x), "r" (y));

        printf("%i + %i = %i\n", x, y, z);
        if (overflow)
            printf("** Overflow occurred **\n");

        return 0;
    }
    ```
