/* records.c
 * Allocates two records, assigns a value to each field
 * in each struct, and displays the contents.
 */

#include "aRecord.h"
#include "loadRecord.h"
#include "displayRecord.h"

int main(void)
{
  struct aTag x;
  struct aTag y;

  loadRecord(&x, 'a', 123, 'b');
  loadRecord(&y, '1', 456, '2');
  
  displayRecord(x);
  displayRecord(y);
  
  return 0;
}


