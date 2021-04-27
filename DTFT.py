import numpy as np
import matplotlib.pyplot as plt

def dft(a):  
    import numpy as np
    a = np.array(a)
    n = np.arange(0,len(a))
    constant = 2*np.pi/len(a)
    dft_a = []
    j = complex(0,1)
    for freq in range(len(a)):
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
        dft_a += [(1/len(a))*sum(a[n]*np.exp(j*constant*n*freq))]
    return dft_a
