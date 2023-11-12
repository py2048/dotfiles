from paraview.simple import GetActiveCamera, ResetCameraToDirection

ResetCameraToDirection([0, 0, 0], [0, -1, 0], up=[-1, 0, 0])
GetActiveCamera().Roll(90)
