'use strict'
const { fork, setupMaster } = require('cluster')

console.log('メインプロセス', process.pid)
setupMaster({ exec: `${__dirname}/web-app` })

const cpuCount = require('os').cpus().length
for (let i = 0; i < cpuCount; i++) {
  const sub = fork()
  console.log('サブプロセス', sub.process.pid)
  // IPC でサブプロセスにポート番号を送信
  sub.send(3000)
  // IPC で受信したメッセージをハンドリング
  sub.on('message', ({ pid, response }) =>
    console.log(process.pid, `${pid} が ${response} を返します`)
  )
}