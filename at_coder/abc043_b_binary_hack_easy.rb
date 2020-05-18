# B バイナリハックイージー
# https://atcoder.jp/contests/abc043/tasks/abc043_c

s = gets.chomp

answer = []
s.chars.each { |char| char == "B" ? answer.pop : answer.push(char) }

puts answer.join
