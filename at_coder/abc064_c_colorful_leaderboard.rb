# C - Colorful Leaderboard
# https://atcoder.jp/contests/abc064/tasks/abc064_c

gets
as = gets.split.map(&:to_i)
rates = Array.new(8, nil)
free = 0

as.each do |a|
  case a
  when 1..399 then    rates[0] = 1
  when 400..799 then  rates[1] = 1
  when 800..1199 then rates[2] = 1
  when 1200..1599 then rates[3] = 1
  when 1600..1999 then rates[4] = 1
  when 2000..2399 then rates[5] = 1
  when 2400..2799 then rates[6] = 1
  when 2800..3199 then rates[7] = 1
  else; free += 1
  end
end

rates.compact!
if rates.size.zero?
  puts [1, free].join(" ")
else
  puts [rates.size, rates.size + free].join(" ")
end
