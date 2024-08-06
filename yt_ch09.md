---
layout: default
title: Chapter 9
---

## Chapter 9

1. The compiler gives an error message:

    ```
    gcc -g -Wall -march=native   -c -o inches_to_feet.o inches_to_feet.c
    inches_to_feet.c: In function ‘main’:
    inches_to_feet.c:13:5: error: address of register variable ‘total_inches’ requested
      13 |     ptr = &total_inches;
          |     ^~~
    make: *** [<builtin>: inches_to_feet.o] Error 1
    ```

    We cannot take the address of a register variable. However, we can ask the compiler to use a register for the `ptr` variable:

    ```c
    register int feet;
    register int inches;
    int total_inches;
    register int *ptr;
    ```

2. Endianess.

    ```c
    // Determines endianess. If endianess cannot be determined
    // from input value, defaults to "big endian"

    #include <stdio.h>

    int main(void)
    {
        unsigned char *ptr;
        int x, i, bigEndian;
      
        ptr = (unsigned char *)&x;
      
        printf("Enter a non-zero integer: ");
        scanf("%i", &x);
      
        printf("You entered %#010x and it is stored\n", x);
        for (i = 0; i < 4; i++)
            printf("   %p: %02x\n", ptr + i, *(ptr + i));

        bigEndian = (*ptr == (unsigned char)(0xff & (x >> 24))) &&
                (*(ptr + 1) == (unsigned char)(0xff & (x >> 16))) &&
                (*(ptr + 2) == (unsigned char)(0xff & (x >> 8))) &&
                (*(ptr + 3) == (unsigned char)(0xff & x));
        if (bigEndian)
            printf("which is big endian.\n");
        else
            printf("which is little endian.\n");

        return 0;
    }
    ```

3. Endianness is property of CPU.

    ```c
    // Store user int in memory then copies to register var.
    // Use gdb to observe endianness.

    #include <stdio.h>

    int main(void)
    {
        int x;
        register int y;
      
        printf("Enter an integer: ");
        scanf("%i", &x);
      
        y = x;
        printf("You entered %i\n", y);

        return 0;
    }
    ```

    Running this under `gdb` I got:

    ```
    (gdb) b 16
    Breakpoint 1 at 0x804: file endian_reg.c, line 16.
    (gdb) r
    Starting program: /home/bob/chapter_09/your_turn/endianess_CPU/endian_reg 
    [Thread debugging using libthread_db enabled]
    Using host libthread_db library "/lib/aarch64-linux-gnu/libthread_db.so.1".
    Enter an integer: 12345

    Breakpoint 1, main () at endian_reg.c:16
    16          printf("You entered %i\n", y);
    (gdb) print &x
    $1 = (int *) 0x7fffffffed7c
    (gdb) print &y
    Address requested for identifier "y" which is in register $x19
    (gdb) i r x19
    x19            0x3039              12345
    (gdb) x/4xb 0x7fffffffed7c
    0x7fffffffed7c: 0x39    0x30    0x00    0x00
    (gdb)
    ```

    This shows that the `int` is stored little endian in memory, but the individual bytes are loaded into the register (`x19`) in the correct order.
