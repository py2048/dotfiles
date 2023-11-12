from paraview.simple import FindSource, GetSources, GetActiveSource, GetDisplayProperties

figure = FindSource([k for (k, v) in GetSources().items() if v == GetActiveSource()][0][0])

rep = GetDisplayProperties(figure)

rep.DiffuseColor = [0, 85 / 255, 127 / 255]
