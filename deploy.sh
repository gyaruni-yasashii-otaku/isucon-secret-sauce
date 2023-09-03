#!/bin/bash -euo

echo "load other sh scripts"
. ~/ISUCON-tips/config.sh
. ~/ISUCON-tips/common.sh

# Argument check
if [ $# -ne 1 ]; then
    echo "Argument Error: please set argument. ex) ~/ISUCON-tips/deploy.sh main"
    exit 1
fi

BRANCH=$1
DEPLOY_APP=${CLONE_DIR}/${REPOSITORY}-${BRANCH}

# BRANCHの最新コードを取る
echo "getSource BRANCH:${BRANCH}"
getSource ${BRANCH}
