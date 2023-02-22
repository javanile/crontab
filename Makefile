
build:
	@docker-compose build crontab


## ====
## Test
## ====

test-crontab-file:
	@docker compose run --rm crontab cat /etc/crontab

test-docker-ps:
	@docker compose run --rm crontab docker ps

test-up: build
	@docker compose up crontab

test-bash: build
	@docker compose run --rm crontab bash