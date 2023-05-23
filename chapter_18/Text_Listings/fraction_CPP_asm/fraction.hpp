// simple fraction class

#ifndef FRACTION_HPP
#define FRACTION_HPP
// Uses the following C functions
extern "C" {
    int writeStr(char *);
    int readStr(char *, int);
    int getInt(void);
    int putInt(int);
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
