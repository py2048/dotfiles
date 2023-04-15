#!/usr/bin/env julia
using PackageCompiler
include(ENV["HOME"] * "/.local/lib/julia/parallel.jl")

function compile(ext)
    @parallel begin
        # Base
        create_sysimage(["Plots", "OhMyREPL"]; sysimage_path=ENV["HOME"] * "/.local/lib/julia/base." * ext, precompile_statements_file="ohmyrepl_precompile.jl")
        # Main
        create_sysimage(
            [
                "Plots",
                "DataFrames", "CSV",
                "DifferentialEquations", "MethodOfLines",
                "ModelingToolkit", "Symbolics",
                "FiniteDifferences", "ForwardDiff",
            ];
            sysimage_path=ENV["HOME"] * "/.local/lib/julia/main." * ext)
        # Makie
        create_sysimage(
            [
                "Makie", "GLMakie", "CairoMakie", "WGLMakie",
                "DataFrames", "CSV",
                "DifferentialEquations", "MethodOfLines",
                "ModelingToolkit", "Symbolics",
                "FiniteDifferences", "ForwardDiff",
            ];
            sysimage_path=ENV["HOME"] * "/.local/lib/julia/makie." * ext)
        create_sysimage(["PhysicalConstants", "OhMyREPL"];
            sysimage_path=ENV["HOME"] * "/.local/lib/julia/calc." * ext)
    end
end

if Sys.islinux()
    ext = "so"
    compile(ext)
elseif Sys.isapple()
    ext = "dylib"
    compile(ext)
else
    println("Unknown OS")
end


