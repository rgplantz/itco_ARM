// Display contents of a record.

#include <stdio.h>
#include "displayRecord.h"

void displayRecord(struct aTag aRecord) {
    printf("%c, %i, %c, %i, %c\n", aRecord.aChar,
    aRecord.oneInt, aRecord.bChar, aRecord.twoInt, aRecord.cChar);
}
