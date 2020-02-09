# Gem

## gem の作り方

1. `gem update --system && gem update bundler`
2. `bundle gem {gem}`
3. `cd {gem}`
4. `vim {gem}.gemspec`
5. `bundle`

refs: [はじめての自作gem 「Hello, Tama!」を出力してみる - @coe401_ | Qiita](https://qiita.com/coe401_/items/8e90373a76f590ef0abe)

```bash
# gemを最新版へupdate
gem update --system
# bundlerも同じく
gem update bundler
# 雛形の作成
bundle gem hello_tama
```

`gemspec` ファイルの編集

```bash
# Using hello_tama 0.1.0 from source at `.` される
bundle
```

## 自作 gem の利用の仕方

`bundle` だけでインストール、 require できるようになるという記載があるけどできない。  
ちゃんと調べていないのでこうすれば利用できるようになったというメモ(要調査)。  

1. `rake build`
2. `gem install pkg/{gem}-0.1.0.gem`

一度インストールすればあとは `rake install` でリビルド & インストールができる。

```bash
$ rake build
# => math_parser 0.1.0 built to pkg/math_parser-0.1.0.gem.

$ gem install pkg/math_parser-0.1.0.gem
# => Successfully installed math_parser-0.1.0
# Parsing documentation for math_parser-0.1.0
# Done installing documentation for math_parser after 0 seconds
# 1 gem installed

$ irb
irb(main):001:0> require 'math_parser'
# => true
```

### インストールに失敗する時確認する項目

- `.git` に削除済の unstaged ファイルが残っていると build に失敗する様なので git status をきれいな状態にしておく。  

```bash
ERROR:  While executing gem ... (Gem::InvalidSpecificationException)
```

## gemspec の書き方

gemspec に開発用依存 gem を記載する。利用時用 gem は Gemfile に記載。  
rake は Gemfile と gemspec と両方に書いていると警告が出る。  

```gemspec
spec.add_development_dependency "minruby", "~> 1.0.4"
```

## gem のアンインストール

```bash
gem uninstall {gem}
```
