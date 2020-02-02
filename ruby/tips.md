# Tips

## Object#method

オブジェクトのメソッドnameをオブジェクト化したMethodオブジェクトを返す

## Method#souce_location

ソースコードのファイル名と行番号を配列で返す

```ruby
hoge = ''.method(:size)
# => #<Method: String#size>

hoge.source_location
# => nil
# nilが返ってくるときはC実装

FileUtils.method(:cd).source_location
=> ["/Users/makicamel/.rbenv/versions/2.5.1/lib/ruby/2.5.0/fileutils.rb", 120]
```

## メソッドのオーバーロード

[Rubyにはオーバーロードの定義はない](https://pocke.hatenablog.com/entry/2019/04/28/014018) が、同じ名前の変数とメソッドは存在できる。  
これは変数の環境と関数の環境が別である為。

> MinRubyでは、変数の環境と関数の環境を別にしました。これは、本物のRubyがそうなっているからです。  
> 変数名と関数の環境が違うということは、同じ名前の変数と関数が同居できるということを意味します。  
> [RubyでつくるRuby p.92](https://www.lambdanote.com/products/ruby-ruby)

変数名と関数の環境が違うので同じ名前の変数と関数は存在できるが、同じ環境内に同じ名前の関数は存在できない、ということだと思う。  

```ruby
# can execute
def foo(x, y)
  x + y * 2
end

foo = foo(1, 1)
foo = foo(foo, foo(1, 1))
p foo
# => 9

# raise error
def foo(x, y)
  x + y * 2
end

def foo(x)
  x * 2
end

foo = foo(1)
foo = foo(foo, foo(1, 2))
# => ArgumentError (wrong number of arguments (given 2, expected 1))
```
