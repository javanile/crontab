#!/usr/bin/env bash
set -e

>/var/spool/cron/crontabs/root

if [[ "$1" =~ ^[1-9*] ]]; then
  while test $# -gt 0; do
      echo "$1" >> /var/spool/cron/crontabs/root
      shift
  done
  set -- crond -f -L /dev/stdout -l 8
fi

if [ -f /etc/crontab ]; then
  cat /etc/crontab >> /var/spool/cron/crontabs/root
fi

docker-entrypoint.sh "$@"
