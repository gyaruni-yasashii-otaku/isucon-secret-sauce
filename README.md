# ISUCON-tips

ISUCON の秘伝のタレ

## File

- config.sh : コンフィグ
- common.sh : 一連の処理を関数化したもの
- deploy.sh : サーバーに指定ブランチのコードを deploy するもの
- switch.sh : 指定ブランチのコードを切り替えるもの
- build.sh : App のビルドや DB, Nginx を再起動するもの

## How to use

```bash
# サーバーにISUCON-tipsをclone
cd ~
git clone git@github.com:Baplisca/ISUCON-tips.git

# BRANCH_NAMEのコードをサーバーにデプロイ
~/ISUCON-tips/deploy.sh ${BRANCH_NAME}

# BRANCH_NAMEのコードでサーバーで動かす
~/ISUCON-tips/switch.sh ${BRANCH_NAME}
```
