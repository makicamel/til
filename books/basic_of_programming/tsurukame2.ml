(* 目的：鶴の足の数（本）を計算する*)
(* tsuru_no_ashi : int -> int *)
let tsuru_no_ashi x = x * 2

(* 目的：亀の足の数（本）を計算する*)
(* kame_no_ashi : int -> int *)
let kame_no_ashi x = x * 4

(* 目的：鶴と亀の足の数（本）を計算する *)
(* tsurukame_no_ashi : int -> int -> int *)
let tsurukame_no_ashi x y  =  tsuru_no_ashi x + kame_no_ashi x

(* テスト *)
let test_1 = tsurukame_no_ashi 1 1 = 6
