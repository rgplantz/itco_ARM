// simple fraction class

#ifndef FRACTION_HPP
#define FRACTION_HPP
struct Fraction {
public:
    Fraction();             // default constructor
    ~Fraction();            // destructor
    void get();             // gets user's values
    void display();         // displays fraction
    void add(int integer);  // adds integer to fraction
private:
    int num;                // numerator
    int den;                // denominator
};
#endif
