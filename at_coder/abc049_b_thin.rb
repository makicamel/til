# B - Thin
# https://atcoder.jp/contests/abc049/tasks/abc049_b

h, = gets.split.map(&:to_i)
answer = []
h.times { answer << gets.chomp }
answer.each { |line| 2.times { puts line } }
