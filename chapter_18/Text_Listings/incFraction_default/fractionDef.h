// simple fraction class

#ifndef FRACTIONDEF_H
#define FRACTIONDEF_H
class fraction {
public:
    fraction() = default;     // tell compiler to generate default
    ~fraction() = default;    //     constructor and destructor
    void get();               // gets user's values
    void display();           // displays fraction
    void add_integer(int x);  // adds x to fraction
private:
    int numerator; 
    int denominator; 
};
#endif
