# Mapping

## mapping の更新 / 作成

`PUT` で index に対し json を渡すことで mapping の作成ができる。  
更新の場合、追加したいフィールドだけ json で渡すことで追加ができる。  

- **mapping はフィールドの追加はできるが更新はできない。**
- mapping の追加のみであれば既存の index に影響はなく、 reindex や update は不要
(既存 index にデフォルト値などを指定したい場合は勿論 update が必要)
- なお、 template の変更の場合はまた違うはず(要確認)
- また例えば analyzer を変更したい場合などは次回から index したドキュメントに対してのみ analyzer の変更が有効になるので、その場合は reindex や update が必要

```bash
PUT blog/_mapping/_doc
{
  "properties": {
    "author": {
      "type": "text",
      "analyzer": "hoge_analyzer"
    }
  }
}
```

```bash
$ curl -XPUT 'localhost:9200/blog' -d '
{
  "mappings" : {
    "_doc" : {
      "properties" : {
        "author" : {
          "type" : "string"
        }
      }
    }
  }
}
```

## template の更新

template の更新 (ex. settings) はできるが、 mapping の更新はできない。  
mapping の更新をする場合は `PUT type` に mappings の json を渡す(上述)。

```bash
PUT _template/blog
{
  "index_patterns": "blog_*",
  "mappings": {
    "author": {
          "type": "text",
          "analyzer": "simple",
          "fields": {
            "hoge": {
              "type": "text",
              "analyzer": "hoge_analyzer"
            },
            "keyword": {
              "type": "keyword"
            }
          }
        }
  }
}
```

```bash
  "mappings": {
    "_doc": {
      "dynamic_templates": [
        {
          "description_template": {
            "match": "hoge_*",
            "match_mapping_type": "string",
            "mapping": {
              "type": "text",
              "search_analyzer": "hoge_analyzer",
              "analyzer": "hoge_analyzer"
            }
          }
        },
      ]
    }
  }
```

```bash
PUT _template/blogs
{
  "index_patterns": "blogs_*",
  "settings": {
    "analysis": {
      "analyzer": { 
        "hoge_analyzer": {
          "type": "custom",
          "tokenizer": "hoge_search",
          "filter": [
            "lowercase",
            "trim",
            "asciifolding"
          ]
        }
      },
      "tokenizer": {
        "hoge_search": {
          "mode": "search",
          "type": "kuromoji_tokenizer"
        }
      }
    }
  },
  "mappings": {
    "_doc": {
      "properties": {
        "author": {
          "type": "text",
          "analyzer": "simple",
          "fields": {
            "japanese": {
              "type": "text",
              "analyzer": "hoge_analyzer"
            },
            "keyword": {
              "type": "keyword"
            }
          }
        }
      }
    }
  }
}
```

## reindex

official [Reindex is coming! | Elastic Blog](https://www.elastic.co/jp/blog/reindex-is-coming) (2016年3月31日)
> `_reindex` は、ドキュメントをひとつのindexから読み込み、他のindexに書き込みます。これにより、ドキュメントをあるindexから他のindexにコピーしたり、あらたな情報をfieldとして加えたり、index作成時に決められた設定を、indexの再作成により変更できます。  
> `_update_by_query` は、ドキュメントをひとつのindexから読み取り、同じindexに書き戻します。これにより多くのドキュメントに含まれるfieldの更新や、mappingの変更をオンラインで行えます。

```bash
POST blogs/_update_by_query?conflicts=proceed&refresh
```
