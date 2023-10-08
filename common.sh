#!/bin/bash
set -euo

. ~/isucon-secret-sauce/config.sh
. ~/isucon-secret-env-variables/.env

function getSource() {
    local BRANCH=$1

    CLONE_DEST=${CLONE_DIR}/${MY_REPOSITORY}-${BRANCH}
    echo "CLONE_DEST ${CLONE_DEST}"
    if [ -e "${CLONE_DEST}" ]; then
        rm -rf ${CLONE_DEST}
        echo "delete previous directory"
    fi
    git clone ${MY_GIT_HOST}/${MY_REPOSITORY}.git ${CLONE_DEST}
    cd ${CLONE_DEST}
    git checkout ${BRANCH}
}

function notifyDiscord() {
    message=$1
    hostname=$(uname -n)
    curl=`cat <<EOS
    curl
    --verbose
    -X POST
    https://discord.com/api/webhooks/${NOTIFY_DISCORD_ADDRESS}
    -H 'Content-Type: application/json'
    --data '{"content": "${hostname} ${message}"}'
    EOS`
    eval ${curl}
}

# MySQLの再起動、NginXの再起動、APPのビルド・再起動
function buildMysqlNginxAPP() {
    # MySQL再起動
    echo "restart mysql"
    sudo systemctl restart mysql

    # NginXの構文チェック
    nginx -t

    # 瞬断が発生しない再起動
    echo "reload nginx"
    nginx -s reload

    # APPのビルド
    echo "build app ${TARGET_LINK}/golang"
    /home/isucon/local/go/bin/go build -o ${TARGET_LINK}/golang/ # ${TARGET_LINK}/golang 配下に作成

    # APPの再起動
    sudo systemctl stop isu-ruby
    sudo systemctl disable isu-ruby
    sudo systemctl stop isu-go
    sudo systemctl enable isu-go
    echo 'Restarted!'
}