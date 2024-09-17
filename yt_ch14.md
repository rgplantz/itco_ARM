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
5.  Count times called
    ```asm
    // Compare scope and lifetime of automatic, static,
    // and global variables.
            .arch armv8-a
    // Useful names
            .equ    INIT_X, 12
            .equ    INIT_Y, 34
            .equ    INIT_Z, 56
    // Stack frame
            .equ    x, 24
            .equ    y, 28
            .equ    FRAME, 32
    // Code
            .global z
            .data
            .align  2
            .type   z, %object
            .size   z, 4
    z:
            .word   INIT_Z
            .section  .rodata
    heading0:
            .string "           automatic   static   global"
    heading1:
            .string "                   x        y        z"
    msg:
            .string "In main:%12i %8i %8i\n"
            .text
            .align  2
            .global main
            .type   main, %function
    main:
            stp     fp, lr, [sp, -FRAME]!   // create our stack frame
            mov     fp, sp                  // set our frame pointer

            mov     w0, INIT_X
            str     w0, [sp, x]             // x = INIT_X;
            mov     w0, INIT_Y
            str     w0, [sp, y]             // y = INIT_Y;
            adr     x0, heading0            // print 2-line header
            bl      puts
            adr     x0, heading1
            bl      puts

            adr     x0, z 
            ldr     w3, [x0]                // global z
            ldr     w2, [sp, y]             // local y
            ldr     w1, [sp, x]             // and local x
            adr     x0, msg                 // show values
            bl      printf

            bl      add_const               // add constants
            bl      add_const               //     twice

            adr     x0, z                   // repeat display
            ldr     w3, [x0]
            ldr     w2, [sp, y]
            ldr     w1, [sp, x]
            adr     x0, msg
            bl      printf

            mov     w0, wzr                 // return 0
            ldp     fp, lr, [sp], FRAME     // restore fp, lr, sp
            ret                             // back to caller
    ```

    ```asm
    // Add constant to automatic, static, global variables.
            .arch armv8-a
    // Useful names
            .equ    INIT_X, 78
            .equ    INIT_Y, 90
            .equ    ADDITION, 1000
    // Stack frame
            .equ    x, 28
            .equ    FRAME, 32
    // Code
            .data
            .align  2
            .type   y, %object
            .size   y, 4
    y:
            .word   INIT_Y
            .align  2
            .type   count, %object
            .size   count, 4
    count:
            .word   0
            .section  .rodata
    msg:
            .string "In add_const:%7i %8i %8i, call number %i\n"
            .text
            .align  2
            .global add_const
            .type   add_const, %function
    add_const:
            stp     fp, lr, [sp, -FRAME]!   // Create stack frame
            mov     fp, sp                  // Set frame pointer

            mov     w0, INIT_X
            add     w0, w0, ADDITION        // Add constant
            str     w0, [sp, x]             // x += ADDITION
            adr     x0, y
            ldr     w1, [x0]                // Load our y
            add     w1, w1, ADDITION        // Add constant
            str     w1, [x0]                // y += ADDITION    
            adrp    x0, :got:z              // z page number
            ldr     x0, [x0, :got_lo12:z]   // z address
            ldr     w1, [x0]                // load z
            add     w1, w1, ADDITION        // add constant
            str     w1, [x0]                // z += ADDITION;

            adr     x0, count
            ldr     w4, [x0]                // Load our count
            add     w4, w4, 1               // Increment
            str     w4, [x0]    
            adrp    x0, :got:z              // z page number
            ldr     x0, [x0, :got_lo12:z]   // z address
            ldr     w3, [x0]                // load z
            adr     x0, y
            ldr     w2, [x0]                // Load our y
            ldr     w1, [sp, x]             // load our x
            adr     x0, msg                 // message
            bl      printf

            mov     w0, wzr                 // Return 0
            ldp     fp, lr, [sp], FRAME     // Delete stack frame
            ret
    ```
6.  The name decoration of the static variable, `y`, is the same for both functions, `y.0`. This label is local to the file for each function, and the assembler figures out the offset to the label in each file.
