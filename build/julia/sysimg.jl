#!/usr/bin/env julia
using PackageCompiler
create_sysimage(["Plots"]; sysimage_path=ENV["HOME"] * "/.local/lib/jlplots.dylib")
create_sysimage(["GLMakie"]; sysimage_path=ENV["HOME"] * "/.local/lib/jlmakie.dylib")
create_sysimage(["OhMyREPL"]; sysimage_path=ENV["HOME"] * "/.local/lib/jlrepl.dylib")
# create_sysimage(["OhMyREPL"]; sysimage_path=ENV["HOME"] * "/.local/lib/jlrepl.dylib", precompile_statements_file="ohmyrepl_precompile.jl")
