# FormHelper, FormTagHelper

- `form_with` => Rails5.1〜
- `form_for` `form_tag` => 〜Rails5.0, Rails5.1以降deprecated

## FormHelper と FormTagHelper の違い

official: [ActionView::Helpers::FormHelper - APIdock](https://apidock.com/rails/ActionView/Helpers/FormHelper)  
official: [ActionView::Helpers::FormTagHelper - APIdock](https://apidock.com/rails/ActionView/Helpers/FormTagHelper)

- FormHelper: `f.check_box` の形式で呼び出す
- FormTagHelper: `check_box_tag` で呼び出す。 `form_with` と無関係に呼び出せる

基本的に FormTagHelper の場合、2つめの引数は value となる(除 `select_tag`)

> Provides a number of methods for creating form tags that don’t rely on an `Active Record` object assigned to the template like `FormHelper` does. Instead, you provide the names and values manually.

`FormHelper` は ActiveRecord のオブジェクトと結びついたフォームタグの生成を行うが、 `FormTagHelper` は ActiveRecord と関係なくフォームタグを生成する。代わりに名前や値を指定する必要がある。

## check_box, check_box_tag

official: [check_box (ActionView::Helpers::FormHelper) - APIdock](https://apidock.com/rails/ActionView/Helpers/FormHelper/check_box)  

`check_box(object_name, method, options = {}, checked_value = "1", unchecked_value = "0")`

下記のように何も指定しない場合、チェックされた状態で `1` が、非チェック状態で `0` が送信される。  
(hidden タグが同時に生成される)  
デフォルトで checked になる。

```ruby
<%= form_with @book do |f| %>
  <%= f.check_box :on_sale %>
<% end %>
# =>
<input name="book[on_sale]" type="hidden" value="0">
<input type="checkbox" value="1" checked="checked" name="book[on_sale]" id="book_on_sale">
```

`check_box_tag(name, value = "1", checked = false, options = {})`

下記のように指定した場合、チェックされた状態で `1` が送信され、非チェック状態では何も送信されない。  
(hidden タグは自動で生成されない)  
`checked` に `false` を指定するとデフォルトでチェックされない。 `true` を指定すると checked になる。

```ruby
<%= check_box_tag "book[on_sale]", 1, false %>
# =>
<input type="checkbox" name="book[on_sale]" id="book_on_sale" value="1" checked="checked">
```

## select_tag

`select_tag(name, option_tags = nil, options = {})`

オプションを配列で指定する場合は `options_for_select` を使う。

```ruby
<%= select_tag "author[books][][published_year]", options_for_select((2000..2020).to_a), class: "form-control" %>
```

### options_for_select

1 次元配列を渡すと表示と value に同じ値が入り、 2 次元配列を渡すと 0 番目の値が表示に利用され、 1 番目の値が value に利用される

```ruby
options_for_select((2000..2020).to_a)
# =>
<option value="200">200</option>
<option value="201">201</option>
...

options_for_select([["選択しない", nil], ["男性", 0], ["女性", 1]])
# =>
<option value="">選択しない</option>
<option value="0">男性</option>
<option value="1">女性</option>
```

## フィールドを配列で扱いたい場合

FormHelper ではなく FormTagHelper を使う

``` ruby
<%= text_field_tag "author[books][][isbn]", "", class: "form-control" %>
```
