# ABC 042: B – 文字列大好きいろはちゃんイージー / Iroha Loves Strings (ABC Edition)
# https://atcoder.jp/contests/abc042/tasks/abc042_b

n, = gets.split.map(&:to_i)
s = [].tap { |array| n.times { array << gets.chomp } }
puts s.sort.join
