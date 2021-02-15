(* 自然数n mをうけとり、nからmまでの自然数のリストを返す *)
(* int_list: int -> int -> int list *)
let rec int_list n m =
  if n = m then [m]
  else n::(int_list (n + 1) m)

(* 自然数のリストと自然数を受け取り、自然数で割り切れるものを取り除く *)
(* filter_list: int list -> int -> int list *)
let rec filter_list lst n = match lst with
    [] -> []
  | first::rest ->
    if first mod n = 0 then filter_list rest n
    else first::(filter_list rest n)

(* 自然数n以下の素数をすべて求める *)
(* 2からnまでの自然数のリストを作る *)
(* リストの残りの中からリストの先頭の要素で割り切れるものは取り除く *)
(* sieve: int -> int list *)
let rec sieve_list lst = match lst with
    [] -> []
  | first::rest -> first::sieve_list (filter_list rest first)

let sieve n =
  if n < 2 then []
  else sieve_list (int_list 2 n)

let test1 = sieve 1 = []
let test2 = sieve 2 = [2]
let test3 = sieve 10 = [2; 3; 5; 7]
let test4 = sieve 20 = [2; 3; 5; 7; 11; 13; 17; 19]

let test5 = filter_list [2; 3; 4; 5] 2 = [3; 5]
let test6 = filter_list [4; 5] 2 = [5]
