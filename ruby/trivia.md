# Trivia

## if 文の戻り値

official [制御構造 | Ruby 2.7.0 リファレンスマニュアル](https://docs.ruby-lang.org/ja/latest/doc/spec=2fcontrol.html)

if 文(修飾子)は条件式が true である時、 then 以下の式を評価する。  
このため else 節がなくいずれの条件も成り立たなければ nil を返す。  

```ruby
if
  p "これは変数です"
end
# "これは変数です"
# => nil

# "これは変数です"` は p されるだけで
# 戻り値は nil になる
```
