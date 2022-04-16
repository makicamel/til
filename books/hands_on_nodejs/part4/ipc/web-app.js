'use strict'
const http = require('http')
const fibonacci = require('../fibonacci')
const pid = process.pid

// IPC でメッセージを受信して指定されたポート番号で Web サーバを起動
process.on('message', port => {
  console.log(pid, `ポート ${port} で Web サーバを起動します`)
  http.createServer((req, res) => {
    const n = Number(req.url.substring(1))
    if (Number.isNaN(n)) {
      return res.end()
    }
    const response = fibonacci(n)
    // 結果を IPC で送信
    process.send({ pid, response })
    res.end(response.toString())
  }).listen(port)
})
