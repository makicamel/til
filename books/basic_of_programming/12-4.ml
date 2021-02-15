#use "metro.ml"

let rec insert lst one = match lst with
    [] -> [one]
  | ({kana = list_kana} as first)::rest ->
          match one with {kana = one_kana} ->
              if list_kana < one_kana then first::insert rest one
                                      else one::lst

(* ekimei_t 型のリストを受け取ってひらがなの順に整列し、 ekimei_t 型のリストを返す *)
(* line_up: ekimei_t list -> ekimei_t list *)
let rec line_up lst = match lst with
    [] -> []
  | first::rest -> insert (line_up rest) first

(* ekimei_t 型のリストを受け取ってひらがなの順に整列し、駅の重複を取り除いた ekimei_t 型のリストを返す *)
(* seiretsu: ekimei_t list -> ekimei_t list *)
let rec seiretsu lst = match lst with
    [] -> []
  | first::rest -> seiretsu rest

let seiretsu_test_list = [
    {kanji="東京"; kana="とうきょう"; romaji="tokyo"; shozoku="丸ノ内線"};
    {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="有楽町線"};
    {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"};
    {kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="銀座線"};
    {kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="半蔵門線"};
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesando"; shozoku="銀座線"};
    {kanji="新宿"; kana="しんじゅく"; romaji="shinjuku"; shozoku="丸ノ内線"};
    ]
let line_test_list = [
    {kanji="東京"; kana="とうきょう"; romaji="tokyo"; shozoku="丸ノ内線"};
    {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"};
    {kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="半蔵門線"};
]

let line_test1 = line_up [] = []
let hoge = line_up line_test_list
let line_test2 = line_up line_test_list = [
    {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"};
    {kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="半蔵門線"};
    {kanji="東京"; kana="とうきょう"; romaji="tokyo"; shozoku="丸ノ内線"};
]

