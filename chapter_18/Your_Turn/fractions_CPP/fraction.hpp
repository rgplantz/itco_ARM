// fraction.hpp
// simple fraction class

#ifndef FRACTION_HPP
#define FRACTION_HPP
class fraction {
        int num {0};
        int den {1};
    public:
        fraction();                 // default constructor
        fraction(int x, int y);     // another constructor
        ~fraction();                // destructor
        void get();                 // gets user's values
        void display();             // displays fraction
        void add(int theValue);     // adds theValue
};
#endif
