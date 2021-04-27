class Signal(){
	complex<double>* values;
	int lenght;
	public:
	complex<double>* dft(complex<double>*,int);
	complex<double>* fft(complex<double>*,int);
	
	complex<double>* idft(complex<double>*,int);
	complex<double>* ifft(complex<double>*,int);

	bool is_power_of2(int);
}

