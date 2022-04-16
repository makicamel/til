'use strict'
const http = require('http')
const fibonacci = require('./fibonacci')

// サーバオブジェクトの生成とリクエストハンドラの設定
http.createServer((req, res) => {
  // http://localhost:3000/10 へのリクエストでは req.url は '/10' になるので
  // そこから 1 文字目を取り除いて n を取得する
  const n = Number(req.url.substring(1))
  if (Number.isNaN(n)) {
    // Number.isNaN() で数値か否か判定し、数値でない場合は無視
    return res.end()
  }
  const result = fibonacci(n)
  // res.end() で計算結果をレスポンスとして返す
  res.end(result.toString())
}).listen(3000) // 3000 ポートでリクエストを待機
