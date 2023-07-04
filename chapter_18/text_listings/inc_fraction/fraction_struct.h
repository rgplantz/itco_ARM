// simple fraction class

#ifndef FRACTION_H
#define FRACTION_H
struct Fraction {
public:
    Fraction();               // default constructor
    ~Fraction();              // destructor
    void get();               // gets user's values
    void display();           // displays fraction
    void add_integer(int x);  // adds x to fraction
private:
    int numerator; 
    int denominator; 
};
#endif
