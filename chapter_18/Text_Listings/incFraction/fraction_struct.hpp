// simple fraction class

#ifndef FRACTION_HPP
#define FRACTION_HPP
struct fraction {
  private:
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
