# C - Colorful Leaderboard
# https://atcoder.jp/contests/abc064/tasks/abc064_c

gets
as = gets.split.map(&:to_i)
rates = Array.new 8
free = 0

as.each do |a|
  i = a / 400
  if i < 8
    rates[i] = 1
  else
    free += 1
  end
end

rates.compact!
if rates.size.zero?
  puts [1, free].join(" ")
else
  puts [rates.size, rates.size + free].join(" ")
end
