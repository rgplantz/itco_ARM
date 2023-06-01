// simple fraction class

#ifndef FRACTIONDEF_H
#define FRACTIONDEF_H
class fraction {
        int num {0};              // specify defaults
        int den {1};
    public:
        fraction() = default;     // tell compiler to generate default
        ~fraction() = default;    //     constructor and destructor
        void get();               // gets user's values
        void display();           // displays fraction
        void add(int theValue);   // adds theValue
};
#endif
