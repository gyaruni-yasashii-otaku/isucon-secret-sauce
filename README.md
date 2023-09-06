# ISUCON-tips

ISUCON の秘伝のタレ

## File

- [x] config.sh : コンフィグ
- [x] common.sh : 一連の処理を関数化したもの
- [x] deploy.sh : サーバーに指定ブランチのコードを deploy するもの
- [x] switch.sh : 指定ブランチのコードを切り替えるもの
- [] build.sh : App のビルドや DB, Nginx を再起動するもの

## Prepare

- git clone できるように ec2 でキーを生成し, github に公開鍵を登録しておく
- 必要に応じて config.sh の設定をする

```bash
vi ~/ISUCON-tips/config.sh
```

## How to use

```bash
# サーバーにISUCON-tipsをclone
cd ~
git clone git@github.com:Baplisca/ISUCON-tips.git
chmod +x ~/ISUCON-tips/*

# BRANCH_NAMEのコードをサーバーにデプロイ
bash ~/ISUCON-tips/deploy.sh ${BRANCH_NAME}

# BRANCH_NAMEのコードでサーバーで動かす
bash ~/ISUCON-tips/switch.sh ${BRANCH_NAME}
```
