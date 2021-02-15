let compose f1 f2 =
  let f3 x = f1 (f2 x) in f3

let add3 x = x + 3
let times2 x = x * 2