'use strict'
const http = require('http')
const { Worker } = require('worker_threads')

http.createServer((req, res) => {
  const n = Number(req.url.substring(1))
  if (Number.isNaN(n)) {
    return res.end
  }
  // コンストラクタの第二引数で値を渡しつつサブスレッドを生成
  new Worker(`${__dirname}/fibonacci.js`, { workerData: n })
    // サブスレッドから受け取った結果をレスポンスとして返す
    .on('message', result => res.end(result.toString()))
}).listen(3000)
