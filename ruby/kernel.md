# Kernel

全てのクラスから参照できるメソッドを定義する。Objectクラスはこのモジュールをインクルードしている。  
Objectクラスのメソッドは実際にはこのモジュールで定義されている。これはトップレベルでのメソッドの再定義に対応するため。  
[module Kernel - Ruby 2.7.0 リファレンスマニュアル](https://docs.ruby-lang.org/ja/latest/class/Kernel.html)

## Kernel.#load

Rubyプログラム`file`をロードして実行する。**再ロード可能**。  
[module function Kernel.#load - Ruby 2.7.0 リファレンスマニュアル](https://docs.ruby-lang.org/ja/2.7.0/method/Kernel/m/load.html)

### `Kernel.#require`と`Kernel.#load`の違い

| | require | 拡張子 |
| -- | -- | -- |
| 読み込み | 初回一度だけ | 無条件に何度でも |
| 拡張子 | `.rb`を優先して補完 | 補完しない |
