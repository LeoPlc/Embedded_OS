#include <iostream>
using namespace std; // Pour éviter d'écrire std:: partout



class Point 
{
    private: 
        int x;
        int y;

    public: 
        Point(int i = 0, int j = 0): x(i), y(j) {}
        int getX() const {return x;}
        int getY() const {return y;}
};

int main()
{
    Point t1(10,15);
    cout << "x =" << t1.getX() << ", ";
    cout << "y =" << t1.getY() << endl;

    return 0;
}

/*
Pour être sûr de prendre en charge C++11 dans ce programme, on peut écrire:

g++ -std=c++11 point.cpp -o point
*/