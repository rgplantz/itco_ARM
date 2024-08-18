---
layout: default
title: Chapter 10
---

## Chapter 10

1. I'll let you do this on your own.
2. Return an integer
    * test_f.c
      ```c
      // Test f() function.

      #include <stdio.h>
      #include "f.h"

      int main(void)
      {
          int return_value;
          return_value = f();
          printf("f returned %i.\n", return_value);

          return 0;
      }
      ```
    * f.h
      ```c
      // Return 0.

      #ifndef F_H
      #define F_H
      int f(void);
      #endif
      ```
    * f.s
      ```asm
      // Minimum components of a C function, in assembly language
      // returns 0

              .arch   armv8-a
              .text
              .align  2
              .global f
              .type   f, %function
      f:
              mov     w0, wzr         // return 0;
              ret
      ```
3. Return three integers.
    * test_ints.c
      ```c
    // Test three functions that return ints.

    #include <stdio.h>
    #include "twelve.h"
    #include "thirty_four.h"
    #include "fifty_six.h"

    int main(void)
    {
        int return1, return2, return3;

        return1 = twelve();
        return2 = thirty_four();
        return3 = fifty_six();
        printf("The returned ints are: %i, %i, and %i.\n",
              return1, return2, return3);

        return 0;
    }
      ```
    * twelve.h
      ```c
    // Return 12.

    #ifndef TWELVE_H
    #define TWELVE_H
    int twelve(void);
    #endif
      ```
    * twelve.s
      ```asm
    // Return 12.

            .arch   armv8-a
            .text
            .align  2
            .global twelve
            .type   twelve, %function
    twelve:
            mov     w0, 12
            ret
      ```
    * thirty_four.h
      ```c
    // Return 34.

    #ifndef THIRTY_FOUR_H
    #define THIRTY_FOUR_H
    int thirty_four(void);
    #endif
      ```
    * thirty_four.s
      ```asm
    // Return 34.

            .arch   armv8-a
            .text
            .align  2
            .global thirty_four
            .type   thirty_four, %function
    thirty_four:
            mov     w0, 34
            ret
      ```
    * fifty_six.h
      ```c
    // Return 56.

    #ifndef FIFTY_SIX_H
    #define FIFTY_SIX_H
    int fifty_six(void);
    #endif
      ```
    * fifty_six.s
      ```asm
    // Return 56.

            .arch   armv8-a
            .text
            .align  2
            .global fifty_six
            .type   fifty_six, %function
    fifty_six:
            mov     w0, 56
            ret
      ```
4. Return three characters.
    * test_chars.c
      ```c
      // Tests three functions that return chars.

      #include <stdio.h>
      #include "exclaim.h"
      #include "upper_oh.h"
      #include "tilde.h"

      int main(void)
      {
          unsigned char return1, return2, return3;

          return1 = exclaim();
          return2 = upper_oh();
          return3 = tilde();
          printf("The returned chars are: %c, %c, and %c.\n",
                return1, return2, return3);

          return 0;
      }
      ```
    * f.h
      ```c
      // Returns 0

      #ifndef F_H
      #define F_H
      int f(void);
      #endif
      ```
    * f.s
      ```asm
      // Minimum components of a C function, in assembly language
      // returns 0

              .arch   armv8-a
              .text
              .align  2
              .global f
              .type   f, %function
      f:
              mov     w0, wzr         // return 0;
              ret
      ```
