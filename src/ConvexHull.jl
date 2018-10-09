module ConvexHull

struct Point
    x::Float64
    y::Float64
end

function Base.isless(p::Point, q::Point)
    p.x < q.x || (p.x == q.x && p.y < q.y)
end

function grahamscan(points::Vector{Point})
    sort(points)
end

end # module
