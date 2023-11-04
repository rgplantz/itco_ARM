// Display contents of a record.

#include <stdio.h>
#include "our_record.h"
#include "display_record.h"

void display_record(struct chars_and_ints a_record) {
    printf("%c, %i, %c, %i, %c\n", a_record.a, a_record.i, a_record.b,
            a_record.j, a_record.c);
}
