input0 = inputs[0]
# print(dir(input0))
points = input0.Points
points_data = input0.PointData
x = points[:, 0]
y = points[:, 1]
z = points[:, 2]
# print(points)

dist_center = sqrt(x**2 + y**2 + z **2)

output.PointData.append(dist_center, "distance_to_center")