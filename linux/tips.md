## ssh接続

### `-i` で秘密鍵を指定する

```bash
ssh -i ~/.ssh/hoge_rsa user@host
```

秘密鍵のパーミッションは600である必要があるので`chmod`する

### `-vvv` で詳細なログを得る

```bash
ssh -vvv -i ~/.ssh/hoge_rsa user@host
```
