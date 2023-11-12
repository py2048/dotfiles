from paraview.simple import (
    GetColorTransferFunction, Show, Glyph, GetActiveCamera, FindSource, GetSources, GetActiveSource
)

camera = GetActiveCamera()

# Set colormap of 'angle' to hsv
colorMap = GetColorTransferFunction('angle')
colorMap.RescaleTransferFunction(0.0, 360.0)
colorMap.ApplyPreset('hsv')

figure = FindSource([k for (k, v) in GetSources().items() if v == GetActiveSource()][0][0])
# Glyph(figure, ScaleArray='p', GlyphMode='All Points')
Glyph(figure, ScaleArray='p', GlyphMode='Every Nth Point', Stride=1)
# Glyph(figure, ScaleArray='p', GlyphMode='Every Nth Point', Stride=2, ScaleFactor=1.5)
Show()
