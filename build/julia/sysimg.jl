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
                "DifferentialEquations", "MethodOfLines"
            ];
            sysimage_path=ENV["HOME"] * "/.local/lib/julia/main." * ext)
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


