FROM jenkins/jenkins:lts-alpine

ENV AWS_CLI_VERSION=latest
# ARG DOCKER_VERSION=18.03.1
# ENV DOCKER_VERSION=${DOCKER_VERSION}

USER root

RUN apk --no-cache update && \
      apk add --no-cache --virtual .build-deps gcc groff less python py-pip \
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

ARG JENKINS_PREFIX=jenkins
ENV JENKINS_PREFIX=${JENKINS_PREFIX}

#COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
#COPY jenkins.yaml /var/jenkins_home/jenkins.yaml
#COPY config.xml /var/jenkins_home/config.xml
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY log.properties /var/jenkins_home/log.properties
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

EXPOSE 8080 50000 8443