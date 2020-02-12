# Stash

## Stash の概略を確認する

`stash show` で変更の概略を確認できる。

```bash
git stash show stash@{0}
# =>
#  app/controllers/hoge_controller.rb |  4 ++--
#  docker-compose.yml                 |  2 +-
#  lib/tasks/hoge.rake                | 18 +++++++++---------
#  3 files changed, 12 insertions(+), 12 deletions(-)
```

## Stash の詳細を確認する

`stash show -p` で変更の内容を確認できる。

```bash
git stash show stash@{0} -p
```

## Unstaged change を Stash する

`git stash -k` で `git add` していない変更のみを Stash できる。
`-k` は `--keep-index` の略。

## Untrackd file を Stash する

`git stash -u` で `git add` していないファイルを Stash できる。  
`-u` は `--include-untracked` の略。

## 指定した Stash を削除する

`git stash drop` で Stash を指定して削除できる。

```bash
git stash drop stash@{1}
```

## Stash をすべて削除する

`git stash clear` ですべて消すことができる。
