(* 鶴の足の数(本) *)
let tsuru_no_asi = 2
(* 亀の足の数(本) *)
let kame_no_asi = 4

(* 鶴の数と亀の数から足の数の合計を返す *)
(* tsurukame: int -> int -> int *)
let tsurukame tsuru kame = tsuru * tsuru_no_asi + kame * kame_no_asi

(* テスト *)
let test1 = tsurukame 1 1 = 6
let test2 = tsurukame 1 2 = 10
let test3 = tsurukame 2 1 = 8
