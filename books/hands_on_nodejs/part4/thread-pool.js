'use strict'
const { Worker } = require('worker_threads')

module.exports = class ThreadPool {
  // 空きスレッド、キューを初期化
  availableWorkers = []
  queue = []
  constructor(size, filePath, options) {
    // 引数で指定された通りにスレッドを生成してプールする
    for (let i = 0; i < size; i++) {
      this.availableWorkers.push(new Worker(filePath, options))
    }
  }

  // 外部からの処理要求を受けつけるメソッド
  executeInThread(arg) {
    return new Promise(resolve => {
      const request = { resolve, arg }
      // 空きスレッドがあればリクエストを処理し、なければ待ちキューに積む
      const worker = this.availableWorkers.pop()
      worker ? this.#process(worker, request) : this.queue.push(request)
    })
  }

  // 実際にスレッドで処理を実行する private メソッド
  #process(worker, { resolve, arg }) {
    worker.once('message', result => {
      // リクエスト元に結果を返す
      resolve(result)

      // 待ちキューに積まれたリクエストがあれば処理し、なければスレッドを空きスレッドに戻す
      const request = this.queue.shift()
      request
        ? this.#process(worker, request)
        : this.availableWorkers.push(worker)
    })
    worker.postMessage(arg)
  }
}
