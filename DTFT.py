import numpy as np
import matplotlib.pyplot as plt

def dft(a):  
    import numpy as np
    a = np.array(a)
    n = np.arange(0,len(a))
    constant = 2*np.pi/len(a)
    dft_a = []
    ft=0
    j = complex(0,1)
    for freq in range(len(a)):
        for n in range(len(a)):
            ft+=a[n]*np.exp(-j*constant*n*freq)
        dft_a+=[ft]
        ft=0
    return dft_a

def dtft(a,freqs):  
    import numpy as np
    a = np.array(a)
    n = np.arange(0,len(a))
    constant = 2*np.pi/len(a)
    dft_a = []
    j = complex(0,1)
    for freq in freqs:
        dft_a += [sum(a[n]*np.exp(-j*constant*n*freq))]
    return dft_a

def inv_dft(a):
    import numpy as np
    a = np.array(a)
    n = np.arange(0,len(a))
    constant = 2*np.pi/len(a)
    dft_a = []
    j = complex(0,1)
    for freq in range(len(a)):
        dft_a += [int(abs((1/len(a))*sum(a[n]*np.exp(j*constant*n*freq))))]
    return dft_a

def fft(a):
    import numpy as np
    n = len(a)
    if n==1:
        return a
    w = np.exp(2*np.pi*complex(0,1)/n)
    pe = a[0::2]
    po = a[1::2]
    ye,yo = fft(pe),fft(po)
    y = np.zeros(n)
    y = y.astype('cdouble')
    for j in range(int(n/2)):
        y[j]=complex(ye[j]+(w**j)*yo[j])
        y[j+int(n/2)]=complex(ye[j]-(w**j)*yo[j])
    return y


def fft2(a):
    import numpy as np
    y = fft(a)
    y = y.tolist()
    b = [y[0]]
    y = y[::-1]
    y.pop()
    b += y
    return np.array(b)

import time
start = time.time()
fft([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16])
end = time.time()
print(f"Python fft time={end - start}")
start1 = time.time()
dft([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16])
end1 = time.time()
print(f"Python dft time={end1 - start1}")
start2 = time.time()
np.fft.fft([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16])
end2 = time.time()
print(f"Numpy fft time={end2 - start2}")
avg=0
for i in range(1000):
    start = time.time()
    fft([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16])
    end = time.time()
    avg+=end-start
print(avg/1000)
