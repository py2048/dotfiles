#!/usr/bin/env python3

import matplotlib.pyplot as plt
import matplotlib.animation as animation
import numpy as np
import glob
import argparse

parser = argparse.ArgumentParser()
parser.add_argument(
    "files", type=str, nargs="*", default=sorted(glob.glob("stress-strain*.txt"))
)
parser.add_argument("-comp", dest="sign", action="store_const", const=-1, default=1)
parser.add_argument(
    "-update", "-watch", dest="update", action="store_const", const=True, default=False
)
parser.add_argument("-xlim", type=float, nargs=2, default=None)
parser.add_argument("-ylim", type=float, nargs=2, default=None)

args = parser.parse_args()

fig = plt.figure(dpi=150)


def animate(t):
    plt.cla()
    if args.xlim is not None:
        plt.xlim(*args.xlim)
    if args.ylim is not None:
        plt.ylim(*args.ylim)
    for i, dat_file in enumerate(args.files):
        data = np.loadtxt(dat_file)
        strain = args.sign * data[:, 0]
        stress = args.sign * data[:, 1]
        plt.plot(strain, stress, label=dat_file)
        plt.legend()


ani = animation.FuncAnimation(
    plt.gcf(), animate, interval=1000, frames=1, repeat=args.update
)

plt.tight_layout()
plt.show()
