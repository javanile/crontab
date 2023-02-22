#!/usr/bin/env bash
set -e

container_id=$(hostname)
crontab=/var/spool/cron/crontabs/root

export COMPOSE_PROJECT_NAME=$(docker inspect "$container_id" | grep '"com.docker.compose.project"' | cut -d'"' -f4)

>$crontab

if [[ "$1" =~ ^[1-9*] ]]; then
  while test $# -gt 0; do
    echo "$1" >> $crontab
    shift
  done
  set -- crond -f -L /dev/stdout -l 8
fi

if [ -f /etc/crontab ]; then
  cat /etc/crontab >> $crontab
fi

docker-entrypoint.sh "$@"
