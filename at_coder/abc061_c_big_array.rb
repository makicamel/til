# C - Big Array
# https://atcoder.jp/contests/abc061/tasks/abc061_c

n, k = gets.split.map(&:to_i)

hash = {}
n.times do
  a, b = gets.split.map(&:to_i)
  hash[a] = hash.has_key?(a) ? hash[a] + b : b
end

hash.sort.each do |a, b|
  k -= b
  if k <= 0
    puts a
    break
  end
end
