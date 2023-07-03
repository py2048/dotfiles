#!/usr/bin/env -S julia -t auto
using PackageCompiler
include(ENV["HOME"] * "/.local/lib/julia/parallel.jl")

function compile(ext)

    # Calc
    create_sysimage(["PhysicalConstants", "OhMyREPL"];
        sysimage_path=ENV["HOME"] * "/.local/lib/julia/calc." * ext)

    @parallel begin
        # Base
        # create_sysimage(["Plots", "OhMyREPL"]; sysimage_path=ENV["HOME"] * "/.local/lib/julia/base." * ext, precompile_statements_file="ohmyrepl_precompile.jl")
        create_sysimage(["GLMakie", "Makie"]; sysimage_path=ENV["HOME"] * "/.local/lib/julia/base." * ext)
        # Main
        create_sysimage(
            [
                "Makie", "GLMakie", "CairoMakie", "WGLMakie",
                "DataFrames", "CSV",
                "DifferentialEquations", "MethodOfLines",
                "ModelingToolkit", "Symbolics",
                "FiniteDifferences", "ForwardDiff",
            ];
            sysimage_path=ENV["HOME"] * "/.local/lib/julia/main." * ext)
        # Plot
        create_sysimage(["Makie", "CairoMakie", "Pluto", "PlutoUI"]; sysimage_path=ENV["HOME"] * "/.local/lib/julia/plt." * ext)

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


