// Loads record with data.

#include "loadRecord.h"

int loadRecord(struct aTag *aRecord, char w, char x, char y, int z) {
    (*aRecord).aChar = w;
    aRecord->bChar = x;     /* equivalent syntax */
    aRecord->cChar = y;
    aRecord->anInt = z;

    return 0;
}
