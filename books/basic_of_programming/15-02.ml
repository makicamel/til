(* ふたつの自然数を受け取り最大公約数を返す *)
(* gcd: int -> int -> int *)
let rec gcd m n =
  if n = 0 then m
  else let amari = m mod n in
    gcd n amari

let test1 = gcd 1 0 = 1
let test2 = gcd 3 1 = 1
let test3 = gcd 4 2 = 2
let test4 = gcd 5 5 = 5
let test5 = gcd 32 24 = 8
