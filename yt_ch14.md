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
2.  Program to echo characters entered on keyboard.
    ```asm
    // Echo characters entered on keyboard.
            .arch armv8-a
    // Useful names
            .equ    MAX, 10
            .equ    NUL, 0
            .equ    LF, 10          // '\n' in Linux
            .equ    STDIN, 0
            .equ    STDOUT, 1
    // Stack frame
            .equ    save1920, 16
            .equ    the_string, 32
            .equ    FRAME, 48 
    // Constant data
            .section  .rodata
    prompt:
            .string "Enter up to 10 characters: "
    response:
            .string "You entered: "
    newline:
            .string "\n"
    // Code
            .text
            .align  2
            .global main
            .type   main, %function
    main:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Set our frame pointer
            stp     x19, x20, [sp, save1920]  // Save for caller
            adr     x19, prompt           // Address of prompt message
    prompt_loop:
            ldrb    w0, [x19]             // Load character
            cmp     w0, NUL               // End of string?
            b.eq    read_input            // Yes
            mov     w2, 1                 // No, one char
            mov     x1, x19               // Address of char
            mov     x0, STDOUT            // Write on screen
            bl      write
            add     x19, x19, 1           // Increment pointer
            b       prompt_loop           //   and continue
    read_input:
            add     x19, sp, the_string   // Address of string storage
            mov     w20, wzr              // Zero characters stored
    read_loop:
            mov     w2, 1                 // One char
            mov     x1, x19               // Place to store it
            mov     x0, STDIN             // Read from keyboard
            bl      read
            ldrb    w0, [x19]             // Load character
            cmp     w0, LF                // End of input?
            b.eq    terminate_string      // Yes
            cmp     w20, MAX              // No, is storage array full?
            b.ge    read_loop             // Yes, read but don't keep
            add     x19, x19, 1           // Increment pointer
            add     x20, x20, 1           //     and counter
            b       read_loop             // No, continue reading
    terminate_string:
            mov     w0, NUL               // Yes, string termination char
            strb    w0, [x19]             // Terminate the string

            adr     x19, response         // Address of response message
    response_loop:
            ldrb    w0, [x19]             // Load character
            cmp     w0, NUL               // End of string?
            b.eq    echo                  // Yes
            mov     w2, 1                 // No, one char
            mov     x1, x19               // Address of char
            mov     x0, STDOUT            // Write on screen
            bl      write
            add     x19, x19, 1           // Increment pointer
            b       response_loop         //   and continue
    echo:
            add     x19, sp, the_string   // Get beginning of string storage
    echo_loop:
            ldrb    w0, [x19]             // Load character
            cmp     w0, NUL               // End of string?
            b.eq    done                  // Yes
            mov     w2, 1                 // No, one char
            mov     x1, x19               // Address of char
            mov     x0, STDOUT            // Write on screen
            bl      write
            add     x19, x19, 1           // Increment pointer
            b       echo_loop             //   and continue
    done:
            mov     w2, 1                 // One char
            adr     x1, newline           // Address of newline char
            mov     x0, STDOUT            // Write on screen
            bl      write
            mov     w0, wzr               // Return 0
            ldp     x19, x20, [sp, save1920]  // Restore regs
            ldp     fp, lr, [sp], FRAME   // Delete stack frame
            ret
    ```
3.  Top and bottom fourths are heads.
    ```asm
    // Flip a coin, showing heads or tails.
            .arch armv8-a
    // Useful names
            .equ    N_TIMES, 10           // Number of flips
            .equ    RAND_BOTTOM, 536870911  // RAND_MAX/4
            .equ    RAND_TOP, 1610612733  // 3*RAND_MAX/4
    // Stack frame
            .equ    save19, 28
            .equ    FRAME, 32
    // Constant data
            .section  .rodata
    heads_msg:
            .string "heads"
    tails_msg:
            .string "tails"
    // Code
            .text
            .align  2
            .global main
            .type   main, %function
    main:
            stp     fp, lr, [sp, -FRAME]! // Create stack frame
            mov     fp, sp                // Set our frame pointer
            str     w19, [sp, save19]     // Save for i local var
            mov     w19, wzr              // i = 0
    loop:
            mov     w0, N_TIMES           // Total number of times
            cmp     w19, w0               // Is i at end?
            b.hs    done                  // Yes
            bl      random                // No, get random number
            mov     w1, RAND_TOP & 0xffff           // Top fourth; needs
            movk    w1, RAND_TOP / 0x10000, lsl 16   //    two instructions
            cmp     w1, w0                // Above or below?
            b.lo    heads                 // Above -> heads
            mov     w1, RAND_BOTTOM & 0xffff          // Bottom fourth; needs
            movk    w1, RAND_BOTTOM / 0x10000, lsl 16  //    two instructions
            cmp     w1, w0                // Above or below?
            b.hi    heads                 // Below -> heads
            adr     x0, tails_msg         // Middle -> tails
            bl      puts                  // Print message
            b       continue              // Skip else part
    heads:
            adr     x0, heads_msg         // Heads message address
            bl      puts                  // Print message
    continue:
            add     w19, w19, 1           // Increment i
            b       loop                  //   and continue loop
    done:
            mov     w0, wzr               // Return 0
            ldr     w19, [sp, save19]     // Restore reg
            ldp     fp, lr, [sp], FRAME   // Delete stack frame
            ret                           // Back to caller
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
