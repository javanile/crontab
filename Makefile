
build:
	@chmod +x crontab-entrypoint.sh
	@docker-compose build crontab

release:
	@docker login -u javanile
	@docker build -t "javanile/crontab:latest" .
	@docker push "javanile/crontab:latest"

## ====
## Test
## ====

test-crontab-file:
	@docker compose run --rm crontab cat /etc/crontab

test-docker-ps:
	@docker compose run --rm crontab docker ps

test-up: build
	@rm -f debug.log date.log
	@echo "* * * * * date >> /app/debug.log" > crontab
	@echo "* * * * * cd /app && docker-compose ps >> /app/debug.log" >> crontab
	@docker compose up crontab

test-bash: build
	@docker compose run --rm crontab bash