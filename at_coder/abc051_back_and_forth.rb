# C - Back and Forth
# https://atcoder.jp/contests/abc051/tasks/abc051_c

sx, sy, tx, ty = gets.split.map(&:to_i)
x = (tx - sx)
y = (ty - sy)
a = "U" * y + "R" * x
a += "D" * y + "L" * x
a += "L" + "U" * (y + 1) + "R" * (x + 1) + "D"
a += "R" + "D" * (y + 1) + "L" * (x + 1) + "U"
puts a
