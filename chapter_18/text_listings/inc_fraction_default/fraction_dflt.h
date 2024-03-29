// simple fraction class

#ifndef FRACTION_DFLT_H
#define FRACTION_DFLT_H
class Fraction {
public:
    Fraction() = default;     // tell compiler to generate default
    ~Fraction() = default;    //     constructor and destructor
    void get();               // gets user's values
    void display();           // displays fraction
    void add_integer(int x);  // adds x to fraction
private:
    int numerator {}; 
    int denominator {1}; 
};
#endif
