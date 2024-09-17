---
layout: default
title: Chapter 14
---

## Chapter 14

3.  Sum integers
    ```
    // Sum the integers between two entered by user.
            .arch armv8-a
    // Stack frame
            .equ    x, 16
            .equ    y, 20
            .equ    FRAME, 32
    // Constant data
            .section  .rodata
            .align  3
    prompt:
            .string "Enter an integer: "
    in_format:
            .string "%i"
    out_format:
            .string "The sum is %i\n"
            .text
            .align  2
            .global main
            .type   main, %function
    main:
            sub     sp, sp, FRAME   // Allocate our stack frame
            stp     fp, lr, [sp]    // Create stack frame
            mov     fp, sp          // Set our frame pointer

            adr     x0, prompt      // Ask for integer 
            bl      printf
            add     x1, sp, x       // Place for first int
            adr     x0, in_format   // scanf format string
            bl      scanf           // Get the int

            adr     x0, prompt      // Ask for integer 
            bl      printf
            add     x1, sp, y       // Place for second int
            adr     x0, in_format   // scanf format string
            bl      scanf           // Get the int

            ldr     w0, [sp, x]
            ldr     w1, [sp, y]
            bl      add_ints        // Add them
            mov     w1, w0
            adr     x0, out_format
            bl      printf

            mov     w0, wzr         // Return 0
            ldp     fp, lr, [sp]    // Restore fp and lr
            add     sp, sp, FRAME   // Delete stack frame
            ret                     // Back to caller
    ```

    ```
    // Add all integers between two integers and return the sum.
    // Calling sequence:
    //    w0 <- one integer
    //    w1 <- another integer
    //    Returns sum
            .arch armv8-a
            .text
            .align  2
            .global add_ints
            .type   add_ints, %function
    add_ints:
            cmp     w0, w1                // Check for lower
            b.lo    in_order
            mov     w2, w0                // Out of order, swap
            mov     w0, w1
            mov     w1, w2
    in_order:
            mov     w2, w0                // Accumulate sum in w2
    loop:
            cmp     w0, w1                // Added all of them?
            b.hs    done                  // Yes
            add     w0, w0, 1             // Next int
            add     w2, w2, w0            // Add to accmulator
            b       loop                  // And keep adding
    done:
            mov     w0, w2                // Return sum
            ret                           // Back to caller
    ```
4.  You will need these functions for many of the Your Turn exercises in the rest of the book.
    ```c
    // Writes a char to the standard output (screen).
    // Calling sequence:
    //       w0 <- char to be written
    // returns 0

    #ifndef WRITE_CHAR_H
    #define WRITE_CHAR_H
    int write_char(char);
    #endif
    ```
    ```asm
    // Writes a char to the standard output (screen).
    // Calling sequence:
    //       w0 <- char to be written
    // returns 0

            .arch   armv8-a
    // Useful constants
            .equ    STDOUT, 1
    // Stack frame
            .equ    a_char, 16
            .equ    FRAME, 32 
    // The code
            .text
            .align  2
            .global write_char
            .type   write_char, %function
    write_char:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Set our frame pointer
            strb    w0, [sp, a_char]      // Store input char

            mov     w2, 1                 // Write 1 byte
            add     x1, sp, a_char        // Address of char
            mov     w0, STDOUT            // Write to screen
            bl      write

            mov     w0, wzr               // Return 0
            ldp     fp, lr, [sp], FRAME   // Delete stack frame
            ret
    ```

    ```c
    // Writes a C-style text string to the standard output (screen).
    // Calling sequence:
    //       x0 <- address of string to be written
    // returns number of characters written

    #ifndef WRITE_STR_H
    #define WRITE_STR_H
    int write_str(char *);
    #endif
    ```

    ```asm
    // Writes a C-style text string to the standard output (screen).
    // Calling sequence:
    //       x0 <- address of string to be written
    // returns number of characters written

            .arch   armv8-a
    // Useful constants
            .equ    STDOUT, 1
            .equ    NUL, 0
    // Stack frame
            .equ    save1920, 16
            .equ    FRAME, 32 
    // The code
            .text
            .align  2
            .global write_str
            .type   write_str, %function
    write_str:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Set our frame pointer
            stp     x19, x20, [sp, save1920]  // Save regs
            mov     x19, x0               // Address of string
            mov     w20, wzr              // count = 0
    while:
            ldrb    w0, [x19]             // Get a char
            cmp     w0, NUL               // End of string?
            b.eq     done                 // Yes, all done

            mov     w2, 1                 // No, write 1 byte
            mov     x1, x19               // Address of current char
            mov     w0, STDOUT            // Write to screen
            bl      write

            add     x19, x19, 1           // Increment pointer var
            add     w20, w20, 1           // count++
            b       while                 // Back to top
    done:
            mov     w0, w20               // Return count
            ldp     x19, x20, [sp, save1920]  // Restore regs
            ldp     fp, lr, [sp], FRAME   // Delete stack frame
            ret
    ```

    ```c
    // Reads a line (through the '\n') from standard input. Does not
    // stores '\n' and any characters beyond maximum. Appends NUL at
    // end of stored characters. Allow maximum + 1 for character storage.
    // Calling sequence:
    //        x0 <- address of place to store string
    //        w1 <- maximum characters to store
    // returns number of characters read

    #ifndef READ_STR_H
    #define READ_STR_H
    int read_str(char *, int);
    #endif
    ```
    ```asm
    // Reads a line (through the '\n') from standard input. Does not
    // stores '\n' and any characters beyond maximum. Appends NUL at
    // end of stored characters. Allow maximum + 1 for character storage.
    // Calling sequence:
    //        x0 <- address of place to store string
    //        w1 <- maximum characters to store
    // returns number of characters read

            .arch   armv8-a
    // Useful constants
            .equ    STDIN, 0
            .equ    NUL, 0
            .equ    LF, 10          // '\n' in Linux
    // Stack frame
            .equ    save1920, 16
            .equ    save21, 32
            .equ    FRAME, 48 
    // The code
            .text
            .align  2
            .global read_str
            .type   read_str, %function
    read_str:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Set our frame pointer
            stp     x19, x20, [sp, save1920]  // Save regs
            str     x21, [sp, save21]
            mov     x19, x0               // Address of string
            mov     w20, wzr              // count = 0
            mov     w21, w1               // Max chars

    read_loop:
            mov     w2, 1                 // Read 1 byte
            mov     x1, x19               // Place to store current char
            mov     w0, STDIN             // Read from keyboard
            bl      read

            ldrb    w0, [x19]             // Get just read char
            cmp     w0, LF                // return key?
            b.eq    end_input             // Yes, end of input
            cmp     w20, w21              // No, is caller's array full?
            b.ge    read_loop             // Yes, read but don't keep
            add     x19, x19, 1           // no, next byte
            add     w20, w20, 1           // count++
            b       read_loop             // Back to reading
    end_input:
            mov     w0, NUL               // String terminator
            strb    wzr, [x19]            // Replace LF
            mov     w0, w20               // Return count
            ldr     w21, [sp, save21]     // Restore regs
            ldp     x19, x20, [sp, save1920]
            ldp     fp, lr, [sp], FRAME   // Delete stack frame
            ret
    ```
