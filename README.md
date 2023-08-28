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
# BRANCH_NAMEのコードをサーバーにデプロイ
deploy.sh ${BRANCH_NAME}

# BRANCH_NAMEのコードをサーバーで動かす
switch.sh ${BRANCH_NAME}
```
