FROM docker
MAINTAINER ESh4d0w

RUN apk update

RUN apk upgrade

RUN apk add --no-cache \
		ca-certificates \
		py3-pip python3-dev \
		libffi-dev \
		openssl-dev \
		gcc \
		libc-dev \
		make \
		bash \
		git \
		curl

RUN pip install "docker-compose"

RUN addgroup -S -g 1000 docker && adduser -S -G docker -u 1000 docker

RUN docker --version && \
    docker-compose --version && \
    git --version

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sh"]
