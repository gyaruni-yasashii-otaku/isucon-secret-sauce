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