#!/bin/bash
set -euo

CLONE_DIR=~/repo
MY_REPOSITORY=private-isu-20230912-1
MY_GIT_HOST=git@github.com:gyaruni-yasashii-otaku
PULL_GIT_HOST=git@github.com:catatsuy
PULL_REPOSITORY=private-isu

# この設定だとprivate_isuまでは既存と同じでprivate_isuのwebappがシムリンクで置き換えられる
TARGET_LINK=/home/isucon/private_isu/webapp