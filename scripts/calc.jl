#!/usr/bin/env -S julia -i
using Unitful
using PhysicalConstants.CODATA2018: c_0, N_A, k_B, R, G, h, ħ, e, m_e, m_p, atm, ε_0, μ_0

const u_dim_type_to_SI_unit = Dict(
    :Amount => u"mol",
    :Current => u"A",
    :Length => u"m",
    :Luminosity => u"cd",
    :Mass => u"kg",
    :Temperature => u"K",
    :Time => u"s"

)

function SI(x::Union{Quantity, PhysicalConstants.PhysicalConstant})
    u_dims = typeof(dimension(x)).parameters[1]
    si_unit = Unitful.NoUnits
    for u_dim in u_dims
        u_dim_type = typeof(u_dim).parameters[1]
        si_unit *= u_dim_type_to_SI_unit[u_dim_type]^u_dim.power
    end
    return uconvert(si_unit, x)
end

function to(u::Unitful.Units)
    return x -> uconvert(u, x)
end
