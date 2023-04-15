// Allocates an int array, stores 2 x element number
// in each element and prints array contents.

#include "twiceIndex.h"
#include "displayArray.h"
#define N 10

int main(void) {
    int intArray[N];
    
    twiceIndex(intArray, N);
    displayArray(intArray, N);
    
    return 0;
}
