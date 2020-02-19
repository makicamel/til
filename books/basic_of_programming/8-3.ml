(* 8-3: 各人の名前、身長、体重、誕生日と血液型の情報を格納するレコード型 person_t *)
type person_t = {
  name : string;
  height : float;
  weight : float;
  birth_month : int;
  birth_day : int;
  blood : string;
}

let maki = { name = "maki"; height = 150.0; weight = 45.0; birth_month = 5; birth_day = 28; blood = "B" }
