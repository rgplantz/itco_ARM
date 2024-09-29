---
layout: default
title: Chapter 17
---

## Chapter 17

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
    ```asm
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
3.  To be done.
4.  Show number of hex characters converted. Notice that we wrote the `hex_to_int` function to return the number of characters, so we don't have to change it.
    ```c
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
5.  Convert octal to `int`.
    ```asm
    // Get an ocatal number from the user and store it as a long int.
            .arch armv8-a
    // Useful constant
            .equ    MAX, 21
    // Stack frame
            .equ    the_int, 16
            .equ    the_string, 24
            .equ    FRAME, 48
    // Code
            .text
            .section  .rodata
            .align  3
    prompt:
            .string "Enter up to 21 octal characters: "
    format:
            .string "0%lo = %li\n"
            .text
            .align  2
            .global main
            .type   main, %function
    main:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Our frame pointer

            adr     x0, prompt            // Prompt message
            bl      write_str             // Ask for input

            add     x0, sp, the_string    // Place to store string
            mov     w1, MAX               // Limit number of input chars
            bl      read_str              // Get from keyboard

            add     x1, sp, the_string    // Address of string
            add     x0, sp, the_int       // Place to store int
            bl      octal_to_int          // Do conversion

            ldr     x2, [sp, the_int]     // Load int
            ldr     x1, [sp, the_int]     // printf shows this copy in hex
            adr     x0, format            // Format string
            bl      printf

            mov     w0, 0                 // Return 0
            ldp     x29, x30, [sp], FRAME // Delete stack frame
            ret
    ```
    ```asm
    // Convert an octal character string to a long int.
    // Calling sequence
    //    x0 <- pointer to long int result
    //    x1 <- pointer to octal character string to convert
    //    Return number of characters converted.
            .arch armv8-a
    // Useful constants
            .equ    INTPART, 0x0f
    // Program code
            .text
            .align  2
            .global octal_to_int
            .type   octal_to_int, %function
    octal_to_int:
            mov     x2, xzr               // result = 0;
            mov     w3, wzr               // counter = 0;
    convert:
            ldrb    w4, [x1]              // Load character
            cbz     w4, done              // NUL character?
            and     x4, x4, INTPART       // 4-bit integer
            lsl     x2, x2, 3             // Make room for it
            orr     x2, x2, x4            // Insert new 3-bit integer
            add     x1, x1, 1             // Increment source pointer
            add     w3, w3, 1             //   and counter
            b       convert               //   and continue
    done:
            str     x2, [x0]              // Output result
            mov     w0, w3                // Return count
            ret                           // Back to caller
    ```
