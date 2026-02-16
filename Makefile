
build:
	@chmod +x crontab-entrypoint.sh
	@docker-compose build crontab

push:
	@git add .
	@git commit -am "New release!" || true
	@git push

release: push
	@docker login -u yafb
	@docker build -t "javanile/crontab:latest" .
	@docker push "javanile/crontab:latest"

clean:
	@docker compose down --rmi all --volumes --remove-orphans
	@rm -f debug.log crontab

## ====
## Test
## ====

test-crontab-file:
	@docker compose run --rm crontab cat /etc/crontab

test-docker-ps:
	@docker compose run --rm crontab docker ps

test-up: clean build
	@rm -f debug.log date.log
	@echo "* * * * * date >> /app/debug.log" > crontab
	@echo "* * * * * cd /app && docker-compose ps >> /app/debug.log" >> crontab
	@echo "#!/bin/sh" > test.sh
	@echo "echo \"Hello World!\"" >> test.sh
	@docker compose up crontab

test-bash: build
	@docker compose run --rm crontab bash

test-log: build
	@docker compose up --force-recreate crontab
	@docker compose logs -f crontab