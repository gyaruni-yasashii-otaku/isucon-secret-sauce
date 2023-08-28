#!/bin/bash -euo

HOSTNAME:=$(shell hostname)
BRANCH:=master

# BRANCHの最新コードを取る
git fetch 
git reset --hard origin/$(BRANCH)
git switch -C $(BRANCH) origin/$(BRANCH)

# アプリケーションのビルド
cd /home/isucon/webapp/go
go build -o isuconquest