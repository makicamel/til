#use "8-5.ml"

(* 目的：ekimei_t 型のデータを受け取り、 路線名、駅名(かな)の文字列を返す *)
(* hyoji: ekimei_t -> string *)
let hyoji ekimei = match ekimei with
  { kanji = kanji; kana = kana; romaji = _; shozoku = shozoku } ->
  shozoku ^ ", " ^ kanji ^ "(" ^ kana ^ ")"

(* テスト *)
let test1 = hyoji {
  kanji = "茗荷谷";
  kana = "みょうがだに";
  romaji = "myogadani";
  shozoku = "丸ノ内線";
} = "丸ノ内線, 茗荷谷(みょうがだに)"

let test2 = hyoji {
  kanji = "戸越";
  kana = "とごし";
  romaji = "togoshi";
  shozoku = "浅草線";
} = "浅草線, 戸越(とごし)"
