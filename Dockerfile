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

RUN mkdir /app

CMD ["crond", "-f"]
