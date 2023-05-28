// simple fraction class

#ifndef FRACTION_H
#define FRACTION_H
class fraction {
        int num {0};
        int den {1};
    public:
        fraction();                 // default constructor
        ~fraction();                // destructor
        void get();                 // gets user's values
        void display();             // displays fraction
        void add(int theValue);     // adds theValue
};
#endif
