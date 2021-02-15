(* 学生のデータ（名前、点数、成績）を表す *)
type gakusei_t = {
  namae : string;       (* 名前 *)
  tensuu : int;         (* 点数 *)
  seiseki : string;     (* 成績 *)
}

let gakusei1 = []
let gakusei2 = [{namae = "maki"; tensuu = 70; seiseki = "B"}]
let gakusei3 = [{namae = "maki"; tensuu = 70; seiseki = "B"};
                {namae = "neko"; tensuu = 85; seiseki = "A"}]
let gakusei4 = [{namae = "pupo"; tensuu = 80; seiseki = "A"};
                {namae = "maki"; tensuu = 70; seiseki = "B"};
                {namae = "neko"; tensuu = 85; seiseki = "A"}]

(* 目的：受け取った学生の成績が A の時 true を返し、そうではない時 false を返す *)
(* is_A : gakusei_t -> bool *)
let is_A gakusei = match gakusei with
  {namae = n; tensuu = t; seiseki = s} -> s = "A"

(* 目的：受け取った gaksuei_t 型のリストのうち成績が A の人数を返す *)
(* count_A : gakusei_t list -> int *)
let count_A lst = List.length (List.filter is_A lst)

(* テスト *)
let test1 = count_A lst1 = 0
let test2 = count_A lst2 = 0
let test3 = count_A lst3 = 1
let test4 = count_A lst4 = 2