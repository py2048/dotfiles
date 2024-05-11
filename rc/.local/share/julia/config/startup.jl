atreplinit() do repl
    try
        @eval using OhMyREPL
        @eval OhMyREPL.colorscheme!("TomorrowNightBright")
    catch e
        @warn "error while importing OhMyREPL" e
    end
end
