(* 目的 *)
(* 名前と成績の組を受け取ったら評価を返す *)
let seiseki pair =
  match pair with
  (name, hyouka) -> name ^ "さんの評価は" ^ hyouka ^ "です"

(* テスト *)
let test1 = seiseki ("田中", "A") = "田中さんの評価はAです"
let test2 = seiseki ("佐藤", "B") = "佐藤さんの評価はBです"
