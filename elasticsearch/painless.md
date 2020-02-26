# Painless

Elasticsearch で使うことのできるスクリプト言語。  
単一のフィールドで計算したり、フィールドの値を利用して更新したりできる。

official: [Painless API Reference | Painless Scripting Language [7.6] | Elastic](https://www.elastic.co/guide/en/elasticsearch/painless/current/painless-api-reference.html)

> **PainlessはJavaのすべてのネイティブ形式に対応しており、LocalDateTime()などのネイティブ関数も使用できる**

ので、やりたいことが API リファレンスで見つけられない場合、 Java の関数を調べるのも手っ取り早い解決策となる。

## update

official: [Update API | Elasticsearch Reference [6.8] | Elastic](https://www.elastic.co/guide/en/elasticsearch/reference/6.8/docs-update.html)

`ctx._source.hoge.addAll(params.hoge)` の `addAll` も Java の関数。

```json
POST test/_doc/1/_update
{
  "script" : {
    "source": "ctx._source.hoge.addAll(params.hoge)",
    "lang": "painless",
    "params" : {
        "hoge" : ["new_value"]
    }
  },
  "upsert" : {
    "hoge": ["original_value"]
  }
}
```
