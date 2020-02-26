# FunctionScore

official: [Function score query | Elasticsearch Reference [7.6] | Elastic](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-function-score-query.html)

クエリで取得されたドキュメントのスコアを変更できる。  
`filter` を利用してドキュメントが特定のフィルタリングクエリに一致する場合のみ function を適用することもできる。

## script_score

official: [Function score query | Elasticsearch Reference [7.6] | Elastic](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-function-score-query.html#function-script-score)

同じドキュメントの他のフィールドの値を利用した計算結果でスコアリングをカスタマイズできる。

## field_value_factor

official: [Function score query | Elasticsearch Reference [7.6] | Elastic](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-function-score-query.html#function-field-value-factor)

フィールドの値をそのままスコアとして利用できる。  
値に関数を適用するなどもできる。  

- `missing` フィールドを利用することでフィールドが null だった時のデフォルト値の設定ができる。
- `field`: ドキュメントから抽出・利用するフィールド。  
- `factor`: フィールドに乗算する値。デフォルトは 1。
- `modifier`: `field` に適用する演算子。 `none`, `log`, `log1p`, `log2p`, `ln`, `ln1p`, `ln2p`, `square`, `sqrt`, or `reciprocal` が利用できる。デフォルトは `none`。

下記 json の場合、 `rating` フィールドの値をそのままスコアとして search した結果が返る。

```json
GET /book/book/_search?size=5
{
  "query": {
    "function_score": {
      "query": {
        "match_all": {}
      },
      "functions": [
        {
          "field_value_factor": {
            "field": "rating"
          }
        }
      ]
    }
  }
}
```
