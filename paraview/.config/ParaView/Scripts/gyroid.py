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
gyroid_surface = sin(2*pi/L*x)*cos(2*pi/L*y) + sin(2*pi/L*y)*cos(2*pi/L*z) + sin(2*pi/L*z)*cos(2*pi/L*x)

output.PointData.append(gyroid_surface, "gyroid_surface")