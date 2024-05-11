L = 5
lx = ly = lz = L

input0 = inputs[0]
points = input0.Points
points_data = input0.PointData

lx0 = points[:, 0].max() - points[:, 0].min()
ly0 = points[:, 1].max() - points[:, 1].min()
lz0 = points[:, 2].max() - points[:, 2].min()

# print(lx0, ly0, lz0)

points[:, 0] *= lx/lx0
points[:, 1] *= ly/ly0
points[:, 2] *= lz/lz0