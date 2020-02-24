# Scripts

## query

### simple_query_string

official: [Simple query string query | elastic.co](https://www.elastic.co/guide/en/elasticsearch/reference/master/query-dsl-simple-query-string-query.html)

ref: [Elasticsearchチュートリアル | 不可視点](http://code46.hatenablog.com/entry/2014/01/21/115620)  
> `simple_query_string` クエリは便利クエリの一つで、 `AND` `OR` `()` などの基本的な演算子と、検索対象のフィールドなどを指定できます。  
> 他にもクエリのカッコの数が一致しなかったり、エラーが出そうなときにエラーにするかしないかなどが選べたりします。

`default_operator` は指定しない場合 `OR` 。

```json
{
  "query" : {
    "simple_query_string" : {
      "query": "目黒 とんき",
      "fields": ["_all"],
      "default_operator": "and"
    }
  }
}
```

### 空のフィールドをクエリする

refs: [nullではなく空ではないElasticsearch curlクエリを作成します | TutorialMore](https://tutorialmore.com/questions-1154656.htm)

`exists` を使用して取得できる

```bash
curl -XGET 'http://127.0.0.1:9200/test/test/_search?pretty=1'  -d '
{
   "query" : {
      "constant_score" : {
         "filter" : {
            "exists" : {
               "field" : "myfield"
            }
         }
      }
   }
}
'
```

## upsert

ref: [elasticsearch : upsert の使い方 | Qiita](https://qiita.com/uturned0/items/582ddbdad87074a88c48)

`upsert` は 新規登録時に使われる値、 `script` に更新時に使用する script を指定する。

```json
{
  "script" : {
        "source": "ctx._source.host = params.host",
        "lang": "painless",
        "params" : {
            "host" : { "exist" : "0" }
        }
  },
  "upsert" : {
    "host" : {
      "exist": "1"
    }
  }
}
```
