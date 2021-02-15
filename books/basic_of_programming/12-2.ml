#use "8-5.ml"
#use "12-1.ml"
(* ekimei_t 型のリストを受け取り、その駅名を使って eki_t 型のリストを作る *)
(* ただしここでは saitan_kyori は infinity, temae_list は空リストを返す *)
(* make_eki_list: ekimei_t list -> eki_t list *)
let rec make_eki_list ekimei_list = match ekimei_list with
    [] -> []
  | {kanji = n}::rest -> {namae = n; saitan_kyori = infinity; temae_list = []}::make_eki_list rest

let ekimei_t_list = [
    {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
    {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
    {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"};
    {kanji="乃木坂"; kana="のぎざか"; romaji="nogizaka"; shozoku="千代田線"};
    {kanji="赤坂"; kana="あかさか"; romaji="akasaka"; shozoku="千代田線"};
    {kanji="国会議事堂前"; kana="こっかいぎじどうまえ"; romaji="kokkaigijidoumae"; shozoku="千代田線"};
    {kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; shozoku="千代田線"};
    {kanji="日比谷"; kana="ひびや"; romaji="hibiya"; shozoku="千代田線"};
    {kanji="二重橋前"; kana="にじゅうばしまえ"; romaji="nijuubasimae"; shozoku="千代田線"};
  ]

let test1 = make_eki_list [] = []
let test2 = make_eki_list ekimei_t_list = [
    {namae= "代々木上原"; saitan_kyori= infinity; temae_list= []};
    {namae= "代々木公園"; saitan_kyori= infinity; temae_list= []};
    {namae= "明治神宮前"; saitan_kyori= infinity; temae_list= []};
    {namae= "表参道"; saitan_kyori= infinity; temae_list= []};
    {namae= "乃木坂"; saitan_kyori= infinity; temae_list= []};
    {namae= "赤坂"; saitan_kyori= infinity; temae_list= []};
    {namae= "国会議事堂前"; saitan_kyori= infinity; temae_list= []};
    {namae= "霞ヶ関"; saitan_kyori= infinity; temae_list= []};
    {namae= "日比谷"; saitan_kyori= infinity; temae_list= []};
    {namae= "二重橋前"; saitan_kyori= infinity; temae_list= []};
    ]

