#!/usr/bin/env julia
import PackageCompiler

cd(ENV["HOME"] * "/.local/lib")
println(pwd())
PackageCompiler.create_sysimage(["GLMakie"]; sysimage_path="jlmakie.dylib")
PackageCompiler.create_sysimage(["Plots"]; sysimage_path="jlplots.dylib")
