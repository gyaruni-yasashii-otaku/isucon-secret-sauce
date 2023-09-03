#!/bin/bash -euo

# /webapp を指定のブランチに置き換える(シムリンク切り替え)

. ~/ISUCON-tips/config.sh
. ~/ISUCON-tips/common.sh

# Argument check
if [ $# -ne 1 ]; then
    echo "Argument Error: please set argument. ex) ~/ISUCON-tips/switch.sh main"
    exit 1
fi

BRANCH=$1

SWITCH_APP=${CLONE_DIR}/${REPOSITORY}-${BRANCH}/webapp

# remove the current symlink
if [ "${TARGET_LINK}" ]; then
    echo "delete previous symlink ${TARGET_LINK}"
    rm -rf ${TARGET_LINK}
fi

ln -s ${SWITCH_APP} ${TARGET_LINK}
echo "switched app ${SWITCH_APP}"

# アプリケーションのビルド
# echo "build app"
# cd ${DEPLOY_APP}/webapp/golang
# go build -o private-isu main.go