6.  Unsigned decimal string to `unsigned int`.
    ```c
    // Echo an unsigned int.

    #include "get_uint.h"
    #include "put_uint.h"
    #include "write_str.h"
    #include "write_char.h"

    int main(void)
    {
        int x;

        write_str("Enter unsigned integer: ");
        x = get_uint();
        write_str("You entered: ");
        put_uint(x);
        write_char('\n');
        
        return 0;
    }
    ```
    ```c
    // Read a decimal integer from keyboard and convert to an unsigned int.

    #ifndef GET_UINT_H
    #define GET_UINT_H
    unsigned int get_uint(void);
    #endif
    ```
    ```asm
    // Read a decimal integer from keyboard and convert to an unsigned int.
    // Calling sequence
    //    returns the int
            .arch armv8-a
    // Useful constants
            .equ    MAX, 10               // Maximum digits
    // Stack frame
            .equ    an_int, 16
            .equ    a_string, 20
            .equ    FRAME, 32
    // Code
            .text
            .align  2
            .global get_uint
            .type   get_uint, %function
    get_uint:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Our frame pointer

            mov     w1, MAX
            add     x0, sp, a_string      // Place to store input string
            bl      read_str

            add     x1, sp, a_string      // Address of input
            add     x0, sp, an_int        // Place for output
            bl      dec_to_uint           // Convert as unsigned int

            ldr     w0, [sp, an_int]      // Return the int
            ldp     x29, x30, [sp], FRAME // Delete stack frame
            ret
    ```
    ```c
    // Display an int on screen.

    #ifndef PUT_UINT_H
    #define PUT_UINT_H
    int put_uint(unsigned int);
    #endif
    ```
    ```asm
    // Display an unsigned int on screen.
            .arch armv8-a
    // Calling sequence
    //    w0 <- the int
    //    returns 0
    // Useful constants
            .equ    MAX, 11               // Maximum digits
    // Stack frame
            .equ    an_int, 16
            .equ    a_string, 20
            .equ    FRAME, 32
    // Code
            .text
            .align  2
            .global put_uint
            .type   put_uint, %function
    put_uint:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Our frame pointer

            mov     w1, w0                // Input
            add     x0, sp, a_string      // Place for output string
            bl      uint_to_dec           // Convert to text string

            add     x0, sp, a_string      // Display the int
            bl      write_str

            mov     w0, 0                 // Return 0
            ldp     x29, x30, [sp], FRAME // Delete stack frame
            ret
    ```
    ```asm
    // Convert a decimal text string to unsigned int.
    // string representation.
    // Calling sequence
    //    x0 <- place to store string
    //    w1 <- the int
    //    returns number of characters in string
            .arch armv8-a
    // Useful constants
            .equ    RADIX, 10             // number base
            .equ    INT2CHAR, 0x30        // ascii zero
    // Stack frame
    // Stack frame
            .equ    reverse, 0
            .equ    FRAME, 16
    // Code
            .text
            .align  2
            .global uint_to_dec
            .type   uint_to_dec, %function
    uint_to_dec:
            sub     sp, sp, FRAME         // Local string on stack

            add     x3, sp, reverse       // Pointer to local string storage
            strb    wzr, [x3]             // Create end with NUL
            mov     w2, RADIX             // Put in register
    do_while:
            add     x3, x3, 1             // Increment local pointer
            udiv    w4, w1, w2            // Compute quotient
            msub    w5, w4, w2, w1        // remainder = quotient - RADIX * quotient
            orr     w5, w5, INT2CHAR      // Convert to ascii
            strb    w5, [x3]              // Store character
            mov     w1, w4                // Remove remainder
            cbnz    w1, do_while          // Continue if more left

            mov     w6, wzr               // count = 0
    copy:
            ldrb    w5, [x3]              // Load character
            strb    w5, [x0]              //    and store it
            add     x0, x0, 1             // Increment to pointer
            sub     x3, x3, 1             // Decrement from pointer
            add     w6, w6, 1             // Increment counter
            cbnz    w5, copy              // Continue until NUL char
            strb    w5, [x0]              // Store NUL character

            mov     w0, w6                // Return count;
            add     sp, sp, FRAME         // Restore sp
            ret
    ```
7.  The assembly language for the two C algorithms is the same. Since `RADIX` is 10, the compiler used a shift and add algorithm for the `*` operation.
8.  `put_int` and `get_int` functions.
    ```c
    // Echo an unsigned int.

    #include "get_int.h"
    #include "put_int.h"
    #include "write_str.h"
    #include "write_char.h"

    int main(void)
    {
        int x;

        write_str("Enter signed integer: ");
        x = get_int();
        write_str("You entered: ");
        put_int(x);
        write_char('\n');
        
        return 0;
    }
    ```
    ```c
    // Read a decimal integer from keyboard and convert to an int.

    #ifndef GET_INT_H
    #define GET_INT_H
    int get_int(void);
    #endif
    ```
    ```asm
    // Read a decimal integer from keyboard and convert to an int.
    // Calling sequence
    //    returns the int
            .arch armv8-a
    // Useful constants
            .equ    MAX, 11                   // maximum digits
    // Stack frame
            .equ    an_int, 16
            .equ    a_string, 20
            .equ    frame, 32
    // Code
            .text
            .align  2
            .global get_int
            .type   get_int, %function
    get_int:
            stp     fp, lr, [sp, -frame]! // create our stack frame
            mov     fp, sp                // set our frame pointer

            mov     w1, MAX
            add     x0, sp, a_string      // place to store input string
            bl      read_str

            add     x1, sp, a_string      // input
            add     x0, sp, an_int        // place for output
            bl      dec_to_int            // convert as int

            ldr     w0, [sp, an_int]      // return the int
            ldp     fp, lr, [sp], frame   // restore fp, lr, sp
            ret                           // back to caller
    ```
    ```c
    // Display an int on the screen.

    #ifndef PUT_INT_H
    #define PUT_INT_H
    int put_int(int);
    #endif
    ```
    ```asm
    // Display an int on the screen.
            .arch armv8-a
    // Calling sequence
    //    w0 <- the int
    //    returns 0
    // Useful constants
            .equ    MAX, 11               // maximum digits
    // Stack frame
            .equ    an_int, 16
            .equ    a_string, 20
            .equ    frame, 32
    // Code
            .text
            .align  2
            .global put_int
            .type   put_int, %function
    put_int:
            stp     fp, lr, [sp, -frame]! // create our stack frame
            mov     fp, sp                // set our frame pointer

            mov     w1, w0                // input
            add     x0, sp, a_string      // place for output string
            bl      int_to_dec            // convert to text string

            add     x0, sp, a_string      // display the int
            bl      write_str

            mov     w0, wzr               // return 0;
            ldp     fp, lr, [sp], frame   // restore fp, lr, sp
            ret                           // back to caller
    ```
