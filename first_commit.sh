#!/bin/bash
set -euo
### 対象をgit cloneしてから、first commitするまで

. ~/isucon-secret-sauce/config.sh

# 対象をgit clone
cd ~
git clone ${PULL_GIT_HOST}/${PULL_REPOSITORY}.git

# オリジンURLを確認
cd ${PULL_REPOSITORY}
echo "before remote host"
git remote -v

# .gitを削除する
rm -rf .git

# .git新規作成
git init

# プライベートリポジトリのURLをオリジンURLにする
git remote add origin ${MY_GIT_HOST}/${MY_REPOSITORY}.git
git add .
git commit -m "first commit"
git branch -M main
git push -u origin main

echo "after remote host"
git remote -v
echo "first commit finished!"
