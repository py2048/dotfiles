# Parameters
n_cell = 2
# t bot and top
t_bot = 0.75
t_top = 0.75
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
diamond_surface = (
    sin(2*pi/L*x)*sin(2*pi/L*y)*sin(2*pi/L*z)
    + sin(2*pi/L*x)*cos(2*pi/L*y)*cos(2*pi/L*z)
    + cos(2*pi/L*x)*sin(2*pi/L*y)*cos(2*pi/L*z)
    + cos(2*pi/L*x)*cos(2*pi/L*y)*sin(2*pi/L*z)
)
t = t_bot + (t_top - t_bot) * z / L
diamond_surface1 = diamond_surface + t
diamond_surface2 = diamond_surface - t

output.PointData.append(diamond_surface1, "diamond_surface1")
output.PointData.append(diamond_surface2, "diamond_surface2")
