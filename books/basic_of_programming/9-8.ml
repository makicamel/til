# use "8-3.ml"
(* person_t 型のデータのリストを受け取り乙女座の人の名前のみからなるリストを返す *)
(* otomeza : person_t list -> string list *)
let rec otomeza lst = match lst with
    [] -> []
  | { name = n; birth_month = month; birth_day = day } :: rest
      -> if is_birgo month day then [n] :: otomeza rest
                               else otomeza rest

(* int 型の月 と int 型の 日を受け取り、乙女座であるか否かを返す *)
(* is_birgo : int int -> bool *)
let is_birgo month day =
  if month < 8 then false
  else if month = 8 && day < 23   then false
  else if month = 8 && 23  <= day then true
  else if month = 9 && day < 23   then true
  else if month = 9 && 23  <= day then false
  else false (* if 10 < month then *)


let otome = { name = "otome"; height = 150.0; weight = 45.0; birth_month = 8; birth_day = 28; blood = "B" }
let hutago = { name = "hutago"; height = 160.0; weight = 50.0; birth_month = 5; birth_day = 29; blood = "A" }
let sasori = { name = "sasori"; height = 180.0; weight = 65.0; birth_month = 11; birth_day = 1; blood = "A" }

let test1 = otomeza [] = []
let test2 = otomeza [otome] = ["otome"] :: []
let test3 = otomeza [hutago] = []
let test4 = otomeza [otome; hutago; sasori] = ["otome"]:: []

let test5  = is_birgo 1 1   = false
let test6  = is_birgo 8 1   = false
let test7  = is_birgo 8 23  = true
let test8  = is_birgo 8 31  = true
let test9  = is_birgo 9 1   = true
let test10 = is_birgo 9 22  = true
let test11 = is_birgo 9 23  = false
let test12 = is_birgo 12 31 = false
