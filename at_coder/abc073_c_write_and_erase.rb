# C - Write and Erase
# https://atcoder.jp/contests/abc073/tasks/abc073_c

n = gets.to_i
as = Array.new(n) { gets.to_i }
hash = {}

as.each do |a|
  hash[a] ? hash.delete(a) : hash[a] = 1
end

puts hash.keys.size
