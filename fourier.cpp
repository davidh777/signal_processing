#define _USE_MATH_DEFINES
#include <iostream>
#include <cmath>
#include <complex>
using namespace std;

int is_pow2(complex<double>* vector){
	int lenght;
	int i = 1;
	lenght = len(vector);
	while(i > lenght){
		i *= 2;
	}
	if (i==lenght)
		return 1;
	return 0;
}

complex<double>* even_index(complex<double>* vector,int N){
	if(vector == NULL)
		return NULL;
	if(N==1)
		return vector;
	complex<double>* even = new complex<double>[N/2];
	int i,j=0;
	for(i=0;i<N;i=i+2){
		even[j] = vector[i];
		j++; 
	}
	return even;
}

complex<double>* odd_index(complex<double>* vector,int N){
	if(vector == NULL)
		return NULL;
	if(N==1)
		return vector;
	complex<double>* odd = new complex<double>[N/2];
	int i,j=0;
	for(i=1;i<N;i=i+2){
		odd[j] = vector[i];
		j++; 
	}
	return odd;
}

complex<double>* dft(complex<double>* vector,int N){
	if(vector == NULL)
		return NULL;
	int freq,time;
	complex<double> b;
	complex<double> c=0;
	complex<double>* ret_val = new complex<double>[N];
	for(freq=0;freq<N;freq++){
		for(time=0;time<N;time++){
			b.imag(-1*time*freq*2*M_PI/N);
			c += vector[time]*exp(b);
		}
		ret_val[freq] = c;
		c = 0;
	}
	return (complex<double>*) ret_val;
}

complex<double>* fft(complex<double>* vector, int N){
	if(vector == NULL)
		return NULL;
	if(N==1)
		return vector;
	complex<double>* xe = even_index(vector,N);
	complex<double>* xo = odd_index(vector,N);
	complex<double>* ye = fft(xe,N/2);
	complex<double>* yo = fft(xo,N/2);
	complex<double>* y = new complex<double>[N];
	complex<double> j;
	for(int i=0;i<(N/2);i++){
		j.imag(i*2*M_PI/N);
		y[i] = ye[i]+exp(j)*yo[i];
		y[i+(N/2)] = ye[i]-exp(j)*yo[i];
	}
	return y;
}

void print(complex<double>* vector,int N){
	for(int i=0;i<N;i++){
		cout << vector[i] << ",";
	}
	cout << endl;
}

void print(double* vector,int N){
	for(int i=0;i<N;i++){
		cout << vector[i] << ",";
	}
	cout << endl;
}

complex<double>* fft2(complex<double>* vector, int N){
	complex<double>* vector1 = new complex<double>[N];
	complex<double>* temp = fft(vector,N);
	for(int i=0;i<N;i++){
		if (i == 0)
			continue;
		vector1[i] = temp[N-i];
	}
	vector1[0] = temp[0];
	return vector1;
}

double* abs(complex<double>* vector,int N){
	double* ptr = new double[N];
	int i;
	for(i=0;i<N;i++){
		ptr[i] = pow(pow(vector[i].real(),2)+pow(vector[i].imag(),2),.5);
	}
	return ptr;
}

/*

int main(){
	complex<double> test[16] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
	complex<double>* dft_test = dft(test,16);
	complex<double>* fft_test = fft2(test,16);
	cout << "This is the DFT:" << endl;
	print(dft_test,16);
	cout << "This is the FFT:" << endl;
	print(fft_test,16);
	cout << "This is the Magnitude" << endl;
	print(abs(fft2(test,16),16),16);
	return 0;
}

int len(complex<double>* vector){
	if(vector == NULL)
		return 0;
	return sizeof(vector)/sizeof(vector[0]);
}

complex<double>* idft(complex<double>* a=values,int N=lenght){
		int freq,time;
		complex<double> b;
		complex<double>* ret_val = (complex<double>*) malloc(N*sizeof(complex<double>));
		for(time=0;time<N;time++){
			for(freq=0;freq<N;freq++){
				b.imag(freq*time*2*M_PI/N);
				*(ret_val+freq) += a[freq]*exp(b);
			}
		}
		return (complex<double>*) ret_val;
}

complex<double>* phase(complex<double>* vector,int N){
	double abs_res = abs(vector);
	complex<double>* ptr = new complex<double>[N];
	for(int i=0; i<len(vect); i++){
		//ptr[i] = log( vector[i] / abs_res[i] );
	}
	return ptr;
}
}*/

