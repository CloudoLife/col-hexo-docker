
# col-hexo-docker

[col-hexo](https://github.com/CloudoLife/col-hexo-docker) is a Docker image to use Docker or Docker Compose to run Hexo.

<!-- more -->

## Prerequisites

- [Docker - https://www.docker.com/](https://www.docker.com/)

  Developing apps today requires so much more than writing code. Multiple languages, frameworks, architectures, and discontinuous interfaces between tools for each lifecycle stage creates enormous complexity. 
  
  Docker simplifies and accelerates your workflow, while giving developers the freedom to innovate with their choice of tools, application stacks, and deployment environments for each project.

  To learn more about all the features of Docker, see [Docker - https://www.docker.com/](https://www.docker.com/).

- [Docker Compose - https://docs.docker.com/compose/](https://docs.docker.com/compose/)

  Docker Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration. 
  
  To learn more about all the features of Docker Compose, see [Docker Compose - https://docs.docker.com/compose/](https://docs.docker.com/compose/).

## Usage

You can run it with Docker or Docker Compose.

You can replace the following with your preferred content.

### Docker

First, edit or modify the [./Dockerfile](./Dockerfile).

```Dockerfile

ARG NODE_VERSION=15.9.0-alpine3.10
FROM node:${NODE_VERSION} as builder

RUN apk add --no-cache bash git

ARG WORKDIR=/app
ARG SITE
WORKDIR ${WORKDIR}/${SITE}}
RUN yarn \
    && yarn global add hexo-cli
```

Run with `docker` command.

```shell
$ docker build -t cloudolife/col-hexo .

$ docker run -it -v $PWD:/app --rm --name col-hexo cloudolife/col-hexo bash
```

### Docker Compose

Edit or modify [./docker-compose.yml](./docker-compose.yml).

```yml
version: '3'

services:

  # docker-compose run app bash
  # docker-compose run --service-ports app bash
  app:
    build:
      context: .
    image: cloudolife/col-hexo
    ports:
      - "4000:4000"
    # restart: on-failure
    volumes:
      - .:/app
```

Run with `docker-compose` command.

```shell
$ docker run --rm -it --name col-hexo col-hexo bash
```

```shell
$ docker-compose run --service-ports app bash
```

### Run Hexo

Then, run `hexo init` to create a new site in the container.

```shell
$ hexo init col-hexo-docker-example

$ cd col-hexo-docker-example
```

Run Hexo server.

```shell
$ hexo s
```

Now you can open http://localhost:4000 in your browser, and check whether the site works correctly.

## References

[1] [col-hexo-docker](https://github.com/CloudoLife/col-hexo-docker)

[2] [cloudolife/col-hexo - ](https://hub.docker.com/r/cloudolife/col-hexo)

[3] [Hexo - https://hexo.io/](https://hexo.io/)

[4] [Docker - https://www.docker.com/](https://www.docker.com/)

[5] [Docker Compose - https://docs.docker.com/compose/](https://docs.docker.com/compose/)