// Get a decimal integer from the user and store it as an unsigned int.

#include <stdio.h>
#include "write_str.h"
#include "read_str.h"
#include "dec_to_uint.h"
#define MAX 11
#define ARRAY_SZ MAX+1

int main(void) {
    char the_string[ARRAY_SZ];
    unsigned int the_int;
    
    write_str("Enter an unsigned integer: ");
    read_str(the_string, MAX);

    dec_to_uint(&the_int, the_string);
    printf(%u is stored as 0x%x\n", the_int, the_int);
    
    return 0;
}
