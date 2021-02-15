(* 目的：受け取った整数が偶数の場合 true を返し奇数の場合 false を返す *)
(* is_even : int -> bool *)
let is_even n = n mod 2 = 0

(* 目的：整数のリストを受け取って偶数の要素のみを含むリストを返す *)
(* even : int list -> int list *)
let even lst = List.filter is_even lst

let test1 = even [] = []
let test2 = even [1] = []
let test3 = even [1; 2] = [2]
let test4 = even [0; 1] = [0]
let test5 = even [2; 3; 4; 5; 6] = [2; 4; 6]
