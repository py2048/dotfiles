macro parallel(block)
    # block to tuples of arg
    @assert block.head == :block
    args = filter(x -> !(x isa LineNumberNode), block.args)

    # Convert args to kwargs
    pkwargs = Pair{Symbol,Any}[]
    for el in args
        if Meta.isexpr(el, :(=))
            push!(pkwargs, Pair(el.args...))
        else
            push!(pkwargs, Pair(:_, el))
        end
    end

    # Main expression
    e = Expr(:block)

    # tasks variables creation
    tasklist = gensym(:tasklist)
    tasklist = []
    for i in eachindex(args)
        tmp = gensym(Symbol(:task, i))
        push!(tasklist, tmp)
    end

    # spawn threads -> tasks
    for (i, (_, f)) in enumerate(pkwargs)
        ea = :($(tasklist[i]) = Threads.@spawn $(f))
        push!(e.args, ea)
    end

    # fetch the results form tasks
    for (i, (x, _)) in enumerate(pkwargs)
        ea = :($(x) = fetch($(tasklist[i])))
        push!(e.args, ea)
    end

    # Return main expression
    return esc(e)
end
