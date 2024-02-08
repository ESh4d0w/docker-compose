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

RUN apk add --no-cache docker-cli-compose && mv /usr/local/bin/docker-compose /usr/local/bin/docker-compose2 && mv /usr/bin/docker-compose /usr/bin/docker-compose2

COPY docker-compose /usr/bin/docker-compose
COPY docker-compose /usr/local/bin/docker-compose
RUN chmod 755 /usr/local/bin/docker-compose
RUN chmod 755 /usr/bin/docker-compose

RUN docker --version && \
    docker-compose --version && \
    docker-compose2 --version && \
    git --version

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sh"]
