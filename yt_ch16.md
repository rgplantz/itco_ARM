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
2.  Change case.
    ```asm
    // Make an alphabetic text string opposite case.
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
            .string "Opposite case: "
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
            bl      toggle_case           // Do conversion

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
    ```asm
    // Toggle case of alphabetic letters in a C string.
    // Calling sequence
    //    x0 <- pointer to result
    //    x1 <- pointer to string to convert
    //    Return number of characters converted.
            .arch armv8-a
    // Useful constant
            .equ    TOGGLEMASK, 0x20
    // Program code
            .text
            .align  2
            .global toggle_case
            .type   toggle_case, %function
    toggle_case:
            mov     w2, wzr               // counter = 0
    loop:
            ldrb    w3, [x1]              // Load character
            cbz     w3, done              // All done if NUL char
            movz    w4, TOGGLEMASK        // If not, do masking
            eor     w3, w3, w4            // Toggle case
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
4.  Number of hex characters converted.
    ```
    // Gets hex number from user and stores it as int.

    #include <stdio.h>
    #include "write_str.h"
    #include "read_str.h"
    #include "hex_to_int.h"

    #define MAX 20

    int main()
    {
        char the_string[MAX];
        int the_int;
        int count;
        
        write_str("Enter up to 8 hex characters: ");
        read_str(the_string, MAX);

        count = hex_to_int(&the_int, the_string);
        printf("The %i characters %x = %i\n", count, the_int, the_int);
        return 0;
    }
    ```
5.  Convert octal to int.
    ```
    ```
6.  Unsigned decimal string to unsigned int.
    ```
    ```
7.  Multiplication algorithms comparison.
    ```
    ```
8.  put_int and get_int functions.
    ```
    ```
9.  put_uint and get_uint functions.
    ```
    ```
10. Sum, difference, product, quotient, and remainder of two ints.
    ```
    ```
