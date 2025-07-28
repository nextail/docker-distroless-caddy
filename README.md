# Distroless Docker image with Caddy

This is a [Distroless](https://github.com/GoogleContainerTools/distroless) Docker image with [Caddy](https://github.com/caddyserver/caddy) from the [official Docker image](https://github.com/caddyserver/caddy-docker).

## Building

You can build the image like this:

```
#!/usr/bin/env bash

DOCKER_REPOSITORY_NAME="nextail"
DOCKER_IMAGE_NAME="distroless-caddy"
DOCKER_IMAGE_TAG="latest"

# see: https://github.com/docker/buildx/issues/495#issuecomment-761562905
#docker buildx build --platform=linux/amd64,linux/arm64 --no-cache --progress=plain --pull \
docker buildx build --platform=linux/amd64,linux/arm64 --no-cache \
  -t "${DOCKER_REPOSITORY_NAME}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}" \
  --label "maintainer=Ruben Suarez <rubensa@gmail.com>" \
  .

docker buildx build --load \
  -t "${DOCKER_REPOSITORY_NAME}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}" \
  .
```

## Running

You can run the container like this (change --rm with -d if you don't want the container to be removed on stop):

```
#!/usr/bin/env bash

DOCKER_REPOSITORY_NAME="nextail"
DOCKER_IMAGE_NAME="distroless-caddy"
DOCKER_IMAGE_TAG="latest"

prepare_docker_timezone() {
  # https://www.waysquare.com/how-to-change-docker-timezone/
  ENV_VARS+=" --env=TZ=$(cat /etc/timezone)"
}

prepare_docker_timezone

docker run --rm -it \
  --name "${DOCKER_IMAGE_NAME}" \
  ${ENV_VARS} \
  "${DOCKER_REPOSITORY_NAME}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}" "$@"
```

## Stop

You can stop the running container like this:

```
#!/usr/bin/env bash

DOCKER_IMAGE_NAME="distroless-caddy"

docker stop  \
  "${DOCKER_IMAGE_NAME}"
```

## Start

If you run the container without --rm you can start it again like this:

```
#!/usr/bin/env bash

DOCKER_IMAGE_NAME="distroless-caddy"

docker start \
  "${DOCKER_IMAGE_NAME}"
```

## Remove

If you run the container without --rm you can remove once stopped like this:

```
#!/usr/bin/env bash

DOCKER_IMAGE_NAME="distroless-caddy"

docker rm \
  "${DOCKER_IMAGE_NAME}"
```

## For more information

See official [Caddy Docker image documentation](https://hub.docker.com/_/caddy).