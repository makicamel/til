# C - Big Array
# https://atcoder.jp/contests/abc061/tasks/abc061_c

n, k = gets.split.map(&:to_i)

hash = Hash.new 0
n.times do
  a, b = gets.split.map(&:to_i)
  hash[a] += b
end

hash.sort.each do |a, b|
  k -= b
  if k <= 0
    puts a
    break
  end
end
