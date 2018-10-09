module ConvexHull

struct Point
    x::Float64
    y::Float64
end

function Base.isless(p::Point, q::Point)
    p.x < q.x || (p.x == q.x && p.y < q.y)
end

function isrightturn(p::Point, q::Point, r::Point)
    (q.x - p.x) * (r.y - p.y) - (q.y - p.y) * (r.x - p.x) < 0
end

function grahamscan(points::Vector{Point})
    sorted = sort(points)
    upperhull = sorted[1:2]
    for p in sorted[3:end]
        push!(upperhull, p)
        while length(upperhull) > 2 && !isrightturn(upperhull[end-2:end]...)
            deleteat!(upperhull, length(upperhull) - 1)
        end
    end

    reversed = reverse(sorted)
    lowerhull = reversed[1:2]
    for p in reversed[3:end]
        push!(lowerhull, p)
        while length(lowerhull) > 2 && !isrightturn(lowerhull[end-2:end]...)
            deleteat!(lowerhull, length(lowerhull) - 1)
        end
    end

    [upperhull..., lowerhull[2:end-1]...]
end

end # module
