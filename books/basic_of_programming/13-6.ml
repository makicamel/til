#use "metro.ml"
#use "12-3.ml"
#use "10-11.ml"

(* 直前に確定した駅 p (eki_t 型) と未確定の駅 q (ekia_t 型) を受け取り、
　　p と q が直接つながっているかを調べ、つながっていたら q の最短距離と手前リストを必要に応じ更新したもの、
　　つながっていなかったら元の q を返す関数 *)
(* koushin1: eki_t -> eki_t -> eki_t *)
let koushin1 p q = match (p, q) with
  (
    {namae = namae_p; saitan_kyori = saitan_kyori_p; temae_list = temae_list_p},
    {namae = namae_q; saitan_kyori = saitan_kyori_q; temae_list = temae_list_q}
   ) ->
  let kyori = get_ekikan_kyori namae_p namae_q global_ekikan_list in
  if kyori = infinity then q
  else if kyori < saitan_kyori_q then {namae = namae_q; saitan_kyori = saitan_kyori_p +. kyori; temae_list = namae_q::temae_list_p}
  else q

let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []}
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]}
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]}
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []}

let test1 = koushin1 eki3 eki1 = eki1
let test2 = koushin1 eki3 eki2 = eki2
let test3 = koushin1 eki3 eki3 = eki3
let test4 = koushin1 eki3 eki4 =
	{namae="後楽園"; saitan_kyori = 1.8; temae_list = ["後楽園"; "茗荷谷"]}
let test5 = koushin1 eki2 eki1 =
	{namae="池袋"; saitan_kyori = 3.0; temae_list = ["池袋"; "新大塚"; "茗荷谷"]}
let test6 = koushin1 eki2 eki2 = eki2
let test7 = koushin1 eki2 eki3 = eki3
let test8 = koushin1 eki2 eki4 = eki4