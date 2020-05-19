# B 美しい文字列
# https://atcoder.jp/contests/abc044/tasks/abc044_c

s = gets.chomp.chars

hash = s.group_by(&:itself)
if hash.values.all? { |array| array.size.even? }
  puts "Yes"
else
  puts "No"
end
