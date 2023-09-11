DATE:=$(shell date +%Y%m%d-%H%M%S)
NGINX_LOG_FILE:=nginx/access.log
MYSQL_LOG_FILE:=mysql/slow.log
NGINX_LOG:=./webapp/logs/${NGINX_LOG_FILE}
MYSQL_LOG:=./webapp/logs/${MYSQL_LOG_FILE}

.PHONY: slow-log
slow-log:
	@echo "\e[32mslow-logsを出力します\e[m"
	pt-query-digest --limit=100 --filter '$$event->{bytes} <= 100000' $(MYSQL_LOG)

.PHONY: alp
alp:
	@echo "\e[32mnginx-logsを出力します\e[m"
	cat ${NGINX_LOG} | alp json -r

.PHONY: bench
bench: log-reset restart
	@echo "\e[32mベンチの準備が完了しました\e[m"

.PHONY: log-reset
log-reset:
	@echo "\e[32mlogファイルを初期化します\e[m"
	mkdir -p ./webapp/logs/$(DATE)/mysql ./webapp/logs/$(DATE)/nginx
	mv -f $(MYSQL_LOG) ./webapp/logs/$(DATE)/${MYSQL_LOG_FILE}
	mv -f $(NGINX_LOG) ./webapp/logs/$(DATE)/${NGINX_LOG_FILE}

.PHONY: restart
restart:
	@echo "\e[32mコンテナを再起動します\e[m"
	cd ./webapp && docker-compose restart

.PHONY: setup
setup:
	@echo "\e[32m初期設定の注入\e[m"
	apt update
	apt install -y percona-toolkit dstat git unzip wget
	@echo "\e[32m - alpをインストールします\e[m"
	wget https://github.com/tkuchiki/alp/releases/download/v1.0.7/alp_linux_amd64.zip
	unzip alp_linux_amd64.zip -d alp_linux_amd64
	install ./alp_linux_amd64/alp /usr/local/bin
	rm -r alp_linux_amd64 alp_linux_amd64.zip
	