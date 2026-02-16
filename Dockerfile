FROM docker:29.2.1-cli-alpine3.23

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
