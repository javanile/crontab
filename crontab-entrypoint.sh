#!/usr/bin/env bash
set -e

crontab=/var/spool/cron/crontabs/root
container_id=$(basename $(cat /proc/1/cpuset) | head -c 12)

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
