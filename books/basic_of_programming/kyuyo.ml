(* 時給(円) *)
let jikyu = 950
(* 基本給(円) *)
let kihonkyu = 100
(* 優遇時給(円) *)
let yugu_jikyu = 980

(* 目的：働いた時間xに応じたアルバイト代を計算する *)
(* kyuyo : int -> int *)
(* let kyuyo x = kihonkyu + x * jikyu *)
(* let kyuyo x =
  if x < 30 then kihonkyu + x * jikyu
            else kihonkyu + x * yugu_jikyu *)
let kyuyo x =
    kihonkyu + x * (if x < 30 then jikyu else yugu_jikyu)

(* テスト *)
let test1 = kyuyo 25 = 23850
let test2 = kyuyo 28 = 26700
let test3 = kyuyo 31 = 30480