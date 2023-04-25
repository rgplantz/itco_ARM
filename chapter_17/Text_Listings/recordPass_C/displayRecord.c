// Display contents of a record.

#include <stdio.h>
#include "displayRecord.h"

void displayRecord(struct aTag aRecord) {
    printf("%c, %c, %c, %i\n", aRecord.aChar,
    aRecord.oneInt, aRecord.bChar, aRecord.twoInt, aRecord.cChar);
}
