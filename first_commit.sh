#!/bin/bash -euo

### 対象をgit cloneしてから、first commitするまで
PRIVATE_REPOSITORY=$1

# 対象をgit clone
git clone git@github.com:isucon/${REPOSITORY}.git

# GitのGUIからプライベートリポジトリ作る private-repo
# Privateにして, README fileや.gitignoreを追加しない (既にあると思うので)

# オリジンURLを確認
cd ${REPOSITORY}
git remote -v

# .gitを削除する
rm -rf .git

# .git新規作成
git init

# さっきのプライベートリポジトリのURLをオリジンURLにする
git remote add origin ${GIT_HOST}/${PRIVATE_REPOSITORY}.git

git add .
git commit -m "first commit"
git branch -M main
git push -u origin main
