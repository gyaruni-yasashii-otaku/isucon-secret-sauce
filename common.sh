#!/bin/bash
set -euo

. ~/isucon-secret-sauce/config.sh

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