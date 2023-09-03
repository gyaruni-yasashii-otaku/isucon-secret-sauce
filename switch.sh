#!/bin/bash -euo

# /webapp を指定のブランチに置き換える(シムリンク切り替え)

. ~/ISUCON-tips/config.sh
. ~/ISUCON-tips/common.sh

# Argument check
if [$# -ne 1]; then
    echo "Argument Error: please set argument. ex) ~/ISUCON-tips/switch.sh master"
    exit 1
fi

BRANCH=$1

SWITCH_APP=${CLONE_DIR}/${REPOSITORY}-${BRANCH}/webapp

# remove the current symlink
if [ -L "${TARGET_LINK}" ]; then
    rm ${TARGET_LINK}
fi

ln -s ${SWITCH_APP} ${TARGET_LINK}
echo "switched app ${SWITCH_APP}"