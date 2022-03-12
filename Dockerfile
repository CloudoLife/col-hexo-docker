
ARG NODE_VERSION=17.6.0-alpine3.14
FROM node:${NODE_VERSION} as builder

RUN apk add --no-cache bash git

RUN npm install -g pnpm \
    && pnpm add -g hexo-cli
    
ARG WORKDIR=/app
ARG SITE
WORKDIR ${WORKDIR}/${SITE}


