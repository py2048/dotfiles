using HDF5
using UnPack

@inline UnPack.pack!(x::HDF5.Attributes, ::Val{k}, val) where {k} = x[string(k)]=val
