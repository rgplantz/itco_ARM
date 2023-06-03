// simple fraction class

#ifndef FRACTION_H
#define FRACTION_H
class Fraction {
public:
    Fraction();             // default constructor
    ~Fraction();            // destructor
    void get();             // gets user's values
    void display();         // displays fraction
    void add(int integer);  // adds integer to fraction
private:
    int numerator;               
    int denominator;
};
#endif
