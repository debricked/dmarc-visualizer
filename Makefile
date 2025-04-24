.PHONY: up down

# Dockerコンテナを起動
start:
	docker-compose up -d

# Dockerコンテナを停止
stop:
	docker-compose down

# Dockerコンテナを再起動
restart:
	docker-compose down
	docker-compose up -d

# 初期化
delete:
	docker-compose down
	rm -rf elastic_data
	rm -rf files
	rm -rf output_files
	rm -rf grafana/provisioning

# ダウンロードフォルダのフォルダからファイルをコピーして解凍
# 使用方法: make copy-files FOLDER=outputs_12345
copy-files:
ifndef FOLDER
	$(error FOLDER is not set. Usage: make copy-files FOLDER=outputs_12345)
endif
	mkdir -p files
	@echo "Processing files from ~/Downloads/$(FOLDER)..."
	@if [ -d ~/Downloads/$(FOLDER) ]; then \
		find ~/Downloads/$(FOLDER) -name "*.zip" -exec unzip -o {} -d files \; ; \
		find ~/Downloads/$(FOLDER) -name "*.tar.gz" -o -name "*.tgz" -exec tar xzf {} -C files \; ; \
		find ~/Downloads/$(FOLDER) -name "*.gz" -not -name "*.tar.gz" -exec sh -c 'gunzip -c "{}" > files/`basename "{}" .gz`' \; ; \
	else \
		echo "Folder ~/Downloads/$(FOLDER) not found"; \
		exit 1; \
	fi