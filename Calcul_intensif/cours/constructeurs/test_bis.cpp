#include <iostream>
using namespace std; // Pour éviter d'écrire std:: partout

class Test {
    private:
        int &t;
    public: 
        Test(int &t):t(t){}
        int getT(){return t;}
};


int main()
{
    int x = 20;
    Test t1(x);
    cout << t1.getT()<<endl;
    x = 30;
    cout << t1.getT()<<endl;

    return 0;
}

/*
Pour être sûr de prendre en charge C++11 dans ce programme, on peut écrire:

g++ -std=c++11 point.cpp -o point
*/