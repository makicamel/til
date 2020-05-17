# C - Write and Erase
# https://atcoder.jp/contests/abc076/tasks/abc076_c

s, t = Array.new(2) { gets.chomp }

if s.match(t)
  puts s.gsub("?", "a")
  exit
end

regexp = Regexp.new "^(.*?)(#{t.chars.map { |char| "[#{char}|¥?]" }.join})(.*)$"
if matched = s.match(regexp)
  puts "#{matched[1]}#{t}#{matched[3]}".gsub("?", "a")
else
  puts "UNRESTORABLE"
end
