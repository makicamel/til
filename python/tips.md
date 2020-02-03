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