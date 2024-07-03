// Get a hex number from the user and store it as int.

#include <stdio.h>
#include "write_str.h"
#include "read_str.h"
#include "hex_to_int.h"

#define MAX 8
#define ARRAYSZ MAX+1

int main() {
    char the_string[ARRAYSZ];
    int the_int;

    write_str("Enter up to 8 hex characters: ");
    read_str(the_string, MAX);

    hex_to_int(&the_int, the_string);
    printf("0x%x = %i\n", the_int, the_int);
    return 0;
}
