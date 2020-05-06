(* 接頭語のリストを受け取ったら、各接頭語の先頭にもうひとつ要素を付け加える *)
(* add_to_each: int -> int list list -> int list list *)
let rec add_to_each n lst = match lst with
    [] -> []
  | first :: rest -> (n :: first) :: add_to_each n rest

(* テスト *)
let test1 = add_to_each 1 [] = []
let test2 = add_to_each 1 [[2]] = [[1; 2]]
let test3 = add_to_each 1 [[2]; [2; 3]] = [[1; 2]; [1; 2; 3]]
let test4 = add_to_each 1 [[2]; [2; 3]; [2; 3; 4]]
                          = [[1; 2]; [1; 2; 3]; [1; 2; 3; 4]]

(* 接頭語を返す *)
let rec prefix lst = match lst with
    [] -> []
  | first :: rest -> []
(* テスト *)
let test5 = prefix [] = []
let test6 = prefix [1] = [[1]]
let test7 = prefix [1; 2] = [[1]; [1; 2]]
let test8 = prefix [1; 2; 3; 4]
                   = [[1]; [1; 2]; [1; 2; 3]; [1; 2; 3; 4]]