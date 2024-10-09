---
layout: default
title: Chapter 19
---

## Chapter 19

1.  We can see that from the hexadecimal displays of the contents of `w19` and `w20` that the fractional part is in the low-order four bits of the register and the integral part in the high-order 28 bits.
    ```
    (gdb) b 28
    Breakpoint 1 at 0x7f8: file add_lengths.s, line 28.
    (gdb) r
    Starting program: /home/bob/add_lengths/add_lengths 
    [Thread debugging using libthread_db enabled]
    Using host libthread_db library "/lib/aarch64-linux-gnu/libthread_db.so.1".
    Enter length (inches and 1/16s)
            Inches: 12
        Sixteenths: 13
    Enter length (inches and 1/16s)
            Inches: 4 
        Sixteenths: 15
    Sum = 
    Breakpoint 1, main () at add_lengths.s:28
    28              add     w0, w20, w19              // Add lengths
    (gdb) i r w19 w20
    w19            0xcd                205
    w20            0x4f                79
    (gdb) 
    ```
2.  The decimal displays of the contents of `w19` and `w20` show the scaled values of the numbers we entered. Since these are decimal values, the integral and fractional parts are not aligned to bit positions in the register.
    ```
    (gdb) b 28
    Breakpoint 1 at 0x7f8: file add_money.s, line 28.
    (gdb) r
    Starting program: /home/bob/text_listings/add_money/add_money 
    [Thread debugging using libthread_db enabled]
    Using host libthread_db library "/lib/aarch64-linux-gnu/libthread_db.so.1".
    Enter amount (use same sign for dollars and cents)
      Dollars: 1
        Cents: 45
    Enter amount (use same sign for dollars and cents)
      Dollars: 2
        Cents: 67
    Sum = 
    Breakpoint 1, main () at add_money.s:28
    28              add     w0, w19, w20              // Add values
    (gdb) i r w19 w20
    w19            0x91                145
    w20            0x10b               267
    (gdb) 
    ```
3.  The scaled value of 214743647 + 1 is 214743648, which is a negative number is 32 bits.
    ```
    Enter amount (use same sign for dollars and cents)
      Dollars: 21474836
        Cents: 47
    Enter amount (use same sign for dollars and cents)
      Dollars: 0
        Cents: 01
    Sum = -$21474836.48
    ```
4.  My solution does not indicate when the sum goes to the next day. It just shoes an hour value greater than 24.
    ```asm
    // Add two time values.
            .arch armv8-a
    // Stack frame
            .equ    save1920, 16
            .equ    FRAME, 32
    // Constant data
            .section  .rodata
            .align  3
    start_time:
            .string "Starting time\n"
    delta_time:
            .string "Duration time\n"
    end_time:
            .string "Ends at "
    // Code
            .text
            .align  2
            .global main
            .type   main, %function
    main:
            stp     fp, lr, [sp, -FRAME]!     // Create stack frame
            mov     fp, sp                    // Set our frame pointer
            stp     x19, x20, [sp, save1920]  // For local vars

            adr     x0, start_time            // Ask for starting time
            bl      write_str
            bl      get_time
            mov     w19, w0                   // Start time
            adr     x0, delta_time            // Ask for duration time
            bl      write_str
            bl      get_time
            mov     w20, w0                   // Delta time

            adr     x0, end_time              // Ending message
            bl      write_str
            add     w0, w19, w20              // Add values
            bl      display_time              // Show ending time
            mov     w0, '\n'                  // Finish formatting
            bl      write_char

            mov     w0, wzr                   // Return 0
            ldp     x19, x20, [sp, save1920]  // Restore for caller
            ldp     fp, lr, [sp], FRAME       // Delete stack frame
            ret                               // Back to caller
    ```
    ```asm
// Get hours, minute, and seconds from the keyboard.
// Calling sequence
//     Return integer amount as seconds.
        .arch armv8-a
// Stack frame
        .equ    save19, 16
        .equ    FRAME, 32
# Constant data
        .section  .rodata
        .align  3
hours:
        .string "      Hours: "
minutes:
        .string "    Minutes: "
seconds:
        .string "    Seconds: "
// Code
        .text
        .align  2
        .global get_time
        .type   get_time, %function
get_time:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Set our frame pointer
        str     x19, [sp, save19]     // For local var

        adr     x0, hours             // Ask for hours
        bl      write_str
        bl      get_uint              // Hours
        mov     w1, 3600              // 3600 seconds per hour
        mul     w19, w0, w1           // Scale

        adr     x0, minutes           // Ask for minutes
        bl      write_str
        bl      get_uint              // Minutes
        mov     w1, 60                // 60 seconds per minute
        mul     w0, w0, w1            // Scale
        add     w19, w19, w0          // Add scaled minutes

        adr     x0, seconds           // Ask for seconds
        bl      write_str
        bl      get_uint              // Seconds
        add     w0, w19, w0           // Add seconds

        ldr     x19, [sp, save19]     // Restore for caller
        ldp     fp, lr, [sp], FRAME   // Delete stack frame
        ret                           // Back to caller
    ```
    ```asm
    // Display hours, minutes, and seconds.
            .arch armv8-a
    // Calling sequence
    //    w0 <- value in seconds
    //    Return 0.
    // Stack frame
            .equ    save1920, 16
            .equ    FRAME, 32
    # Constant data
            .section  .rodata
            .align  3
    // Code
            .text
            .align  2
            .global display_time
            .type   display_time, %function
    display_time:
            stp     fp, lr, [sp, -FRAME]!     // Create stack frame
            mov     fp, sp                    // Set our frame pointer
            stp     x19, x20, [sp, save1920]  // For local vars

            mov     w1, 3600                  // 360 seconds per hour
            udiv    w20, w0, w1               // Hours
            msub    w19, w20, w1, w0          // Leaving seconds

            mov     w0, w20                   // Hours
            bl      put_uint
            mov     w0, ':'                   // Some formatting
            bl      write_char

            mov     w1, 60                    // 60 seconds per minute
            udiv    w20, w19, w1              // Minutes
            msub    w19, w20, w1, w19         // Leaving seconds

            mov     w0, w20                   // Minutes
            bl      put_uint
            mov     w0, ':'                   // Some formatting
            bl      write_char

            mov     w0, w19                   // Seconds
            bl      put_uint

            mov     w0, wzr                   // Return 0
            ldp     x19, x29, [sp, save1920]  // Restore for caller
            ldp     fp, lr, [sp], FRAME       // Delete stack frame
            ret                               // Back to caller
    ```
5.  Use doubles.
    ```c
    // Test the addition associativity of doubles.

    #include <stdio.h>
    #include <math.h>

    int main()
    {
        double x, y, z, sum1, sum2;

        printf("Enter a number: ");
        scanf("%lf", &x);
        printf("Enter a number: ");
        scanf("%lf", &y);
        printf("Enter a number: ");
        scanf("%lf", &z);
        
        sum1 = x + y;
        sum1 += z;      /* sum1 = (x + y) + z */
        sum2 = y + z;
        sum2 += x;      /* sum2 = x + (y + z) */

        if (sum1 == sum2)
          printf("%lf is the same as %lf\n", sum1, sum2);
        else
          printf("%lf is not the same as %lf\n", sum1, sum2);

        return 0;
    }
    ```
