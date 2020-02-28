# Tips

## ディレクトリパスの結合

ディレクトリパスは `Path("相対パス")` で得られる。  
これを文字列化する場合は `str()` で囲む。  
階層は `/` で表現できる。

```python
from pathlib import Path

dir_name = Path("../data")
middle_dir_name = "middle"
file_name = "example.py"
str(dir_name / middle_dir_name / file_name)
# => '../data/middle/example.py'
```

## luigiタスク内のパス

`Path(path)` で取得できるが、このpathは `bash` 同様実行ファイルからではなく**実行時ディレクトリから**呼び出し先ファイルへの相対パス。

## luigiタスクのoutputファイルの書き出し

```python
class ExampleTask(luigi.Task):
    def requires(self):
        return luigi.LocalTarget("./path/to/input_file.ext")


    def output(self):
        return luigi.LocalTarget("./path/to/output_file.ext")


    def run(self):
        with self.output().open('w') as out_file:
            out_file.write('Done')
```

## for文

refs: [Pythonのfor文によるループ処理（range, enumerate, zipなど） | note.nkmk.me](https://note.nkmk.me/python-for-usage/)

### foreach

`for ブロック引数 in イテラブルオブジェクト` の形式。

```python
names = ['Alice', 'Bob', 'Charlie']

for name in names:
    print(name)
# => Alice
# => Bob
# => Charlie
```

## 大文字小文字変換

`upper()` `lower()` でできる。  
非破壊的なメソッド。

```python
hoge = 'HOgE'
hoge.upper()
# => 'HOGE'
hoge
# => 'HOgE'
hoge.lower()
# => 'hoge'
hoge
# =>'HOgE'
```

## bool値への変換

refs: [Pythonの真偽値bool型（True, False）と他の型との変換・判定 | note.nkmk.me](https://note.nkmk.me/python-bool-true-false-usage/)

Python での bool 値は 1, 0 と等価。  
他の型から bool 値への変換は組み込み関数 `bool()` で行える。  

```python
bool(1)
# => True
bool(0)
# => False
bool(None)
# => False
```

## 文字列の展開

文字列リテラルの中で変数の値を利用する場合、`%s` をおいておき、変数を順番に指定することで渡すことができる。

```python
key = 'hoge'
filename = '2020-02-21-01-%s.txt' % (key)
# => '2020-02-21-01-hoge.txt'
```

文字列リテラルでキーを指定することもできる。

```python
key = 'hoge'
filename = '2020-02-21-01-{key}.txt'.format(key=key)
# => '2020-02-21-01-hoge.txt'
```

## 文字列の置換

`replace` メソッドを使う。破壊的なメソッドではなく、置換後の文字列を返す。

```python
a = "hoge"
b = a.replace("ho","fu")
print(a)
# => "hoge"
print(b)
# => "fuge"
```

## 日付の利用

`datetime` ライブラリを使用する。

```python
import datetime
>>> datetime.date.today()
# => datetime.date(2020, 2, 21)
```
