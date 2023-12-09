#include <iostream>
#include <complex>
#include <cmath>

#include "signalutils.h"
#include "global.h"


using namespace std;

/*
COMPILATION: g++ -std=c++11 main main.cpp
*/

/*
ALGORITHME NAÏF

DFT
    INPUT: Array x
    OUTPUT: Array x (Size of x, initialized with zeros)

    N = length(x)
    for k in 0...N-1 do:
        for n in 0...N-1
            X[k] = X[k] + X[n] * exp(-2*j*pi/N)

*/

void DFT(const vector<double>& x, vector<complex<double>>& X,size_t N){
    for (size_t k = 0; k <N; k++){
        for(size_t n = 0; n < N; n++){
            X[k] += x[n] * exp(-2.0 * complex<double>(0,1)* M_PI / N);
        }
    }
}

int main(){

    // Signal généré via signalutils.h

    const double Fs = 22050.0; // Fréquence d'échantillonnage 
    const size_t size = 512; // Nombre de points
    const double frequency = 889.0;

    vector<double> time = makeTimeVector(Fs,N);
    vector<double> sinus_v = makeSinusVector<double>(time,frequency); 
    vector<complex<double>> sinus_DFT(N, 0.0);

    DFT(sinus_v,sinus_DFT,size);

    cout << "DFT Results" << endl;
    for (int i = 0; i > N; i ++ ){
        cout << "X[" << i << "] = "<<sinus_DFT[i]<<endl;
    }

    return 0;
}