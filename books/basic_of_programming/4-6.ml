(* 目的：現在の気温tから快適度を表す文字列を計算する
(* kion: int -> string *)
let kion t =
  if t < 15 then "普通"
            else if t <= 25 then "快適"
                            else "普通"

(* テスト *)
let test1 = kion 7 = "普通"
let test2 = kion 15 = "快適"
let test3 = kion 20 = "快適"
let test4 = kion 25 = "快適"
let test5 = kion 28 = "普通"


(* 目的：現在の気温tから快適度を表す文字列を計算する *)
(* kion: int -> string *)
let kion t =
  if 15 <= t && t<= 25 then "快適"
                       else "普通"

(* テスト *)
let test6 = kion 7 = "普通"
let test7 = kion 15 = "快適"
let test8 = kion 20 = "快適"
let test9 = kion 25 = "快適"
let test10 = kion 28 = "普通" *)

(* 目的：実数である係数 a, b, c を与えられたら判別式の値を返す。ただし a は 0 以外とする *)
(* hanbetsushiki: float -> float -> float -> float *)
let hanbetsushiki  a b c = b ** 2. -. 4. *. a *. c

(* テスト *)
let test11 = hanbetsushiki 1. 1. 1. = -3.
let test12 = hanbetsushiki 1. 2. 1. = 0.
let test13 = hanbetsushiki 2. (-1.) 2. = -15.

(* 目的：実数である係数 a, b, c を与えられたら解の個数を返す *)
(* kosuu: float -> float -> float -> int *)
let kosuu a b c =
    if hanbetsushiki a b c > 0. then 2
    else if hanbetsushiki a b c = 0. then 1
    else 0

(* テスト *)
let test14 = kosuu 1. 3. 2. = 2
let test15 = kosuu 1. 2. 1. = 1
let test16 = kosuu 1. 1. 1. = 0

(* 目的：実数である係数a, b, cを与えられたら2次方程式が虚数解を持つかどうかを返す *)
(* kyosuu: float -> float -> float -> bool *)
let kyosuu a b c = hanbetsushiki a b c < 0.

(* テスト *)
let test17 = kyosuu 1. 3. 2. = false
let test18 = kyosuu 1. 2. 1. = false
let test19 = kyosuu 1. 1. 1. = true