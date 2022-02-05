atreplinit() do repl
    try
        OhMyREPL.colorscheme!("TomorrowNightBright")
    catch e
        # @warn "error while importing OhMyREPL" e
    end
end
