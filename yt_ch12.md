---
layout: default
title: Chapter 12
---

## Chapter 12

1.  Let's look at the`adr` instruction in the listing file.
    ```
      29 002c 00000010 	        adr     x0, format            // Assume on same page
    ```
    This shows that the machine code is `0x10000000`. Looking at Figure 12-10 in the book, we can see that the offset from the instruction to the address of the text string has not yet been inserted into the instruction. Let's look at the instruction when the program is loaded into memory.
    ```
    (gdb) l
    1       // Add three constants to show some machine code.
    2               .arch armv8-a
    3       // Stack frame
    4               .equ    z, 28
    5               .equ    FRAME, 32
    6       // Constant data 
    7               .section        .rodata
    8       format:
    9               .string "%i + %i + 456 = %i\n"
    10      // Code
    (gdb) 
    11              .text
    12              .align  2
    13              .global main
    14              .type   main, %function
    15      main:
    16              stp     fp, lr, [sp, FRAME]!  // Create stack frame
    17              mov     fp, sp
    18
    19              mov     w19, 123              // 1st constant
    20              mov     w20, -123             // 2nd constant
    (gdb) 
    21              add     w21, w19, w20         // Add them
    22              add     w22, w21, 456         // Another constant
    23              str     w22, [sp, z]          // Store sum
    24
    25              ldr     w3, [sp, z]           // Get sum
    26              mov     w2, w20               // Get 2nd constant
    27              orr     w2, wzr, w20          // Alias
    28              mov     w1, w19               // Get 1st constant
    29              adr     x0, format            // Assume on same page
    30              bl      printf
    ```
    I set breakpoints at the beginning and at the `adr` instruction and ran the program.
    ```
    (gdb) b 16
    Breakpoint 1 at 0x754: file add_consts.s, line 16.
    (gdb) b 29
    Breakpoint 2 at 0x780: file add_consts.s, line 29.
    (gdb) r
    Starting program: /home/bob/GitHub/itco_ARM/build/chapter_12/your_turn/add_consts_1/add_consts 
    [Thread debugging using libthread_db enabled]
    Using host libthread_db library "/lib/aarch64-linux-gnu/libthread_db.so.1".

    Breakpoint 1, main () at add_consts.s:16
    16              stp     fp, lr, [sp, FRAME]!  // Create stack frame
    ```
    Next, I disassemble some of the code>
    ```
    (gdb) disassemble
    Dump of assembler code for function main:
    => 0x0000555555550754 <+0>:     stp     x29, x30, [sp, #32]!
      0x0000555555550758 <+4>:     mov     x29, sp
      0x000055555555075c <+8>:     mov     w19, #0x7b                      // #123
      0x0000555555550760 <+12>:    mov     w20, #0xffffff85                // #-123
      0x0000555555550764 <+16>:    add     w21, w19, w20
      0x0000555555550768 <+20>:    add     w22, w21, #0x1c8
      0x000055555555076c <+24>:    str     w22, [sp, #28]
      0x0000555555550770 <+28>:    ldr     w3, [sp, #28]
      0x0000555555550774 <+32>:    mov     w2, w20
      0x0000555555550778 <+36>:    mov     w2, w20
      0x000055555555077c <+40>:    mov     w1, w19
      0x0000555555550780 <+44>:    adr     x0, 0x5555555507ac
      0x0000555555550784 <+48>:    bl      0x555555550630 <printf@plt>
      0x0000555555550788 <+52>:    mov     w0, wzr
      0x000055555555078c <+56>:    ldp     x29, x30, [sp], #32
      0x0000555555550790 <+60>:    ret
    End of assembler dump.
    ```
    Let's look at the machine code for the `adr` instruction.
    ```
    (gdb) x/xw 0x555555550780
    0x555555550780 <main+44>:       0x10000160
    (gdb) 
    ```
    Looking at Figure 12-10, we can see that the offset from the instruction to the address of the text string is `0x2c`. Add this to the address of the instruction and look at the characters stored there.
    ```
    (gdb) x/20c 0x5555555507ac
    0x5555555507ac: 37 '%'  105 'i' 32 ' '  43 '+'  32 ' '  37 '%'  105 'i' 32 ' '
    0x5555555507b4: 43 '+'  32 ' '  52 '4'  53 '5'  54 '6'  32 ' '  61 '='  32 ' '
    0x5555555507bc: 37 '%'  105 'i' 10 '\n' 0 '\000'
    ```
    We can see that the offset to the text string is included when the `adr` instruction is loaded into memory. The `objdump -d addconsts` command shows that the offset is inserted into the `adr` instruction during the linking phase.
    ```
    $ objdump -d add_consts
    0000000000000754 <main>:
    754:   a9827bfd        stp     x29, x30, [sp, #32]!
    758:   910003fd        mov     x29, sp
    75c:   52800f73        mov     w19, #0x7b                      // #123
    760:   12800f54        mov     w20, #0xffffff85                // #-123
    764:   0b140275        add     w21, w19, w20
    768:   110722b6        add     w22, w21, #0x1c8
    76c:   b9001ff6        str     w22, [sp, #28]
    770:   b9401fe3        ldr     w3, [sp, #28]
    774:   2a1403e2        mov     w2, w20
    778:   2a1403e2        mov     w2, w20
    77c:   2a1303e1        mov     w1, w19
    780:   10000160        adr     x0, 7ac <format>
    784:   97ffffab        bl      630 <printf@plt>
    788:   2a1f03e0        mov     w0, wzr
    78c:   a8c27bfd        ldp     x29, x30, [sp], #32
    790:   d65f03c0        ret
    ```
