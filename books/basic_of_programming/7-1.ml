(* 目的：5教科の点数を与えられたら合計点と平均点を組にして返す *)
(* goukei_to_heikin: int int int int int -> (int * int) *)
let goukei kokugo suugaku eigo rika syakai =
  kokugo + suugaku + eigo + rika + syakai
let goukei_to_heikin
  kokugo suugaku eigo rika syakai =
  (
    goukei kokugo suugaku eigo rika syakai,
    (goukei kokugo suugaku eigo rika syakai) / 5
  )

(* テスト *)
let test1 = goukei_to_heikin 10 10 10 10 10 = (50, 10)
let test2 = goukei_to_heikin 10 20 30 40 50 = (150, 30)
