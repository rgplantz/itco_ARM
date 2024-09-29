// Allocate an int array, store 2 x element number
// in each element and print array contents.

#include "twice_index.h"
#include "display_array.h"
#define N 10

int main(void) {
    int int_array[N];
    
    twice_index(int_array, N);
    display_array(int_array, N);
    
    return 0;
}
