
ARG NODE_VERSION=15.9.0-alpine3.10
FROM node:${NODE_VERSION} as builder

RUN apk add --no-cache bash git

ARG WORKDIR=/app
ARG SITE
WORKDIR ${WORKDIR}/${SITE}}
RUN yarn \
    && yarn global add hexo-cli

