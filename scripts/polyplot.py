#!/Users/minhquandoan/opt/anaconda3/bin/python
import sys
import matplotlib.pyplot as plt
import argparse
sys.path.insert(
    0, '/Users/minhquandoan/ProgrammingProjects/Python Tutorial/Tutorial/Python Oject-Oriented Programming')
from Special_Methods import *

Graph.config(dpi=160, width_grid=0.75,
             color_grid='#e6e6e6', color_axes='#000000')
Graph.set_elements(401)

parser = argparse.ArgumentParser()
parser.add_argument('func', help="Plot function of x")
parser.add_argument('-d', '--derivatives',
                    help='Plot derivatives', action='store_true')
parser.add_argument('-t', '--tangent', help='Plot tangent line', type=float)
parser.add_argument('-e', '--elements', help='Set elements', type=int)
arg = parser.parse_args()

if arg.elements:
    Graph.set_elements(arg.elements)
d = Graph.func(arg.func)
if arg.derivatives:
    d.d_dx()
if (arg.tangent and arg.tangent != '') or arg.tangent == 0:
    d.tangent(arg.tangent)


plt.show()
