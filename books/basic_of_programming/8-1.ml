(* 8-1: 本に関する情報を格納するレコード `book_t` *)
type book_t = {
  title : string;
  author : string;
  publisher : string;
  price : int;
  isbn : string;
}

let book1 = { title = "プログラミングの基礎"; author = "浅井健一"; publisher = "サイエンス社"; price = 2300; isbn = "978-4-7819-1160-1" }
