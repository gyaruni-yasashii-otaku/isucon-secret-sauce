#!/bin/bash
set -euo

echo "load other sh scripts"
. ~/isucon-secret-sauce/config.sh
. ~/isucon-secret-sauce/common.sh

# Argument check
if [ $# -ne 1 ]; then
    echo "Argument Error: please set argument. ex) ~/isucon-secret-sauce/deploy.sh main"
    exit 1
fi

BRANCH=$1
DEPLOY_APP=${CLONE_DIR}/${MY_REPOSITORY}-${BRANCH}

# BRANCHの最新コードを取る
echo "getSource BRANCH:${BRANCH}"
getSource ${BRANCH}

notifyDiscord "[deploy.sh] deployed to ${DEPLOY_APP}"