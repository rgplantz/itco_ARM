---
layout: default
title: Chapter 13
---

## Chapter 13

1.  The compiler generates the same assembly language for the `while` and `for` loops. The difference is only in the C syntax. Both the `while` and `for` loops branch to the bottom of the loop body, where the loop termination condition is tested before branching to the top of the loop body:
    ```
            b	     .L2
    .L3:
            mov	    x2, 1
            ldr	    x1, [sp, 24]
            mov	    w0, 1
            bl	    write
            ldr	    x0, [sp, 24]
            add	    x0, x0, 1
            str	    x0, [sp, 24]
    .L2:
            ldr	    x0, [sp, 24]
            ldrb	  w0, [x0]
            cmp	    w0, 0
            bne	    .L3
    ```
    The `do-while` loop executes the loop body before testing the loop termination condition:
    ```
    .L2:
            mov	    x2, 1
            ldr	    x1, [sp, 24]
            mov	    w0, 1
            bl	    write
            ldr	    x0, [sp, 24]
            add	    x0, x0, 1
            str	    x0, [sp, 24]
            ldr	    x0, [sp, 24]
            ldrb	  w0, [x0]
            cmp	    w0, 0
            bne	    .L2
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
4.  Top and bottom fourths are heads.
    ```asm
    ```