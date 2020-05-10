# https://atcoder.jp/contests/abc057/tasks/abc057_c
# C - Digits in Multiplication

n = gets.to_i

Math.sqrt(n).to_i.downto(1) do |i|
  if (n % i).zero?
    puts (n / i).to_s.size
    break
  end
end
