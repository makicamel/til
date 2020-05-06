#use "8-3.ml"

(* person_t 型のリストを受け取って各血液型の人が何人いるかを組にして返す *)
(* ketsueki_shukei: person_t lst -> int * int * int * int *)
let rec ketsueki_shukei lst = match lst with
    [] -> (0, 0, 0, 0)
  | { blood = blood } :: rest ->
          let (a, b, ab, o) = ketsueki_shukei rest in
          if blood = "A" then (a + 1, b, ab, o)
          else if blood = "B" then (a, b + 1, ab, o)
          else if blood = "AB" then (a, b, ab + 1, o)
          else (a, b, ab, o + 1)

let sayu    = {name = "sayu"; height = 150.; weight = 45.; birth_month = 1; birth_day = 10; blood = "A"}
let akari   = {name = "akari"; height = 160.; weight = 50.; birth_month = 2; birth_day = 11; blood = "A"}
let bob     = {name = "bob"; height = 170.; weight = 60.; birth_month = 3; birth_day = 12; blood = "B"}
let charlie = {name = "charlie"; height = 180.; weight = 65.; birth_month = 4; birth_day = 13; blood = "AB"}
let tom     = {name = "tom"; height = 190.; weight = 75.; birth_month = 5; birth_day = 14; blood = "O"}

let test1 = ketsueki_shukei [] = (0, 0, 0, 0)
let test2 = ketsueki_shukei [sayu; akari] = (2, 0, 0, 0)
let test3 = ketsueki_shukei [sayu; akari; bob; charlie; tom] = (2, 1, 1, 1)