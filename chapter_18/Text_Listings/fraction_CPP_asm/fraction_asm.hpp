// simple fraction class

#ifndef FRACTION_ASM_HPP
#define FRACTION_ASM_HPP
extern "C" {
    #include "writeStr.h"
    #include "writeChar.h"
    #include "readStr.h"
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
