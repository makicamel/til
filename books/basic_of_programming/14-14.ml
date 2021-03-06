(* 目的：文字列の入ったリストを受け取りつなげて返す *)
(* concat : string list -> string *)
let concat lst = List.fold_right (^) lst ""

(* テスト *)
let test1 = concat [] = ""
let test2 = concat ["春"] = "春"
let test3 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"