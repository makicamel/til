# C - Write and Erase
# https://atcoder.jp/contests/abc073/tasks/abc073_c

n = gets.to_i
as = [].tap { |array| n.times { array << gets.to_i } }
hash = {}

as.each do |a|
  hash[a] = hash[a] ? nil : 1
end

puts hash.select { |_, v| v }.size
