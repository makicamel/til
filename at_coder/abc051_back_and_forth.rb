# C - Back and Forth
# https://atcoder.jp/contests/abc051/tasks/abc051_c

sx, sy, tx, ty = gets.split.map(&:to_i)
up = "U" * (ty - sy)
right = "R" * (tx - sx)
down = "D" * (ty - sy)
left = "L" * (tx - sx)
a = up + right
a += down + left
a += "LU#{up}#{right}RD"
a += "RD#{down}#{left}LU"
puts a
