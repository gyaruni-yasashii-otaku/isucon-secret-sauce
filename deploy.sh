#!/bin/bash -euo

. ~/ISUCON-tips/config.sh
. ~/ISUCON-tips/common.sh

# Argument check
if [$# -ne 1]; then
    echo "Argument Error: please set argument. ex) ~/ISUCON-tips/deploy.sh master"
    exit 1
fi

BRANCH=$1

DEPLOY_APP=${CLONE_DIR}/${REPOSITORY}-${BRANCH}

# BRANCHの最新コードを取る
getSource

# アプリケーションのビルド
cd ${DEPLOY_APP}/webapp/go
go build -o isuconquest