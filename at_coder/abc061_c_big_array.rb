# C - Big Array
# https://atcoder.jp/contests/abc061/tasks/abc061_c

n, k = gets.split.map(&:to_i)
array = Array.new(10**5 + 1, 0)
n.times do
  a, b = gets.split.map(&:to_i)
  array[a] += b
end

array.each_with_index do |b, a|
  k -= b
  if k <= 0
    puts a
    break
  end
end
