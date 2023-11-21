#include <iostream>
#include <cmath>
#include <cstddef>
#include <complex>


constexpr size_t N = 512;
typedef std::complex<double> Complex;

template<typename T>
std::ostream &operator<<(std::ostream &s, const std::vector<T> &v);

std::vector<double> makeTimeVector(double Fs, std::size_t size);

std::vector<double> makeFrequencyVector(double Fs, std::size_t size);

template<typename T>
std::vector<T> makeSinusVector(const std::vector<double> &time, double f);

template<typename T>
std::vector<T> makeAMSinusVector(const std::vector<double> &time, double fp, double fm);

constexpr std::array<Complex, N> rect_window();
constexpr std::array<Complex, N> hann_window();
constexpr std::array<Complex, N> hamming_window();

constexpr std::array<Complex, N> blackmann_window();

std::vector<double> generate_random_double_vector(double inf, double sup, std::size_t size);

std::vector<double> toReal(const std::vector<Complex> &x);

std::vector<double> toImag(const std::vector<Complex> &x);

std::vector<Complex> toComplex(const std::vector<double> &x);

template<typename T>
std::tuple<bool, int, double> epsilon_vector_compare(std::string title, std::vector<T> x, std::vector<T> y);

  template<typename F,
          typename ... Args>
  void peakDetection(std::string title, double Fs, std::vector<Complex> &signal, F &&fun, Args &&... args);
