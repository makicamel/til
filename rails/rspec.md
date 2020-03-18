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

## lib ディレクトリ以下ファイルのテスト

refs: [ruby on rails - Correct way to test lib folder with rspec? - Stack Overflow](https://stackoverflow.com/questions/21544519/correct-way-to-test-lib-folder-with-rspec)

> `require 'parser'` is the recommended way. RSpec puts `lib` on the `$LOAD_PATH`

RSpec は `lib` 以下を読み込むので、　`lib` 以下を　`require` する。

```ruby
# lib/helpers/foo.rb の spec の場合
require "helpers/foo"
```

## reload or exist

[神速さんに教えて頂いた](https://twitter.com/sinsoku_listy/status/1240304340742467584?s=20)

レコードを作って存在チェックや関連付けの検証をする時、何もしないと反映されておらず、関連付けが返ってこない。  
`reload` で解決できる。

```ruby
user = FactoryBot.create(:user)
article = FactoryBot.create(:article, user: user, title: "test")
expect(user.article.title).to eq "test"
# => failure

user.reload
expect(user.article.title).to eq "test"
# => success
```

存在チェックであれば、文字通り `be_exists` を使った方がスマートに書ける。  
(条件 A は返ってくるが、条件 B のレコードは返ってこない、という書き方には向かなそう)

```ruby
user = FactoryBot.create(:user)
article = FactoryBot.create(:article, user: user, title: "test")
expect(Article).to be_exists(id: article.id, user: user, title: "test")
```
