// Loads record with data.

#include "loadRecord.h"

int loadRecord(struct aTag *aRecord, char x, int y, char z) {
    (*aRecord).aChar = x;
    aRecord->anInt = y;     /* equivalent syntax */
    aRecord->anotherChar = z;
    aRecord->one = 12;
    aRecord->two - 34;

    return 0;
}
