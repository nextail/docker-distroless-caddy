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
