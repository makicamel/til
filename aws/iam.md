[【AWS】IAMユーザーとIAMロールの違いを理解して適切に権限管理する | はぐれメタルはにげだした](https://e-book-info.com/difference-between-iam-user-and-iam-role/)がわかりやすい

## ユーザ

下記に付与

- 人間
- AWS以外のサーバ

## ロール

- EC2やLambdaなどのAWSリソースに権限を付与

## グループ

- グループに必要な権限を付与、そのグループに各メンバ個々に発行したIAMユーザを所属させることで、グループに所属する全てのユーザに同一の権限をまとめて付与する

## ポリシー

- 「何に対して」「何を」「許可・拒否」するのかをJSON形式で定義する

```json
{
  "Version": "2020-01-01",
  "Statement": [
    {
      "Action": [
        "s3:PutObject"
      ],
      "Resource": [
        "arn:aws:s3:::hoge-production/*"
      ],
      "Effect": "Allow"
    }
  ]
}
```
