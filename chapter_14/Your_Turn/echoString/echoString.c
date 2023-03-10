// Prompts user to enter text and echos it.

#include "writeStr.h"
#include "readStr.h"
#define MAX 5
#define BUFFSZ MAX+1   // make room for NUL

int main(void) {
    char text[BUFFSZ];

    writeStr("Enter some text: ");
    readStr(text, MAX);
    writeStr("You entered: ");
    writeStr(text);
    writeStr("\n");
  
    return 0;
}
