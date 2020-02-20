# 正規表現

## 最短マッチ

`.*?`を使うと最左最短マッチを得られる。
がこれは正確ではない。

簡易的な最短マッチにはなる。

```ruby
"<hoge>".match(/<.*?>/)[0]
# => "<hoge>"
```

正確な最短マッチは得られない。

```ruby
"<<<hoge>>>".match(/<.*?>/)[0]
# expected
# => "<hoge>"
# actually
# => "<<<hoge>"
```

[[正規表現] .*?は最短マッチではない - @anqooqie](https://qiita.com/anqooqie/items/191ad215e93237c77811) に詳細がある。  
official - ruby [正規表現 | Ruby2.7.0 リファレンスマニュアル](https://docs.ruby-lang.org/ja/2.7.0/doc/spec=2fregexp.html)

## `?`

`a?` => 0 or one of a

## `*`

`a*` => 0 or more of a

## `+`

`a+` => 1 or more of a

### 特定桁数の数字のマッチ

1〜4桁の数字のみマッチさせたい(5桁以上の数字はマッチさせたくない)場合  
`\A` (行頭) + `\D` (数字以外) + `*`(0回以上マッチ) を使う

```ruby
matcher = /\A[\D]*(\d{1,4})本/
target = "1000本"
target.match(matcher)
=> #<MatchData "1000本" 1:"1000">
target = "10000本"
target.match(matcher)
# => nil
target = "hoge:1000本"
target.match(matcher)
# => #<MatchData "hoge:1000本" 1:"1000">
target = "hoge:10000本"
target.match(matcher)
# => nil
```

これだと `target = "1P 10000本"`　のようなケースに対応していない… :thinking_face:  
「最長マッチ」について考える必要がありそう
