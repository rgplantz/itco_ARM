// simple fraction class

#ifndef FRACTION_H
#define FRACTION_H
class Fraction {
public:
    fraction();             // default constructor
    ~fraction();            // destructor
    void get();             // gets user's values
    void display();         // displays fraction
    void add(int integer);  // adds integer to fraction
private:
    int numerator;               
    int denominator;
};
#endif
