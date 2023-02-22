#!/usr/bin/env bash

echo "INPUT 1: $1"
echo "INPUT FULL: $@"

if [[ "$1" =~ ^[1-9*]\  ]]; then
  set -- crond -f -L /dev/stdout -l 0 -d 0
fi

echo "NEW $@"

#docker-entrypoint.sh "$@"
