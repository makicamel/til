#use "8-3.ml"

(* person_t 型のリストを受け取って指定された血液型の人数を返す *)
(* count_ketsueki ->  person_t list -> string -> int *)
let rec count_ketsueki lst ketsueki = match lst with
    [] -> 0
  | { blood = blood } :: rest ->
    if blood = ketsueki then 1 + count_ketsueki rest ketsueki
                        else count_ketsueki rest ketsueki

let a_1 = { name = "maki"; height = 150.0; weight = 45.0; birth_month = 5; birth_day = 28; blood = "A" }
let a_2 = { name = "yuki"; height = 150.0; weight = 45.0; birth_month = 5; birth_day = 28; blood = "A" }
let b_1 = { name = "maki"; height = 150.0; weight = 45.0; birth_month = 5; birth_day = 28; blood = "B" }

let test0 = count_ketsueki [] "" = 0
let test1 = count_ketsueki [a_1; a_2] "A" = 2
let test2 = count_ketsueki [a_1; b_1] "B" = 1
let test3 = count_ketsueki [a_1; a_2; b_1] "A" = 2
let test3 = count_ketsueki [a_1; a_2] "O" = 0