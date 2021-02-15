(* eki_t: 駅名namae, 最短距離saitan_kyori, 駅名のリスト temae_list をフィールドとして持つレコード型 *)
type eki_t = {
    namae: string;
  saitan_kyori: float;
  temae_list: string list;
}

