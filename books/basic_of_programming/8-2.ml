(* 8-2: お小遣い帳の情報を格納するレコード型 `okozukai_t` *)
type okozukai_t = {
  name : string;
  price : int;
  place : string;
  date : string;
}

let kaimono = { name = "抹茶ジェラート"; price = 400; place = "浅草"; date = "2020-02-11" }
