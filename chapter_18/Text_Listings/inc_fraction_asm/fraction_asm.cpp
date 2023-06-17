// Simple fraction class

#include "fraction_def.h"
// Uses the following C functions
extern "C" {
    #include "writeStr.h"
    #include "writeChar.h"
    #include "getInt.h"
    #include "putInt.h"
}
// Use char arrays because writeStr is C function.
char num_msg[] = "Enter numerator: ";
char den_msg[] = "Enter denominator: ";

void Fraction::get() {
    writeStr(num_msg);   
    numerator = getInt();
   
    writeStr(den_msg);
    denominator = getInt();
}

void Fraction::display() {
    putInt(numerator);
    writeChar('/');
    putInt(denominator);
    writeChar('\n');
}

void Fraction::add_integer(int x) {
    numerator += x * denominator;
}
