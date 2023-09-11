# isucon-secret-sauce

ISUCON の秘伝のタレ

## File

- [x] config.sh : コンフィグ
- [x] common.sh : 一連の処理を関数化したもの
- [x] deploy.sh : サーバーに指定ブランチのコードを deploy するもの
- [x] switch.sh : 指定ブランチのコードを切り替えるもの
- build.sh : App のビルドや DB, Nginx を再起動するもの

## Prepare

- git clone できるように ec2 でキーを生成し, github に公開鍵を登録しておく
- 必要に応じて config.sh の設定をする

```bash
vi ~/isucon-secret-sauce/config.sh
```

## How to use

```bash
# サーバーにisucon-secret-sauceをclone
cd ~
git clone git@github.com:gyaruni-yasashii-otaku/isucon-secret-sauce.git
chmod +x ~/isucon-secret-sauce/*

# BRANCH_NAMEのコードをサーバーにデプロイ
bash ~/isucon-secret-sauce/deploy.sh ${BRANCH_NAME}

# BRANCH_NAMEのコードでサーバーで動かす
bash ~/isucon-secret-sauce/switch.sh ${BRANCH_NAME}
```
