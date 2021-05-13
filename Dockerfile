FROM node:14-alpine

WORKDIR /usr/src/app

RUN apk update && \
    apk add git python3 && \
    apk add --no-cache curl && \
    curl -o- -L https://yarnpkg.com/install.sh | sh

ENV PATH $HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH

RUN yarn global add @nestjs/cli
RUN yarn add @nestjs/cli

COPY package.json package.json
COPY yarn.lock yarn.lock

RUN yarn install
