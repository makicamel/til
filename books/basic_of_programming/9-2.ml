#use "8-3.ml"
(* person_t を要素とする長さが3のリスト *)
let kazuo = { name = "kazuo"; height = 167.8; weight = 65.0; birth_month = 10; birth_day = 27; blood = "B" }
let mikio = { name = "mikio"; height = 146.0; weight = 40.0; birth_month = 10; birth_day = 27; blood = "AB" }
let niio = { name = "niio"; height = 162.0; weight = 52.0; birth_month = 2; birth_day = 15; blood = "B" }
let people = niio :: mikio :: kazuo :: []
