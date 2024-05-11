# Parameters
n_cell = 1
#
from numpy import pi
input0 = inputs[0]
# print(dir(input0))

points = input0.Points
points_data = input0.PointData
x = points[:, 0]
y = points[:, 1]
z = points[:, 2]
Lz = z.max()
L = Lz / n_cell
x = 2*pi/L*x
y = 2*pi/L*y
z = 2*pi/L*z

min_surfaces = {
	"Primitive": cos(x) + cos(y) + cos(z), # Schwarz
	"Gyroid": sin(x)*cos(y) + sin(y)*cos(z) + sin(z)*cos(x), # Schoen
	"IWP": 2*(cos(x)*cos(y) + cos(y)*cos(z) + cos(z)*cos(x)) - (cos(2*x) + cos(2*y) + cos(2*z)), # Schoen
    "Neovius": 3*(cos(x) + cos(y) + cos(z)) + 4*cos(x)*cos(y)*cos(z),
    "S": cos(2*x)*sin(y)*cos(z) + cos(x)*cos(2*y)*sin(z) + sin(x)*cos(y)*cos(2*z), # Fischer-Koch
    "FRD": 4*cos(x)*cos(y)*cos(z) - (cos(2*x)*cos(2*y) + cos(2*y)*cos(2*z) + cos(2*z)*cos(2*x)), # Schoen
    "PMY": 2*cos(x)*cos(y)*cos(z) + sin(2*x)*sin(y) + sin(x)*sin(2*z) + sin(2*y)*sin(z),
}

surface = min_surfaces["PMY"]

output.PointData.append(surface, "surface")