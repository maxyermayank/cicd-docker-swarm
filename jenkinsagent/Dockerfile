FROM jenkins/slave:alpine

ENV AWS_CLI_VERSION=latest
# ARG DOCKER_VERSION=18.03.1
# ENV DOCKER_VERSION=${DOCKER_VERSION}

USER root

RUN apk --no-cache update && \
      apk add --no-cache --virtual .build-deps gcc groff less python py-pip \
      py-setuptools \
      ca-certificates \
      groff \
      less \
      bash \
      curl \
      wget \
      unzip \
      openrc \
      openssh-client \
      sudo \
      bash-completion \
      shadow \
      docker \
      git

ENV COMPOSE_VERSION="1.23.2"
RUN pip install awscli && \
      pip install --no-cache-dir docker-compose==${COMPOSE_VERSION} && \
      apk --purge -v del py-pip && \
      rm -rf /var/cache/apk/*

RUN usermod -a -G docker jenkins

ENV UID_JENKINS=1000
ENV GID_JENKINS=1000

USER jenkins

EXPOSE 50000 8443