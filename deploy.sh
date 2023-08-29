#!/bin/bash -euo

. ~/ISUCON-tips/config.sh
. ~/ISUCON-tips/common.sh

BRANCH=$1

DEPLOY_APP=${CLONE_DIR}/${REPOSITORY}-${BRANCH}

# BRANCHの最新コードを取る
getSource

# アプリケーションのビルド
cd ${DEPLOY_APP}/webapp/go
go build -o isuconquest