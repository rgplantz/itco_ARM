// Simple fraction class

#include "fraction.hpp"
// Uses the following C functions
extern "C" {
    #include "writeStr.h"
    #include "writeChar.h"
    #include "getInt.h"
    #include "putInt.h"
}
// Use char arrays because writeStr is C function.
char numMsg[] = "Enter numerator: ";
char denMsg[] = "Enter denominator: ";

void fraction::get() {
    writeStr(numMsg);   
    num = getInt();
   
    writeStr(denMsg);
    den = getInt();
}

void fraction::display() {
    putInt(num);
    writeChar('/');
    putInt(den);
    writeChar('\n');
}

void fraction::add(int theValue) {
    num += theValue * den;
}