9.  `put_uint` and `get_uint` functions.
    ```c
    // Echo an unsigned int.

    #include "get_uint.h"
    #include "put_uint.h"
    #include "write_str.h"
    #include "write_char.h"

    int main(void)
    {
        int x;

        write_str("Enter unsigned integer: ");
        x = get_uint();
        write_str("You entered: ");
        put_uint(x);
        write_char('\n');
        
        return 0;
    }
    ```
    ```c
    // Read a decimal integer from keyboard and convert to an unsigned int.

    #ifndef GET_UINT_H
    #define GET_UINT_H
    unsigned int get_uint(void);
    #endif
    ```
    ```asm
    // Read a decimal integer from keyboard and convert to an unsigned int.
    // Calling sequence
    //    returns the int
            .arch armv8-a
    // Useful constants
            .equ    MAX, 10               // Maximum digits
    // Stack frame
            .equ    an_int, 16
            .equ    a_string, 20
            .equ    FRAME, 32
    // Code
            .text
            .align  2
            .global get_uint
            .type   get_uint, %function
    get_uint:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Our frame pointer

            mov     w1, MAX
            add     x0, sp, a_string      // Place to store input string
            bl      read_str

            add     x1, sp, a_string      // Address of input
            add     x0, sp, an_int        // Place for output
            bl      dec_to_uint           // Convert as unsigned int

            ldr     w0, [sp, an_int]      // Return the int
            ldp     x29, x30, [sp], FRAME // Delete stack frame
            ret
    ```
    ```c
    // Convert a decimal text string to unsigned int.

    #ifndef UINT_TO_DEC_H
    #define UINT_TO_DEC_H
    int uint_to_dec(char *string, unsigned int *x);
    #endif
    ```
    ```asm
    // Convert a decimal text string to unsigned int.
    // string representation.
    // Calling sequence
    //    x0 <- place to store string
    //    w1 <- the int
    //    returns number of characters in string
            .arch armv8-a
    // Useful constants
            .equ    RADIX, 10             // number base
            .equ    INT2CHAR, 0x30        // ascii zero
    // Stack frame
    // Stack frame
            .equ    reverse, 0
            .equ    FRAME, 16
    // Code
            .text
            .align  2
            .global uint_to_dec
            .type   uint_to_dec, %function
    uint_to_dec:
            sub     sp, sp, FRAME         // Local string on stack

            add     x3, sp, reverse       // Pointer to local string storage
            strb    wzr, [x3]             // Create end with NUL
            mov     w2, RADIX             // Put in register
    do_while:
            add     x3, x3, 1             // Increment local pointer
            udiv    w4, w1, w2            // Compute quotient
            msub    w5, w4, w2, w1        // remainder = quotient - RADIX * quotient
            orr     w5, w5, INT2CHAR      // Convert to ascii
            strb    w5, [x3]              // Store character
            mov     w1, w4                // Remove remainder
            cbnz    w1, do_while          // Continue if more left

            mov     w6, wzr               // count = 0
    copy:
            ldrb    w5, [x3]              // Load character
            strb    w5, [x0]              //    and store it
            add     x0, x0, 1             // Increment to pointer
            sub     x3, x3, 1             // Decrement from pointer
            add     w6, w6, 1             // Increment counter
            cbnz    w5, copy              // Continue until NUL char
            strb    w5, [x0]              // Store NUL character

            mov     w0, w6                // Return count;
            add     sp, sp, FRAME         // Restore sp
            ret
    ```
    ```c
    // Display an unsigned int on screen.

    #ifndef PUT_UINT_H
    #define PUT_UINT_H
    int put_uint(unsigned int);
    #endif
    ```
    ```asm
    // Display an unsigned int on screen.
            .arch armv8-a
    // Calling sequence
    //    w0 <- the int
    //    returns 0
    // Useful constants
            .equ    MAX, 11               // Maximum digits
    // Stack frame
            .equ    an_int, 16
            .equ    a_string, 20
            .equ    FRAME, 32
    // Code
            .text
            .align  2
            .global put_uint
            .type   put_uint, %function
    put_uint:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Our frame pointer

            mov     w1, w0                // Input
            add     x0, sp, a_string      // Place for output string
            bl      uint_to_dec           // Convert to text string

            add     x0, sp, a_string      // Display the int
            bl      write_str

            mov     w0, 0                 // Return 0
            ldp     x29, x30, [sp], FRAME // Delete stack frame
            ret
    ```
