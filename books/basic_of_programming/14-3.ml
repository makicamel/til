(* 目的：ふたつの文字列をつなげる *)
(* append_string : string -> string -> string *)
let append_string first rest_result = first ^ rest_result

(* 目的：リスト中の文字列をつなげた文字列を返す *)
(* concat : string list -> string *)
let concat lst = List.fold_right append_string lst ""

(* テスト *)
let test1 = concat [] = ""
let test2 = concat ["春"] = "春"
let test3 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"