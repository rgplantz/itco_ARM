// simple fraction class

#ifndef FRACTION_H
#define FRACTION_H
class fraction {
        int num;
        int den;
    public:
        void get();                 // gets user's values
        void display();             // displays fraction
        void add(int theValue);     // adds theValue
};
#endif
