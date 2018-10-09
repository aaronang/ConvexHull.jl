import ConvexHull: Point, grahamscan
using Test

@test Point(4.2, 42.0).x == 4.2
@test Point(4.2, 42.0).y == 42.0

@test (Point(1.0, 1.0) < Point(1.0, 1.0)) == false
@test (Point(1.0, 1.0) < Point(1.0, 2.0)) == true
@test (Point(1.0, 0.0) < Point(1.0, 1.0)) == true
@test (Point(1.0, 0.0) < Point(0.0, 1.0)) == false
@test (Point(1.0, 2.0) < Point(2.0, 1.0)) == true
