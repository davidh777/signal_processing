
#define _USE_MATH_DEFINES
#include <iostream>
#include <cmath>
#include <complex>

using namespace std;
class Signal(){

	complex<double>* values;
	int lenght;

	public:

	complex<double>* dft(complex<double>* a=values,int N=lenght){
		int freq,time;
		complex<double> b;
		complex<double>* ret_val = (complex<double>*) malloc(N*sizeof(complex<double>));
		for(freq=0;freq<N;freq++){
			for(time=0;time<N;time++){
				b.imag(freq*time*2*M_PI/N);
				*(ret_val+freq) +=a[time]*exp(-b);
			}
		}
		return (complex<double>*) ret_val;
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

	complex<double>* fft(complex<double>* ptr=values, int N=lenght){
		if(is_power2(lenght)
			return 0;
		if(lenght==1)
			return values;
		complex<double> b;
		b.imag(2*M_PI/N);
		complex<double> xe[N/2] = ptr[0::2];
		complex<double> xo[N/2] = ptr[1::2];
		complex<double> ye[N/2] = fft(xe,N/2);
		complex<double> yo[N/2] = fft(yo,N/2);
		complex<double> y[N];
		int i;
		for(i=0;i<N/2;i++){
			y[i] = ye[i]+exp(-b*i)*yo[i];
			y[i+N/2] = ye[i]-exp(-b*i)*yo[i];
		}
		return y;
	}
	
	Signal(complex<double>* ptr, int l){values=ptr;lenght=l;} 
		
}
int main(){
	double a[10] = {1,2,3,4,5,6,7,8,9,10};
	complex<double>* b = dft(a,10);
	for(int i=0;i<10;i++){
		cout << *(b+i) << ' ';}
	return 0;
}
