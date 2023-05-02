// Loads record with data.

#include "loadRecord.h"

int loadRecord(struct aTag *aRecord, char v, int w, char x, int y, char z) {
    (*aRecord).a = v;
    aRecord->b = x;     /* equivalent syntax */
    aRecord->c = z;
    aRecord->i = w;
    aRecord->j = y;

    return 0;
}
