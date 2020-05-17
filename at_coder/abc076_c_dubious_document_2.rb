# C - Write and Erase
# https://atcoder.jp/contests/abc076/tasks/abc076_c

s, t = Array.new(2) { gets.chomp }

answers = []
(s.size - t.size + 1).times do |i|
  tmp = s.dup
  if tmp[i...i + t.size].chars.map.with_index { |char, j| ["?", t[j]].include? char }.all?
    t.size.times { |j| tmp[i + j] = t[j] }
    answers << tmp.gsub("?", "a")
  end
end

if answers.empty?
  puts "UNRESTORABLE"
else
  puts answers.min
end
