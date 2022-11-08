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

    # Create channels
    for i in eachindex(args)
        ea = :($(tasklist[i]) = Channel())
        push!(e.args, ea)
    end

    # Spawn threads
    for (i, (_, f)) in enumerate(pkwargs)
        ea = :(Threads.@spawn put!($(tasklist[i]), $(f)))
        push!(e.args, ea)
    end

    # Take results from channels
    for (i, (x, _)) in enumerate(pkwargs)
        ea = :($(x) = take!($(tasklist[i])))
        push!(e.args, ea)
    end

    # Return main expression
    return esc(e)
end
