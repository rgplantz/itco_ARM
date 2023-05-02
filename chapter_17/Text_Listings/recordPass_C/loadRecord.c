// Loads record with data.

#include "loadRecord.h"

void loadRecord(struct aTag *aRecord, char v, int w, char x, int y, char z) {
    (*aRecord).a = v;
    aRecord->b = x;     /* equivalent syntax */
    aRecord->c = z;
    aRecord->i = w;
    aRecord->j = y;
}
