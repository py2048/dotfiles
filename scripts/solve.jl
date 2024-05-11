#!/usr/bin/env -S julia -i

using NonlinearSolve

function nsolve(f::Function, u0::Real; method=NewtonRaphson())
    prob = NonlinearProblem((x, p) -> f(x), u0, Nothing)
    sol = solve(prob, method)
    display(sol)
    return sol.u
end
