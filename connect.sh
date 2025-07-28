#!/usr/bin/env bash

DOCKER_IMAGE_NAME="distroless-caddy"

docker exec -it \
  "${DOCKER_IMAGE_NAME}" \
  bash -l
