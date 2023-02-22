FROM docker:20.10.23-cli-alpine3.17

RUN apk add --no-cache \
    git \
    make \
    libffi-dev \
    openssl-dev \
    gcc \
    libc-dev \
    bash \
    gettext \
    curl \
    wget \
    zip \
    file \
    diffutils

COPY crontab-entrypoint.sh /usr/local/bin/

RUN mkdir /app && rm -fr /etc/periodic

WORKDIR /app

ENTRYPOINT ["crontab-entrypoint.sh"]

CMD ["crond", "-f", "-L", "/dev/stdout", "-l", "8"]
