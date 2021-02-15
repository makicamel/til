#use "12-1.ml"
(* eki_t 型のリストと起点を受け取り、起点のみ saitan_kyori 0、temae_list は始点の駅名のみからなるリストを返す *)
(* shokika: eki_t list -> string -> eki_t list *)
let rec shokika eki_t_list kiten = match eki_t_list with
    [] -> []
  | ({namae=n; saitan_kyori=s; temae_list=t} as first)::rest ->
    if n = kiten then {namae=n; saitan_kyori=0.; temae_list=[n]}::shokika rest kiten
                 else first::shokika rest kiten

let eki_t_list = [
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
let test3 = shokika [] "代々木上原" = []
let test4 = shokika eki_t_list "代々木上原" = [
    {namae= "代々木上原"; saitan_kyori= 0.; temae_list= ["代々木上原"]};
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
