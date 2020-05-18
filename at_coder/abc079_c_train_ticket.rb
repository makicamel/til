# C - Train Ticket
# https://atcoder.jp/contests/abc079/tasks/abc079_c

s = gets.chomp.chars

%w[+ -].repeated_permutation(3) do |op|
  exp = s.zip(op).join
  if eval(exp) == 7
    puts exp + "=7"
    exit
  end
end
