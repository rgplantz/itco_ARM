// simple fraction class

#ifndef FRACTIONNC_H
#define FRACTIONNC_H
class fraction {
        int num {0};
        int den {1};
    public:
        fraction() = default;     // use default values
        void get();               // gets user's values
        void display();           // displays fraction
        void add(int theValue);   // adds theValue
};
#endif
