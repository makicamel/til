(* #use "metro.ml" *)

(* ローマ字の駅名(文字列)と駅名リスト(ekimei_t list型) を受け取ってその駅の漢字表記を文字列で返す *)
(* romaji_to_kanji : string -> ekimei_t list -> string*)
let rec romaji_to_kanji romaji stations = match stations with
    [] -> ""
  | {romaji = r; kanji = k}::rest ->
    if romaji = r then k
    else               romaji_to_kanji romaji rest

let station1 = { kanji = "茗荷谷"; kana = "みょうがだに"; romaji = "myogadani"; shozoku = "丸ノ内線"; }
let station2 = { kanji = "戸越";   kana = "とごし";      romaji = "togoshi";   shozoku = "浅草線"; }

let test1 = romaji_to_kanji "myogadani" [] = ""
let test2 = romaji_to_kanji "myogadani" [station1; station2] = "茗荷谷"
let test3 = romaji_to_kanji "saitama"   [station1; station2] = ""
