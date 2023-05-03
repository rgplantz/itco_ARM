// Prompts user to enter text and echos it.

#inclues "writeChar.h"
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
    writeChar('\n');
  
    return 0;
}
