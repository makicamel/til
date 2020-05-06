#use "10-7.ml"

(* person_t 型のリストを受け取って最も人数の多い血液型を返す *)
(* saita_ketsueki: person_t lst -> int * int * int * int *)

let sayu    = {name = "sayu"; height = 150.; weight = 45.; birth_month = 1; birth_day = 10; blood = "A"}
let akari   = {name = "akari"; height = 160.; weight = 50.; birth_month = 2; birth_day = 11; blood = "A"}
let bob     = {name = "bob"; height = 170.; weight = 60.; birth_month = 3; birth_day = 12; blood = "B"}
let charlie = {name = "charlie"; height = 180.; weight = 65.; birth_month = 4; birth_day = 13; blood = "AB"}
let tom     = {name = "tom"; height = 190.; weight = 75.; birth_month = 5; birth_day = 14; blood = "O"}

let rec saita_ketsueki lst = match lst with
    [] -> (0, 0, 0, 0)
  | { blood = blood } :: rest ->
          let (a, b, ab, o)  = ketsueki_shukei rest in
          let saidai = max (max a b) (max ab o) in
