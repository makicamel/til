#use "10-10.ml"
#use "10-11.ml"
(* 目的：ローマ字の駅名2つを受け取り、その間の距離を調べて文字列を返す *)
(*   2駅が直接つながっている場合： `A駅からB駅まではnkmです`*)
(*   2駅が直接つながっていない場合：`A駅とB駅はつながっていません` *)
(*   入力値の駅名が存在しない場合： `A(B)という駅は存在しません` *)
(* `A` `B` が存在する場合、`A` `B`は漢字表記とする *)
(* kyori_wo_hyouji: string -> string -> string *)
let rec kyori_wo_hyouji romaji1 romaji2 =
  let kanji1 = romaji_to_kanji romaji1 global_ekimei_list in
  if kanji1 = "" then romaji1 ^ "という駅は存在しません"
  else let kanji2 = romaji_to_kanji romaji2 global_ekimei_list in
    if kanji2 = "" then romaji2 ^ "という駅は存在しません"
    else let kyori = get_ekikan_kyori kanji1 kanji2 global_ekikan_list in
      if kyori = infinity then kanji1 ^ "駅と" ^ kanji2 ^ "駅はつながっていません"
      else kanji1 ^ "駅から" ^ kanji2 ^ "駅までは" ^ string_of_float kyori ^ "kmです"

let test1 = kyori_wo_hyouji "shibuta" "omotesandou" = "shibutaという駅は存在しません"
let test2 = kyori_wo_hyouji "shibuya" "urasandou" = "urasandouという駅は存在しません"
let test3 = kyori_wo_hyouji "shibuya" "omotesandou" = "渋谷駅から表参道駅までは1.3kmです"
let test4 = kyori_wo_hyouji "shibuya" "aoyama-itchome" = "渋谷駅と青山一丁目駅はつながっていません"
