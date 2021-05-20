#include <cmath>
#include <complex>
int is_pow2(complex<double>* vector);
complex<double>* even_index(complex<double>* vector,int N);
complex<double>* odd_index(complex<double>* vector,int N);
complex<double>* dft(complex<double>* vector,int N);
complex<double>* fft(complex<double>* vector, int N);
void print(complex<double>* vector,int N);
void print(double* vector,int N);
complex<double>* fft2(complex<double>* vector, int N);
double* abs(complex<double>* vector,int N);