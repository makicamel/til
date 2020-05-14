# math

## XOR(排他的論理和)

[class FalseClass (Ruby 2.7.0 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/class/FalseClass.html#I_--5E)

true だったら false に、 false だったら true にしたい、という時に排他的論理和が使える。  
[排他的論理和 - Wikipedia](https://ja.wikipedia.org/wiki/排他的論理和)

```ruby
hash = Hash.new(false)
hoge.each { |fuga| hash[fuga] ^= true }
```
