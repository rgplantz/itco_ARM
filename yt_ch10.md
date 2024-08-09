---
layout: default
title: Chapter 10
---

## Chapter 10

1. I'll let you do this on your own.
2. Return an integer
    * test_f.c
      ```c
      // Tests f() function.

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
3. Return an integer
    * test_f.c
      ```c
      // Tests f() function.

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
4. Return an integer
    * test_f.c
      ```c
      // Tests f() function.

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
