# use "8-3.ml"
(* 目的： person_t 型のデータのリストを受け取って血液型が A 型の人の数を返す *)
(* count_ketsueki_A : person_t lst -> int *)
let rec count_ketsueki_A lst = match lst with
    [] -> 0
  | { blood = b } :: rest -> if b = "A" then 1 + count_ketsueki_A rest
                                        else count_ketsueki_A rest

let haro = { name = "haro"; height = 150.0; weight = 45.0; birth_month = 5; birth_day = 28; blood = "B" }
let taro = { name = "taro"; height = 160.0; weight = 50.0; birth_month = 10; birth_day = 29; blood = "A" }
let hiro = { name = "hiro"; height = 180.0; weight = 65.0; birth_month = 1; birth_day = 5; blood = "A" }

let test1 = count_ketsueki_A [] = 0
let test2 = count_ketsueki_A [haro] = 0
let test3 = count_ketsueki_A [taro] = 1
let test4 = count_ketsueki_A [haro; taro; hiro] = 2
