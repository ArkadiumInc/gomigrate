FROM node:14-alpine

RUN apk add --no-cache --virtual .pipeline-deps readline linux-pam \
  && apk add bash sudo shadow curl \
  && apk del .pipeline-deps

WORKDIR /opt/

RUN curl -sSL https://github.com/golang-migrate/migrate/releases/download/v4.15.1/migrate.linux-amd64.tar.gz -o mig.tar.gz \ 
  && tar xvf mig.tar.gz \
  && rm mig.tar.gz \
  && mv migrate /usr/local/bin/migrate

LABEL "com.azure.dev.pipelines.agent.handler.node.path"="/usr/local/bin/node"

