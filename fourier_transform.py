import numpy as np
import matplotlib.pyplot as plt
t = np.linspace(0,10,1000)
w = np.linspace(-50,50,10000)
def rect(w,t):
    return np.sum(np.cos(
