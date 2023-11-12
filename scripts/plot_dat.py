#!/usr/bin/env python3

import matplotlib.pyplot as plt
import numpy as np
import sys

plt.figure(dpi=150)
for i, dat_file in enumerate(sys.argv[1:]):
    dat = np.loadtxt(dat_file)
    plt.plot(*dat.T, label=f'{i}')

plt.legend()
plt.show()
