'use strict'
const fibonacci = require('../fibonacci')
const { parentPort } = require('worker_threads')

// message イベントの監視によりメインスレッドからのメッセージの受信を待機、
// 受信したらフィボナッチ数を計算して結果をメインスレッドに送信
parentPort.on('message', n => parentPort.postMessage(fibonacci(n)))
