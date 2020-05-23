# B - AtCoDeerくんとボール色塗り
# https://atcoder.jp/contests/abc046/tasks/abc046_b

n, k = gets.split.map(&:to_i)
puts k * (k - 1)**(n - 1)