2.
    Both optimizations use a faster algorithm to add 1 to the integer. With no optimization the addition is performed in `w0` and then moved to `w1` for the call to `printf`:
    ```
    ldr     w0, [sp, 28]
    add     w0, w0, 1
    str     w0, [sp, 28]
    ldr     w0, [sp, 28]
    mov     w1, w0
    adrp    x0, .LC2
    add     x0, x0, :lo12:.LC2
    bl	    printf
    ```
    Both optimizations load the integer directly into `w1` and perform the addition there:
    ```
    ldr	    w1, [sp, 28]
    adrp	  x0, .LC2
    add	    x0, x0, :lo12:.LC2
    add	    w1, w1, 1
    str	    w1, [sp, 28]
    bl	    printf
    ```
1.  add_sub.s
    ```asm
    // Add and subtract two integers.
            .arch armv8-a
    // Stack frame
            .equ    x, 16
            .equ    y, 20
            .equ    sum, 24
            .equ    diff, 28
            .equ    FRAME, 32
    // Constants 
            .section .rodata
    prompt:
            .string "Enter an integer: "
    input_format:
            .string "%i"
    result:
            .string "Sum = %i, Difference = %i\n"
    // Code
            .text
            .align  2
            .global main
            .type   main, %function
    main:
            stp     fp, lr, [sp, FRAME]!  // Create stack frame
            mov     fp, sp                // Set our frame pointer

            adr     x0, prompt            // prompt user
            bl      printf
            add     x1, sp, x             // address for input
            adr     x0, input_format      // scanf format string
            bl      scanf

            adr     x0, prompt            // prompt user
            bl      printf
            add     x1, sp, y             // address for input
            adr     x0, input_format      // scanf format string
            bl      scanf

            ldr     w0, [sp, x]           // get x
            ldr     w1, [sp, y]           // and y
            add     w3, w0, w1            // add them
            str     w3, [sp, sum]         // sum = x + y

            ldr     w0, [sp, x]           // get x
            ldr     w1, [sp, y]           // and y
            sub     w3, w0, w1            // subtract them
            str     w3, [sp, diff]        // diff = x - y

            ldr     w2, [sp, diff]        // sum
            ldr     w1, [sp, sum]         // difference
            adr     x0, result            // address of format string
            bl      printf

            mov     w0, wzr
            ldp     fp, lr, [sp], FRAME   // Delete stack frame
            ret
    ```
2.  add_sub.s
    ```asm
    // Add and subtract two integers.
            .arch armv8-a
    // Stack frame
            .equ    x, 16
            .equ    y, 20
            .equ    sum, 24
            .equ    diff, 28
            .equ    FRAME, 32
    // Constants 
            .section  .rodata
    prompt:
            .string "Enter an integer: "
    input_format:
            .string "%i"
    result:
            .string "Sum = %i, Difference = %i\n"
    // Code
            .text
            .align  2
            .global main
            .type   main, %function
    main:
            stp     fp, lr, [sp, FRAME]!  // Create stack frame
            mov     fp, sp                // Set our frame pointer

            adr     x0, prompt            // Prompt user
            bl      printf
            add     x1, sp, x             // Address for input
            adr     x0, input_format      // scanf format string
            bl      scanf

            adr     x0, prompt            // Prompt user
            bl      printf
            add     x1, sp, y             // Address for input
            adr     x0, input_format      // scanf format string
            bl      scanf

            add     x3, sp, diff          // Place for difference
            add     x2, sp, sum           // Place for sum
            ldr     x1, [sp, y]           // y
            ldr     x0, [sp, x]           // x
            bl      sum_diff              // Do arithmetic

            ldr     w2, [sp, diff]        // Difference
            ldr     w1, [sp, sum]         // Sum
            adr     x0, result            // Address of format string
            bl      printf

            mov     w0, wzr
            ldp     fp, lr, [sp], FRAME   // Delete stack frame
            ret
    ```