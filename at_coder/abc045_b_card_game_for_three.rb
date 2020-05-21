# B 3人でカードゲームイージー
# https://atcoder.jp/contests/abc045/tasks/abc045_b

cards = %w[a b c].zip(Array.new(3) { gets.chomp.chars }).to_h

i = "a"
i = cards[i].shift until cards[i].empty?

puts i.upcase
