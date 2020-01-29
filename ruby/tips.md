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

