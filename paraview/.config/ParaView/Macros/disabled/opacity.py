from paraview.simple import FindSource, GetSources, GetActiveSource, GetDisplayProperties

figure = FindSource([k for (k, v) in GetSources().items() if v == GetActiveSource()][0][0])

rep = GetDisplayProperties(figure)

rep.Opacity = 0.5 if rep.Opacity == 1.0 else 1.0
