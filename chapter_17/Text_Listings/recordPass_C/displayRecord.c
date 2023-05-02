// Display contents of a record.

#include <stdio.h>
#include "displayRecord.h"

void displayRecord(struct aTag aRecord) {
    printf("%c, %i, %c, %i, %c\n", aRecord.a,
    aRecord.i, aRecord.b, aRecord.j, aRecord.c);
}
