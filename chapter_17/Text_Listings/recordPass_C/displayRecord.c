// Display contents of a record.

#include <stdio.h>
#include "displayRecord.h"

void displayRecord(struct aTag aRecord) {
    printf("%c, %c, %c, %i\n", aRecord.aChar,
    aRecord.bChar, aRecord.cChar, aRecord.anInt);
}
