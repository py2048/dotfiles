from paraview.simple import GetColorTransferFunction, GetActiveSource

# Set colormap of 'angle' to hsv
colorMap = GetColorTransferFunction('angle')
colorMap.RescaleTransferFunction(0.0, 360.0)
colorMap.ApplyPreset('hsv')


# Get source
i, j = GetActiveSource().GetPointDataInformation().GetArray(4).GetRange()
if abs(i) > abs(j):
    r = abs(i)
else:
    r = abs(j)
if r < 20:
    r = 90

# Set colormap of 'v_angle' to hsv
colorMap = GetColorTransferFunction('v_angle')
# colorMap.RescaleTransferFunction(-90, 90)
colorMap.RescaleTransferFunction(-r, r)
colorMap.ApplyPreset('Cold to Warm')
