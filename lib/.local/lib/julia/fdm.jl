##
using FiniteDifferences

const fdm_num_grid_points = Dict(
    2 => Dict(
        :backward => (3, 4, 5, 6, 7, 8),
        :forward => (3, 4, 5, 6, 7, 8),
        :central => (3, 3, 5, 5, 7, 7)
    ),
    4 => Dict(
        :backward => (5, 6, 7, 8, 9, 10),
        :forward => (5, 6, 7, 8, 9, 10),
        :central => (5, 5, 7, 7, 9, 9)
    )
)


##
"""
Generate FDM coef
"""
macro Diff(method::Symbol, diff_order::Int, ex_arr::Expr, _fdm_accuracy_order...)
    @assert ex_arr.head == :ref "Expression must be an array"
    @assert length(ex_arr.args) == 2 "Only 1 index"
    # Check the order of accuracy, default is 2
    fdm_accuracy_order = isempty(_fdm_accuracy_order) ? 2 : _fdm_accuracy_order[1]

    # u array and index
    local u = ex_arr.args[1]
    local i = ex_arr.args[2]

    # number of gridpoints
    num_grid_points = fdm_num_grid_points[fdm_accuracy_order][method][diff_order]
    fdm_methods = Dict(:forward => forward_fdm, :backward => backward_fdm, :central => central_fdm)
    fdm = fdm_methods[method](num_grid_points, diff_order)

    # Main expr
    ex = Expr(:call, :+)
    for j in 1:num_grid_points
        grid = fdm.grid[j]
        coef = fdm.coefs[j]
        coef == 0 && continue
        ex_j = Expr(:call, :*, coef, Expr(:ref, u, Expr(:call, :+, i, grid)))
        push!(ex.args, ex_j)
    end
    return esc(ex)
end

"""Forward FDM coef"""
macro fDiff(diff_order::Int, ex_arr::Expr, _fdm_accuracy_order...)
    fdm_accuracy_order = isempty(_fdm_accuracy_order) ? 2 : _fdm_accuracy_order[1]
    esc(:(@Diff(forward, $diff_order, $ex_arr, $fdm_accuracy_order)))
end

"""Backward FDM coef"""
macro bDiff(diff_order::Int, ex_arr::Expr, _fdm_accuracy_order...)
    fdm_accuracy_order = isempty(_fdm_accuracy_order) ? 2 : _fdm_accuracy_order[1]
    esc(:(@Diff(backward, $diff_order, $ex_arr, $fdm_accuracy_order)))
end

"""Central FDM coef"""
macro cDiff(diff_order::Int, ex_arr::Expr, _fdm_accuracy_order...)
    fdm_accuracy_order = isempty(_fdm_accuracy_order) ? 2 : _fdm_accuracy_order[1]
    esc(:(@Diff(central, $diff_order, $ex_arr, $fdm_accuracy_order)))
end

##
# @macroexpand @Diff(central, 2, u[i]) / h

##
# @macroexpand @cDiff(2, u[i]) / h
