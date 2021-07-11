#!/usr/bin/env python
import matplotlib.pyplot as plt
import numpy as np
x = np.linspace(-10, 10, 201)
plt.plot(x, np.sin(x))
plt.show()
