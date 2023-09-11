# isucon-secret-sauce

ISUCON の秘伝のタレ

## File

- [x] first_commit.sh : 特定のリポジトリをクローンして、自分達のリポジトリに最初のコミットするまで
- [x] deploy.sh : サーバーに指定ブランチのコードを deploy するもの
- [x] switch.sh : 指定ブランチのコードを切り替えるもの
- [x] config.sh : コンフィグ
- [x] common.sh : 一連の処理を関数化したもの
- build.sh : App のビルドや DB, Nginx を再起動するもの

## Prepare

- git clone できるように ec2 でキーを生成し, github に公開鍵を登録しておく
- 本番の設定に合わせて config.sh の設定をする

```bash
# ローカルにisucon-secret-sauceをclone
cd ~
git clone git@github.com:gyaruni-yasashii-otaku/isucon-secret-sauce.git

# ローカルでconfigを変更し、git反映
vi ~/isucon-secret-sauce/config.sh
git add .
git commit -m "config to match production settings"
git push

# Organizationsにプライベートリポジトリを作成した後、以下を実行
bash ~/isucon-secret-sauce/first_commit.sh ${private_repository_name}

```

## How to use on the server

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
