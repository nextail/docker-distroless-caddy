#!/usr/bin/env bash

DOCKER_IMAGE_NAME="distroless-caddy"

docker stop  \
  "${DOCKER_IMAGE_NAME}"
