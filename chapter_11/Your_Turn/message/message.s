// message.s
// Prints a message on screen
        .arch   armv8-a
// Stack frame
        .equ    theMsg,24
        .equ    nChars,76
        .equ    frameSize,80

// Constant data
        .section  .rodata
        .align    3
format:
        .string "There are %i characters in\n%s"

        .text
        .align  2
// Code 
        .globl  main
        .type   main, @function
main:
        stp     fp, lr, [sp, -frameSize]! // create our frame
        mov     fp, sp                // establish our frame pointer

        add     x0, sp, theMsg        // place to store message
        bl      theMessage            // get the message
        add     x2, sp, theMsg        // addres of the message
        mov     w1, w0                // number of chars
        adrp    x0, format            // page address
        add     x0, x0, :lo12:format  // relative address in page
        bl      printf                // show nChars

        mov     w0, 0                 // return 0
        ldp     fp, lr, [sp], frameSize   // undo our frame
        ret                           // back to calling function
