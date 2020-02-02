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
