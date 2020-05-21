# B 3人でカードゲームイージー
# https://atcoder.jp/contests/abc045/tasks/abc045_b

a, b, c = Array.new(3) { gets.chomp.chars }

n = a
winner = 0
while winner.zero?
  n = case n.shift
      when "a" then a
      when "b" then b
      when "c" then c
  end
  winner = n.object_id if n.empty?
end

puts winner == a.object_id ? "A" : winner == b.object_id ? "B" : "C"
