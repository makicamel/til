(* 目的：整数のリストを受け取ってそのリストの長さを返す *)
(* length : int list -> int *)
let rec length lst = match lst with
    [] -> 0
  | first :: rest -> 1 + length rest

(* テスト *)
let test1 = length [] = 0
let test2 = length [1] = 1
let test3 = length [1; 2] = 2
let test4 = length [1; 2; 0; 2] = 4
let test5 = length [2; 1; 6; 4; 7] = 5
