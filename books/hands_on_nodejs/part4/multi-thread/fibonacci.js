'use strict'
const fibonacci = require('../fibonacci')
const { workerData, parentPort } = require('worker_threads')

// フィボナッチ数の計算結果をメインスレッドに送信
parentPort.postMessage(fibonacci(workerData))
