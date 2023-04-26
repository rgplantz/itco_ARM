// Loads record with data.

#include "loadRecord.h"

int loadRecord(struct aTag *aRecord, char v, int w, char x, int y, char z) {
    (*aRecord).aChar = v;
    aRecord->bChar = x;     /* equivalent syntax */
    aRecord->cChar = z;
    aRecord->oneInt = w;
    aRecord->twoInt = y;

    return 0;
}
