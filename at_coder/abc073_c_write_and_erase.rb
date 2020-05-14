# C - Write and Erase
# https://atcoder.jp/contests/abc073/tasks/abc073_c

n = gets.to_i
as = []
n.times do
  a = gets.to_i
  as.include?(a) ? as.delete(a) : as.push(a)
end

puts as.size
