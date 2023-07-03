#!/home/dquan/.mambaforge/envs/main/bin/python

import sys
# import numpy as np
from numpy import *
import pyqtgraph as pg

pg.setConfigOptions(antialias=True)
pg.setConfigOptions(useOpenGL=True)
pg.setConfigOptions(enableExperimental=True)

cmds = sys.argv[1].split('&')
func = cmds[0].replace('^', '**')

if len(cmds) > 1:
    xmin, xmax = cmds[1].strip().split(' ')
    xmin = float(xmin)
    xmax = float(xmax)
else:
    xmin = -10
    xmax = 10

x = linspace(xmin, xmax, 501)
y = eval(func)

win = pg.plot(
    x,
    y,
    pen=pg.mkPen('#4B6492', width=3),
)

win.showGrid(x=True, y=True)
win.setBackground('#2D2B2C')
win.resize(1000, 600)

pg.QtGui.QGuiApplication.exec()
