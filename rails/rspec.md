# RSpec

## contain_exactly

refs: [`contain_exactly` matcher | Relish](https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/contain-exactly-matcher)

配列の要素が同じであるかどうかをテストし、順番の違いは無視する。  
配列の要素・順番共に同じであることをテストしたい場合は `eq` または `match` を使う。

```ruby
expect([1, 2, 3]).to    contain_exactly(2, 3, 1) # => pass
expect([:a, :c, :b]).to contain_exactly(:a, :c)  # => fail

expect([1, 2, 3]).to eq [1, 2, 3] # => pass
expect([1, 2, 3]).to eq [2, 1, 3] # => fail
```
