// simple fraction class

#ifndef FRACTIONASM_HPP
#define FRACTIONASM_HPP
// Uses the following C functions
extern "C" {
    #include "writeStr.h"
    #include "writeChar.h"
    #include "getInt.h"
    #include "putInt.h"
}

class fraction {
        int num;
        int den;
    public:
        fraction();                 // default constructor
        ~fraction();                // destructor
        void get();                 // gets user's values
        void display();             // displays fraction
        void add(int theValue);     // adds theValue
};
#endif
