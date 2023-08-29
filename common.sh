#!/bin/bash -euo

. ~/ISUCON-tips/config.sh

function getSource() {
    local BRANCH=$1

    git clone ${GIT_HOST}/${REPOSITORY}.git ${CLONE_DIR}/${REPOSITORY}-${BRANCH}
    cd ${CLONE_DIR}/${REPOSITORY}
    git checkout ${BRANCH}
}