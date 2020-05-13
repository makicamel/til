# C - Multiple Clocks
# https://atcoder.jp/contests/abc070/tasks/abc070_c

n = gets.to_i
ts = [].tap { |array| n.times { array << gets.to_i } }

result = ts.max
ts.each do |t|
  result = result.lcm t unless (result % t).zero?
end

puts result
