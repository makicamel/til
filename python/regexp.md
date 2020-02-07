# 正規表現

refs: [Pythonの正規表現モジュールreの使い方（match、search、subなど） | note.nkmk.me](https://note.nkmk.me/python-re-match-search-findall-etc/)

基本的にはパターンを compile 後マッチする。その方が早いらしい。  
マッチしない場合は None が返る。  
None は Falsy であるため、マッチしたか否かのみのチェックなら `if rep.match(content):` でOK。

```python
import re

content = r'Hello, World'
pattern = 'Hel'

# compile
rep = re.compile(pattern)
result = rep.match(content)

# result には Match オブジェクトが入る
result
# => <_sre.SRE_Match object; span=(0, 3), match='Hel'>

# `.group` でマッチした文字列を取得できる
result.group()
# => 'Hel

if rep.match(content):
    ....
else:
    ....
end
```

## 基本的なマッチメソッド

### match

文字列が先頭からマッチするかをチェック、抽出

### search

文字列が先頭であるか否かに関わらずマッチするかをチェック、抽出  
最初の結果のみを返す

### findall

文字列が先頭であるか否かに関わらずマッチするかをチェック、抽出  
すべての結果を list 型で返す

### fullmatch

文字列全体がマッチするかをチェック、抽出

```python
import re

content = r'Hello, World, World'
pattern = 'World'

# match: 先頭からマッチ
match_result = re.match(pattern, content)
match_result
# => None

# search: 先頭でなくても存在すればマッチ(最初のマッチのみ返す)
search_result = re.search(pattern, content)
search_result.group()
# => 'World'

# findall: 先頭でなくても存在すればマッチ(すべてのマッチを返す)
findall_result = re.findall(pattern, content)
findall_result
# => ['World', 'World']
```