4.  The assembly language shows that the `b` to the default case at the end of cases 1, 2, and 3 is removed when the `break;` C statement is deleted. The switch is entered at the same point in the list of statements but all the subsequent statements are also executed:
    ```asm
    $ ./switch_nb 
    i = 1
    i = 2
    i = 3
    i > 3
    i = 2
    i = 3
    i > 3
    i = 3
    i > 3
    i > 3
    i > 3
    i > 3
    i > 3
    i > 3
    i > 3
    i > 3
    ```
5.  `if` statements.
    ```
    // Select one of three or default.
            .arch armv8-a
    // Useful names
            .equ    NTIMES, 10            // number of loops
    // Stack frame
            .equ    save19, 16
            .equ    FRAME, 32
    // Constant data
            .section        .rodata
    one_msg:
            .string "i = 1"
    two_msg:
            .string "i = 2"
    three_msg:
            .string "i = 3"
    over_msg:
            .string "i > 3"
    // Program code
            .text
            .align  2
            .global main
            .type   main, %function
    main:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Set our frame pointer
            str     x19, [sp, save19]     // Save reg
            mov     w19, 1                // i = 1
    loop:
            cmp     x19, NTIMES           // Is i at end?
            b.hi    all_done              // Yes, leave loop
            cmp     w19, 1                // One?
            b.ne    two                   // No
            adr     x0, one_msg           // Yes, tell user
            bl      puts
    two:
            cmp     w19, 2                // Two?
            b.ne    three                 // No
            adr     x0, two_msg           // Yes
            bl      puts
    three:
            cmp     w19, 3                // Three?
            b.ne    over                  // No
            adr     x0, three_msg         // Yes
            bl      puts
    over:
            cmp     w19, 3                // Less than 3?
            b.le    less                  // Yes
            adr     x0, over_msg
            bl      puts
    less:
            add     w19, w19, 1           // i++
            b       loop                  // And continue loop
    all_done:
            mov     w0, wzr               // Return 0
            ldr     x21, [sp, save19]     // Restore reg
            ldp     fp, lr, [sp], FRAME   // Delete stack frame
            ret
    ```asm
    ```
6.  `if-else` ladder.
    ```asm
    // Select one of three or default.
            .arch armv8-a
    // Useful names
            .equ    NTIMES, 10            // number of loops
    // Stack frame
            .equ    save19, 16
            .equ    FRAME, 32
    // Constant data
            .section        .rodata
    one_msg:
            .string "i = 1"
    two_msg:
            .string "i = 2"
    three_msg:
            .string "i = 3"
    over_msg:
            .string "i > 3"
    // Program code
            .text
            .align  2
            .global main
            .type   main, %function
    main:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Set our frame pointer
            str     x19, [sp, save19]     // Save reg
            mov     w19, 1                // i = 1
    loop:
            cmp     x19, NTIMES           // Is i at end?
            b.hi    all_done              // Yes, leave loop
            cmp     w19, 1                // One?
            b.ne    two                   // No
            adr     x0, one_msg           // Yes, tell user
            bl      puts
            b       continue
    two:
            cmp     w19, 2                // Two?
            b.ne    three                 // No
            adr     x0, two_msg           // Yes
            bl      puts
            b       continue
    three:
            cmp     w19, 3                // Three?
            b.ne    over                  // No
            adr     x0, three_msg         // Yes
            bl      puts
            b       continue
    over:
            adr     x0, over_msg
            bl      puts
    continue:
            add     w19, w19, 1           // i++
            b       loop                  // And continue loop
    all_done:
            mov     w0, wzr               // Return 0
            ldr     x21, [sp, save19]     // Restore reg
            ldp     fp, lr, [sp], FRAME   // Delete stack frame
            ret
    ```
