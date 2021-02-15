#use "10-5.ml";;
(* 目的：リストを受け取って偶数のみを抜き出したリストを返す *)
let filter_a lst =
  List.filter (fun i -> i mod 2 = 0) lst


(* 学生ひとり分のデータ（名前、点数、成績）を表す型 *)
type gakusei_t = {
  namae : string;       (* 名前 *)
  tensuu : int;         (* 点数 *)
  seiseki : string;     (* 成績 *)
}

(* gakusei_t list 型のデータの例 *)
let lst1 = []
let lst2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}]
let lst3 = [{namae = "asai"; tensuu = 70; seiseki = "B"};
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}]
let lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"};
            {namae = "asai"; tensuu = 70; seiseki = "B"};
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}]

(* 目的：学生リスト lst のうち成績が A の人の数を返す *)
let count_a students =
  List.length(
    List.filter
      (fun student -> match student with { seiseki = seiseki } -> seiseki = "A") students
  )


(* 目的：リスト中の文字列をつなげた文字列を返す *)
(* concat : string list -> string *)
let concat lst =
  (* 目的：ふたつの文字列をつなげる *)
  (* append_string : string -> string -> string *)
  List.fold_right(fun first rest -> first ^ rest) lst ""

let test1 = concat [] = ""
let test2 = concat ["春"] = "春"
let test3 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
