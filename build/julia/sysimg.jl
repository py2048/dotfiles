#!/usr/bin/env julia
using PackageCompiler

function compile(ext)
    create_sysimage(["Plots"]; sysimage_path=ENV["HOME"] * "/.local/lib/jlplots." * ext)
    create_sysimage(["OhMyREPL"]; sysimage_path=ENV["HOME"] * "/.local/lib/jlrepl." * ext, precompile_statements_file="ohmyrepl_precompile.jl")
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


