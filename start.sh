#!/usr/bin/env bash

DOCKER_IMAGE_NAME="distroless-caddy"

docker start \
  "${DOCKER_IMAGE_NAME}"