10. Sum, difference, product, quotient, and remainder of two `int`s.
    ```asm
    // Add, subtract, multiply, and divide two integers.
            .arch armv8-a
    // Stack frame
            .equ    x, 16
            .equ    y, 20
            .equ    FRAME, 32
    // Code
            .text
            .section  .rodata
            .align  3
    prompt:
            .string "Enter an integer: "
            .text
            .align  2
            .global main
            .type   main, %function
    main:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Our frame pointer

            adr     x0, prompt            // Ask user for input
            bl      write_str
            bl      get_int               // Get x
            str     w0, [sp, x]
            adr     x0, prompt            // Ask user for input
            bl      write_str
            bl      get_int               // Get y
            str     w0, [sp, y]

            ldr     w0, [sp, x]           // Load x
            ldr     w1, [sp, y]           //    and y
            bl      sum

            ldr     w0, [sp, x]           // Load x
            ldr     w1, [sp, y]           //    and y
            bl      difference

            ldr     w0, [sp, x]           // Load x
            ldr     w1, [sp, y]           //    and y
            bl      product

            ldr     w0, [sp, x]           // Load x
            ldr     w1, [sp, y]           //    and y
            bl      quotient

            ldr     w0, [sp, x]           // Load x
            ldr     w1, [sp, y]           //    and y
            bl      remainder

            mov     w0, wzr               // Return 0
            ldp     x29, x30, [sp], FRAME // Delete stack frame
            ret
    ```
    ```asm
    // Show sum of two integers, return sum.
    // Calling sequence
    //    w0 <- first integer
    //    w1 <- second integer
            .arch armv8-a
    // Stack frame
            .equ    save1920, 16
            .equ    FRAME, 32
    // Code
            .text
            .section  .rodata
            .align  3
    plus:
            .string " + "
    equals:
            .string " = "
            .text
            .align  2
            .global sum
            .type   sum, %function
    sum:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Our frame pointer
            stp     x19, x20, [sp, save1920]  // Save registers

            mov     w19, w0               // Save inputs
            mov     w20, w1

            mov     w0, w19               // First integer
            bl      put_int
            adr     x0, plus              // +
            bl      write_str
            mov     w0, w20               // Second integer
            bl      put_int
            adr     x0, equals            // =
            bl      write_str
            add     w0, w19, w20          // Sum
            bl      put_int
            mov     x0, '\n'
            bl      write_char

            add     w0, w19, w20          // Return sum
            ldp     x19, x20, [sp, save1920]  // Restore registers
            ldp     x29, x30, [sp], FRAME // Delete stack frame
            ret
    ```
    ```asm
    // Show difference between two integers, return difference.
    // Calling sequence
    //    w0 <- first integer
    //    w1 <- second integer
            .arch armv8-a
    // Stack frame
            .equ    save1920, 16
            .equ    FRAME, 32
    // Code
            .text
            .section  .rodata
            .align  3
    minus:
            .string " - "
    equals:
            .string " = "
            .text
            .align  2
            .global difference
            .type   difference, %function
    difference:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Our frame pointer
            stp     x19, x20, [sp, save1920]  // Save registers

            mov     w19, w0               // Save inputs
            mov     w20, w1

            mov     w0, w19               // First integer
            bl      put_int
            adr     x0, minus             // -
            bl      write_str
            mov     w0, w20               // Second integer
            bl      put_int
            adr     x0, equals            // =
            bl      write_str
            sub     w0, w19, w20          // difference
            bl      put_int
            mov     x0, '\n'
            bl      write_char

            sub     w0, w19, w20          // Return difference
            ldp     x19, x20, [sp, save1920]  // Restore registers
            ldp     x29, x30, [sp], FRAME // Delete stack frame
            ret
    ```
    ```asm
    // Show product of two integers, return product.
    // Calling sequence
    //    w0 <- first integer
    //    w1 <- second integer
            .arch armv8-a
    // Stack frame
            .equ    save1920, 16
            .equ    FRAME, 32
    // Code
            .text
            .section  .rodata
            .align  3
    times:
            .string " * "
    equals:
            .string " = "
            .text
            .align  2
            .global product
            .type   product, %function
    product:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Our frame pointer
            stp     x19, x20, [sp, save1920]  // Save registers

            mov     w19, w0               // Save inputs
            mov     w20, w1

            mov     w0, w19               // First integer
            bl      put_int
            adr     x0, times             // #
            bl      write_str
            mov     w0, w20               // Second integer
            bl      put_int
            adr     x0, equals            // =
            bl      write_str
            mul     w0, w19, w20          // product
            bl      put_int
            mov     x0, '\n'
            bl      write_char

            mul     w0, w19, w20          // Return product
            ldp     x19, x20, [sp, save1920]  // Restore registers
            ldp     x29, x30, [sp], FRAME // Delete stack frame
            ret
    ```
    ```asm
    // Show quotient of two integers, return quotient.
    // Calling sequence
    //    w0 <- first integer
    //    w1 <- second integer
            .arch armv8-a
    // Stack frame
            .equ    save1920, 16
            .equ    FRAME, 32
    // Code
            .text
            .section  .rodata
            .align  3
    div:
            .string " / "
    equals:
            .string " = "
            .text
            .align  2
            .global quotient
            .type   quotient, %function
    quotient:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Our frame pointer
            stp     x19, x20, [sp, save1920]  // Save registers

            mov     w19, w0               // Save inputs
            mov     w20, w1

            mov     w0, w19               // First integer
            bl      put_int
            adr     x0, div               // /
            bl      write_str
            mov     w0, w20               // Second integer
            bl      put_int
            adr     x0, equals            // =
            bl      write_str
            sdiv    w19, w19, w20         // Save quotient
            mov     w0, w19               // For put_int
            bl      put_int
            mov     x0, '\n'
            bl      write_char

            mov     w0, w19               // Return quotient
            ldp     x19, x20, [sp, save1920]  // Restore registers
            ldp     x29, x30, [sp], FRAME // Delete stack frame
            ret
    ```
    ```asm
    // Show remainder from dividing two integers, return remainder.
    // Calling sequence
    //    w0 <- first integer
    //    w1 <- second integer
            .arch armv8-a
    // Stack frame
            .equ    save1920, 16
            .equ    FRAME, 32
    // Code
            .text
            .section  .rodata
            .align  3
    rem:
            .string " % "
    equals:
            .string " = "
            .text
            .align  2
            .global remainder
            .type   remainder, %function
    remainder:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Our frame pointer
            stp     x19, x20, [sp, save1920]  // Save registers

            mov     w19, w0               // Save inputs
            mov     w20, w1

            mov     w0, w19               // First integer
            bl      put_int
            adr     x0, rem               // %
            bl      write_str
            mov     w0, w20               // Second integer
            bl      put_int
            adr     x0, equals            // =
            bl      write_str
            sdiv    w1, w19, w20          // Quotient
            msub    w19, w1, w20, w19     // Save remainder
            mov     w0, w19               // For put_int
            bl      put_int
            mov     x0, '\n'
            bl      write_char

            mov     w0, w19               // Return remainder
            ldp     x19, x20, [sp, save1920]  // Restore registers
            ldp     x29, x30, [sp], FRAME // Delete stack frame
            ret
    ```
