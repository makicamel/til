#use "8-3.ml";;

(* person_t 型のデータを受け取ってその名前フィールドを取り出す名前のない関数 *)
fun person -> match person with
  { name = name } -> name
