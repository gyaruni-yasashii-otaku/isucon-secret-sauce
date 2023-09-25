#!/bin/bash
set -euo

# /webapp を指定のブランチに置き換える(シムリンク切り替え)

. ~/isucon-secret-sauce/config.sh
. ~/isucon-secret-sauce/common.sh

# Argument check
if [ $# -ne 1 ]; then
    echo "Argument Error: please set argument. ex) ~/isucon-secret-sauce/switch.sh main"
    exit 1
fi

BRANCH=$1

SWITCH_APP=${CLONE_DIR}/${MY_REPOSITORY}-${BRANCH}/webapp
DIRECTORY_PATH="$(dirname "${TARGET_LINK}")"

# remove the current symlink
if [ -e "${DIRECTORY_PATH}/webapp" ]; then
    echo "delete previous symlink ${DIRECTORY_PATH}/webapp"
    rm -rf ${DIRECTORY_PATH}/webapp
fi

ln -s ${SWITCH_APP} ${DIRECTORY_PATH}
echo "switched app ${SWITCH_APP}"
ls -lat ${DIRECTORY_PATH}

# アプリケーションのビルド
# echo "build app"
# cd ${DEPLOY_APP}/webapp/golang
# go build -o private-isu main.go

notifyDiscord "[switched.sh] switched to ${SWITCH_APP}"