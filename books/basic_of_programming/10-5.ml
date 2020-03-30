(* 学生ひとり分のデータ（名前、点数、成績）を表す型 *)
type gakusei_t = {
  namae : string;       (* 名前 *)
  tensuu : int;         (* 点数 *)
  seiseki : string;     (* 成績 *)
}

let gakusei1 = { namae = "poko"; tensuu = 54; seiseki = "D" }
let gakusei2 = { namae = "yuka"; tensuu = 64; seiseki = "C" }
let gakusei3 = { namae = "mika"; tensuu = 74; seiseki = "B" }
let gakusei4 = { namae = "saki"; tensuu = 84; seiseki = "A" }

(* gakusei_t 型のリストを受け取って最高得点を取った人のレコードを返す *)
(* student_max : gakusei_t list -> gakusei_t *)
let rec student_max students = match students with
    [] -> { namae = ""; tensuu = min_int; seiseki = "" }
  | ({ namae = n_first; tensuu = t_first; seiseki = s_first } as student) :: rest -> match student_max rest with
    { namae = n_max; tensuu = t_max; seiseki = s_max } ->
    if t_first > t_max then student
                       else student_max rest

(* テスト *)
let test1 = student_max [gakusei1] = gakusei1
let test2 = student_max [gakusei1; gakusei2] = gakusei2
let test3 = student_max [gakusei3; gakusei2] = gakusei3
let test4 = student_max [gakusei4; gakusei1; gakusei3; gakusei2] = gakusei4
let test5 = student_max [] = { namae = ""; tensuu = min_int; seiseki = "" }
