(* #use "metro.ml" *)
(* 目的：漢字の駅名 2 つと駅間リスト(ekikan_t list型) を受け取って駅間リストの中から2駅間の距離(Float)を返す *)
(* 注意：2駅が直接つながっていない場合は無限大 infinity を返す *)
(* get_ekikan_kyori: string -> string -> ekikan_t list -> float *)
let rec get_ekikan_kyori kanji1 kanji2 distance_list = match distance_list with
    [] -> infinity
  | { kiten = kiten; shuten = shuten; kyori = kyori }::rest ->
          if (kiten = kanji1 && shuten = kanji2) || (kiten = kanji2 && shuten = kanji1)
          then kyori
    else get_ekikan_kyori kanji1 kanji2 rest

let test1 = get_ekikan_kyori "渋谷" "表参道" [] = infinity
let test2 = get_ekikan_kyori "渋谷" "表参道" global_ekikan_list = 1.3
let test3 = get_ekikan_kyori "表参道" "渋谷" global_ekikan_list = 1.3
let test4 = get_ekikan_kyori "大手町" "千駄ヶ谷" global_ekikan_list = infinity
