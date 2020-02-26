# Alias

主にダウンタイムを避けてリインデックスをする用途に使われる[要出典]。

## 追加

```bash
# books_v1 を books の alias にする
PUT /books_v1/_alias/books
```

## 確認

```bash
GET _alias/
```
