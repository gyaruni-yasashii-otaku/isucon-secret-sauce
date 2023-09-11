#!/bin/bash -euo

. ~/isucon-secret-sauce/config.sh

function getSource() {
    local BRANCH=$1

    CLONE_DEST=${CLONE_DIR}/${REPOSITORY}-${BRANCH}
    echo "CLONE_DEST ${CLONE_DEST}"
    if [ -e "${CLONE_DEST}" ]; then
        rm -rf ${CLONE_DEST}
        echo "delete previous directory"
    fi
    git clone ${GIT_HOST}/${REPOSITORY}.git ${CLONE_DEST}
    cd ${CLONE_DEST}
    git checkout ${BRANCH}
}